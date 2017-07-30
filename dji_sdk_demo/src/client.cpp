/** @file client.cpp
 *  @version 3.1.8
 *  @date July 29th, 2016
 *
 *  @brief
 *  All the exampls for ROS are implemented here. 
 *
 *  @copyright 2016 DJI. All rights reserved.
 *
 */

#include <iostream>
#include <stdlib.h>
#include <cstdlib>

#include <ros/ros.h>
//#include <tf/transform_broadcaster.h>
//#include <tf/transform_listener.h>
#include <dji_sdk/dji_drone.h>

#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/Vector3.h>

#include "ctrl_type.h"
#include "pid_set.h"
#include "helperfn.hpp"

//#define SIMULATION
#define INIT_HEIGHT	10//2m from guidance data


static CtrlType::Vector3 Start, Expect, Actual;
static CtrlType::pid_T pid_x, pid_y, pid_z, pid_yaw;

static enum FlightStatus flightStatus = FLIGHT_LANDING;
static volatile geometry_msgs::Twist  pos;

std::stringstream tmp;

void myassert(std::string msg)
{
    std::cout << msg << std::endl;
}

void position_callback(const geometry_msgs::Twist& g_pos)
{
    std::stringstream tmp;

    pos.linear.x = g_pos.linear.x;
    pos.linear.y = g_pos.linear.y;
    pos.linear.z = g_pos.linear.z;

    pos.angular.x = g_pos.angular.x;
    pos.angular.y = g_pos.angular.y;
	pos.angular.z = g_pos.angular.z;

    genVector3Msg(tmp, "POSE", pos.linear.x, pos.linear.y, pos.linear.z);
    logToFile(tmp, GUIDANCE_MSG);
}

void console_callback(const dji_sdk_controller::flight_msg& msg)
{
    std::stringstream tmp;
    enum CtrlCmd type = static_cast<enum CtrlCmd>(msg.type);

    switch(type)
    {
        case LANDING:
            if(flightStatus==FLIGHT_TAKEOFF)
            {
                flightStatus = FLIGHT_LANDING_REQUEST;
                tmp << "Taking Off Request receive.";
            }
        break;
        case TAKEOFF:
            if(flightStatus==FLIGHT_LANDING)
            {
                flightStatus = FLIGHT_TAKEOFF_REQUEST;
                tmp << "Landing Request receive.";
            }
        break;
        case PID_X:
            pid_x.kp = msg.data.x; pid_x.ki = msg.data.y; pid_x.kd = msg.data.z;
            genVector3Msg(tmp, "set PID_X", pid_x.kp, pid_x.ki, pid_x.kd);
        break;
        case PID_Y:
            pid_y.kp = msg.data.x; pid_y.ki = msg.data.y; pid_y.kd = msg.data.z;
            genVector3Msg(tmp, "set PID_Y", pid_y.kp, pid_y.ki, pid_y.kd);
        break;
        case PID_Z:
            pid_z.kp = msg.data.x; pid_z.ki = msg.data.y; pid_z.kd = msg.data.z;
            genVector3Msg(tmp, "set PID_Z", pid_z.kp, pid_z.ki, pid_z.kd);
        break;
        case DEST:
            Expect.x =  msg.data.x + Start.x;
            Expect.y =  msg.data.y + Start.y;
#ifdef SIMULATION
            Expect.z = msg.data.z + Start.z;       
#else
            Expect.z = -msg.data.z + Start.z;
#endif
            genVector3Msg(tmp, "set Dest.", Expect.x, Expect.y, Expect.z);
        break;
        case VEL_LIM:
            pid_x.vel_lim = msg.data.x; pid_y.vel_lim = msg.data.y; pid_z.vel_lim = msg.data.z;
            genVector3Msg(tmp, "set Velocity", pid_x.vel_lim, pid_y.vel_lim, pid_z.vel_lim);
        break;
        case ERR_LIM:
            pid_x.err_lim = msg.data.x; pid_y.err_lim = msg.data.y; pid_z.err_lim = msg.data.z;
            genVector3Msg(tmp, "set Location Error", pid_x.err_lim, pid_y.err_lim, pid_z.err_lim);
        break;
        default:
            //???
        break;
    }
    logToFile(tmp, RC_MSG);
}

/*
void fillDroneStatus(std_msgs::String& msg)
{
    msg.data = "Hello, I am your drone.";
}

void fillTFFrmae(tf::Transform& transform)
{
    tf::Quaternion q;
    transform.setOrigin( tf::Vector3((double)pos.linear.x, (double)pos.linear.y, (double)pos.linear.z) );
    q.setRPY(0, 0, (double)pos.angular.z);
    transform.setRotation(q);
}

void dronePublishCb(const ros::TimerEvent&)
{
    std_msgs::String status_msg;
    geometry_msgs::Vector3 tf_msg;
    tf::Transform transform;

    fillDroneStatus(status_msg);
    fillTFFrmae(transform);

    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "drone_name"));
    droneStatus_pub.publish(status_msg);
}
*/

void PID_realize(CtrlType::pid_T& pid, float input)
{
    float int_index;

    pid.error = input;
    pid.integral += pid.error;

    if( abs(pid.error) > 9.0 )
    {
        int_index = 0.0;        
    }
    else
    {
        int_index = 0.01 * ( 9.0 - abs(pid.error) ) / 9.0;
    }

    pid.v = pid.kp * pid.error + 
            int_index * pid.ki * pid.integral + 
            pid.kd * (pid.error - pid.error_last);
    pid.v = inSRange(pid.v, pid.vel_lim);

    pid.error_last = pid.error; 
}


using namespace DJI::onboardSDK;

void InitClient(bool resetPID, bool saveLogFiles)
{
    if(saveLogFiles==LOGFILE_RESET)
    {
        resetLogFileAll();
    }
    LoadParamFile(Expect, pid_x, pid_y, pid_z, resetPID);

#ifdef SIMULATION
    Start.x = drone->local_position.x;
    Start.y = drone->local_position.y;
    Start.z = drone->local_position.z;

    Expect.x += Start.x;
    Expect.y += Start.y;
    Expect.z += Start.z;
#else
    do{
        ros::spinOnce();
        Start.x = pos.linear.x;
        Start.y = pos.linear.y;
        Start.z = pos.linear.z;
    }while(Start.x==0 || Start.y==0 || Start.z==0);

    Expect.x += Start.x;
    Expect.y += Start.y;
    Expect.z = Start.z - Expect.z;
#endif  
}

int main(int argc, char *argv[])
{
    int landing_signal = 0;

    ros::init(argc, argv, "sdk_client_demo");
	ros::NodeHandle nh;
    ros::Rate r(20);//20Hz
	DJIDrone* drone = new DJIDrone(nh);
    dji_sdk::RCChannels rc =  drone->rc_channels;
	
    ros::Subscriber position_sub = nh.subscribe("/guidance/position", 100, position_callback);
    ros::Subscriber console_sub = nh.subscribe("/droneController", 100, console_callback);
    //static tf::TransformListener tf(ros::Duration(50));//Listen@50Hz

    //static tf::TransformBroadcaster br;
    //static ros::Publisher droneStatus_pub;
    //droneStatus_pub = nh.advertise<std_msgs::String>("/droneStatus", 100);
    //nh.createTimer(ros::Duration(1/10), dronePublishCb);

    //Expect-to-Actual-Error
    float x_input = 0.0, y_input = 0.0, z_input = 0.0;
    InitClient(PID_RESET, LOGFILE_RESET);

	while(ros::ok())
    {
        ros::spinOnce();

#ifdef SIMULATION
        x_input = Expect.x - drone->local_position.x; Actual.x =  drone->local_position.x - Start.x;
        y_input = Expect.y - drone->local_position.y; Actual.y =  drone->local_position.y - Start.y;
        z_input = Expect.z - drone->local_position.z; Actual.z =  drone->local_position.z - Start.z;
#else
        x_input = Expect.x - pos.linear.x; Actual.x = pos.linear.x - Start.x;
        y_input = Expect.y - pos.linear.y; Actual.y = pos.linear.y - Start.y;
        z_input = Expect.z - pos.linear.z; Actual.z = Start.z - pos.linear.z;
#endif

        switch(flightStatus)
        {
        case FLIGHT_TAKEOFF:
            PID_realize(pid_x, x_input);
            PID_realize(pid_y, y_input);
            PID_realize(pid_z, z_input);

            tmp << "vz_input==========" << pid_z.v << std::endl;
            tmp << "z_input==========" << z_input << std::endl;
            tmp << "start_z==========" << Start.z << std::endl;
            tmp << "actual_z==========" << pos.linear.z << std::endl;
            tmp << "expect_z==========" << Expect.z << std::endl;
            std::cout << tmp.str() << std::endl;
            logToFile(tmp, CLIENT_MSG);

            drone->attitude_control(Flight::HorizontalLogic::HORIZONTAL_VELOCITY |
                                    Flight::VerticalLogic::VERTICAL_VELOCITY |
                                    Flight::YawLogic::YAW_ANGLE |
                                    Flight::HorizontalCoordinate::HORIZONTAL_GROUND |
                                    Flight::SmoothMode::SMOOTH_ENABLE,
                                    pid_x.v, pid_y.v, -pid_z.v, 0);

            if(abs(pid_x.error)<pid_x.err_lim && abs(pid_y.error)<pid_y.err_lim && abs(pid_z.error)<pid_z.err_lim)
            {
                ++landing_signal;
                if(landing_signal > 2000)//800
                {
                    landing_signal = 0;
                    flightStatus = FLIGHT_LANDING_REQUEST;
                }
            }
            else
            {
                landing_signal = 0;
            }
            break;

        case FLIGHT_LANDING:
            std::cout << "Not flying." << std::endl;

            if(rc.gear > -5000)
            {
                flightStatus = FLIGHT_TAKEOFF_REQUEST;
            }
            break;

        case FLIGHT_TAKEOFF_REQUEST:
            InitClient(PID_KEEP, LOGFILE_SAVE);

            std::cout<<"Start Point:"<<std::endl;
            std::cout<<"( "<<Start.x<<' '<<Start.y<<' '<<Start.z<<' '<<" )"<<std::endl;
            std::cout<<"PID set for Z axis:"<<std::endl;
            std::cout<<pid_z.kp<<' '<<pid_z.ki<<' '<<pid_z.kd<<' '<<std::endl<<std::endl;
            std::cout<<"Here taking off..."<<std::endl;
            std::cout<<"[Controller]Here taking off..."<<std::endl;

            sleep(3);
            drone->request_sdk_permission_control();
            usleep(10000);
            drone->takeoff();
            sleep(8);
            flightStatus = FLIGHT_TAKEOFF;
            break;

        case FLIGHT_LANDING_REQUEST:
            drone->landing();
            sleep(8);
            std::cout<<"Drone Landed."<<std::endl;
            drone->release_sdk_permission_control();
            usleep(10000);
            flightStatus = FLIGHT_LANDING;
            //Reset to File, and reset error etc.
            break;
        }

        ros::spinOnce();
        r.sleep();
    }

  return 0;
}


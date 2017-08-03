  /** @file controllerNode.cpp
 *  @version 3.1.8
 *  @date July 29th, 2016
 *
 *  @brief
 *  controllerNode are implemented here. 
 *
 *  @copyright 2016 DJI. All rights reserved.
 *
 */
#ifdef __cplusplus__
  #include <cstdlib>
#else
  #include <stdlib.h>
#endif

#define RESET_TO_DEFAULT    0
#define RESET_TO_FILE       1
#include <signal.h>
#include <iostream>
#include <sstream>
#include <fstream>
#include <boost/algorithm/string.hpp>
#include <ros/ros.h>
#include <dji_sdk_demo/StatusCodeStamped.h>
#include <opencv2/opencv.hpp>
#include "ctrl_type.h"
#include "controllerNode.h"

static bool waitFlag = 0, interrupted = 1;
static ros::Publisher *position_pub;
static enum FlightStatus drone_status;

dji_sdk_controller::flight_msg pid_px, pid_py, pid_z;
dji_sdk_controller::flight_msg pid_vx, pid_vy;
dji_sdk_controller::flight_msg dest, vel_limit, err_limit;
dji_sdk_controller::flight_msg car_pose, circle_pose, tape_pose;

void catch_signal(int sign)
{
    switch (sign)
    {
    case SIGINT:
        waitFlag = 0;
        interrupted = 1;
        std::cout << "Interrupted!\n" << std::endl;
        //exit(0);
        break;
    }
}

void drone_status_callback(const dji_sdk_demo::StatusCodeStamped& msg)
{
   drone_status = static_cast<enum FlightStatus>(msg.code.data);
}

void circle_detect_callback(const dji_sdk_controller::flight_msg& msg)
{
    circle_pose = msg;
}

void car_detect_callback(const dji_sdk_controller::flight_msg& msg)
{
    car_pose = msg;
}

void tape_detect_callback(const dji_sdk_controller::flight_msg& msg)
{
    tape_pose = msg;
}

void disp_helper()
{
    std::cout << "            Remote Controller Helper             " <<std::endl;
    std::cout << " =============================================== " <<std::endl;
    std::cout << "   [TAKEOFF] Takeoff                             " <<std::endl;
    std::cout << "   [L/Landing] Landing                           " <<std::endl;
    std::cout << "   [D] Destination Coordinate Set                " <<std::endl;
    std::cout << "   [INC] Incremental Destination Coordinate      " <<std::endl;
    std::cout << "   [STATIC] World Destination Coordinate Set     " <<std::endl;
    std::cout << "   [T/DETECT] Detection position send            " <<std::endl;
    std::cout << "   [WAIT] Wait for drone movement stop           " <<std::endl;
    std::cout << "   [RF] Reset to File                            " <<std::endl;
    std::cout << "   [P/Print] Print current parameters.           " <<std::endl;
    std::cout << "   [C/Clear/Cls] Clear Screen                    " <<std::endl;
    std::cout << "   [Q/Quit/Exit] Quit                            " <<std::endl;
    std::cout << "Please Select One:" <<std::endl;
}

void disp_param()
{
    std::cout << std::endl;
    std::cout << "               Current Parameter Set             " <<std::endl;
    std::cout << " =============================================== " <<std::endl;

    std::cout << " Destination Point: ( " <<dest.data.x<<", " <<dest.data.y<<", " <<dest.data.z<<" )"<<std::endl;

    std::cout << " PID set for X POS:\t{ " <<pid_px.data.x<<"\t" <<pid_px.data.y<<"\t" <<pid_px.data.z<<" }"<<std::endl;
    std::cout << " PID set for X VEL:\t{ " <<pid_vx.data.x<<"\t" <<pid_vx.data.y<<"\t" <<pid_vx.data.z<<" }"<<std::endl;
    std::cout << " PID set for Y POS:\t{ " <<pid_py.data.x<<"\t" <<pid_py.data.y<<"\t" <<pid_py.data.z<<" }"<<std::endl;
    std::cout << " PID set for Y VEL:\t{ " <<pid_vy.data.x<<"\t" <<pid_vy.data.y<<"\t" <<pid_vy.data.z<<" }"<<std::endl;
    std::cout << " PID set for Z:\t{ " <<pid_z.data.x<<"\t" <<pid_z.data.y<<"\t" <<pid_z.data.z<<" }"<<std::endl;

    std::cout << " Velocity limit:\t{ " <<vel_limit.data.x<<"\t" <<vel_limit.data.y<<"\t" <<vel_limit.data.z<<" }"<<std::endl;
    std::cout << " Location Error limit:\t{ " <<err_limit.data.x<<"\t" <<err_limit.data.y<<"\t" <<err_limit.data.z<<" }"<<std::endl;
    std::cout << std::endl;
}

void waitUntilReady()
{
    bool counter = false;
    //ROS_INFO("Waitting for last instruction completion . . .");
    ros::Rate r(2);//@2Hz

    waitFlag = 1;
    r.sleep();
    while(waitFlag&&(drone_status==FLIGHT_TAKEOFF_BUSY))
    {
        counter = !counter;
        if(counter)
        {
            ROS_WARN(". >>> .");
        }
        else
        {
            ROS_WARN(". <<< .");
        }
        r.sleep();
    }
}

void waitForTime(float seconds)
{
    std::cout << seconds << std::endl;
    ros::Rate r(1/seconds);
    r.sleep();
}

bool command_process(int layer, std::istream& input, std::string param="SILENT")
{
    std::string cmd;
    dji_sdk_controller::flight_msg msg;
    int cmd_right = 0;

    while(!input.eof()&&!interrupted)//input not meet with endl
    {
        ros::spinOnce();
        input >> cmd;
        boost::algorithm::to_upper(cmd);

        if (cmd.compare("L") == 0||cmd.compare("LAND") == 0||cmd.compare("LANDING") == 0)             //0x09
        {
            cmd_right = 0;
            msg.type = LANDING;
            msg.data.x=0; msg.data.y=0; msg.data.z=0;
        }
        else if (cmd.compare("TAKEOFF") == 0)                                                         //0x0A
        {
            cmd_right = 0;
            msg.type = TAKEOFF;
            msg.data.x=0; msg.data.y=0; msg.data.z=0;
        }
        else if(cmd.compare("D") == 0)                                                                //0x01
        {
            cmd_right = 0;
            msg.type = DEST;
            input >> msg.data.x >> msg.data.y >> msg.data.z;
            dest.data = msg.data;
        }
        else if(cmd.compare("INC") == 0)                                                              //0x0B
        {
            cmd_right = 0;
            msg.type = DEST_INC;
            input >> msg.data.x >> msg.data.y >> msg.data.z;
            dest.data = msg.data;
        }
        else if(cmd.compare("STATIC") == 0)                                                           //0x0C
        {
            cmd_right = 0;
            msg.type = DEST_STATIC;
            input >> msg.data.x >> msg.data.y >> msg.data.z;
            dest.data = msg.data;
        }
        else if(cmd.compare("T") == 0||cmd.compare("DETECT") == 0)                                    //0x0B
        {
            cmd_right = 0;
            msg.type = DEST_INC;
            msg.data.x = circle_pose.data.x;    msg.data.y = circle_pose.data.y;    msg.data.z = 0;
        }
        else if(cmd.compare("WAIT_TIME") == 0)                                                        //INTERNAL
        {
            float seconds;
            cmd_right = 1;
            std::cin >> seconds;
            waitForTime(seconds);
        }
        else if(cmd.compare("WAIT") == 0)                                                             //0x0C
        {
            cmd_right = 1;
            waitUntilReady();
        }
        else if(cmd.compare("SCRIPT") == 0)                                                           //0x0C
        {
            cmd_right = 1;
            std::string tmp;
            input >> tmp;

            std::filebuf fbIn;
            fbIn.open(SCRIPT_PREFIX + tmp, std::ios::in);

            waitUntilReady();
            std::istream fin(&fbIn);
            fin >> tmp;
            command_process(layer+1, fin, tmp);
        }
        else if(cmd.compare("P")==0||cmd.compare("PRINT")==0||cmd.compare("DISPLAY")==0)
        {
            cmd_right = 1;
            system("clear");
            disp_param();   disp_helper();
        }
        else if(cmd.compare("C")==0||cmd.compare("CLEAR")==0||cmd.compare("CLS")==0)
        {
            cmd_right = 1;
            system("clear");    disp_helper();
        }
        else if(cmd.compare("Q")==0||cmd.compare("EXIT")==0||cmd.compare("QUIT")==0)
        {
            system("clear");
            std::cout << "bye." << std::endl;
            exit(-1);
        }
        else{
            cmd_right = 1;
            system("clear");
            std::cout << "Undeclared Commands." << std::endl << std::endl;
            disp_helper();
        }

        if(cmd_right==0)
        {
            position_pub->publish(msg);
            if (param.compare("SILENT") == 0)
            {
                std::cout << "[ECHO_"<<layer<<"] " << cmd << std::endl;
            }
            else{
                std::cout<<std::endl << "[(" <<msg.type<<"), (" <<msg.data.x<<"," <<msg.data.y<<"," <<msg.data.z <<") ] published."<<std::endl;
                std::cout << "[Success!]Please Select Another One:             " <<std::endl;
            }
        }
        else
        {
            cmd_right = 0;
        }
    }

    if(interrupted)
    {
        std::cout << "[ECHO_"<<layer<<"] INTERRUPTED." << std::endl;
        interrupted = 0;
        return false;//chain effect for next change
    }
    else
    {
        std::cout << "[ECHO_"<<layer<<"] FINISHED." << std::endl<<std::endl;
        return true;
    }
}

int loadFromFile(std::string file_name = "")
{
    if(file_name.empty())
    {
        file_name = "/home/ubuntu/logFile/flight_new_param.yaml";
    }

    try{
        cv::FileStorage fs(file_name, cv::FileStorage::READ);

        auto itD = fs["DEST"].begin(), itV = fs["VEL_LIM"].begin(), itE = fs["ERR_LIM"].begin();
        auto itX = fs["PID_X"].begin(), itY = fs["PID_Y"].begin(), itZ = fs["PID_Z"].begin();
        //n.type() == FileNode::SEQ

        dest.data.x = *(itD); dest.data.y = *(++itD); dest.data.z = *(++itD);

        vel_limit.data.x = (float)(*itV); vel_limit.data.y = (float)(*++itV); vel_limit.data.z = (float)(*++itV);

        err_limit.data.x = (float)(*itE); err_limit.data.y = (float)(*++itE); err_limit.data.z = (float)(*++itE);


        pid_px.data.x = (float)(*itX); pid_px.data.y = (float)(*++itX); pid_px.data.z = (float)(*++itX);
        pid_vx.data.x = (float)(*++itX); pid_vx.data.y = (float)(*++itX); pid_vx.data.z = (float)(*++itX);

        pid_py.data.x = (float)(*itY); pid_py.data.y = (float)(*++itY); pid_py.data.z = (float)(*++itY);
        pid_vy.data.x = (float)(*++itY); pid_vy.data.y = (float)(*++itY); pid_vy.data.z = (float)(*++itY);

        pid_z.data.x = (float)(*itZ); pid_z.data.y = (float)(*++itZ); pid_z.data.z = (float)(*++itZ);
        }
        catch (...) {
            return -1;
        }

}

void controller_init()
{
    pid_px.type = PID_X_POS;    pid_vx.type = PID_X_VEL;
    pid_py.type = PID_Y_POS;    pid_vy.type = PID_Y_VEL;
    pid_z.type = PID_Z;

    dest.type = DEST;
    vel_limit.type = VEL_LIM;
    err_limit.type = ERR_LIM;

    waitFlag = 0; interrupted = 0;

    loadFromFile();
}


int main(int argc, char *argv[])
{
    ros::init(argc, argv, "controllerNode");

    ros::NodeHandle nh;
    ros::MultiThreadedSpinner spinner(4);

    position_pub = new ros::Publisher();
    *position_pub = nh.advertise<dji_sdk_controller::flight_msg>("/droneController",10);

    ros::Subscriber droneStatus_sub = nh.subscribe("droneStatus", 1, drone_status_callback);

    ros::Subscriber circle_sub = nh.subscribe("/circle_pose", 100, circle_detect_callback);
    ros::Subscriber car_sub = nh.subscribe("/car_pose", 100, car_detect_callback);
    ros::Subscriber tape_sub = nh.subscribe("/tape_pose", 100, tape_detect_callback);

    controller_init();
    disp_helper();
    signal(SIGINT, catch_signal);

    waitUntilReady();
    system("clear");    disp_helper();
    command_process(0, std::cin, "INIT_LAYER");

    return 0;
}




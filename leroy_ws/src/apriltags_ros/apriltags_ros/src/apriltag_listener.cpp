#include <apriltags_ros/apriltag_detector.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <boost/foreach.hpp>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseArray.h>
#include <apriltags_ros/AprilTagDetection.h>
#include <apriltags_ros/AprilTagDetectionArray.h>
#include <AprilTags/Tag16h5.h>
#include <AprilTags/Tag25h7.h>
#include <AprilTags/Tag25h9.h>
#include <AprilTags/Tag36h9.h>
#include <AprilTags/Tag36h11.h>
#include <XmlRpcException.h>
#include "std_msgs/String.h"
#include <cstring>
#include <vector>
#include <list>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <string>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sstream>
#include <iostream>  
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "opencv2/opencv.hpp"
#include <cmath>


void direction(geometry_msgs::PoseStamped tag_pose){
//	geometry_msgs::PoseStamped tag_pose = tag_pose;
	//use of pose
/*
	if(tag_pose.pose.position.x < 320 && tag_pose.pose.position.y < 240){
		cout << "up right" << endl;
	}
	if(tag_pose.pose.position.x > 320 && tag_pose.pose.position.y < 240){
		cout << "up left" << endl;
	}
	if(tag_pose.pose.position.x < 320 && tag_pose.pose.position.y > 240){
		cout << "bot right" << endl;
	}
	if(tag_pose.pose.position.x > 320 && tag_pose.pose.position.y > 240){
		cout << "bot right" << endl;
	}*/
	double x = tag_pose.pose.position.x;
	double y = tag_pose.pose.position.y;
	double z = tag_pose.pose.position.z;
	//cout << tag_pose.pose.position.x << ", " <<tag_pose.pose.position.y << endl;
	double dist = std::sqrt(x*x + y*y + z*z);
	
/*	double p1 = tag_pose.pose.orientation.w;
	double p2 = tag_pose.pose.orientation.x;
	double p3 = tag_pose.pose.orientation.y;
	double p4 = tag_pose.pose.orientation.z;
/*	double p4 = tag_pose.pose.orientation.w;
	double p1 = tag_pose.pose.orientation.x;
	double p2 = tag_pose.pose.orientation.y;
	double p3 = tag_pose.pose.orientation.z;*/
/*
    double yaw = atan2f(2 * (p1*p4 + p2*p3), 1-2*(p3*p3+p4*p4)); //Z  
    double pitch = asinf(2 * (p1*p3 - p2*p4)); //Y  
    double roll = atan2f(2 * (p1*p2 + p3*p4), 1-2*(p3*p3+p2*p2));//X  */
    cout << dist << endl;
    cout << x << endl;
    //cout << pitch*57.3 << endl;
    //cout << roll*57.3 <<endl;
}

void Callback(const apriltags_ros::AprilTagDetectionArray& msg)
{

 // ROS_INFO("plan[%s]", msg->data.c_str());
 	//AprilTagDetectionArray arra
	if (!msg.detections.empty()){
		for (int i = 0; i < msg.detections.size(); i++){
			direction(msg.detections[i].pose);
		}
	}
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "tag_listener");
	ros::NodeHandle nh;
	ros::Subscriber detections_sub = nh.subscribe("tag_detections", 1000, Callback);

	ros::spin();
	return 0;
}

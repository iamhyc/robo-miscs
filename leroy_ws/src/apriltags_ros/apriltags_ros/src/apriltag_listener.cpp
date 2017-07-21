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

 void Callback(const apriltags_ros::AprilTagDetectionArray& msg)
 {

 // ROS_INFO("plan[%s]", msg->data.c_str());
 	//AprilTagDetectionArray arra
	 if (!msg.detections.empty()){
	 	for (int i = 0; i < msg.detections.size(); i++){
	 		std::cout << (int)msg.detections[i].id << endl;
	 		cout << msg.detections[i].plan << endl;
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

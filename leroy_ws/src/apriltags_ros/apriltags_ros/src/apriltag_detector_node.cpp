#include <apriltags_ros/apriltag_detector.h>
#include <ros/ros.h>
#include "opencv2/opencv.hpp"
static const std::string OPENCV_WINDOW = "Image window";
int main(int argc, char **argv){
  ros::init(argc, argv, "apriltag_detector");
  ros::NodeHandle nh;
  ros::NodeHandle pnh("~");
  apriltags_ros::AprilTagDetector detector(nh, pnh);
  ros::spin();
}

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
#include "AprilTags/TagDetector.h"
#include <AprilTags/Tag25h9.h>
#include <AprilTags/Tag36h9.h>
#include <AprilTags/Tag36h11.h>
#include <XmlRpcException.h>
#include <iostream>
#include <cstring>
#include <vector>
#include <list>
#include <sys/time.h>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include "opencv2/opencv.hpp"
static const std::string OPENCV_WINDOW = "Image window";
int tags_array[4] = {0,0,0,0};

  namespace apriltags_ros{     
  string int_array_to_string(int int_array[], int size_of_array) {
  ostringstream oss("");
  for (int temp = 0; temp < size_of_array; temp++)
    oss << int_array[temp];
  return oss.str();
}
  void detectPos(AprilTags::TagDetection& detection)  {
    int id = detection.id;
    if (id < 4 && id >= 0){

      if(detection.cxy.first >= 180 && detection.cxy.first <= 340 && detection.cxy.second >= 40
               && detection.cxy.second <= 120){
        tags_array[0] = 1;
        return ;
      }
      if(detection.cxy.first >= 50 && detection.cxy.first <= 180 && detection.cxy.second >= 270
               && detection.cxy.second <= 420){
        tags_array[1] = 1;
        return ;
      }
      if(detection.cxy.first >= 430 && detection.cxy.first <= 600 && detection.cxy.second >= 300
               && detection.cxy.second <= 430){
        tags_array[2] = 1;
        return ;
      }
      if(detection.cxy.first >= 480 && detection.cxy.first <= 550 && detection.cxy.second >= 120
               && detection.cxy.second <= 200){
        tags_array[3] = 1;
        return ;
      }
    }
  }
////////////////////////////////////////////////////////
  /////speed up
static int frame_count = 0;
  void processImage(cv::Mat& image, cv::Mat& image_gray) {
/*	  frame_count += 1;
	  if(frame_count ){

	  }*/
    // alternative way is to grab, then retrieve; allows for
    // multiple grab when processing below frame rate - v4l keeps a
    // number of frames buffered, which can lead to significant lag
        /*  m_cap.grab();
          m_cap.retrieve(image);
*/
    // detect April tags (requires a gray scale image)

    AprilTags::TagCodes m_tagCodes =AprilTags::tagCodes16h5;
    AprilTags::TagDetector* m_tagDetector = new AprilTags::TagDetector(m_tagCodes);;


    cv::cvtColor(image, image_gray, CV_BGR2GRAY);
    double t0;

    vector<AprilTags::TagDetection> detections = m_tagDetector->extractTags(image_gray);
    int size = detections.size();
    for (int i=0; i<size; i++) {
      if (detections[i].id  >= 4 || detections[i].id  < 0){
        imshow(OPENCV_WINDOW, image);
        return;
      }
    }
    // print out each detection
    //comment out for test
/*    for (int i=0; i<size; i++) {
      if (detections[i].id < 4 && detections[i].id >= 0){
        print_detection(detections[i]);
      }
    }*/

    // show the current image including any detections

      for (int i=0; i<detections.size(); i++) {
        // also highlight in the image
        cout << "find " << endl;
        detections[i].draw(image);

        detectPos(detections[i]);
        
      }
      cout << int_array_to_string(tags_array,4) << endl;
        // mark center
      cv::circle(image, cv::Point2f(320, 320), 8, cv::Scalar(0,0,255,0), 2);

/*
      cv::rectangle(image, cv::Point2f(180.0, 120.0), cv::Point2f(340.0, 40.0), cv::Scalar(0,0,255,0) );
      cv::rectangle(image, cv::Point2f(50.0, 420.0), cv::Point2f(180.0, 270.0), cv::Scalar(0,0,255,0) );
      cv::rectangle(image, cv::Point2f(430.0, 430.0), cv::Point2f(600.0, 300.0), cv::Scalar(0,0,255,0) );
      cv::rectangle(image, cv::Point2f(480.0, 200.0), cv::Point2f(550.0, 120.0), cv::Scalar(0,0,255,0) );*/
      imshow(OPENCV_WINDOW, image);  // OpenCV call

    // optionally send tag information to serial port (e.g. to Arduino)
  }


  string choose(string plan){
    if  (plan.compare( "0000") == 0) return "no plan" ;
    if  (plan.compare( "1000") == 0) return "plan1" ;
    if  (plan.compare( "0100") == 0) return  "plan2" ;
    if  (plan.compare( "0010") == 0) return "plan3" ;
    if  (plan.compare( "0001") == 0) return  "plan4" ;
  }

////////////////////////////////////////////////////////////


AprilTags::TagDetector* m_tagDetector;
AprilTagDetector::AprilTagDetector(ros::NodeHandle& nh, ros::NodeHandle& pnh): it_(nh){
  XmlRpc::XmlRpcValue april_tag_descriptions;
  if(!pnh.getParam("tag_descriptions", april_tag_descriptions)){
    ROS_WARN("No april tags specified");
  }
  else{
    /*try{
      descriptions_ = parse_tag_descriptions(april_tag_descriptions);
    } catch(XmlRpc::XmlRpcException e){
      ROS_ERROR_STREAM("Error loading tag descriptions: "<<e.getMessage());
    }*/
  }

  if(!pnh.getParam("sensor_frame_id", sensor_frame_id_)){
    sensor_frame_id_ = "";
  }

  std::string tag_family;
  pnh.param<std::string>("tag_family", tag_family, "16h5");

  pnh.param<bool>("projected_optics", projected_optics_, false);

  const AprilTags::TagCodes* tag_codes;
  if(tag_family == "16h5"){
    tag_codes = &AprilTags::tagCodes16h5;
  }
  else if(tag_family == "25h7"){
    tag_codes = &AprilTags::tagCodes25h7;
  }
  else if(tag_family == "25h9"){
    tag_codes = &AprilTags::tagCodes25h9;
  }
  else if(tag_family == "36h9"){
    tag_codes = &AprilTags::tagCodes36h9;
  }
  else if(tag_family == "36h11"){
    tag_codes = &AprilTags::tagCodes36h11;
  }
  else{
    ROS_WARN("Invalid tag family specified; defaulting to 16h5");
    tag_codes = &AprilTags::tagCodes16h5;
  }

  tag_detector_= boost::shared_ptr<AprilTags::TagDetector>(new AprilTags::TagDetector(*tag_codes));
  image_sub_ = it_.subscribeCamera("/usb_cam/image_raw", 1, &AprilTagDetector::imageCb, this);
  image_pub_ = it_.advertise("tag_detections_image", 1);
  detections_pub_ = nh.advertise<AprilTagDetectionArray>("tag_detections", 1);
  pose_pub_ = nh.advertise<geometry_msgs::PoseArray>("tag_detections_pose", 1);
  cv::namedWindow(OPENCV_WINDOW);
}
AprilTagDetector::~AprilTagDetector(){
  cv::destroyWindow(OPENCV_WINDOW);
  image_sub_.shutdown();
}

void AprilTagDetector::imageCb(const sensor_msgs::ImageConstPtr& msg, const sensor_msgs::CameraInfoConstPtr& cam_info){
/*  char qstring[10];
  double t = (double)cv::getTickCount();*/
  cv_bridge::CvImagePtr cv_ptr;
  try{
    cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
  }
  catch (cv_bridge::Exception& e){
    ROS_ERROR("cv_bridge exception: %s", e.what());
    return;
  }
    // Update GUI Window
  cv::Mat& image = cv_ptr -> image;
  cv::Mat image_gray;
 // imshow(OPENCV_WINDOW, image);
  processImage(image, image_gray);
  string m = choose(int_array_to_string(tags_array,4));
  cout  << m << endl;
  cv::waitKey(1);
  cv::Mat gray;
  cv::cvtColor(cv_ptr->image, gray, CV_BGR2GRAY);
  std::vector<AprilTags::TagDetection>	detections = tag_detector_->extractTags(gray);
 // ROS_DEBUG("%d tag detected", (int)detections.size());
/*  t = ((double)cv::getTickCount() - t) / cv::getTickFrequency();
  double fps = 1.0 / t;
  sprintf(qstring, "%.2f", fps);    // 帧率保留两位小数
  std::string fpsString("FPS:");
  fpsString += qstring;    
  cout << fpsString <<endl;*/
  double fx;
  double fy;
  double px;
  double py;
  if (projected_optics_) {
    // use projected focal length and principal point
    // these are the correct values
    fx = cam_info->P[0];
    fy = cam_info->P[5];
    px = cam_info->P[2];
    py = cam_info->P[6];
  } else {
    // use camera intrinsic focal length and principal point
    // for backwards compatability
    fx = cam_info->K[0];
    fy = cam_info->K[4];
    px = cam_info->K[2];
    py = cam_info->K[5];
  }

  if(!sensor_frame_id_.empty())
  cv_ptr->header.frame_id = sensor_frame_id_;
  AprilTagDetectionArray tag_detection_array;
  geometry_msgs::PoseArray tag_pose_array;
  tag_pose_array.header = cv_ptr->header;

  BOOST_FOREACH(AprilTags::TagDetection detection, detections){
    std::map<int, AprilTagDescription>::const_iterator description_itr = descriptions_.find(detection.id);
    if(description_itr == descriptions_.end()){
      ROS_WARN_THROTTLE(10.0, "Found tag: %d, but no description was found for it", detection.id);
      continue;
    }
    if (detection.id >= 8 || detection.id < 0){
      continue;
    }
    AprilTagDescription description = description_itr->second;
    double tag_size = description.size();
    detection.draw(cv_ptr->image);

    Eigen::Matrix4d transform = detection.getRelativeTransform(tag_size, fx, fy, px, py);
    Eigen::Matrix3d rot = transform.block(0, 0, 3, 3);
    Eigen::Quaternion<double> rot_quaternion = Eigen::Quaternion<double>(rot);

    geometry_msgs::PoseStamped tag_pose;
    tag_pose.pose.position.x = transform(0, 3);
    tag_pose.pose.position.y = transform(1, 3);
    tag_pose.pose.position.z = transform(2, 3);
    tag_pose.pose.orientation.x = rot_quaternion.x();
    tag_pose.pose.orientation.y = rot_quaternion.y();
    tag_pose.pose.orientation.z = rot_quaternion.z();
    tag_pose.pose.orientation.w = rot_quaternion.w();
    tag_pose.header = cv_ptr->header;

    AprilTagDetection tag_detection;
    tag_detection.pose = tag_pose;
    tag_detection.id = detection.id;
    tag_detection.size = tag_size;


    tag_detection_array.detections.push_back(tag_detection);
    tag_pose_array.poses.push_back(tag_pose.pose);

    tf::Stamped<tf::Transform> tag_transform;
    tf::poseStampedMsgToTF(tag_pose, tag_transform);
    tf_pub_.sendTransform(tf::StampedTransform(tag_transform, tag_transform.stamp_, tag_transform.frame_id_, description.frame_name()));
  }
  detections_pub_.publish(tag_detection_array);
  pose_pub_.publish(tag_pose_array);
  image_pub_.publish(cv_ptr->toImageMsg());
}


/*std::map<int, AprilTagDescription> AprilTagDetector::parse_tag_descriptions(XmlRpc::XmlRpcValue& tag_descriptions){
  std::map<int, AprilTagDescription> descriptions;
  ROS_ASSERT(tag_descriptions.getType() == XmlRpc::XmlRpcValue::TypeArray);
  for (int32_t i = 0; i < tag_descriptions.size(); ++i) {
    XmlRpc::XmlRpcValue& tag_description = tag_descriptions[i];
    ROS_ASSERT(tag_description.getType() == XmlRpc::XmlRpcValue::TypeStruct);
    ROS_ASSERT(tag_description["id"].getType() == XmlRpc::XmlRpcValue::TypeInt);
    ROS_ASSERT(tag_description["size"].getType() == XmlRpc::XmlRpcValue::TypeDouble);

    int id = (int)tag_description["id"];
    double size = (double)tag_description["size"];

    std::string frame_name;
    if(tag_description.hasMember("frame_id")){
      ROS_ASSERT(tag_description["frame_id"].getType() == XmlRpc::XmlRpcValue::TypeString);
      frame_name = (std::string)tag_description["frame_id"];
    }
    else{
      std::stringstream frame_name_stream;
      frame_name_stream << "tag_" << id;
      frame_name = frame_name_stream.str();
    }
    AprilTagDescription description(id, size, frame_name);
   // ROS_INFO_STREAM("Loaded tag config: "<<id<<", size: "<<size<<", frame_name: "<<frame_name);
    descriptions.insert(std::make_pair(id, description));
  }
  return descriptions;
}*/
/*class detection{
int main(int argc, char **argv)
{
  ros::init(argc, argv, "usb_cam");
  usb_cam::UsbCamNode a;
  a.spin();
  return 0;
}

};*/
}

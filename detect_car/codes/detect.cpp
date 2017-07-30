
#include <opencv2/objdetect/objdetect.hpp>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <stdio.h>
#include "opencv2/opencv.hpp"
#include "ros/ros.h"
#include <detect_car/flight_msg.h>
#include "detect.h"
using namespace std;
using namespace cv;

int low_hsv_circleB[3]={105, 100, 50}; // h:0 to 10 for red circle 105 to 115 for blue
int high_hsv_circleB[3]={115, 255, 200};
int low_hsv_circleR[3]={0, 100, 50}; // h:0 to 10 for red circle 105 to 115 for blue
int high_hsv_circleR[3]={10, 255, 200};
int low_hsv_car[3]={70, 50, 50}; // h:70 to 85 for green car 105 to 115
int high_hsv_car[3]={85, 255, 255};
int m_cap = 0;

typedef struct
{
	geometry_msgs::Vector3 data;
	bool flag;
}Data;


Data data_circle = {};
Data data_car = {};

void solveDistance (Mat frame, vector<Point2d> image_points, Data data);
void find(Mat frame, Data data, int low_hsv[3], int high_hsv[3]);


void detect_init(int m_cap){
	VideoCapture cap = VideoCapture(m_cap);
	//while(1){
	if(!cap.isOpened()){
		cout << "error!" << endl;
		return;
	// Mat grayframe;
		//Mat frame = imread("imgs/leroy.jpg", CV_LOAD_IMAGE_COLOR); 
	}
}
void detect(VideoCapture cap, Data data_circle, Data data_car){
	Mat frame;
	cap.read(frame);
	if(! frame.data )                            
	{
		cout <<  "Could not open or find the image" << std::endl ;
		return;
	}	
	find(frame, data_circle,low_hsv_circleB, high_hsv_circleB);
	find(frame, data_car, low_hsv_car, high_hsv_car);
}
void solveDistance (Mat frame, vector<Point2d> image_points, Data data){

    vector<Point3d> model_points;     
    model_points.push_back(cv::Point3d(-0.25f, -0.25f, 0.4f)); 
    model_points.push_back(cv::Point3d(0.25f, -0.25f, 0.4f));  
	model_points.push_back(cv::Point3d(0.25f, 0.25f, 0.4f));
	model_points.push_back(cv::Point3d(-0.25f, 0.25f, 0.4f));       

   	//cv::Mat camera_matrix =  (cv::Mat_<double>(3,3) << 609, 0, 319, 0 , 609, 226, 0, 0, 1);
   	cv::Mat camera_matrix =  (cv::Mat_<double>(3,3) << 600, 0, 319, 0 , 600, 240, 0, 0, 1);
   	cv::Mat dist_coeffs = cv::Mat::zeros(4,1,cv::DataType<double>::type); // Assuming no lens distortion
   	//cv::Mat dist_coeffs = (cv::Mat_<double>(5,1)<<0.0014, 0.00076,0.00117,0.00117,-0.036) ; // Assuming no lens distortion
    //cout << "Camera Matrix " << endl << camera_matrix << endl ;
    Mat rotation_vector; // Rotation in axis-angle form
	Mat translation_vector;
	solvePnP(model_points, image_points, camera_matrix, dist_coeffs, rotation_vector, translation_vector);

  	double tx = translation_vector.at<double>(0, 0);
	double ty = -1 * translation_vector.at<double>(1, 0);
	     //////////////////////////using proportion to solve PNP.
	double tz = translation_vector.at<double>(2, 0);
	data.data.x = tx;
	data.data.y = ty;
	data.data.z = tz;
	data.flag = true;
	double dist = std::sqrt(tx*tx + ty*ty + tz*tz);
	cout << "x:" << tx <<",  " << "y: " << ty <<",  " << "z:" << tz << endl;
    for(int i=0; i < image_points.size(); i++)
    {
        circle(frame, image_points[i], 3, Scalar(0,0,255), -1);
    }
}

void find(Mat frame, Data data, int low_hsv[3], int high_hsv[3]){
	Mat HSV;
	cvtColor(frame, HSV, CV_BGR2HSV);
	imshow("HSV",HSV);
	Mat frame_threshold;
	Mat frame_threshold2;
	vector<vector<Point> > contours;
	vector<Vec4i> hierarchy;
	//-- Trackbars to set thresholds for RGB values
	inRange(HSV,Scalar(low_hsv[0],low_hsv[1],low_hsv[2]), 
		Scalar(high_hsv[0],high_hsv[1],high_hsv[2]),frame_threshold);
	/*inRange(HSV,Scalar(low_hsv_circleR[0],low_hsv_circleR[1],low_hsv_circleR[2]), 
		Scalar(high_hsv_circleR[0],high_hsv_circleR[1],high_hsv_circleR[2]),frame_threshold2);*/
	frame_threshold = frame_threshold;
	findContours( frame_threshold, contours, hierarchy, CV_RETR_EXTERNAL , CV_CHAIN_APPROX_SIMPLE, Point(0, 0) );
	//Mat drawing = Mat::zeros( frame_threshold.size(), CV_8UC3 );
	vector<std::vector<Point> > contours_new;
	Rect tmp;
	vector<Rect> new_Rect;
	for(int i=0;i < contours.size(); i++)
	{		
		Point2f center;
		float radius = 0;
		minEnclosingCircle(Mat(contours[i]), center, radius);
		double area0 = contourArea(contours[i]);
		double area1 = 3.1415926 *  radius * radius;
		tmp = boundingRect( Mat(contours[i]) );
		if(area0 / area1>0.85){
			contours_new.push_back(contours[i]);
			//center  - Point2f(320, 240)
			cout << center.x  - 320 << ", " << 240 - center.y  << endl;
			new_Rect.push_back(tmp);
			
		}
	}
	for(int i = 0; i< contours_new.size(); i++ )
	{	
		Rect rect = new_Rect[i];
		drawContours( frame, contours_new, i, Scalar(0,255,255), 2, 8, hierarchy, 0, Point() );
		//drawContours( frame, boundRect, i, Scalar(0,255,255), 2, 8, hierarchy, 0, Point() );
		Point2f bl = ((Point2f)rect.br() - Point2f(rect.width,0));
		Point2f tr = ((Point2f)rect.tl() + Point2f(rect.width,0));
	
		vector<Point2d> image_points;  
		image_points.push_back( (Point2f)bl);  
		image_points.push_back((Point2f) rect.br() ); 
		image_points.push_back( (Point2f)tr ); 
		image_points.push_back((Point2f)rect.tl() ); 
		solveDistance (frame, image_points, data);
	}
}
int main(){
	return 1;
}
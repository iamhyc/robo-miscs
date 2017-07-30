#ifndef __DETECT_H__
#define __DETECT_H__
#include <opencv2/objdetect/objdetect.hpp>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <stdio.h>
#include "opencv2/opencv.hpp"
#include "ros/ros.h"
#include <detect_car/flight_msg.h>
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
void detect(VideoCapture cap, Data data_circle, Data data_car);
void solveDistance (Mat frame, vector<Point2d> image_points, Data data);
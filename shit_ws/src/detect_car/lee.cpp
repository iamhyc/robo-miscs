#include <opencv2/opencv.hpp>
#include <iostream>
using namespace cv;
int main(void)
{
	Mat src = "/home/leory/Yaphets_ws/src/detect_car/leroy.jpg";
	Mat hsv,binary;
	cvtColor(src, hsv, CV_BGR2HSV);
	inRange(hsv,Scalar(105,100,50), Scalar(115,255,255),binary);

	imshow("image",src);
}


#include <opencv2/objdetect/objdetect.hpp>
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <stdio.h>
#include "opencv2/opencv.hpp"
using namespace std;
using namespace cv;
int low_h=105, low_s=100, low_v=50; // h:0 to 10 for red circle 105 to 115 for blue
int high_h=115, high_s=255, high_v=200;
VideoCapture cap = VideoCapture("video0.avi");
double dWidth = cap.get(CV_CAP_PROP_FRAME_WIDTH); 
double dHeight = cap.get(CV_CAP_PROP_FRAME_HEIGHT); 
Size frameSize(static_cast<int>(dWidth), static_cast<int>(dHeight));
VideoWriter oVideoWriter ("circle.avi",CV_FOURCC('P','I','M','1') , 30, frameSize, true); 
///////distance estimate using enclosing rect for PNP 
void solveDistance (Mat frame, RotatedRect rect){
	Point2f pts[4];
	rect.points(pts);
	std::vector<cv::Point3d> model_points;
	std::vector<cv::Point2d> image_points;
    model_points.push_back(cv::Point3d(0.0f, 0.0f, 0.0f));            
    model_points.push_back(cv::Point3d(0.0f, 0.65f, 0.0f));        
    model_points.push_back(cv::Point3d(0.65f, 0.65f, 0.0f));        
    model_points.push_back(cv::Point3d(0.65f, 0.0f, 0.0f));  
    image_points.push_back((Point2d) pts[0] );  
   // cout << (Point2d) pts[0] << endl;
    image_points.push_back( (Point2d)pts[1] );    
    image_points.push_back( (Point2d)pts[2] );     
    image_points.push_back( (Point2d)pts[3] );  


	double focal_length = 609; // Approximate focal length.
    Point2d center2 = cv::Point2d(frame.cols/2,frame.rows/2);
   // cv::Mat camera_matrix = (cv::Mat_<double>(3,3) << focal_length, 0, center2.x, 0 , focal_length, center2.y, 0, 0, 1);
   // cv::Mat dist_coeffs = cv::Mat::zeros(4,1,cv::DataType<double>::type); // Assuming no lens distortion
   	cv::Mat camera_matrix =  (cv::Mat_<double>(3,3) << 609, 0, 319, 0 , 609, 226, 0, 0, 1);
   	cv::Mat dist_coeffs = (cv::Mat_<double>(5,1)<<0.0014, 0.00076,0.00117,0.00117,-0.036) ; // Assuming no lens distortion
    //cout << "Camera Matrix " << endl << camera_matrix << endl ;
    Mat rotation_vector; // Rotation in axis-angle form
	Mat translation_vector;

// Solve for pose
	solvePnP(model_points, image_points, camera_matrix, dist_coeffs, rotation_vector, translation_vector);
    //vector<Point3d> end_point3D;
    //vector<Point2d> end_point2D;
    //end_point3D.push_back(Point3d(0.1f,0.1f,0.0f));
     
   // projectPoints(end_point3D, rotation_vector, translation_vector, camera_matrix, dist_coeffs, end_point2D);
    double tx = translation_vector.at<double>(0, 0);
	double ty = translation_vector.at<double>(1, 0);
	double tz = translation_vector.at<double>(2, 0);
	double dist = std::sqrt(tx*tx + ty*ty + tz*tz);
    cout << dist << endl;
    for(int i=0; i < image_points.size(); i++)
    {
        circle(frame, image_points[i], 3, Scalar(0,0,255), -1);
        //cout << image_points[i] << endl;
    }
     
  //  cv::line(frame,image_points[0], end_point2D[0], cv::Scalar(255,0,0), 2);
     
    //cout << "Rotation Vector " << endl << rotation_vector << endl;
   // cout << "Translation Vector" << endl << translation_vector << endl;
     
    //cout <<  end_point2D << endl;
}

///////////////////////////////////
/////////////////set trackbar
void find_circle(Mat frame){
	Mat HSV;
	cvtColor(frame, HSV, CV_BGR2HSV);
	imshow("HSV",HSV);
	Mat frame_threshold;
	vector<vector<Point> > contours;
	vector<Vec4i> hierarchy;
	//-- Trackbars to set thresholds for RGB values
	inRange(HSV,Scalar(low_h,low_s,low_v), Scalar(high_h,high_s,high_v),frame_threshold);
	findContours( frame_threshold, contours, hierarchy, CV_RETR_EXTERNAL , CV_CHAIN_APPROX_SIMPLE, Point(0, 0) );
	//Mat drawing = Mat::zeros( frame_threshold.size(), CV_8UC3 );
	vector<std::vector<Point> > contours_new;
	vector<RotatedRect> boundRect( contours.size() );
	vector<RotatedRect> new_Rect;
	for(int i=0;i < contours.size(); i++)
	{		
		Point2f center;
		float radius = 0;
		minEnclosingCircle(Mat(contours[i]), center, radius);
		double area0 = contourArea(contours[i]);
		double area1 = 3.1415926 *  radius * radius;
		boundRect[i] = minAreaRect( Mat(contours[i]) );
		if(area0 / area1>0.9){
			contours_new.push_back(contours[i]);
			cout << center  - Point2f(320, 240) << endl;
			new_Rect.push_back(boundRect[i]);
			
		}
	}
	for( int i = 0; i< contours_new.size(); i++ )
	{
		drawContours( frame, contours_new, i, Scalar(0,255,255), 2, 8, hierarchy, 0, Point() );
		//drawContours( frame, boundRect, i, Scalar(0,255,255), 2, 8, hierarchy, 0, Point() );
		solveDistance (frame, new_Rect[i]);
	}
}
	
int main()
{
	//int thresh = 30;
	//Mat frame;
	//while(1){
	while(cap.isOpened()){
	// Mat grayframe;
		Mat frame = imread("leroy.jpg", CV_LOAD_IMAGE_COLOR); 
		//cap.read(frame);
		if(! frame.data )                            
		{
			cout <<  "Could not open or find the image" << std::endl ;
			oVideoWriter.release();
			return -1;
		}
		find_circle(frame);

  /// Show in a window
/*		#ifdef __DEBUG
		#endif*/
		//namedWindow( "Contours", CV_WINDOW_AUTOSIZE );
		//cout << "asda " <<endl;
		imshow( "Contours", frame );
		oVideoWriter.write(frame);
		waitKey(1);
	//}
			
}
return 0;
}



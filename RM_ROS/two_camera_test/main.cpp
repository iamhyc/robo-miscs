#include <opencv2/opencv.hpp>
using namespace std;

int main()
{
    //initialize and allocate memory to load the video stream from camera
    cv::VideoCapture camera0(7);
    camera0.set(CV_CAP_PROP_FRAME_WIDTH,640);
    camera0.set(CV_CAP_PROP_FRAME_HEIGHT,480);

    cv::VideoCapture camera1(6);
    camera1.set(CV_CAP_PROP_FRAME_WIDTH,640);
    camera1.set(CV_CAP_PROP_FRAME_HEIGHT,480);
//
    //cv::VideoCapture camera2(5);
    //camera2.set(CV_CAP_PROP_FRAME_WIDTH,640);
    //camera2.set(CV_CAP_PROP_FRAME_HEIGHT,480);

    if( !camera0.isOpened() ) return 1;
    if( !camera1.isOpened() ) return 1;
    //if( !camera2.isOpened() ) return 1;

    while(true) {
        //grab and retrieve each frames of the video sequentially
        cv::Mat3b frame0;
        camera0 >> frame0;

        cv::Mat3b frame1;
        camera1 >> frame1;

 	    //cv::Mat3b frame2;
        //camera2 >> frame2;

        cv::imshow("VideoFront", frame0);
        cv::imshow("VideoBack", frame1);
	    //cv::imshow("Video2", frame2);
//      std::cout << frame1.rows() << std::endl;
        //wait for 40 milliseconds
        int c = cvWaitKey(1);

        //exit the loop if user press "Esc" key  (ASCII value of "Esc" is 27)
        if(27 == char(c)) break;
    }

    return 0;
}

#include "opencv2/opencv.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iostream>
using namespace cv;
int main() {
    Mat frame;
    VideoCapture cap = VideoCapture("video0.avi");
    if ( !cap.isOpened() ) {
        return -1;
                     }
    namedWindow( "mywindow", CV_WINDOW_AUTOSIZE );
    while ( 1 ) {
         cap.read(frame);
        imshow( "mywindow", frame );
    if ( waitKey(100) == 'p' ) {
        imwrite("leroy1.jpg",frame);
        break;
    }
    }
    return 0;
}
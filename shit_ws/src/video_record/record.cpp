#include "opencv2/opencv.hpp"
#include "opencv2/highgui/highgui.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main(int argc, char* argv[])
{
    VideoCapture cap(0); 

    if (!cap.isOpened())  
    {
        cout << "ERROR: Cannot open the video file" << endl;
        return -1;
    }

 namedWindow("MyVideo",CV_WINDOW_AUTOSIZE); 

   double dWidth = cap.get(CV_CAP_PROP_FRAME_WIDTH); 
   double dHeight = cap.get(CV_CAP_PROP_FRAME_HEIGHT); 

   cout << "Frame Size = " << dWidth << "x" << dHeight << endl;

   Size frameSize(static_cast<int>(dWidth), static_cast<int>(dHeight));

 VideoWriter oVideoWriter ("MyVideo.avi", CV_FOURCC('P','I','M','1'), 30, frameSize, true); 

   if ( !oVideoWriter.isOpened() )
   {
        cout << "ERROR: Failed to write the video" << endl;
        return -1;
   }

    while (1)
    {

        Mat frame;

        bool bSuccess = cap.read(frame); 

        if (!bSuccess) 
       {
             cout << "ERROR: Cannot read a frame from video file" << endl;
             break;
        }

         oVideoWriter.write(frame); 

        imshow("MyVideo", frame); 

        if (waitKey(1) == 'p') 
       {
            cout << "esc key is pressed by user" << endl;
            break; 
       }
    }

    return 0;

}
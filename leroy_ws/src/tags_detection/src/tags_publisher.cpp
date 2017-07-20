using namespace std;
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <vector>
#include <list>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
#include <iostream>  
#include <string.h> 
#include <cstring> 
#include "pipe.h"
#define FIFO_FILE "/tmp/april_tags" 
string int_array_to_string(int int_array[], int size_of_array) {
  ostringstream oss("");
  for (int temp = 0; temp < size_of_array; temp++)
    oss << int_array[temp];
  return oss.str();
}
int main(int argc, char **argv)
{   
    int sb =  mes_open(12345);
    ros::init(argc, argv, "talker");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("plan", 1000);
    ros::Rate loop_rate(10);
    int buf[4] = {0, 0, 0, 0};
    const char* m = 0; 
    int fd;
    // if ((mkfifo(FIFO_FILE,S_IRWXU) < 0) && (errno != EEXIST)) //如果该fifo文件不存在，创建之
    // {
    //     perror("mkfifo error");
    //     exit(-1);
    // }
    // if ((fd = open(FIFO_FILE,O_RDONLY | O_NONBLOCK)) < 0) //非阻塞方式打开
    // {
    //     perror("open error");
    //     exit(-1);
    // }
    while (1)
    {   
        m = mes_read(sb);
        cout << m<< endl;
        // if (m < 0) 
        // {
        //     if (errno == EAGAIN) 
        //     {   
        //         printf("No data yet\n");
        //         sleep(1);
        //     }
        // }
        // else {
        if( m==0){
            cout << "NULL" <<endl;
        }
                string s = m;
                
                std_msgs::String msg;
                std::stringstream ss;
                ss << s;

                

                msg.data = ss.str();
                //printf("%s\n", msg.data());
               // ROS_INFO("%s", msg.data.c_str() );
                pub.publish(msg);
                ros::spinOnce();

                //printf("%d\t%d\t%d\t%d\t\n", buf[0], buf[1], buf[2], buf[3]);
            
        }
    //unlink(FIFO_FILE);
    return 0;
}

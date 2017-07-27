#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>

#define FIFO_FILE "/tmp/april_tags" 
  
int main(int argc, char **argv)
{
    ros::init(argc, argv, "talker");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("plan", 1000);
    ros::Rate loop_rate(10);
    char buf[4] = {0, 0, 0, 0};
    int m = 0; 
    int fd;
    if ((mkfifo(FIFO_FILE,S_IRWXU) < 0) && (errno != EEXIST)) //如果该fifo文件不存在，创建之
    {
        perror("mkfifo error");
        exit(-1);
    }
    if ((fd = open(FIFO_FILE,O_RDONLY | O_NONBLOCK)) < 0) //非阻塞方式打开
    {
        perror("open error");
        exit(-1);
    }
    while (1)
    {
        if ((m = read(fd,buf,4)) < 0) 
        {
            if (errno == EAGAIN) 
            {
                printf("No data yet\n");
                sleep(1);
            }
        }
        else {
                std_msgs::String msg;

                ROS_INFO("%s", buf);
                pub.publish(buf);
                ros::spinOnce();
                printf("%d\t%d\t%d\t%d\t\n", buf[0], buf[1], buf[2], buf[3]);
                sleep(1);
        }
    }
    //unlink(FIFO_FILE);
    return 0;
}
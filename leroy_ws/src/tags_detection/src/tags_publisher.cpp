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
#include "udp_socket.h"
#define FIFO_FILE "/tmp/april_tags"
#define MAX_KEEP_TIME 5


int state_counter = 0;
string last_state;

string int_array_to_string(int int_array[], int size_of_array) {
  ostringstream oss("");
  for (int temp = 0; temp < size_of_array; temp++)
    oss << int_array[temp];
  return oss.str();
}

int main(int argc, char **argv)
{   
    
    ros::init(argc, argv, "talker");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("plan", 1000);
    ros::Rate loop_rate(1);
    const char* m = 0;
    int fd;
    int tt =  k_slave_open();
    while (1)
    {   

        string s = k_slave_read(tt);
        std_msgs::String msg;
        std::stringstream ss;
        
        cout << s << endl;
        ss << s;
        msg.data = ss.str();
        //printf("%s\n", msg.data());
        // ROS_INFO("%s", msg.data.c_str() );
        pub.publish(msg);
                
        loop_rate.sleep();
        ros::spinOnce();
    }
    //unlink(FIFO_FILE);
    return 0;
}

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
#define MAX_KEEP_TIME 5

int sb =  mes_open(12345);

int state_counter = 0;
string last_state;

string int_array_to_string(int int_array[], int size_of_array) {
  ostringstream oss("");
  for (int temp = 0; temp < size_of_array; temp++)
    oss << int_array[temp];
  return oss.str();
}

bool keep_confirm(string s){

    const char* m = mes_read(sb);
    cout << "this time:" << s;

    if(state_counter == 0)
    {
        last_state = m;
        state_counter++;
        return false;
    }

    if(strncmp(m, last_state.c_str(), 4) == 0)
    {
        if(state_counter >= MAX_KEEP_TIME)
        {
            state_counter = 0;
            return true;
        }
        else
        {
            state_counter++;
            return false;
        }
    }
    else
    {
        state_counter = 0;
        return false;
    }
}

int main(int argc, char **argv)
{   
    
    ros::init(argc, argv, "talker");
    ros::NodeHandle n;
    ros::Publisher pub = n.advertise<std_msgs::String>("plan", 1000);
    ros::Rate loop_rate(1);
    const char* m = 0;
    int fd;
    while (1)
    {   
        m = mes_read(sb);
        if( m==0)
        {
            cout << "NULL" <<endl;
        }
        
        string s = m;    
        std_msgs::String msg;
        std::stringstream ss;
        
        cout << s << endl;
        ss << s;
        msg.data = ss.str();
        //printf("%s\n", msg.data());
        // ROS_INFO("%s", msg.data.c_str() );
        
        if( (strncmp(m,"0000",4) == 0) )//|| keep_confirm(s) )
        {
            pub.publish(msg);
        }
                
        loop_rate.sleep();
        ros::spinOnce();
    }
    //unlink(FIFO_FILE);
    return 0;
}

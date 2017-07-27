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

void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  //ROS_INFO("plan[%s]", msg->data.c_str());
		const char* plan = msg->data.c_str();
		if  (strncmp(plan, "0000",4) == 0) cout << "no plan" <<endl;
		if  (strncmp(plan, "1000",4) == 0) cout << "plan1" <<endl;
		if  (strncmp(plan, "0100",4) == 0) cout << "plan2" <<endl;;
		if  (strncmp(plan, "0010",4) == 0) cout << "plan3" <<endl;
		if  (strncmp(plan, "0001",4) == 0) cout << "plan4" <<endl;
	//}
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "listener");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe("plan", 1000, chatterCallback);

  ros::spin();
  return 0;
}

#ifndef __PID_SET_H__
#define __PID_SET_H__

#include <stdio.h>
#include <stdlib.h>

typedef struct				//define x parameters
{
	float kp,ki,kd;			
	float error;			
	float error_last;		
	float integral;			
	float v;
}pid_T;

//pid_T pid_x, pid_y, pid_z;
//pid_T pid_u, pid_v, pid_yaw;


//void PID_set(pid_T* p_x,pid_T* p_y,pid_T* p_yaw,pid_T* p_u,pid_T* p_v,pid_T* p_z);

#endif

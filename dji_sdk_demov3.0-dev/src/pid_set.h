#ifndef __PID_SET_H__
#define __PID_SET_H__

#include <stdio.h>
#include <stdlib.h>

namespace CtrlType{
	typedef struct
	{
		float kp,ki,kd;
		float vel_lim, error_lim;			
		float error;			
		float error_last;		
		float integral;			
		float v;
	}pid_T;

	typedef struct
	{
		float x, y, z
	}Vector3;
}

#endif

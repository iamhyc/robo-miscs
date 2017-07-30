
#ifndef __CTRL_TYPE_H__
#define __CTRL_TYPE_H__

#include <dji_sdk_controller/flight_msg.h>

/*
// Type Defenition
# 0x01	Dest. Coordinate, (x, y, z)
# 0x02	Velocity limits, (x, y, z)
# 0x03	Location Error limits, (x, y, z)
# 0x04	PID parameter for X, (kp, ki, kd)
# 0x05	PID parameter for Y, (kp, ki, kd)
# 0x06	PID parameter for Z, (kp, ki, kd)
*/
#define FLIGHT_LANDING  0x00
#define FLIGHT_TAKEOFF  0x01
#define FLIGHT_LANDING_REQUEST 0x02
#define FLIGHT_TAKEOFF_REQUEST 0x03

#define	DEST        0x01
#define	VEL_LIM     0x02
#define ERR_LIM     0x03
#define	PID_X       0x04
#define PID_Y       0x05
#define	PID_Z       0x06
#define LANDING     0x07
#define TAKEOFF     0x08

#endif


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
enum FlightStatus
{
    FLIGHT_LANDING,
    FLIGHT_TAKEOFF,
    FLIGHT_LANDING_REQUEST,
    FLIGHT_TAKEOFF_REQUEST
}FlightStatus;

enum CtrlCmd
{
    DEST    = 0x01,
    VEL_LIM = 0x02,
    ERR_LIM = 0x03,
    PID_X   = 0x04,
    PID_Y   = 0x05,
    PID_Z   = 0x06,
    LANDING = 0x07,
    TAKEOFF = 0x08
}CtrlCmd;


#endif

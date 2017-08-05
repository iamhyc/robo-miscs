
#ifndef __CONTROLLER_NODE_H__
#define __CONTROLLER_NODE_H__

const static std::string SCRIPT_PREFIX = "/home/ubuntu/logFile/";
const static std::string BASIC_SCRIPT_PREFIX = "/home/ubuntu/logFile/basic/";

enum LogicState
{
	INIT		=	0x00,
	GRAB_MODE	=	0x01,
	DROP_MODE	=	0x02,
	CIRCLE_LAND	=	0x03,
	BASE_LAND	=	0x04,
	PATROL_MODE	=	0x05,
	MANUAL_MODE	=	0xFF
};

#endif

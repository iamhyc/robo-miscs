/**
 * @brief Helper Function Set
 */

#include "helperfn.h"

float inSRange(float num, float limit)
{
	if (num > limit)
	{
		return limit;
	}
	else if (num < -limit)
	{
		return -limit;
	}
	else
		return num;
}

float inRange(float num, float lower, float upper)
{
	if (num > upper)
	{
		return upper;
	}
	else if (num < lower)
	{
		return lower;
	}
	else
		return num;
}

void genVector3Msg(std::stringstream& msg, std::string pre, \
					float x, float y, float z)
{
	msg << pre <<" {";
	msd << x << ",\t";
	msd << y << ",\t";
	msd << z << " }";
}

void LoadParamFile(CtrlType::Vector3& expect, \
                CtrlType::pid_T& pid_x, CtrlType::pid_T& pid_y, CtrlType::pid_T& pid_z, bool resetPID)
{
	FileNode itD = fs["DEST"].begin(), itV = fs["VEL_LIM"].begin(), itE = fs["ERR_LIM"].begin();
	FileNode itX = fs["PID_X"].begin(), itY = fs["PID_Y"].begin(), itZ = fs["PID_Z"].begin();  
	//n.type() == FileNode::SEQ
	
	expect.x = *(itD); expect.y = *(++itD); expect.z = *(++itD);
	pid_x.vel_lim = *(itV); pid_y.vel_lim = *(++itV); pid_z.vel_lim = *(++itV);
	pid_x.err_lim = *(itE); pid_y.err_lim = *(++itE); pid_z.err_lim = *(++itE);

	if(resetPID == PID_RESET)
	{
		pid_x.kp = *(itX); pid_x.ki = *(++itX); pid_x.kd = *(++itX);
		pid_y.kp = *(itY); pid_y.ki = *(++itY); pid_y.kd = *(++itY);
		pid_z.kp = *(itZ); pid_z.ki = *(++itZ); pid_z.kd = *(++itZ);
	}
}

void logToFile(const std::stringstream& msg, int type)
{
    std::time_t result = std::time(nullptr);
    std::fstream fs;

    switch(type)
    {
    case GUIDANCE_MSG:
        fs.open(LOGFILE_ROOT + "guidance.txt", std::fstream::out | std::fstream::app);
        fs << "["<< result <<"] ";
        fs << "[GUIDANCE]";
        break;
    case RC_MSG:
        fs.open(LOGFILE_ROOT + "controller.txt", std::fstream::out | std::fstream::app);
        fs << "["<< result <<"] ";
        fs << "[RC]";
        break;
    case CLIENT_MSG:
        fs.open(LOGFILE_ROOT + "client.txt", std::fstream::out | std::fstream::app);
        fs << "["<< result <<"] ";
        fs << "[CLIENT]";
        break;
    }

    fs<<msg.str() <<std::endl;
    fs.flush();
    fs.close();
}

void resetLogFileAll()
{
	remove(LOGFILE_ROOT + "guidance.txt");
    remove(LOGFILE_ROOT + "controller.txt");
    remove(LOGFILE_ROOT + "client.txt");
}

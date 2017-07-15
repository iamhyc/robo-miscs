#ifndef __JUDGE_SYSTEM_H__
#define __JUDGE_SYSTEM_H__

/**
 * def&var Area
**/
#define	BYTE_SIZE			4

#define FRAME_HEADER_SIZE	20//5-byte
#define FRAME_SOF			0xA5
#define FRAME_SEQ_SIZE		8//2-byte
#define	FRAME_CRC8_SIZE		8//2-byte
#define FRAME_CMD_SIZE		8//2-byte
#define	FRAME_TAIL_SIZE		16//4-byte, CRC16

#define	CMD_PROCESS_INFO	0x0001
#define	CMD_HITTING_INFO	0x0002
#define	CMD_SHOTING_INFO	0x0003
#define CMD_CUSTOM_INFO		0x0005

#define ARMOR_FRONT			0x00
#define ARMOR_LEFT			0x01
#define ARMOR_REAR			0x02
#define ARMOR_RIGHT			0x03
#define ARMOR_UPt01			0x04
#define ARMOR_UPt02			0x05

#define	BLOOD_DEC_DAMAGE	0x0
#define	BLOOD_DEC_BULLETSPD	0x1
#define	BLOOD_DEC_BULLETFRQ	0x2
#define	BLOOD_DEC_POWEROVER	0x3
#define	BLOOD_DEC_OFFLINE	0x4
#define	BLOOD_DEC_RULEBREAK	0x6
#define	BLOOD_INC_LIFTAREA	0xa
#define	BLOOD_INC_ENGINEER	0xb

/**
 * Structure Area
**/
typedef __packed struct
{
	uint8_t flag;//usablity
	float x;//float as 4-byte
	float y;
	float z;
	float compass;
}tLocData;

typedef __packed struct
{
	uint32_t remainTime;
	uint16_t remainLifeValue;
	float realChassisOutV;
	float realChassisOutA;
	tLocData locData;
	float remainPower;
}tGameInfo;//50Hz

typedef __packed struct
{
	uint8_t weakId:4;
	uint8_t way:4;
	uint16_t value;
}tRealBloodChangedData;

typedef __packed struct
{
	float realBulletShootSpeed;
	float realBulletShootFreq;
	float realGolfShootSpeed;
	float realGolfShootFreq;
}tRealShootData;

typedef __packed struct
{
	float data1;
	float data2;
	float data3;
}tCustomData;//maximum to 200Hz


/**
 * Function Area
**/
unsigned int Verify_CRC8_Check_Sum(unsigned char *pchMessage, unsigned int dwLength);
void Append_CRC8_Check_Sum(unsigned char *pchMessage, unsigned int dwLength);

uint32_t Verify_CRC16_Check_Sum(uint8_t *pchMessage, uint32_t dwLength);
void Append_CRC16_Check_Sum(uint8_t * pchMessage, uint32_t dwLength);

#endif

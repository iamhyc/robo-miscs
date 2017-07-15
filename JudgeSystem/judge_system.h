#ifndef __JUDGE_SYSTEM_H__
#define __JUDGE_SYSTEM_H__

/**
 * Constant Area
**/



/**
 * Structure Area
**/



/**
 * Function Area
**/
unsigned int Verify_CRC8_Check_Sum(unsigned char *pchMessage, unsigned int dwLength);
void Append_CRC8_Check_Sum(unsigned char *pchMessage, unsigned int dwLength);

uint32_t Verify_CRC16_Check_Sum(uint8_t *pchMessage, uint32_t dwLength);
void Append_CRC16_Check_Sum(uint8_t * pchMessage, uint32_t dwLength);


#endif
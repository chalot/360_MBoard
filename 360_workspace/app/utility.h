#ifndef _UTILITY_H_
#define _UTILITY_H_

#include "stm8s.h"

typedef enum {FAILED = 0, PASSED = !FAILED} TestStatus;


TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength);
void ZeroMem(u8* pu8Mem, u32 u32Size);
void Delay_1ms(void);
void Delay(uint32_t nCount);










#endif
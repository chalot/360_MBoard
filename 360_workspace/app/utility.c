#include "utility.h"

/**
  * @brief   Compares two buffers.
  * @param   pBuffer1 First buffer to be compared.
  * @param   pBuffer2 Second buffer to be compared.
  * @param   BufferLength Buffer's length
  * @retval  TestStatus Status of buffer comparison
  * - PASSED: pBuffer1 identical to pBuffer2
  * - FAILED: pBuffer1 differs from pBuffer2
  */
TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength)
{
    while (BufferLength--)
    {
        if (*pBuffer1 != *pBuffer2)
        {
            return FAILED;
        }

        pBuffer1++;
        pBuffer2++;
    }

    return PASSED;
}

/**
  * @brief  Çå³ý»º³åÇø
  * @param  
  * @retval 
  */
void	ZeroMem(u8* pu8Mem, u32 u32Size)
{
	//while(u32Size)
	for (; u32Size>0; u32Size--)
	{
		*pu8Mem++ = 0;
		//u32Size--;
	}
}


void Delay_1ms()
{
	Delay(0x100);
}


void Delay(uint32_t nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}



#include "periph.h"


void Delay_1ms()
{
	Delay(0x4000);
}


void Delay(uint32_t nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}


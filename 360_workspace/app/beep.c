#include "beep.h"
#include "utility.h"

/**
 * ´ò¿ª·äÃùÆ÷
 */
void BEEP_Enable()
{
		BEEP_Cmd(DISABLE);
		Delay(0xFFF);
		BEEP_Init(BEEP_FREQUENCY_4KHZ);
		BEEP_Cmd(ENABLE);
}

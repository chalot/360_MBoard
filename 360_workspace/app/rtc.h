#ifndef __RTC_H__
#define __RTC_H__

#include "stm8s.h"
#include "periph.h"



#define SCLK_HIGH  GPIO_WriteHigh(GPIO_RTC_CLK_PORT,GPIO_RTC_CLK_PIN);
#define SCLK_LOW  GPIO_WriteLow(GPIO_RTC_CLK_PORT,GPIO_RTC_CLK_PIN);

#define RST_HIGH  GPIO_WriteHigh(GPIO_RTC_RST_PORT,GPIO_RTC_RST_PIN);
#define RST_LOW  GPIO_WriteLow(GPIO_RTC_RST_PORT,GPIO_RTC_RST_PIN);

#define DAT_HIGH  GPIO_WriteHigh(GPIO_RTC_DAT_PORT,GPIO_RTC_DAT_PIN);
#define DAT_LOW  GPIO_WriteLow(GPIO_RTC_DAT_PORT,GPIO_RTC_DAT_PIN);


#define DAT_IN	GPIO_Init(GPIO_RTC_DAT_PORT, GPIO_RTC_DAT_PIN, GPIO_MODE_IN_FL_NO_IT);
#define DAT_OUT	GPIO_Init(GPIO_RTC_DAT_PORT, GPIO_RTC_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);

#define DAT_ISHIGH (SET == GPIO_ReadInputPin(GPIO_RTC_DAT_PORT,GPIO_RTC_DAT_PIN))
#define DAT_ISLOW (RESET == GPIO_ReadInputPin(GPIO_RTC_DAT_PORT,GPIO_RTC_DAT_PIN))

/*命令寄存器地址*/
#define DS1302_SECOND_WRITE		0x80
#define DS1302_MINUTE_WRITE 	0x82
#define DS1302_HOUR_WRITE		0x84
#define DS1302_DAY_WRITE		0x86
#define DS1302_MONTH_WRITE		0x88
#define DS1302_WEEK_WRITE		0x8A
#define DS1302_YEAR_WRITE		0x8C
#define DS1302_WP_WRITE 		0x8E
#define DS1302_TC_WRITE 		0x90


#define DS1302_SECOND_READ		0x81
#define DS1302_MINUTE_READ 		0x83
#define DS1302_HOUR_READ 		0x85
#define DS1302_DAY_READ			0x87
#define DS1302_MONTH_READ 		0x89
#define DS1302_WEEK_READ 		0x8B
#define DS1302_YEAR_READ 		0x8D
#define DS1302_WP_READ 	 		0x8F
#define DS1302_TC_READ 			0x91


/*系统时间*/
typedef struct 
{
	u8 u8Year;
	u8 u8Month;
	u8 u8Day;
	u8 u8Hour;
	u8 u8Minute;
	u8 u8Second;
} TIME;

void RTC_Init(void);
void RTC_ReadDate(TIME *pTime);
void RTC_WriteDate(TIME *pTime);
void RTC_SetDefaultTime(void);






#endif

#include "rtc.h"
#include "utility.h"

/*
SCLK (Serial Clock Input) – SCLK is used to synchronize data movement on the serial interface.
I/O (Data Input/Output) – The I/O pin is the bi-directional data pin for the 3-wire interface.
RST (Reset) – The reset signal must be asserted high during a read or a write.


COMMAND BYTE
Each data transfer is initiated by a command byte. 
The MSB(Bit 7) must be a logic 1. If it is 0, writes to the DS1302 will be disabled. 
Bit 6 specifies clock/calendar data if logic 0 or RAM data if logic 1. 
Bits 1 through 5 specify the designated registers to be input or output,  
LSB (bit 0) specifies a write operation (input) if logic 0 or read operation (output) if logic 1. 
The command byte is always input starting with the LSB (bit 0).


RESET AND CLOCK CONTROL
All data transfers are initiated by driving the RST input high. The RST input serves two functions. First,
RST turns on the control logic which allows access to the shift register for the address/command
sequence. Second, the RST signal provides a method of terminating either single byte or multiple byte
data transfer.
A clock cycle is a sequence of a falling edge followed by a rising edge. For data inputs, data must be
valid during the rising edge of the clock and data bits are output on the falling edge of clock. If the RST
input is low all data transfer terminates and the I/O pin goes to a high impedance state. Data transfer is
illustrated in Figure 3. At power–up, RST must be a logic 0 until VCC > 2.0 volts. Also SCLK must be at
a logic 0 when RST is driven to a logic 1 state.
开始数据传输时，RST为高电平。
数据在上升沿有效，输出数据在下降沿输出。


DATA INPUT
SCLK时钟上升沿有效。数据从B0位开始传输。

DATA OUTPUT
数据在SCLK时钟下降沿有效。数据从BO位开始传输。


*/

static void RTC_GPIO_Init(void); 
static void DS1302Write(u8 cmd, u8 dat);
static u8 DS1302Read(u8 cmd);
static u8 DS1302ReadByte(void);
static void DS1302WriteByte(u8 dat);
static void DS1302_burst_Read(unsigned char *rstr);
static void DS1302_burstWrite(unsigned char *wstr);


/**
 * I/O初始化
 *
 */
void RTC_GPIO_Init(void) 
{
	GPIO_Init(GPIO_RTC_CLK_PORT, GPIO_RTC_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIO_RTC_DAT_PORT, GPIO_RTC_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIO_RTC_RST_PORT, GPIO_RTC_RST_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
}


/************************************************
*名称: u8 DS1302Read()
*说明: 先写地址，后读数据
*功能: 从cmd相应地址中读取一个字节的数据
*调用: DS1302WriteByte(),DS1302ReadByte()
*输入: cmd:要写入的控制字节
*输出: dat:读取的数据
*************************************************/
u8 DS1302Read(u8 cmd)
{
	u8 dat = 0;
	
	RST_LOW;//初始 CE线置为0
	Delay(10);
	SCLK_LOW;//初始时钟线置为0
	Delay(10);
	RST_HIGH;//初始 CE置为 1，传输开始
	DS1302WriteByte(cmd);//传输命令字，要读取的时间/日历地址
	dat=DS1302ReadByte();//读取要得到的时间/日期
	SCLK_HIGH;//时钟线拉高
	Delay(10);
	RST_LOW;//读取结束，CE置为 0，结束数据的传输

	return dat;//返回得到的时间/日期
}

/************************************************
*名称: DS1302Write
*说明: 先写地址，后写数据
*功能: 向cmd相应地址中写一个字节的数据
*调用: DS1302WriteByte()
*输入: cmd:要写入的控制字,dat:要写入的数据
*输出: 无
*************************************************/
void DS1302Write(u8 cmd, u8 dat)
{
	RST_LOW; //初始 CE线置为 0
	Delay(10);
	SCLK_LOW; //初始时钟线置为0
	Delay(10);
	RST_HIGH; //初始 CE置为 1，传输开始
	Delay(10);
	DS1302WriteByte(cmd); //传输命令字，要写入的时间/日历地址
	DS1302WriteByte(dat); //写入要修改的时间/日期
	SCLK_HIGH; //时钟线拉高
	Delay(10);
	RST_LOW; //读取结束，CE置为0，结束数据的传输
	Delay(10);
}

/************************************************
*名称: DS1302WriteByte
*说明: 无
*功能: 写入8bit数据
*调用: Delayus()
*输入: dat:要写入的数据
*输出: 无
*************************************************/
void DS1302WriteByte(u8 dat)
{
	u8 i = 0;

	DAT_OUT;
	
	SCLK_LOW;//初始时钟线置为0
	Delay(10);
	
	for(i=0;i<8;i++)//开始传输8个字节的数据
	{
		//取最低位，注意 DS1302的数据和地址都是从最低位开始传输的
		if(dat & 0x01) {
			DAT_HIGH;
		} else {
			DAT_LOW;
		}
		Delay(10);
		
		SCLK_HIGH;//时钟线拉高，制造上升沿，SDA的数据被传输
		Delay(10);

		SCLK_LOW;//时钟线拉低，为下一个上升沿做准备
		dat >>= 1;//数据右移一位，准备传输下一位数据
	}
}
/************************************************
*名称: DS1302ReadByte()
*说明: 无
*功能: 读取8bit的数据
*调用: Delayus()
*输入: 无
*输出: dat:读取的数据
*************************************************/
u8 DS1302ReadByte(void)
{
	u8 i = 0, dat = 0;

	DAT_IN;
	
	Delay(10);
	for(i=0;i<8;i++)
	{
		dat >>= 1;//要返回的数据左移一位
		//当数据线为高时，证明该位数据为 1
		if(DAT_ISHIGH) {
			dat|=0x80;//要传输数据的当前值置为 1,若不是,则为 0
		}
		SCLK_HIGH;//拉高时钟线
		Delay(10);
		SCLK_LOW;//制造下降沿
		Delay(10);
	}

	return dat;//返回读取出的数据
}

/*---------------------------------------------------------------------------------------------------
函数名称: DS1302_NReadRam(unsigned char *rstr)
函数功能: 多字节突发模式读RAM，
DS1302_NRRAM 一次可进行31个片内 RAM单元读
输入参数: *rstr：存放读到的 N个数据
输出参数： 无
------------------------------------------------------------------------------------------------------*/
void DS1302_burst_Read(unsigned char *rstr)
{
#if 0
	unsigned char i;

	DAT_IN;

	RST_LOW;
	SCLK_LOW;
	RST_HIGH; //CE拉高，传输开始
	DS1302WriteByte(0XFF); // 写0XFF，多字节突发方式读 RAM具体细节见上一节

	for(i=0;i<31;i++) //连续读取个31 字节
	{
		*rstr=DS1302ReadByte(address) ;//此处的 ADDRESS指的是你需要进行连续读取的地址
		rstr++;
	}
	RST_LOW;//CE信号拉低，传输结束
	SCLK_HIGH;
#endif
}
/*---------------------------------------------------------------------------------------------------------
函数名称: DS1302_NReadRam(unsigned char *rstr)
函数功能: 多字节突发模式写RAM，
DS1302_NRRAM 一次可进行31个片内 RAM单元写
输入参数: *wstr：要被写入的N个数据
输出参数： 无
---------------------------------------------------------------------------------------------------------------*/
void DS1302_burstWrite(unsigned char *wstr)
{
#if 0
	unsigned char i;
	unsigned char *tmpstr;
	tmpstr=wstr;
	
	DS1302Write(0x8e, 0x00);//写保护关
	RST_LOW;
	SCLK_LOW;
	RST_HIGH;
	DS1302WriteByte(0XFE); //写 0XFE ， 多 字 节 突 发 方 式 写 RAM,具 体 细 节 见 上 节
	for(i=0;i<31;i++) //连续写入31 字节
	{
		DS1302WriteByte(*tmpstr) ;
		tmpstr++;
	}
	RST_LOW;
	SCLK_HIGH;
	DS1302Write(0x8e,0x80); //开写保护
#endif
}

void RTC_Init(void)
{
	RTC_GPIO_Init();
}

/************************************************
*名称: void Init_DS1302(void)
*说明: 给1302写入一个初始的值
*功能: 写入日期，和时钟的值
*调用: DS1302Write（）
*输入: 无
*输出: 无
*************************************************/
void RTC_SetDefaultTime(void)
{
	/*初始化系统时间 2016-09-14 15:49:30*/
	u8 u8Year = 16;
	u8 u8Month = 9;
	u8 u8Day = 14;
	u8 u8Hour = 15;
	u8 u8Minute = 49;
	u8 u8Second = 30;


	DS1302Write(DS1302_WP_WRITE,0x00);//关闭写保护

	DS1302Write(DS1302_SECOND_WRITE,(u8Second/10)<<4|(u8Second%10));
	DS1302Write(DS1302_MINUTE_WRITE,(u8Minute/10)<<4|(u8Minute%10));
	DS1302Write(DS1302_HOUR_WRITE,(u8Hour/10)<<4|(u8Hour%10)); //24小时模式
	DS1302Write(DS1302_DAY_WRITE,(u8Day/10)<<4|(u8Day%10)); 
	DS1302Write(DS1302_MONTH_WRITE,(u8Month/10)<<4|(u8Month%10));
	DS1302Write(DS1302_YEAR_WRITE,(u8Year/10)<<4|(u8Year%10));

	//DS1302Write(0x90,0x01); //充电
	DS1302Write(DS1302_WP_WRITE,0x80); //恢复写保护

}


//----------------------------------------------------------------
// 函数名称：intMonthDays(int year, int month)
// 函数功能：根据输入的年号和月份，返回该月的天数
// 入口参数：int year, int month, int day
// 出口参数：(int)sum%7
//-----------------------------------------------------------------
int MonthDays(int year, int month)
{
	switch(month)
	{
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
	case 12: return 31; //一三五七八十腊，三十一天永不差
	case 4:
	case 6:
	case 9:
	case 11: return 30;//其他月份自然是30了
	case 2://计算闰月
		if(year%4==0 && year%100!=0 || year%400==0)
			return 29;
	else
		return 28;
	default:
		return 0;
	}
}


//读取日期
void RTC_ReadDate(TIME *pTime)
{
	u8 u8Year = 0;
	u8 u8Month = 0;
	u8 u8Day = 0;
	u8 u8Hour = 0;
	u8 u8Minute = 0;
	u8 u8Second = 0;
	u8 ReadValue = 0;

	ReadValue = DS1302Read(0x81);   
    u8Second = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);

    ReadValue = DS1302Read(0x83);  
    u8Minute = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
 
    ReadValue = DS1302Read(0x85);  
    u8Hour = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F); 

    ReadValue = DS1302Read(0x87);  
    u8Day = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F); 

    ReadValue = DS1302Read(0x89);  
    u8Month = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
 
    ReadValue = DS1302Read(0x8d);  
    u8Year = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F); 

	pTime->u8Year = u8Year;
	pTime->u8Month = u8Month;
	pTime->u8Day = u8Day;
	pTime->u8Hour = u8Hour;
	pTime->u8Minute = u8Minute;
	pTime->u8Second = u8Second;
}

void RTC_WriteDate(TIME *pTime)
{

	DS1302Write(DS1302_WP_WRITE,0x00);//关闭写保护

	DS1302Write(DS1302_SECOND_WRITE,(pTime->u8Second/10)<<4|(pTime->u8Second%10));
	DS1302Write(DS1302_MINUTE_WRITE,(pTime->u8Minute/10)<<4|(pTime->u8Minute%10));
	DS1302Write(DS1302_HOUR_WRITE,(pTime->u8Hour/10)<<4|(pTime->u8Hour%10)); //24小时模式
	DS1302Write(DS1302_DAY_WRITE,(pTime->u8Day/10)<<4|(pTime->u8Day%10)); 
	DS1302Write(DS1302_MONTH_WRITE,(pTime->u8Month/10)<<4|(pTime->u8Month%10));
	DS1302Write(DS1302_YEAR_WRITE,(pTime->u8Year/10)<<4|(pTime->u8Year%10));

	//DS1302Write(0x90,0x01); //充电
	DS1302Write(DS1302_WP_WRITE,0x80); //恢复写保护
}



#include "rtc.h"
#include "utility.h"

/*
SCLK (Serial Clock Input) �C SCLK is used to synchronize data movement on the serial interface.
I/O (Data Input/Output) �C The I/O pin is the bi-directional data pin for the 3-wire interface.
RST (Reset) �C The reset signal must be asserted high during a read or a write.


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
illustrated in Figure 3. At power�Cup, RST must be a logic 0 until VCC > 2.0 volts. Also SCLK must be at
a logic 0 when RST is driven to a logic 1 state.
��ʼ���ݴ���ʱ��RSTΪ�ߵ�ƽ��
��������������Ч������������½��������


DATA INPUT
SCLKʱ����������Ч�����ݴ�B0λ��ʼ���䡣

DATA OUTPUT
������SCLKʱ���½�����Ч�����ݴ�BOλ��ʼ���䡣


*/

static void RTC_GPIO_Init(void); 
static void DS1302Write(u8 cmd, u8 dat);
static u8 DS1302Read(u8 cmd);
static u8 DS1302ReadByte(void);
static void DS1302WriteByte(u8 dat);
static void DS1302_burst_Read(unsigned char *rstr);
static void DS1302_burstWrite(unsigned char *wstr);


/**
 * I/O��ʼ��
 *
 */
void RTC_GPIO_Init(void) 
{
	GPIO_Init(GPIO_RTC_CLK_PORT, GPIO_RTC_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIO_RTC_DAT_PORT, GPIO_RTC_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
	GPIO_Init(GPIO_RTC_RST_PORT, GPIO_RTC_RST_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
}


/************************************************
*����: u8 DS1302Read()
*˵��: ��д��ַ���������
*����: ��cmd��Ӧ��ַ�ж�ȡһ���ֽڵ�����
*����: DS1302WriteByte(),DS1302ReadByte()
*����: cmd:Ҫд��Ŀ����ֽ�
*���: dat:��ȡ������
*************************************************/
u8 DS1302Read(u8 cmd)
{
	u8 dat = 0;
	
	RST_LOW;//��ʼ CE����Ϊ0
	Delay(10);
	SCLK_LOW;//��ʼʱ������Ϊ0
	Delay(10);
	RST_HIGH;//��ʼ CE��Ϊ 1�����俪ʼ
	DS1302WriteByte(cmd);//���������֣�Ҫ��ȡ��ʱ��/������ַ
	dat=DS1302ReadByte();//��ȡҪ�õ���ʱ��/����
	SCLK_HIGH;//ʱ��������
	Delay(10);
	RST_LOW;//��ȡ������CE��Ϊ 0���������ݵĴ���

	return dat;//���صõ���ʱ��/����
}

/************************************************
*����: DS1302Write
*˵��: ��д��ַ����д����
*����: ��cmd��Ӧ��ַ��дһ���ֽڵ�����
*����: DS1302WriteByte()
*����: cmd:Ҫд��Ŀ�����,dat:Ҫд�������
*���: ��
*************************************************/
void DS1302Write(u8 cmd, u8 dat)
{
	RST_LOW; //��ʼ CE����Ϊ 0
	Delay(10);
	SCLK_LOW; //��ʼʱ������Ϊ0
	Delay(10);
	RST_HIGH; //��ʼ CE��Ϊ 1�����俪ʼ
	Delay(10);
	DS1302WriteByte(cmd); //���������֣�Ҫд���ʱ��/������ַ
	DS1302WriteByte(dat); //д��Ҫ�޸ĵ�ʱ��/����
	SCLK_HIGH; //ʱ��������
	Delay(10);
	RST_LOW; //��ȡ������CE��Ϊ0���������ݵĴ���
	Delay(10);
}

/************************************************
*����: DS1302WriteByte
*˵��: ��
*����: д��8bit����
*����: Delayus()
*����: dat:Ҫд�������
*���: ��
*************************************************/
void DS1302WriteByte(u8 dat)
{
	u8 i = 0;

	DAT_OUT;
	
	SCLK_LOW;//��ʼʱ������Ϊ0
	Delay(10);
	
	for(i=0;i<8;i++)//��ʼ����8���ֽڵ�����
	{
		//ȡ���λ��ע�� DS1302�����ݺ͵�ַ���Ǵ����λ��ʼ�����
		if(dat & 0x01) {
			DAT_HIGH;
		} else {
			DAT_LOW;
		}
		Delay(10);
		
		SCLK_HIGH;//ʱ�������ߣ����������أ�SDA�����ݱ�����
		Delay(10);

		SCLK_LOW;//ʱ�������ͣ�Ϊ��һ����������׼��
		dat >>= 1;//��������һλ��׼��������һλ����
	}
}
/************************************************
*����: DS1302ReadByte()
*˵��: ��
*����: ��ȡ8bit������
*����: Delayus()
*����: ��
*���: dat:��ȡ������
*************************************************/
u8 DS1302ReadByte(void)
{
	u8 i = 0, dat = 0;

	DAT_IN;
	
	Delay(10);
	for(i=0;i<8;i++)
	{
		dat >>= 1;//Ҫ���ص���������һλ
		//��������Ϊ��ʱ��֤����λ����Ϊ 1
		if(DAT_ISHIGH) {
			dat|=0x80;//Ҫ�������ݵĵ�ǰֵ��Ϊ 1,������,��Ϊ 0
		}
		SCLK_HIGH;//����ʱ����
		Delay(10);
		SCLK_LOW;//�����½���
		Delay(10);
	}

	return dat;//���ض�ȡ��������
}

/*---------------------------------------------------------------------------------------------------
��������: DS1302_NReadRam(unsigned char *rstr)
��������: ���ֽ�ͻ��ģʽ��RAM��
DS1302_NRRAM һ�οɽ���31��Ƭ�� RAM��Ԫ��
�������: *rstr����Ŷ����� N������
��������� ��
------------------------------------------------------------------------------------------------------*/
void DS1302_burst_Read(unsigned char *rstr)
{
#if 0
	unsigned char i;

	DAT_IN;

	RST_LOW;
	SCLK_LOW;
	RST_HIGH; //CE���ߣ����俪ʼ
	DS1302WriteByte(0XFF); // д0XFF�����ֽ�ͻ����ʽ�� RAM����ϸ�ڼ���һ��

	for(i=0;i<31;i++) //������ȡ��31 �ֽ�
	{
		*rstr=DS1302ReadByte(address) ;//�˴��� ADDRESSָ��������Ҫ����������ȡ�ĵ�ַ
		rstr++;
	}
	RST_LOW;//CE�ź����ͣ��������
	SCLK_HIGH;
#endif
}
/*---------------------------------------------------------------------------------------------------------
��������: DS1302_NReadRam(unsigned char *rstr)
��������: ���ֽ�ͻ��ģʽдRAM��
DS1302_NRRAM һ�οɽ���31��Ƭ�� RAM��Ԫд
�������: *wstr��Ҫ��д���N������
��������� ��
---------------------------------------------------------------------------------------------------------------*/
void DS1302_burstWrite(unsigned char *wstr)
{
#if 0
	unsigned char i;
	unsigned char *tmpstr;
	tmpstr=wstr;
	
	DS1302Write(0x8e, 0x00);//д������
	RST_LOW;
	SCLK_LOW;
	RST_HIGH;
	DS1302WriteByte(0XFE); //д 0XFE �� �� �� �� ͻ �� �� ʽ д RAM,�� �� ϸ �� �� �� ��
	for(i=0;i<31;i++) //����д��31 �ֽ�
	{
		DS1302WriteByte(*tmpstr) ;
		tmpstr++;
	}
	RST_LOW;
	SCLK_HIGH;
	DS1302Write(0x8e,0x80); //��д����
#endif
}

void RTC_Init(void)
{
	RTC_GPIO_Init();
}

/************************************************
*����: void Init_DS1302(void)
*˵��: ��1302д��һ����ʼ��ֵ
*����: д�����ڣ���ʱ�ӵ�ֵ
*����: DS1302Write����
*����: ��
*���: ��
*************************************************/
void RTC_SetDefaultTime(void)
{
	/*��ʼ��ϵͳʱ�� 2016-09-14 15:49:30*/
	u8 u8Year = 16;
	u8 u8Month = 9;
	u8 u8Day = 14;
	u8 u8Hour = 15;
	u8 u8Minute = 49;
	u8 u8Second = 30;


	DS1302Write(DS1302_WP_WRITE,0x00);//�ر�д����

	DS1302Write(DS1302_SECOND_WRITE,(u8Second/10)<<4|(u8Second%10));
	DS1302Write(DS1302_MINUTE_WRITE,(u8Minute/10)<<4|(u8Minute%10));
	DS1302Write(DS1302_HOUR_WRITE,(u8Hour/10)<<4|(u8Hour%10)); //24Сʱģʽ
	DS1302Write(DS1302_DAY_WRITE,(u8Day/10)<<4|(u8Day%10)); 
	DS1302Write(DS1302_MONTH_WRITE,(u8Month/10)<<4|(u8Month%10));
	DS1302Write(DS1302_YEAR_WRITE,(u8Year/10)<<4|(u8Year%10));

	//DS1302Write(0x90,0x01); //���
	DS1302Write(DS1302_WP_WRITE,0x80); //�ָ�д����

}


//----------------------------------------------------------------
// �������ƣ�intMonthDays(int year, int month)
// �������ܣ������������ź��·ݣ����ظ��µ�����
// ��ڲ�����int year, int month, int day
// ���ڲ�����(int)sum%7
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
	case 12: return 31; //һ�����߰�ʮ������ʮһ��������
	case 4:
	case 6:
	case 9:
	case 11: return 30;//�����·���Ȼ��30��
	case 2://��������
		if(year%4==0 && year%100!=0 || year%400==0)
			return 29;
	else
		return 28;
	default:
		return 0;
	}
}


//��ȡ����
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

	DS1302Write(DS1302_WP_WRITE,0x00);//�ر�д����

	DS1302Write(DS1302_SECOND_WRITE,(pTime->u8Second/10)<<4|(pTime->u8Second%10));
	DS1302Write(DS1302_MINUTE_WRITE,(pTime->u8Minute/10)<<4|(pTime->u8Minute%10));
	DS1302Write(DS1302_HOUR_WRITE,(pTime->u8Hour/10)<<4|(pTime->u8Hour%10)); //24Сʱģʽ
	DS1302Write(DS1302_DAY_WRITE,(pTime->u8Day/10)<<4|(pTime->u8Day%10)); 
	DS1302Write(DS1302_MONTH_WRITE,(pTime->u8Month/10)<<4|(pTime->u8Month%10));
	DS1302Write(DS1302_YEAR_WRITE,(pTime->u8Year/10)<<4|(pTime->u8Year%10));

	//DS1302Write(0x90,0x01); //���
	DS1302Write(DS1302_WP_WRITE,0x80); //�ָ�д����
}



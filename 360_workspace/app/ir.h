#ifndef _IR_H_
#define _IR_H_

/***********************************************************
按键码：
确认:					0xff00bf00
上：					0xf906bf00
下：					0xfa05bf00
左：					0xf20dbf00
右：					0xf10ebf00
返回：				0xf708bf00
电源：				0xfd02bf00
（左视）AV1：	0xe11ebf00
（右视）AV2：	0xe21dbf00
（前视）AV3：	0xf609bf00
（后视）AV4：	0xf50abf00

编码格式：
操作码反码 + 操作码 + 后缀（都是bf00）
如，“上” 反码=f9 操作码=06

位值0(Bit-0)  ：H(=0.56 ms) + L(=0.56 ms) 
位值1(Bit-1)  ：H(=0.56 ms) + L(=1.68 ms) 

输出一帧之最长时序约为269.8ms

根据实际接收波形，分析得到发送规则：

启动码	-----	9ms低电平+4.5ms高电平


实际发送电平：
Bit0：L(=0.56 ms) + H(=0.56 ms) 
Bit1：L(=0.56 ms) + H(=1.68 ms) 

发送时，逆序发送，从低字节向高字节，从低位向高位

以“电源“按键为例：
位串：0xfd02bf00
原码：1111 1101 0000 0010 1011 1111 0000 0000
实际发送位串，也就是接收顺序：0000 0000 1111 1101 0100 0000 1011 1111
因此解析位串时，也要逆序解析


***********************************************************/

#include "stm8s.h"

/*按键码*/
#define IR_CMD_OK 			0x00	/*确认:					0xff00bf00 	*/
#define IR_CMD_UP 			0x06	/*上：					0xf906bf00 	*/
#define IR_CMD_DOWN 		0x05	/*下：					0xfa05bf00 	*/
#define IR_CMD_LEFT 		0x0d	/*左：					0xf20dbf00 	*/
#define IR_CMD_RIGHT 		0x0e	/*右：					0xf10ebf00 	*/
#define IR_CMD_BACK 		0x08	/*返回：				0xf708bf00 	*/
#define IR_CMD_POWER 		0x02	/*电源：				0xfd02bf00 	*/
#define IR_CMD_LF_VIEW 		0x1e	/*（左视）AV1：	0xe11ebf00 	*/
#define IR_CMD_RT_VIEW 		0x1d	/*（右视）AV2：	0xe21dbf00 	*/
#define IR_CMD_FR_VIEW 		0x09	/*（前视）AV3：	0xf609bf00 	*/
#define IR_CMD_BK_VIEW 		0x0a	/*（后视）AV4：	0xf50abf00 	*/


#define		_BUFFER_LENGTH_IR_Rx_			20


#define 	_IR_CODE_TIME_START				13500		//启动码-----9ms低电平+4.5ms高电平
//#define 	IR_CODE_TIME_SEQUENTIAL			11500		//连发码-----9ms低电平+2.5ms高电平
#define 	_IR_CODE_TIME_0					1120		//"0"-----0.56ms低电平+0.56ms高电平
#define		_IR_CODE_TIME_1					2240		//"1"-----0.56ms低电平+1.68ms高电平
#define		_IR_CODE_TIME_BIAS				300			//码型格式时长偏移 = 0.3ms
#define		_IR_DATA_LIMITATION_TIME		20000		//启动码、数据码红外极限时间

//如果超过这个时间，有错，主动复位
#define		_IR_INTERVAL_LIMITATION_TIME		120000		//数据接收完到连发码之间的时间间隔、以及多个连发码之间的时间间隔

#if 0
//红外遥控器码型格式时间长度（单位：us）
#define 	_IR_CODE_TIME_START					13500		//启动码-----9ms低电平+4.5ms高电平
#define 	_IR_CODE_TIME_SEQUENTIAL			11500		//连发码-----9ms低电平+2.5ms高电平
#define 	_IR_CODE_TIME_0						1125		//"0"-----0.625ms低电平+0.5ms高电平
#define		_IR_CODE_TIME_1						2250		//"1"-----0.625ms低电平+1.625ms高电平
#define		_IR_CODE_TIME_BIAS					300			//码型格式时长偏移 = 0.3ms

#define		_IR_DATA_LIMITATION_TIME			20000		//启动码、数据码红外极限时间

//如果超过这个时间，有错，主动复位
#define		_IR_INTERVAL_LIMITATION_TIME		120000		//数据接收完到连发码之间的时间间隔、以及多个连发码之间的时间间隔
#endif

//红外遥控器编码接收状态
#define		_IR_RECEIVEDSTATUS_IDLE					0			//接收空闲
#define		_IR_RECEIVEDSTATUS_START				1			//接收启动码
#define		_IR_RECEIVEDSTATUS_32BITSDATA		2			//接收32位数据
#define		_IR_RECEIVEDSTATUS_INTERVAL			3			//接收数据结束
#define		_IR_RECEIVE_TIMEOUT_						50			//接收超时，原20,200ms

#if 0
#define		_IR_RECEIVEDSTATUS_IDLE					0			//接收空闲
#define		_IR_RECEIVEDSTATUS_START				1			//接收启动码
#define		_IR_RECEIVEDSTATUS_32BITSDATA		2			//接收32位数据
//#define		_IR_RECEIVEDSTATUS_CONTINUE			3			//接收连发码
#define		_IR_RECEIVEDSTATUS_INTERVAL			4			//接收数据结束
#define		_IR_RECEIVE_TIMEOUT_						20			//接收超时，200ms
#endif

//红外遥控器接收状态机
typedef struct {
	u8 u8ReceivedStatus;					//当前的接收状态
	u8 fCodeTimeEn :1;						//码型时长使能
	u8 fFirstContinue :1;					//第一个连发码
	u8 fReserved :6;
	u32 u32Recieved32Bits;					//接收的32位数据

	u8 u8BitsLength;						//接收的数据位长度
	u8 u8RecievedCode;						//接收到的操作码

	u32 u32CodeTime;						//码型格式时长

	u8 u8Write_Rx;							//接收缓冲区写指针
	u8 u8Read_Rx;							//接收缓冲区读指针
	u8 u8Available_Rx;						//接收缓冲区有效字节数
	u8 *pu8Buffer_Rx;						//接收缓冲区首指针

	u8 u8ReceiveTimeout;					//接收超时，500ms接收超时
} tIRFSMType;

extern void IR_Init(void);
extern void IR_Process(void);
extern void Isr_IR_Timeout10ms(void);
extern void Isr_IR_Timeout100us(void);
extern void ISR_IRReceive(void);

#endif /* IR_H_ */



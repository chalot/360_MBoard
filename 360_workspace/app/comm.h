#ifndef _COMM_H_
#define _COMM_H_

#include "stm8s.h"
#include "key.h"

typedef enum _eMSG_TYPE {
	MSG_FRONT = 0,		/*方向前*/
	MSG_FRONT_FULLVIEW,	/*方向前-全屏*/
	MSG_LEFT,			/*方向左*/
	MSG_LEFT_FULLVIEW,	/*方向左-全屏*/
	MSG_RIGHT,   		/*方向右*/
	MSG_RIGHT_FULLVIEW,	/*方向右-全屏*/
	MSG_REAR,			/*倒车*/
	MSG_ALLVIEW,		/*四路视频同时显示*/
	MSG_SNAPSHOT,	/*标定-摄像头拍照*/
	MSG_CALIBRATING,	/*标定-读取标定参数送给DSP*/
	MSG_SLEEP,			/*休眠*/
	MSG_MENU_BACK,		/*遥控器消息：返回*/
	MSG_MENU_LEFT,	/*遥控器消息：左*/
	MSG_MENU_RIGHT,	/*遥控器消息：右*/
	MSG_MENU_UP,	/*遥控器消息：上*/
	MSG_MENU_DOWN,	/*遥控器消息：下*/
	MSG_MENU_OK,	/*遥控器消息：确定*/
	MSG_MENU_POWER/*遥控器消息：电源*/
} eMSG_TYPE;


#define  CMD_HEAD	0x55	/*控制命令，MCU->A8*/
#define  ACK_HEAD	0xAA	/*应答命令，A8->MCU*/

/*命令执行结果*/
//typedef enum {
//	RET_OK = 1,  	/*成功*/
//	RET_FAIL = -1, 	/*失败*/
//	RET_TOUT = 0, 		/*超时*/
//} eRET;

/*控制命令数据格式*/
typedef struct _tMSG_CMD {
	u8 head;		/*消息头，0x55*/
	u8 cmd;			/*命令类型*/
	u8 param[4];	/*命令参数*/
	u8 checksum;	/*校验和*/
} tMSG_CMD;

/*应答命令数据格式*/
typedef struct _tMSG_ACK {
	u8 head;		/*消息头，0xAA*/
	u8 cmd;			/*命令类型*/
	u8 ret;			/*命令执行结果*/
	u8 checksum;	/*校验和*/
} tMSG_ACK;


#define BUF_SIZE	50

///循环数组
typedef struct  _tRINGBUF {
	u8 buf[BUF_SIZE];	///数组缓区
	u8 read;			///读位置
	u8 write;			///写位置

} tRINGBUF;


int UART_Init(void);
u8 CalChecksum(u8 *data, u8 u8Len);
void COMM_Init(void);
void COMM_Process(void);
void COMM_Lowlevel_Config(void);

void COMM_RequestSendCommand(eKEYTYPE eKey, eKEYSTATE eState);



#endif

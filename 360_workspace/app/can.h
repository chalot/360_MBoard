#ifndef CAN_H
#define CAN_H

#include "stm8s.h"
#include "stm8s_conf.h"


/******************************************************************************
苏州清华CAN通信协议

总线通讯速率 = 500K bits/sec，CAN ID使用标准帧
******************************************************************************/
/*报文1：前车距离,100ms*/
#define	ID_DIST		0x112
#define K_SCALE		0.1
#define D_OFFSET	0

/*报文2：报警等级,100ms*/
#define	ID_WARN		0x113
#define	WARN_NONE 	0	/*无目标*/
#define WARN_SAFE	1	/*目标安全*/
#define WARN_L_1	2	/*报警等级1*/
#define WARN_L_2	3	/*报警等级2*/
#define WARN_L_4	4	/*短距离报警*/



/* CAN帧接收队列容量 */
#define CAN_MSG_QUEUE_LEN	50

/*回复CAN信息*/
//#define CAN_ECHO

#pragma pack(1)

/* CAN帧消息结构体 */
typedef struct CAN_MSGTag
{
	u32	u32ID;
	u8  u8DLC;
	u8  Data[8];
} tCAN_MSG;

#pragma pack()

void CAN_Process(void);
void CAN_Initialize(void);
int CAN_AddMsg(tCAN_MSG *ptCAN_MSG);
int CAN_GetMsg(tCAN_MSG *ptCAN_MSG);
void CAN_TestSend(void);
void CAN_TestRecieve(void);


#endif

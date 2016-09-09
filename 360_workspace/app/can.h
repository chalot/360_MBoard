#ifndef CAN_H
#define CAN_H

#include "stm8s.h"
#include "stm8s_conf.h"


/******************************************************************************
�����廪CANͨ��Э��

����ͨѶ���� = 500K bits/sec��CAN IDʹ�ñ�׼֡
******************************************************************************/
/*����1��ǰ������,100ms*/
#define	ID_DIST		0x112
#define K_SCALE		0.1
#define D_OFFSET	0

/*����2�������ȼ�,100ms*/
#define	ID_WARN		0x113
#define	WARN_NONE 	0	/*��Ŀ��*/
#define WARN_SAFE	1	/*Ŀ�갲ȫ*/
#define WARN_L_1	2	/*�����ȼ�1*/
#define WARN_L_2	3	/*�����ȼ�2*/
#define WARN_L_4	4	/*�̾��뱨��*/



/* CAN֡���ն������� */
#define CAN_MSG_QUEUE_LEN	50

/*�ظ�CAN��Ϣ*/
//#define CAN_ECHO

#pragma pack(1)

/* CAN֡��Ϣ�ṹ�� */
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

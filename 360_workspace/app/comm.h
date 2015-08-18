#ifndef _COMM_H_
#define _COMM_H_

#include "stm8s.h"
#include "key.h"

typedef enum _eMSG_TYPE {
	MSG_FRONT = 0,		/*����ǰ*/
	MSG_FRONT_FULLVIEW,	/*����ǰ-ȫ��*/
	MSG_LEFT,			/*������*/
	MSG_LEFT_FULLVIEW,	/*������-ȫ��*/
	MSG_RIGHT,   		/*������*/
	MSG_RIGHT_FULLVIEW,	/*������-ȫ��*/
	MSG_REAR,			/*����*/
	MSG_ALLVIEW,		/*��·��Ƶͬʱ��ʾ*/
	MSG_SNAPSHOT,	/*�궨-����ͷ����*/
	MSG_CALIBRATING,	/*�궨-��ȡ�궨�����͸�DSP*/
	MSG_SLEEP,			/*����*/
	MSG_MENU_BACK,		/*ң������Ϣ������*/
	MSG_MENU_LEFT,	/*ң������Ϣ����*/
	MSG_MENU_RIGHT,	/*ң������Ϣ����*/
	MSG_MENU_UP,	/*ң������Ϣ����*/
	MSG_MENU_DOWN,	/*ң������Ϣ����*/
	MSG_MENU_OK,	/*ң������Ϣ��ȷ��*/
	MSG_MENU_POWER/*ң������Ϣ����Դ*/
} eMSG_TYPE;


#define  CMD_HEAD	0x55	/*�������MCU->A8*/
#define  ACK_HEAD	0xAA	/*Ӧ�����A8->MCU*/

/*����ִ�н��*/
//typedef enum {
//	RET_OK = 1,  	/*�ɹ�*/
//	RET_FAIL = -1, 	/*ʧ��*/
//	RET_TOUT = 0, 		/*��ʱ*/
//} eRET;

/*�����������ݸ�ʽ*/
typedef struct _tMSG_CMD {
	u8 head;		/*��Ϣͷ��0x55*/
	u8 cmd;			/*��������*/
	u8 param[4];	/*�������*/
	u8 checksum;	/*У���*/
} tMSG_CMD;

/*Ӧ���������ݸ�ʽ*/
typedef struct _tMSG_ACK {
	u8 head;		/*��Ϣͷ��0xAA*/
	u8 cmd;			/*��������*/
	u8 ret;			/*����ִ�н��*/
	u8 checksum;	/*У���*/
} tMSG_ACK;


#define BUF_SIZE	50

///ѭ������
typedef struct  _tRINGBUF {
	u8 buf[BUF_SIZE];	///���黺��
	u8 read;			///��λ��
	u8 write;			///дλ��

} tRINGBUF;


int UART_Init(void);
u8 CalChecksum(u8 *data, u8 u8Len);
void COMM_Init(void);
void COMM_Process(void);
void COMM_Lowlevel_Config(void);

void COMM_RequestSendCommand(eKEYTYPE eKey, eKEYSTATE eState);



#endif

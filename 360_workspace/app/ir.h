#ifndef _IR_H_
#define _IR_H_

/***********************************************************
�����룺
ȷ��:					0xff00bf00
�ϣ�					0xf906bf00
�£�					0xfa05bf00
��					0xf20dbf00
�ң�					0xf10ebf00
���أ�				0xf708bf00
��Դ��				0xfd02bf00
�����ӣ�AV1��	0xe11ebf00
�����ӣ�AV2��	0xe21dbf00
��ǰ�ӣ�AV3��	0xf609bf00
�����ӣ�AV4��	0xf50abf00

�����ʽ��
�����뷴�� + ������ + ��׺������bf00��
�磬���ϡ� ����=f9 ������=06

λֵ0(Bit-0)  ��H(=0.56 ms) + L(=0.56 ms) 
λֵ1(Bit-1)  ��H(=0.56 ms) + L(=1.68 ms) 

���һ֮֡�ʱ��ԼΪ269.8ms

����ʵ�ʽ��ղ��Σ������õ����͹���

������	-----	9ms�͵�ƽ+4.5ms�ߵ�ƽ


ʵ�ʷ��͵�ƽ��
Bit0��L(=0.56 ms) + H(=0.56 ms) 
Bit1��L(=0.56 ms) + H(=1.68 ms) 

����ʱ�������ͣ��ӵ��ֽ�����ֽڣ��ӵ�λ���λ

�ԡ���Դ������Ϊ����
λ����0xfd02bf00
ԭ�룺1111 1101 0000 0010 1011 1111 0000 0000
ʵ�ʷ���λ����Ҳ���ǽ���˳��0000 0000 1111 1101 0100 0000 1011 1111
��˽���λ��ʱ��ҲҪ�������


***********************************************************/

#include "stm8s.h"

/*������*/
#define IR_CMD_OK 			0x00	/*ȷ��:					0xff00bf00 	*/
#define IR_CMD_UP 			0x06	/*�ϣ�					0xf906bf00 	*/
#define IR_CMD_DOWN 		0x05	/*�£�					0xfa05bf00 	*/
#define IR_CMD_LEFT 		0x0d	/*��					0xf20dbf00 	*/
#define IR_CMD_RIGHT 		0x0e	/*�ң�					0xf10ebf00 	*/
#define IR_CMD_BACK 		0x08	/*���أ�				0xf708bf00 	*/
#define IR_CMD_POWER 		0x02	/*��Դ��				0xfd02bf00 	*/
#define IR_CMD_LF_VIEW 		0x1e	/*�����ӣ�AV1��	0xe11ebf00 	*/
#define IR_CMD_RT_VIEW 		0x1d	/*�����ӣ�AV2��	0xe21dbf00 	*/
#define IR_CMD_FR_VIEW 		0x09	/*��ǰ�ӣ�AV3��	0xf609bf00 	*/
#define IR_CMD_BK_VIEW 		0x0a	/*�����ӣ�AV4��	0xf50abf00 	*/


#define		_BUFFER_LENGTH_IR_Rx_			20


#define 	_IR_CODE_TIME_START				13500		//������-----9ms�͵�ƽ+4.5ms�ߵ�ƽ
//#define 	IR_CODE_TIME_SEQUENTIAL			11500		//������-----9ms�͵�ƽ+2.5ms�ߵ�ƽ
#define 	_IR_CODE_TIME_0					1120		//"0"-----0.56ms�͵�ƽ+0.56ms�ߵ�ƽ
#define		_IR_CODE_TIME_1					2240		//"1"-----0.56ms�͵�ƽ+1.68ms�ߵ�ƽ
#define		_IR_CODE_TIME_BIAS				300			//���͸�ʽʱ��ƫ�� = 0.3ms
#define		_IR_DATA_LIMITATION_TIME		20000		//�����롢��������⼫��ʱ��

//����������ʱ�䣬�д�������λ
#define		_IR_INTERVAL_LIMITATION_TIME		120000		//���ݽ����굽������֮���ʱ�������Լ����������֮���ʱ����

#if 0
//����ң�������͸�ʽʱ�䳤�ȣ���λ��us��
#define 	_IR_CODE_TIME_START					13500		//������-----9ms�͵�ƽ+4.5ms�ߵ�ƽ
#define 	_IR_CODE_TIME_SEQUENTIAL			11500		//������-----9ms�͵�ƽ+2.5ms�ߵ�ƽ
#define 	_IR_CODE_TIME_0						1125		//"0"-----0.625ms�͵�ƽ+0.5ms�ߵ�ƽ
#define		_IR_CODE_TIME_1						2250		//"1"-----0.625ms�͵�ƽ+1.625ms�ߵ�ƽ
#define		_IR_CODE_TIME_BIAS					300			//���͸�ʽʱ��ƫ�� = 0.3ms

#define		_IR_DATA_LIMITATION_TIME			20000		//�����롢��������⼫��ʱ��

//����������ʱ�䣬�д�������λ
#define		_IR_INTERVAL_LIMITATION_TIME		120000		//���ݽ����굽������֮���ʱ�������Լ����������֮���ʱ����
#endif

//����ң�����������״̬
#define		_IR_RECEIVEDSTATUS_IDLE					0			//���տ���
#define		_IR_RECEIVEDSTATUS_START				1			//����������
#define		_IR_RECEIVEDSTATUS_32BITSDATA		2			//����32λ����
#define		_IR_RECEIVEDSTATUS_INTERVAL			3			//�������ݽ���
#define		_IR_RECEIVE_TIMEOUT_						50			//���ճ�ʱ��ԭ20,200ms

#if 0
#define		_IR_RECEIVEDSTATUS_IDLE					0			//���տ���
#define		_IR_RECEIVEDSTATUS_START				1			//����������
#define		_IR_RECEIVEDSTATUS_32BITSDATA		2			//����32λ����
//#define		_IR_RECEIVEDSTATUS_CONTINUE			3			//����������
#define		_IR_RECEIVEDSTATUS_INTERVAL			4			//�������ݽ���
#define		_IR_RECEIVE_TIMEOUT_						20			//���ճ�ʱ��200ms
#endif

//����ң��������״̬��
typedef struct {
	u8 u8ReceivedStatus;					//��ǰ�Ľ���״̬
	u8 fCodeTimeEn :1;						//����ʱ��ʹ��
	u8 fFirstContinue :1;					//��һ��������
	u8 fReserved :6;
	u32 u32Recieved32Bits;					//���յ�32λ����

	u8 u8BitsLength;						//���յ�����λ����
	u8 u8RecievedCode;						//���յ��Ĳ�����

	u32 u32CodeTime;						//���͸�ʽʱ��

	u8 u8Write_Rx;							//���ջ�����дָ��
	u8 u8Read_Rx;							//���ջ�������ָ��
	u8 u8Available_Rx;						//���ջ�������Ч�ֽ���
	u8 *pu8Buffer_Rx;						//���ջ�������ָ��

	u8 u8ReceiveTimeout;					//���ճ�ʱ��500ms���ճ�ʱ
} tIRFSMType;

extern void IR_Init(void);
extern void IR_Process(void);
extern void Isr_IR_Timeout10ms(void);
extern void Isr_IR_Timeout100us(void);
extern void ISR_IRReceive(void);

#endif /* IR_H_ */



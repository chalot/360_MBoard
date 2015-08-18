#include "ir.h"
#include "stm8s.h"
#include "periph.h"
#include "utility.h"
#include "comm.h"
#include "printf.h"

#define LED_ON()  GPIO_WriteLow(GPIOD,GPIO_PIN_3)
#define LED_OFF() GPIO_WriteHigh(GPIOD,GPIO_PIN_3)

#define TIM3_PERIOD     159  	/*10ms��ʱ����*/
#define TIM2_PERIOD 	99  	/*100us��ʱ����*/

static tIRFSMType tIRFSM;		//����ģ�����״̬��

static u8 IR_Buf[_BUFFER_LENGTH_IR_Rx_];


static void IR_GPIO_Init(void);
static void TIM3_Config_10ms(void);
static void	TIM2_Config_100us(void);

extern char putchar(char);
extern int printf(const char FAR *format, ...);

/**
 * ң������ʼ��
 *
 */
void IR_Init()
{
	ZeroMem((u8*)&tIRFSM, sizeof(tIRFSMType));
	tIRFSM.pu8Buffer_Rx = &IR_Buf[0];
	ZeroMem(IR_Buf, _BUFFER_LENGTH_IR_Rx_);

	IR_GPIO_Init();

	TIM3_Config_10ms();
	TIM2_Config_100us();
}

/**
 * ң����Ӳ����ʼ��
 *
 */
void IR_GPIO_Init() {

	/* ��ʼ��ң���������ߣ��������� */
	GPIO_Init(GPIO_IR_PORT, GPIO_IR_PIN, GPIO_MODE_IN_FL_IT);
//	GPIO_ExternalPullUpConfig(GPIOA, GPIO_PIN_3, ENABLE);


	/* �½��ش��� */
	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);

	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
}
	
/**
  * @brief  Configure TIM4 to generate an update interrupt each 1ms 
  * @param  None
  * @retval None
  */
void TIM3_Config_10ms(void)
{
  /* TIM4 configuration:
   - TIM4CLK is set to 16 MHz, the TIM4 Prescaler is equal to 128 so the TIM1 counter
   clock used is 16 MHz / 128 = 125 000 Hz
  - With 125 000 Hz we can generate time base:
      max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 125000 = 2.048 ms
      min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 125000 = 0.016 ms
  - In this example we need to generate a time base equal to 1 ms
   so TIM4_PERIOD = (0.001 * 125000 - 1) = 124 
	so TIM4_PERIOD = (0.01 * 125000 - 1) = 1249 */

  /*
	16 MHz / 1024 = 16 000 Hz
  max time base is 2.048 ms if TIM3_PERIOD = 255 --> (255 + 1) / 16000 = 16 ms
  min time base is 0.016 ms if TIM3_PERIOD = 1	 --> (	1 + 1) / 16000 = 0.125 ms 
  
  so TIM3_PERIOD = (0.01 * 16000 - 1) = 159 
  */


  /* Time base configuration */
  TIM3_TimeBaseInit(TIM3_PRESCALER_1024, TIM3_PERIOD);
  /* Clear TIM4 update flag */
  TIM3_ClearFlag(TIM3_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);

  /* Enable TIM4 */
  TIM3_Cmd(DISABLE);


}

/**
  * @brief  Configure TIM4 to generate an update interrupt each 1ms 
  * @param  None
  * @retval None
  */
static void TIM2_Config_100us(void)
{

/*
  16 MHz / 16 = 1000 000 Hz
max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 1000000 = 256 us
min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 1000000 = 2 us 

so TIM2_PERIOD = (0.0001 * 1000000 - 1) = 99 
*/

  /* Time base configuration */
  TIM2_TimeBaseInit(TIM2_PRESCALER_16, TIM2_PERIOD);
  /* Clear TIM6 update flag */
  TIM2_ClearFlag(TIM2_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);

  /* Enable TIM6 */
  TIM2_Cmd(ENABLE);
}



/*******************************************************************************
 * ����������	���ⰴ�����������̣������������
 * ��    �ڣ�	��
 * ��    �ڣ�	��
 * ��	�ƣ�
 ******************************************************************************/
void IR_Process() {
	u8 u8IRData = 0;

	//������ջ����������ݣ�
	if (tIRFSM.u8Available_Rx) {
		//��ȡ������
		u8IRData = *(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Read_Rx++);

		//ָ���ͷ
		if (tIRFSM.u8Read_Rx >= _BUFFER_LENGTH_IR_Rx_) {
			tIRFSM.u8Read_Rx = 0;
		}

		//��Ч���ݼ���
		--tIRFSM.u8Available_Rx;

		//ִ�в�ͬ�Ĳ�����
		switch (u8IRData) {
		case	IR_CMD_OK: 			//0x0b	ȷ��
			COMM_RequestSendCommand(MENU_OK, KEY_ACTIVED);
			printf("[IR] IR_CMD_OK\n");
			break;
		case	IR_CMD_UP: 			//0x06	��
			COMM_RequestSendCommand(MENU_UP, KEY_ACTIVED);
			printf("[IR] IR_CMD_UP\n");
			break;
		case	IR_CMD_DOWN: 		//0x05	��
			COMM_RequestSendCommand(MENU_DOWN, KEY_ACTIVED);
			printf("[IR] IR_CMD_DOWN\n");
			break;
		case	IR_CMD_LEFT: 		//0x0d	��
			COMM_RequestSendCommand(MENU_LEFT, KEY_ACTIVED);
			printf("[IR] IR_CMD_LEFT\n");
			break;
		case	IR_CMD_RIGHT: 		//0x0e	��
			COMM_RequestSendCommand(MENU_RIGHT, KEY_ACTIVED);
			printf("[IR] IR_CMD_RIGHT\n");
			break;
		case	IR_CMD_BACK: 		//0x08	����
			COMM_RequestSendCommand(MENU_BACK, KEY_ACTIVED);			
			printf("[IR] IR_CMD_BACK\n");
			break;
		case	IR_CMD_POWER: 		//0x02	��Դ
			COMM_RequestSendCommand(MENU_POWER, KEY_ACTIVED);			
			printf("[IR] IR_CMD_POWER\n");
			break;
		case	IR_CMD_LF_VIEW: 	//0x1e	�����ӣ�AV1
			COMM_RequestSendCommand(KEY_LEFT, KEY_ACTIVED);	
			printf("[IR] IR_CMD_LF_VIEW\n");
			break;
		case	IR_CMD_RT_VIEW: 	//0x1d	�����ӣ�AV2
			COMM_RequestSendCommand(KEY_RIGHT, KEY_ACTIVED);
			printf("[IR] IR_CMD_RT_VIEW\n");
			break;
		case	IR_CMD_FR_VIEW: //	0x09	��ǰ�ӣ�AV3
			COMM_RequestSendCommand(KEY_FRONT, KEY_ACTIVED);
			printf("[IR] IR_CMD_FR_VIEW\n");
			break;
		case IR_CMD_BK_VIEW://	0x0a	�����ӣ�AV4
			COMM_RequestSendCommand(KEY_REAR, KEY_ACTIVED);
			printf("[IR] IR_CMD_BK_VIEW\n");
			break;
		default:
			break;
		}
	}
}

/*******************************************************************************
 * ����������	��������жϺ���
 * ��    �ڣ�	��
 * ��    �ڣ�	��
 * ��	�ƣ�
 ******************************************************************************/
void ISR_IRReceive(void) {
	u8 u8Err = 0;						//�����Ƿ����
	u8 u8Bit;							//���յ���bitλ
	u8 u8IDData, u8IDAntiData;			//���յ���ʶ���뼰�䷴��
	u8 u8OperateData, u8OperateAntiData;	//���յ������ݲ����뼰�䷴��
	
	static int a = 0;
	if(a == 0) {
		LED_ON();
		a = 1;
	}else if(a == 1) {
		LED_OFF();
		a = 0;
	}
                                                                                 
	//���ݽ���״̬����
	switch (tIRFSM.u8ReceivedStatus) {
	//����̬
	case _IR_RECEIVEDSTATUS_IDLE:
		//ת�����������״̬
		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_START;

		//����ʱ��ʹ��
		tIRFSM.fCodeTimeEn = 1;

		//����ʱ����0
		tIRFSM.u32CodeTime = 0;

		//���ճ�ʱ
		tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;

		//���յ��Ĳ�������0
		tIRFSM.u8RecievedCode = 0;

		//����10ms��ʱ��
		TIM3_Cmd(ENABLE);
		break;

		//���յ�������
	case _IR_RECEIVEDSTATUS_START:
		//�ϴν��յ�����������
		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_START - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_START + _IR_CODE_TIME_BIAS)) {
			//����״̬תΪ����32λ����
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_32BITSDATA;

			//����ʱ����0
			tIRFSM.u32CodeTime = 0;

			//���ݳ���
			tIRFSM.u8BitsLength = 32;

			//32λ������0
			tIRFSM.u32Recieved32Bits = 0;
		}
		//����
		else {
			u8Err = 1;
		}
		

		break;

		//����32λ����
	case _IR_RECEIVEDSTATUS_32BITSDATA:
		//�յ���0��
		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_0 - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_0 + _IR_CODE_TIME_BIAS)) {
			u8Bit = 0;
		}
		//�յ���1��?
		else if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_1 - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_1 + _IR_CODE_TIME_BIAS)) {
			u8Bit = 1;
		}
		//����
		else {
			u8Err = 1;
		}

		if (!u8Err) {
			//32λ��������
//			tIRFSM.u32Recieved32Bits <<= 1;

			//��¼��ǰ���յ���0/1ֵ
//			tIRFSM.u32Recieved32Bits |= u8Bit;

			//����Ҫ����ת�����������հ�����
			if(1 == u8Bit)
				tIRFSM.u32Recieved32Bits |= ((uint32_t)0x01 << (32-tIRFSM.u8BitsLength));

			//��������ʱ����0
			tIRFSM.u32CodeTime = 0;

			//�������ݳ���--
			tIRFSM.u8BitsLength--;

			//�Ѿ����յ�32λ���ݣ�
			if (!tIRFSM.u8BitsLength) {
				//��ȡ��ַ�����ݡ����ݷ���
				u8IDData = ((tIRFSM.u32Recieved32Bits >> 24) & 0x000000FF);
				u8IDAntiData = ((tIRFSM.u32Recieved32Bits >> 16) & 0x000000FF);
				u8OperateData = ((tIRFSM.u32Recieved32Bits >> 8) & 0x000000FF);
				u8OperateAntiData = tIRFSM.u32Recieved32Bits & 0x000000FF;

				printf("[IR] code = %x%x%x%x", u8IDData, u8IDAntiData, u8OperateData, u8OperateAntiData);

				//��ַ�����ݲ���ȷ
				if ((0xFF != u8IDData + u8IDAntiData) /*|| (0xFF != u8OperateData + u8OperateAntiData)*/) {
					u8Err = 1;
				}
				//���յ���ȷ������
				else {
					//������ջ������Ƿ�������
					if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
						//���ݻ�������������
						tIRFSM.u8Available_Rx++;

						//�����յ��ĺ��������������ݻ�����
						*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = u8IDAntiData;

						//��¼���յ��Ĳ�����
						tIRFSM.u8RecievedCode = u8IDAntiData;

						//���ջ�����дָ���ͷ
						if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
							tIRFSM.u8Write_Rx = 0;
						}
					}

					//״̬תΪ���ռ��
					tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;

					//�ڼ������յ����������ǵ�һ�������룬��һ��������Ҫ����
					tIRFSM.fFirstContinue = 1;

					//����ʱ����0
					tIRFSM.u32CodeTime = 0;
				}
			}
		}

		break;

		//�������ݽ�������������ɺ���һ���½�������
	case _IR_RECEIVEDSTATUS_INTERVAL:
			//ת�����������֮��ļ��״̬
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;

			//����ʱ����0
			tIRFSM.u32CodeTime = 0;

			//���ý��ճ�ʱ
			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;

		break;
#if 0
		//����������
	case _IR_RECEIVEDSTATUS_CONTINUE:
		//������
		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_SEQUENTIAL - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_SEQUENTIAL + _IR_CODE_TIME_BIAS)) {
			//�ǵ�һ�������룿
			if (tIRFSM.fFirstContinue == 1) {
				//������һ��������

				//����������յ�������Ļ������ǵ�һ����������
				tIRFSM.fFirstContinue = 0;
			}
			//���ǵ�һ��������,ң����֧����������
			else if ((_IR_CMD_VOLUME_PLUS == tIRFSM.u8RecievedCode)
					|| (_IR_CMD_VOLUME_MINUS == tIRFSM.u8RecievedCode)) {
				//������ջ������Ƿ�������
				if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
					//���ջ�����+1
					tIRFSM.u8Available_Rx++;

					//���ϴν��յ��Ĳ����������ջ�����
					*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = tIRFSM.u8RecievedCode;

					//���ջ�����дָ���ͷ
					if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
						tIRFSM.u8Write_Rx = 0;
					}
				}
			}

			//ת�����������֮��ļ��״̬
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;

			//����ʱ����0
			tIRFSM.u32CodeTime = 0;

			//���ý��ճ�ʱ
			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
		}
		//���ճ���
		else {
			u8Err = 1;
		}

		break;
#endif
	default:
		break;
	}

	//��������¿�ʼ
	if (u8Err) {
		//����״̬תΪ����
		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;

		//��ֹ��������ʱ����ʱ
		tIRFSM.fCodeTimeEn = 0;

		//�������ͼ�ʱ��0
		tIRFSM.u32CodeTime = 0;

		//����������0
		tIRFSM.u32Recieved32Bits = 0;

		//�������ݳ�����0
		tIRFSM.u8BitsLength = 0;

		//��ֹ���ճ�ʱ
		tIRFSM.u8ReceiveTimeout = 0;

		//ֹͣ��ʱ��
		TIM3_Cmd(DISABLE);
	}
}

/***********************************************************************************************************
 * ����������	10ms��ʱ����������Ҫ������ʱ��λΪ10ms�Ķ�ʱ����
 * ��    �ڣ�	��
 * ��    �ڣ�	��
 * ��	�ƣ�
 ***********************************************************************************************************/
void Isr_IR_Timeout10ms(void) {

	//������ճ�ʱ��ʱ��
	if (tIRFSM.u8ReceiveTimeout) {
		tIRFSM.u8ReceiveTimeout--;

		//��ʱ��
		if (0 == tIRFSM.u8ReceiveTimeout) {
			//ֹͣ���գ���ֹͣ��ʱ��
			TIM3_Cmd(DISABLE);

			//IR����״̬תΪ����
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;

			//��ֹ����ʱ����ʱ
			tIRFSM.fCodeTimeEn = 0;
		}
	}
}

/***********************************************************************************************************
 * ����������	10ous��ʱ����������Ҫ������¼���������������
 * ��    �ڣ�	��
 * ��    �ڣ�	��
 * ��	�ƣ�
 ***********************************************************************************************************/
void Isr_IR_Timeout100us(void) {

	//������ռ�ʱ
	if (tIRFSM.fCodeTimeEn) {
		//����ʱ��+100us
		tIRFSM.u32CodeTime += 100;

		//���ճ�ʱ
		if (((tIRFSM.u8ReceivedStatus <= _IR_RECEIVEDSTATUS_32BITSDATA)
				&& (tIRFSM.u32CodeTime >= _IR_DATA_LIMITATION_TIME))
				|| ((tIRFSM.u8ReceivedStatus == _IR_RECEIVEDSTATUS_INTERVAL)
						&& (tIRFSM.u32CodeTime >= _IR_INTERVAL_LIMITATION_TIME))) {
			//����ʱ����ֹ
			tIRFSM.fCodeTimeEn = 0;

			//����״̬תΪ����
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;

			//����ʱ����0
			tIRFSM.u32CodeTime = 0;
		}
	}
}

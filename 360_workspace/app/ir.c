#include "ir.h"
#include "stm8s.h"
#include "periph.h"
#include "utility.h"
#include "comm.h"
#include "printf.h"

#define LED_ON()  GPIO_WriteLow(GPIOD,GPIO_PIN_3)
#define LED_OFF() GPIO_WriteHigh(GPIOD,GPIO_PIN_3)

#define TIM3_PERIOD     159  	/*10ms定时周期*/
#define TIM2_PERIOD 	99  	/*100us定时周期*/

static tIRFSMType tIRFSM;		//红外模拟输出状态机

static u8 IR_Buf[_BUFFER_LENGTH_IR_Rx_];


static void IR_GPIO_Init(void);
static void TIM3_Config_10ms(void);
static void	TIM2_Config_100us(void);

extern char putchar(char);
extern int printf(const char FAR *format, ...);

/**
 * 遥控器初始化
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
 * 遥控器硬件初始化
 *
 */
void IR_GPIO_Init() {

	/* 初始化遥控器接收线，输入悬浮 */
	GPIO_Init(GPIO_IR_PORT, GPIO_IR_PIN, GPIO_MODE_IN_FL_IT);
//	GPIO_ExternalPullUpConfig(GPIOA, GPIO_PIN_3, ENABLE);


	/* 下降沿触发 */
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
 * 功能描述：	红外按键处理主流程，处理红外命令
 * 入    口：	无
 * 出    口：	无
 * 设	计：
 ******************************************************************************/
void IR_Process() {
	u8 u8IRData = 0;

	//红外接收缓冲区有数据？
	if (tIRFSM.u8Available_Rx) {
		//获取操作码
		u8IRData = *(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Read_Rx++);

		//指针回头
		if (tIRFSM.u8Read_Rx >= _BUFFER_LENGTH_IR_Rx_) {
			tIRFSM.u8Read_Rx = 0;
		}

		//有效数据减少
		--tIRFSM.u8Available_Rx;

		//执行不同的操作码
		switch (u8IRData) {
		case	IR_CMD_OK: 			//0x0b	确认
			COMM_RequestSendCommand(MENU_OK, KEY_ACTIVED);
			printf("[IR] IR_CMD_OK\n");
			break;
		case	IR_CMD_UP: 			//0x06	上
			COMM_RequestSendCommand(MENU_UP, KEY_ACTIVED);
			printf("[IR] IR_CMD_UP\n");
			break;
		case	IR_CMD_DOWN: 		//0x05	下
			COMM_RequestSendCommand(MENU_DOWN, KEY_ACTIVED);
			printf("[IR] IR_CMD_DOWN\n");
			break;
		case	IR_CMD_LEFT: 		//0x0d	左
			COMM_RequestSendCommand(MENU_LEFT, KEY_ACTIVED);
			printf("[IR] IR_CMD_LEFT\n");
			break;
		case	IR_CMD_RIGHT: 		//0x0e	右
			COMM_RequestSendCommand(MENU_RIGHT, KEY_ACTIVED);
			printf("[IR] IR_CMD_RIGHT\n");
			break;
		case	IR_CMD_BACK: 		//0x08	返回
			COMM_RequestSendCommand(MENU_BACK, KEY_ACTIVED);			
			printf("[IR] IR_CMD_BACK\n");
			break;
		case	IR_CMD_POWER: 		//0x02	电源
			COMM_RequestSendCommand(MENU_POWER, KEY_ACTIVED);			
			printf("[IR] IR_CMD_POWER\n");
			break;
		case	IR_CMD_LF_VIEW: 	//0x1e	（左视）AV1
			COMM_RequestSendCommand(KEY_LEFT, KEY_ACTIVED);	
			printf("[IR] IR_CMD_LF_VIEW\n");
			break;
		case	IR_CMD_RT_VIEW: 	//0x1d	（右视）AV2
			COMM_RequestSendCommand(KEY_RIGHT, KEY_ACTIVED);
			printf("[IR] IR_CMD_RT_VIEW\n");
			break;
		case	IR_CMD_FR_VIEW: //	0x09	（前视）AV3
			COMM_RequestSendCommand(KEY_FRONT, KEY_ACTIVED);
			printf("[IR] IR_CMD_FR_VIEW\n");
			break;
		case IR_CMD_BK_VIEW://	0x0a	（后视）AV4
			COMM_RequestSendCommand(KEY_REAR, KEY_ACTIVED);
			printf("[IR] IR_CMD_BK_VIEW\n");
			break;
		default:
			break;
		}
	}
}

/*******************************************************************************
 * 功能描述：	红外接收中断函数
 * 入    口：	无
 * 出    口：	无
 * 设	计：
 ******************************************************************************/
void ISR_IRReceive(void) {
	u8 u8Err = 0;						//接收是否出错？
	u8 u8Bit;							//接收到的bit位
	u8 u8IDData, u8IDAntiData;			//接收到的识别码及其反码
	u8 u8OperateData, u8OperateAntiData;	//接收到的数据操作码及其反码
	
	static int a = 0;
	if(a == 0) {
		LED_ON();
		a = 1;
	}else if(a == 1) {
		LED_OFF();
		a = 0;
	}
                                                                                 
	//根据接收状态处理
	switch (tIRFSM.u8ReceivedStatus) {
	//空闲态
	case _IR_RECEIVEDSTATUS_IDLE:
		//转入接收启动码状态
		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_START;

		//码型时长使能
		tIRFSM.fCodeTimeEn = 1;

		//码型时长清0
		tIRFSM.u32CodeTime = 0;

		//接收超时
		tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;

		//接收到的操作码清0
		tIRFSM.u8RecievedCode = 0;

		//启动10ms定时器
		TIM3_Cmd(ENABLE);
		break;

		//接收到启动码
	case _IR_RECEIVEDSTATUS_START:
		//上次接收到的是启动码
		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_START - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_START + _IR_CODE_TIME_BIAS)) {
			//接收状态转为接收32位数据
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_32BITSDATA;

			//码型时长清0
			tIRFSM.u32CodeTime = 0;

			//数据长度
			tIRFSM.u8BitsLength = 32;

			//32位数据清0
			tIRFSM.u32Recieved32Bits = 0;
		}
		//出错
		else {
			u8Err = 1;
		}
		

		break;

		//接收32位数据
	case _IR_RECEIVEDSTATUS_32BITSDATA:
		//收到“0”
		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_0 - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_0 + _IR_CODE_TIME_BIAS)) {
			u8Bit = 0;
		}
		//收到“1”?
		else if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_1 - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_1 + _IR_CODE_TIME_BIAS)) {
			u8Bit = 1;
		}
		//出错
		else {
			u8Err = 1;
		}

		if (!u8Err) {
			//32位数据左移
//			tIRFSM.u32Recieved32Bits <<= 1;

			//记录当前接收到的0/1值
//			tIRFSM.u32Recieved32Bits |= u8Bit;

			//还需要逆序转换，才是最终按键码
			if(1 == u8Bit)
				tIRFSM.u32Recieved32Bits |= ((uint32_t)0x01 << (32-tIRFSM.u8BitsLength));

			//接收码型时长清0
			tIRFSM.u32CodeTime = 0;

			//接收数据长度--
			tIRFSM.u8BitsLength--;

			//已经接收到32位数据？
			if (!tIRFSM.u8BitsLength) {
				//获取地址、数据、数据反码
				u8IDData = ((tIRFSM.u32Recieved32Bits >> 24) & 0x000000FF);
				u8IDAntiData = ((tIRFSM.u32Recieved32Bits >> 16) & 0x000000FF);
				u8OperateData = ((tIRFSM.u32Recieved32Bits >> 8) & 0x000000FF);
				u8OperateAntiData = tIRFSM.u32Recieved32Bits & 0x000000FF;

				printf("[IR] code = %x%x%x%x", u8IDData, u8IDAntiData, u8OperateData, u8OperateAntiData);

				//地址、数据不正确
				if ((0xFF != u8IDData + u8IDAntiData) /*|| (0xFF != u8OperateData + u8OperateAntiData)*/) {
					u8Err = 1;
				}
				//接收到正确的数据
				else {
					//红外接收缓冲区是否已满？
					if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
						//数据缓冲区数据增加
						tIRFSM.u8Available_Rx++;

						//将接收到的红外操作码放入数据缓冲区
						*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = u8IDAntiData;

						//记录接收到的操作码
						tIRFSM.u8RecievedCode = u8IDAntiData;

						//接收缓冲区写指针回头
						if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
							tIRFSM.u8Write_Rx = 0;
						}
					}

					//状态转为接收间隔
					tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;

					//在间隔后接收到的连发码是第一个连发码，第一个连发码要抛弃
					tIRFSM.fFirstContinue = 1;

					//码型时长清0
					tIRFSM.u32CodeTime = 0;
				}
			}
		}

		break;

		//接收数据结束，即数据完成后有一个下降沿脉冲
	case _IR_RECEIVEDSTATUS_INTERVAL:
			//转入接收连发码之间的间隔状态
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;

			//接收时长清0
			tIRFSM.u32CodeTime = 0;

			//重置接收超时
			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;

		break;
#if 0
		//接收连发码
	case _IR_RECEIVEDSTATUS_CONTINUE:
		//连发码
		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_SEQUENTIAL - _IR_CODE_TIME_BIAS)
				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_SEQUENTIAL + _IR_CODE_TIME_BIAS)) {
			//是第一个连发码？
			if (tIRFSM.fFirstContinue == 1) {
				//抛弃第一个连发码

				//下面如果接收到连发码的话，则不是第一个连发码了
				tIRFSM.fFirstContinue = 0;
			}
			//不是第一个连发码,遥控器支持音量连发
			else if ((_IR_CMD_VOLUME_PLUS == tIRFSM.u8RecievedCode)
					|| (_IR_CMD_VOLUME_MINUS == tIRFSM.u8RecievedCode)) {
				//红外接收缓冲区是否已满？
				if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
					//接收缓冲区+1
					tIRFSM.u8Available_Rx++;

					//将上次接收到的操作码放入接收缓冲区
					*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = tIRFSM.u8RecievedCode;

					//接收缓冲区写指针回头
					if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
						tIRFSM.u8Write_Rx = 0;
					}
				}
			}

			//转入接收连发码之间的间隔状态
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;

			//接收时长清0
			tIRFSM.u32CodeTime = 0;

			//重置接收超时
			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
		}
		//接收出错
		else {
			u8Err = 1;
		}

		break;
#endif
	default:
		break;
	}

	//出错后重新开始
	if (u8Err) {
		//接收状态转为空闲
		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;

		//禁止接收码型时长计时
		tIRFSM.fCodeTimeEn = 0;

		//接收码型计时清0
		tIRFSM.u32CodeTime = 0;

		//接收数据清0
		tIRFSM.u32Recieved32Bits = 0;

		//接收数据长度置0
		tIRFSM.u8BitsLength = 0;

		//禁止接收超时
		tIRFSM.u8ReceiveTimeout = 0;

		//停止定时器
		TIM3_Cmd(DISABLE);
	}
}

/***********************************************************************************************************
 * 功能描述：	10ms定时器函数，主要计数计时单位为10ms的定时变量
 * 入    口：	无
 * 出    口：	无
 * 设	计：
 ***********************************************************************************************************/
void Isr_IR_Timeout10ms(void) {

	//红外接收超时计时器
	if (tIRFSM.u8ReceiveTimeout) {
		tIRFSM.u8ReceiveTimeout--;

		//定时到
		if (0 == tIRFSM.u8ReceiveTimeout) {
			//停止接收，即停止定时器
			TIM3_Cmd(DISABLE);

			//IR接收状态转为空闲
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;

			//禁止码型时长计时
			tIRFSM.fCodeTimeEn = 0;
		}
	}
}

/***********************************************************************************************************
 * 功能描述：	10ous定时器函数，主要用来记录红外输入的脉冲宽度
 * 入    口：	无
 * 出    口：	无
 * 设	计：
 ***********************************************************************************************************/
void Isr_IR_Timeout100us(void) {

	//红外接收计时
	if (tIRFSM.fCodeTimeEn) {
		//码型时长+100us
		tIRFSM.u32CodeTime += 100;

		//接收超时
		if (((tIRFSM.u8ReceivedStatus <= _IR_RECEIVEDSTATUS_32BITSDATA)
				&& (tIRFSM.u32CodeTime >= _IR_DATA_LIMITATION_TIME))
				|| ((tIRFSM.u8ReceivedStatus == _IR_RECEIVEDSTATUS_INTERVAL)
						&& (tIRFSM.u32CodeTime >= _IR_INTERVAL_LIMITATION_TIME))) {
			//码型时长禁止
			tIRFSM.fCodeTimeEn = 0;

			//接收状态转为空闲
			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;

			//码型时长清0
			tIRFSM.u32CodeTime = 0;
		}
	}
}

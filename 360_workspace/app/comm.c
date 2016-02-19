/*
 * ���İ�A8���س�����װ�MCU֮���ͨ�Ŵ��ڳ���
 */

#include "Comm.h"
#include "config.h"
#include "utility.h"

 
/*ͨ�Ŵ��ڷ��ͺͽ��ջ���*/
tRINGBUF l_TxRBuf;
tRINGBUF l_RxRBuf;   

/*���Դ��ڷ��ͺͽ��ջ���*/
#ifdef __DEBUG__ 
tRINGBUF l_TxRBuf_Dbg;
#endif
 

/*
 * ����У��ͣ����
 */
u8 CalChecksum(u8 *data, u8 u8Len)
{
	u8 i = 0;
	u8 checksum = 0;

	while(i < u8Len) {
		checksum ^= data[i];
		i++;
	}

	return checksum;
}

/*
 * ���촮�ڷ�������֡
 */
int COMM_FormFrame(eKEYTYPE eKey, eKEYSTATE eState, tMSG_CMD *ptCmd)
{
	assert_param(eKey < KEY_END);
	assert_param(ptCmd != (void*)0);
	
	ptCmd->head = CMD_HEAD; /*��Ϣͷ��0x55*/
	ptCmd->cmd = eKey;

		/*�����ⲿ����ߴ����ͻظ�����״̬*/
	switch(eKey) 
	{
		case KEY_LEFT:
			if(eState == KEY_ACTIVED)		
				ptCmd->cmd = KEY_LEFT;
			else		
				ptCmd->cmd = KEY_FRONT;
			break;

		case KEY_RIGHT:
			if(eState == KEY_ACTIVED)		
				ptCmd->cmd = KEY_RIGHT;
			else		
				ptCmd->cmd = KEY_FRONT;
			break;

		case KEY_REAR:
			if(eState == KEY_ACTIVED)		
				ptCmd->cmd = KEY_REAR;
			else		
				ptCmd->cmd = KEY_FRONT;
			break;
			
		default:
			break;
	}


	ptCmd->param[0] = 0;
	ptCmd->param[1] = 0;
	ptCmd->param[2] = 0;
	ptCmd->param[3] = 0;

	ptCmd->checksum = CalChecksum((u8*)ptCmd, sizeof(tMSG_CMD) - 1);

	return 0;

}




void COMM_RequestSendCommand(eKEYTYPE eKey, eKEYSTATE eState)
{
	int ret = 0;
	tMSG_CMD tCmdMsg;
	u8 i = 0;
	u8 *pMsg;
	
	ret = COMM_FormFrame(eKey, eState, &tCmdMsg);
	if(ret == 0)
	{
		pMsg = (u8*)&tCmdMsg;

#ifdef VSP_BOARD 	
	UART2_ITConfig(UART2_IT_TXE, DISABLE);
#endif
#ifdef _A8_COMM_UART1_
		UART1_ITConfig(UART1_IT_TXE, DISABLE);
#endif
#ifdef _A8_COMM_UART3_
		UART3_ITConfig(UART3_IT_TXE, DISABLE);
#endif
		while(i < sizeof(tMSG_CMD))
		{
			l_TxRBuf.buf[l_TxRBuf.write++] = *pMsg++;
			if(l_TxRBuf.write >= BUF_SIZE)
				l_TxRBuf.write = 0;
			
			i ++;
		}
#ifdef VSP_BOARD 	
		UART2_ITConfig(UART2_IT_TXE, ENABLE);
#endif
#ifdef _A8_COMM_UART1_
		UART1_ITConfig(UART1_IT_TXE, ENABLE);
#endif
#ifdef _A8_COMM_UART3_
		UART3_ITConfig(UART3_IT_TXE, ENABLE);
#endif
	}
}


/**
  * @brief  UART1 and UART3 Configuration for interrupt communication
  * @param  None
  * @retval None
  */
void COMM_Lowlevel_Config()
{
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);

#ifdef VSP_BOARD 	
	UART2_DeInit();
	UART2_Init((uint32_t)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO,
				UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);

	/* Enable UART1 Transmit interrupt*/
	UART2_ITConfig(UART2_IT_TXE | UART2_IT_RXNE, ENABLE);
#endif

#ifdef _A8_COMM_UART3_
    UART3_DeInit();
    /* UART1 and UART3 configuration -------------------------------------------------*/
    /* UART1 and UART3 configured as follow:
          - BaudRate = 115200 baud  
          - Word Length = 8 Bits
          - One Stop Bit
          - No parity
          - Receive and transmit enabled
          - UART1 Clock disabled
     */
	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
		UART3_MODE_TX_ENABLE);
    
	/* Enable UART1 Transmit interrupt*/
	UART3_ITConfig(UART3_IT_TXE, ENABLE);
#endif

#ifdef _A8_COMM_UART1_
  /* Deinitializes the UART1 and UART3 peripheral */
    UART1_DeInit();
    /* UART1 and UART3 configuration -------------------------------------------------*/
    /* UART1 and UART3 configured as follow:
          - BaudRate = 115200 baud  
          - Word Length = 8 Bits
          - One Stop Bit
          - No parity
          - Receive and transmit enabled
          - UART1 Clock disabled
     */
    /* ����ͨ�Ŵ��� UART1 */
    UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
                UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
    
    /* Enable UART1 Transmit interrupt*/
    UART1_ITConfig(UART1_IT_TXE | UART1_IT_RXNE, ENABLE);
#endif

#ifdef __DEBUG__ 
	/* ���õװ���Դ��� UART3 */
	UART3_DeInit();

	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
		UART3_MODE_TX_ENABLE);

	/* Enable UART3 Receive interrupt */
	UART3_ITConfig(UART3_IT_TXE, ENABLE);

#endif
}


void COMM_Init()
{

	l_TxRBuf.read = 0;
	l_TxRBuf.write = 0;
	l_RxRBuf.read = 0;
	l_RxRBuf.write = 0;

	COMM_Lowlevel_Config();
}


#if 0

/*������*/
void main()
{	
	 /*ʱ�ӳ�ʼ��*/
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	CLK_HSICmd(ENABLE);

	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);	
//	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);

	/* Check if the system has resumed from IWDG reset */
	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
	{
	  /* Clear IWDGF Flag */
	  RST_ClearFlag(RST_FLAG_IWDGF);
	}
	
	/*ͨ�Ŵ��ڳ�ʼ��*/
	COMM_Init();

	/*��ȫ���ж�*/
	enableInterrupts();    

	while (1)
	{
		u16 i = 1000;
		
		COMM_RequestSendCommand(KEY_LEFT, KEY_ACTIVED);


	//	printf("1234567890", 10);

		for(; i > 0; i--)
		{
			Delay_1ms();
		}
	}
		
}
#endif



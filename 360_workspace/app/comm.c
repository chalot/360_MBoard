/*
 * 核心板A8主控程序与底板MCU之间的通信串口程序
 */

#include "Comm.h"

 
static tRINGBUF l_TxRBuf, l_RxRBuf;   /*串口发送和接收缓区*/
 
 

/*串口通信处理*/
void COMM_Process()
{



}



/*
 * 计算校验和，异或
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


int COMM_FormFrame(eKEYTYPE eKey, eKEYSTATE eState, tMSG_CMD *ptCmd)
{
	assert_param(eKey < KEY_END);
	assert_param(ptCmd != NULL);
	
	ptCmd.head = CMD_HEAD; /*消息头，0x55*/

	switch(eKey) 
	{
		case KEY_ACC:
			break;
		case KEY_LEFT:
			if(eState == KEY_ACTIVED)		
				ptCmd.cmd = MSG_LEFT;
			else		
				ptCmd.cmd = MSG_FRONT;
			break;

		case KEY_RIGHT:
			if(eState == KEY_ACTIVED)		
				ptCmd.cmd = MSG_RIGHT;
			else		
				ptCmd.cmd = MSG_FRONT;
			break;

		case KEY_REAR:
			if(eState == KEY_ACTIVED)		
				ptCmd.cmd = MSG_REAR;
			else		
				ptCmd.cmd = MSG_FRONT;
			break;
		default:
			return -1;
			break;
	}

	ptCmd.param[0] = 0;
	ptCmd.param[1] = 0;
	ptCmd.param[2] = 0;
	ptCmd.param[3] = 0;

	ptCmd.checksum = CalChecksum((u8*)ptCmd, sizeof(tMSG_CMD) - 1);

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
		
		UART1_ITConfig(UART1_IT_TXE, DISABLE);

		while(i < sizeof(tMSG_CMD))
		{
			l_TxRBuf.buf[l_TxRBuf.write++] = *pMsg++;
			if(l_TxRBuf.write >= BUF_SIZE)
				l_TxRBuf.write = 0;
			
			i ++;
		}

		UART1_ITConfig(UART1_IT_TXE, ENABLE);

	}
}


/**
  * @brief  UART1 and UART3 Configuration for interrupt communication
  * @param  None
  * @retval None
  */
void COMM_Lowlevel_Config(void)
{
  /* Deinitializes the UART1 and UART3 peripheral */
    UART1_DeInit();
//    UART3_DeInit();
    /* UART1 and UART3 configuration -------------------------------------------------*/
    /* UART1 and UART3 configured as follow:
          - BaudRate = 115200 baud  
          - Word Length = 8 Bits
          - One Stop Bit
          - No parity
          - Receive and transmit enabled
          - UART1 Clock disabled
     */
    /* Configure the UART1 */
    UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
                UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
    
    /* Enable UART1 Transmit interrupt*/
    UART1_ITConfig(UART1_IT_TXE | UART1_IT_RXNE, ENABLE);

#if 0	
    /* Configure the UART3 */
 		UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
                UART3_MODE_TX_ENABLE);

    /* Enable UART3 Receive interrupt */
    UART3_ITConfig(UART3_IT_TXE, ENABLE);
#endif

    /* Enable general interrupts */
    enableInterrupts();    
}




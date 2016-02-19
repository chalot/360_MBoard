/**
  ******************************************************************************
  * @file     stm8s_it.c
  * @author   MCD Application Team
  * @version  V2.1.0
  * @date     18-November-2011
  * @brief    Main Interrupt Service Routines.
  *           This file provides template for all peripherals interrupt service 
  *           routine.
  ******************************************************************************
  * @attention
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  *
  * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "stm8s_it.h"
#include "stm8s.h"
#include "stm8s_conf.h"
#include "comm.h"
#include "ir.h"
#include "config.h"
#include "key.h"

extern uint8_t GetVar_TxCounter1(void);
extern uint8_t GetVar_TxCounter2(void);
extern uint8_t GetVar_RxCounter1(void);
extern uint8_t IncrementVar_TxCounter1(void);
extern uint8_t IncrementVar_TxCounter2(void);
extern uint8_t IncrementVar_RxCounter1(void);
extern uint8_t GetVar_NbrOfDataToTransfer1(void);
extern uint8_t GetVar_NbrOfDataToTransfer2(void);
extern uint8_t GetVar_NbrOfDataToRead1(void);

extern void ISR_InputIOHandle();

/*通信串口发送和接收缓区*/
extern tRINGBUF l_TxRBuf;
extern tRINGBUF l_RxRBuf;   



/*调试串口发送和接收缓区*/
#ifdef __DEBUG__ 
extern tRINGBUF l_TxRBuf_Dbg;
#endif
	
/** @addtogroup Template_Project
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/


extern uint8_t TxBuffer1[];
extern uint8_t TxBuffer2[];
extern uint8_t RxBuffer1[];


#if 0
#ifdef _COSMIC_
/**
  * @brief Dummy Interrupt routine
  * @par Parameters:
  * None
  * @retval
  * None
*/
INTERRUPT_HANDLER(NonHandledInterrupt, 25)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}
#endif /*_COSMIC_*/
#endif

/**
  * @brief TRAP Interrupt routine
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Top Level Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TLI_IRQHandler, 0)

{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Auto Wake Up Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(AWU_IRQHandler, 1)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Clock Controller Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(CLK_IRQHandler, 2)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTA Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
 

}


/*转向状态*/
static u8  s_u8KeyLRLine = KEY_DET_IDLE;
static u8	 s_KeyDetCunt = 0;

extern u8  g_KeyTrigFlag;
extern u8  g_KeyStat;
extern u8  g_KeyId;

/**
  * @brief External Interrupt PORTB Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
{
	/*左转向*/
	if ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == 0x00)
	{
		/*若是首次出现电平跳变，立即发送转向信息保证实时性，同时开启计时器，检测电平跳变何时结束*/
		if(s_u8KeyLRLine == KEY_DET_IDLE) {
				s_u8KeyLRLine = KEY_DET_LEFT;
				TIM2_Cmd(ENABLE);
				/*发送左转向信号*/
				g_KeyTrigFlag = TRIG_VALID;
				g_KeyStat = KEY_ACTIVED;
				g_KeyId = KEY_LEFT;
		} 

		s_KeyDetCunt = 0;
	}
	
	/*右转向*/
	if ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == 0x00)
	{	
		if(s_u8KeyLRLine == KEY_DET_IDLE) {
				s_u8KeyLRLine = KEY_DET_RIGHT;
				TIM2_Cmd(ENABLE);
				/*发送右转向信号*/
				g_KeyTrigFlag = TRIG_VALID;
				g_KeyStat = KEY_ACTIVED;
				g_KeyId = KEY_RIGHT;
			} 
		
		s_KeyDetCunt = 0;
	}
	
}

/**
  * @brief External Interrupt PORTC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief External Interrupt PORTD Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	///if ((GPIO_ReadInputData(GPIO_IR_PORT) & GPIO_IR_PIN) == 0x00)
	{
	///	ISR_IRReceive();
		//GPIO_WriteLow(GPIOD,GPIO_PIN_3);
	}

}

/**
  * @brief External Interrupt PORTE Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
#ifdef _CHANGE_IR_INPORT_
	if ((GPIO_ReadInputData(GPIO_IR_PORT) & GPIO_IR_PIN) == 0x00)
	{
		ISR_IRReceive();
	}
#endif
}

#ifdef STM8S903
/**
  * @brief External Interrupt PORTF Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /*STM8S903*/

#if defined (STM8S208) || defined (STM8AF52Ax)
/**
  * @brief CAN RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }

/**
  * @brief CAN TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /*STM8S208 || STM8AF52Ax */

/**
  * @brief SPI Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(SPI_IRQHandler, 10)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @brief Timer1 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#ifdef STM8S903
/**
  * @brief Timer5 Update/Overflow/Break/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
 
/**
  * @brief Timer5 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }

#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */
/**
  * @brief Timer2 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */

/*
 if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
  {
	  TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
  
	  Isr_IR_Timeout100us();
  }
*/

 if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
  {
	  TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
		
		/*超时计数，2秒内无刷新，视为转向恢复*/
		s_KeyDetCunt ++;
	
		if(s_KeyDetCunt > 5) {
			s_KeyDetCunt = 0;
			TIM2_Cmd(DISABLE);		
			
			/*发送转向恢复信号*/
			g_KeyTrigFlag = TRIG_VALID;
			g_KeyStat = KEY_NORMAL;
	
			/*停止检测*/
			s_u8KeyLRLine = KEY_DET_IDLE;
		}
	}
 }

/**
  * @brief Timer2 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
	{
		TIM2_ClearITPendingBit(TIM2_IT_UPDATE);

//		Isr_IR_Timeout100us();
	}
	
 }
#endif /*STM8S903*/

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \
    defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)
/**
  * @brief Timer3 Update/Overflow/Break Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	  if (TIM3_GetITStatus(TIM3_IT_UPDATE) != RESET)
	  {
		  TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
	  
		  Isr_IR_Timeout10ms();
	  }
 }

/**
  * @brief Timer3 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#endif /*STM8S208, STM8S207 or STM8S105 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */

#if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \
    defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
/**
  * @brief UART1 TX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
#ifdef _A8_COMM_UART1_
		 /* Write one byte to the transmit data register */
		UART1_SendData8(l_TxRBuf.buf[l_TxRBuf.read]);
		l_TxRBuf.read++;
		if(l_TxRBuf.read >= BUF_SIZE)
			l_TxRBuf.read = 0;
		
			if (l_TxRBuf.read == l_TxRBuf.write)
			{
					/* Disable the UART1 Transmit interrupt */
					UART1_ITConfig(UART1_IT_TXE, DISABLE);
			}
#endif
 }

/**
  * @brief UART1 RX Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
#if 0
	/* Read one byte from the receive data register */
	RxBuffer1[IncrementVar_RxCounter1()] = UART1_ReceiveData8();
	
	if (GetVar_RxCounter1() == GetVar_NbrOfDataToRead1())
	{
		/* Disable the UART1 Receive interrupt */
		UART1_ITConfig(UART1_IT_RXNE_OR, DISABLE);
	}
#endif
		
		
 }
#endif /*STM8S208 or STM8S207 or STM8S103 or STM8S903 or STM8AF62Ax or STM8AF52Ax */

/**
  * @brief I2C Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(I2C_IRQHandler, 19)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

#if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
/**
  * @brief UART2 TX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */

#ifdef VSP_BOARD
		 /* Write one byte to the transmit data register */
		UART2_SendData8(l_TxRBuf.buf[l_TxRBuf.read]);
		l_TxRBuf.read++;
		if(l_TxRBuf.read >= BUF_SIZE)
			l_TxRBuf.read = 0;
		
			if (l_TxRBuf.read == l_TxRBuf.write)
			{
					/* Disable the UART2 Transmit interrupt */
					UART2_ITConfig(UART2_IT_TXE, DISABLE);
			}
#endif
 }

/**
  * @brief UART2 RX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /* STM8S105 or STM8AF626x */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief UART3 TX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
#ifdef _A8_COMM_UART3_
		 /* Write one byte to the transmit data register */
		UART3_SendData8(l_TxRBuf.buf[l_TxRBuf.read]);
		l_TxRBuf.read++;
		if(l_TxRBuf.read >= BUF_SIZE)
			l_TxRBuf.read = 0;
		
			if (l_TxRBuf.read == l_TxRBuf.write)
			{
					/* Disable the UART1 Transmit interrupt */
					UART3_ITConfig(UART3_IT_TXE, DISABLE);
			}
#endif

UART3_ITConfig(UART3_IT_TXE, DISABLE);
 }

/**
  * @brief UART3 RX interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */

#if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
/**
  * @brief ADC2 interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#else /*STM8S105, STM8S103 or STM8S903 or STM8AF626x */
/**
  * @brief ADC1 interrupt routine.
  * @par Parameters:
  * None
  * @retval 
  * None
  */
 INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 {
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
 }
#endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */

#ifdef STM8S903
/**
  * @brief Timer6 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF52Ax or STM8AF62Ax or STM8AF626x */
/**
  * @brief Timer4 Update/Overflow Interrupt routine.
  * @param  None
  * @retval None
  */
 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
	
	if (TIM4_GetITStatus(TIM4_IT_UPDATE) != RESET)
  {
	  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
  
	  Isr_IR_Timeout100us();
  }
 }
#endif /*STM8S903*/

/**
  * @brief Eeprom EEC Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
{
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
}

/**
  * @}
  */

/******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/

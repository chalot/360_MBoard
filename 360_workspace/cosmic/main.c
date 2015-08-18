/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8s.h"
#include "periph.h"
#include "stdio.h"
#include "key.h"
#include "beep.h"
#include "comm.h"
#include "ir.h"

#define PUTCHAR_PROTOTYPE char putchar (char c)


/* Private function prototypes -----------------------------------------------*/
static void CLK_Config(void);
static void DBG_Config(void);


__IO uint32_t LsiFreq = 0;
void IWDG_Config(void);
uint32_t LSIMeasurment(void);


#if 0

/*主程序*/
void main()
{	
	 /*时钟初始化*/
  	CLK_Config();

	/* Check if the system has resumed from IWDG reset */
	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
	{
	  /* Clear IWDGF Flag */
	  RST_ClearFlag(RST_FLAG_IWDGF);
	}
	
	/* get measured LSI frequency */
//	LsiFreq = LSIMeasurment();	
	
	/* IWDG Configuration */
//	IWDG_Config();

	/*底板MCU调试串口配置*/
	DBG_Config();

	/*按键初始化*/
	KEY_Init();

	/*串口初始化*/
	COMM_Init();

	/*遥控器硬件初始化*/
	IR_Init();
	
	/*打开全局中断*/
	enableInterrupts();    

	while (1)
	{
		/*按键检测*/
		KEY_Process();

		/*红外遥控器处理*/
		IR_Process();

		/*串口通信处理*/
		COMM_Process();

		/*喂狗*/
//		IWDG_ReloadCounter();  
	}
		
}
#endif


/**
  * @brief  Configure system clock to run at 16Mhz
  * @param  None
  * @retval None
  */
void CLK_Config(void)
{
    /* Initialization of the clock */
    /* Clock divider to HSI/1 */
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
	CLK_HSICmd(ENABLE);

	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);			
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
//	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
	
}


/**
  * @brief  调试串口，UART3
  * @param  None
  * @retval None
  */
void DBG_Config()
{

	UART3_DeInit();

	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
			UART3_MODE_TXRX_ENABLE);
}

/**
  * @brief Retargets the C library printf function to the UART.
  * @param c Character to send
  * @retval char Character sent
  */
PUTCHAR_PROTOTYPE
{
  /* Write a character to the UART1 */
  UART3_SendData8(c);
  /* Loop until the end of transmission */
  while (UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);

  return (c);
}


/**
  * @brief  Configures the IWDG to generate a Reset if it is not refreshed at the
  *         correct time. 
  * @param  None
  * @retval None
  */
void IWDG_Config(void)
{
  /* IWDG timeout equal to 250 ms (the timeout may varies due to LSI frequency
     dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
  
  /* IWDG counter clock: LSI/128 */
  IWDG_SetPrescaler(IWDG_Prescaler_128);
  
  /* Set counter reload value to obtain 250ms IWDG TimeOut.
    Counter Reload Value = 250ms/IWDG counter clock period
                         = 250ms / (LSI/128)
                         = 0.25s / (LsiFreq/128)
                         = LsiFreq/(128 * 4)
                         = LsiFreq/512
   */
  IWDG_SetReload((uint8_t)(LsiFreq/512));
  
  /* Reload IWDG counter */
  IWDG_ReloadCounter();
  
  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG_Enable();
}


/**
  * @brief  Measure the LSI frequency using timer IC1 and update the calibration registers.
  * @note   It is recommended to use a timer clock frequency of at least 10MHz in order 
  *         to obtain a better in the LSI frequency measurement.
  * @param  None
  * @retval None
  */
u32 LSIMeasurment(void)
{

  uint32_t lsi_freq_hz = 0x0;
  uint32_t fmaster = 0x0;
  uint16_t ICValue1 = 0x0;
  uint16_t ICValue2 = 0x0;

  /* Get master frequency */
  fmaster = CLK_GetClockFreq();

  /* Enable the LSI measurement: LSI clock connected to timer Input Capture 1 */
  AWU->CSR |= AWU_CSR_MSR;

#if defined (STM8S903) || defined (STM8S103) || defined (STM8S003)
  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
  TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI,
              TIM1_ICPSC_DIV8, 0);
  
  /* Enable TIM1 */
  TIM1_Cmd(ENABLE);
  
  /* wait a capture on cc1 */
  while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM1_GetCapture1();
  TIM1_ClearFlag(TIM1_FLAG_CC1);
  
  /* wait a capture on cc1 */
  while((TIM1->SR1 & TIM1_FLAG_CC1) != TIM1_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue2 = TIM1_GetCapture1();
  TIM1_ClearFlag(TIM1_FLAG_CC1);
  
  /* Disable IC1 input capture */
  TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
  /* Disable timer2 */
  TIM1_Cmd(DISABLE);
  
#else  
  /* Measure the LSI frequency with TIMER Input Capture 1 */
  
  /* Capture only every 8 events!!! */
  /* Enable capture of TI1 */
  TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,
              TIM3_ICPSC_DIV8, 0);

  /* Enable TIM3 */
  TIM3_Cmd(ENABLE);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
  /* Get CCR1 value*/
  ICValue1 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* wait a capture on cc1 */
  while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
    /* Get CCR1 value*/
  ICValue2 = TIM3_GetCapture1();
  TIM3_ClearFlag(TIM3_FLAG_CC1);

  /* Disable IC1 input capture */
  TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
  /* Disable timer3 */
  TIM3_Cmd(DISABLE);
#endif

  /* Compute LSI clock frequency */
  lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
  
  /* Disable the LSI measurement: LSI clock disconnected from timer Input Capture 1 */
  AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);

 return (lsi_freq_hz);
}

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}


/*测试调试串口输出*/
#if 0
#include "utility.h"

/*主程序*/
void main()
{
	CLK_Config();
	
	/*通信串口初始化*/
	DBG_Config();

	/*打开全局中断*/
	enableInterrupts();    

	while (1)
	{
		u16 i = 1000;
		
		printf("Hello, world! my name is %s\n", "gaozhengdong");

		for(; i > 0; i--)
		{
			Delay_1ms();
		}
	}
		
}
#endif




/*测试IR*/
#if 1

/*主程序*/
void main()
{	
	CLK_Config();

	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	

	/* Check if the system has resumed from IWDG reset */
	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
	{
	  /* Clear IWDGF Flag */
	  RST_ClearFlag(RST_FLAG_IWDGF);
	}
	
	/*通信串口初始化*/
	DBG_Config();
	
	IR_Init();
	
	printf("starting...\n");

	/*打开全局中断*/
	enableInterrupts();    

	while (1)
	{
		IR_Process();
	}
		
}
#endif




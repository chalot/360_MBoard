#ifndef _PERIPH_H_
#define _PERIPH_H_

/*串口*/
#define UART_A8		UART1 ///核心板和底板通信串口
#define UART_DBG	UART3 ///底板调试串口


/*GPIO*/
/*ACC，PB6*/
#define GPIO_ACC_PORT		GPIOB	
#define GPIO_ACC_PIN		GPIO_PIN_2 

/*左，PB4*/
#define GPIO_LEFT_PORT	GPIOB	
#define GPIO_LEFT_PIN		GPIO_PIN_0

/*右，PB5*/
#define GPIO_RIGHT_PORT		GPIOB
#define GPIO_RIGHT_PIN		GPIO_PIN_3

/*后，PB1*/
#define GPIO_REAR_PORT		GPIOB
#define GPIO_REAR_PIN		GPIO_PIN_1

/*BEEP,PD4*/
#define GPIO_BEEP_PORT  	GPIOD
#define GPIO_BEEP_PIN		GPIO_PIN_4

/*IR，PB0*/
#define GPIO_IRCTL_PORT		GPIOD
#define GPIO_IRCTL_PIN		GPIO_PIN_3

/*UART CTRL，PE7*/
#define GPIO_UARTCTL_PORT		GPIOD
#define GPIO_UARTCTL_PIN		GPIO_PIN_3

/*CAN STB，PC4*/
#define GPIO_CANSTB_PORT		GPIOC
#define GPIO_CANSTB_PIN		GPIO_PIN_4



/*SPI flash*/
/*CS，PE5*/
#define GPIO_SPI_CS_PORT	GPIOE
#define GPIO_SPI_CS_PIN		GPIO_PIN_5
/*SCK，PC5*/
#define GPIO_SPI_SCK_PORT	GPIOC
#define GPIO_SPI_SCK_PIN		GPIO_PIN_5
/*MISO，PC7*/
#define GPIO_SPI_MISO_PORT	GPIOC
#define GPIO_SPI_MISO_PIN		GPIO_PIN_7
/*MOSI，PC5*/
#define GPIO_SPI_MOSI_PORT	GPIOC
#define GPIO_SPI_MOSI_PIN		GPIO_PIN_6

/*CAN*/
/*CAN RX，PG1*/
#define GPIO_CAN_RX_PORT	GPIOG
#define GPIO_CAN_RX_PIN		GPIO_PIN_1
/*CAN TX，PG0*/
#define GPIO_CAN_TX_PORT	GPIOG
#define GPIO_CAN_TX_PIN		GPIO_PIN_0
/*CAN STB，PB6*/
#define GPIO_CAN_STB_PORT	GPIOB
#define GPIO_CAN_STB_PIN	GPIO_PIN_6


/*Gsensor I2C*/
/*SCL，PE1*/
#define GPIO_GSENSOR_SCL_PORT	GPIOE
#define GPIO_GSENSOR_SCL_PIN	GPIO_PIN_1
/*SDA，PE2*/
#define GPIO_GSENSOR_SDA_PORT	GPIOE
#define GPIO_GSENSOR_SDA_PIN	GPIO_PIN_2
/*INT1，PC3*/
#define GPIO_GSENSOR_INT1_PORT	GPIOC
#define GPIO_GSENSOR_INT1_PIN	GPIO_PIN_3
/*INT2，PC2*/
#define GPIO_GSENSOR_INT2_PORT	GPIOC
#define GPIO_GSENSOR_INT2_PIN	GPIO_PIN_2
/*Gsensor CTRL，PE6*/
#define GPIO_GSENSOR_CTL_PORT	GPIOE
#define GPIO_GSENSOR_CTL_PIN	GPIO_PIN_6
/*RTC*/
#define GPIO_RTC_CLK_PORT		GPIOE
#define GPIO_RTC_CLK_PIN		GPIO_PIN_3

#define GPIO_RTC_DAT_PORT		GPIOD
#define GPIO_RTC_DAT_PIN		GPIO_PIN_0

#define GPIO_RTC_RST_PORT		GPIOA
#define GPIO_RTC_RST_PIN		GPIO_PIN_6


/*IR红外*/
#define GPIO_IR_PORT	GPIOE
#define GPIO_IR_PIN		GPIO_PIN_5
#define EXTI_IR_PORT	EXTI_PORT_GPIOE
#if 0
/*MCU_IR,PD0*/
#ifdef _CHANGE_IR_INPORT_
#define GPIO_IR_PORT	GPIOE
#define GPIO_IR_PIN		GPIO_PIN_5
#define EXTI_IR_PORT	EXTI_PORT_GPIOE
#else
#define GPIO_IR_PORT	GPIOA
#define GPIO_IR_PIN		GPIO_PIN_3
#define EXTI_IR_PORT	EXTI_PORT_GPIOA
#endif
#endif
/*IR_CTRL,PB0*/
#define GPIO_IR_CTRL_PORT		GPIOD
#define GPIO_IR_CTRL_PIN		GPIO_PIN_3



/*外部看门狗，PD7*/
#define GPIO_WDG_PORT	GPIOD
#define GPIO_WDG_PIN	GPIO_PIN_7

/*按键类型*/
typedef enum {	
	KEY_ACC = 0,//ACC 
	KEY_FRONT,	//前视
	KEY_LEFT,		//左视
	KEY_RIGHT,	//右转
	KEY_REAR,		//后视
//遥控器消息：
	MENU_BACK,	//返回
	MENU_LEFT,	//左翻
	MENU_RIGHT,	//右翻
	MENU_UP,		//上翻
	MENU_DOWN,	//下翻
	MENU_OK,		//确定
	MENU_POWER,	//电源
	
	KEY_FULL,	//四个视图
	
	KEY_RESERVED_1,
	KEY_RESERVED_2,

/*CAN消息*/
	FCW_DISTANCE,	/*前车距离*/
	FCW_WARNING,	/*报警等级*/
	
	KEY_END
} eKEYTYPE;



#endif

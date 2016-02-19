#ifndef _CONFIG_H_
#define _CONFIG_H_

/*使用VSP板子调试*/
//#define VSP_BOARD 	

#define __DEBUG__	//允许底板输出调试信息

#define _CHANGE_IR_INPORT_	//调换IR输入检测线，A3->E5


//#define _A8_COMM_UART3_		//底板-核心板通信，UART3
#define _A8_COMM_UART1_  //底板-核心板通信，UART1

#define _LEFT_PULSE_		/*左转向是脉冲触发*/
#define _RIGHT_PULSE_		/*右转向是脉冲触发*/


enum { TRIG_INVALID = 0, TRIG_VALID }; 



#endif



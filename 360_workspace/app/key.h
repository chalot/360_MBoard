#ifndef _KEY_H_
#define _KEY_H_

#include "stm8s.h"
#include "periph.h"




/*按键状态*/
typedef enum {
	KEY_NORMAL = 0,   /*正常*/
	KEY_ACTIVED	  /*触发，如方向切换时*/
} eKEYSTATE;

/*按键检测状态*/
typedef enum {
	DET_IDLE = 0,   /*空闲*/
	DET_DETECTING	  /*防抖检测中*/
} eDET;


/*按键检测状态*/
typedef struct {
	eDET		eDetState;
	u16 	  	u16Delay;
	u16    		u16Counts;			
} tKEYDET;


void KEY_Process(void);
void KEY_Init(void);
void ISR_Key(void);



/*按键类型*/
typedef enum {	
	KEY_DET_ACC = 0, 
//	KEY_DET_FRONT,
	KEY_DET_LEFT,
	KEY_DET_RIGHT,
	KEY_DET_REAR,
	KEY_DET_END
} _eKEYDETTYPE;




















#endif


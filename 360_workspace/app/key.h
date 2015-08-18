#ifndef _KEY_H_
#define _KEY_H_

#include "stm8s.h"
#include "periph.h"




/*����״̬*/
typedef enum {
	KEY_NORMAL = 0,   /*����*/
	KEY_ACTIVED	  /*�������緽���л�ʱ*/
} eKEYSTATE;

/*�������״̬*/
typedef enum {
	DET_IDLE = 0,   /*����*/
	DET_DETECTING	  /*���������*/
} eDET;


/*�������״̬*/
typedef struct {
	eDET		eDetState;
	u16 	  	u16Delay;
	u16    		u16Counts;			
} tKEYDET;


void KEY_Process(void);
void KEY_Init(void);
void ISR_Key(void);



/*��������*/
typedef enum {	
	KEY_DET_ACC = 0, 
//	KEY_DET_FRONT,
	KEY_DET_LEFT,
	KEY_DET_RIGHT,
	KEY_DET_REAR,
	KEY_DET_END
} _eKEYDETTYPE;




















#endif


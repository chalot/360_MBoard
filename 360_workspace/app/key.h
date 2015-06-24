#ifndef _KEY_H_
#define _KEY_H_

#include "stm8s.h"
#include "periph.h"




/*����״̬*/
typedef enum {
	KEY_NORMAL = 0,   /*����*/
	KEY_ACTIVED,	  /*�������緽���л�ʱ*/
} eKEYSTATE;

/*�������״̬*/
typedef enum {
	DET_IDLE = 0,   /*����*/
	DET_DETECTING,	  /*���������*/
} eDET;


/*�������״̬*/
typedef struct {
	eDET		eDetState;
	u16 	  	u16Delay;
	u16    		u16Counts;			
} tKEYDET;


void KEY_Process();
void KEY_Init();
void ISR_Key();























#endif


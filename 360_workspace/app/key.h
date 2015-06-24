#ifndef _KEY_H_
#define _KEY_H_

#include "stm8s.h"
#include "periph.h"




/*°´¼ü×´Ì¬*/
typedef enum {
	KEY_NORMAL = 0,   /*Õý³£*/
	KEY_ACTIVED,	  /*´¥·¢£¬Èç·½ÏòÇÐ»»Ê±*/
} eKEYSTATE;

/*°´¼ü¼ì²â×´Ì¬*/
typedef enum {
	DET_IDLE = 0,   /*¿ÕÏÐ*/
	DET_DETECTING,	  /*·À¶¶¼ì²âÖÐ*/
} eDET;


/*°´¼ü¼ì²â×´Ì¬*/
typedef struct {
	eDET		eDetState;
	u16 	  	u16Delay;
	u16    		u16Counts;			
} tKEYDET;


void KEY_Process();
void KEY_Init();
void ISR_Key();























#endif


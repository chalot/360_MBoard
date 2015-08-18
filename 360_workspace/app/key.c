/*
�������
����-GPIO������Ϊ�����غ��½��ش�����
����-��ƽ����ʱ����������ISR�����ð�������־������������⣻
*/

#include "key.h"
#include "utility.h"
#include "comm.h"

/*����ȫ��״̬*/
eKEYSTATE g_KeyState[KEY_DET_END];


/*�������״̬*/
static tKEYDET l_KeyDetStat[KEY_DET_END];

#define KEY_LOW   	0x00
#define KEY_HIGH		0x01

#define DET_JITERY	100    /*������������ʱ��100ms*/


static _eKEYDETTYPE l_KeyCurDet = KEY_DET_ACC;


static eKEYSTATE KEY_GetCurrentState(eKEYTYPE eType);
static void KEY_Lowlevel_Init(void);


void KEY_Process()
{
	eKEYTYPE i = 0;

	/*û�б仯*/
	if(g_KeyState[l_KeyCurDet] == KEY_GetCurrentState(l_KeyCurDet))
	{
		l_KeyCurDet ++;
		if(l_KeyCurDet == KEY_DET_END)
		{
			l_KeyCurDet = KEY_DET_ACC;
		}
		
		return;
	}

	/*��һ�μ�⵽�仯*/
	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_IDLE)
	{
		l_KeyDetStat[l_KeyCurDet].u16Counts = 0;
		l_KeyDetStat[l_KeyCurDet].eDetState = DET_DETECTING;
		return;
	}

	/*���������*/
	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_DETECTING)
	{
		l_KeyDetStat[l_KeyCurDet].u16Counts ++;
		if(l_KeyDetStat[l_KeyCurDet].u16Counts < DET_JITERY)
		{
			Delay_1ms();
			return;
		}
		else {
			/*����������������֪ͨ���ڷ�������*/
			l_KeyDetStat[l_KeyCurDet].eDetState = DET_IDLE;
			g_KeyState[l_KeyCurDet] = KEY_GetCurrentState(l_KeyCurDet);
			
			/*ͳһ�ź�����*/
			switch(l_KeyCurDet) 
			{
			case	KEY_DET_ACC:	
				COMM_RequestSendCommand(KEY_ACC, g_KeyState[KEY_DET_ACC]);
				break;
			case	KEY_DET_LEFT:	
				COMM_RequestSendCommand(KEY_LEFT, g_KeyState[KEY_DET_LEFT]);
				break;
			case	KEY_DET_RIGHT:	
				COMM_RequestSendCommand(KEY_RIGHT, g_KeyState[KEY_DET_RIGHT]);
				break;
			case	KEY_DET_REAR:	
				COMM_RequestSendCommand(KEY_REAR, g_KeyState[KEY_DET_REAR]);
				break;
			default:
				break;
			}
			return;			
		}
	}
	
}


void KEY_Lowlevel_Init()
{
	GPIO_Init(GPIO_ACC_PORT, (GPIO_Pin_TypeDef)GPIO_ACC_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(GPIO_LEFT_PORT, (GPIO_Pin_TypeDef)GPIO_LEFT_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(GPIO_RIGHT_PORT, (GPIO_Pin_TypeDef)GPIO_RIGHT_PIN, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(GPIO_REAR_PORT, (GPIO_Pin_TypeDef)GPIO_REAR_PIN, GPIO_MODE_IN_FL_NO_IT);

	  /* Initialize the Interrupt sensitivity */
  //EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_FALL);

	  /*��ֹ��TLI��������
	  TLIֻ��ҪôΪ�½���ҪôΪ�����أ�����ϣ��ͬʱ֧�֣�ò��TLI������*/
//	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);	 
}

void KEY_Init()
{
	u8 i = 0;

	/*GPIO��ʼ��*/
	KEY_Lowlevel_Init();

	/*��ʼ���������״̬*/
	while(i < KEY_DET_END) 
	{
	  l_KeyDetStat[i].eDetState = DET_IDLE;
	  l_KeyDetStat[i].u16Delay = DET_JITERY;
	  l_KeyDetStat[i].u16Counts = 0;

	  i++;
	}

	/*��ʼ��ȫ�ְ���״̬*/
	g_KeyState[KEY_DET_ACC] = KEY_GetCurrentState(KEY_DET_ACC);
	g_KeyState[KEY_DET_LEFT] = KEY_GetCurrentState(KEY_DET_LEFT);
	g_KeyState[KEY_DET_RIGHT] = KEY_GetCurrentState(KEY_DET_RIGHT);
	g_KeyState[KEY_DET_REAR] = KEY_GetCurrentState(KEY_DET_REAR);
}

eKEYSTATE KEY_GetCurrentState(eKEYTYPE eType)
{
	eKEYSTATE eStat;

	assert_param(eStat < KEY_DET_END);

	switch(eType)
	{
	case KEY_DET_ACC: 
		eStat = ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
		break;		
	case KEY_DET_LEFT: 
		eStat = ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
		break;		
	case KEY_DET_RIGHT: 
		eStat = ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
		break;		
	case KEY_DET_REAR: 
		eStat = ((GPIO_ReadInputData(GPIO_REAR_PORT) & GPIO_REAR_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
		break;		
	default:
		break;
	}

	return eStat;
}

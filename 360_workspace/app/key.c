/*
�������
����-GPIO������Ϊ�����غ��½��ش�����
����-��ƽ����ʱ����������ISR�����ð�������־������������⣻
*/

#include "key.h"


/*����ȫ��״̬*/
eKEYSTATE g_KeyState[KEY_END];


/*�������״̬*/
static tKEYDET l_KeyDetStat[KEY_END];

#define KEY_LOW   	0x00
#define KEY_HIGH	0x01

#define DET_JITERY	100    /*������������ʱ��100ms*/


static eKEYTYPE l_KeyCurDet = KEY_ACC;

void KEY_Process()
{
	u8 i = 0;

	while((i != l_KeyCurDet) && (i < KEY_END))
	{
		i++;
	}

	/*һ���������ͷ���¼��*/
	if(i == KEY_END)
	{
		l_KeyCurDet = KEY_ACC;
		return;
	}

	/*û�б仯*/
	if(g_KeyState[i] == KEY_GetCurrentState(i))
	{
		return;
	}

	/*��һ�μ�⵽�仯*/
	if(l_KeyDetStat[i].eDetState == DET_IDLE)
	{
		l_KeyDetStat[i].u16Counts = 0;
		l_KeyDetStat[i].eDetState = DET_DETECTING;
		return;
	}

	/*���������*/
	if(l_KeyDetStat[i].eDetState == DET_DETECTING)
	{
		l_KeyDetStat[i].u16Counts ++;
		if(l_KeyDetStat[i].u16Counts < DET_JITERY)
		{
			Delay_1ms();
			return;
		}
		else {
			/*����������������֪ͨ���ڷ�������*/
			l_KeyDetStat[i].eDetState = DET_IDLE;
			g_KeyState[i] = KEY_GetCurrentState(i);

			COMM_RequestSendCommand(i, g_KeyState[i]);
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
		
	/*��ʼ���������״̬*/
	while(i < KEY_END) 
	{
	  l_KeyDetStat[i].eDetState = DET_IDLE;
	  l_KeyDetStat[i].u16Delay = DET_JITERY;
	  l_KeyDetStat[i].u16Counts = 0;

	  i++;
	}

	/*��ʼ��ȫ�ְ���״̬*/
	g_KeyState[KEY_ACC] = KEY_NORMAL;
	g_KeyState[KEY_LEFT] = KEY_NORMAL;
	g_KeyState[KEY_RIGHT] = KEY_NORMAL;
	g_KeyState[KEY_REAR] = KEY_NORMAL;

	KEY_Lowlevel_Init();
  
}


eKEYSTATE KEY_GetCurrentState(eKEYTYPE)
{
	eKEYSTATE eStat;

	assert_param(eStat < KEY_END);

	switch(eKEYSTATE)
	{
	case KEY_ACC: 
		eStat = ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == KEY_LOW) ? KEY_NORMAL : KEY_ACTIVED;
		break;		
	case KEY_LEFT: 
		eStat = ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == KEY_LOW) ? KEY_NORMAL : KEY_ACTIVED;
		break;		
	case KEY_RIGHT: 
		eStat = ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == KEY_LOW) ? KEY_NORMAL : KEY_ACTIVED;
		break;		
	case KEY_REAR: 
		eStat = ((GPIO_ReadInputData(GPIO_REAR_PORT) & GPIO_REAR_PIN) == KEY_LOW) ? KEY_NORMAL : KEY_ACTIVED;
		break;		
	default:
		break;
	}

	return eStat;
}

#if 0	
/**
  * @brief  �ⲿ�����źż��ISR
  * @retval None
  */
void ISR_Key(void)
{
	/*ACC*/
	if ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == 0x00)
	{
		Comm_ReqSendCommand();
	}
	
	/*��ת��*/
	if ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == 0x00)
	{
		GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
	}
	if ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == 0x00)
	{
		GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
	}
	if ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == 0x00)
	{
		GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
	}
	if ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == 0x00)
	{
		GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
	}
	if ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == 0x00)
	{
		GPIO_WriteReverse(LEDS_PORT, LED1_PIN);
	}
	
}
#endif



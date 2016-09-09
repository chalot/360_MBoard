#include "can.h"
#include "utility.h"
#include "stm8s.h"
#include "periph.h"
#include "comm.h"
#ifdef __DEBUG__
#include "stdio.h"
#endif

#define	MSG_VALID		1
#define	MSG_INVALID		0

/* 使能CAN接收 */
#define CAN_RX_ENABLE	do {	\
							CAN_ITConfig(CAN_IT_FMP, ENABLE);	\
						}while(0);

/* 禁止CAN接收 */
#define CAN_RX_DISABLE	do {	\
							CAN_ITConfig(CAN_IT_FMP, DISABLE);	\
						}while(0);


/*定义CAN消息接收缓区*/
typedef struct CAN_MSGQUEUETag
{
	tCAN_MSG 	m_Queue[CAN_MSG_QUEUE_LEN];
	u8			m_Valid[CAN_MSG_QUEUE_LEN];
	u16 		m_u16Write;
	u16 		m_u16Read;
} tCAN_MSGQUEUE;



/*定义CAN消息接收缓区*/
static tCAN_MSGQUEUE 	l_tMsgQ;

/*本地函数声明*/
static void CAN_InitMsgQueue(void);
static void CAN_LowConfig(void);
static int CAN_IsMsgQEmpty(void);
static int CAN_IsMsgQFull(void);
static int CAN_HandleMsg(tCAN_MSG *ptMsg);

static void CAN_Test_Echo(tCAN_MSG *ptMsg);


/**
*	CAN处理过程
*/
void CAN_Process(void)
{
static tCAN_MSG msg;
	int ret = 0;

	/*提取CAN帧*/
	if(-1 == CAN_GetMsg(&msg))	{
		return;
	}

	/*处理和转发CAN信息给A8*/
	ret = CAN_HandleMsg(&msg);
	if(-1 == ret) {
		/*出错了*/
		#ifdef __DEBUG__
		printf("[CAN] process error!\n");
		#endif
	}
}


/**
*	CAN模块初始化
*/
void CAN_Initialize(void)
{
	/*初始化数据队列*/
	CAN_InitMsgQueue();

	/*硬件初始化*/
	CAN_LowConfig();
}

/**
  * @brief 帧解析处理
  * @par Parameters:	[IN]	ptCAN_MSG	帧结构体
  * 
  * @retval 0=成功，-1=失败
  */
int CAN_HandleMsg(tCAN_MSG *ptMsg)
{
	assert_param(ptMsg != (void*)0);
	if(ptMsg == (void*)0)
	{
		return -1;
	}

	/*ID号合法性检查*/
	if((ptMsg->u32ID != ID_DIST) && (ptMsg->u32ID != ID_WARN))
	{
		return -1;
	}

#ifdef CAN_ECHO
	/*测试，echo接收帧*/
	CAN_Test_Echo(ptMsg);
#endif

	/*报文1：前车距离,100ms*/
	if(ptMsg->u32ID == ID_DIST)
	{
		/*
		符合比例系数和偏移量描述的总线传输数据到物理量的转换公式为：
		y=K*x+D
		K：比例系数    D：偏移量	 x：总线传输的数据		y：物理量
		*/				

		tMSG_CMD tCmd;
		u16 u16Distance = 0; 
		float fRealDistance = 0;

		u16Distance = ((u16)(ptMsg->Data[0]) << 8) | ptMsg->Data[1];
		fRealDistance = K_SCALE * u16Distance + D_OFFSET;

		/*组织待发送数据包*/
		tCmd.head = CMD_HEAD; /*消息头，0x55*/
		tCmd.cmd = FCW_DISTANCE;	/*距离信息*/
		tCmd.param[0] = ptMsg->Data[0];	/*高8位*/
		tCmd.param[1] = ptMsg->Data[1]; /*低8位*/
		tCmd.param[2] = 0;
		tCmd.param[3] = 0;
		tCmd.checksum = CalChecksum((u8*)&tCmd, sizeof(tMSG_CMD) - 1);
		
		/*由串口发送给A8*/
		COMM_RequestSendCommand_CAN(&tCmd);

		#ifdef __DEBUG__
		printf("[CAN] type = DISTANCE, HB:%x LB:%x, realVal = %5.1f\n", 
				tCmd.param[0], tCmd.param[1], fRealDistance);
		#endif

		return 0;
	}

	/*报文2：报警等级,100ms*/
	if(ptMsg->u32ID == ID_WARN)
	{
		/*0=无目标；1=目标安全;2=报警等级1；3=报警等级2；4=短距离报警*/
		/*组织待发送数据包*/
		tMSG_CMD tCmd;

		tCmd.head = CMD_HEAD; /*消息头，0x55*/
		tCmd.cmd = FCW_WARNING;	/*报警等级*/
		tCmd.param[0] = ptMsg->Data[1]; 
		tCmd.param[1] = 0; 
		tCmd.param[2] = 0;
		tCmd.param[3] = 0;
		tCmd.checksum = CalChecksum((u8*)&tCmd, sizeof(tMSG_CMD) - 1);
		
		/*由串口发送给A8*/
		COMM_RequestSendCommand_CAN(&tCmd);

		#ifdef __DEBUG__
		printf("[CAN] type = WARNING, level = %d\n", tCmd.param[0]);
		#endif
		
		return 0;
	}

	return -1;
}


/**
  * @brief 清楚帧内容
  * @par Parameters:	[IN]	ptCAN_MSG	帧结构体
  * 
  * @retval 
  */
static void CAN_ClearMsg(tCAN_MSG *ptCAN_Msg)
{		
	assert_param(ptCAN_Msg != (void*)0);
	
	if(ptCAN_Msg == (void*)0)
	{
		return;
	}
	
	ptCAN_Msg->Data[0] = 0;	
	ptCAN_Msg->Data[1] = 0;	
	ptCAN_Msg->Data[2] = 0;	
	ptCAN_Msg->Data[3] = 0;	
	ptCAN_Msg->Data[4] = 0;	
	ptCAN_Msg->Data[5] = 0;	
	ptCAN_Msg->Data[6] = 0;	
	ptCAN_Msg->Data[7] = 0;	
					
	ptCAN_Msg->u32ID = 0;		
	ptCAN_Msg->u8DLC = 0;	
}

/**
*	CAN数据队列初始化
*/
void CAN_InitMsgQueue(void)
{
	u16 i = 0;

	for(i = 0; i < CAN_MSG_QUEUE_LEN; i++)
	{
		CAN_ClearMsg(&l_tMsgQ.m_Queue[i]);	/*清空数据内容*/
		l_tMsgQ.m_Valid[i] = MSG_INVALID;	/*清空数据有效标志*/
	}

	l_tMsgQ.m_u16Read = 0;
	l_tMsgQ.m_u16Write = 0;
}

/**
  * @brief 接收一个新帧
  * @par Parameters:	[IN]	ptCAN_MSG	帧结构体
  * 
  * @retval int	0=成功，-1=失败
  */
int CAN_AddMsg(tCAN_MSG *ptCAN_MSG)
{
	tCAN_MSG *ptMsg;

	assert_param(ptCAN_MSG != (void*)0);
	
	if(ptCAN_MSG == (void*)0)
	{
		return -1;
	}
	
	CAN_RX_DISABLE

	if(l_tMsgQ.m_Valid[l_tMsgQ.m_u16Write] == MSG_VALID)
	{
			CAN_RX_ENABLE
			return -1;
	}

	ptMsg =	&l_tMsgQ.m_Queue[l_tMsgQ.m_u16Write];

	ptMsg->u32ID = ptCAN_MSG->u32ID;
	ptMsg->u8DLC = ptCAN_MSG->u8DLC;

	ptMsg->Data[0] = ptCAN_MSG->Data[0];
	ptMsg->Data[1] = ptCAN_MSG->Data[1];
	ptMsg->Data[2] = ptCAN_MSG->Data[2];
	ptMsg->Data[3] = ptCAN_MSG->Data[3];
	ptMsg->Data[4] = ptCAN_MSG->Data[4];
	ptMsg->Data[5] = ptCAN_MSG->Data[5];
	ptMsg->Data[6] = ptCAN_MSG->Data[6];
	ptMsg->Data[7] = ptCAN_MSG->Data[7];

	l_tMsgQ.m_Valid[l_tMsgQ.m_u16Write] = MSG_VALID;

	l_tMsgQ.m_u16Write++;
	if(l_tMsgQ.m_u16Write >= CAN_MSG_QUEUE_LEN)
	{
		l_tMsgQ.m_u16Write = 0;
	}

	CAN_RX_ENABLE

	return 0;

}

/**
  * @brief 提取一帧CAN数据
  * @par Parameters:	ptCAN_MSG	[IN]	帧
  * 
  * @retval int	-1=失败，0=成功
  */
int CAN_GetMsg(tCAN_MSG *ptCAN_MSG)
{
	tCAN_MSG *ptMsg;

	assert_param(ptCAN_MSG != (void*)0);
	
	if(ptCAN_MSG == (void*)0)
	{
		return -1;
	}

	CAN_RX_DISABLE	
	
	if(l_tMsgQ.m_Valid[l_tMsgQ.m_u16Read] == MSG_INVALID)
	{
			CAN_RX_ENABLE
			return -1;
	}

	ptMsg = &l_tMsgQ.m_Queue[l_tMsgQ.m_u16Read];

	ptCAN_MSG->u32ID = ptMsg->u32ID;
	ptCAN_MSG->u8DLC = ptMsg->u8DLC;

	ptCAN_MSG->Data[0] = ptMsg->Data[0] ;
	ptCAN_MSG->Data[1] = ptMsg->Data[1];
	ptCAN_MSG->Data[2] = ptMsg->Data[2];
	ptCAN_MSG->Data[3] = ptMsg->Data[3];
	ptCAN_MSG->Data[4] = ptMsg->Data[4];
	ptCAN_MSG->Data[5] = ptMsg->Data[5];
	ptCAN_MSG->Data[6] = ptMsg->Data[6];
	ptCAN_MSG->Data[7] = ptMsg->Data[7];

	l_tMsgQ.m_Valid[l_tMsgQ.m_u16Read] = MSG_INVALID;

	l_tMsgQ.m_u16Read++;
	if(l_tMsgQ.m_u16Read >= CAN_MSG_QUEUE_LEN)
	{
		l_tMsgQ.m_u16Read = 0;
	}

	CAN_RX_ENABLE
		
	return 0;
}


/**
  * @brief 检测队列是否为空
  * @par Parameters:	
  * 
  * @retval int	1=空，0=非空
  */
int CAN_IsMsgQEmpty(void)
{	
	if(l_tMsgQ.m_u16Read == l_tMsgQ.m_u16Write) {
		return 1;
	} else {
		return 0;
	}	
}

/**
  * @brief 检测队列是否满
  * @par Parameters:	
  * 
  * @retval int	0=未满，1=满
  */
int CAN_IsMsgQFull(void)
{
	u16 i = 0;

	for(i = 0; i < CAN_MSG_QUEUE_LEN; i++)
	{
		if(l_tMsgQ.m_Valid[i] == MSG_INVALID) {
			return 0;
		}
	}

	return 1;
}
	



/**
  * @brief CAN配置
  * @par Parameters:
  * None
  * @retval None
  * @par Required preconditions:
  * None
  */
void CAN_LowConfig(void)
{
	CAN_InitStatus_TypeDef status = CAN_InitStatus_Failed;

	/* Filter Parameters */
	CAN_FilterNumber_TypeDef CAN_FilterNumber;
	FunctionalState CAN_FilterActivation;
	CAN_FilterMode_TypeDef CAN_FilterMode;
	CAN_FilterScale_TypeDef CAN_FilterScale;
	u8 CAN_FilterID1;
	u8 CAN_FilterID2;
	u8 CAN_FilterID3;
	u8 CAN_FilterID4;
	u8 CAN_FilterIDMask1;
	u8 CAN_FilterIDMask2;
	u8 CAN_FilterIDMask3;
	u8 CAN_FilterIDMask4; 

	/* Init Parameters*/
	CAN_MasterCtrl_TypeDef CAN_MasterCtrl;
	CAN_Mode_TypeDef CAN_Mode;
	CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth;
	CAN_BitSeg1_TypeDef CAN_BitSeg1;
	CAN_BitSeg2_TypeDef CAN_BitSeg2;
	u8 CAN_Prescaler = 0; 

	/* CAN register init */
	CAN_DeInit();

	/* CAN	init */
	CAN_MasterCtrl=CAN_MasterCtrl_AllDisabled;
	CAN_Mode = CAN_Mode_Normal;
	CAN_SynJumpWidth = CAN_SynJumpWidth_1TimeQuantum;
	CAN_BitSeg1 = CAN_BitSeg1_8TimeQuantum;
	CAN_BitSeg2 = CAN_BitSeg2_7TimeQuantum;
	//  CAN_Prescaler = 1; //1M bps
	CAN_Prescaler = 2; //500 bps，苏州清华协议波特率
	//	  CAN_Prescaler = 4; //(pclk1/((1+8+7)*9)) = 16Mhz/16/4 = 250Kbits

	status = CAN_Init(CAN_MasterCtrl,CAN_Mode,CAN_SynJumpWidth,
						CAN_BitSeg1,CAN_BitSeg2,CAN_Prescaler);
	assert_param(status == CAN_InitStatus_Success);
	
	/* CAN filter init */
	CAN_FilterNumber = 0;
	CAN_FilterActivation = ENABLE;
	CAN_FilterMode = CAN_FilterMode_IdMask;
	CAN_FilterScale = CAN_FilterScale_32Bit;
	CAN_FilterID1=0;  
	CAN_FilterID2=0;
	CAN_FilterID3=0;
	CAN_FilterID4=0;
	CAN_FilterIDMask1=0;
	CAN_FilterIDMask2=0;
	CAN_FilterIDMask3=0;
	CAN_FilterIDMask4=0;  
	CAN_FilterInit(CAN_FilterNumber, CAN_FilterActivation, CAN_FilterMode, 
					CAN_FilterScale,CAN_FilterID1, CAN_FilterID2, CAN_FilterID3, 
					CAN_FilterID4,CAN_FilterIDMask1, CAN_FilterIDMask2, 
					CAN_FilterIDMask3, CAN_FilterIDMask4
					);

	/*CAN Standby管脚配置*/
	GPIO_Init(GPIO_CANSTB_PORT, (GPIO_Pin_TypeDef)GPIO_CANSTB_PIN, 
		GPIO_MODE_OUT_PP_HIGH_FAST);
	/*CAN Standby管脚拉低，强制正常工作模式*/
	GPIO_WriteLow(GPIO_CANSTB_PORT, GPIO_CANSTB_PIN);	

	  /* Enable Fifo message pending interrupt*/
	/* Message reception is done by CAN_RX ISR*/
	CAN_ITConfig(CAN_IT_FMP, ENABLE);

}

#ifdef CAN_ECHO
void CAN_Test_Echo(tCAN_MSG *ptMsg)
{
	tCAN_MSG can_msg;
	CAN_TxStatus_TypeDef status = CAN_TxStatus_Failed;
	
	/* Transmit Parameters */
	CAN_Id_TypeDef Tx_IDE = CAN_Id_Standard;
	CAN_RTR_TypeDef Tx_RTR = CAN_RTR_Data;
	uint8_t Tx_DLC = 0;
	uint8_t Tx_Data[8] = {0};
	uint32_t Tx_Id = 0;
	
	static u8 index = 0;
	static unsigned int errCnt = 0;
	static unsigned int okCnt = 0;


/* Transmit Parameters*/
	 Tx_Id = ptMsg->u32ID;;
	 Tx_IDE = CAN_Id_Standard;
	 Tx_RTR = CAN_RTR_Data;
	 Tx_DLC = 8;
	 Tx_Data[0] = ptMsg->Data[0];
	 Tx_Data[1] = ptMsg->Data[1];
	 Tx_Data[2] = ptMsg->Data[2];
	 Tx_Data[3] = ptMsg->Data[3];
	 Tx_Data[4] = ptMsg->Data[4];
	 Tx_Data[5] = ptMsg->Data[5];
	 Tx_Data[6] = ptMsg->Data[6];
	 Tx_Data[7] = ptMsg->Data[7];
	 
	 /* Sender send Frame */
	 status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
	if(status == CAN_TxStatus_Failed) {
		errCnt ++;
		}
	else if(status == CAN_TxStatus_Ok) {
		okCnt ++;
		}
}
#endif

void CAN_TestSend(void)
{

CAN_TxStatus_TypeDef status = CAN_TxStatus_Failed;

/* Transmit Parameters */
CAN_Id_TypeDef Tx_IDE = CAN_Id_Standard;
CAN_RTR_TypeDef Tx_RTR = CAN_RTR_Data;
uint8_t Tx_DLC = 0;
uint8_t Tx_Data[8] = {0};
uint32_t Tx_Id = 0;

static u8 index = 0;
static unsigned int errCnt = 0;
static unsigned int okCnt = 0;


/* Transmit Parameters*/
	 Tx_Id = 0x31;
	 Tx_IDE = CAN_Id_Standard;
	 Tx_RTR = CAN_RTR_Data;
	 Tx_DLC = 8;
	 Tx_Data[0] = index++;
	 Tx_Data[1] = index++;
	 Tx_Data[2] = index++;
	 Tx_Data[3] = index++;
	 Tx_Data[4] = index++;
	 Tx_Data[5] = index++;
	 Tx_Data[6] = index++;
	 Tx_Data[7] = index++;
	 
	 /* Sender send Frame */
	 status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
	if(status == CAN_TxStatus_Failed) {
		errCnt ++;
		}
	else if(status == CAN_TxStatus_Ok) {
		okCnt ++;
		}

}

#include "utility.h"
void CAN_TestRecieve(void)
{

#if 1
	tCAN_MSG	tMsg;

	tMsg.u32ID = ID_WARN;
	tMsg.u8DLC = 8;
	tMsg.Data[0] = 0;	
	tMsg.Data[1] = 3;	//报警等级
	tMsg.Data[2] = 0;
	tMsg.Data[3] = 0;	
	tMsg.Data[4] = 0;
	tMsg.Data[5] = 0;
	tMsg.Data[6] = 0;
	tMsg.Data[7] = 0;

	CAN_AddMsg(&tMsg);

	
	tMsg.u32ID = ID_DIST;
	tMsg.u8DLC = 8;
	tMsg.Data[0] = 0x06;	//距离
	tMsg.Data[1] = 0xb0;
	tMsg.Data[2] = 0x0;
	tMsg.Data[3] = 0x0;
	tMsg.Data[4] = 0;
	tMsg.Data[5] = 0;
	tMsg.Data[6] = 0;
	tMsg.Data[7] = 0;
	
	CAN_AddMsg(&tMsg);	

	Delay_nms(1000);
#endif

}


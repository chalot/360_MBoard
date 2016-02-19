   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               L5_l_KeyCurDet:
  17  0000 00            	dc.b	0
 164                     ; 38 void KEY_Process()
 164                     ; 39 {
 166                     	switch	.text
 167  0000               _KEY_Process:
 169  0000 89            	pushw	x
 170       00000002      OFST:	set	2
 173                     ; 40 	eKEYTYPE i = 0;
 175  0001 0f02          	clr	(OFST+0,sp)
 176                     ; 43 	if(g_KeyTrigFlag == TRIG_VALID) {
 178  0003 b60c          	ld	a,_g_KeyTrigFlag
 179  0005 a101          	cp	a,#1
 180  0007 260b          	jrne	L111
 181                     ; 44 			COMM_RequestSendCommand(g_KeyId, g_KeyStat);
 183  0009 b60b          	ld	a,_g_KeyStat
 184  000b 97            	ld	xl,a
 185  000c b60a          	ld	a,_g_KeyId
 186  000e 95            	ld	xh,a
 187  000f cd0000        	call	_COMM_RequestSendCommand
 189                     ; 46 			g_KeyTrigFlag = TRIG_INVALID;
 191  0012 3f0c          	clr	_g_KeyTrigFlag
 192  0014               L111:
 193                     ; 50 	if(g_KeyState[l_KeyCurDet] == KEY_GetCurrentState(l_KeyCurDet))
 195  0014 b600          	ld	a,L5_l_KeyCurDet
 196  0016 cd0155        	call	L7_KEY_GetCurrentState
 198  0019 6b01          	ld	(OFST-1,sp),a
 199  001b b600          	ld	a,L5_l_KeyCurDet
 200  001d 5f            	clrw	x
 201  001e 97            	ld	xl,a
 202  001f e60d          	ld	a,(_g_KeyState,x)
 203  0021 1101          	cp	a,(OFST-1,sp)
 204  0023 260c          	jrne	L311
 205                     ; 52 		l_KeyCurDet ++;
 207  0025 3c00          	inc	L5_l_KeyCurDet
 208                     ; 53 		if(l_KeyCurDet == KEY_DET_END)
 210  0027 b600          	ld	a,L5_l_KeyCurDet
 211  0029 a102          	cp	a,#2
 212  002b 2602          	jrne	L511
 213                     ; 55 			l_KeyCurDet = KEY_DET_ACC;
 215  002d 3f00          	clr	L5_l_KeyCurDet
 216  002f               L511:
 217                     ; 58 		return;
 219  002f 201e          	jra	L6
 220  0031               L311:
 221                     ; 62 	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_IDLE)
 223  0031 b600          	ld	a,L5_l_KeyCurDet
 224  0033 97            	ld	xl,a
 225  0034 a605          	ld	a,#5
 226  0036 42            	mul	x,a
 227  0037 6d00          	tnz	(L3_l_KeyDetStat,x)
 228  0039 2616          	jrne	L711
 229                     ; 64 		l_KeyDetStat[l_KeyCurDet].u16Counts = 0;
 231  003b b600          	ld	a,L5_l_KeyCurDet
 232  003d 97            	ld	xl,a
 233  003e a605          	ld	a,#5
 234  0040 42            	mul	x,a
 235  0041 905f          	clrw	y
 236  0043 ef03          	ldw	(L3_l_KeyDetStat+3,x),y
 237                     ; 65 		l_KeyDetStat[l_KeyCurDet].eDetState = DET_DETECTING;
 239  0045 b600          	ld	a,L5_l_KeyCurDet
 240  0047 97            	ld	xl,a
 241  0048 a605          	ld	a,#5
 242  004a 42            	mul	x,a
 243  004b a601          	ld	a,#1
 244  004d e700          	ld	(L3_l_KeyDetStat,x),a
 245                     ; 66 		return;
 246  004f               L6:
 249  004f 85            	popw	x
 250  0050 81            	ret
 251  0051               L711:
 252                     ; 70 	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_DETECTING)
 254  0051 b600          	ld	a,L5_l_KeyCurDet
 255  0053 97            	ld	xl,a
 256  0054 a605          	ld	a,#5
 257  0056 42            	mul	x,a
 258  0057 e600          	ld	a,(L3_l_KeyDetStat,x)
 259  0059 a101          	cp	a,#1
 260  005b 2675          	jrne	L121
 261                     ; 72 		l_KeyDetStat[l_KeyCurDet].u16Counts ++;
 263  005d b600          	ld	a,L5_l_KeyCurDet
 264  005f 97            	ld	xl,a
 265  0060 a605          	ld	a,#5
 266  0062 42            	mul	x,a
 267  0063 9093          	ldw	y,x
 268  0065 ee03          	ldw	x,(L3_l_KeyDetStat+3,x)
 269  0067 1c0001        	addw	x,#1
 270  006a 90ef03        	ldw	(L3_l_KeyDetStat+3,y),x
 271                     ; 73 		if(l_KeyDetStat[l_KeyCurDet].u16Counts < DET_JITERY)
 273  006d b600          	ld	a,L5_l_KeyCurDet
 274  006f 97            	ld	xl,a
 275  0070 a605          	ld	a,#5
 276  0072 42            	mul	x,a
 277  0073 9093          	ldw	y,x
 278  0075 90ee03        	ldw	y,(L3_l_KeyDetStat+3,y)
 279  0078 90a30064      	cpw	y,#100
 280  007c 2405          	jruge	L321
 281                     ; 75 			Delay_1ms();
 283  007e cd0000        	call	_Delay_1ms
 285                     ; 76 			return;
 287  0081 20cc          	jra	L6
 288  0083               L321:
 289                     ; 80 			l_KeyDetStat[l_KeyCurDet].eDetState = DET_IDLE;
 291  0083 b600          	ld	a,L5_l_KeyCurDet
 292  0085 97            	ld	xl,a
 293  0086 a605          	ld	a,#5
 294  0088 42            	mul	x,a
 295  0089 6f00          	clr	(L3_l_KeyDetStat,x)
 296                     ; 81 			g_KeyState[l_KeyCurDet] = KEY_GetCurrentState(l_KeyCurDet);
 298  008b b600          	ld	a,L5_l_KeyCurDet
 299  008d 5f            	clrw	x
 300  008e 97            	ld	xl,a
 301  008f 89            	pushw	x
 302  0090 b600          	ld	a,L5_l_KeyCurDet
 303  0092 cd0155        	call	L7_KEY_GetCurrentState
 305  0095 85            	popw	x
 306  0096 e70d          	ld	(_g_KeyState,x),a
 307                     ; 84 			switch(l_KeyCurDet) 
 309  0098 b600          	ld	a,L5_l_KeyCurDet
 311                     ; 98 			default:
 311                     ; 99 				break;
 312  009a 4d            	tnz	a
 313  009b 270c          	jreq	L51
 314  009d 4a            	dec	a
 315  009e 2729          	jreq	L32
 316  00a0 a002          	sub	a,#2
 317  00a2 270f          	jreq	L71
 318  00a4 4a            	dec	a
 319  00a5 2717          	jreq	L12
 320  00a7 2029          	jra	L131
 321  00a9               L51:
 322                     ; 86 			case	KEY_DET_ACC:	
 322                     ; 87 				COMM_RequestSendCommand(KEY_ACC, g_KeyState[KEY_DET_ACC]);
 324  00a9 b60d          	ld	a,_g_KeyState
 325  00ab 97            	ld	xl,a
 326  00ac 4f            	clr	a
 327  00ad 95            	ld	xh,a
 328  00ae cd0000        	call	_COMM_RequestSendCommand
 330                     ; 88 				break;
 332  00b1 201f          	jra	L131
 333  00b3               L71:
 334                     ; 89 			case	KEY_DET_LEFT:	
 334                     ; 90 				COMM_RequestSendCommand(KEY_LEFT, g_KeyState[KEY_DET_LEFT]);
 336  00b3 b610          	ld	a,_g_KeyState+3
 337  00b5 97            	ld	xl,a
 338  00b6 a602          	ld	a,#2
 339  00b8 95            	ld	xh,a
 340  00b9 cd0000        	call	_COMM_RequestSendCommand
 342                     ; 91 				break;
 344  00bc 2014          	jra	L131
 345  00be               L12:
 346                     ; 92 			case	KEY_DET_RIGHT:	
 346                     ; 93 				COMM_RequestSendCommand(KEY_RIGHT, g_KeyState[KEY_DET_RIGHT]);
 348  00be b611          	ld	a,_g_KeyState+4
 349  00c0 97            	ld	xl,a
 350  00c1 a603          	ld	a,#3
 351  00c3 95            	ld	xh,a
 352  00c4 cd0000        	call	_COMM_RequestSendCommand
 354                     ; 94 				break;
 356  00c7 2009          	jra	L131
 357  00c9               L32:
 358                     ; 95 			case	KEY_DET_REAR:	
 358                     ; 96 				COMM_RequestSendCommand(KEY_REAR, g_KeyState[KEY_DET_REAR]);
 360  00c9 b60e          	ld	a,_g_KeyState+1
 361  00cb 97            	ld	xl,a
 362  00cc a604          	ld	a,#4
 363  00ce 95            	ld	xh,a
 364  00cf cd0000        	call	_COMM_RequestSendCommand
 366                     ; 97 				break;
 368  00d2               L52:
 369                     ; 98 			default:
 369                     ; 99 				break;
 371  00d2               L131:
 372                     ; 101 			return;			
 374  00d2               L121:
 375                     ; 106 }
 376  00d2               L01:
 379  00d2 85            	popw	x
 380  00d3 81            	ret
 406                     ; 109 void KEY_IO_Init()
 406                     ; 110 {
 407                     	switch	.text
 408  00d4               L11_KEY_IO_Init:
 412                     ; 111 	GPIO_Init(GPIO_ACC_PORT, (GPIO_Pin_TypeDef)GPIO_ACC_PIN, GPIO_MODE_IN_PU_NO_IT);
 414  00d4 4b40          	push	#64
 415  00d6 4b04          	push	#4
 416  00d8 ae5005        	ldw	x,#20485
 417  00db cd0000        	call	_GPIO_Init
 419  00de 85            	popw	x
 420                     ; 115 	GPIO_Init(GPIO_LEFT_PORT, (GPIO_Pin_TypeDef)GPIO_LEFT_PIN, GPIO_MODE_IN_FL_IT);
 422  00df 4b20          	push	#32
 423  00e1 4b01          	push	#1
 424  00e3 ae5005        	ldw	x,#20485
 425  00e6 cd0000        	call	_GPIO_Init
 427  00e9 85            	popw	x
 428                     ; 121 	GPIO_Init(GPIO_RIGHT_PORT, (GPIO_Pin_TypeDef)GPIO_RIGHT_PIN, GPIO_MODE_IN_FL_IT);
 430  00ea 4b20          	push	#32
 431  00ec 4b08          	push	#8
 432  00ee ae5005        	ldw	x,#20485
 433  00f1 cd0000        	call	_GPIO_Init
 435  00f4 85            	popw	x
 436                     ; 126 	GPIO_Init(GPIO_REAR_PORT, (GPIO_Pin_TypeDef)GPIO_REAR_PIN, GPIO_MODE_IN_PU_NO_IT);
 438  00f5 4b40          	push	#64
 439  00f7 4b02          	push	#2
 440  00f9 ae5005        	ldw	x,#20485
 441  00fc cd0000        	call	_GPIO_Init
 443  00ff 85            	popw	x
 444                     ; 129 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
 446  0100 ae0002        	ldw	x,#2
 447  0103 a601          	ld	a,#1
 448  0105 95            	ld	xh,a
 449  0106 cd0000        	call	_EXTI_SetExtIntSensitivity
 451                     ; 130 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 453  0109 4f            	clr	a
 454  010a cd0000        	call	_EXTI_SetTLISensitivity
 456                     ; 132 }
 459  010d 81            	ret
 501                     ; 134 void KEY_Init()
 501                     ; 135 {
 502                     	switch	.text
 503  010e               _KEY_Init:
 505  010e 88            	push	a
 506       00000001      OFST:	set	1
 509                     ; 136 	u8 i = 0;
 511  010f 0f01          	clr	(OFST+0,sp)
 512                     ; 139 	KEY_IO_Init();
 514  0111 adc1          	call	L11_KEY_IO_Init
 516                     ; 142 	KEY_TIMER_Config();
 518  0113 cd01cf        	call	L31_KEY_TIMER_Config
 521  0116 2020          	jra	L361
 522  0118               L161:
 523                     ; 147 	  l_KeyDetStat[i].eDetState = DET_IDLE;
 525  0118 7b01          	ld	a,(OFST+0,sp)
 526  011a 97            	ld	xl,a
 527  011b a605          	ld	a,#5
 528  011d 42            	mul	x,a
 529  011e 6f00          	clr	(L3_l_KeyDetStat,x)
 530                     ; 148 	  l_KeyDetStat[i].u16Delay = DET_JITERY;
 532  0120 7b01          	ld	a,(OFST+0,sp)
 533  0122 97            	ld	xl,a
 534  0123 a605          	ld	a,#5
 535  0125 42            	mul	x,a
 536  0126 90ae0064      	ldw	y,#100
 537  012a ef01          	ldw	(L3_l_KeyDetStat+1,x),y
 538                     ; 149 	  l_KeyDetStat[i].u16Counts = 0;
 540  012c 7b01          	ld	a,(OFST+0,sp)
 541  012e 97            	ld	xl,a
 542  012f a605          	ld	a,#5
 543  0131 42            	mul	x,a
 544  0132 905f          	clrw	y
 545  0134 ef03          	ldw	(L3_l_KeyDetStat+3,x),y
 546                     ; 151 	  i++;
 548  0136 0c01          	inc	(OFST+0,sp)
 549  0138               L361:
 550                     ; 145 	while(i < KEY_DET_END) 
 552  0138 7b01          	ld	a,(OFST+0,sp)
 553  013a a102          	cp	a,#2
 554  013c 25da          	jrult	L161
 555                     ; 155 	g_KeyState[KEY_DET_ACC] = KEY_GetCurrentState(KEY_DET_ACC);
 557  013e 4f            	clr	a
 558  013f ad14          	call	L7_KEY_GetCurrentState
 560  0141 b70d          	ld	_g_KeyState,a
 561                     ; 158 	g_KeyState[KEY_DET_REAR] = KEY_GetCurrentState(KEY_DET_REAR);
 563  0143 a601          	ld	a,#1
 564  0145 ad0e          	call	L7_KEY_GetCurrentState
 566  0147 b70e          	ld	_g_KeyState+1,a
 567                     ; 161 	g_KeyTrigFlag = TRIG_INVALID;
 569  0149 3f0c          	clr	_g_KeyTrigFlag
 570                     ; 162 	g_KeyStat = KEY_UNKNOWN;
 572  014b 3502000b      	mov	_g_KeyStat,#2
 573                     ; 163 	g_KeyId = KEY_END;
 575  014f 350c000a      	mov	_g_KeyId,#12
 576                     ; 164 }
 579  0153 84            	pop	a
 580  0154 81            	ret
 656                     ; 166 eKEYSTATE KEY_GetCurrentState(eKEYTYPE eType)
 656                     ; 167 {
 657                     	switch	.text
 658  0155               L7_KEY_GetCurrentState:
 660  0155 88            	push	a
 661  0156 88            	push	a
 662       00000001      OFST:	set	1
 665                     ; 170 	assert_param(eStat < KEY_DET_END);
 667  0157 7b01          	ld	a,(OFST+0,sp)
 668  0159 a102          	cp	a,#2
 669  015b 2403          	jruge	L02
 670  015d 4f            	clr	a
 671  015e 2010          	jra	L22
 672  0160               L02:
 673  0160 ae00aa        	ldw	x,#170
 674  0163 89            	pushw	x
 675  0164 ae0000        	ldw	x,#0
 676  0167 89            	pushw	x
 677  0168 ae0000        	ldw	x,#L532
 678  016b cd0000        	call	_assert_failed
 680  016e 5b04          	addw	sp,#4
 681  0170               L22:
 682                     ; 172 	switch(eType)
 684  0170 7b02          	ld	a,(OFST+1,sp)
 686                     ; 186 	default:
 686                     ; 187 		break;
 687  0172 4d            	tnz	a
 688  0173 270c          	jreq	L761
 689  0175 4a            	dec	a
 690  0176 2742          	jreq	L571
 691  0178 a002          	sub	a,#2
 692  017a 2718          	jreq	L171
 693  017c 4a            	dec	a
 694  017d 2728          	jreq	L371
 695  017f 204a          	jra	L142
 696  0181               L761:
 697                     ; 174 	case KEY_DET_ACC: 
 697                     ; 175 		eStat = ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 699  0181 ae5005        	ldw	x,#20485
 700  0184 cd0000        	call	_GPIO_ReadInputData
 702  0187 a504          	bcp	a,#4
 703  0189 2604          	jrne	L42
 704  018b a601          	ld	a,#1
 705  018d 2001          	jra	L62
 706  018f               L42:
 707  018f 4f            	clr	a
 708  0190               L62:
 709  0190 6b01          	ld	(OFST+0,sp),a
 710                     ; 176 		break;		
 712  0192 2037          	jra	L142
 713  0194               L171:
 714                     ; 177 	case KEY_DET_LEFT: 
 714                     ; 178 		eStat = ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 716  0194 ae5005        	ldw	x,#20485
 717  0197 cd0000        	call	_GPIO_ReadInputData
 719  019a a501          	bcp	a,#1
 720  019c 2604          	jrne	L03
 721  019e a601          	ld	a,#1
 722  01a0 2001          	jra	L23
 723  01a2               L03:
 724  01a2 4f            	clr	a
 725  01a3               L23:
 726  01a3 6b01          	ld	(OFST+0,sp),a
 727                     ; 179 		break;		
 729  01a5 2024          	jra	L142
 730  01a7               L371:
 731                     ; 180 	case KEY_DET_RIGHT: 
 731                     ; 181 		eStat = ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 733  01a7 ae5005        	ldw	x,#20485
 734  01aa cd0000        	call	_GPIO_ReadInputData
 736  01ad a508          	bcp	a,#8
 737  01af 2604          	jrne	L43
 738  01b1 a601          	ld	a,#1
 739  01b3 2001          	jra	L63
 740  01b5               L43:
 741  01b5 4f            	clr	a
 742  01b6               L63:
 743  01b6 6b01          	ld	(OFST+0,sp),a
 744                     ; 182 		break;		
 746  01b8 2011          	jra	L142
 747  01ba               L571:
 748                     ; 183 	case KEY_DET_REAR: 
 748                     ; 184 		eStat = ((GPIO_ReadInputData(GPIO_REAR_PORT) & GPIO_REAR_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 750  01ba ae5005        	ldw	x,#20485
 751  01bd cd0000        	call	_GPIO_ReadInputData
 753  01c0 a502          	bcp	a,#2
 754  01c2 2604          	jrne	L04
 755  01c4 a601          	ld	a,#1
 756  01c6 2001          	jra	L24
 757  01c8               L04:
 758  01c8 4f            	clr	a
 759  01c9               L24:
 760  01c9 6b01          	ld	(OFST+0,sp),a
 761                     ; 185 		break;		
 763  01cb               L771:
 764                     ; 186 	default:
 764                     ; 187 		break;
 766  01cb               L142:
 767                     ; 190 	return eStat;
 769  01cb 7b01          	ld	a,(OFST+0,sp)
 772  01cd 85            	popw	x
 773  01ce 81            	ret
 800                     ; 200 void KEY_TIMER_Config(void)
 800                     ; 201 {
 801                     	switch	.text
 802  01cf               L31_KEY_TIMER_Config:
 806                     ; 211   TIM2_TimeBaseInit(TIM2_PRESCALER_32768, TIM2_PERIOD);
 808  01cf ae00f9        	ldw	x,#249
 809  01d2 89            	pushw	x
 810  01d3 a60f          	ld	a,#15
 811  01d5 cd0000        	call	_TIM2_TimeBaseInit
 813  01d8 85            	popw	x
 814                     ; 213   TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 816  01d9 ae0001        	ldw	x,#1
 817  01dc cd0000        	call	_TIM2_ClearFlag
 819                     ; 215   TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 821  01df ae0001        	ldw	x,#1
 822  01e2 a601          	ld	a,#1
 823  01e4 95            	ld	xh,a
 824  01e5 cd0000        	call	_TIM2_ITConfig
 826                     ; 218   TIM2_Cmd(DISABLE);
 828  01e8 4f            	clr	a
 829  01e9 cd0000        	call	_TIM2_Cmd
 831                     ; 219 }
 834  01ec 81            	ret
1009                     	switch	.ubsct
1010  0000               L3_l_KeyDetStat:
1011  0000 000000000000  	ds.b	10
1012  000a               _g_KeyId:
1013  000a 00            	ds.b	1
1014                     	xdef	_g_KeyId
1015  000b               _g_KeyStat:
1016  000b 00            	ds.b	1
1017                     	xdef	_g_KeyStat
1018  000c               _g_KeyTrigFlag:
1019  000c 00            	ds.b	1
1020                     	xdef	_g_KeyTrigFlag
1021  000d               _g_KeyState:
1022  000d 0000          	ds.b	2
1023                     	xdef	_g_KeyState
1024                     	xref	_COMM_RequestSendCommand
1025                     	xref	_Delay_1ms
1026                     	xdef	_KEY_Init
1027                     	xdef	_KEY_Process
1028                     	xref	_assert_failed
1029                     	xref	_TIM2_ClearFlag
1030                     	xref	_TIM2_ITConfig
1031                     	xref	_TIM2_Cmd
1032                     	xref	_TIM2_TimeBaseInit
1033                     	xref	_GPIO_ReadInputData
1034                     	xref	_GPIO_Init
1035                     	xref	_EXTI_SetTLISensitivity
1036                     	xref	_EXTI_SetExtIntSensitivity
1037                     .const:	section	.text
1038  0000               L532:
1039  0000 2e2e5c617070  	dc.b	"..\app\key.c",0
1059                     	end

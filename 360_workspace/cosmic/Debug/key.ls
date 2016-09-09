   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	switch	.data
  16  0000               L5_l_KeyCurDet:
  17  0000 00            	dc.b	0
 199                     ; 38 void KEY_Process()
 199                     ; 39 {
 201                     	switch	.text
 202  0000               _KEY_Process:
 204  0000 89            	pushw	x
 205       00000002      OFST:	set	2
 208                     ; 40 	eKEYTYPE i = 0;
 210  0001 0f02          	clr	(OFST+0,sp)
 211                     ; 43 	if(g_KeyTrigFlag == TRIG_VALID) {
 213  0003 c6000c        	ld	a,_g_KeyTrigFlag
 214  0006 a101          	cp	a,#1
 215  0008 260f          	jrne	L321
 216                     ; 44 			COMM_RequestSendCommand(g_KeyId, g_KeyStat);
 218  000a c6000b        	ld	a,_g_KeyStat
 219  000d 97            	ld	xl,a
 220  000e c6000a        	ld	a,_g_KeyId
 221  0011 95            	ld	xh,a
 222  0012 cd0000        	call	_COMM_RequestSendCommand
 224                     ; 46 			g_KeyTrigFlag = TRIG_INVALID;
 226  0015 725f000c      	clr	_g_KeyTrigFlag
 227  0019               L321:
 228                     ; 50 	if(g_KeyState[l_KeyCurDet] == KEY_GetCurrentState(l_KeyCurDet))
 230  0019 c60000        	ld	a,L5_l_KeyCurDet
 231  001c cd0186        	call	L7_KEY_GetCurrentState
 233  001f 6b01          	ld	(OFST-1,sp),a
 234  0021 c60000        	ld	a,L5_l_KeyCurDet
 235  0024 5f            	clrw	x
 236  0025 97            	ld	xl,a
 237  0026 d6000d        	ld	a,(_g_KeyState,x)
 238  0029 1101          	cp	a,(OFST-1,sp)
 239  002b 2611          	jrne	L521
 240                     ; 52 		l_KeyCurDet ++;
 242  002d 725c0000      	inc	L5_l_KeyCurDet
 243                     ; 53 		if(l_KeyCurDet == KEY_DET_END)
 245  0031 c60000        	ld	a,L5_l_KeyCurDet
 246  0034 a102          	cp	a,#2
 247  0036 2604          	jrne	L721
 248                     ; 55 			l_KeyCurDet = KEY_DET_ACC;
 250  0038 725f0000      	clr	L5_l_KeyCurDet
 251  003c               L721:
 252                     ; 58 		return;
 254  003c 2025          	jra	L6
 255  003e               L521:
 256                     ; 62 	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_IDLE)
 258  003e c60000        	ld	a,L5_l_KeyCurDet
 259  0041 97            	ld	xl,a
 260  0042 a605          	ld	a,#5
 261  0044 42            	mul	x,a
 262  0045 724d0000      	tnz	(L3_l_KeyDetStat,x)
 263  0049 261a          	jrne	L131
 264                     ; 64 		l_KeyDetStat[l_KeyCurDet].u16Counts = 0;
 266  004b c60000        	ld	a,L5_l_KeyCurDet
 267  004e 97            	ld	xl,a
 268  004f a605          	ld	a,#5
 269  0051 42            	mul	x,a
 270  0052 905f          	clrw	y
 271  0054 df0003        	ldw	(L3_l_KeyDetStat+3,x),y
 272                     ; 65 		l_KeyDetStat[l_KeyCurDet].eDetState = DET_DETECTING;
 274  0057 c60000        	ld	a,L5_l_KeyCurDet
 275  005a 97            	ld	xl,a
 276  005b a605          	ld	a,#5
 277  005d 42            	mul	x,a
 278  005e a601          	ld	a,#1
 279  0060 d70000        	ld	(L3_l_KeyDetStat,x),a
 280                     ; 66 		return;
 281  0063               L6:
 284  0063 85            	popw	x
 285  0064 81            	ret
 286  0065               L131:
 287                     ; 70 	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_DETECTING)
 289  0065 c60000        	ld	a,L5_l_KeyCurDet
 290  0068 97            	ld	xl,a
 291  0069 a605          	ld	a,#5
 292  006b 42            	mul	x,a
 293  006c d60000        	ld	a,(L3_l_KeyDetStat,x)
 294  006f a101          	cp	a,#1
 295  0071 2703cc00fb    	jrne	L331
 296                     ; 72 		l_KeyDetStat[l_KeyCurDet].u16Counts ++;
 298  0076 c60000        	ld	a,L5_l_KeyCurDet
 299  0079 97            	ld	xl,a
 300  007a a605          	ld	a,#5
 301  007c 42            	mul	x,a
 302  007d 9093          	ldw	y,x
 303  007f de0003        	ldw	x,(L3_l_KeyDetStat+3,x)
 304  0082 1c0001        	addw	x,#1
 305  0085 90df0003      	ldw	(L3_l_KeyDetStat+3,y),x
 306                     ; 73 		if(l_KeyDetStat[l_KeyCurDet].u16Counts < DET_JITERY)
 308  0089 c60000        	ld	a,L5_l_KeyCurDet
 309  008c 97            	ld	xl,a
 310  008d a605          	ld	a,#5
 311  008f 42            	mul	x,a
 312  0090 9093          	ldw	y,x
 313  0092 90de0003      	ldw	y,(L3_l_KeyDetStat+3,y)
 314  0096 90a30064      	cpw	y,#100
 315  009a 2405          	jruge	L531
 316                     ; 75 			Delay_1ms();
 318  009c cd0000        	call	_Delay_1ms
 320                     ; 76 			return;
 322  009f 20c2          	jra	L6
 323  00a1               L531:
 324                     ; 80 			l_KeyDetStat[l_KeyCurDet].eDetState = DET_IDLE;
 326  00a1 c60000        	ld	a,L5_l_KeyCurDet
 327  00a4 97            	ld	xl,a
 328  00a5 a605          	ld	a,#5
 329  00a7 42            	mul	x,a
 330  00a8 724f0000      	clr	(L3_l_KeyDetStat,x)
 331                     ; 81 			g_KeyState[l_KeyCurDet] = KEY_GetCurrentState(l_KeyCurDet);
 333  00ac c60000        	ld	a,L5_l_KeyCurDet
 334  00af 5f            	clrw	x
 335  00b0 97            	ld	xl,a
 336  00b1 89            	pushw	x
 337  00b2 c60000        	ld	a,L5_l_KeyCurDet
 338  00b5 cd0186        	call	L7_KEY_GetCurrentState
 340  00b8 85            	popw	x
 341  00b9 d7000d        	ld	(_g_KeyState,x),a
 342                     ; 84 			switch(l_KeyCurDet) 
 344  00bc c60000        	ld	a,L5_l_KeyCurDet
 346                     ; 98 			default:
 346                     ; 99 				break;
 347  00bf 4d            	tnz	a
 348  00c0 270c          	jreq	L51
 349  00c2 4a            	dec	a
 350  00c3 272c          	jreq	L32
 351  00c5 a002          	sub	a,#2
 352  00c7 2710          	jreq	L71
 353  00c9 4a            	dec	a
 354  00ca 2719          	jreq	L12
 355  00cc 202d          	jra	L341
 356  00ce               L51:
 357                     ; 86 			case	KEY_DET_ACC:	
 357                     ; 87 				COMM_RequestSendCommand(KEY_ACC, g_KeyState[KEY_DET_ACC]);
 359  00ce c6000d        	ld	a,_g_KeyState
 360  00d1 97            	ld	xl,a
 361  00d2 4f            	clr	a
 362  00d3 95            	ld	xh,a
 363  00d4 cd0000        	call	_COMM_RequestSendCommand
 365                     ; 88 				break;
 367  00d7 2022          	jra	L341
 368  00d9               L71:
 369                     ; 89 			case	KEY_DET_LEFT:	
 369                     ; 90 				COMM_RequestSendCommand(KEY_LEFT, g_KeyState[KEY_DET_LEFT]);
 371  00d9 c60010        	ld	a,_g_KeyState+3
 372  00dc 97            	ld	xl,a
 373  00dd a602          	ld	a,#2
 374  00df 95            	ld	xh,a
 375  00e0 cd0000        	call	_COMM_RequestSendCommand
 377                     ; 91 				break;
 379  00e3 2016          	jra	L341
 380  00e5               L12:
 381                     ; 92 			case	KEY_DET_RIGHT:	
 381                     ; 93 				COMM_RequestSendCommand(KEY_RIGHT, g_KeyState[KEY_DET_RIGHT]);
 383  00e5 c60011        	ld	a,_g_KeyState+4
 384  00e8 97            	ld	xl,a
 385  00e9 a603          	ld	a,#3
 386  00eb 95            	ld	xh,a
 387  00ec cd0000        	call	_COMM_RequestSendCommand
 389                     ; 94 				break;
 391  00ef 200a          	jra	L341
 392  00f1               L32:
 393                     ; 95 			case	KEY_DET_REAR:	
 393                     ; 96 				COMM_RequestSendCommand(KEY_REAR, g_KeyState[KEY_DET_REAR]);
 395  00f1 c6000e        	ld	a,_g_KeyState+1
 396  00f4 97            	ld	xl,a
 397  00f5 a604          	ld	a,#4
 398  00f7 95            	ld	xh,a
 399  00f8 cd0000        	call	_COMM_RequestSendCommand
 401                     ; 97 				break;
 403  00fb               L52:
 404                     ; 98 			default:
 404                     ; 99 				break;
 406  00fb               L341:
 407                     ; 101 			return;			
 409  00fb               L331:
 410                     ; 106 }
 411  00fb               L01:
 414  00fb 85            	popw	x
 415  00fc 81            	ret
 441                     ; 109 void KEY_IO_Init()
 441                     ; 110 {
 442                     	switch	.text
 443  00fd               L11_KEY_IO_Init:
 447                     ; 111 	GPIO_Init(GPIO_ACC_PORT, (GPIO_Pin_TypeDef)GPIO_ACC_PIN, GPIO_MODE_IN_PU_NO_IT);
 449  00fd 4b40          	push	#64
 450  00ff 4b04          	push	#4
 451  0101 ae5005        	ldw	x,#20485
 452  0104 cd0000        	call	_GPIO_Init
 454  0107 85            	popw	x
 455                     ; 115 	GPIO_Init(GPIO_LEFT_PORT, (GPIO_Pin_TypeDef)GPIO_LEFT_PIN, GPIO_MODE_IN_FL_IT);
 457  0108 4b20          	push	#32
 458  010a 4b01          	push	#1
 459  010c ae5005        	ldw	x,#20485
 460  010f cd0000        	call	_GPIO_Init
 462  0112 85            	popw	x
 463                     ; 121 	GPIO_Init(GPIO_RIGHT_PORT, (GPIO_Pin_TypeDef)GPIO_RIGHT_PIN, GPIO_MODE_IN_FL_IT);
 465  0113 4b20          	push	#32
 466  0115 4b08          	push	#8
 467  0117 ae5005        	ldw	x,#20485
 468  011a cd0000        	call	_GPIO_Init
 470  011d 85            	popw	x
 471                     ; 126 	GPIO_Init(GPIO_REAR_PORT, (GPIO_Pin_TypeDef)GPIO_REAR_PIN, GPIO_MODE_IN_PU_NO_IT);
 473  011e 4b40          	push	#64
 474  0120 4b02          	push	#2
 475  0122 ae5005        	ldw	x,#20485
 476  0125 cd0000        	call	_GPIO_Init
 478  0128 85            	popw	x
 479                     ; 129 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY);
 481  0129 ae0002        	ldw	x,#2
 482  012c a601          	ld	a,#1
 483  012e 95            	ld	xh,a
 484  012f cd0000        	call	_EXTI_SetExtIntSensitivity
 486                     ; 130 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 488  0132 4f            	clr	a
 489  0133 cd0000        	call	_EXTI_SetTLISensitivity
 491                     ; 132 }
 494  0136 81            	ret
 534                     ; 134 void KEY_Init()
 534                     ; 135 {
 535                     	switch	.text
 536  0137               _KEY_Init:
 538  0137 88            	push	a
 539       00000001      OFST:	set	1
 542                     ; 136 	u8 i = 0;
 544  0138 0f01          	clr	(OFST+0,sp)
 545                     ; 139 	KEY_IO_Init();
 547  013a adc1          	call	L11_KEY_IO_Init
 549                     ; 142 	KEY_TIMER_Config();
 551  013c cd0200        	call	L31_KEY_TIMER_Config
 554  013f 2024          	jra	L371
 555  0141               L171:
 556                     ; 147 	  l_KeyDetStat[i].eDetState = DET_IDLE;
 558  0141 7b01          	ld	a,(OFST+0,sp)
 559  0143 97            	ld	xl,a
 560  0144 a605          	ld	a,#5
 561  0146 42            	mul	x,a
 562  0147 724f0000      	clr	(L3_l_KeyDetStat,x)
 563                     ; 148 	  l_KeyDetStat[i].u16Delay = DET_JITERY;
 565  014b 7b01          	ld	a,(OFST+0,sp)
 566  014d 97            	ld	xl,a
 567  014e a605          	ld	a,#5
 568  0150 42            	mul	x,a
 569  0151 90ae0064      	ldw	y,#100
 570  0155 df0001        	ldw	(L3_l_KeyDetStat+1,x),y
 571                     ; 149 	  l_KeyDetStat[i].u16Counts = 0;
 573  0158 7b01          	ld	a,(OFST+0,sp)
 574  015a 97            	ld	xl,a
 575  015b a605          	ld	a,#5
 576  015d 42            	mul	x,a
 577  015e 905f          	clrw	y
 578  0160 df0003        	ldw	(L3_l_KeyDetStat+3,x),y
 579                     ; 151 	  i++;
 581  0163 0c01          	inc	(OFST+0,sp)
 582  0165               L371:
 583                     ; 145 	while(i < KEY_DET_END) 
 585  0165 7b01          	ld	a,(OFST+0,sp)
 586  0167 a102          	cp	a,#2
 587  0169 25d6          	jrult	L171
 588                     ; 155 	g_KeyState[KEY_DET_ACC] = KEY_GetCurrentState(KEY_DET_ACC);
 590  016b 4f            	clr	a
 591  016c ad18          	call	L7_KEY_GetCurrentState
 593  016e c7000d        	ld	_g_KeyState,a
 594                     ; 158 	g_KeyState[KEY_DET_REAR] = KEY_GetCurrentState(KEY_DET_REAR);
 596  0171 a601          	ld	a,#1
 597  0173 ad11          	call	L7_KEY_GetCurrentState
 599  0175 c7000e        	ld	_g_KeyState+1,a
 600                     ; 161 	g_KeyTrigFlag = TRIG_INVALID;
 602  0178 725f000c      	clr	_g_KeyTrigFlag
 603                     ; 162 	g_KeyStat = KEY_UNKNOWN;
 605  017c 3502000b      	mov	_g_KeyStat,#2
 606                     ; 163 	g_KeyId = KEY_END;
 608  0180 3511000a      	mov	_g_KeyId,#17
 609                     ; 164 }
 612  0184 84            	pop	a
 613  0185 81            	ret
 689                     ; 166 eKEYSTATE KEY_GetCurrentState(eKEYTYPE eType)
 689                     ; 167 {
 690                     	switch	.text
 691  0186               L7_KEY_GetCurrentState:
 693  0186 88            	push	a
 694  0187 88            	push	a
 695       00000001      OFST:	set	1
 698                     ; 170 	assert_param(eStat < KEY_DET_END);
 700  0188 7b01          	ld	a,(OFST+0,sp)
 701  018a a102          	cp	a,#2
 702  018c 2403          	jruge	L02
 703  018e 4f            	clr	a
 704  018f 2010          	jra	L22
 705  0191               L02:
 706  0191 ae00aa        	ldw	x,#170
 707  0194 89            	pushw	x
 708  0195 ae0000        	ldw	x,#0
 709  0198 89            	pushw	x
 710  0199 ae0000        	ldw	x,#L542
 711  019c cd0000        	call	_assert_failed
 713  019f 5b04          	addw	sp,#4
 714  01a1               L22:
 715                     ; 172 	switch(eType)
 717  01a1 7b02          	ld	a,(OFST+1,sp)
 719                     ; 186 	default:
 719                     ; 187 		break;
 720  01a3 4d            	tnz	a
 721  01a4 270c          	jreq	L771
 722  01a6 4a            	dec	a
 723  01a7 2742          	jreq	L502
 724  01a9 a002          	sub	a,#2
 725  01ab 2718          	jreq	L102
 726  01ad 4a            	dec	a
 727  01ae 2728          	jreq	L302
 728  01b0 204a          	jra	L152
 729  01b2               L771:
 730                     ; 174 	case KEY_DET_ACC: 
 730                     ; 175 		eStat = ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 732  01b2 ae5005        	ldw	x,#20485
 733  01b5 cd0000        	call	_GPIO_ReadInputData
 735  01b8 a504          	bcp	a,#4
 736  01ba 2604          	jrne	L42
 737  01bc a601          	ld	a,#1
 738  01be 2001          	jra	L62
 739  01c0               L42:
 740  01c0 4f            	clr	a
 741  01c1               L62:
 742  01c1 6b01          	ld	(OFST+0,sp),a
 743                     ; 176 		break;		
 745  01c3 2037          	jra	L152
 746  01c5               L102:
 747                     ; 177 	case KEY_DET_LEFT: 
 747                     ; 178 		eStat = ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 749  01c5 ae5005        	ldw	x,#20485
 750  01c8 cd0000        	call	_GPIO_ReadInputData
 752  01cb a501          	bcp	a,#1
 753  01cd 2604          	jrne	L03
 754  01cf a601          	ld	a,#1
 755  01d1 2001          	jra	L23
 756  01d3               L03:
 757  01d3 4f            	clr	a
 758  01d4               L23:
 759  01d4 6b01          	ld	(OFST+0,sp),a
 760                     ; 179 		break;		
 762  01d6 2024          	jra	L152
 763  01d8               L302:
 764                     ; 180 	case KEY_DET_RIGHT: 
 764                     ; 181 		eStat = ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 766  01d8 ae5005        	ldw	x,#20485
 767  01db cd0000        	call	_GPIO_ReadInputData
 769  01de a508          	bcp	a,#8
 770  01e0 2604          	jrne	L43
 771  01e2 a601          	ld	a,#1
 772  01e4 2001          	jra	L63
 773  01e6               L43:
 774  01e6 4f            	clr	a
 775  01e7               L63:
 776  01e7 6b01          	ld	(OFST+0,sp),a
 777                     ; 182 		break;		
 779  01e9 2011          	jra	L152
 780  01eb               L502:
 781                     ; 183 	case KEY_DET_REAR: 
 781                     ; 184 		eStat = ((GPIO_ReadInputData(GPIO_REAR_PORT) & GPIO_REAR_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 783  01eb ae5005        	ldw	x,#20485
 784  01ee cd0000        	call	_GPIO_ReadInputData
 786  01f1 a502          	bcp	a,#2
 787  01f3 2604          	jrne	L04
 788  01f5 a601          	ld	a,#1
 789  01f7 2001          	jra	L24
 790  01f9               L04:
 791  01f9 4f            	clr	a
 792  01fa               L24:
 793  01fa 6b01          	ld	(OFST+0,sp),a
 794                     ; 185 		break;		
 796  01fc               L702:
 797                     ; 186 	default:
 797                     ; 187 		break;
 799  01fc               L152:
 800                     ; 190 	return eStat;
 802  01fc 7b01          	ld	a,(OFST+0,sp)
 805  01fe 85            	popw	x
 806  01ff 81            	ret
 833                     ; 200 void KEY_TIMER_Config(void)
 833                     ; 201 {
 834                     	switch	.text
 835  0200               L31_KEY_TIMER_Config:
 839                     ; 211   TIM2_TimeBaseInit(TIM2_PRESCALER_32768, TIM2_PERIOD);
 841  0200 ae00f9        	ldw	x,#249
 842  0203 89            	pushw	x
 843  0204 a60f          	ld	a,#15
 844  0206 cd0000        	call	_TIM2_TimeBaseInit
 846  0209 85            	popw	x
 847                     ; 213   TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 849  020a ae0001        	ldw	x,#1
 850  020d cd0000        	call	_TIM2_ClearFlag
 852                     ; 215   TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 854  0210 ae0001        	ldw	x,#1
 855  0213 a601          	ld	a,#1
 856  0215 95            	ld	xh,a
 857  0216 cd0000        	call	_TIM2_ITConfig
 859                     ; 218   TIM2_Cmd(DISABLE);
 861  0219 4f            	clr	a
 862  021a cd0000        	call	_TIM2_Cmd
 864                     ; 219 }
 867  021d 81            	ret
1042                     	switch	.bss
1043  0000               L3_l_KeyDetStat:
1044  0000 000000000000  	ds.b	10
1045  000a               _g_KeyId:
1046  000a 00            	ds.b	1
1047                     	xdef	_g_KeyId
1048  000b               _g_KeyStat:
1049  000b 00            	ds.b	1
1050                     	xdef	_g_KeyStat
1051  000c               _g_KeyTrigFlag:
1052  000c 00            	ds.b	1
1053                     	xdef	_g_KeyTrigFlag
1054  000d               _g_KeyState:
1055  000d 0000          	ds.b	2
1056                     	xdef	_g_KeyState
1057                     	xref	_COMM_RequestSendCommand
1058                     	xref	_Delay_1ms
1059                     	xdef	_KEY_Init
1060                     	xdef	_KEY_Process
1061                     	xref	_assert_failed
1062                     	xref	_TIM2_ClearFlag
1063                     	xref	_TIM2_ITConfig
1064                     	xref	_TIM2_Cmd
1065                     	xref	_TIM2_TimeBaseInit
1066                     	xref	_GPIO_ReadInputData
1067                     	xref	_GPIO_Init
1068                     	xref	_EXTI_SetTLISensitivity
1069                     	xref	_EXTI_SetExtIntSensitivity
1070                     .const:	section	.text
1071  0000               L542:
1072  0000 2e2e5c617070  	dc.b	"..\app\key.c",0
1092                     	end

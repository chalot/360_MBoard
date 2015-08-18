   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  49                     ; 30 void IR_Init()
  49                     ; 31 {
  51                     	switch	.text
  52  0000               _IR_Init:
  56                     ; 32 	ZeroMem((u8*)&tIRFSM, sizeof(tIRFSMType));
  58  0000 ae0012        	ldw	x,#18
  59  0003 89            	pushw	x
  60  0004 ae0000        	ldw	x,#0
  61  0007 89            	pushw	x
  62  0008 ae0014        	ldw	x,#L3_tIRFSM
  63  000b cd0000        	call	_ZeroMem
  65  000e 5b04          	addw	sp,#4
  66                     ; 33 	tIRFSM.pu8Buffer_Rx = &IR_Buf[0];
  68  0010 ae0000        	ldw	x,#L5_IR_Buf
  69  0013 bf23          	ldw	L3_tIRFSM+15,x
  70                     ; 34 	ZeroMem(IR_Buf, _BUFFER_LENGTH_IR_Rx_);
  72  0015 ae0014        	ldw	x,#20
  73  0018 89            	pushw	x
  74  0019 ae0000        	ldw	x,#0
  75  001c 89            	pushw	x
  76  001d ae0000        	ldw	x,#L5_IR_Buf
  77  0020 cd0000        	call	_ZeroMem
  79  0023 5b04          	addw	sp,#4
  80                     ; 36 	IR_GPIO_Init();
  82  0025 ad05          	call	L7_IR_GPIO_Init
  84                     ; 38 	TIM3_Config_10ms();
  86  0027 ad26          	call	L11_TIM3_Config_10ms
  88                     ; 39 	TIM2_Config_100us();
  90  0029 ad42          	call	L31_TIM2_Config_100us
  92                     ; 40 }
  95  002b 81            	ret
 121                     ; 46 void IR_GPIO_Init() {
 122                     	switch	.text
 123  002c               L7_IR_GPIO_Init:
 127                     ; 49 	GPIO_Init(GPIO_IR_PORT, GPIO_IR_PIN, GPIO_MODE_IN_FL_IT);
 129  002c 4b20          	push	#32
 130  002e 4b08          	push	#8
 131  0030 ae5000        	ldw	x,#20480
 132  0033 cd0000        	call	_GPIO_Init
 134  0036 85            	popw	x
 135                     ; 54 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
 137  0037 ae0002        	ldw	x,#2
 138  003a 4f            	clr	a
 139  003b 95            	ld	xh,a
 140  003c cd0000        	call	_EXTI_SetExtIntSensitivity
 142                     ; 55 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 144  003f 4f            	clr	a
 145  0040 cd0000        	call	_EXTI_SetTLISensitivity
 147                     ; 57 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST);
 149  0043 4bf0          	push	#240
 150  0045 4b08          	push	#8
 151  0047 ae500f        	ldw	x,#20495
 152  004a cd0000        	call	_GPIO_Init
 154  004d 85            	popw	x
 155                     ; 58 }
 158  004e 81            	ret
 185                     ; 65 void TIM3_Config_10ms(void)
 185                     ; 66 {
 186                     	switch	.text
 187  004f               L11_TIM3_Config_10ms:
 191                     ; 87   TIM3_TimeBaseInit(TIM3_PRESCALER_1024, TIM3_PERIOD);
 193  004f ae009f        	ldw	x,#159
 194  0052 89            	pushw	x
 195  0053 a60a          	ld	a,#10
 196  0055 cd0000        	call	_TIM3_TimeBaseInit
 198  0058 85            	popw	x
 199                     ; 89   TIM3_ClearFlag(TIM3_FLAG_UPDATE);
 201  0059 ae0001        	ldw	x,#1
 202  005c cd0000        	call	_TIM3_ClearFlag
 204                     ; 91   TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
 206  005f ae0001        	ldw	x,#1
 207  0062 a601          	ld	a,#1
 208  0064 95            	ld	xh,a
 209  0065 cd0000        	call	_TIM3_ITConfig
 211                     ; 94   TIM3_Cmd(DISABLE);
 213  0068 4f            	clr	a
 214  0069 cd0000        	call	_TIM3_Cmd
 216                     ; 97 }
 219  006c 81            	ret
 246                     ; 104 static void TIM2_Config_100us(void)
 246                     ; 105 {
 247                     	switch	.text
 248  006d               L31_TIM2_Config_100us:
 252                     ; 116   TIM2_TimeBaseInit(TIM2_PRESCALER_16, TIM2_PERIOD);
 254  006d ae0063        	ldw	x,#99
 255  0070 89            	pushw	x
 256  0071 a604          	ld	a,#4
 257  0073 cd0000        	call	_TIM2_TimeBaseInit
 259  0076 85            	popw	x
 260                     ; 118   TIM2_ClearFlag(TIM2_FLAG_UPDATE);
 262  0077 ae0001        	ldw	x,#1
 263  007a cd0000        	call	_TIM2_ClearFlag
 265                     ; 120   TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 267  007d ae0001        	ldw	x,#1
 268  0080 a601          	ld	a,#1
 269  0082 95            	ld	xh,a
 270  0083 cd0000        	call	_TIM2_ITConfig
 272                     ; 123   TIM2_Cmd(ENABLE);
 274  0086 a601          	ld	a,#1
 275  0088 cd0000        	call	_TIM2_Cmd
 277                     ; 124 }
 280  008b 81            	ret
 317                     ; 134 void IR_Process() {
 318                     	switch	.text
 319  008c               _IR_Process:
 321  008c 88            	push	a
 322       00000001      OFST:	set	1
 325                     ; 135 	u8 u8IRData = 0;
 327                     ; 138 	if (tIRFSM.u8Available_Rx) {
 329  008d 3d22          	tnz	L3_tIRFSM+14
 330  008f 2603          	jrne	L61
 331  0091 cc01d6        	jp	L131
 332  0094               L61:
 333                     ; 140 		u8IRData = *(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Read_Rx++);
 335  0094 b621          	ld	a,L3_tIRFSM+13
 336  0096 97            	ld	xl,a
 337  0097 3c21          	inc	L3_tIRFSM+13
 338  0099 9f            	ld	a,xl
 339  009a 5f            	clrw	x
 340  009b 97            	ld	xl,a
 341  009c 92d623        	ld	a,([L3_tIRFSM+15.w],x)
 342  009f 6b01          	ld	(OFST+0,sp),a
 343                     ; 143 		if (tIRFSM.u8Read_Rx >= _BUFFER_LENGTH_IR_Rx_) {
 345  00a1 b621          	ld	a,L3_tIRFSM+13
 346  00a3 a114          	cp	a,#20
 347  00a5 2502          	jrult	L331
 348                     ; 144 			tIRFSM.u8Read_Rx = 0;
 350  00a7 3f21          	clr	L3_tIRFSM+13
 351  00a9               L331:
 352                     ; 148 		--tIRFSM.u8Available_Rx;
 354  00a9 3a22          	dec	L3_tIRFSM+14
 355                     ; 151 		switch (u8IRData) {
 357  00ab 7b01          	ld	a,(OFST+0,sp)
 359                     ; 196 		default:
 359                     ; 197 			break;
 360  00ad 4d            	tnz	a
 361  00ae 2739          	jreq	L36
 362  00b0 a002          	sub	a,#2
 363  00b2 2603          	jrne	L02
 364  00b4 cc016f        	jp	L77
 365  00b7               L02:
 366  00b7 a003          	sub	a,#3
 367  00b9 275c          	jreq	L76
 368  00bb 4a            	dec	a
 369  00bc 2742          	jreq	L56
 370  00be a002          	sub	a,#2
 371  00c0 2603          	jrne	L22
 372  00c2 cc015a        	jp	L57
 373  00c5               L22:
 374  00c5 4a            	dec	a
 375  00c6 2603          	jrne	L42
 376  00c8 cc01ae        	jp	L501
 377  00cb               L42:
 378  00cb 4a            	dec	a
 379  00cc 2603          	jrne	L62
 380  00ce cc01c3        	jp	L701
 381  00d1               L62:
 382  00d1 a003          	sub	a,#3
 383  00d3 2759          	jreq	L17
 384  00d5 4a            	dec	a
 385  00d6 276d          	jreq	L37
 386  00d8 a00f          	sub	a,#15
 387  00da 2603          	jrne	L03
 388  00dc cc0199        	jp	L301
 389  00df               L03:
 390  00df 4a            	dec	a
 391  00e0 2603          	jrne	L23
 392  00e2 cc0184        	jp	L101
 393  00e5               L23:
 394  00e5 acd601d6      	jpf	L131
 395  00e9               L36:
 396                     ; 152 		case	IR_CMD_OK: 			//0x0b	确认
 396                     ; 153 			COMM_RequestSendCommand(MENU_OK, KEY_ACTIVED);
 398  00e9 ae0001        	ldw	x,#1
 399  00ec a60a          	ld	a,#10
 400  00ee 95            	ld	xh,a
 401  00ef cd0000        	call	_COMM_RequestSendCommand
 403                     ; 154 			printf("[IR] IR_CMD_OK\n");
 405  00f2 35f50000      	mov	c_x,#page(L141)
 406  00f6 ae00f5        	ldw	x,#L141
 407  00f9 cd0000        	call	_printf
 409                     ; 155 			break;
 411  00fc acd601d6      	jpf	L131
 412  0100               L56:
 413                     ; 156 		case	IR_CMD_UP: 			//0x06	上
 413                     ; 157 			COMM_RequestSendCommand(MENU_UP, KEY_ACTIVED);
 415  0100 ae0001        	ldw	x,#1
 416  0103 a608          	ld	a,#8
 417  0105 95            	ld	xh,a
 418  0106 cd0000        	call	_COMM_RequestSendCommand
 420                     ; 158 			printf("[IR] IR_CMD_UP\n");
 422  0109 35e50000      	mov	c_x,#page(L341)
 423  010d ae00e5        	ldw	x,#L341
 424  0110 cd0000        	call	_printf
 426                     ; 159 			break;
 428  0113 acd601d6      	jpf	L131
 429  0117               L76:
 430                     ; 160 		case	IR_CMD_DOWN: 		//0x05	下
 430                     ; 161 			COMM_RequestSendCommand(MENU_DOWN, KEY_ACTIVED);
 432  0117 ae0001        	ldw	x,#1
 433  011a a609          	ld	a,#9
 434  011c 95            	ld	xh,a
 435  011d cd0000        	call	_COMM_RequestSendCommand
 437                     ; 162 			printf("[IR] IR_CMD_DOWN\n");
 439  0120 35d30000      	mov	c_x,#page(L541)
 440  0124 ae00d3        	ldw	x,#L541
 441  0127 cd0000        	call	_printf
 443                     ; 163 			break;
 445  012a acd601d6      	jpf	L131
 446  012e               L17:
 447                     ; 164 		case	IR_CMD_LEFT: 		//0x0d	左
 447                     ; 165 			COMM_RequestSendCommand(MENU_LEFT, KEY_ACTIVED);
 449  012e ae0001        	ldw	x,#1
 450  0131 a606          	ld	a,#6
 451  0133 95            	ld	xh,a
 452  0134 cd0000        	call	_COMM_RequestSendCommand
 454                     ; 166 			printf("[IR] IR_CMD_LEFT\n");
 456  0137 35c10000      	mov	c_x,#page(L741)
 457  013b ae00c1        	ldw	x,#L741
 458  013e cd0000        	call	_printf
 460                     ; 167 			break;
 462  0141 acd601d6      	jpf	L131
 463  0145               L37:
 464                     ; 168 		case	IR_CMD_RIGHT: 		//0x0e	右
 464                     ; 169 			COMM_RequestSendCommand(MENU_RIGHT, KEY_ACTIVED);
 466  0145 ae0001        	ldw	x,#1
 467  0148 a607          	ld	a,#7
 468  014a 95            	ld	xh,a
 469  014b cd0000        	call	_COMM_RequestSendCommand
 471                     ; 170 			printf("[IR] IR_CMD_RIGHT\n");
 473  014e 35ae0000      	mov	c_x,#page(L151)
 474  0152 ae00ae        	ldw	x,#L151
 475  0155 cd0000        	call	_printf
 477                     ; 171 			break;
 479  0158 207c          	jra	L131
 480  015a               L57:
 481                     ; 172 		case	IR_CMD_BACK: 		//0x08	返回
 481                     ; 173 			COMM_RequestSendCommand(MENU_BACK, KEY_ACTIVED);			
 483  015a ae0001        	ldw	x,#1
 484  015d a605          	ld	a,#5
 485  015f 95            	ld	xh,a
 486  0160 cd0000        	call	_COMM_RequestSendCommand
 488                     ; 174 			printf("[IR] IR_CMD_BACK\n");
 490  0163 359c0000      	mov	c_x,#page(L351)
 491  0167 ae009c        	ldw	x,#L351
 492  016a cd0000        	call	_printf
 494                     ; 175 			break;
 496  016d 2067          	jra	L131
 497  016f               L77:
 498                     ; 176 		case	IR_CMD_POWER: 		//0x02	电源
 498                     ; 177 			COMM_RequestSendCommand(MENU_POWER, KEY_ACTIVED);			
 500  016f ae0001        	ldw	x,#1
 501  0172 a60b          	ld	a,#11
 502  0174 95            	ld	xh,a
 503  0175 cd0000        	call	_COMM_RequestSendCommand
 505                     ; 178 			printf("[IR] IR_CMD_POWER\n");
 507  0178 35890000      	mov	c_x,#page(L551)
 508  017c ae0089        	ldw	x,#L551
 509  017f cd0000        	call	_printf
 511                     ; 179 			break;
 513  0182 2052          	jra	L131
 514  0184               L101:
 515                     ; 180 		case	IR_CMD_LF_VIEW: 	//0x1e	（左视）AV1
 515                     ; 181 			COMM_RequestSendCommand(KEY_LEFT, KEY_ACTIVED);	
 517  0184 ae0001        	ldw	x,#1
 518  0187 a602          	ld	a,#2
 519  0189 95            	ld	xh,a
 520  018a cd0000        	call	_COMM_RequestSendCommand
 522                     ; 182 			printf("[IR] IR_CMD_LF_VIEW\n");
 524  018d 35740000      	mov	c_x,#page(L751)
 525  0191 ae0074        	ldw	x,#L751
 526  0194 cd0000        	call	_printf
 528                     ; 183 			break;
 530  0197 203d          	jra	L131
 531  0199               L301:
 532                     ; 184 		case	IR_CMD_RT_VIEW: 	//0x1d	（右视）AV2
 532                     ; 185 			COMM_RequestSendCommand(KEY_RIGHT, KEY_ACTIVED);
 534  0199 ae0001        	ldw	x,#1
 535  019c a603          	ld	a,#3
 536  019e 95            	ld	xh,a
 537  019f cd0000        	call	_COMM_RequestSendCommand
 539                     ; 186 			printf("[IR] IR_CMD_RT_VIEW\n");
 541  01a2 355f0000      	mov	c_x,#page(L161)
 542  01a6 ae005f        	ldw	x,#L161
 543  01a9 cd0000        	call	_printf
 545                     ; 187 			break;
 547  01ac 2028          	jra	L131
 548  01ae               L501:
 549                     ; 188 		case	IR_CMD_FR_VIEW: //	0x09	（前视）AV3
 549                     ; 189 			COMM_RequestSendCommand(KEY_FRONT, KEY_ACTIVED);
 551  01ae ae0001        	ldw	x,#1
 552  01b1 a601          	ld	a,#1
 553  01b3 95            	ld	xh,a
 554  01b4 cd0000        	call	_COMM_RequestSendCommand
 556                     ; 190 			printf("[IR] IR_CMD_FR_VIEW\n");
 558  01b7 354a0000      	mov	c_x,#page(L361)
 559  01bb ae004a        	ldw	x,#L361
 560  01be cd0000        	call	_printf
 562                     ; 191 			break;
 564  01c1 2013          	jra	L131
 565  01c3               L701:
 566                     ; 192 		case IR_CMD_BK_VIEW://	0x0a	（后视）AV4
 566                     ; 193 			COMM_RequestSendCommand(KEY_REAR, KEY_ACTIVED);
 568  01c3 ae0001        	ldw	x,#1
 569  01c6 a604          	ld	a,#4
 570  01c8 95            	ld	xh,a
 571  01c9 cd0000        	call	_COMM_RequestSendCommand
 573                     ; 194 			printf("[IR] IR_CMD_BK_VIEW\n");
 575  01cc 35350000      	mov	c_x,#page(L561)
 576  01d0 ae0035        	ldw	x,#L561
 577  01d3 cd0000        	call	_printf
 579                     ; 195 			break;
 581  01d6               L111:
 582                     ; 196 		default:
 582                     ; 197 			break;
 584  01d6               L731:
 585  01d6               L131:
 586                     ; 200 }
 589  01d6 84            	pop	a
 590  01d7 81            	ret
 593                     	bsct
 594  0000               L761_a:
 595  0000 0000          	dc.w	0
 686                     .const:	section	.text
 687  0000               L63:
 688  0000 00003390      	dc.l	13200
 689  0004               L04:
 690  0004 000035e9      	dc.l	13801
 691  0008               L24:
 692  0008 00000334      	dc.l	820
 693  000c               L44:
 694  000c 0000058d      	dc.l	1421
 695  0010               L64:
 696  0010 00000794      	dc.l	1940
 697  0014               L05:
 698  0014 000009ed      	dc.l	2541
 699                     ; 208 void ISR_IRReceive(void) {
 700                     	switch	.text
 701  01d8               _ISR_IRReceive:
 703  01d8 5205          	subw	sp,#5
 704       00000005      OFST:	set	5
 707                     ; 209 	u8 u8Err = 0;						//接收是否出错？
 709  01da 0f03          	clr	(OFST-2,sp)
 710                     ; 215 	if(a == 0) {
 712  01dc be00          	ldw	x,L761_a
 713  01de 2610          	jrne	L152
 714                     ; 216 		LED_ON();
 716  01e0 4b08          	push	#8
 717  01e2 ae500f        	ldw	x,#20495
 718  01e5 cd0000        	call	_GPIO_WriteLow
 720  01e8 84            	pop	a
 721                     ; 217 		a = 1;
 723  01e9 ae0001        	ldw	x,#1
 724  01ec bf00          	ldw	L761_a,x
 726  01ee 2013          	jra	L352
 727  01f0               L152:
 728                     ; 218 	}else if(a == 1) {
 730  01f0 be00          	ldw	x,L761_a
 731  01f2 a30001        	cpw	x,#1
 732  01f5 260c          	jrne	L352
 733                     ; 219 		LED_OFF();
 735  01f7 4b08          	push	#8
 736  01f9 ae500f        	ldw	x,#20495
 737  01fc cd0000        	call	_GPIO_WriteHigh
 739  01ff 84            	pop	a
 740                     ; 220 		a = 0;
 742  0200 5f            	clrw	x
 743  0201 bf00          	ldw	L761_a,x
 744  0203               L352:
 745                     ; 224 	switch (tIRFSM.u8ReceivedStatus) {
 747  0203 b614          	ld	a,L3_tIRFSM
 749                     ; 411 	default:
 749                     ; 412 		break;
 750  0205 4d            	tnz	a
 751  0206 2710          	jreq	L171
 752  0208 4a            	dec	a
 753  0209 272e          	jreq	L371
 754  020b 4a            	dec	a
 755  020c 276f          	jreq	L571
 756  020e 4a            	dec	a
 757  020f 2603          	jrne	L45
 758  0211 cc036e        	jp	L771
 759  0214               L45:
 760  0214 ac800380      	jpf	L162
 761  0218               L171:
 762                     ; 226 	case _IR_RECEIVEDSTATUS_IDLE:
 762                     ; 227 		//转入接收启动码状态
 762                     ; 228 		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_START;
 764  0218 35010014      	mov	L3_tIRFSM,#1
 765                     ; 231 		tIRFSM.fCodeTimeEn = 1;
 767  021c 72100015      	bset	L3_tIRFSM+1,#0
 768                     ; 234 		tIRFSM.u32CodeTime = 0;
 770  0220 ae0000        	ldw	x,#0
 771  0223 bf1e          	ldw	L3_tIRFSM+10,x
 772  0225 ae0000        	ldw	x,#0
 773  0228 bf1c          	ldw	L3_tIRFSM+8,x
 774                     ; 237 		tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
 776  022a 35320025      	mov	L3_tIRFSM+17,#50
 777                     ; 240 		tIRFSM.u8RecievedCode = 0;
 779  022e 3f1b          	clr	L3_tIRFSM+7
 780                     ; 243 		TIM3_Cmd(ENABLE);
 782  0230 a601          	ld	a,#1
 783  0232 cd0000        	call	_TIM3_Cmd
 785                     ; 244 		break;
 787  0235 ac800380      	jpf	L162
 788  0239               L371:
 789                     ; 247 	case _IR_RECEIVEDSTATUS_START:
 789                     ; 248 		//上次接收到的是启动码
 789                     ; 249 		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_START - _IR_CODE_TIME_BIAS)
 789                     ; 250 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_START + _IR_CODE_TIME_BIAS)) {
 791  0239 ae001c        	ldw	x,#L3_tIRFSM+8
 792  023c cd0000        	call	c_ltor
 794  023f ae0000        	ldw	x,#L63
 795  0242 cd0000        	call	c_lcmp
 797  0245 252e          	jrult	L362
 799  0247 ae001c        	ldw	x,#L3_tIRFSM+8
 800  024a cd0000        	call	c_ltor
 802  024d ae0004        	ldw	x,#L04
 803  0250 cd0000        	call	c_lcmp
 805  0253 2420          	jruge	L362
 806                     ; 252 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_32BITSDATA;
 808  0255 35020014      	mov	L3_tIRFSM,#2
 809                     ; 255 			tIRFSM.u32CodeTime = 0;
 811  0259 ae0000        	ldw	x,#0
 812  025c bf1e          	ldw	L3_tIRFSM+10,x
 813  025e ae0000        	ldw	x,#0
 814  0261 bf1c          	ldw	L3_tIRFSM+8,x
 815                     ; 258 			tIRFSM.u8BitsLength = 32;
 817  0263 3520001a      	mov	L3_tIRFSM+6,#32
 818                     ; 261 			tIRFSM.u32Recieved32Bits = 0;
 820  0267 ae0000        	ldw	x,#0
 821  026a bf18          	ldw	L3_tIRFSM+4,x
 822  026c ae0000        	ldw	x,#0
 823  026f bf16          	ldw	L3_tIRFSM+2,x
 825  0271 ac800380      	jpf	L162
 826  0275               L362:
 827                     ; 265 			u8Err = 1;
 829  0275 a601          	ld	a,#1
 830  0277 6b03          	ld	(OFST-2,sp),a
 831  0279 ac800380      	jpf	L162
 832  027d               L571:
 833                     ; 272 	case _IR_RECEIVEDSTATUS_32BITSDATA:
 833                     ; 273 		//收到“0”
 833                     ; 274 		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_0 - _IR_CODE_TIME_BIAS)
 833                     ; 275 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_0 + _IR_CODE_TIME_BIAS)) {
 835  027d ae001c        	ldw	x,#L3_tIRFSM+8
 836  0280 cd0000        	call	c_ltor
 838  0283 ae0008        	ldw	x,#L24
 839  0286 cd0000        	call	c_lcmp
 841  0289 2512          	jrult	L762
 843  028b ae001c        	ldw	x,#L3_tIRFSM+8
 844  028e cd0000        	call	c_ltor
 846  0291 ae000c        	ldw	x,#L44
 847  0294 cd0000        	call	c_lcmp
 849  0297 2404          	jruge	L762
 850                     ; 276 			u8Bit = 0;
 852  0299 0f05          	clr	(OFST+0,sp)
 854  029b 2026          	jra	L172
 855  029d               L762:
 856                     ; 279 		else if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_1 - _IR_CODE_TIME_BIAS)
 856                     ; 280 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_1 + _IR_CODE_TIME_BIAS)) {
 858  029d ae001c        	ldw	x,#L3_tIRFSM+8
 859  02a0 cd0000        	call	c_ltor
 861  02a3 ae0010        	ldw	x,#L64
 862  02a6 cd0000        	call	c_lcmp
 864  02a9 2514          	jrult	L372
 866  02ab ae001c        	ldw	x,#L3_tIRFSM+8
 867  02ae cd0000        	call	c_ltor
 869  02b1 ae0014        	ldw	x,#L05
 870  02b4 cd0000        	call	c_lcmp
 872  02b7 2406          	jruge	L372
 873                     ; 281 			u8Bit = 1;
 875  02b9 a601          	ld	a,#1
 876  02bb 6b05          	ld	(OFST+0,sp),a
 878  02bd 2004          	jra	L172
 879  02bf               L372:
 880                     ; 285 			u8Err = 1;
 882  02bf a601          	ld	a,#1
 883  02c1 6b03          	ld	(OFST-2,sp),a
 884  02c3               L172:
 885                     ; 288 		if (!u8Err) {
 887  02c3 0d03          	tnz	(OFST-2,sp)
 888  02c5 2703          	jreq	L65
 889  02c7 cc0380        	jp	L162
 890  02ca               L65:
 891                     ; 296 			if(1 == u8Bit)
 893  02ca 7b05          	ld	a,(OFST+0,sp)
 894  02cc a101          	cp	a,#1
 895  02ce 2617          	jrne	L103
 896                     ; 297 				tIRFSM.u32Recieved32Bits |= ((uint32_t)0x01 << (32-tIRFSM.u8BitsLength));
 898  02d0 ae0001        	ldw	x,#1
 899  02d3 bf02          	ldw	c_lreg+2,x
 900  02d5 ae0000        	ldw	x,#0
 901  02d8 bf00          	ldw	c_lreg,x
 902  02da a620          	ld	a,#32
 903  02dc b01a          	sub	a,L3_tIRFSM+6
 904  02de cd0000        	call	c_llsh
 906  02e1 ae0016        	ldw	x,#L3_tIRFSM+2
 907  02e4 cd0000        	call	c_lgor
 909  02e7               L103:
 910                     ; 300 			tIRFSM.u32CodeTime = 0;
 912  02e7 ae0000        	ldw	x,#0
 913  02ea bf1e          	ldw	L3_tIRFSM+10,x
 914  02ec ae0000        	ldw	x,#0
 915  02ef bf1c          	ldw	L3_tIRFSM+8,x
 916                     ; 303 			tIRFSM.u8BitsLength--;
 918  02f1 3a1a          	dec	L3_tIRFSM+6
 919                     ; 306 			if (!tIRFSM.u8BitsLength) {
 921  02f3 3d1a          	tnz	L3_tIRFSM+6
 922  02f5 26d0          	jrne	L162
 923                     ; 308 				u8IDData = ((tIRFSM.u32Recieved32Bits >> 24) & 0x000000FF);
 925  02f7 b616          	ld	a,L3_tIRFSM+2
 926  02f9 6b05          	ld	(OFST+0,sp),a
 927                     ; 309 				u8IDAntiData = ((tIRFSM.u32Recieved32Bits >> 16) & 0x000000FF);
 929  02fb b617          	ld	a,L3_tIRFSM+3
 930  02fd a4ff          	and	a,#255
 931  02ff 6b04          	ld	(OFST-1,sp),a
 932                     ; 310 				u8OperateData = ((tIRFSM.u32Recieved32Bits >> 8) & 0x000000FF);
 934  0301 b618          	ld	a,L3_tIRFSM+4
 935  0303 a4ff          	and	a,#255
 936  0305 6b01          	ld	(OFST-4,sp),a
 937                     ; 311 				u8OperateAntiData = tIRFSM.u32Recieved32Bits & 0x000000FF;
 939  0307 b619          	ld	a,L3_tIRFSM+5
 940  0309 a4ff          	and	a,#255
 941  030b 6b02          	ld	(OFST-3,sp),a
 942                     ; 313 				printf("[IR] code = %x%x%x%x", u8IDData, u8IDAntiData, u8OperateData, u8OperateAntiData);
 944  030d 7b02          	ld	a,(OFST-3,sp)
 945  030f 88            	push	a
 946  0310 7b02          	ld	a,(OFST-3,sp)
 947  0312 88            	push	a
 948  0313 7b06          	ld	a,(OFST+1,sp)
 949  0315 88            	push	a
 950  0316 7b08          	ld	a,(OFST+3,sp)
 951  0318 88            	push	a
 952  0319 35200000      	mov	c_x,#page(L503)
 953  031d ae0020        	ldw	x,#L503
 954  0320 cd0000        	call	_printf
 956  0323 5b04          	addw	sp,#4
 957                     ; 316 				if ((0xFF != u8IDData + u8IDAntiData) /*|| (0xFF != u8OperateData + u8OperateAntiData)*/) {
 959  0325 7b05          	ld	a,(OFST+0,sp)
 960  0327 5f            	clrw	x
 961  0328 1b04          	add	a,(OFST-1,sp)
 962  032a 2401          	jrnc	L25
 963  032c 5c            	incw	x
 964  032d               L25:
 965  032d 02            	rlwa	x,a
 966  032e a300ff        	cpw	x,#255
 967  0331 2706          	jreq	L703
 968                     ; 317 					u8Err = 1;
 970  0333 a601          	ld	a,#1
 971  0335 6b03          	ld	(OFST-2,sp),a
 973  0337 2047          	jra	L162
 974  0339               L703:
 975                     ; 322 					if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
 977  0339 b622          	ld	a,L3_tIRFSM+14
 978  033b a114          	cp	a,#20
 979  033d 241b          	jruge	L313
 980                     ; 324 						tIRFSM.u8Available_Rx++;
 982  033f 3c22          	inc	L3_tIRFSM+14
 983                     ; 327 						*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = u8IDAntiData;
 985  0341 b620          	ld	a,L3_tIRFSM+12
 986  0343 97            	ld	xl,a
 987  0344 3c20          	inc	L3_tIRFSM+12
 988  0346 9f            	ld	a,xl
 989  0347 5f            	clrw	x
 990  0348 97            	ld	xl,a
 991  0349 7b04          	ld	a,(OFST-1,sp)
 992  034b 92d723        	ld	([L3_tIRFSM+15.w],x),a
 993                     ; 330 						tIRFSM.u8RecievedCode = u8IDAntiData;
 995  034e 7b04          	ld	a,(OFST-1,sp)
 996  0350 b71b          	ld	L3_tIRFSM+7,a
 997                     ; 333 						if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
 999  0352 b620          	ld	a,L3_tIRFSM+12
1000  0354 a114          	cp	a,#20
1001  0356 2502          	jrult	L313
1002                     ; 334 							tIRFSM.u8Write_Rx = 0;
1004  0358 3f20          	clr	L3_tIRFSM+12
1005  035a               L313:
1006                     ; 339 					tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;
1008  035a 35030014      	mov	L3_tIRFSM,#3
1009                     ; 342 					tIRFSM.fFirstContinue = 1;
1011  035e 72120015      	bset	L3_tIRFSM+1,#1
1012                     ; 345 					tIRFSM.u32CodeTime = 0;
1014  0362 ae0000        	ldw	x,#0
1015  0365 bf1e          	ldw	L3_tIRFSM+10,x
1016  0367 ae0000        	ldw	x,#0
1017  036a bf1c          	ldw	L3_tIRFSM+8,x
1018  036c 2012          	jra	L162
1019  036e               L771:
1020                     ; 353 	case _IR_RECEIVEDSTATUS_INTERVAL:
1020                     ; 354 			//转入接收连发码之间的间隔状态
1020                     ; 355 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;
1022  036e 35030014      	mov	L3_tIRFSM,#3
1023                     ; 358 			tIRFSM.u32CodeTime = 0;
1025  0372 ae0000        	ldw	x,#0
1026  0375 bf1e          	ldw	L3_tIRFSM+10,x
1027  0377 ae0000        	ldw	x,#0
1028  037a bf1c          	ldw	L3_tIRFSM+8,x
1029                     ; 361 			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
1031  037c 35320025      	mov	L3_tIRFSM+17,#50
1032                     ; 363 		break;
1034  0380               L102:
1035                     ; 411 	default:
1035                     ; 412 		break;
1037  0380               L162:
1038                     ; 416 	if (u8Err) {
1040  0380 0d03          	tnz	(OFST-2,sp)
1041  0382 2722          	jreq	L713
1042                     ; 418 		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1044  0384 3f14          	clr	L3_tIRFSM
1045                     ; 421 		tIRFSM.fCodeTimeEn = 0;
1047  0386 72110015      	bres	L3_tIRFSM+1,#0
1048                     ; 424 		tIRFSM.u32CodeTime = 0;
1050  038a ae0000        	ldw	x,#0
1051  038d bf1e          	ldw	L3_tIRFSM+10,x
1052  038f ae0000        	ldw	x,#0
1053  0392 bf1c          	ldw	L3_tIRFSM+8,x
1054                     ; 427 		tIRFSM.u32Recieved32Bits = 0;
1056  0394 ae0000        	ldw	x,#0
1057  0397 bf18          	ldw	L3_tIRFSM+4,x
1058  0399 ae0000        	ldw	x,#0
1059  039c bf16          	ldw	L3_tIRFSM+2,x
1060                     ; 430 		tIRFSM.u8BitsLength = 0;
1062  039e 3f1a          	clr	L3_tIRFSM+6
1063                     ; 433 		tIRFSM.u8ReceiveTimeout = 0;
1065  03a0 3f25          	clr	L3_tIRFSM+17
1066                     ; 436 		TIM3_Cmd(DISABLE);
1068  03a2 4f            	clr	a
1069  03a3 cd0000        	call	_TIM3_Cmd
1071  03a6               L713:
1072                     ; 438 }
1075  03a6 5b05          	addw	sp,#5
1076  03a8 81            	ret
1101                     ; 446 void Isr_IR_Timeout10ms(void) {
1102                     	switch	.text
1103  03a9               _Isr_IR_Timeout10ms:
1107                     ; 449 	if (tIRFSM.u8ReceiveTimeout) {
1109  03a9 3d25          	tnz	L3_tIRFSM+17
1110  03ab 2710          	jreq	L133
1111                     ; 450 		tIRFSM.u8ReceiveTimeout--;
1113  03ad 3a25          	dec	L3_tIRFSM+17
1114                     ; 453 		if (0 == tIRFSM.u8ReceiveTimeout) {
1116  03af 3d25          	tnz	L3_tIRFSM+17
1117  03b1 260a          	jrne	L133
1118                     ; 455 			TIM3_Cmd(DISABLE);
1120  03b3 4f            	clr	a
1121  03b4 cd0000        	call	_TIM3_Cmd
1123                     ; 458 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1125  03b7 3f14          	clr	L3_tIRFSM
1126                     ; 461 			tIRFSM.fCodeTimeEn = 0;
1128  03b9 72110015      	bres	L3_tIRFSM+1,#0
1129  03bd               L133:
1130                     ; 464 }
1133  03bd 81            	ret
1158                     	switch	.const
1159  0018               L46:
1160  0018 00004e20      	dc.l	20000
1161  001c               L66:
1162  001c 0001d4c0      	dc.l	120000
1163                     ; 472 void Isr_IR_Timeout100us(void) {
1164                     	switch	.text
1165  03be               _Isr_IR_Timeout100us:
1169                     ; 475 	if (tIRFSM.fCodeTimeEn) {
1171  03be b615          	ld	a,L3_tIRFSM+1
1172  03c0 a501          	bcp	a,#1
1173  03c2 2740          	jreq	L543
1174                     ; 477 		tIRFSM.u32CodeTime += 100;
1176  03c4 ae001c        	ldw	x,#L3_tIRFSM+8
1177  03c7 a664          	ld	a,#100
1178  03c9 cd0000        	call	c_lgadc
1180                     ; 480 		if (((tIRFSM.u8ReceivedStatus <= _IR_RECEIVEDSTATUS_32BITSDATA)
1180                     ; 481 				&& (tIRFSM.u32CodeTime >= _IR_DATA_LIMITATION_TIME))
1180                     ; 482 				|| ((tIRFSM.u8ReceivedStatus == _IR_RECEIVEDSTATUS_INTERVAL)
1180                     ; 483 						&& (tIRFSM.u32CodeTime >= _IR_INTERVAL_LIMITATION_TIME))) {
1182  03cc b614          	ld	a,L3_tIRFSM
1183  03ce a103          	cp	a,#3
1184  03d0 240e          	jruge	L353
1186  03d2 ae001c        	ldw	x,#L3_tIRFSM+8
1187  03d5 cd0000        	call	c_ltor
1189  03d8 ae0018        	ldw	x,#L46
1190  03db cd0000        	call	c_lcmp
1192  03de 2414          	jruge	L153
1193  03e0               L353:
1195  03e0 b614          	ld	a,L3_tIRFSM
1196  03e2 a103          	cp	a,#3
1197  03e4 261e          	jrne	L543
1199  03e6 ae001c        	ldw	x,#L3_tIRFSM+8
1200  03e9 cd0000        	call	c_ltor
1202  03ec ae001c        	ldw	x,#L66
1203  03ef cd0000        	call	c_lcmp
1205  03f2 2510          	jrult	L543
1206  03f4               L153:
1207                     ; 485 			tIRFSM.fCodeTimeEn = 0;
1209  03f4 72110015      	bres	L3_tIRFSM+1,#0
1210                     ; 488 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1212  03f8 3f14          	clr	L3_tIRFSM
1213                     ; 491 			tIRFSM.u32CodeTime = 0;
1215  03fa ae0000        	ldw	x,#0
1216  03fd bf1e          	ldw	L3_tIRFSM+10,x
1217  03ff ae0000        	ldw	x,#0
1218  0402 bf1c          	ldw	L3_tIRFSM+8,x
1219  0404               L543:
1220                     ; 494 }
1223  0404 81            	ret
1368                     	xref	_printf
1369                     	switch	.ubsct
1370  0000               L5_IR_Buf:
1371  0000 000000000000  	ds.b	20
1372  0014               L3_tIRFSM:
1373  0014 000000000000  	ds.b	18
1374                     	xref	_COMM_RequestSendCommand
1375                     	xref	_ZeroMem
1376                     	xdef	_ISR_IRReceive
1377                     	xdef	_Isr_IR_Timeout100us
1378                     	xdef	_Isr_IR_Timeout10ms
1379                     	xdef	_IR_Process
1380                     	xdef	_IR_Init
1381                     	xref	_TIM3_ClearFlag
1382                     	xref	_TIM3_ITConfig
1383                     	xref	_TIM3_Cmd
1384                     	xref	_TIM3_TimeBaseInit
1385                     	xref	_TIM2_ClearFlag
1386                     	xref	_TIM2_ITConfig
1387                     	xref	_TIM2_Cmd
1388                     	xref	_TIM2_TimeBaseInit
1389                     	xref	_GPIO_WriteLow
1390                     	xref	_GPIO_WriteHigh
1391                     	xref	_GPIO_Init
1392                     	xref	_EXTI_SetTLISensitivity
1393                     	xref	_EXTI_SetExtIntSensitivity
1394                     	switch	.const
1395  0020               L503:
1396  0020 5b49525d2063  	dc.b	"[IR] code = %x%x%x"
1397  0032 257800        	dc.b	"%x",0
1398  0035               L561:
1399  0035 5b49525d2049  	dc.b	"[IR] IR_CMD_BK_VIE"
1400  0047 570a00        	dc.b	"W",10,0
1401  004a               L361:
1402  004a 5b49525d2049  	dc.b	"[IR] IR_CMD_FR_VIE"
1403  005c 570a00        	dc.b	"W",10,0
1404  005f               L161:
1405  005f 5b49525d2049  	dc.b	"[IR] IR_CMD_RT_VIE"
1406  0071 570a00        	dc.b	"W",10,0
1407  0074               L751:
1408  0074 5b49525d2049  	dc.b	"[IR] IR_CMD_LF_VIE"
1409  0086 570a00        	dc.b	"W",10,0
1410  0089               L551:
1411  0089 5b49525d2049  	dc.b	"[IR] IR_CMD_POWER",10,0
1412  009c               L351:
1413  009c 5b49525d2049  	dc.b	"[IR] IR_CMD_BACK",10,0
1414  00ae               L151:
1415  00ae 5b49525d2049  	dc.b	"[IR] IR_CMD_RIGHT",10,0
1416  00c1               L741:
1417  00c1 5b49525d2049  	dc.b	"[IR] IR_CMD_LEFT",10,0
1418  00d3               L541:
1419  00d3 5b49525d2049  	dc.b	"[IR] IR_CMD_DOWN",10,0
1420  00e5               L341:
1421  00e5 5b49525d2049  	dc.b	"[IR] IR_CMD_UP",10,0
1422  00f5               L141:
1423  00f5 5b49525d2049  	dc.b	"[IR] IR_CMD_OK",10,0
1424                     	xref.b	c_lreg
1425                     	xref.b	c_x
1445                     	xref	c_lgadc
1446                     	xref	c_lgor
1447                     	xref	c_llsh
1448                     	xref	c_lcmp
1449                     	xref	c_ltor
1450                     	end

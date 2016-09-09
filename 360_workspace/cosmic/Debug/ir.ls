   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  49                     ; 31 void IR_Init()
  49                     ; 32 {
  51                     	switch	.text
  52  0000               _IR_Init:
  56                     ; 33 	ZeroMem((u8*)&tIRFSM, sizeof(tIRFSMType));
  58  0000 ae0012        	ldw	x,#18
  59  0003 89            	pushw	x
  60  0004 ae0000        	ldw	x,#0
  61  0007 89            	pushw	x
  62  0008 ae0014        	ldw	x,#L3_tIRFSM
  63  000b cd0000        	call	_ZeroMem
  65  000e 5b04          	addw	sp,#4
  66                     ; 34 	tIRFSM.pu8Buffer_Rx = &IR_Buf[0];
  68  0010 ae0000        	ldw	x,#L5_IR_Buf
  69  0013 cf0023        	ldw	L3_tIRFSM+15,x
  70                     ; 35 	ZeroMem(IR_Buf, _BUFFER_LENGTH_IR_Rx_);
  72  0016 ae0014        	ldw	x,#20
  73  0019 89            	pushw	x
  74  001a ae0000        	ldw	x,#0
  75  001d 89            	pushw	x
  76  001e ae0000        	ldw	x,#L5_IR_Buf
  77  0021 cd0000        	call	_ZeroMem
  79  0024 5b04          	addw	sp,#4
  80                     ; 37 	IR_GPIO_Init();
  82  0026 ad05          	call	L7_IR_GPIO_Init
  84                     ; 39 	TIM3_Config_10ms();
  86  0028 ad27          	call	L11_TIM3_Config_10ms
  88                     ; 40 	TIM4_Config_100us();
  90  002a ad43          	call	L31_TIM4_Config_100us
  92                     ; 41 }
  95  002c 81            	ret
 121                     ; 47 void IR_GPIO_Init() {
 122                     	switch	.text
 123  002d               L7_IR_GPIO_Init:
 127                     ; 50 	GPIO_Init(GPIO_IR_PORT, GPIO_IR_PIN, GPIO_MODE_IN_FL_IT);
 129  002d 4b20          	push	#32
 130  002f 4b20          	push	#32
 131  0031 ae5014        	ldw	x,#20500
 132  0034 cd0000        	call	_GPIO_Init
 134  0037 85            	popw	x
 135                     ; 53 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);
 137  0038 ae0002        	ldw	x,#2
 138  003b a604          	ld	a,#4
 139  003d 95            	ld	xh,a
 140  003e cd0000        	call	_EXTI_SetExtIntSensitivity
 142                     ; 54 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 144  0041 4f            	clr	a
 145  0042 cd0000        	call	_EXTI_SetTLISensitivity
 147                     ; 57 	GPIO_Init(GPIOE, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
 149  0045 4bf0          	push	#240
 150  0047 4b40          	push	#64
 151  0049 ae5014        	ldw	x,#20500
 152  004c cd0000        	call	_GPIO_Init
 154  004f 85            	popw	x
 155                     ; 58 }
 158  0050 81            	ret
 185                     ; 65 void TIM3_Config_10ms(void)
 185                     ; 66 {
 186                     	switch	.text
 187  0051               L11_TIM3_Config_10ms:
 191                     ; 87   TIM3_TimeBaseInit(TIM3_PRESCALER_1024, TIM3_PERIOD);
 193  0051 ae009f        	ldw	x,#159
 194  0054 89            	pushw	x
 195  0055 a60a          	ld	a,#10
 196  0057 cd0000        	call	_TIM3_TimeBaseInit
 198  005a 85            	popw	x
 199                     ; 89   TIM3_ClearFlag(TIM3_FLAG_UPDATE);
 201  005b ae0001        	ldw	x,#1
 202  005e cd0000        	call	_TIM3_ClearFlag
 204                     ; 91   TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
 206  0061 ae0001        	ldw	x,#1
 207  0064 a601          	ld	a,#1
 208  0066 95            	ld	xh,a
 209  0067 cd0000        	call	_TIM3_ITConfig
 211                     ; 94   TIM3_Cmd(DISABLE);
 213  006a 4f            	clr	a
 214  006b cd0000        	call	_TIM3_Cmd
 216                     ; 97 }
 219  006e 81            	ret
 246                     ; 104 static void TIM4_Config_100us(void)
 246                     ; 105 {
 247                     	switch	.text
 248  006f               L31_TIM4_Config_100us:
 252                     ; 116   TIM4_TimeBaseInit(TIM4_PRESCALER_16, TIM4_PERIOD);
 254  006f ae0063        	ldw	x,#99
 255  0072 a604          	ld	a,#4
 256  0074 95            	ld	xh,a
 257  0075 cd0000        	call	_TIM4_TimeBaseInit
 259                     ; 118   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 261  0078 a601          	ld	a,#1
 262  007a cd0000        	call	_TIM4_ClearFlag
 264                     ; 120   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 266  007d ae0001        	ldw	x,#1
 267  0080 a601          	ld	a,#1
 268  0082 95            	ld	xh,a
 269  0083 cd0000        	call	_TIM4_ITConfig
 271                     ; 123   TIM4_Cmd(ENABLE);
 273  0086 a601          	ld	a,#1
 274  0088 cd0000        	call	_TIM4_Cmd
 276                     ; 124 }
 279  008b 81            	ret
 314                     ; 134 void IR_Process() {
 315                     	switch	.text
 316  008c               _IR_Process:
 318  008c 88            	push	a
 319       00000001      OFST:	set	1
 322                     ; 135 	u8 u8IRData = 0;
 324                     ; 138 	if (tIRFSM.u8Available_Rx) {
 326  008d 725d0022      	tnz	L3_tIRFSM+14
 327  0091 2603          	jrne	L61
 328  0093 cc01e1        	jp	L721
 329  0096               L61:
 330                     ; 140 		u8IRData = *(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Read_Rx++);
 332  0096 c60021        	ld	a,L3_tIRFSM+13
 333  0099 97            	ld	xl,a
 334  009a 725c0021      	inc	L3_tIRFSM+13
 335  009e 9f            	ld	a,xl
 336  009f 5f            	clrw	x
 337  00a0 97            	ld	xl,a
 338  00a1 72d60023      	ld	a,([L3_tIRFSM+15.w],x)
 339  00a5 6b01          	ld	(OFST+0,sp),a
 340                     ; 143 		if (tIRFSM.u8Read_Rx >= _BUFFER_LENGTH_IR_Rx_) {
 342  00a7 c60021        	ld	a,L3_tIRFSM+13
 343  00aa a114          	cp	a,#20
 344  00ac 2504          	jrult	L131
 345                     ; 144 			tIRFSM.u8Read_Rx = 0;
 347  00ae 725f0021      	clr	L3_tIRFSM+13
 348  00b2               L131:
 349                     ; 148 		--tIRFSM.u8Available_Rx;
 351  00b2 725a0022      	dec	L3_tIRFSM+14
 352                     ; 151 		switch (u8IRData) {
 354  00b6 7b01          	ld	a,(OFST+0,sp)
 356                     ; 196 		default:
 356                     ; 197 			break;
 357  00b8 4d            	tnz	a
 358  00b9 2739          	jreq	L36
 359  00bb a002          	sub	a,#2
 360  00bd 2603          	jrne	L02
 361  00bf cc017a        	jp	L77
 362  00c2               L02:
 363  00c2 a003          	sub	a,#3
 364  00c4 275c          	jreq	L76
 365  00c6 4a            	dec	a
 366  00c7 2742          	jreq	L56
 367  00c9 a002          	sub	a,#2
 368  00cb 2603          	jrne	L22
 369  00cd cc0165        	jp	L57
 370  00d0               L22:
 371  00d0 4a            	dec	a
 372  00d1 2603          	jrne	L42
 373  00d3 cc01b9        	jp	L501
 374  00d6               L42:
 375  00d6 4a            	dec	a
 376  00d7 2603          	jrne	L62
 377  00d9 cc01ce        	jp	L701
 378  00dc               L62:
 379  00dc a003          	sub	a,#3
 380  00de 2759          	jreq	L17
 381  00e0 4a            	dec	a
 382  00e1 276d          	jreq	L37
 383  00e3 a00f          	sub	a,#15
 384  00e5 2603          	jrne	L03
 385  00e7 cc01a4        	jp	L301
 386  00ea               L03:
 387  00ea 4a            	dec	a
 388  00eb 2603          	jrne	L23
 389  00ed cc018f        	jp	L101
 390  00f0               L23:
 391  00f0 ace101e1      	jpf	L721
 392  00f4               L36:
 393                     ; 152 		case	IR_CMD_OK: 			//0x0b	确认
 393                     ; 153 			COMM_RequestSendCommand(MENU_OK, KEY_ACTIVED);
 395  00f4 ae0001        	ldw	x,#1
 396  00f7 a60a          	ld	a,#10
 397  00f9 95            	ld	xh,a
 398  00fa cd0000        	call	_COMM_RequestSendCommand
 400                     ; 154 			printf("[IR] IR_CMD_OK\n");
 402  00fd 35f50000      	mov	c_x,#page(L731)
 403  0101 ae00f5        	ldw	x,#L731
 404  0104 cd0000        	call	_printf
 406                     ; 155 			break;
 408  0107 ace101e1      	jpf	L721
 409  010b               L56:
 410                     ; 156 		case	IR_CMD_UP: 			//0x06	上
 410                     ; 157 			COMM_RequestSendCommand(MENU_UP, KEY_ACTIVED);
 412  010b ae0001        	ldw	x,#1
 413  010e a608          	ld	a,#8
 414  0110 95            	ld	xh,a
 415  0111 cd0000        	call	_COMM_RequestSendCommand
 417                     ; 158 			printf("[IR] IR_CMD_UP\n");
 419  0114 35e50000      	mov	c_x,#page(L141)
 420  0118 ae00e5        	ldw	x,#L141
 421  011b cd0000        	call	_printf
 423                     ; 159 			break;
 425  011e ace101e1      	jpf	L721
 426  0122               L76:
 427                     ; 160 		case	IR_CMD_DOWN: 		//0x05	下
 427                     ; 161 			COMM_RequestSendCommand(MENU_DOWN, KEY_ACTIVED);
 429  0122 ae0001        	ldw	x,#1
 430  0125 a609          	ld	a,#9
 431  0127 95            	ld	xh,a
 432  0128 cd0000        	call	_COMM_RequestSendCommand
 434                     ; 162 			printf("[IR] IR_CMD_DOWN\n");
 436  012b 35d30000      	mov	c_x,#page(L341)
 437  012f ae00d3        	ldw	x,#L341
 438  0132 cd0000        	call	_printf
 440                     ; 163 			break;
 442  0135 ace101e1      	jpf	L721
 443  0139               L17:
 444                     ; 164 		case	IR_CMD_LEFT: 		//0x0d	左
 444                     ; 165 			COMM_RequestSendCommand(MENU_LEFT, KEY_ACTIVED);
 446  0139 ae0001        	ldw	x,#1
 447  013c a606          	ld	a,#6
 448  013e 95            	ld	xh,a
 449  013f cd0000        	call	_COMM_RequestSendCommand
 451                     ; 166 			printf("[IR] IR_CMD_LEFT\n");
 453  0142 35c10000      	mov	c_x,#page(L541)
 454  0146 ae00c1        	ldw	x,#L541
 455  0149 cd0000        	call	_printf
 457                     ; 167 			break;
 459  014c ace101e1      	jpf	L721
 460  0150               L37:
 461                     ; 168 		case	IR_CMD_RIGHT: 		//0x0e	右
 461                     ; 169 			COMM_RequestSendCommand(MENU_RIGHT, KEY_ACTIVED);
 463  0150 ae0001        	ldw	x,#1
 464  0153 a607          	ld	a,#7
 465  0155 95            	ld	xh,a
 466  0156 cd0000        	call	_COMM_RequestSendCommand
 468                     ; 170 			printf("[IR] IR_CMD_RIGHT\n");
 470  0159 35ae0000      	mov	c_x,#page(L741)
 471  015d ae00ae        	ldw	x,#L741
 472  0160 cd0000        	call	_printf
 474                     ; 171 			break;
 476  0163 207c          	jra	L721
 477  0165               L57:
 478                     ; 172 		case	IR_CMD_BACK: 		//0x08	返回
 478                     ; 173 			COMM_RequestSendCommand(MENU_BACK, KEY_ACTIVED);			
 480  0165 ae0001        	ldw	x,#1
 481  0168 a605          	ld	a,#5
 482  016a 95            	ld	xh,a
 483  016b cd0000        	call	_COMM_RequestSendCommand
 485                     ; 174 			printf("[IR] IR_CMD_BACK\n");
 487  016e 359c0000      	mov	c_x,#page(L151)
 488  0172 ae009c        	ldw	x,#L151
 489  0175 cd0000        	call	_printf
 491                     ; 175 			break;
 493  0178 2067          	jra	L721
 494  017a               L77:
 495                     ; 176 		case	IR_CMD_POWER: 		//0x02	电源
 495                     ; 177 			COMM_RequestSendCommand(MENU_POWER, KEY_ACTIVED);			
 497  017a ae0001        	ldw	x,#1
 498  017d a60b          	ld	a,#11
 499  017f 95            	ld	xh,a
 500  0180 cd0000        	call	_COMM_RequestSendCommand
 502                     ; 178 			printf("[IR] IR_CMD_POWER\n");
 504  0183 35890000      	mov	c_x,#page(L351)
 505  0187 ae0089        	ldw	x,#L351
 506  018a cd0000        	call	_printf
 508                     ; 179 			break;
 510  018d 2052          	jra	L721
 511  018f               L101:
 512                     ; 180 		case	IR_CMD_LF_VIEW: 	//0x1e	（左视）AV1
 512                     ; 181 			COMM_RequestSendCommand(KEY_LEFT, KEY_ACTIVED);	
 514  018f ae0001        	ldw	x,#1
 515  0192 a602          	ld	a,#2
 516  0194 95            	ld	xh,a
 517  0195 cd0000        	call	_COMM_RequestSendCommand
 519                     ; 182 			printf("[IR] IR_CMD_LF_VIEW\n");
 521  0198 35740000      	mov	c_x,#page(L551)
 522  019c ae0074        	ldw	x,#L551
 523  019f cd0000        	call	_printf
 525                     ; 183 			break;
 527  01a2 203d          	jra	L721
 528  01a4               L301:
 529                     ; 184 		case	IR_CMD_RT_VIEW: 	//0x1d	（右视）AV2
 529                     ; 185 			COMM_RequestSendCommand(KEY_RIGHT, KEY_ACTIVED);
 531  01a4 ae0001        	ldw	x,#1
 532  01a7 a603          	ld	a,#3
 533  01a9 95            	ld	xh,a
 534  01aa cd0000        	call	_COMM_RequestSendCommand
 536                     ; 186 			printf("[IR] IR_CMD_RT_VIEW\n");
 538  01ad 355f0000      	mov	c_x,#page(L751)
 539  01b1 ae005f        	ldw	x,#L751
 540  01b4 cd0000        	call	_printf
 542                     ; 187 			break;
 544  01b7 2028          	jra	L721
 545  01b9               L501:
 546                     ; 188 		case	IR_CMD_FR_VIEW: //	0x09	（前视）AV3
 546                     ; 189 			COMM_RequestSendCommand(KEY_FRONT, KEY_ACTIVED);
 548  01b9 ae0001        	ldw	x,#1
 549  01bc a601          	ld	a,#1
 550  01be 95            	ld	xh,a
 551  01bf cd0000        	call	_COMM_RequestSendCommand
 553                     ; 190 			printf("[IR] IR_CMD_FR_VIEW\n");
 555  01c2 354a0000      	mov	c_x,#page(L161)
 556  01c6 ae004a        	ldw	x,#L161
 557  01c9 cd0000        	call	_printf
 559                     ; 191 			break;
 561  01cc 2013          	jra	L721
 562  01ce               L701:
 563                     ; 192 		case IR_CMD_BK_VIEW://	0x0a	（后视）AV4
 563                     ; 193 			COMM_RequestSendCommand(KEY_REAR, KEY_ACTIVED);
 565  01ce ae0001        	ldw	x,#1
 566  01d1 a604          	ld	a,#4
 567  01d3 95            	ld	xh,a
 568  01d4 cd0000        	call	_COMM_RequestSendCommand
 570                     ; 194 			printf("[IR] IR_CMD_BK_VIEW\n");
 572  01d7 35350000      	mov	c_x,#page(L361)
 573  01db ae0035        	ldw	x,#L361
 574  01de cd0000        	call	_printf
 576                     ; 195 			break;
 578  01e1               L111:
 579                     ; 196 		default:
 579                     ; 197 			break;
 581  01e1               L531:
 582  01e1               L721:
 583                     ; 200 }
 586  01e1 84            	pop	a
 587  01e2 81            	ret
 590                     	switch	.data
 591  0000               L561_a:
 592  0000 0000          	dc.w	0
 669                     .const:	section	.text
 670  0000               L63:
 671  0000 00003390      	dc.l	13200
 672  0004               L04:
 673  0004 000035e9      	dc.l	13801
 674  0008               L24:
 675  0008 00000334      	dc.l	820
 676  000c               L44:
 677  000c 0000058d      	dc.l	1421
 678  0010               L64:
 679  0010 00000794      	dc.l	1940
 680  0014               L05:
 681  0014 000009ed      	dc.l	2541
 682                     ; 208 void ISR_IRReceive(void) {
 683                     	switch	.text
 684  01e3               _ISR_IRReceive:
 686  01e3 5205          	subw	sp,#5
 687       00000005      OFST:	set	5
 690                     ; 209 	u8 u8Err = 0;						//接收是否出错？
 692  01e5 0f03          	clr	(OFST-2,sp)
 693                     ; 215 	if(a == 0) {
 695  01e7 ce0000        	ldw	x,L561_a
 696  01ea 2611          	jrne	L132
 697                     ; 216 		LED_ON();
 699  01ec 4b40          	push	#64
 700  01ee ae5014        	ldw	x,#20500
 701  01f1 cd0000        	call	_GPIO_WriteLow
 703  01f4 84            	pop	a
 704                     ; 217 		a = 1;
 706  01f5 ae0001        	ldw	x,#1
 707  01f8 cf0000        	ldw	L561_a,x
 709  01fb 2015          	jra	L332
 710  01fd               L132:
 711                     ; 218 	}else if(a == 1) {
 713  01fd ce0000        	ldw	x,L561_a
 714  0200 a30001        	cpw	x,#1
 715  0203 260d          	jrne	L332
 716                     ; 219 		LED_OFF();
 718  0205 4b40          	push	#64
 719  0207 ae5014        	ldw	x,#20500
 720  020a cd0000        	call	_GPIO_WriteHigh
 722  020d 84            	pop	a
 723                     ; 220 		a = 0;
 725  020e 5f            	clrw	x
 726  020f cf0000        	ldw	L561_a,x
 727  0212               L332:
 728                     ; 224 	switch (tIRFSM.u8ReceivedStatus) {
 730  0212 c60014        	ld	a,L3_tIRFSM
 732                     ; 411 	default:
 732                     ; 412 		break;
 733  0215 4d            	tnz	a
 734  0216 2710          	jreq	L761
 735  0218 4a            	dec	a
 736  0219 2732          	jreq	L171
 737  021b 4a            	dec	a
 738  021c 2777          	jreq	L371
 739  021e 4a            	dec	a
 740  021f 2603          	jrne	L45
 741  0221 cc03a1        	jp	L571
 742  0224               L45:
 743  0224 acb503b5      	jpf	L142
 744  0228               L761:
 745                     ; 226 	case _IR_RECEIVEDSTATUS_IDLE:
 745                     ; 227 		//转入接收启动码状态
 745                     ; 228 		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_START;
 747  0228 35010014      	mov	L3_tIRFSM,#1
 748                     ; 231 		tIRFSM.fCodeTimeEn = 1;
 750  022c 72100015      	bset	L3_tIRFSM+1,#0
 751                     ; 234 		tIRFSM.u32CodeTime = 0;
 753  0230 ae0000        	ldw	x,#0
 754  0233 cf001e        	ldw	L3_tIRFSM+10,x
 755  0236 ae0000        	ldw	x,#0
 756  0239 cf001c        	ldw	L3_tIRFSM+8,x
 757                     ; 237 		tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
 759  023c 35320025      	mov	L3_tIRFSM+17,#50
 760                     ; 240 		tIRFSM.u8RecievedCode = 0;
 762  0240 725f001b      	clr	L3_tIRFSM+7
 763                     ; 243 		TIM3_Cmd(ENABLE);
 765  0244 a601          	ld	a,#1
 766  0246 cd0000        	call	_TIM3_Cmd
 768                     ; 244 		break;
 770  0249 acb503b5      	jpf	L142
 771  024d               L171:
 772                     ; 247 	case _IR_RECEIVEDSTATUS_START:
 772                     ; 248 		//上次接收到的是启动码
 772                     ; 249 		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_START - _IR_CODE_TIME_BIAS)
 772                     ; 250 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_START + _IR_CODE_TIME_BIAS)) {
 774  024d ae001c        	ldw	x,#L3_tIRFSM+8
 775  0250 cd0000        	call	c_ltor
 777  0253 ae0000        	ldw	x,#L63
 778  0256 cd0000        	call	c_lcmp
 780  0259 2532          	jrult	L342
 782  025b ae001c        	ldw	x,#L3_tIRFSM+8
 783  025e cd0000        	call	c_ltor
 785  0261 ae0004        	ldw	x,#L04
 786  0264 cd0000        	call	c_lcmp
 788  0267 2424          	jruge	L342
 789                     ; 252 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_32BITSDATA;
 791  0269 35020014      	mov	L3_tIRFSM,#2
 792                     ; 255 			tIRFSM.u32CodeTime = 0;
 794  026d ae0000        	ldw	x,#0
 795  0270 cf001e        	ldw	L3_tIRFSM+10,x
 796  0273 ae0000        	ldw	x,#0
 797  0276 cf001c        	ldw	L3_tIRFSM+8,x
 798                     ; 258 			tIRFSM.u8BitsLength = 32;
 800  0279 3520001a      	mov	L3_tIRFSM+6,#32
 801                     ; 261 			tIRFSM.u32Recieved32Bits = 0;
 803  027d ae0000        	ldw	x,#0
 804  0280 cf0018        	ldw	L3_tIRFSM+4,x
 805  0283 ae0000        	ldw	x,#0
 806  0286 cf0016        	ldw	L3_tIRFSM+2,x
 808  0289 acb503b5      	jpf	L142
 809  028d               L342:
 810                     ; 265 			u8Err = 1;
 812  028d a601          	ld	a,#1
 813  028f 6b03          	ld	(OFST-2,sp),a
 814  0291 acb503b5      	jpf	L142
 815  0295               L371:
 816                     ; 272 	case _IR_RECEIVEDSTATUS_32BITSDATA:
 816                     ; 273 		//收到“0”
 816                     ; 274 		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_0 - _IR_CODE_TIME_BIAS)
 816                     ; 275 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_0 + _IR_CODE_TIME_BIAS)) {
 818  0295 ae001c        	ldw	x,#L3_tIRFSM+8
 819  0298 cd0000        	call	c_ltor
 821  029b ae0008        	ldw	x,#L24
 822  029e cd0000        	call	c_lcmp
 824  02a1 2512          	jrult	L742
 826  02a3 ae001c        	ldw	x,#L3_tIRFSM+8
 827  02a6 cd0000        	call	c_ltor
 829  02a9 ae000c        	ldw	x,#L44
 830  02ac cd0000        	call	c_lcmp
 832  02af 2404          	jruge	L742
 833                     ; 276 			u8Bit = 0;
 835  02b1 0f05          	clr	(OFST+0,sp)
 837  02b3 2026          	jra	L152
 838  02b5               L742:
 839                     ; 279 		else if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_1 - _IR_CODE_TIME_BIAS)
 839                     ; 280 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_1 + _IR_CODE_TIME_BIAS)) {
 841  02b5 ae001c        	ldw	x,#L3_tIRFSM+8
 842  02b8 cd0000        	call	c_ltor
 844  02bb ae0010        	ldw	x,#L64
 845  02be cd0000        	call	c_lcmp
 847  02c1 2514          	jrult	L352
 849  02c3 ae001c        	ldw	x,#L3_tIRFSM+8
 850  02c6 cd0000        	call	c_ltor
 852  02c9 ae0014        	ldw	x,#L05
 853  02cc cd0000        	call	c_lcmp
 855  02cf 2406          	jruge	L352
 856                     ; 281 			u8Bit = 1;
 858  02d1 a601          	ld	a,#1
 859  02d3 6b05          	ld	(OFST+0,sp),a
 861  02d5 2004          	jra	L152
 862  02d7               L352:
 863                     ; 285 			u8Err = 1;
 865  02d7 a601          	ld	a,#1
 866  02d9 6b03          	ld	(OFST-2,sp),a
 867  02db               L152:
 868                     ; 288 		if (!u8Err) {
 870  02db 0d03          	tnz	(OFST-2,sp)
 871  02dd 2703          	jreq	L65
 872  02df cc03b5        	jp	L142
 873  02e2               L65:
 874                     ; 296 			if(1 == u8Bit)
 876  02e2 7b05          	ld	a,(OFST+0,sp)
 877  02e4 a101          	cp	a,#1
 878  02e6 2618          	jrne	L162
 879                     ; 297 				tIRFSM.u32Recieved32Bits |= ((uint32_t)0x01 << (32-tIRFSM.u8BitsLength));
 881  02e8 ae0001        	ldw	x,#1
 882  02eb bf02          	ldw	c_lreg+2,x
 883  02ed ae0000        	ldw	x,#0
 884  02f0 bf00          	ldw	c_lreg,x
 885  02f2 a620          	ld	a,#32
 886  02f4 c0001a        	sub	a,L3_tIRFSM+6
 887  02f7 cd0000        	call	c_llsh
 889  02fa ae0016        	ldw	x,#L3_tIRFSM+2
 890  02fd cd0000        	call	c_lgor
 892  0300               L162:
 893                     ; 300 			tIRFSM.u32CodeTime = 0;
 895  0300 ae0000        	ldw	x,#0
 896  0303 cf001e        	ldw	L3_tIRFSM+10,x
 897  0306 ae0000        	ldw	x,#0
 898  0309 cf001c        	ldw	L3_tIRFSM+8,x
 899                     ; 303 			tIRFSM.u8BitsLength--;
 901  030c 725a001a      	dec	L3_tIRFSM+6
 902                     ; 306 			if (!tIRFSM.u8BitsLength) {
 904  0310 725d001a      	tnz	L3_tIRFSM+6
 905  0314 2703          	jreq	L06
 906  0316 cc03b5        	jp	L142
 907  0319               L06:
 908                     ; 308 				u8IDData = ((tIRFSM.u32Recieved32Bits >> 24) & 0x000000FF);
 910  0319 c60016        	ld	a,L3_tIRFSM+2
 911  031c 6b05          	ld	(OFST+0,sp),a
 912                     ; 309 				u8IDAntiData = ((tIRFSM.u32Recieved32Bits >> 16) & 0x000000FF);
 914  031e c60017        	ld	a,L3_tIRFSM+3
 915  0321 a4ff          	and	a,#255
 916  0323 6b04          	ld	(OFST-1,sp),a
 917                     ; 310 				u8OperateData = ((tIRFSM.u32Recieved32Bits >> 8) & 0x000000FF);
 919  0325 c60018        	ld	a,L3_tIRFSM+4
 920  0328 a4ff          	and	a,#255
 921  032a 6b01          	ld	(OFST-4,sp),a
 922                     ; 311 				u8OperateAntiData = tIRFSM.u32Recieved32Bits & 0x000000FF;
 924  032c c60019        	ld	a,L3_tIRFSM+5
 925  032f a4ff          	and	a,#255
 926  0331 6b02          	ld	(OFST-3,sp),a
 927                     ; 313 				printf("[IR] code = %x%x%x%x", u8IDData, u8IDAntiData, u8OperateData, u8OperateAntiData);
 929  0333 7b02          	ld	a,(OFST-3,sp)
 930  0335 88            	push	a
 931  0336 7b02          	ld	a,(OFST-3,sp)
 932  0338 88            	push	a
 933  0339 7b06          	ld	a,(OFST+1,sp)
 934  033b 88            	push	a
 935  033c 7b08          	ld	a,(OFST+3,sp)
 936  033e 88            	push	a
 937  033f 35200000      	mov	c_x,#page(L562)
 938  0343 ae0020        	ldw	x,#L562
 939  0346 cd0000        	call	_printf
 941  0349 5b04          	addw	sp,#4
 942                     ; 316 				if ((0xFF != u8IDData + u8IDAntiData) /*|| (0xFF != u8OperateData + u8OperateAntiData)*/) {
 944  034b 7b05          	ld	a,(OFST+0,sp)
 945  034d 5f            	clrw	x
 946  034e 1b04          	add	a,(OFST-1,sp)
 947  0350 2401          	jrnc	L25
 948  0352 5c            	incw	x
 949  0353               L25:
 950  0353 02            	rlwa	x,a
 951  0354 a300ff        	cpw	x,#255
 952  0357 2706          	jreq	L762
 953                     ; 317 					u8Err = 1;
 955  0359 a601          	ld	a,#1
 956  035b 6b03          	ld	(OFST-2,sp),a
 958  035d 2056          	jra	L142
 959  035f               L762:
 960                     ; 322 					if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
 962  035f c60022        	ld	a,L3_tIRFSM+14
 963  0362 a114          	cp	a,#20
 964  0364 2425          	jruge	L372
 965                     ; 324 						tIRFSM.u8Available_Rx++;
 967  0366 725c0022      	inc	L3_tIRFSM+14
 968                     ; 327 						*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = u8IDAntiData;
 970  036a c60020        	ld	a,L3_tIRFSM+12
 971  036d 97            	ld	xl,a
 972  036e 725c0020      	inc	L3_tIRFSM+12
 973  0372 9f            	ld	a,xl
 974  0373 5f            	clrw	x
 975  0374 97            	ld	xl,a
 976  0375 7b04          	ld	a,(OFST-1,sp)
 977  0377 72d70023      	ld	([L3_tIRFSM+15.w],x),a
 978                     ; 330 						tIRFSM.u8RecievedCode = u8IDAntiData;
 980  037b 7b04          	ld	a,(OFST-1,sp)
 981  037d c7001b        	ld	L3_tIRFSM+7,a
 982                     ; 333 						if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
 984  0380 c60020        	ld	a,L3_tIRFSM+12
 985  0383 a114          	cp	a,#20
 986  0385 2504          	jrult	L372
 987                     ; 334 							tIRFSM.u8Write_Rx = 0;
 989  0387 725f0020      	clr	L3_tIRFSM+12
 990  038b               L372:
 991                     ; 339 					tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;
 993  038b 35030014      	mov	L3_tIRFSM,#3
 994                     ; 342 					tIRFSM.fFirstContinue = 1;
 996  038f 72120015      	bset	L3_tIRFSM+1,#1
 997                     ; 345 					tIRFSM.u32CodeTime = 0;
 999  0393 ae0000        	ldw	x,#0
1000  0396 cf001e        	ldw	L3_tIRFSM+10,x
1001  0399 ae0000        	ldw	x,#0
1002  039c cf001c        	ldw	L3_tIRFSM+8,x
1003  039f 2014          	jra	L142
1004  03a1               L571:
1005                     ; 353 	case _IR_RECEIVEDSTATUS_INTERVAL:
1005                     ; 354 			//转入接收连发码之间的间隔状态
1005                     ; 355 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;
1007  03a1 35030014      	mov	L3_tIRFSM,#3
1008                     ; 358 			tIRFSM.u32CodeTime = 0;
1010  03a5 ae0000        	ldw	x,#0
1011  03a8 cf001e        	ldw	L3_tIRFSM+10,x
1012  03ab ae0000        	ldw	x,#0
1013  03ae cf001c        	ldw	L3_tIRFSM+8,x
1014                     ; 361 			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
1016  03b1 35320025      	mov	L3_tIRFSM+17,#50
1017                     ; 363 		break;
1019  03b5               L771:
1020                     ; 411 	default:
1020                     ; 412 		break;
1022  03b5               L142:
1023                     ; 416 	if (u8Err) {
1025  03b5 0d03          	tnz	(OFST-2,sp)
1026  03b7 272c          	jreq	L772
1027                     ; 418 		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1029  03b9 725f0014      	clr	L3_tIRFSM
1030                     ; 421 		tIRFSM.fCodeTimeEn = 0;
1032  03bd 72110015      	bres	L3_tIRFSM+1,#0
1033                     ; 424 		tIRFSM.u32CodeTime = 0;
1035  03c1 ae0000        	ldw	x,#0
1036  03c4 cf001e        	ldw	L3_tIRFSM+10,x
1037  03c7 ae0000        	ldw	x,#0
1038  03ca cf001c        	ldw	L3_tIRFSM+8,x
1039                     ; 427 		tIRFSM.u32Recieved32Bits = 0;
1041  03cd ae0000        	ldw	x,#0
1042  03d0 cf0018        	ldw	L3_tIRFSM+4,x
1043  03d3 ae0000        	ldw	x,#0
1044  03d6 cf0016        	ldw	L3_tIRFSM+2,x
1045                     ; 430 		tIRFSM.u8BitsLength = 0;
1047  03d9 725f001a      	clr	L3_tIRFSM+6
1048                     ; 433 		tIRFSM.u8ReceiveTimeout = 0;
1050  03dd 725f0025      	clr	L3_tIRFSM+17
1051                     ; 436 		TIM3_Cmd(DISABLE);
1053  03e1 4f            	clr	a
1054  03e2 cd0000        	call	_TIM3_Cmd
1056  03e5               L772:
1057                     ; 438 }
1060  03e5 5b05          	addw	sp,#5
1061  03e7 81            	ret
1086                     ; 446 void Isr_IR_Timeout10ms(void) {
1087                     	switch	.text
1088  03e8               _Isr_IR_Timeout10ms:
1092                     ; 449 	if (tIRFSM.u8ReceiveTimeout) {
1094  03e8 725d0025      	tnz	L3_tIRFSM+17
1095  03ec 2716          	jreq	L113
1096                     ; 450 		tIRFSM.u8ReceiveTimeout--;
1098  03ee 725a0025      	dec	L3_tIRFSM+17
1099                     ; 453 		if (0 == tIRFSM.u8ReceiveTimeout) {
1101  03f2 725d0025      	tnz	L3_tIRFSM+17
1102  03f6 260c          	jrne	L113
1103                     ; 455 			TIM3_Cmd(DISABLE);
1105  03f8 4f            	clr	a
1106  03f9 cd0000        	call	_TIM3_Cmd
1108                     ; 458 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1110  03fc 725f0014      	clr	L3_tIRFSM
1111                     ; 461 			tIRFSM.fCodeTimeEn = 0;
1113  0400 72110015      	bres	L3_tIRFSM+1,#0
1114  0404               L113:
1115                     ; 464 }
1118  0404 81            	ret
1143                     	switch	.const
1144  0018               L66:
1145  0018 00004e20      	dc.l	20000
1146  001c               L07:
1147  001c 0001d4c0      	dc.l	120000
1148                     ; 472 void Isr_IR_Timeout100us(void) {
1149                     	switch	.text
1150  0405               _Isr_IR_Timeout100us:
1154                     ; 475 	if (tIRFSM.fCodeTimeEn) {
1156  0405 c60015        	ld	a,L3_tIRFSM+1
1157  0408 a501          	bcp	a,#1
1158  040a 2746          	jreq	L523
1159                     ; 477 		tIRFSM.u32CodeTime += 100;
1161  040c ae001c        	ldw	x,#L3_tIRFSM+8
1162  040f a664          	ld	a,#100
1163  0411 cd0000        	call	c_lgadc
1165                     ; 480 		if (((tIRFSM.u8ReceivedStatus <= _IR_RECEIVEDSTATUS_32BITSDATA)
1165                     ; 481 				&& (tIRFSM.u32CodeTime >= _IR_DATA_LIMITATION_TIME))
1165                     ; 482 				|| ((tIRFSM.u8ReceivedStatus == _IR_RECEIVEDSTATUS_INTERVAL)
1165                     ; 483 						&& (tIRFSM.u32CodeTime >= _IR_INTERVAL_LIMITATION_TIME))) {
1167  0414 c60014        	ld	a,L3_tIRFSM
1168  0417 a103          	cp	a,#3
1169  0419 240e          	jruge	L333
1171  041b ae001c        	ldw	x,#L3_tIRFSM+8
1172  041e cd0000        	call	c_ltor
1174  0421 ae0018        	ldw	x,#L66
1175  0424 cd0000        	call	c_lcmp
1177  0427 2415          	jruge	L133
1178  0429               L333:
1180  0429 c60014        	ld	a,L3_tIRFSM
1181  042c a103          	cp	a,#3
1182  042e 2622          	jrne	L523
1184  0430 ae001c        	ldw	x,#L3_tIRFSM+8
1185  0433 cd0000        	call	c_ltor
1187  0436 ae001c        	ldw	x,#L07
1188  0439 cd0000        	call	c_lcmp
1190  043c 2514          	jrult	L523
1191  043e               L133:
1192                     ; 485 			tIRFSM.fCodeTimeEn = 0;
1194  043e 72110015      	bres	L3_tIRFSM+1,#0
1195                     ; 488 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1197  0442 725f0014      	clr	L3_tIRFSM
1198                     ; 491 			tIRFSM.u32CodeTime = 0;
1200  0446 ae0000        	ldw	x,#0
1201  0449 cf001e        	ldw	L3_tIRFSM+10,x
1202  044c ae0000        	ldw	x,#0
1203  044f cf001c        	ldw	L3_tIRFSM+8,x
1204  0452               L523:
1205                     ; 494 }
1208  0452 81            	ret
1353                     	xref	_printf
1354                     	switch	.bss
1355  0000               L5_IR_Buf:
1356  0000 000000000000  	ds.b	20
1357  0014               L3_tIRFSM:
1358  0014 000000000000  	ds.b	18
1359                     	xref	_COMM_RequestSendCommand
1360                     	xref	_ZeroMem
1361                     	xdef	_ISR_IRReceive
1362                     	xdef	_Isr_IR_Timeout100us
1363                     	xdef	_Isr_IR_Timeout10ms
1364                     	xdef	_IR_Process
1365                     	xdef	_IR_Init
1366                     	xref	_TIM4_ClearFlag
1367                     	xref	_TIM4_ITConfig
1368                     	xref	_TIM4_Cmd
1369                     	xref	_TIM4_TimeBaseInit
1370                     	xref	_TIM3_ClearFlag
1371                     	xref	_TIM3_ITConfig
1372                     	xref	_TIM3_Cmd
1373                     	xref	_TIM3_TimeBaseInit
1374                     	xref	_GPIO_WriteLow
1375                     	xref	_GPIO_WriteHigh
1376                     	xref	_GPIO_Init
1377                     	xref	_EXTI_SetTLISensitivity
1378                     	xref	_EXTI_SetExtIntSensitivity
1379                     	switch	.const
1380  0020               L562:
1381  0020 5b49525d2063  	dc.b	"[IR] code = %x%x%x"
1382  0032 257800        	dc.b	"%x",0
1383  0035               L361:
1384  0035 5b49525d2049  	dc.b	"[IR] IR_CMD_BK_VIE"
1385  0047 570a00        	dc.b	"W",10,0
1386  004a               L161:
1387  004a 5b49525d2049  	dc.b	"[IR] IR_CMD_FR_VIE"
1388  005c 570a00        	dc.b	"W",10,0
1389  005f               L751:
1390  005f 5b49525d2049  	dc.b	"[IR] IR_CMD_RT_VIE"
1391  0071 570a00        	dc.b	"W",10,0
1392  0074               L551:
1393  0074 5b49525d2049  	dc.b	"[IR] IR_CMD_LF_VIE"
1394  0086 570a00        	dc.b	"W",10,0
1395  0089               L351:
1396  0089 5b49525d2049  	dc.b	"[IR] IR_CMD_POWER",10,0
1397  009c               L151:
1398  009c 5b49525d2049  	dc.b	"[IR] IR_CMD_BACK",10,0
1399  00ae               L741:
1400  00ae 5b49525d2049  	dc.b	"[IR] IR_CMD_RIGHT",10,0
1401  00c1               L541:
1402  00c1 5b49525d2049  	dc.b	"[IR] IR_CMD_LEFT",10,0
1403  00d3               L341:
1404  00d3 5b49525d2049  	dc.b	"[IR] IR_CMD_DOWN",10,0
1405  00e5               L141:
1406  00e5 5b49525d2049  	dc.b	"[IR] IR_CMD_UP",10,0
1407  00f5               L731:
1408  00f5 5b49525d2049  	dc.b	"[IR] IR_CMD_OK",10,0
1409                     	xref.b	c_lreg
1410                     	xref.b	c_x
1430                     	xref	c_lgadc
1431                     	xref	c_lgor
1432                     	xref	c_llsh
1433                     	xref	c_lcmp
1434                     	xref	c_ltor
1435                     	end

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
  69  0013 bf23          	ldw	L3_tIRFSM+15,x
  70                     ; 35 	ZeroMem(IR_Buf, _BUFFER_LENGTH_IR_Rx_);
  72  0015 ae0014        	ldw	x,#20
  73  0018 89            	pushw	x
  74  0019 ae0000        	ldw	x,#0
  75  001c 89            	pushw	x
  76  001d ae0000        	ldw	x,#L5_IR_Buf
  77  0020 cd0000        	call	_ZeroMem
  79  0023 5b04          	addw	sp,#4
  80                     ; 37 	IR_GPIO_Init();
  82  0025 ad05          	call	L7_IR_GPIO_Init
  84                     ; 39 	TIM3_Config_10ms();
  86  0027 ad27          	call	L11_TIM3_Config_10ms
  88                     ; 40 	TIM4_Config_100us();
  90  0029 ad43          	call	L31_TIM4_Config_100us
  92                     ; 41 }
  95  002b 81            	ret
 121                     ; 47 void IR_GPIO_Init() {
 122                     	switch	.text
 123  002c               L7_IR_GPIO_Init:
 127                     ; 50 	GPIO_Init(GPIO_IR_PORT, GPIO_IR_PIN, GPIO_MODE_IN_FL_IT);
 129  002c 4b20          	push	#32
 130  002e 4b20          	push	#32
 131  0030 ae5014        	ldw	x,#20500
 132  0033 cd0000        	call	_GPIO_Init
 134  0036 85            	popw	x
 135                     ; 53 	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOE, EXTI_SENSITIVITY_FALL_ONLY);
 137  0037 ae0002        	ldw	x,#2
 138  003a a604          	ld	a,#4
 139  003c 95            	ld	xh,a
 140  003d cd0000        	call	_EXTI_SetExtIntSensitivity
 142                     ; 54 	EXTI_SetTLISensitivity(EXTI_TLISENSITIVITY_FALL_ONLY);
 144  0040 4f            	clr	a
 145  0041 cd0000        	call	_EXTI_SetTLISensitivity
 147                     ; 57 	GPIO_Init(GPIOE, GPIO_PIN_6, GPIO_MODE_OUT_PP_HIGH_FAST);
 149  0044 4bf0          	push	#240
 150  0046 4b40          	push	#64
 151  0048 ae5014        	ldw	x,#20500
 152  004b cd0000        	call	_GPIO_Init
 154  004e 85            	popw	x
 155                     ; 58 }
 158  004f 81            	ret
 185                     ; 65 void TIM3_Config_10ms(void)
 185                     ; 66 {
 186                     	switch	.text
 187  0050               L11_TIM3_Config_10ms:
 191                     ; 87   TIM3_TimeBaseInit(TIM3_PRESCALER_1024, TIM3_PERIOD);
 193  0050 ae009f        	ldw	x,#159
 194  0053 89            	pushw	x
 195  0054 a60a          	ld	a,#10
 196  0056 cd0000        	call	_TIM3_TimeBaseInit
 198  0059 85            	popw	x
 199                     ; 89   TIM3_ClearFlag(TIM3_FLAG_UPDATE);
 201  005a ae0001        	ldw	x,#1
 202  005d cd0000        	call	_TIM3_ClearFlag
 204                     ; 91   TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
 206  0060 ae0001        	ldw	x,#1
 207  0063 a601          	ld	a,#1
 208  0065 95            	ld	xh,a
 209  0066 cd0000        	call	_TIM3_ITConfig
 211                     ; 94   TIM3_Cmd(DISABLE);
 213  0069 4f            	clr	a
 214  006a cd0000        	call	_TIM3_Cmd
 216                     ; 97 }
 219  006d 81            	ret
 246                     ; 104 static void TIM4_Config_100us(void)
 246                     ; 105 {
 247                     	switch	.text
 248  006e               L31_TIM4_Config_100us:
 252                     ; 116   TIM4_TimeBaseInit(TIM4_PRESCALER_16, TIM4_PERIOD);
 254  006e ae0063        	ldw	x,#99
 255  0071 a604          	ld	a,#4
 256  0073 95            	ld	xh,a
 257  0074 cd0000        	call	_TIM4_TimeBaseInit
 259                     ; 118   TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 261  0077 a601          	ld	a,#1
 262  0079 cd0000        	call	_TIM4_ClearFlag
 264                     ; 120   TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 266  007c ae0001        	ldw	x,#1
 267  007f a601          	ld	a,#1
 268  0081 95            	ld	xh,a
 269  0082 cd0000        	call	_TIM4_ITConfig
 271                     ; 123   TIM4_Cmd(ENABLE);
 273  0085 a601          	ld	a,#1
 274  0087 cd0000        	call	_TIM4_Cmd
 276                     ; 124 }
 279  008a 81            	ret
 316                     ; 134 void IR_Process() {
 317                     	switch	.text
 318  008b               _IR_Process:
 320  008b 88            	push	a
 321       00000001      OFST:	set	1
 324                     ; 135 	u8 u8IRData = 0;
 326                     ; 138 	if (tIRFSM.u8Available_Rx) {
 328  008c 3d22          	tnz	L3_tIRFSM+14
 329  008e 2603          	jrne	L61
 330  0090 cc01d5        	jp	L131
 331  0093               L61:
 332                     ; 140 		u8IRData = *(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Read_Rx++);
 334  0093 b621          	ld	a,L3_tIRFSM+13
 335  0095 97            	ld	xl,a
 336  0096 3c21          	inc	L3_tIRFSM+13
 337  0098 9f            	ld	a,xl
 338  0099 5f            	clrw	x
 339  009a 97            	ld	xl,a
 340  009b 92d623        	ld	a,([L3_tIRFSM+15.w],x)
 341  009e 6b01          	ld	(OFST+0,sp),a
 342                     ; 143 		if (tIRFSM.u8Read_Rx >= _BUFFER_LENGTH_IR_Rx_) {
 344  00a0 b621          	ld	a,L3_tIRFSM+13
 345  00a2 a114          	cp	a,#20
 346  00a4 2502          	jrult	L331
 347                     ; 144 			tIRFSM.u8Read_Rx = 0;
 349  00a6 3f21          	clr	L3_tIRFSM+13
 350  00a8               L331:
 351                     ; 148 		--tIRFSM.u8Available_Rx;
 353  00a8 3a22          	dec	L3_tIRFSM+14
 354                     ; 151 		switch (u8IRData) {
 356  00aa 7b01          	ld	a,(OFST+0,sp)
 358                     ; 196 		default:
 358                     ; 197 			break;
 359  00ac 4d            	tnz	a
 360  00ad 2739          	jreq	L36
 361  00af a002          	sub	a,#2
 362  00b1 2603          	jrne	L02
 363  00b3 cc016e        	jp	L77
 364  00b6               L02:
 365  00b6 a003          	sub	a,#3
 366  00b8 275c          	jreq	L76
 367  00ba 4a            	dec	a
 368  00bb 2742          	jreq	L56
 369  00bd a002          	sub	a,#2
 370  00bf 2603          	jrne	L22
 371  00c1 cc0159        	jp	L57
 372  00c4               L22:
 373  00c4 4a            	dec	a
 374  00c5 2603          	jrne	L42
 375  00c7 cc01ad        	jp	L501
 376  00ca               L42:
 377  00ca 4a            	dec	a
 378  00cb 2603          	jrne	L62
 379  00cd cc01c2        	jp	L701
 380  00d0               L62:
 381  00d0 a003          	sub	a,#3
 382  00d2 2759          	jreq	L17
 383  00d4 4a            	dec	a
 384  00d5 276d          	jreq	L37
 385  00d7 a00f          	sub	a,#15
 386  00d9 2603          	jrne	L03
 387  00db cc0198        	jp	L301
 388  00de               L03:
 389  00de 4a            	dec	a
 390  00df 2603          	jrne	L23
 391  00e1 cc0183        	jp	L101
 392  00e4               L23:
 393  00e4 acd501d5      	jpf	L131
 394  00e8               L36:
 395                     ; 152 		case	IR_CMD_OK: 			//0x0b	确认
 395                     ; 153 			COMM_RequestSendCommand(MENU_OK, KEY_ACTIVED);
 397  00e8 ae0001        	ldw	x,#1
 398  00eb a60a          	ld	a,#10
 399  00ed 95            	ld	xh,a
 400  00ee cd0000        	call	_COMM_RequestSendCommand
 402                     ; 154 			printf("[IR] IR_CMD_OK\n");
 404  00f1 35f50000      	mov	c_x,#page(L141)
 405  00f5 ae00f5        	ldw	x,#L141
 406  00f8 cd0000        	call	_printf
 408                     ; 155 			break;
 410  00fb acd501d5      	jpf	L131
 411  00ff               L56:
 412                     ; 156 		case	IR_CMD_UP: 			//0x06	上
 412                     ; 157 			COMM_RequestSendCommand(MENU_UP, KEY_ACTIVED);
 414  00ff ae0001        	ldw	x,#1
 415  0102 a608          	ld	a,#8
 416  0104 95            	ld	xh,a
 417  0105 cd0000        	call	_COMM_RequestSendCommand
 419                     ; 158 			printf("[IR] IR_CMD_UP\n");
 421  0108 35e50000      	mov	c_x,#page(L341)
 422  010c ae00e5        	ldw	x,#L341
 423  010f cd0000        	call	_printf
 425                     ; 159 			break;
 427  0112 acd501d5      	jpf	L131
 428  0116               L76:
 429                     ; 160 		case	IR_CMD_DOWN: 		//0x05	下
 429                     ; 161 			COMM_RequestSendCommand(MENU_DOWN, KEY_ACTIVED);
 431  0116 ae0001        	ldw	x,#1
 432  0119 a609          	ld	a,#9
 433  011b 95            	ld	xh,a
 434  011c cd0000        	call	_COMM_RequestSendCommand
 436                     ; 162 			printf("[IR] IR_CMD_DOWN\n");
 438  011f 35d30000      	mov	c_x,#page(L541)
 439  0123 ae00d3        	ldw	x,#L541
 440  0126 cd0000        	call	_printf
 442                     ; 163 			break;
 444  0129 acd501d5      	jpf	L131
 445  012d               L17:
 446                     ; 164 		case	IR_CMD_LEFT: 		//0x0d	左
 446                     ; 165 			COMM_RequestSendCommand(MENU_LEFT, KEY_ACTIVED);
 448  012d ae0001        	ldw	x,#1
 449  0130 a606          	ld	a,#6
 450  0132 95            	ld	xh,a
 451  0133 cd0000        	call	_COMM_RequestSendCommand
 453                     ; 166 			printf("[IR] IR_CMD_LEFT\n");
 455  0136 35c10000      	mov	c_x,#page(L741)
 456  013a ae00c1        	ldw	x,#L741
 457  013d cd0000        	call	_printf
 459                     ; 167 			break;
 461  0140 acd501d5      	jpf	L131
 462  0144               L37:
 463                     ; 168 		case	IR_CMD_RIGHT: 		//0x0e	右
 463                     ; 169 			COMM_RequestSendCommand(MENU_RIGHT, KEY_ACTIVED);
 465  0144 ae0001        	ldw	x,#1
 466  0147 a607          	ld	a,#7
 467  0149 95            	ld	xh,a
 468  014a cd0000        	call	_COMM_RequestSendCommand
 470                     ; 170 			printf("[IR] IR_CMD_RIGHT\n");
 472  014d 35ae0000      	mov	c_x,#page(L151)
 473  0151 ae00ae        	ldw	x,#L151
 474  0154 cd0000        	call	_printf
 476                     ; 171 			break;
 478  0157 207c          	jra	L131
 479  0159               L57:
 480                     ; 172 		case	IR_CMD_BACK: 		//0x08	返回
 480                     ; 173 			COMM_RequestSendCommand(MENU_BACK, KEY_ACTIVED);			
 482  0159 ae0001        	ldw	x,#1
 483  015c a605          	ld	a,#5
 484  015e 95            	ld	xh,a
 485  015f cd0000        	call	_COMM_RequestSendCommand
 487                     ; 174 			printf("[IR] IR_CMD_BACK\n");
 489  0162 359c0000      	mov	c_x,#page(L351)
 490  0166 ae009c        	ldw	x,#L351
 491  0169 cd0000        	call	_printf
 493                     ; 175 			break;
 495  016c 2067          	jra	L131
 496  016e               L77:
 497                     ; 176 		case	IR_CMD_POWER: 		//0x02	电源
 497                     ; 177 			COMM_RequestSendCommand(MENU_POWER, KEY_ACTIVED);			
 499  016e ae0001        	ldw	x,#1
 500  0171 a60b          	ld	a,#11
 501  0173 95            	ld	xh,a
 502  0174 cd0000        	call	_COMM_RequestSendCommand
 504                     ; 178 			printf("[IR] IR_CMD_POWER\n");
 506  0177 35890000      	mov	c_x,#page(L551)
 507  017b ae0089        	ldw	x,#L551
 508  017e cd0000        	call	_printf
 510                     ; 179 			break;
 512  0181 2052          	jra	L131
 513  0183               L101:
 514                     ; 180 		case	IR_CMD_LF_VIEW: 	//0x1e	（左视）AV1
 514                     ; 181 			COMM_RequestSendCommand(KEY_LEFT, KEY_ACTIVED);	
 516  0183 ae0001        	ldw	x,#1
 517  0186 a602          	ld	a,#2
 518  0188 95            	ld	xh,a
 519  0189 cd0000        	call	_COMM_RequestSendCommand
 521                     ; 182 			printf("[IR] IR_CMD_LF_VIEW\n");
 523  018c 35740000      	mov	c_x,#page(L751)
 524  0190 ae0074        	ldw	x,#L751
 525  0193 cd0000        	call	_printf
 527                     ; 183 			break;
 529  0196 203d          	jra	L131
 530  0198               L301:
 531                     ; 184 		case	IR_CMD_RT_VIEW: 	//0x1d	（右视）AV2
 531                     ; 185 			COMM_RequestSendCommand(KEY_RIGHT, KEY_ACTIVED);
 533  0198 ae0001        	ldw	x,#1
 534  019b a603          	ld	a,#3
 535  019d 95            	ld	xh,a
 536  019e cd0000        	call	_COMM_RequestSendCommand
 538                     ; 186 			printf("[IR] IR_CMD_RT_VIEW\n");
 540  01a1 355f0000      	mov	c_x,#page(L161)
 541  01a5 ae005f        	ldw	x,#L161
 542  01a8 cd0000        	call	_printf
 544                     ; 187 			break;
 546  01ab 2028          	jra	L131
 547  01ad               L501:
 548                     ; 188 		case	IR_CMD_FR_VIEW: //	0x09	（前视）AV3
 548                     ; 189 			COMM_RequestSendCommand(KEY_FRONT, KEY_ACTIVED);
 550  01ad ae0001        	ldw	x,#1
 551  01b0 a601          	ld	a,#1
 552  01b2 95            	ld	xh,a
 553  01b3 cd0000        	call	_COMM_RequestSendCommand
 555                     ; 190 			printf("[IR] IR_CMD_FR_VIEW\n");
 557  01b6 354a0000      	mov	c_x,#page(L361)
 558  01ba ae004a        	ldw	x,#L361
 559  01bd cd0000        	call	_printf
 561                     ; 191 			break;
 563  01c0 2013          	jra	L131
 564  01c2               L701:
 565                     ; 192 		case IR_CMD_BK_VIEW://	0x0a	（后视）AV4
 565                     ; 193 			COMM_RequestSendCommand(KEY_REAR, KEY_ACTIVED);
 567  01c2 ae0001        	ldw	x,#1
 568  01c5 a604          	ld	a,#4
 569  01c7 95            	ld	xh,a
 570  01c8 cd0000        	call	_COMM_RequestSendCommand
 572                     ; 194 			printf("[IR] IR_CMD_BK_VIEW\n");
 574  01cb 35350000      	mov	c_x,#page(L561)
 575  01cf ae0035        	ldw	x,#L561
 576  01d2 cd0000        	call	_printf
 578                     ; 195 			break;
 580  01d5               L111:
 581                     ; 196 		default:
 581                     ; 197 			break;
 583  01d5               L731:
 584  01d5               L131:
 585                     ; 200 }
 588  01d5 84            	pop	a
 589  01d6 81            	ret
 592                     	bsct
 593  0000               L761_a:
 594  0000 0000          	dc.w	0
 685                     .const:	section	.text
 686  0000               L63:
 687  0000 00003390      	dc.l	13200
 688  0004               L04:
 689  0004 000035e9      	dc.l	13801
 690  0008               L24:
 691  0008 00000334      	dc.l	820
 692  000c               L44:
 693  000c 0000058d      	dc.l	1421
 694  0010               L64:
 695  0010 00000794      	dc.l	1940
 696  0014               L05:
 697  0014 000009ed      	dc.l	2541
 698                     ; 208 void ISR_IRReceive(void) {
 699                     	switch	.text
 700  01d7               _ISR_IRReceive:
 702  01d7 5205          	subw	sp,#5
 703       00000005      OFST:	set	5
 706                     ; 209 	u8 u8Err = 0;						//接收是否出错？
 708  01d9 0f03          	clr	(OFST-2,sp)
 709                     ; 215 	if(a == 0) {
 711  01db be00          	ldw	x,L761_a
 712  01dd 2610          	jrne	L152
 713                     ; 216 		LED_ON();
 715  01df 4b40          	push	#64
 716  01e1 ae5014        	ldw	x,#20500
 717  01e4 cd0000        	call	_GPIO_WriteLow
 719  01e7 84            	pop	a
 720                     ; 217 		a = 1;
 722  01e8 ae0001        	ldw	x,#1
 723  01eb bf00          	ldw	L761_a,x
 725  01ed 2013          	jra	L352
 726  01ef               L152:
 727                     ; 218 	}else if(a == 1) {
 729  01ef be00          	ldw	x,L761_a
 730  01f1 a30001        	cpw	x,#1
 731  01f4 260c          	jrne	L352
 732                     ; 219 		LED_OFF();
 734  01f6 4b40          	push	#64
 735  01f8 ae5014        	ldw	x,#20500
 736  01fb cd0000        	call	_GPIO_WriteHigh
 738  01fe 84            	pop	a
 739                     ; 220 		a = 0;
 741  01ff 5f            	clrw	x
 742  0200 bf00          	ldw	L761_a,x
 743  0202               L352:
 744                     ; 224 	switch (tIRFSM.u8ReceivedStatus) {
 746  0202 b614          	ld	a,L3_tIRFSM
 748                     ; 411 	default:
 748                     ; 412 		break;
 749  0204 4d            	tnz	a
 750  0205 2710          	jreq	L171
 751  0207 4a            	dec	a
 752  0208 272e          	jreq	L371
 753  020a 4a            	dec	a
 754  020b 276f          	jreq	L571
 755  020d 4a            	dec	a
 756  020e 2603          	jrne	L45
 757  0210 cc036d        	jp	L771
 758  0213               L45:
 759  0213 ac7f037f      	jpf	L162
 760  0217               L171:
 761                     ; 226 	case _IR_RECEIVEDSTATUS_IDLE:
 761                     ; 227 		//转入接收启动码状态
 761                     ; 228 		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_START;
 763  0217 35010014      	mov	L3_tIRFSM,#1
 764                     ; 231 		tIRFSM.fCodeTimeEn = 1;
 766  021b 72100015      	bset	L3_tIRFSM+1,#0
 767                     ; 234 		tIRFSM.u32CodeTime = 0;
 769  021f ae0000        	ldw	x,#0
 770  0222 bf1e          	ldw	L3_tIRFSM+10,x
 771  0224 ae0000        	ldw	x,#0
 772  0227 bf1c          	ldw	L3_tIRFSM+8,x
 773                     ; 237 		tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
 775  0229 35320025      	mov	L3_tIRFSM+17,#50
 776                     ; 240 		tIRFSM.u8RecievedCode = 0;
 778  022d 3f1b          	clr	L3_tIRFSM+7
 779                     ; 243 		TIM3_Cmd(ENABLE);
 781  022f a601          	ld	a,#1
 782  0231 cd0000        	call	_TIM3_Cmd
 784                     ; 244 		break;
 786  0234 ac7f037f      	jpf	L162
 787  0238               L371:
 788                     ; 247 	case _IR_RECEIVEDSTATUS_START:
 788                     ; 248 		//上次接收到的是启动码
 788                     ; 249 		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_START - _IR_CODE_TIME_BIAS)
 788                     ; 250 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_START + _IR_CODE_TIME_BIAS)) {
 790  0238 ae001c        	ldw	x,#L3_tIRFSM+8
 791  023b cd0000        	call	c_ltor
 793  023e ae0000        	ldw	x,#L63
 794  0241 cd0000        	call	c_lcmp
 796  0244 252e          	jrult	L362
 798  0246 ae001c        	ldw	x,#L3_tIRFSM+8
 799  0249 cd0000        	call	c_ltor
 801  024c ae0004        	ldw	x,#L04
 802  024f cd0000        	call	c_lcmp
 804  0252 2420          	jruge	L362
 805                     ; 252 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_32BITSDATA;
 807  0254 35020014      	mov	L3_tIRFSM,#2
 808                     ; 255 			tIRFSM.u32CodeTime = 0;
 810  0258 ae0000        	ldw	x,#0
 811  025b bf1e          	ldw	L3_tIRFSM+10,x
 812  025d ae0000        	ldw	x,#0
 813  0260 bf1c          	ldw	L3_tIRFSM+8,x
 814                     ; 258 			tIRFSM.u8BitsLength = 32;
 816  0262 3520001a      	mov	L3_tIRFSM+6,#32
 817                     ; 261 			tIRFSM.u32Recieved32Bits = 0;
 819  0266 ae0000        	ldw	x,#0
 820  0269 bf18          	ldw	L3_tIRFSM+4,x
 821  026b ae0000        	ldw	x,#0
 822  026e bf16          	ldw	L3_tIRFSM+2,x
 824  0270 ac7f037f      	jpf	L162
 825  0274               L362:
 826                     ; 265 			u8Err = 1;
 828  0274 a601          	ld	a,#1
 829  0276 6b03          	ld	(OFST-2,sp),a
 830  0278 ac7f037f      	jpf	L162
 831  027c               L571:
 832                     ; 272 	case _IR_RECEIVEDSTATUS_32BITSDATA:
 832                     ; 273 		//收到“0”
 832                     ; 274 		if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_0 - _IR_CODE_TIME_BIAS)
 832                     ; 275 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_0 + _IR_CODE_TIME_BIAS)) {
 834  027c ae001c        	ldw	x,#L3_tIRFSM+8
 835  027f cd0000        	call	c_ltor
 837  0282 ae0008        	ldw	x,#L24
 838  0285 cd0000        	call	c_lcmp
 840  0288 2512          	jrult	L762
 842  028a ae001c        	ldw	x,#L3_tIRFSM+8
 843  028d cd0000        	call	c_ltor
 845  0290 ae000c        	ldw	x,#L44
 846  0293 cd0000        	call	c_lcmp
 848  0296 2404          	jruge	L762
 849                     ; 276 			u8Bit = 0;
 851  0298 0f05          	clr	(OFST+0,sp)
 853  029a 2026          	jra	L172
 854  029c               L762:
 855                     ; 279 		else if ((tIRFSM.u32CodeTime >= _IR_CODE_TIME_1 - _IR_CODE_TIME_BIAS)
 855                     ; 280 				&& (tIRFSM.u32CodeTime <= _IR_CODE_TIME_1 + _IR_CODE_TIME_BIAS)) {
 857  029c ae001c        	ldw	x,#L3_tIRFSM+8
 858  029f cd0000        	call	c_ltor
 860  02a2 ae0010        	ldw	x,#L64
 861  02a5 cd0000        	call	c_lcmp
 863  02a8 2514          	jrult	L372
 865  02aa ae001c        	ldw	x,#L3_tIRFSM+8
 866  02ad cd0000        	call	c_ltor
 868  02b0 ae0014        	ldw	x,#L05
 869  02b3 cd0000        	call	c_lcmp
 871  02b6 2406          	jruge	L372
 872                     ; 281 			u8Bit = 1;
 874  02b8 a601          	ld	a,#1
 875  02ba 6b05          	ld	(OFST+0,sp),a
 877  02bc 2004          	jra	L172
 878  02be               L372:
 879                     ; 285 			u8Err = 1;
 881  02be a601          	ld	a,#1
 882  02c0 6b03          	ld	(OFST-2,sp),a
 883  02c2               L172:
 884                     ; 288 		if (!u8Err) {
 886  02c2 0d03          	tnz	(OFST-2,sp)
 887  02c4 2703          	jreq	L65
 888  02c6 cc037f        	jp	L162
 889  02c9               L65:
 890                     ; 296 			if(1 == u8Bit)
 892  02c9 7b05          	ld	a,(OFST+0,sp)
 893  02cb a101          	cp	a,#1
 894  02cd 2617          	jrne	L103
 895                     ; 297 				tIRFSM.u32Recieved32Bits |= ((uint32_t)0x01 << (32-tIRFSM.u8BitsLength));
 897  02cf ae0001        	ldw	x,#1
 898  02d2 bf02          	ldw	c_lreg+2,x
 899  02d4 ae0000        	ldw	x,#0
 900  02d7 bf00          	ldw	c_lreg,x
 901  02d9 a620          	ld	a,#32
 902  02db b01a          	sub	a,L3_tIRFSM+6
 903  02dd cd0000        	call	c_llsh
 905  02e0 ae0016        	ldw	x,#L3_tIRFSM+2
 906  02e3 cd0000        	call	c_lgor
 908  02e6               L103:
 909                     ; 300 			tIRFSM.u32CodeTime = 0;
 911  02e6 ae0000        	ldw	x,#0
 912  02e9 bf1e          	ldw	L3_tIRFSM+10,x
 913  02eb ae0000        	ldw	x,#0
 914  02ee bf1c          	ldw	L3_tIRFSM+8,x
 915                     ; 303 			tIRFSM.u8BitsLength--;
 917  02f0 3a1a          	dec	L3_tIRFSM+6
 918                     ; 306 			if (!tIRFSM.u8BitsLength) {
 920  02f2 3d1a          	tnz	L3_tIRFSM+6
 921  02f4 26d0          	jrne	L162
 922                     ; 308 				u8IDData = ((tIRFSM.u32Recieved32Bits >> 24) & 0x000000FF);
 924  02f6 b616          	ld	a,L3_tIRFSM+2
 925  02f8 6b05          	ld	(OFST+0,sp),a
 926                     ; 309 				u8IDAntiData = ((tIRFSM.u32Recieved32Bits >> 16) & 0x000000FF);
 928  02fa b617          	ld	a,L3_tIRFSM+3
 929  02fc a4ff          	and	a,#255
 930  02fe 6b04          	ld	(OFST-1,sp),a
 931                     ; 310 				u8OperateData = ((tIRFSM.u32Recieved32Bits >> 8) & 0x000000FF);
 933  0300 b618          	ld	a,L3_tIRFSM+4
 934  0302 a4ff          	and	a,#255
 935  0304 6b01          	ld	(OFST-4,sp),a
 936                     ; 311 				u8OperateAntiData = tIRFSM.u32Recieved32Bits & 0x000000FF;
 938  0306 b619          	ld	a,L3_tIRFSM+5
 939  0308 a4ff          	and	a,#255
 940  030a 6b02          	ld	(OFST-3,sp),a
 941                     ; 313 				printf("[IR] code = %x%x%x%x", u8IDData, u8IDAntiData, u8OperateData, u8OperateAntiData);
 943  030c 7b02          	ld	a,(OFST-3,sp)
 944  030e 88            	push	a
 945  030f 7b02          	ld	a,(OFST-3,sp)
 946  0311 88            	push	a
 947  0312 7b06          	ld	a,(OFST+1,sp)
 948  0314 88            	push	a
 949  0315 7b08          	ld	a,(OFST+3,sp)
 950  0317 88            	push	a
 951  0318 35200000      	mov	c_x,#page(L503)
 952  031c ae0020        	ldw	x,#L503
 953  031f cd0000        	call	_printf
 955  0322 5b04          	addw	sp,#4
 956                     ; 316 				if ((0xFF != u8IDData + u8IDAntiData) /*|| (0xFF != u8OperateData + u8OperateAntiData)*/) {
 958  0324 7b05          	ld	a,(OFST+0,sp)
 959  0326 5f            	clrw	x
 960  0327 1b04          	add	a,(OFST-1,sp)
 961  0329 2401          	jrnc	L25
 962  032b 5c            	incw	x
 963  032c               L25:
 964  032c 02            	rlwa	x,a
 965  032d a300ff        	cpw	x,#255
 966  0330 2706          	jreq	L703
 967                     ; 317 					u8Err = 1;
 969  0332 a601          	ld	a,#1
 970  0334 6b03          	ld	(OFST-2,sp),a
 972  0336 2047          	jra	L162
 973  0338               L703:
 974                     ; 322 					if (tIRFSM.u8Available_Rx < _BUFFER_LENGTH_IR_Rx_) {
 976  0338 b622          	ld	a,L3_tIRFSM+14
 977  033a a114          	cp	a,#20
 978  033c 241b          	jruge	L313
 979                     ; 324 						tIRFSM.u8Available_Rx++;
 981  033e 3c22          	inc	L3_tIRFSM+14
 982                     ; 327 						*(tIRFSM.pu8Buffer_Rx + tIRFSM.u8Write_Rx++) = u8IDAntiData;
 984  0340 b620          	ld	a,L3_tIRFSM+12
 985  0342 97            	ld	xl,a
 986  0343 3c20          	inc	L3_tIRFSM+12
 987  0345 9f            	ld	a,xl
 988  0346 5f            	clrw	x
 989  0347 97            	ld	xl,a
 990  0348 7b04          	ld	a,(OFST-1,sp)
 991  034a 92d723        	ld	([L3_tIRFSM+15.w],x),a
 992                     ; 330 						tIRFSM.u8RecievedCode = u8IDAntiData;
 994  034d 7b04          	ld	a,(OFST-1,sp)
 995  034f b71b          	ld	L3_tIRFSM+7,a
 996                     ; 333 						if (tIRFSM.u8Write_Rx >= _BUFFER_LENGTH_IR_Rx_) {
 998  0351 b620          	ld	a,L3_tIRFSM+12
 999  0353 a114          	cp	a,#20
1000  0355 2502          	jrult	L313
1001                     ; 334 							tIRFSM.u8Write_Rx = 0;
1003  0357 3f20          	clr	L3_tIRFSM+12
1004  0359               L313:
1005                     ; 339 					tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;
1007  0359 35030014      	mov	L3_tIRFSM,#3
1008                     ; 342 					tIRFSM.fFirstContinue = 1;
1010  035d 72120015      	bset	L3_tIRFSM+1,#1
1011                     ; 345 					tIRFSM.u32CodeTime = 0;
1013  0361 ae0000        	ldw	x,#0
1014  0364 bf1e          	ldw	L3_tIRFSM+10,x
1015  0366 ae0000        	ldw	x,#0
1016  0369 bf1c          	ldw	L3_tIRFSM+8,x
1017  036b 2012          	jra	L162
1018  036d               L771:
1019                     ; 353 	case _IR_RECEIVEDSTATUS_INTERVAL:
1019                     ; 354 			//转入接收连发码之间的间隔状态
1019                     ; 355 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_INTERVAL;
1021  036d 35030014      	mov	L3_tIRFSM,#3
1022                     ; 358 			tIRFSM.u32CodeTime = 0;
1024  0371 ae0000        	ldw	x,#0
1025  0374 bf1e          	ldw	L3_tIRFSM+10,x
1026  0376 ae0000        	ldw	x,#0
1027  0379 bf1c          	ldw	L3_tIRFSM+8,x
1028                     ; 361 			tIRFSM.u8ReceiveTimeout = _IR_RECEIVE_TIMEOUT_;
1030  037b 35320025      	mov	L3_tIRFSM+17,#50
1031                     ; 363 		break;
1033  037f               L102:
1034                     ; 411 	default:
1034                     ; 412 		break;
1036  037f               L162:
1037                     ; 416 	if (u8Err) {
1039  037f 0d03          	tnz	(OFST-2,sp)
1040  0381 2722          	jreq	L713
1041                     ; 418 		tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1043  0383 3f14          	clr	L3_tIRFSM
1044                     ; 421 		tIRFSM.fCodeTimeEn = 0;
1046  0385 72110015      	bres	L3_tIRFSM+1,#0
1047                     ; 424 		tIRFSM.u32CodeTime = 0;
1049  0389 ae0000        	ldw	x,#0
1050  038c bf1e          	ldw	L3_tIRFSM+10,x
1051  038e ae0000        	ldw	x,#0
1052  0391 bf1c          	ldw	L3_tIRFSM+8,x
1053                     ; 427 		tIRFSM.u32Recieved32Bits = 0;
1055  0393 ae0000        	ldw	x,#0
1056  0396 bf18          	ldw	L3_tIRFSM+4,x
1057  0398 ae0000        	ldw	x,#0
1058  039b bf16          	ldw	L3_tIRFSM+2,x
1059                     ; 430 		tIRFSM.u8BitsLength = 0;
1061  039d 3f1a          	clr	L3_tIRFSM+6
1062                     ; 433 		tIRFSM.u8ReceiveTimeout = 0;
1064  039f 3f25          	clr	L3_tIRFSM+17
1065                     ; 436 		TIM3_Cmd(DISABLE);
1067  03a1 4f            	clr	a
1068  03a2 cd0000        	call	_TIM3_Cmd
1070  03a5               L713:
1071                     ; 438 }
1074  03a5 5b05          	addw	sp,#5
1075  03a7 81            	ret
1100                     ; 446 void Isr_IR_Timeout10ms(void) {
1101                     	switch	.text
1102  03a8               _Isr_IR_Timeout10ms:
1106                     ; 449 	if (tIRFSM.u8ReceiveTimeout) {
1108  03a8 3d25          	tnz	L3_tIRFSM+17
1109  03aa 2710          	jreq	L133
1110                     ; 450 		tIRFSM.u8ReceiveTimeout--;
1112  03ac 3a25          	dec	L3_tIRFSM+17
1113                     ; 453 		if (0 == tIRFSM.u8ReceiveTimeout) {
1115  03ae 3d25          	tnz	L3_tIRFSM+17
1116  03b0 260a          	jrne	L133
1117                     ; 455 			TIM3_Cmd(DISABLE);
1119  03b2 4f            	clr	a
1120  03b3 cd0000        	call	_TIM3_Cmd
1122                     ; 458 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1124  03b6 3f14          	clr	L3_tIRFSM
1125                     ; 461 			tIRFSM.fCodeTimeEn = 0;
1127  03b8 72110015      	bres	L3_tIRFSM+1,#0
1128  03bc               L133:
1129                     ; 464 }
1132  03bc 81            	ret
1157                     	switch	.const
1158  0018               L46:
1159  0018 00004e20      	dc.l	20000
1160  001c               L66:
1161  001c 0001d4c0      	dc.l	120000
1162                     ; 472 void Isr_IR_Timeout100us(void) {
1163                     	switch	.text
1164  03bd               _Isr_IR_Timeout100us:
1168                     ; 475 	if (tIRFSM.fCodeTimeEn) {
1170  03bd b615          	ld	a,L3_tIRFSM+1
1171  03bf a501          	bcp	a,#1
1172  03c1 2740          	jreq	L543
1173                     ; 477 		tIRFSM.u32CodeTime += 100;
1175  03c3 ae001c        	ldw	x,#L3_tIRFSM+8
1176  03c6 a664          	ld	a,#100
1177  03c8 cd0000        	call	c_lgadc
1179                     ; 480 		if (((tIRFSM.u8ReceivedStatus <= _IR_RECEIVEDSTATUS_32BITSDATA)
1179                     ; 481 				&& (tIRFSM.u32CodeTime >= _IR_DATA_LIMITATION_TIME))
1179                     ; 482 				|| ((tIRFSM.u8ReceivedStatus == _IR_RECEIVEDSTATUS_INTERVAL)
1179                     ; 483 						&& (tIRFSM.u32CodeTime >= _IR_INTERVAL_LIMITATION_TIME))) {
1181  03cb b614          	ld	a,L3_tIRFSM
1182  03cd a103          	cp	a,#3
1183  03cf 240e          	jruge	L353
1185  03d1 ae001c        	ldw	x,#L3_tIRFSM+8
1186  03d4 cd0000        	call	c_ltor
1188  03d7 ae0018        	ldw	x,#L46
1189  03da cd0000        	call	c_lcmp
1191  03dd 2414          	jruge	L153
1192  03df               L353:
1194  03df b614          	ld	a,L3_tIRFSM
1195  03e1 a103          	cp	a,#3
1196  03e3 261e          	jrne	L543
1198  03e5 ae001c        	ldw	x,#L3_tIRFSM+8
1199  03e8 cd0000        	call	c_ltor
1201  03eb ae001c        	ldw	x,#L66
1202  03ee cd0000        	call	c_lcmp
1204  03f1 2510          	jrult	L543
1205  03f3               L153:
1206                     ; 485 			tIRFSM.fCodeTimeEn = 0;
1208  03f3 72110015      	bres	L3_tIRFSM+1,#0
1209                     ; 488 			tIRFSM.u8ReceivedStatus = _IR_RECEIVEDSTATUS_IDLE;
1211  03f7 3f14          	clr	L3_tIRFSM
1212                     ; 491 			tIRFSM.u32CodeTime = 0;
1214  03f9 ae0000        	ldw	x,#0
1215  03fc bf1e          	ldw	L3_tIRFSM+10,x
1216  03fe ae0000        	ldw	x,#0
1217  0401 bf1c          	ldw	L3_tIRFSM+8,x
1218  0403               L543:
1219                     ; 494 }
1222  0403 81            	ret
1367                     	xref	_printf
1368                     	switch	.ubsct
1369  0000               L5_IR_Buf:
1370  0000 000000000000  	ds.b	20
1371  0014               L3_tIRFSM:
1372  0014 000000000000  	ds.b	18
1373                     	xref	_COMM_RequestSendCommand
1374                     	xref	_ZeroMem
1375                     	xdef	_ISR_IRReceive
1376                     	xdef	_Isr_IR_Timeout100us
1377                     	xdef	_Isr_IR_Timeout10ms
1378                     	xdef	_IR_Process
1379                     	xdef	_IR_Init
1380                     	xref	_TIM4_ClearFlag
1381                     	xref	_TIM4_ITConfig
1382                     	xref	_TIM4_Cmd
1383                     	xref	_TIM4_TimeBaseInit
1384                     	xref	_TIM3_ClearFlag
1385                     	xref	_TIM3_ITConfig
1386                     	xref	_TIM3_Cmd
1387                     	xref	_TIM3_TimeBaseInit
1388                     	xref	_GPIO_WriteLow
1389                     	xref	_GPIO_WriteHigh
1390                     	xref	_GPIO_Init
1391                     	xref	_EXTI_SetTLISensitivity
1392                     	xref	_EXTI_SetExtIntSensitivity
1393                     	switch	.const
1394  0020               L503:
1395  0020 5b49525d2063  	dc.b	"[IR] code = %x%x%x"
1396  0032 257800        	dc.b	"%x",0
1397  0035               L561:
1398  0035 5b49525d2049  	dc.b	"[IR] IR_CMD_BK_VIE"
1399  0047 570a00        	dc.b	"W",10,0
1400  004a               L361:
1401  004a 5b49525d2049  	dc.b	"[IR] IR_CMD_FR_VIE"
1402  005c 570a00        	dc.b	"W",10,0
1403  005f               L161:
1404  005f 5b49525d2049  	dc.b	"[IR] IR_CMD_RT_VIE"
1405  0071 570a00        	dc.b	"W",10,0
1406  0074               L751:
1407  0074 5b49525d2049  	dc.b	"[IR] IR_CMD_LF_VIE"
1408  0086 570a00        	dc.b	"W",10,0
1409  0089               L551:
1410  0089 5b49525d2049  	dc.b	"[IR] IR_CMD_POWER",10,0
1411  009c               L351:
1412  009c 5b49525d2049  	dc.b	"[IR] IR_CMD_BACK",10,0
1413  00ae               L151:
1414  00ae 5b49525d2049  	dc.b	"[IR] IR_CMD_RIGHT",10,0
1415  00c1               L741:
1416  00c1 5b49525d2049  	dc.b	"[IR] IR_CMD_LEFT",10,0
1417  00d3               L541:
1418  00d3 5b49525d2049  	dc.b	"[IR] IR_CMD_DOWN",10,0
1419  00e5               L341:
1420  00e5 5b49525d2049  	dc.b	"[IR] IR_CMD_UP",10,0
1421  00f5               L141:
1422  00f5 5b49525d2049  	dc.b	"[IR] IR_CMD_OK",10,0
1423                     	xref.b	c_lreg
1424                     	xref.b	c_x
1444                     	xref	c_lgadc
1445                     	xref	c_lgor
1446                     	xref	c_llsh
1447                     	xref	c_lcmp
1448                     	xref	c_ltor
1449                     	end

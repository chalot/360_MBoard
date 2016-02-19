   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _LsiFreq:
  17  0000 00000000      	dc.l	0
  59                     ; 38 void main()
  59                     ; 39 {	
  61                     	switch	.text
  62  0000               _main:
  66                     ; 41   	CLK_Config();
  68  0000 ad55          	call	L3_CLK_Config
  70                     ; 44 	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
  72  0002 a602          	ld	a,#2
  73  0004 cd0000        	call	_RST_GetFlagStatus
  75  0007 4d            	tnz	a
  76  0008 2705          	jreq	L52
  77                     ; 47 	  RST_ClearFlag(RST_FLAG_IWDGF);
  79  000a a602          	ld	a,#2
  80  000c cd0000        	call	_RST_ClearFlag
  82  000f               L52:
  83                     ; 51 	GPIO_DeInit(GPIOD);	
  85  000f ae500f        	ldw	x,#20495
  86  0012 cd0000        	call	_GPIO_DeInit
  88                     ; 52 	GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);
  90  0015 4be0          	push	#224
  91  0017 4b08          	push	#8
  92  0019 ae500f        	ldw	x,#20495
  93  001c cd0000        	call	_GPIO_Init
  95  001f 85            	popw	x
  96                     ; 53 	GPIO_DeInit(GPIOC);	
  98  0020 ae500a        	ldw	x,#20490
  99  0023 cd0000        	call	_GPIO_DeInit
 101                     ; 54 	GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_FAST);	
 103  0026 4be0          	push	#224
 104  0028 4b02          	push	#2
 105  002a ae500a        	ldw	x,#20490
 106  002d cd0000        	call	_GPIO_Init
 108  0030 85            	popw	x
 109                     ; 64 	DBG_Config();
 111  0031 ad69          	call	L5_DBG_Config
 113                     ; 68 	KEY_Init();
 115  0033 cd0000        	call	_KEY_Init
 117                     ; 71 	COMM_Init();
 119  0036 cd0000        	call	_COMM_Init
 121                     ; 74 	IR_Init();
 123  0039 cd0000        	call	_IR_Init
 125                     ; 77 	enableInterrupts();    
 128  003c 9a            rim
 130                     ; 80 	VDD3V3_ON();
 133  003d 4b08          	push	#8
 134  003f ae500f        	ldw	x,#20495
 135  0042 cd0000        	call	_GPIO_WriteHigh
 137  0045 84            	pop	a
 138                     ; 81 	VDD12_ON();
 140  0046 4b02          	push	#2
 141  0048 ae500a        	ldw	x,#20490
 142  004b cd0000        	call	_GPIO_WriteHigh
 144  004e 84            	pop	a
 145  004f               L72:
 146                     ; 86 		KEY_Process();
 148  004f cd0000        	call	_KEY_Process
 150                     ; 89 		IR_Process();
 152  0052 cd0000        	call	_IR_Process
 155  0055 20f8          	jra	L72
 182                     ; 104 void CLK_Config(void)
 182                     ; 105 {
 183                     	switch	.text
 184  0057               L3_CLK_Config:
 188                     ; 108 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 190  0057 4f            	clr	a
 191  0058 cd0000        	call	_CLK_HSIPrescalerConfig
 193                     ; 109 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 195  005b a680          	ld	a,#128
 196  005d cd0000        	call	_CLK_SYSCLKConfig
 198                     ; 110 	CLK_HSICmd(ENABLE);
 200  0060 a601          	ld	a,#1
 201  0062 cd0000        	call	_CLK_HSICmd
 203                     ; 113 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	
 205  0065 ae0001        	ldw	x,#1
 206  0068 a607          	ld	a,#7
 207  006a 95            	ld	xh,a
 208  006b cd0000        	call	_CLK_PeripheralClockConfig
 210                     ; 114 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
 212  006e ae0001        	ldw	x,#1
 213  0071 a605          	ld	a,#5
 214  0073 95            	ld	xh,a
 215  0074 cd0000        	call	_CLK_PeripheralClockConfig
 217                     ; 115 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
 219  0077 ae0001        	ldw	x,#1
 220  007a a606          	ld	a,#6
 221  007c 95            	ld	xh,a
 222  007d cd0000        	call	_CLK_PeripheralClockConfig
 224                     ; 116 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);	
 226  0080 ae0001        	ldw	x,#1
 227  0083 a604          	ld	a,#4
 228  0085 95            	ld	xh,a
 229  0086 cd0000        	call	_CLK_PeripheralClockConfig
 231                     ; 117 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 233  0089 ae0001        	ldw	x,#1
 234  008c a602          	ld	a,#2
 235  008e 95            	ld	xh,a
 236  008f cd0000        	call	_CLK_PeripheralClockConfig
 238                     ; 119 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
 240  0092 ae0001        	ldw	x,#1
 241  0095 a603          	ld	a,#3
 242  0097 95            	ld	xh,a
 243  0098 cd0000        	call	_CLK_PeripheralClockConfig
 245                     ; 121 }
 248  009b 81            	ret
 274                     ; 129 void DBG_Config()
 274                     ; 130 {
 275                     	switch	.text
 276  009c               L5_DBG_Config:
 280                     ; 132 	UART3_DeInit();
 282  009c cd0000        	call	_UART3_DeInit
 284                     ; 134 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 284                     ; 135 			UART3_MODE_TX_DISABLE | UART3_MODE_RX_DISABLE);
 286  009f 4bc0          	push	#192
 287  00a1 4b00          	push	#0
 288  00a3 4b00          	push	#0
 289  00a5 4b00          	push	#0
 290  00a7 aec200        	ldw	x,#49664
 291  00aa 89            	pushw	x
 292  00ab ae0001        	ldw	x,#1
 293  00ae 89            	pushw	x
 294  00af cd0000        	call	_UART3_Init
 296  00b2 5b08          	addw	sp,#8
 297                     ; 137 	UART3_ITConfig(UART3_IT_TXE, DISABLE);
 299  00b4 4b00          	push	#0
 300  00b6 ae0277        	ldw	x,#631
 301  00b9 cd0000        	call	_UART3_ITConfig
 303  00bc 84            	pop	a
 304                     ; 138 }
 307  00bd 81            	ret
 343                     ; 145 PUTCHAR_PROTOTYPE
 343                     ; 146 {
 344                     	switch	.text
 345  00be               _putchar:
 347  00be 88            	push	a
 348       00000000      OFST:	set	0
 351                     ; 149   UART3_SendData8(c);
 353  00bf cd0000        	call	_UART3_SendData8
 356  00c2               L37:
 357                     ; 151   while (UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
 359  00c2 ae0080        	ldw	x,#128
 360  00c5 cd0000        	call	_UART3_GetFlagStatus
 362  00c8 4d            	tnz	a
 363  00c9 27f7          	jreq	L37
 364                     ; 153   return (c);
 366  00cb 7b01          	ld	a,(OFST+1,sp)
 369  00cd 5b01          	addw	sp,#1
 370  00cf 81            	ret
 399                     ; 164 void IWDG_Config(void)
 399                     ; 165 {
 400                     	switch	.text
 401  00d0               _IWDG_Config:
 405                     ; 169   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 407  00d0 a655          	ld	a,#85
 408  00d2 cd0000        	call	_IWDG_WriteAccessCmd
 410                     ; 172   IWDG_SetPrescaler(IWDG_Prescaler_128);
 412  00d5 a605          	ld	a,#5
 413  00d7 cd0000        	call	_IWDG_SetPrescaler
 415                     ; 181   IWDG_SetReload((uint8_t)(LsiFreq/512));
 417  00da ae0000        	ldw	x,#_LsiFreq
 418  00dd cd0000        	call	c_ltor
 420  00e0 a609          	ld	a,#9
 421  00e2 cd0000        	call	c_lursh
 423  00e5 b603          	ld	a,c_lreg+3
 424  00e7 cd0000        	call	_IWDG_SetReload
 426                     ; 184   IWDG_ReloadCounter();
 428  00ea cd0000        	call	_IWDG_ReloadCounter
 430                     ; 187   IWDG_Enable();
 432  00ed cd0000        	call	_IWDG_Enable
 434                     ; 188 }
 437  00f0 81            	ret
 503                     ; 198 u32 LSIMeasurment(void)
 503                     ; 199 {
 504                     	switch	.text
 505  00f1               _LSIMeasurment:
 507  00f1 520c          	subw	sp,#12
 508       0000000c      OFST:	set	12
 511                     ; 201   uint32_t lsi_freq_hz = 0x0;
 513                     ; 202   uint32_t fmaster = 0x0;
 515                     ; 203   uint16_t ICValue1 = 0x0;
 517                     ; 204   uint16_t ICValue2 = 0x0;
 519                     ; 207   fmaster = CLK_GetClockFreq();
 521  00f3 cd0000        	call	_CLK_GetClockFreq
 523  00f6 96            	ldw	x,sp
 524  00f7 1c0009        	addw	x,#OFST-3
 525  00fa cd0000        	call	c_rtol
 527                     ; 210   AWU->CSR |= AWU_CSR_MSR;
 529  00fd 721050f0      	bset	20720,#0
 530                     ; 245   TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,
 530                     ; 246               TIM3_ICPSC_DIV8, 0);
 532  0101 4b00          	push	#0
 533  0103 4b0c          	push	#12
 534  0105 4b01          	push	#1
 535  0107 5f            	clrw	x
 536  0108 4f            	clr	a
 537  0109 95            	ld	xh,a
 538  010a cd0000        	call	_TIM3_ICInit
 540  010d 5b03          	addw	sp,#3
 541                     ; 249   TIM3_Cmd(ENABLE);
 543  010f a601          	ld	a,#1
 544  0111 cd0000        	call	_TIM3_Cmd
 547  0114               L341:
 548                     ; 252   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 550  0114 c65322        	ld	a,21282
 551  0117 a402          	and	a,#2
 552  0119 a102          	cp	a,#2
 553  011b 26f7          	jrne	L341
 554                     ; 254   ICValue1 = TIM3_GetCapture1();
 556  011d cd0000        	call	_TIM3_GetCapture1
 558  0120 1f05          	ldw	(OFST-7,sp),x
 559                     ; 255   TIM3_ClearFlag(TIM3_FLAG_CC1);
 561  0122 ae0002        	ldw	x,#2
 562  0125 cd0000        	call	_TIM3_ClearFlag
 565  0128               L151:
 566                     ; 258   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 568  0128 c65322        	ld	a,21282
 569  012b a402          	and	a,#2
 570  012d a102          	cp	a,#2
 571  012f 26f7          	jrne	L151
 572                     ; 260   ICValue2 = TIM3_GetCapture1();
 574  0131 cd0000        	call	_TIM3_GetCapture1
 576  0134 1f07          	ldw	(OFST-5,sp),x
 577                     ; 261   TIM3_ClearFlag(TIM3_FLAG_CC1);
 579  0136 ae0002        	ldw	x,#2
 580  0139 cd0000        	call	_TIM3_ClearFlag
 582                     ; 264   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
 584  013c 72115327      	bres	21287,#0
 585                     ; 266   TIM3_Cmd(DISABLE);
 587  0140 4f            	clr	a
 588  0141 cd0000        	call	_TIM3_Cmd
 590                     ; 270   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 592  0144 1e07          	ldw	x,(OFST-5,sp)
 593  0146 72f005        	subw	x,(OFST-7,sp)
 594  0149 cd0000        	call	c_uitolx
 596  014c 96            	ldw	x,sp
 597  014d 1c0001        	addw	x,#OFST-11
 598  0150 cd0000        	call	c_rtol
 600  0153 96            	ldw	x,sp
 601  0154 1c0009        	addw	x,#OFST-3
 602  0157 cd0000        	call	c_ltor
 604  015a a603          	ld	a,#3
 605  015c cd0000        	call	c_llsh
 607  015f 96            	ldw	x,sp
 608  0160 1c0001        	addw	x,#OFST-11
 609  0163 cd0000        	call	c_ludv
 611  0166 96            	ldw	x,sp
 612  0167 1c0009        	addw	x,#OFST-3
 613  016a cd0000        	call	c_rtol
 615                     ; 273   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
 617  016d 721150f0      	bres	20720,#0
 618                     ; 275  return (lsi_freq_hz);
 620  0171 96            	ldw	x,sp
 621  0172 1c0009        	addw	x,#OFST-3
 622  0175 cd0000        	call	c_ltor
 626  0178 5b0c          	addw	sp,#12
 627  017a 81            	ret
 662                     ; 285 void assert_failed(uint8_t* file, uint32_t line)
 662                     ; 286 { 
 663                     	switch	.text
 664  017b               _assert_failed:
 668  017b               L371:
 669  017b 20fe          	jra	L371
 693                     	xdef	_main
 694                     	xdef	_LSIMeasurment
 695                     	xdef	_IWDG_Config
 696                     	xdef	_LsiFreq
 697                     	xref	_IR_Process
 698                     	xref	_IR_Init
 699                     	xref	_COMM_Init
 700                     	xref	_KEY_Init
 701                     	xref	_KEY_Process
 702                     	xdef	_putchar
 703                     	xdef	_assert_failed
 704                     	xref	_UART3_GetFlagStatus
 705                     	xref	_UART3_SendData8
 706                     	xref	_UART3_ITConfig
 707                     	xref	_UART3_Init
 708                     	xref	_UART3_DeInit
 709                     	xref	_TIM3_ClearFlag
 710                     	xref	_TIM3_GetCapture1
 711                     	xref	_TIM3_Cmd
 712                     	xref	_TIM3_ICInit
 713                     	xref	_RST_ClearFlag
 714                     	xref	_RST_GetFlagStatus
 715                     	xref	_IWDG_Enable
 716                     	xref	_IWDG_ReloadCounter
 717                     	xref	_IWDG_SetReload
 718                     	xref	_IWDG_SetPrescaler
 719                     	xref	_IWDG_WriteAccessCmd
 720                     	xref	_GPIO_WriteHigh
 721                     	xref	_GPIO_Init
 722                     	xref	_GPIO_DeInit
 723                     	xref	_CLK_GetClockFreq
 724                     	xref	_CLK_SYSCLKConfig
 725                     	xref	_CLK_HSIPrescalerConfig
 726                     	xref	_CLK_PeripheralClockConfig
 727                     	xref	_CLK_HSICmd
 728                     	xref.b	c_lreg
 729                     	xref.b	c_x
 748                     	xref	c_ludv
 749                     	xref	c_uitolx
 750                     	xref	c_llsh
 751                     	xref	c_rtol
 752                     	xref	c_lursh
 753                     	xref	c_ltor
 754                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	switch	.data
  16  0000               _LsiFreq:
  17  0000 00000000      	dc.l	0
  50                     ; 120 void CLK_Config(void)
  50                     ; 121 {
  52                     	switch	.text
  53  0000               L3_CLK_Config:
  57                     ; 124 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  59  0000 4f            	clr	a
  60  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  62                     ; 125 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  64  0004 a680          	ld	a,#128
  65  0006 cd0000        	call	_CLK_SYSCLKConfig
  67                     ; 126 	CLK_HSICmd(ENABLE);
  69  0009 a601          	ld	a,#1
  70  000b cd0000        	call	_CLK_HSICmd
  72                     ; 128 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	
  74  000e ae0001        	ldw	x,#1
  75  0011 a607          	ld	a,#7
  76  0013 95            	ld	xh,a
  77  0014 cd0000        	call	_CLK_PeripheralClockConfig
  79                     ; 129 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
  81  0017 ae0001        	ldw	x,#1
  82  001a a605          	ld	a,#5
  83  001c 95            	ld	xh,a
  84  001d cd0000        	call	_CLK_PeripheralClockConfig
  86                     ; 130 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
  88  0020 ae0001        	ldw	x,#1
  89  0023 a606          	ld	a,#6
  90  0025 95            	ld	xh,a
  91  0026 cd0000        	call	_CLK_PeripheralClockConfig
  93                     ; 131 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);	
  95  0029 ae0001        	ldw	x,#1
  96  002c a604          	ld	a,#4
  97  002e 95            	ld	xh,a
  98  002f cd0000        	call	_CLK_PeripheralClockConfig
 100                     ; 132 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 102  0032 ae0001        	ldw	x,#1
 103  0035 a602          	ld	a,#2
 104  0037 95            	ld	xh,a
 105  0038 cd0000        	call	_CLK_PeripheralClockConfig
 107                     ; 134 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
 109  003b ae0001        	ldw	x,#1
 110  003e a603          	ld	a,#3
 111  0040 95            	ld	xh,a
 112  0041 cd0000        	call	_CLK_PeripheralClockConfig
 114                     ; 136 }
 117  0044 81            	ret
 143                     ; 144 void DBG_Config()
 143                     ; 145 {
 144                     	switch	.text
 145  0045               L5_DBG_Config:
 149                     ; 147 	UART3_DeInit();
 151  0045 cd0000        	call	_UART3_DeInit
 153                     ; 149 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 153                     ; 150 			UART3_MODE_TX_DISABLE | UART3_MODE_RX_DISABLE);
 155  0048 4bc0          	push	#192
 156  004a 4b00          	push	#0
 157  004c 4b00          	push	#0
 158  004e 4b00          	push	#0
 159  0050 aec200        	ldw	x,#49664
 160  0053 89            	pushw	x
 161  0054 ae0001        	ldw	x,#1
 162  0057 89            	pushw	x
 163  0058 cd0000        	call	_UART3_Init
 165  005b 5b08          	addw	sp,#8
 166                     ; 152 	UART3_ITConfig(UART3_IT_TXE, DISABLE);
 168  005d 4b00          	push	#0
 169  005f ae0277        	ldw	x,#631
 170  0062 cd0000        	call	_UART3_ITConfig
 172  0065 84            	pop	a
 173                     ; 153 }
 176  0066 81            	ret
 210                     ; 160 PUTCHAR_PROTOTYPE
 210                     ; 161 {
 211                     	switch	.text
 212  0067               _putchar:
 214  0067 88            	push	a
 215       00000000      OFST:	set	0
 218                     ; 164   UART3_SendData8(c);
 220  0068 cd0000        	call	_UART3_SendData8
 223  006b               L35:
 224                     ; 166   while (UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
 226  006b ae0080        	ldw	x,#128
 227  006e cd0000        	call	_UART3_GetFlagStatus
 229  0071 4d            	tnz	a
 230  0072 27f7          	jreq	L35
 231                     ; 168   return (c);
 233  0074 7b01          	ld	a,(OFST+1,sp)
 236  0076 5b01          	addw	sp,#1
 237  0078 81            	ret
 266                     ; 179 void IWDG_Config(void)
 266                     ; 180 {
 267                     	switch	.text
 268  0079               _IWDG_Config:
 272                     ; 184   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 274  0079 a655          	ld	a,#85
 275  007b cd0000        	call	_IWDG_WriteAccessCmd
 277                     ; 187   IWDG_SetPrescaler(IWDG_Prescaler_128);
 279  007e a605          	ld	a,#5
 280  0080 cd0000        	call	_IWDG_SetPrescaler
 282                     ; 196   IWDG_SetReload((uint8_t)(LsiFreq/512));
 284  0083 ae0000        	ldw	x,#_LsiFreq
 285  0086 cd0000        	call	c_ltor
 287  0089 a609          	ld	a,#9
 288  008b cd0000        	call	c_lursh
 290  008e b603          	ld	a,c_lreg+3
 291  0090 cd0000        	call	_IWDG_SetReload
 293                     ; 199   IWDG_ReloadCounter();
 295  0093 cd0000        	call	_IWDG_ReloadCounter
 297                     ; 202   IWDG_Enable();
 299  0096 cd0000        	call	_IWDG_Enable
 301                     ; 203 }
 304  0099 81            	ret
 362                     ; 213 u32 LSIMeasurment(void)
 362                     ; 214 {
 363                     	switch	.text
 364  009a               _LSIMeasurment:
 366  009a 520c          	subw	sp,#12
 367       0000000c      OFST:	set	12
 370                     ; 216   uint32_t lsi_freq_hz = 0x0;
 372                     ; 217   uint32_t fmaster = 0x0;
 374                     ; 218   uint16_t ICValue1 = 0x0;
 376                     ; 219   uint16_t ICValue2 = 0x0;
 378                     ; 222   fmaster = CLK_GetClockFreq();
 380  009c cd0000        	call	_CLK_GetClockFreq
 382  009f 96            	ldw	x,sp
 383  00a0 1c0009        	addw	x,#OFST-3
 384  00a3 cd0000        	call	c_rtol
 386                     ; 225   AWU->CSR |= AWU_CSR_MSR;
 388  00a6 721050f0      	bset	20720,#0
 389                     ; 260   TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,
 389                     ; 261               TIM3_ICPSC_DIV8, 0);
 391  00aa 4b00          	push	#0
 392  00ac 4b0c          	push	#12
 393  00ae 4b01          	push	#1
 394  00b0 5f            	clrw	x
 395  00b1 4f            	clr	a
 396  00b2 95            	ld	xh,a
 397  00b3 cd0000        	call	_TIM3_ICInit
 399  00b6 5b03          	addw	sp,#3
 400                     ; 264   TIM3_Cmd(ENABLE);
 402  00b8 a601          	ld	a,#1
 403  00ba cd0000        	call	_TIM3_Cmd
 406  00bd               L311:
 407                     ; 267   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 409  00bd c65322        	ld	a,21282
 410  00c0 a402          	and	a,#2
 411  00c2 a102          	cp	a,#2
 412  00c4 26f7          	jrne	L311
 413                     ; 269   ICValue1 = TIM3_GetCapture1();
 415  00c6 cd0000        	call	_TIM3_GetCapture1
 417  00c9 1f05          	ldw	(OFST-7,sp),x
 418                     ; 270   TIM3_ClearFlag(TIM3_FLAG_CC1);
 420  00cb ae0002        	ldw	x,#2
 421  00ce cd0000        	call	_TIM3_ClearFlag
 424  00d1               L121:
 425                     ; 273   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 427  00d1 c65322        	ld	a,21282
 428  00d4 a402          	and	a,#2
 429  00d6 a102          	cp	a,#2
 430  00d8 26f7          	jrne	L121
 431                     ; 275   ICValue2 = TIM3_GetCapture1();
 433  00da cd0000        	call	_TIM3_GetCapture1
 435  00dd 1f07          	ldw	(OFST-5,sp),x
 436                     ; 276   TIM3_ClearFlag(TIM3_FLAG_CC1);
 438  00df ae0002        	ldw	x,#2
 439  00e2 cd0000        	call	_TIM3_ClearFlag
 441                     ; 279   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
 443  00e5 72115327      	bres	21287,#0
 444                     ; 281   TIM3_Cmd(DISABLE);
 446  00e9 4f            	clr	a
 447  00ea cd0000        	call	_TIM3_Cmd
 449                     ; 285   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 451  00ed 1e07          	ldw	x,(OFST-5,sp)
 452  00ef 72f005        	subw	x,(OFST-7,sp)
 453  00f2 cd0000        	call	c_uitolx
 455  00f5 96            	ldw	x,sp
 456  00f6 1c0001        	addw	x,#OFST-11
 457  00f9 cd0000        	call	c_rtol
 459  00fc 96            	ldw	x,sp
 460  00fd 1c0009        	addw	x,#OFST-3
 461  0100 cd0000        	call	c_ltor
 463  0103 a603          	ld	a,#3
 464  0105 cd0000        	call	c_llsh
 466  0108 96            	ldw	x,sp
 467  0109 1c0001        	addw	x,#OFST-11
 468  010c cd0000        	call	c_ludv
 470  010f 96            	ldw	x,sp
 471  0110 1c0009        	addw	x,#OFST-3
 472  0113 cd0000        	call	c_rtol
 474                     ; 288   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
 476  0116 721150f0      	bres	20720,#0
 477                     ; 290  return (lsi_freq_hz);
 479  011a 96            	ldw	x,sp
 480  011b 1c0009        	addw	x,#OFST-3
 481  011e cd0000        	call	c_ltor
 485  0121 5b0c          	addw	sp,#12
 486  0123 81            	ret
 521                     ; 300 void assert_failed(uint8_t* file, uint32_t line)
 521                     ; 301 { 
 522                     	switch	.text
 523  0124               _assert_failed:
 527  0124               L341:
 528  0124 20fe          	jra	L341
 618                     ; 382 int main(void)
 618                     ; 383 {
 619                     	switch	.text
 620  0126               _main:
 622  0126 5206          	subw	sp,#6
 623       00000006      OFST:	set	6
 626                     ; 387 		CLK_Config();
 628  0128 cd0000        	call	L3_CLK_Config
 630                     ; 390 		GPIO_DeInit(GPIOD); 
 632  012b ae500f        	ldw	x,#20495
 633  012e cd0000        	call	_GPIO_DeInit
 635                     ; 391 		GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);
 637  0131 4be0          	push	#224
 638  0133 4b08          	push	#8
 639  0135 ae500f        	ldw	x,#20495
 640  0138 cd0000        	call	_GPIO_Init
 642  013b 85            	popw	x
 643                     ; 392 		GPIO_DeInit(GPIOC); 
 645  013c ae500a        	ldw	x,#20490
 646  013f cd0000        	call	_GPIO_DeInit
 648                     ; 393 		GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_FAST);	
 650  0142 4be0          	push	#224
 651  0144 4b02          	push	#2
 652  0146 ae500a        	ldw	x,#20490
 653  0149 cd0000        	call	_GPIO_Init
 655  014c 85            	popw	x
 656                     ; 396 		VDD3V3_ON();
 658  014d 4b08          	push	#8
 659  014f ae500f        	ldw	x,#20495
 660  0152 cd0000        	call	_GPIO_WriteHigh
 662  0155 84            	pop	a
 663                     ; 397 		VDD12_ON();
 665  0156 4b02          	push	#2
 666  0158 ae500a        	ldw	x,#20490
 667  015b cd0000        	call	_GPIO_WriteHigh
 669  015e 84            	pop	a
 670                     ; 399 		RTC_Init();
 672  015f cd0000        	call	_RTC_Init
 674  0162               L502:
 675                     ; 404 			RTC_ReadDate(&time);
 677  0162 96            	ldw	x,sp
 678  0163 1c0001        	addw	x,#OFST-5
 679  0166 cd0000        	call	_RTC_ReadDate
 682  0169 20f7          	jra	L502
 706                     	xdef	_main
 707                     	xref	_RTC_ReadDate
 708                     	xref	_RTC_Init
 709                     	xdef	_LSIMeasurment
 710                     	xdef	_IWDG_Config
 711                     	xdef	_LsiFreq
 712                     	xdef	_putchar
 713                     	xdef	_assert_failed
 714                     	xref	_UART3_GetFlagStatus
 715                     	xref	_UART3_SendData8
 716                     	xref	_UART3_ITConfig
 717                     	xref	_UART3_Init
 718                     	xref	_UART3_DeInit
 719                     	xref	_TIM3_ClearFlag
 720                     	xref	_TIM3_GetCapture1
 721                     	xref	_TIM3_Cmd
 722                     	xref	_TIM3_ICInit
 723                     	xref	_IWDG_Enable
 724                     	xref	_IWDG_ReloadCounter
 725                     	xref	_IWDG_SetReload
 726                     	xref	_IWDG_SetPrescaler
 727                     	xref	_IWDG_WriteAccessCmd
 728                     	xref	_GPIO_WriteHigh
 729                     	xref	_GPIO_Init
 730                     	xref	_GPIO_DeInit
 731                     	xref	_CLK_GetClockFreq
 732                     	xref	_CLK_SYSCLKConfig
 733                     	xref	_CLK_HSIPrescalerConfig
 734                     	xref	_CLK_PeripheralClockConfig
 735                     	xref	_CLK_HSICmd
 736                     	xref.b	c_lreg
 737                     	xref.b	c_x
 756                     	xref	c_ludv
 757                     	xref	c_uitolx
 758                     	xref	c_llsh
 759                     	xref	c_rtol
 760                     	xref	c_lursh
 761                     	xref	c_ltor
 762                     	end

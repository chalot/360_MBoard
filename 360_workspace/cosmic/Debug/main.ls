   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               _LsiFreq:
  17  0000 00000000      	dc.l	0
  50                     ; 87 void CLK_Config(void)
  50                     ; 88 {
  52                     	switch	.text
  53  0000               L3_CLK_Config:
  57                     ; 91 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
  59  0000 4f            	clr	a
  60  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  62                     ; 92 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
  64  0004 a680          	ld	a,#128
  65  0006 cd0000        	call	_CLK_SYSCLKConfig
  67                     ; 93 	CLK_HSICmd(ENABLE);
  69  0009 a601          	ld	a,#1
  70  000b cd0000        	call	_CLK_HSICmd
  72                     ; 96 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);			
  74  000e ae0001        	ldw	x,#1
  75  0011 a607          	ld	a,#7
  76  0013 95            	ld	xh,a
  77  0014 cd0000        	call	_CLK_PeripheralClockConfig
  79                     ; 97 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
  81  0017 ae0001        	ldw	x,#1
  82  001a a605          	ld	a,#5
  83  001c 95            	ld	xh,a
  84  001d cd0000        	call	_CLK_PeripheralClockConfig
  86                     ; 98 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
  88  0020 ae0001        	ldw	x,#1
  89  0023 a606          	ld	a,#6
  90  0025 95            	ld	xh,a
  91  0026 cd0000        	call	_CLK_PeripheralClockConfig
  93                     ; 99 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);	
  95  0029 ae0001        	ldw	x,#1
  96  002c a604          	ld	a,#4
  97  002e 95            	ld	xh,a
  98  002f cd0000        	call	_CLK_PeripheralClockConfig
 100                     ; 100 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 102  0032 ae0001        	ldw	x,#1
 103  0035 a602          	ld	a,#2
 104  0037 95            	ld	xh,a
 105  0038 cd0000        	call	_CLK_PeripheralClockConfig
 107                     ; 103 }
 110  003b 81            	ret
 135                     ; 111 void DBG_Config()
 135                     ; 112 {
 136                     	switch	.text
 137  003c               L5_DBG_Config:
 141                     ; 114 	UART3_DeInit();
 143  003c cd0000        	call	_UART3_DeInit
 145                     ; 116 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 145                     ; 117 			UART3_MODE_TXRX_ENABLE);
 147  003f 4b0c          	push	#12
 148  0041 4b00          	push	#0
 149  0043 4b00          	push	#0
 150  0045 4b00          	push	#0
 151  0047 aec200        	ldw	x,#49664
 152  004a 89            	pushw	x
 153  004b ae0001        	ldw	x,#1
 154  004e 89            	pushw	x
 155  004f cd0000        	call	_UART3_Init
 157  0052 5b08          	addw	sp,#8
 158                     ; 118 }
 161  0054 81            	ret
 197                     ; 125 PUTCHAR_PROTOTYPE
 197                     ; 126 {
 198                     	switch	.text
 199  0055               _putchar:
 201  0055 88            	push	a
 202       00000000      OFST:	set	0
 205                     ; 128   UART3_SendData8(c);
 207  0056 cd0000        	call	_UART3_SendData8
 210  0059               L55:
 211                     ; 130   while (UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
 213  0059 ae0080        	ldw	x,#128
 214  005c cd0000        	call	_UART3_GetFlagStatus
 216  005f 4d            	tnz	a
 217  0060 27f7          	jreq	L55
 218                     ; 132   return (c);
 220  0062 7b01          	ld	a,(OFST+1,sp)
 223  0064 5b01          	addw	sp,#1
 224  0066 81            	ret
 253                     ; 142 void IWDG_Config(void)
 253                     ; 143 {
 254                     	switch	.text
 255  0067               _IWDG_Config:
 259                     ; 147   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 261  0067 a655          	ld	a,#85
 262  0069 cd0000        	call	_IWDG_WriteAccessCmd
 264                     ; 150   IWDG_SetPrescaler(IWDG_Prescaler_128);
 266  006c a605          	ld	a,#5
 267  006e cd0000        	call	_IWDG_SetPrescaler
 269                     ; 159   IWDG_SetReload((uint8_t)(LsiFreq/512));
 271  0071 ae0000        	ldw	x,#_LsiFreq
 272  0074 cd0000        	call	c_ltor
 274  0077 a609          	ld	a,#9
 275  0079 cd0000        	call	c_lursh
 277  007c b603          	ld	a,c_lreg+3
 278  007e cd0000        	call	_IWDG_SetReload
 280                     ; 162   IWDG_ReloadCounter();
 282  0081 cd0000        	call	_IWDG_ReloadCounter
 284                     ; 165   IWDG_Enable();
 286  0084 cd0000        	call	_IWDG_Enable
 288                     ; 166 }
 291  0087 81            	ret
 357                     ; 176 u32 LSIMeasurment(void)
 357                     ; 177 {
 358                     	switch	.text
 359  0088               _LSIMeasurment:
 361  0088 520c          	subw	sp,#12
 362       0000000c      OFST:	set	12
 365                     ; 179   uint32_t lsi_freq_hz = 0x0;
 367                     ; 180   uint32_t fmaster = 0x0;
 369                     ; 181   uint16_t ICValue1 = 0x0;
 371                     ; 182   uint16_t ICValue2 = 0x0;
 373                     ; 185   fmaster = CLK_GetClockFreq();
 375  008a cd0000        	call	_CLK_GetClockFreq
 377  008d 96            	ldw	x,sp
 378  008e 1c0009        	addw	x,#OFST-3
 379  0091 cd0000        	call	c_rtol
 381                     ; 188   AWU->CSR |= AWU_CSR_MSR;
 383  0094 721050f0      	bset	20720,#0
 384                     ; 223   TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,
 384                     ; 224               TIM3_ICPSC_DIV8, 0);
 386  0098 4b00          	push	#0
 387  009a 4b0c          	push	#12
 388  009c 4b01          	push	#1
 389  009e 5f            	clrw	x
 390  009f 4f            	clr	a
 391  00a0 95            	ld	xh,a
 392  00a1 cd0000        	call	_TIM3_ICInit
 394  00a4 5b03          	addw	sp,#3
 395                     ; 227   TIM3_Cmd(ENABLE);
 397  00a6 a601          	ld	a,#1
 398  00a8 cd0000        	call	_TIM3_Cmd
 401  00ab               L521:
 402                     ; 230   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 404  00ab c65322        	ld	a,21282
 405  00ae a402          	and	a,#2
 406  00b0 a102          	cp	a,#2
 407  00b2 26f7          	jrne	L521
 408                     ; 232   ICValue1 = TIM3_GetCapture1();
 410  00b4 cd0000        	call	_TIM3_GetCapture1
 412  00b7 1f05          	ldw	(OFST-7,sp),x
 413                     ; 233   TIM3_ClearFlag(TIM3_FLAG_CC1);
 415  00b9 ae0002        	ldw	x,#2
 416  00bc cd0000        	call	_TIM3_ClearFlag
 419  00bf               L331:
 420                     ; 236   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 422  00bf c65322        	ld	a,21282
 423  00c2 a402          	and	a,#2
 424  00c4 a102          	cp	a,#2
 425  00c6 26f7          	jrne	L331
 426                     ; 238   ICValue2 = TIM3_GetCapture1();
 428  00c8 cd0000        	call	_TIM3_GetCapture1
 430  00cb 1f07          	ldw	(OFST-5,sp),x
 431                     ; 239   TIM3_ClearFlag(TIM3_FLAG_CC1);
 433  00cd ae0002        	ldw	x,#2
 434  00d0 cd0000        	call	_TIM3_ClearFlag
 436                     ; 242   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
 438  00d3 72115327      	bres	21287,#0
 439                     ; 244   TIM3_Cmd(DISABLE);
 441  00d7 4f            	clr	a
 442  00d8 cd0000        	call	_TIM3_Cmd
 444                     ; 248   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 446  00db 1e07          	ldw	x,(OFST-5,sp)
 447  00dd 72f005        	subw	x,(OFST-7,sp)
 448  00e0 cd0000        	call	c_uitolx
 450  00e3 96            	ldw	x,sp
 451  00e4 1c0001        	addw	x,#OFST-11
 452  00e7 cd0000        	call	c_rtol
 454  00ea 96            	ldw	x,sp
 455  00eb 1c0009        	addw	x,#OFST-3
 456  00ee cd0000        	call	c_ltor
 458  00f1 a603          	ld	a,#3
 459  00f3 cd0000        	call	c_llsh
 461  00f6 96            	ldw	x,sp
 462  00f7 1c0001        	addw	x,#OFST-11
 463  00fa cd0000        	call	c_ludv
 465  00fd 96            	ldw	x,sp
 466  00fe 1c0009        	addw	x,#OFST-3
 467  0101 cd0000        	call	c_rtol
 469                     ; 251   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
 471  0104 721150f0      	bres	20720,#0
 472                     ; 253  return (lsi_freq_hz);
 474  0108 96            	ldw	x,sp
 475  0109 1c0009        	addw	x,#OFST-3
 476  010c cd0000        	call	c_ltor
 480  010f 5b0c          	addw	sp,#12
 481  0111 81            	ret
 516                     ; 263 void assert_failed(uint8_t* file, uint32_t line)
 516                     ; 264 { 
 517                     	switch	.text
 518  0112               _assert_failed:
 522  0112               L551:
 523  0112 20fe          	jra	L551
 555                     ; 312 void main()
 555                     ; 313 {	
 556                     	switch	.text
 557  0114               _main:
 561                     ; 314 	CLK_Config();
 563  0114 cd0000        	call	L3_CLK_Config
 565                     ; 316 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
 567  0117 ae0001        	ldw	x,#1
 568  011a a605          	ld	a,#5
 569  011c 95            	ld	xh,a
 570  011d cd0000        	call	_CLK_PeripheralClockConfig
 572                     ; 317 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
 574  0120 ae0001        	ldw	x,#1
 575  0123 a606          	ld	a,#6
 576  0125 95            	ld	xh,a
 577  0126 cd0000        	call	_CLK_PeripheralClockConfig
 579                     ; 320 	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
 581  0129 a602          	ld	a,#2
 582  012b cd0000        	call	_RST_GetFlagStatus
 584  012e 4d            	tnz	a
 585  012f 2705          	jreq	L171
 586                     ; 323 	  RST_ClearFlag(RST_FLAG_IWDGF);
 588  0131 a602          	ld	a,#2
 589  0133 cd0000        	call	_RST_ClearFlag
 591  0136               L171:
 592                     ; 327 	DBG_Config();
 594  0136 cd003c        	call	L5_DBG_Config
 596                     ; 329 	IR_Init();
 598  0139 cd0000        	call	_IR_Init
 600                     ; 331 	printf("starting...\n");
 602  013c ae0000        	ldw	x,#L371
 603  013f cd0000        	call	_printf
 605                     ; 334 	enableInterrupts();    
 608  0142 9a            rim
 610  0143               L571:
 611                     ; 338 		IR_Process();
 613  0143 cd0000        	call	_IR_Process
 616  0146 20fb          	jra	L571
 640                     	xdef	_main
 641                     	xdef	_LSIMeasurment
 642                     	xdef	_IWDG_Config
 643                     	xdef	_LsiFreq
 644                     	xref	_IR_Process
 645                     	xref	_IR_Init
 646                     	xdef	_putchar
 647                     	xref	_printf
 648                     	xdef	_assert_failed
 649                     	xref	_UART3_GetFlagStatus
 650                     	xref	_UART3_SendData8
 651                     	xref	_UART3_Init
 652                     	xref	_UART3_DeInit
 653                     	xref	_TIM3_ClearFlag
 654                     	xref	_TIM3_GetCapture1
 655                     	xref	_TIM3_Cmd
 656                     	xref	_TIM3_ICInit
 657                     	xref	_RST_ClearFlag
 658                     	xref	_RST_GetFlagStatus
 659                     	xref	_IWDG_Enable
 660                     	xref	_IWDG_ReloadCounter
 661                     	xref	_IWDG_SetReload
 662                     	xref	_IWDG_SetPrescaler
 663                     	xref	_IWDG_WriteAccessCmd
 664                     	xref	_CLK_GetClockFreq
 665                     	xref	_CLK_SYSCLKConfig
 666                     	xref	_CLK_HSIPrescalerConfig
 667                     	xref	_CLK_PeripheralClockConfig
 668                     	xref	_CLK_HSICmd
 669                     .const:	section	.text
 670  0000               L371:
 671  0000 737461727469  	dc.b	"starting...",10,0
 672                     	xref.b	c_lreg
 673                     	xref.b	c_x
 693                     	xref	c_ludv
 694                     	xref	c_uitolx
 695                     	xref	c_llsh
 696                     	xref	c_rtol
 697                     	xref	c_lursh
 698                     	xref	c_ltor
 699                     	end

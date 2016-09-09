   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	switch	.data
  16  0000               _LsiFreq:
  17  0000 00000000      	dc.l	0
  68                     ; 41 void main()
  68                     ; 42 {	
  70                     	switch	.text
  71  0000               _main:
  73  0000 88            	push	a
  74       00000001      OFST:	set	1
  77                     ; 43 	u8 i = 0;
  79  0001 0f01          	clr	(OFST+0,sp)
  80                     ; 46   	CLK_Config();
  82  0003 ad4e          	call	L3_CLK_Config
  84                     ; 64 	GPIO_DeInit(GPIOD);	
  86  0005 ae500f        	ldw	x,#20495
  87  0008 cd0000        	call	_GPIO_DeInit
  89                     ; 65 	GPIO_Init(GPIOD,GPIO_PIN_3,GPIO_MODE_OUT_PP_LOW_FAST);
  91  000b 4be0          	push	#224
  92  000d 4b08          	push	#8
  93  000f ae500f        	ldw	x,#20495
  94  0012 cd0000        	call	_GPIO_Init
  96  0015 85            	popw	x
  97                     ; 66 	GPIO_DeInit(GPIOC);	
  99  0016 ae500a        	ldw	x,#20490
 100  0019 cd0000        	call	_GPIO_DeInit
 102                     ; 67 	GPIO_Init(GPIOC,GPIO_PIN_1,GPIO_MODE_OUT_PP_LOW_FAST);	
 104  001c 4be0          	push	#224
 105  001e 4b02          	push	#2
 106  0020 ae500a        	ldw	x,#20490
 107  0023 cd0000        	call	_GPIO_Init
 109  0026 85            	popw	x
 110                     ; 71 	DBG_Config();
 112  0027 ad6f          	call	L5_DBG_Config
 114                     ; 75 	KEY_Init();
 116  0029 cd0000        	call	_KEY_Init
 118                     ; 78 	COMM_Init();
 120  002c cd0000        	call	_COMM_Init
 122                     ; 81 	IR_Init();
 124  002f cd0000        	call	_IR_Init
 126                     ; 84 	CAN_Initialize();
 128  0032 cd0000        	call	_CAN_Initialize
 130                     ; 87 	enableInterrupts();    
 133  0035 9a            rim
 135                     ; 90 	VDD3V3_ON();
 138  0036 4b08          	push	#8
 139  0038 ae500f        	ldw	x,#20495
 140  003b cd0000        	call	_GPIO_WriteHigh
 142  003e 84            	pop	a
 143                     ; 91 	VDD12_ON();
 145  003f 4b02          	push	#2
 146  0041 ae500a        	ldw	x,#20490
 147  0044 cd0000        	call	_GPIO_WriteHigh
 149  0047 84            	pop	a
 150  0048               L13:
 151                     ; 97 		KEY_Process();
 153  0048 cd0000        	call	_KEY_Process
 155                     ; 100 		IR_Process();
 157  004b cd0000        	call	_IR_Process
 159                     ; 103 		CAN_Process();
 161  004e cd0000        	call	_CAN_Process
 164  0051 20f5          	jra	L13
 191                     ; 120 void CLK_Config(void)
 191                     ; 121 {
 192                     	switch	.text
 193  0053               L3_CLK_Config:
 197                     ; 124 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 199  0053 4f            	clr	a
 200  0054 cd0000        	call	_CLK_HSIPrescalerConfig
 202                     ; 125 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 204  0057 a680          	ld	a,#128
 205  0059 cd0000        	call	_CLK_SYSCLKConfig
 207                     ; 126 	CLK_HSICmd(ENABLE);
 209  005c a601          	ld	a,#1
 210  005e cd0000        	call	_CLK_HSICmd
 212                     ; 128 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);	
 214  0061 ae0001        	ldw	x,#1
 215  0064 a607          	ld	a,#7
 216  0066 95            	ld	xh,a
 217  0067 cd0000        	call	_CLK_PeripheralClockConfig
 219                     ; 129 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);	
 221  006a ae0001        	ldw	x,#1
 222  006d a605          	ld	a,#5
 223  006f 95            	ld	xh,a
 224  0070 cd0000        	call	_CLK_PeripheralClockConfig
 226                     ; 130 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);	
 228  0073 ae0001        	ldw	x,#1
 229  0076 a606          	ld	a,#6
 230  0078 95            	ld	xh,a
 231  0079 cd0000        	call	_CLK_PeripheralClockConfig
 233                     ; 131 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);	
 235  007c ae0001        	ldw	x,#1
 236  007f a604          	ld	a,#4
 237  0081 95            	ld	xh,a
 238  0082 cd0000        	call	_CLK_PeripheralClockConfig
 240                     ; 132 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 242  0085 ae0001        	ldw	x,#1
 243  0088 a602          	ld	a,#2
 244  008a 95            	ld	xh,a
 245  008b cd0000        	call	_CLK_PeripheralClockConfig
 247                     ; 134 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
 249  008e ae0001        	ldw	x,#1
 250  0091 a603          	ld	a,#3
 251  0093 95            	ld	xh,a
 252  0094 cd0000        	call	_CLK_PeripheralClockConfig
 254                     ; 136 }
 257  0097 81            	ret
 283                     ; 144 void DBG_Config()
 283                     ; 145 {
 284                     	switch	.text
 285  0098               L5_DBG_Config:
 289                     ; 147 	UART3_DeInit();
 291  0098 cd0000        	call	_UART3_DeInit
 293                     ; 149 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 293                     ; 150 			UART3_MODE_TX_DISABLE | UART3_MODE_RX_DISABLE);
 295  009b 4bc0          	push	#192
 296  009d 4b00          	push	#0
 297  009f 4b00          	push	#0
 298  00a1 4b00          	push	#0
 299  00a3 aec200        	ldw	x,#49664
 300  00a6 89            	pushw	x
 301  00a7 ae0001        	ldw	x,#1
 302  00aa 89            	pushw	x
 303  00ab cd0000        	call	_UART3_Init
 305  00ae 5b08          	addw	sp,#8
 306                     ; 152 	UART3_ITConfig(UART3_IT_TXE, DISABLE);
 308  00b0 4b00          	push	#0
 309  00b2 ae0277        	ldw	x,#631
 310  00b5 cd0000        	call	_UART3_ITConfig
 312  00b8 84            	pop	a
 313                     ; 153 }
 316  00b9 81            	ret
 350                     ; 160 PUTCHAR_PROTOTYPE
 350                     ; 161 {
 351                     	switch	.text
 352  00ba               _putchar:
 354  00ba 88            	push	a
 355       00000000      OFST:	set	0
 358                     ; 164   UART3_SendData8(c);
 360  00bb cd0000        	call	_UART3_SendData8
 363  00be               L37:
 364                     ; 166   while (UART3_GetFlagStatus(UART3_FLAG_TXE) == RESET);
 366  00be ae0080        	ldw	x,#128
 367  00c1 cd0000        	call	_UART3_GetFlagStatus
 369  00c4 4d            	tnz	a
 370  00c5 27f7          	jreq	L37
 371                     ; 168   return (c);
 373  00c7 7b01          	ld	a,(OFST+1,sp)
 376  00c9 5b01          	addw	sp,#1
 377  00cb 81            	ret
 406                     ; 179 void IWDG_Config(void)
 406                     ; 180 {
 407                     	switch	.text
 408  00cc               _IWDG_Config:
 412                     ; 184   IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 414  00cc a655          	ld	a,#85
 415  00ce cd0000        	call	_IWDG_WriteAccessCmd
 417                     ; 187   IWDG_SetPrescaler(IWDG_Prescaler_128);
 419  00d1 a605          	ld	a,#5
 420  00d3 cd0000        	call	_IWDG_SetPrescaler
 422                     ; 196   IWDG_SetReload((uint8_t)(LsiFreq/512));
 424  00d6 ae0000        	ldw	x,#_LsiFreq
 425  00d9 cd0000        	call	c_ltor
 427  00dc a609          	ld	a,#9
 428  00de cd0000        	call	c_lursh
 430  00e1 b603          	ld	a,c_lreg+3
 431  00e3 cd0000        	call	_IWDG_SetReload
 433                     ; 199   IWDG_ReloadCounter();
 435  00e6 cd0000        	call	_IWDG_ReloadCounter
 437                     ; 202   IWDG_Enable();
 439  00e9 cd0000        	call	_IWDG_Enable
 441                     ; 203 }
 444  00ec 81            	ret
 502                     ; 213 u32 LSIMeasurment(void)
 502                     ; 214 {
 503                     	switch	.text
 504  00ed               _LSIMeasurment:
 506  00ed 520c          	subw	sp,#12
 507       0000000c      OFST:	set	12
 510                     ; 216   uint32_t lsi_freq_hz = 0x0;
 512                     ; 217   uint32_t fmaster = 0x0;
 514                     ; 218   uint16_t ICValue1 = 0x0;
 516                     ; 219   uint16_t ICValue2 = 0x0;
 518                     ; 222   fmaster = CLK_GetClockFreq();
 520  00ef cd0000        	call	_CLK_GetClockFreq
 522  00f2 96            	ldw	x,sp
 523  00f3 1c0009        	addw	x,#OFST-3
 524  00f6 cd0000        	call	c_rtol
 526                     ; 225   AWU->CSR |= AWU_CSR_MSR;
 528  00f9 721050f0      	bset	20720,#0
 529                     ; 260   TIM3_ICInit(TIM3_CHANNEL_1, TIM3_ICPOLARITY_RISING, TIM3_ICSELECTION_DIRECTTI,
 529                     ; 261               TIM3_ICPSC_DIV8, 0);
 531  00fd 4b00          	push	#0
 532  00ff 4b0c          	push	#12
 533  0101 4b01          	push	#1
 534  0103 5f            	clrw	x
 535  0104 4f            	clr	a
 536  0105 95            	ld	xh,a
 537  0106 cd0000        	call	_TIM3_ICInit
 539  0109 5b03          	addw	sp,#3
 540                     ; 264   TIM3_Cmd(ENABLE);
 542  010b a601          	ld	a,#1
 543  010d cd0000        	call	_TIM3_Cmd
 546  0110               L331:
 547                     ; 267   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 549  0110 c65322        	ld	a,21282
 550  0113 a402          	and	a,#2
 551  0115 a102          	cp	a,#2
 552  0117 26f7          	jrne	L331
 553                     ; 269   ICValue1 = TIM3_GetCapture1();
 555  0119 cd0000        	call	_TIM3_GetCapture1
 557  011c 1f05          	ldw	(OFST-7,sp),x
 558                     ; 270   TIM3_ClearFlag(TIM3_FLAG_CC1);
 560  011e ae0002        	ldw	x,#2
 561  0121 cd0000        	call	_TIM3_ClearFlag
 564  0124               L141:
 565                     ; 273   while ((TIM3->SR1 & TIM3_FLAG_CC1) != TIM3_FLAG_CC1);
 567  0124 c65322        	ld	a,21282
 568  0127 a402          	and	a,#2
 569  0129 a102          	cp	a,#2
 570  012b 26f7          	jrne	L141
 571                     ; 275   ICValue2 = TIM3_GetCapture1();
 573  012d cd0000        	call	_TIM3_GetCapture1
 575  0130 1f07          	ldw	(OFST-5,sp),x
 576                     ; 276   TIM3_ClearFlag(TIM3_FLAG_CC1);
 578  0132 ae0002        	ldw	x,#2
 579  0135 cd0000        	call	_TIM3_ClearFlag
 581                     ; 279   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
 583  0138 72115327      	bres	21287,#0
 584                     ; 281   TIM3_Cmd(DISABLE);
 586  013c 4f            	clr	a
 587  013d cd0000        	call	_TIM3_Cmd
 589                     ; 285   lsi_freq_hz = (8 * fmaster) / (ICValue2 - ICValue1);
 591  0140 1e07          	ldw	x,(OFST-5,sp)
 592  0142 72f005        	subw	x,(OFST-7,sp)
 593  0145 cd0000        	call	c_uitolx
 595  0148 96            	ldw	x,sp
 596  0149 1c0001        	addw	x,#OFST-11
 597  014c cd0000        	call	c_rtol
 599  014f 96            	ldw	x,sp
 600  0150 1c0009        	addw	x,#OFST-3
 601  0153 cd0000        	call	c_ltor
 603  0156 a603          	ld	a,#3
 604  0158 cd0000        	call	c_llsh
 606  015b 96            	ldw	x,sp
 607  015c 1c0001        	addw	x,#OFST-11
 608  015f cd0000        	call	c_ludv
 610  0162 96            	ldw	x,sp
 611  0163 1c0009        	addw	x,#OFST-3
 612  0166 cd0000        	call	c_rtol
 614                     ; 288   AWU->CSR &= (uint8_t)(~AWU_CSR_MSR);
 616  0169 721150f0      	bres	20720,#0
 617                     ; 290  return (lsi_freq_hz);
 619  016d 96            	ldw	x,sp
 620  016e 1c0009        	addw	x,#OFST-3
 621  0171 cd0000        	call	c_ltor
 625  0174 5b0c          	addw	sp,#12
 626  0176 81            	ret
 661                     ; 300 void assert_failed(uint8_t* file, uint32_t line)
 661                     ; 301 { 
 662                     	switch	.text
 663  0177               _assert_failed:
 667  0177               L361:
 668  0177 20fe          	jra	L361
 692                     	xdef	_main
 693                     	xdef	_LSIMeasurment
 694                     	xdef	_IWDG_Config
 695                     	xdef	_LsiFreq
 696                     	xref	_CAN_Initialize
 697                     	xref	_CAN_Process
 698                     	xref	_IR_Process
 699                     	xref	_IR_Init
 700                     	xref	_COMM_Init
 701                     	xref	_KEY_Init
 702                     	xref	_KEY_Process
 703                     	xdef	_putchar
 704                     	xdef	_assert_failed
 705                     	xref	_UART3_GetFlagStatus
 706                     	xref	_UART3_SendData8
 707                     	xref	_UART3_ITConfig
 708                     	xref	_UART3_Init
 709                     	xref	_UART3_DeInit
 710                     	xref	_TIM3_ClearFlag
 711                     	xref	_TIM3_GetCapture1
 712                     	xref	_TIM3_Cmd
 713                     	xref	_TIM3_ICInit
 714                     	xref	_IWDG_Enable
 715                     	xref	_IWDG_ReloadCounter
 716                     	xref	_IWDG_SetReload
 717                     	xref	_IWDG_SetPrescaler
 718                     	xref	_IWDG_WriteAccessCmd
 719                     	xref	_GPIO_WriteHigh
 720                     	xref	_GPIO_Init
 721                     	xref	_GPIO_DeInit
 722                     	xref	_CLK_GetClockFreq
 723                     	xref	_CLK_SYSCLKConfig
 724                     	xref	_CLK_HSIPrescalerConfig
 725                     	xref	_CLK_PeripheralClockConfig
 726                     	xref	_CLK_HSICmd
 727                     	xref.b	c_lreg
 728                     	xref.b	c_x
 747                     	xref	c_ludv
 748                     	xref	c_uitolx
 749                     	xref	c_llsh
 750                     	xref	c_rtol
 751                     	xref	c_lursh
 752                     	xref	c_ltor
 753                     	end

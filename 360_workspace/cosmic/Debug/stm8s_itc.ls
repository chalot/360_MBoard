   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 44 uint8_t ITC_GetCPUCC(void)
  43                     ; 45 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 47   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 48   _asm("pop a");
  58  0001 84            pop a
  60                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 74 void ITC_DeInit(void)
  86                     ; 75 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 84 }
 119  0023 81            	ret
 144                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 92 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 431                     .const:	section	.text
 432  0000               L62:
 433  0000 0065          	dc.w	L14
 434  0002 0065          	dc.w	L14
 435  0004 0065          	dc.w	L14
 436  0006 0065          	dc.w	L14
 437  0008 006e          	dc.w	L34
 438  000a 006e          	dc.w	L34
 439  000c 006e          	dc.w	L34
 440  000e 006e          	dc.w	L34
 441  0010 0077          	dc.w	L54
 442  0012 0077          	dc.w	L54
 443  0014 0077          	dc.w	L54
 444  0016 0077          	dc.w	L54
 445  0018 0080          	dc.w	L74
 446  001a 0080          	dc.w	L74
 447  001c 0080          	dc.w	L74
 448  001e 0080          	dc.w	L74
 449  0020 0089          	dc.w	L15
 450  0022 0089          	dc.w	L15
 451  0024 0089          	dc.w	L15
 452  0026 0089          	dc.w	L15
 453  0028 0092          	dc.w	L35
 454  002a 0092          	dc.w	L35
 455  002c 0092          	dc.w	L35
 456  002e 0092          	dc.w	L35
 457  0030 009b          	dc.w	L55
 458                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 458                     ; 102 {
 459                     	switch	.text
 460  0029               _ITC_GetSoftwarePriority:
 462  0029 88            	push	a
 463  002a 89            	pushw	x
 464       00000002      OFST:	set	2
 467                     ; 104     uint8_t Value = 0;
 469  002b 0f02          	clr	(OFST+0,sp)
 470                     ; 105     uint8_t Mask = 0;
 472                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 474  002d a119          	cp	a,#25
 475  002f 2403          	jruge	L41
 476  0031 4f            	clr	a
 477  0032 2010          	jra	L61
 478  0034               L41:
 479  0034 ae006c        	ldw	x,#108
 480  0037 89            	pushw	x
 481  0038 ae0000        	ldw	x,#0
 482  003b 89            	pushw	x
 483  003c ae0064        	ldw	x,#L502
 484  003f cd0000        	call	_assert_failed
 486  0042 5b04          	addw	sp,#4
 487  0044               L61:
 488                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 490  0044 7b03          	ld	a,(OFST+1,sp)
 491  0046 a403          	and	a,#3
 492  0048 48            	sll	a
 493  0049 5f            	clrw	x
 494  004a 97            	ld	xl,a
 495  004b a603          	ld	a,#3
 496  004d 5d            	tnzw	x
 497  004e 2704          	jreq	L02
 498  0050               L22:
 499  0050 48            	sll	a
 500  0051 5a            	decw	x
 501  0052 26fc          	jrne	L22
 502  0054               L02:
 503  0054 6b01          	ld	(OFST-1,sp),a
 504                     ; 113     switch (IrqNum)
 506  0056 7b03          	ld	a,(OFST+1,sp)
 508                     ; 185     default:
 508                     ; 186         break;
 509  0058 a119          	cp	a,#25
 510  005a 2407          	jruge	L42
 511  005c 5f            	clrw	x
 512  005d 97            	ld	xl,a
 513  005e 58            	sllw	x
 514  005f de0000        	ldw	x,(L62,x)
 515  0062 fc            	jp	(x)
 516  0063               L42:
 517  0063 203d          	jra	L112
 518  0065               L14:
 519                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 519                     ; 116     case ITC_IRQ_AWU:
 519                     ; 117     case ITC_IRQ_CLK:
 519                     ; 118     case ITC_IRQ_PORTA:
 519                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 521  0065 c67f70        	ld	a,32624
 522  0068 1401          	and	a,(OFST-1,sp)
 523  006a 6b02          	ld	(OFST+0,sp),a
 524                     ; 120         break;
 526  006c 2034          	jra	L112
 527  006e               L34:
 528                     ; 121     case ITC_IRQ_PORTB:
 528                     ; 122     case ITC_IRQ_PORTC:
 528                     ; 123     case ITC_IRQ_PORTD:
 528                     ; 124     case ITC_IRQ_PORTE:
 528                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 530  006e c67f71        	ld	a,32625
 531  0071 1401          	and	a,(OFST-1,sp)
 532  0073 6b02          	ld	(OFST+0,sp),a
 533                     ; 126         break;
 535  0075 202b          	jra	L112
 536  0077               L54:
 537                     ; 128     case ITC_IRQ_CAN_RX:
 537                     ; 129     case ITC_IRQ_CAN_TX:
 537                     ; 130 #endif /*STM8S208 or STM8AF52Ax */
 537                     ; 131 
 537                     ; 132 #ifdef STM8S903
 537                     ; 133     case ITC_IRQ_PORTF:
 537                     ; 134 #endif /*STM8S903*/
 537                     ; 135 
 537                     ; 136     case ITC_IRQ_SPI:
 537                     ; 137     case ITC_IRQ_TIM1_OVF:
 537                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 539  0077 c67f72        	ld	a,32626
 540  007a 1401          	and	a,(OFST-1,sp)
 541  007c 6b02          	ld	(OFST+0,sp),a
 542                     ; 139         break;
 544  007e 2022          	jra	L112
 545  0080               L74:
 546                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 546                     ; 141 #ifdef STM8S903
 546                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 546                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 546                     ; 144 #else
 546                     ; 145     case ITC_IRQ_TIM2_OVF:
 546                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 546                     ; 147 #endif /*STM8S903*/
 546                     ; 148 
 546                     ; 149     case ITC_IRQ_TIM3_OVF:
 546                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 548  0080 c67f73        	ld	a,32627
 549  0083 1401          	and	a,(OFST-1,sp)
 550  0085 6b02          	ld	(OFST+0,sp),a
 551                     ; 151         break;
 553  0087 2019          	jra	L112
 554  0089               L15:
 555                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 555                     ; 153     case ITC_IRQ_UART1_TX:
 555                     ; 154     case ITC_IRQ_UART1_RX:
 555                     ; 155     case ITC_IRQ_I2C:
 555                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 557  0089 c67f74        	ld	a,32628
 558  008c 1401          	and	a,(OFST-1,sp)
 559  008e 6b02          	ld	(OFST+0,sp),a
 560                     ; 157         break;
 562  0090 2010          	jra	L112
 563  0092               L35:
 564                     ; 165     case ITC_IRQ_UART3_TX:
 564                     ; 166     case ITC_IRQ_UART3_RX:
 564                     ; 167     case ITC_IRQ_ADC2:
 564                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 564                     ; 169 
 564                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 564                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 564                     ; 172     case ITC_IRQ_ADC1:
 564                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 564                     ; 174 
 564                     ; 175 #ifdef STM8S903
 564                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 564                     ; 177 #else
 564                     ; 178     case ITC_IRQ_TIM4_OVF:
 564                     ; 179 #endif /*STM8S903*/
 564                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 566  0092 c67f75        	ld	a,32629
 567  0095 1401          	and	a,(OFST-1,sp)
 568  0097 6b02          	ld	(OFST+0,sp),a
 569                     ; 181         break;
 571  0099 2007          	jra	L112
 572  009b               L55:
 573                     ; 182     case ITC_IRQ_EEPROM_EEC:
 573                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 575  009b c67f76        	ld	a,32630
 576  009e 1401          	and	a,(OFST-1,sp)
 577  00a0 6b02          	ld	(OFST+0,sp),a
 578                     ; 184         break;
 580  00a2               L75:
 581                     ; 185     default:
 581                     ; 186         break;
 583  00a2               L112:
 584                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 586  00a2 7b03          	ld	a,(OFST+1,sp)
 587  00a4 a403          	and	a,#3
 588  00a6 48            	sll	a
 589  00a7 5f            	clrw	x
 590  00a8 97            	ld	xl,a
 591  00a9 7b02          	ld	a,(OFST+0,sp)
 592  00ab 5d            	tnzw	x
 593  00ac 2704          	jreq	L03
 594  00ae               L23:
 595  00ae 44            	srl	a
 596  00af 5a            	decw	x
 597  00b0 26fc          	jrne	L23
 598  00b2               L03:
 599  00b2 6b02          	ld	(OFST+0,sp),a
 600                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 602  00b4 7b02          	ld	a,(OFST+0,sp)
 605  00b6 5b03          	addw	sp,#3
 606  00b8 81            	ret
 668                     	switch	.const
 669  0032               L66:
 670  0032 014a          	dc.w	L312
 671  0034 014a          	dc.w	L312
 672  0036 014a          	dc.w	L312
 673  0038 014a          	dc.w	L312
 674  003a 015c          	dc.w	L512
 675  003c 015c          	dc.w	L512
 676  003e 015c          	dc.w	L512
 677  0040 015c          	dc.w	L512
 678  0042 016e          	dc.w	L712
 679  0044 016e          	dc.w	L712
 680  0046 016e          	dc.w	L712
 681  0048 016e          	dc.w	L712
 682  004a 0180          	dc.w	L122
 683  004c 0180          	dc.w	L122
 684  004e 0180          	dc.w	L122
 685  0050 0180          	dc.w	L122
 686  0052 0192          	dc.w	L322
 687  0054 0192          	dc.w	L322
 688  0056 0192          	dc.w	L322
 689  0058 0192          	dc.w	L322
 690  005a 01a4          	dc.w	L522
 691  005c 01a4          	dc.w	L522
 692  005e 01a4          	dc.w	L522
 693  0060 01a4          	dc.w	L522
 694  0062 01b6          	dc.w	L722
 695                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 695                     ; 209 {
 696                     	switch	.text
 697  00b9               _ITC_SetSoftwarePriority:
 699  00b9 89            	pushw	x
 700  00ba 89            	pushw	x
 701       00000002      OFST:	set	2
 704                     ; 211     uint8_t Mask = 0;
 706                     ; 212     uint8_t NewPriority = 0;
 708                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 710  00bb 9e            	ld	a,xh
 711  00bc a119          	cp	a,#25
 712  00be 2403          	jruge	L63
 713  00c0 4f            	clr	a
 714  00c1 2010          	jra	L04
 715  00c3               L63:
 716  00c3 ae00d7        	ldw	x,#215
 717  00c6 89            	pushw	x
 718  00c7 ae0000        	ldw	x,#0
 719  00ca 89            	pushw	x
 720  00cb ae0064        	ldw	x,#L502
 721  00ce cd0000        	call	_assert_failed
 723  00d1 5b04          	addw	sp,#4
 724  00d3               L04:
 725                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 727  00d3 7b04          	ld	a,(OFST+2,sp)
 728  00d5 a102          	cp	a,#2
 729  00d7 2710          	jreq	L44
 730  00d9 7b04          	ld	a,(OFST+2,sp)
 731  00db a101          	cp	a,#1
 732  00dd 270a          	jreq	L44
 733  00df 0d04          	tnz	(OFST+2,sp)
 734  00e1 2706          	jreq	L44
 735  00e3 7b04          	ld	a,(OFST+2,sp)
 736  00e5 a103          	cp	a,#3
 737  00e7 2603          	jrne	L24
 738  00e9               L44:
 739  00e9 4f            	clr	a
 740  00ea 2010          	jra	L64
 741  00ec               L24:
 742  00ec ae00d8        	ldw	x,#216
 743  00ef 89            	pushw	x
 744  00f0 ae0000        	ldw	x,#0
 745  00f3 89            	pushw	x
 746  00f4 ae0064        	ldw	x,#L502
 747  00f7 cd0000        	call	_assert_failed
 749  00fa 5b04          	addw	sp,#4
 750  00fc               L64:
 751                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 753  00fc cd0024        	call	_ITC_GetSoftIntStatus
 755  00ff a128          	cp	a,#40
 756  0101 2603          	jrne	L05
 757  0103 4f            	clr	a
 758  0104 2010          	jra	L25
 759  0106               L05:
 760  0106 ae00db        	ldw	x,#219
 761  0109 89            	pushw	x
 762  010a ae0000        	ldw	x,#0
 763  010d 89            	pushw	x
 764  010e ae0064        	ldw	x,#L502
 765  0111 cd0000        	call	_assert_failed
 767  0114 5b04          	addw	sp,#4
 768  0116               L25:
 769                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 771  0116 7b03          	ld	a,(OFST+1,sp)
 772  0118 a403          	and	a,#3
 773  011a 48            	sll	a
 774  011b 5f            	clrw	x
 775  011c 97            	ld	xl,a
 776  011d a603          	ld	a,#3
 777  011f 5d            	tnzw	x
 778  0120 2704          	jreq	L45
 779  0122               L65:
 780  0122 48            	sll	a
 781  0123 5a            	decw	x
 782  0124 26fc          	jrne	L65
 783  0126               L45:
 784  0126 43            	cpl	a
 785  0127 6b01          	ld	(OFST-1,sp),a
 786                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 788  0129 7b03          	ld	a,(OFST+1,sp)
 789  012b a403          	and	a,#3
 790  012d 48            	sll	a
 791  012e 5f            	clrw	x
 792  012f 97            	ld	xl,a
 793  0130 7b04          	ld	a,(OFST+2,sp)
 794  0132 5d            	tnzw	x
 795  0133 2704          	jreq	L06
 796  0135               L26:
 797  0135 48            	sll	a
 798  0136 5a            	decw	x
 799  0137 26fc          	jrne	L26
 800  0139               L06:
 801  0139 6b02          	ld	(OFST+0,sp),a
 802                     ; 228     switch (IrqNum)
 804  013b 7b03          	ld	a,(OFST+1,sp)
 806                     ; 314     default:
 806                     ; 315         break;
 807  013d a119          	cp	a,#25
 808  013f 2407          	jruge	L46
 809  0141 5f            	clrw	x
 810  0142 97            	ld	xl,a
 811  0143 58            	sllw	x
 812  0144 de0032        	ldw	x,(L66,x)
 813  0147 fc            	jp	(x)
 814  0148               L46:
 815  0148 207c          	jra	L362
 816  014a               L312:
 817                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 817                     ; 232     case ITC_IRQ_AWU:
 817                     ; 233     case ITC_IRQ_CLK:
 817                     ; 234     case ITC_IRQ_PORTA:
 817                     ; 235         ITC->ISPR1 &= Mask;
 819  014a c67f70        	ld	a,32624
 820  014d 1401          	and	a,(OFST-1,sp)
 821  014f c77f70        	ld	32624,a
 822                     ; 236         ITC->ISPR1 |= NewPriority;
 824  0152 c67f70        	ld	a,32624
 825  0155 1a02          	or	a,(OFST+0,sp)
 826  0157 c77f70        	ld	32624,a
 827                     ; 237         break;
 829  015a 206a          	jra	L362
 830  015c               L512:
 831                     ; 239     case ITC_IRQ_PORTB:
 831                     ; 240     case ITC_IRQ_PORTC:
 831                     ; 241     case ITC_IRQ_PORTD:
 831                     ; 242     case ITC_IRQ_PORTE:
 831                     ; 243         ITC->ISPR2 &= Mask;
 833  015c c67f71        	ld	a,32625
 834  015f 1401          	and	a,(OFST-1,sp)
 835  0161 c77f71        	ld	32625,a
 836                     ; 244         ITC->ISPR2 |= NewPriority;
 838  0164 c67f71        	ld	a,32625
 839  0167 1a02          	or	a,(OFST+0,sp)
 840  0169 c77f71        	ld	32625,a
 841                     ; 245         break;
 843  016c 2058          	jra	L362
 844  016e               L712:
 845                     ; 248     case ITC_IRQ_CAN_RX:
 845                     ; 249     case ITC_IRQ_CAN_TX:
 845                     ; 250 #endif /*STM8S208 or STM8AF52Ax */
 845                     ; 251 
 845                     ; 252 #ifdef STM8S903
 845                     ; 253     case ITC_IRQ_PORTF:
 845                     ; 254 #endif /*STM8S903*/
 845                     ; 255     case ITC_IRQ_SPI:
 845                     ; 256     case ITC_IRQ_TIM1_OVF:
 845                     ; 257         ITC->ISPR3 &= Mask;
 847  016e c67f72        	ld	a,32626
 848  0171 1401          	and	a,(OFST-1,sp)
 849  0173 c77f72        	ld	32626,a
 850                     ; 258         ITC->ISPR3 |= NewPriority;
 852  0176 c67f72        	ld	a,32626
 853  0179 1a02          	or	a,(OFST+0,sp)
 854  017b c77f72        	ld	32626,a
 855                     ; 259         break;
 857  017e 2046          	jra	L362
 858  0180               L122:
 859                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 859                     ; 262 #ifdef STM8S903
 859                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 859                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 859                     ; 265 #else
 859                     ; 266     case ITC_IRQ_TIM2_OVF:
 859                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 859                     ; 268 #endif /*STM8S903*/
 859                     ; 269 
 859                     ; 270     case ITC_IRQ_TIM3_OVF:
 859                     ; 271         ITC->ISPR4 &= Mask;
 861  0180 c67f73        	ld	a,32627
 862  0183 1401          	and	a,(OFST-1,sp)
 863  0185 c77f73        	ld	32627,a
 864                     ; 272         ITC->ISPR4 |= NewPriority;
 866  0188 c67f73        	ld	a,32627
 867  018b 1a02          	or	a,(OFST+0,sp)
 868  018d c77f73        	ld	32627,a
 869                     ; 273         break;
 871  0190 2034          	jra	L362
 872  0192               L322:
 873                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 873                     ; 276     case ITC_IRQ_UART1_TX:
 873                     ; 277     case ITC_IRQ_UART1_RX:
 873                     ; 278     case ITC_IRQ_I2C:
 873                     ; 279         ITC->ISPR5 &= Mask;
 875  0192 c67f74        	ld	a,32628
 876  0195 1401          	and	a,(OFST-1,sp)
 877  0197 c77f74        	ld	32628,a
 878                     ; 280         ITC->ISPR5 |= NewPriority;
 880  019a c67f74        	ld	a,32628
 881  019d 1a02          	or	a,(OFST+0,sp)
 882  019f c77f74        	ld	32628,a
 883                     ; 281         break;
 885  01a2 2022          	jra	L362
 886  01a4               L522:
 887                     ; 290     case ITC_IRQ_UART3_TX:
 887                     ; 291     case ITC_IRQ_UART3_RX:
 887                     ; 292     case ITC_IRQ_ADC2:
 887                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 887                     ; 294 
 887                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 887                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 887                     ; 297     case ITC_IRQ_ADC1:
 887                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 887                     ; 299 
 887                     ; 300 #ifdef STM8S903
 887                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 887                     ; 302 #else
 887                     ; 303     case ITC_IRQ_TIM4_OVF:
 887                     ; 304 #endif /*STM8S903*/
 887                     ; 305         ITC->ISPR6 &= Mask;
 889  01a4 c67f75        	ld	a,32629
 890  01a7 1401          	and	a,(OFST-1,sp)
 891  01a9 c77f75        	ld	32629,a
 892                     ; 306         ITC->ISPR6 |= NewPriority;
 894  01ac c67f75        	ld	a,32629
 895  01af 1a02          	or	a,(OFST+0,sp)
 896  01b1 c77f75        	ld	32629,a
 897                     ; 307         break;
 899  01b4 2010          	jra	L362
 900  01b6               L722:
 901                     ; 309     case ITC_IRQ_EEPROM_EEC:
 901                     ; 310         ITC->ISPR7 &= Mask;
 903  01b6 c67f76        	ld	a,32630
 904  01b9 1401          	and	a,(OFST-1,sp)
 905  01bb c77f76        	ld	32630,a
 906                     ; 311         ITC->ISPR7 |= NewPriority;
 908  01be c67f76        	ld	a,32630
 909  01c1 1a02          	or	a,(OFST+0,sp)
 910  01c3 c77f76        	ld	32630,a
 911                     ; 312         break;
 913  01c6               L132:
 914                     ; 314     default:
 914                     ; 315         break;
 916  01c6               L362:
 917                     ; 319 }
 920  01c6 5b04          	addw	sp,#4
 921  01c8 81            	ret
 934                     	xdef	_ITC_GetSoftwarePriority
 935                     	xdef	_ITC_SetSoftwarePriority
 936                     	xdef	_ITC_GetSoftIntStatus
 937                     	xdef	_ITC_DeInit
 938                     	xdef	_ITC_GetCPUCC
 939                     	xref	_assert_failed
 940                     	switch	.const
 941  0064               L502:
 942  0064 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_i"
 943  0076 74632e6300    	dc.b	"tc.c",0
 963                     	end

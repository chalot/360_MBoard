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
 435                     .const:	section	.text
 436  0000               L62:
 437  0000 0065          	dc.w	L14
 438  0002 0065          	dc.w	L14
 439  0004 0065          	dc.w	L14
 440  0006 0065          	dc.w	L14
 441  0008 006e          	dc.w	L34
 442  000a 006e          	dc.w	L34
 443  000c 006e          	dc.w	L34
 444  000e 006e          	dc.w	L34
 445  0010 0077          	dc.w	L54
 446  0012 0077          	dc.w	L54
 447  0014 0077          	dc.w	L54
 448  0016 0077          	dc.w	L54
 449  0018 0080          	dc.w	L74
 450  001a 0080          	dc.w	L74
 451  001c 0080          	dc.w	L74
 452  001e 0080          	dc.w	L74
 453  0020 0089          	dc.w	L15
 454  0022 0089          	dc.w	L15
 455  0024 0089          	dc.w	L15
 456  0026 0089          	dc.w	L15
 457  0028 0092          	dc.w	L35
 458  002a 0092          	dc.w	L35
 459  002c 0092          	dc.w	L35
 460  002e 0092          	dc.w	L35
 461  0030 009b          	dc.w	L55
 462                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 462                     ; 102 {
 463                     	switch	.text
 464  0029               _ITC_GetSoftwarePriority:
 466  0029 88            	push	a
 467  002a 89            	pushw	x
 468       00000002      OFST:	set	2
 471                     ; 104     uint8_t Value = 0;
 473  002b 0f02          	clr	(OFST+0,sp)
 474                     ; 105     uint8_t Mask = 0;
 476                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 478  002d a119          	cp	a,#25
 479  002f 2403          	jruge	L41
 480  0031 4f            	clr	a
 481  0032 2010          	jra	L61
 482  0034               L41:
 483  0034 ae006c        	ldw	x,#108
 484  0037 89            	pushw	x
 485  0038 ae0000        	ldw	x,#0
 486  003b 89            	pushw	x
 487  003c ae0064        	ldw	x,#L112
 488  003f cd0000        	call	_assert_failed
 490  0042 5b04          	addw	sp,#4
 491  0044               L61:
 492                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 494  0044 7b03          	ld	a,(OFST+1,sp)
 495  0046 a403          	and	a,#3
 496  0048 48            	sll	a
 497  0049 5f            	clrw	x
 498  004a 97            	ld	xl,a
 499  004b a603          	ld	a,#3
 500  004d 5d            	tnzw	x
 501  004e 2704          	jreq	L02
 502  0050               L22:
 503  0050 48            	sll	a
 504  0051 5a            	decw	x
 505  0052 26fc          	jrne	L22
 506  0054               L02:
 507  0054 6b01          	ld	(OFST-1,sp),a
 508                     ; 113     switch (IrqNum)
 510  0056 7b03          	ld	a,(OFST+1,sp)
 512                     ; 185     default:
 512                     ; 186         break;
 513  0058 a119          	cp	a,#25
 514  005a 2407          	jruge	L42
 515  005c 5f            	clrw	x
 516  005d 97            	ld	xl,a
 517  005e 58            	sllw	x
 518  005f de0000        	ldw	x,(L62,x)
 519  0062 fc            	jp	(x)
 520  0063               L42:
 521  0063 203d          	jra	L512
 522  0065               L14:
 523                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 523                     ; 116     case ITC_IRQ_AWU:
 523                     ; 117     case ITC_IRQ_CLK:
 523                     ; 118     case ITC_IRQ_PORTA:
 523                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 525  0065 c67f70        	ld	a,32624
 526  0068 1401          	and	a,(OFST-1,sp)
 527  006a 6b02          	ld	(OFST+0,sp),a
 528                     ; 120         break;
 530  006c 2034          	jra	L512
 531  006e               L34:
 532                     ; 121     case ITC_IRQ_PORTB:
 532                     ; 122     case ITC_IRQ_PORTC:
 532                     ; 123     case ITC_IRQ_PORTD:
 532                     ; 124     case ITC_IRQ_PORTE:
 532                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 534  006e c67f71        	ld	a,32625
 535  0071 1401          	and	a,(OFST-1,sp)
 536  0073 6b02          	ld	(OFST+0,sp),a
 537                     ; 126         break;
 539  0075 202b          	jra	L512
 540  0077               L54:
 541                     ; 128     case ITC_IRQ_CAN_RX:
 541                     ; 129     case ITC_IRQ_CAN_TX:
 541                     ; 130 #endif /*STM8S208 or STM8AF52Ax */
 541                     ; 131 
 541                     ; 132 #ifdef STM8S903
 541                     ; 133     case ITC_IRQ_PORTF:
 541                     ; 134 #endif /*STM8S903*/
 541                     ; 135 
 541                     ; 136     case ITC_IRQ_SPI:
 541                     ; 137     case ITC_IRQ_TIM1_OVF:
 541                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 543  0077 c67f72        	ld	a,32626
 544  007a 1401          	and	a,(OFST-1,sp)
 545  007c 6b02          	ld	(OFST+0,sp),a
 546                     ; 139         break;
 548  007e 2022          	jra	L512
 549  0080               L74:
 550                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 550                     ; 141 #ifdef STM8S903
 550                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 550                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 550                     ; 144 #else
 550                     ; 145     case ITC_IRQ_TIM2_OVF:
 550                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 550                     ; 147 #endif /*STM8S903*/
 550                     ; 148 
 550                     ; 149     case ITC_IRQ_TIM3_OVF:
 550                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 552  0080 c67f73        	ld	a,32627
 553  0083 1401          	and	a,(OFST-1,sp)
 554  0085 6b02          	ld	(OFST+0,sp),a
 555                     ; 151         break;
 557  0087 2019          	jra	L512
 558  0089               L15:
 559                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 559                     ; 153     case ITC_IRQ_UART1_TX:
 559                     ; 154     case ITC_IRQ_UART1_RX:
 559                     ; 155     case ITC_IRQ_I2C:
 559                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 561  0089 c67f74        	ld	a,32628
 562  008c 1401          	and	a,(OFST-1,sp)
 563  008e 6b02          	ld	(OFST+0,sp),a
 564                     ; 157         break;
 566  0090 2010          	jra	L512
 567  0092               L35:
 568                     ; 165     case ITC_IRQ_UART3_TX:
 568                     ; 166     case ITC_IRQ_UART3_RX:
 568                     ; 167     case ITC_IRQ_ADC2:
 568                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 568                     ; 169 
 568                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 568                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 568                     ; 172     case ITC_IRQ_ADC1:
 568                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 568                     ; 174 
 568                     ; 175 #ifdef STM8S903
 568                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 568                     ; 177 #else
 568                     ; 178     case ITC_IRQ_TIM4_OVF:
 568                     ; 179 #endif /*STM8S903*/
 568                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 570  0092 c67f75        	ld	a,32629
 571  0095 1401          	and	a,(OFST-1,sp)
 572  0097 6b02          	ld	(OFST+0,sp),a
 573                     ; 181         break;
 575  0099 2007          	jra	L512
 576  009b               L55:
 577                     ; 182     case ITC_IRQ_EEPROM_EEC:
 577                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 579  009b c67f76        	ld	a,32630
 580  009e 1401          	and	a,(OFST-1,sp)
 581  00a0 6b02          	ld	(OFST+0,sp),a
 582                     ; 184         break;
 584  00a2               L75:
 585                     ; 185     default:
 585                     ; 186         break;
 587  00a2               L512:
 588                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 590  00a2 7b03          	ld	a,(OFST+1,sp)
 591  00a4 a403          	and	a,#3
 592  00a6 48            	sll	a
 593  00a7 5f            	clrw	x
 594  00a8 97            	ld	xl,a
 595  00a9 7b02          	ld	a,(OFST+0,sp)
 596  00ab 5d            	tnzw	x
 597  00ac 2704          	jreq	L03
 598  00ae               L23:
 599  00ae 44            	srl	a
 600  00af 5a            	decw	x
 601  00b0 26fc          	jrne	L23
 602  00b2               L03:
 603  00b2 6b02          	ld	(OFST+0,sp),a
 604                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 606  00b4 7b02          	ld	a,(OFST+0,sp)
 609  00b6 5b03          	addw	sp,#3
 610  00b8 81            	ret
 676                     	switch	.const
 677  0032               L66:
 678  0032 014a          	dc.w	L712
 679  0034 014a          	dc.w	L712
 680  0036 014a          	dc.w	L712
 681  0038 014a          	dc.w	L712
 682  003a 015c          	dc.w	L122
 683  003c 015c          	dc.w	L122
 684  003e 015c          	dc.w	L122
 685  0040 015c          	dc.w	L122
 686  0042 016e          	dc.w	L322
 687  0044 016e          	dc.w	L322
 688  0046 016e          	dc.w	L322
 689  0048 016e          	dc.w	L322
 690  004a 0180          	dc.w	L522
 691  004c 0180          	dc.w	L522
 692  004e 0180          	dc.w	L522
 693  0050 0180          	dc.w	L522
 694  0052 0192          	dc.w	L722
 695  0054 0192          	dc.w	L722
 696  0056 0192          	dc.w	L722
 697  0058 0192          	dc.w	L722
 698  005a 01a4          	dc.w	L132
 699  005c 01a4          	dc.w	L132
 700  005e 01a4          	dc.w	L132
 701  0060 01a4          	dc.w	L132
 702  0062 01b6          	dc.w	L332
 703                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 703                     ; 209 {
 704                     	switch	.text
 705  00b9               _ITC_SetSoftwarePriority:
 707  00b9 89            	pushw	x
 708  00ba 89            	pushw	x
 709       00000002      OFST:	set	2
 712                     ; 211     uint8_t Mask = 0;
 714                     ; 212     uint8_t NewPriority = 0;
 716                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 718  00bb 9e            	ld	a,xh
 719  00bc a119          	cp	a,#25
 720  00be 2403          	jruge	L63
 721  00c0 4f            	clr	a
 722  00c1 2010          	jra	L04
 723  00c3               L63:
 724  00c3 ae00d7        	ldw	x,#215
 725  00c6 89            	pushw	x
 726  00c7 ae0000        	ldw	x,#0
 727  00ca 89            	pushw	x
 728  00cb ae0064        	ldw	x,#L112
 729  00ce cd0000        	call	_assert_failed
 731  00d1 5b04          	addw	sp,#4
 732  00d3               L04:
 733                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 735  00d3 7b04          	ld	a,(OFST+2,sp)
 736  00d5 a102          	cp	a,#2
 737  00d7 2710          	jreq	L44
 738  00d9 7b04          	ld	a,(OFST+2,sp)
 739  00db a101          	cp	a,#1
 740  00dd 270a          	jreq	L44
 741  00df 0d04          	tnz	(OFST+2,sp)
 742  00e1 2706          	jreq	L44
 743  00e3 7b04          	ld	a,(OFST+2,sp)
 744  00e5 a103          	cp	a,#3
 745  00e7 2603          	jrne	L24
 746  00e9               L44:
 747  00e9 4f            	clr	a
 748  00ea 2010          	jra	L64
 749  00ec               L24:
 750  00ec ae00d8        	ldw	x,#216
 751  00ef 89            	pushw	x
 752  00f0 ae0000        	ldw	x,#0
 753  00f3 89            	pushw	x
 754  00f4 ae0064        	ldw	x,#L112
 755  00f7 cd0000        	call	_assert_failed
 757  00fa 5b04          	addw	sp,#4
 758  00fc               L64:
 759                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 761  00fc cd0024        	call	_ITC_GetSoftIntStatus
 763  00ff a128          	cp	a,#40
 764  0101 2603          	jrne	L05
 765  0103 4f            	clr	a
 766  0104 2010          	jra	L25
 767  0106               L05:
 768  0106 ae00db        	ldw	x,#219
 769  0109 89            	pushw	x
 770  010a ae0000        	ldw	x,#0
 771  010d 89            	pushw	x
 772  010e ae0064        	ldw	x,#L112
 773  0111 cd0000        	call	_assert_failed
 775  0114 5b04          	addw	sp,#4
 776  0116               L25:
 777                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 779  0116 7b03          	ld	a,(OFST+1,sp)
 780  0118 a403          	and	a,#3
 781  011a 48            	sll	a
 782  011b 5f            	clrw	x
 783  011c 97            	ld	xl,a
 784  011d a603          	ld	a,#3
 785  011f 5d            	tnzw	x
 786  0120 2704          	jreq	L45
 787  0122               L65:
 788  0122 48            	sll	a
 789  0123 5a            	decw	x
 790  0124 26fc          	jrne	L65
 791  0126               L45:
 792  0126 43            	cpl	a
 793  0127 6b01          	ld	(OFST-1,sp),a
 794                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 796  0129 7b03          	ld	a,(OFST+1,sp)
 797  012b a403          	and	a,#3
 798  012d 48            	sll	a
 799  012e 5f            	clrw	x
 800  012f 97            	ld	xl,a
 801  0130 7b04          	ld	a,(OFST+2,sp)
 802  0132 5d            	tnzw	x
 803  0133 2704          	jreq	L06
 804  0135               L26:
 805  0135 48            	sll	a
 806  0136 5a            	decw	x
 807  0137 26fc          	jrne	L26
 808  0139               L06:
 809  0139 6b02          	ld	(OFST+0,sp),a
 810                     ; 228     switch (IrqNum)
 812  013b 7b03          	ld	a,(OFST+1,sp)
 814                     ; 314     default:
 814                     ; 315         break;
 815  013d a119          	cp	a,#25
 816  013f 2407          	jruge	L46
 817  0141 5f            	clrw	x
 818  0142 97            	ld	xl,a
 819  0143 58            	sllw	x
 820  0144 de0032        	ldw	x,(L66,x)
 821  0147 fc            	jp	(x)
 822  0148               L46:
 823  0148 207c          	jra	L372
 824  014a               L712:
 825                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 825                     ; 232     case ITC_IRQ_AWU:
 825                     ; 233     case ITC_IRQ_CLK:
 825                     ; 234     case ITC_IRQ_PORTA:
 825                     ; 235         ITC->ISPR1 &= Mask;
 827  014a c67f70        	ld	a,32624
 828  014d 1401          	and	a,(OFST-1,sp)
 829  014f c77f70        	ld	32624,a
 830                     ; 236         ITC->ISPR1 |= NewPriority;
 832  0152 c67f70        	ld	a,32624
 833  0155 1a02          	or	a,(OFST+0,sp)
 834  0157 c77f70        	ld	32624,a
 835                     ; 237         break;
 837  015a 206a          	jra	L372
 838  015c               L122:
 839                     ; 239     case ITC_IRQ_PORTB:
 839                     ; 240     case ITC_IRQ_PORTC:
 839                     ; 241     case ITC_IRQ_PORTD:
 839                     ; 242     case ITC_IRQ_PORTE:
 839                     ; 243         ITC->ISPR2 &= Mask;
 841  015c c67f71        	ld	a,32625
 842  015f 1401          	and	a,(OFST-1,sp)
 843  0161 c77f71        	ld	32625,a
 844                     ; 244         ITC->ISPR2 |= NewPriority;
 846  0164 c67f71        	ld	a,32625
 847  0167 1a02          	or	a,(OFST+0,sp)
 848  0169 c77f71        	ld	32625,a
 849                     ; 245         break;
 851  016c 2058          	jra	L372
 852  016e               L322:
 853                     ; 248     case ITC_IRQ_CAN_RX:
 853                     ; 249     case ITC_IRQ_CAN_TX:
 853                     ; 250 #endif /*STM8S208 or STM8AF52Ax */
 853                     ; 251 
 853                     ; 252 #ifdef STM8S903
 853                     ; 253     case ITC_IRQ_PORTF:
 853                     ; 254 #endif /*STM8S903*/
 853                     ; 255     case ITC_IRQ_SPI:
 853                     ; 256     case ITC_IRQ_TIM1_OVF:
 853                     ; 257         ITC->ISPR3 &= Mask;
 855  016e c67f72        	ld	a,32626
 856  0171 1401          	and	a,(OFST-1,sp)
 857  0173 c77f72        	ld	32626,a
 858                     ; 258         ITC->ISPR3 |= NewPriority;
 860  0176 c67f72        	ld	a,32626
 861  0179 1a02          	or	a,(OFST+0,sp)
 862  017b c77f72        	ld	32626,a
 863                     ; 259         break;
 865  017e 2046          	jra	L372
 866  0180               L522:
 867                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 867                     ; 262 #ifdef STM8S903
 867                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 867                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 867                     ; 265 #else
 867                     ; 266     case ITC_IRQ_TIM2_OVF:
 867                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 867                     ; 268 #endif /*STM8S903*/
 867                     ; 269 
 867                     ; 270     case ITC_IRQ_TIM3_OVF:
 867                     ; 271         ITC->ISPR4 &= Mask;
 869  0180 c67f73        	ld	a,32627
 870  0183 1401          	and	a,(OFST-1,sp)
 871  0185 c77f73        	ld	32627,a
 872                     ; 272         ITC->ISPR4 |= NewPriority;
 874  0188 c67f73        	ld	a,32627
 875  018b 1a02          	or	a,(OFST+0,sp)
 876  018d c77f73        	ld	32627,a
 877                     ; 273         break;
 879  0190 2034          	jra	L372
 880  0192               L722:
 881                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 881                     ; 276     case ITC_IRQ_UART1_TX:
 881                     ; 277     case ITC_IRQ_UART1_RX:
 881                     ; 278     case ITC_IRQ_I2C:
 881                     ; 279         ITC->ISPR5 &= Mask;
 883  0192 c67f74        	ld	a,32628
 884  0195 1401          	and	a,(OFST-1,sp)
 885  0197 c77f74        	ld	32628,a
 886                     ; 280         ITC->ISPR5 |= NewPriority;
 888  019a c67f74        	ld	a,32628
 889  019d 1a02          	or	a,(OFST+0,sp)
 890  019f c77f74        	ld	32628,a
 891                     ; 281         break;
 893  01a2 2022          	jra	L372
 894  01a4               L132:
 895                     ; 290     case ITC_IRQ_UART3_TX:
 895                     ; 291     case ITC_IRQ_UART3_RX:
 895                     ; 292     case ITC_IRQ_ADC2:
 895                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 895                     ; 294 
 895                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 895                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 895                     ; 297     case ITC_IRQ_ADC1:
 895                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 895                     ; 299 
 895                     ; 300 #ifdef STM8S903
 895                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 895                     ; 302 #else
 895                     ; 303     case ITC_IRQ_TIM4_OVF:
 895                     ; 304 #endif /*STM8S903*/
 895                     ; 305         ITC->ISPR6 &= Mask;
 897  01a4 c67f75        	ld	a,32629
 898  01a7 1401          	and	a,(OFST-1,sp)
 899  01a9 c77f75        	ld	32629,a
 900                     ; 306         ITC->ISPR6 |= NewPriority;
 902  01ac c67f75        	ld	a,32629
 903  01af 1a02          	or	a,(OFST+0,sp)
 904  01b1 c77f75        	ld	32629,a
 905                     ; 307         break;
 907  01b4 2010          	jra	L372
 908  01b6               L332:
 909                     ; 309     case ITC_IRQ_EEPROM_EEC:
 909                     ; 310         ITC->ISPR7 &= Mask;
 911  01b6 c67f76        	ld	a,32630
 912  01b9 1401          	and	a,(OFST-1,sp)
 913  01bb c77f76        	ld	32630,a
 914                     ; 311         ITC->ISPR7 |= NewPriority;
 916  01be c67f76        	ld	a,32630
 917  01c1 1a02          	or	a,(OFST+0,sp)
 918  01c3 c77f76        	ld	32630,a
 919                     ; 312         break;
 921  01c6               L532:
 922                     ; 314     default:
 922                     ; 315         break;
 924  01c6               L372:
 925                     ; 319 }
 928  01c6 5b04          	addw	sp,#4
 929  01c8 81            	ret
 942                     	xdef	_ITC_GetSoftwarePriority
 943                     	xdef	_ITC_SetSoftwarePriority
 944                     	xdef	_ITC_GetSoftIntStatus
 945                     	xdef	_ITC_DeInit
 946                     	xdef	_ITC_GetCPUCC
 947                     	xref	_assert_failed
 948                     	switch	.const
 949  0064               L112:
 950  0064 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_i"
 951  0076 74632e6300    	dc.b	"tc.c",0
 971                     	end

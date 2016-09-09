   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 46 void TIM2_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  58  0008 725f5303      	clr	21251
  59                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  61  000c 725f5308      	clr	21256
  62                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  64  0010 725f5309      	clr	21257
  65                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  0014 725f5308      	clr	21256
  68                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0018 725f5309      	clr	21257
  71                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  73  001c 725f5305      	clr	21253
  74                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  76  0020 725f5306      	clr	21254
  77                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  79  0024 725f5307      	clr	21255
  80                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  82  0028 725f530a      	clr	21258
  83                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  85  002c 725f530b      	clr	21259
  86                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  91  0034 35ff530d      	mov	21261,#255
  92                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  94  0038 35ff530e      	mov	21262,#255
  95                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  97  003c 725f530f      	clr	21263
  98                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 100  0040 725f5310      	clr	21264
 101                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 115  0054 725f5302      	clr	21250
 116                     ; 76 }
 119  0058 81            	ret
 285                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 285                     ; 86                         uint16_t TIM2_Period)
 285                     ; 87 {
 286                     	switch	.text
 287  0059               _TIM2_TimeBaseInit:
 289  0059 88            	push	a
 290       00000000      OFST:	set	0
 293                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 295  005a c7530c        	ld	21260,a
 296                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 298  005d 7b04          	ld	a,(OFST+4,sp)
 299  005f c7530d        	ld	21261,a
 300                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 302  0062 7b05          	ld	a,(OFST+5,sp)
 303  0064 c7530e        	ld	21262,a
 304                     ; 93 }
 307  0067 84            	pop	a
 308  0068 81            	ret
 464                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 464                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 464                     ; 106                   uint16_t TIM2_Pulse,
 464                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 464                     ; 108 {
 465                     	switch	.text
 466  0069               _TIM2_OC1Init:
 468  0069 89            	pushw	x
 469  006a 88            	push	a
 470       00000001      OFST:	set	1
 473                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 475  006b 9e            	ld	a,xh
 476  006c 4d            	tnz	a
 477  006d 2719          	jreq	L41
 478  006f 9e            	ld	a,xh
 479  0070 a110          	cp	a,#16
 480  0072 2714          	jreq	L41
 481  0074 9e            	ld	a,xh
 482  0075 a120          	cp	a,#32
 483  0077 270f          	jreq	L41
 484  0079 9e            	ld	a,xh
 485  007a a130          	cp	a,#48
 486  007c 270a          	jreq	L41
 487  007e 9e            	ld	a,xh
 488  007f a160          	cp	a,#96
 489  0081 2705          	jreq	L41
 490  0083 9e            	ld	a,xh
 491  0084 a170          	cp	a,#112
 492  0086 2603          	jrne	L21
 493  0088               L41:
 494  0088 4f            	clr	a
 495  0089 2010          	jra	L61
 496  008b               L21:
 497  008b ae006e        	ldw	x,#110
 498  008e 89            	pushw	x
 499  008f ae0000        	ldw	x,#0
 500  0092 89            	pushw	x
 501  0093 ae0000        	ldw	x,#L302
 502  0096 cd0000        	call	_assert_failed
 504  0099 5b04          	addw	sp,#4
 505  009b               L61:
 506                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 508  009b 0d03          	tnz	(OFST+2,sp)
 509  009d 2706          	jreq	L22
 510  009f 7b03          	ld	a,(OFST+2,sp)
 511  00a1 a111          	cp	a,#17
 512  00a3 2603          	jrne	L02
 513  00a5               L22:
 514  00a5 4f            	clr	a
 515  00a6 2010          	jra	L42
 516  00a8               L02:
 517  00a8 ae006f        	ldw	x,#111
 518  00ab 89            	pushw	x
 519  00ac ae0000        	ldw	x,#0
 520  00af 89            	pushw	x
 521  00b0 ae0000        	ldw	x,#L302
 522  00b3 cd0000        	call	_assert_failed
 524  00b6 5b04          	addw	sp,#4
 525  00b8               L42:
 526                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 528  00b8 0d08          	tnz	(OFST+7,sp)
 529  00ba 2706          	jreq	L03
 530  00bc 7b08          	ld	a,(OFST+7,sp)
 531  00be a122          	cp	a,#34
 532  00c0 2603          	jrne	L62
 533  00c2               L03:
 534  00c2 4f            	clr	a
 535  00c3 2010          	jra	L23
 536  00c5               L62:
 537  00c5 ae0070        	ldw	x,#112
 538  00c8 89            	pushw	x
 539  00c9 ae0000        	ldw	x,#0
 540  00cc 89            	pushw	x
 541  00cd ae0000        	ldw	x,#L302
 542  00d0 cd0000        	call	_assert_failed
 544  00d3 5b04          	addw	sp,#4
 545  00d5               L23:
 546                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 548  00d5 c65308        	ld	a,21256
 549  00d8 a4fc          	and	a,#252
 550  00da c75308        	ld	21256,a
 551                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 551                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 553  00dd 7b08          	ld	a,(OFST+7,sp)
 554  00df a402          	and	a,#2
 555  00e1 6b01          	ld	(OFST+0,sp),a
 556  00e3 7b03          	ld	a,(OFST+2,sp)
 557  00e5 a401          	and	a,#1
 558  00e7 1a01          	or	a,(OFST+0,sp)
 559  00e9 ca5308        	or	a,21256
 560  00ec c75308        	ld	21256,a
 561                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 561                     ; 122                             (uint8_t)TIM2_OCMode);
 563  00ef c65305        	ld	a,21253
 564  00f2 a48f          	and	a,#143
 565  00f4 1a02          	or	a,(OFST+1,sp)
 566  00f6 c75305        	ld	21253,a
 567                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 569  00f9 7b06          	ld	a,(OFST+5,sp)
 570  00fb c7530f        	ld	21263,a
 571                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 573  00fe 7b07          	ld	a,(OFST+6,sp)
 574  0100 c75310        	ld	21264,a
 575                     ; 127 }
 578  0103 5b03          	addw	sp,#3
 579  0105 81            	ret
 642                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 642                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 642                     ; 140                   uint16_t TIM2_Pulse,
 642                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 642                     ; 142 {
 643                     	switch	.text
 644  0106               _TIM2_OC2Init:
 646  0106 89            	pushw	x
 647  0107 88            	push	a
 648       00000001      OFST:	set	1
 651                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 653  0108 9e            	ld	a,xh
 654  0109 4d            	tnz	a
 655  010a 2719          	jreq	L04
 656  010c 9e            	ld	a,xh
 657  010d a110          	cp	a,#16
 658  010f 2714          	jreq	L04
 659  0111 9e            	ld	a,xh
 660  0112 a120          	cp	a,#32
 661  0114 270f          	jreq	L04
 662  0116 9e            	ld	a,xh
 663  0117 a130          	cp	a,#48
 664  0119 270a          	jreq	L04
 665  011b 9e            	ld	a,xh
 666  011c a160          	cp	a,#96
 667  011e 2705          	jreq	L04
 668  0120 9e            	ld	a,xh
 669  0121 a170          	cp	a,#112
 670  0123 2603          	jrne	L63
 671  0125               L04:
 672  0125 4f            	clr	a
 673  0126 2010          	jra	L24
 674  0128               L63:
 675  0128 ae0090        	ldw	x,#144
 676  012b 89            	pushw	x
 677  012c ae0000        	ldw	x,#0
 678  012f 89            	pushw	x
 679  0130 ae0000        	ldw	x,#L302
 680  0133 cd0000        	call	_assert_failed
 682  0136 5b04          	addw	sp,#4
 683  0138               L24:
 684                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 686  0138 0d03          	tnz	(OFST+2,sp)
 687  013a 2706          	jreq	L64
 688  013c 7b03          	ld	a,(OFST+2,sp)
 689  013e a111          	cp	a,#17
 690  0140 2603          	jrne	L44
 691  0142               L64:
 692  0142 4f            	clr	a
 693  0143 2010          	jra	L05
 694  0145               L44:
 695  0145 ae0091        	ldw	x,#145
 696  0148 89            	pushw	x
 697  0149 ae0000        	ldw	x,#0
 698  014c 89            	pushw	x
 699  014d ae0000        	ldw	x,#L302
 700  0150 cd0000        	call	_assert_failed
 702  0153 5b04          	addw	sp,#4
 703  0155               L05:
 704                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 706  0155 0d08          	tnz	(OFST+7,sp)
 707  0157 2706          	jreq	L45
 708  0159 7b08          	ld	a,(OFST+7,sp)
 709  015b a122          	cp	a,#34
 710  015d 2603          	jrne	L25
 711  015f               L45:
 712  015f 4f            	clr	a
 713  0160 2010          	jra	L65
 714  0162               L25:
 715  0162 ae0092        	ldw	x,#146
 716  0165 89            	pushw	x
 717  0166 ae0000        	ldw	x,#0
 718  0169 89            	pushw	x
 719  016a ae0000        	ldw	x,#L302
 720  016d cd0000        	call	_assert_failed
 722  0170 5b04          	addw	sp,#4
 723  0172               L65:
 724                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 726  0172 c65308        	ld	a,21256
 727  0175 a4cf          	and	a,#207
 728  0177 c75308        	ld	21256,a
 729                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 729                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 731  017a 7b08          	ld	a,(OFST+7,sp)
 732  017c a420          	and	a,#32
 733  017e 6b01          	ld	(OFST+0,sp),a
 734  0180 7b03          	ld	a,(OFST+2,sp)
 735  0182 a410          	and	a,#16
 736  0184 1a01          	or	a,(OFST+0,sp)
 737  0186 ca5308        	or	a,21256
 738  0189 c75308        	ld	21256,a
 739                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 739                     ; 158                             (uint8_t)TIM2_OCMode);
 741  018c c65306        	ld	a,21254
 742  018f a48f          	and	a,#143
 743  0191 1a02          	or	a,(OFST+1,sp)
 744  0193 c75306        	ld	21254,a
 745                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 747  0196 7b06          	ld	a,(OFST+5,sp)
 748  0198 c75311        	ld	21265,a
 749                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 751  019b 7b07          	ld	a,(OFST+6,sp)
 752  019d c75312        	ld	21266,a
 753                     ; 164 }
 756  01a0 5b03          	addw	sp,#3
 757  01a2 81            	ret
 820                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 820                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 820                     ; 177                   uint16_t TIM2_Pulse,
 820                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 820                     ; 179 {
 821                     	switch	.text
 822  01a3               _TIM2_OC3Init:
 824  01a3 89            	pushw	x
 825  01a4 88            	push	a
 826       00000001      OFST:	set	1
 829                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 831  01a5 9e            	ld	a,xh
 832  01a6 4d            	tnz	a
 833  01a7 2719          	jreq	L46
 834  01a9 9e            	ld	a,xh
 835  01aa a110          	cp	a,#16
 836  01ac 2714          	jreq	L46
 837  01ae 9e            	ld	a,xh
 838  01af a120          	cp	a,#32
 839  01b1 270f          	jreq	L46
 840  01b3 9e            	ld	a,xh
 841  01b4 a130          	cp	a,#48
 842  01b6 270a          	jreq	L46
 843  01b8 9e            	ld	a,xh
 844  01b9 a160          	cp	a,#96
 845  01bb 2705          	jreq	L46
 846  01bd 9e            	ld	a,xh
 847  01be a170          	cp	a,#112
 848  01c0 2603          	jrne	L26
 849  01c2               L46:
 850  01c2 4f            	clr	a
 851  01c3 2010          	jra	L66
 852  01c5               L26:
 853  01c5 ae00b5        	ldw	x,#181
 854  01c8 89            	pushw	x
 855  01c9 ae0000        	ldw	x,#0
 856  01cc 89            	pushw	x
 857  01cd ae0000        	ldw	x,#L302
 858  01d0 cd0000        	call	_assert_failed
 860  01d3 5b04          	addw	sp,#4
 861  01d5               L66:
 862                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 864  01d5 0d03          	tnz	(OFST+2,sp)
 865  01d7 2706          	jreq	L27
 866  01d9 7b03          	ld	a,(OFST+2,sp)
 867  01db a111          	cp	a,#17
 868  01dd 2603          	jrne	L07
 869  01df               L27:
 870  01df 4f            	clr	a
 871  01e0 2010          	jra	L47
 872  01e2               L07:
 873  01e2 ae00b6        	ldw	x,#182
 874  01e5 89            	pushw	x
 875  01e6 ae0000        	ldw	x,#0
 876  01e9 89            	pushw	x
 877  01ea ae0000        	ldw	x,#L302
 878  01ed cd0000        	call	_assert_failed
 880  01f0 5b04          	addw	sp,#4
 881  01f2               L47:
 882                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 884  01f2 0d08          	tnz	(OFST+7,sp)
 885  01f4 2706          	jreq	L001
 886  01f6 7b08          	ld	a,(OFST+7,sp)
 887  01f8 a122          	cp	a,#34
 888  01fa 2603          	jrne	L67
 889  01fc               L001:
 890  01fc 4f            	clr	a
 891  01fd 2010          	jra	L201
 892  01ff               L67:
 893  01ff ae00b7        	ldw	x,#183
 894  0202 89            	pushw	x
 895  0203 ae0000        	ldw	x,#0
 896  0206 89            	pushw	x
 897  0207 ae0000        	ldw	x,#L302
 898  020a cd0000        	call	_assert_failed
 900  020d 5b04          	addw	sp,#4
 901  020f               L201:
 902                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 904  020f c65309        	ld	a,21257
 905  0212 a4fc          	and	a,#252
 906  0214 c75309        	ld	21257,a
 907                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 907                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 909  0217 7b08          	ld	a,(OFST+7,sp)
 910  0219 a402          	and	a,#2
 911  021b 6b01          	ld	(OFST+0,sp),a
 912  021d 7b03          	ld	a,(OFST+2,sp)
 913  021f a401          	and	a,#1
 914  0221 1a01          	or	a,(OFST+0,sp)
 915  0223 ca5309        	or	a,21257
 916  0226 c75309        	ld	21257,a
 917                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 917                     ; 192                             (uint8_t)TIM2_OCMode);
 919  0229 c65307        	ld	a,21255
 920  022c a48f          	and	a,#143
 921  022e 1a02          	or	a,(OFST+1,sp)
 922  0230 c75307        	ld	21255,a
 923                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 925  0233 7b06          	ld	a,(OFST+5,sp)
 926  0235 c75313        	ld	21267,a
 927                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 929  0238 7b07          	ld	a,(OFST+6,sp)
 930  023a c75314        	ld	21268,a
 931                     ; 198 }
 934  023d 5b03          	addw	sp,#3
 935  023f 81            	ret
1127                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1127                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1127                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1127                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1127                     ; 214                  uint8_t TIM2_ICFilter)
1127                     ; 215 {
1128                     	switch	.text
1129  0240               _TIM2_ICInit:
1131  0240 89            	pushw	x
1132       00000000      OFST:	set	0
1135                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1137  0241 9e            	ld	a,xh
1138  0242 4d            	tnz	a
1139  0243 270a          	jreq	L011
1140  0245 9e            	ld	a,xh
1141  0246 a101          	cp	a,#1
1142  0248 2705          	jreq	L011
1143  024a 9e            	ld	a,xh
1144  024b a102          	cp	a,#2
1145  024d 2603          	jrne	L601
1146  024f               L011:
1147  024f 4f            	clr	a
1148  0250 2010          	jra	L211
1149  0252               L601:
1150  0252 ae00d9        	ldw	x,#217
1151  0255 89            	pushw	x
1152  0256 ae0000        	ldw	x,#0
1153  0259 89            	pushw	x
1154  025a ae0000        	ldw	x,#L302
1155  025d cd0000        	call	_assert_failed
1157  0260 5b04          	addw	sp,#4
1158  0262               L211:
1159                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1161  0262 0d02          	tnz	(OFST+2,sp)
1162  0264 2706          	jreq	L611
1163  0266 7b02          	ld	a,(OFST+2,sp)
1164  0268 a144          	cp	a,#68
1165  026a 2603          	jrne	L411
1166  026c               L611:
1167  026c 4f            	clr	a
1168  026d 2010          	jra	L021
1169  026f               L411:
1170  026f ae00da        	ldw	x,#218
1171  0272 89            	pushw	x
1172  0273 ae0000        	ldw	x,#0
1173  0276 89            	pushw	x
1174  0277 ae0000        	ldw	x,#L302
1175  027a cd0000        	call	_assert_failed
1177  027d 5b04          	addw	sp,#4
1178  027f               L021:
1179                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1181  027f 7b05          	ld	a,(OFST+5,sp)
1182  0281 a101          	cp	a,#1
1183  0283 270c          	jreq	L421
1184  0285 7b05          	ld	a,(OFST+5,sp)
1185  0287 a102          	cp	a,#2
1186  0289 2706          	jreq	L421
1187  028b 7b05          	ld	a,(OFST+5,sp)
1188  028d a103          	cp	a,#3
1189  028f 2603          	jrne	L221
1190  0291               L421:
1191  0291 4f            	clr	a
1192  0292 2010          	jra	L621
1193  0294               L221:
1194  0294 ae00db        	ldw	x,#219
1195  0297 89            	pushw	x
1196  0298 ae0000        	ldw	x,#0
1197  029b 89            	pushw	x
1198  029c ae0000        	ldw	x,#L302
1199  029f cd0000        	call	_assert_failed
1201  02a2 5b04          	addw	sp,#4
1202  02a4               L621:
1203                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1205  02a4 0d06          	tnz	(OFST+6,sp)
1206  02a6 2712          	jreq	L231
1207  02a8 7b06          	ld	a,(OFST+6,sp)
1208  02aa a104          	cp	a,#4
1209  02ac 270c          	jreq	L231
1210  02ae 7b06          	ld	a,(OFST+6,sp)
1211  02b0 a108          	cp	a,#8
1212  02b2 2706          	jreq	L231
1213  02b4 7b06          	ld	a,(OFST+6,sp)
1214  02b6 a10c          	cp	a,#12
1215  02b8 2603          	jrne	L031
1216  02ba               L231:
1217  02ba 4f            	clr	a
1218  02bb 2010          	jra	L431
1219  02bd               L031:
1220  02bd ae00dc        	ldw	x,#220
1221  02c0 89            	pushw	x
1222  02c1 ae0000        	ldw	x,#0
1223  02c4 89            	pushw	x
1224  02c5 ae0000        	ldw	x,#L302
1225  02c8 cd0000        	call	_assert_failed
1227  02cb 5b04          	addw	sp,#4
1228  02cd               L431:
1229                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1231  02cd 7b07          	ld	a,(OFST+7,sp)
1232  02cf a110          	cp	a,#16
1233  02d1 2403          	jruge	L631
1234  02d3 4f            	clr	a
1235  02d4 2010          	jra	L041
1236  02d6               L631:
1237  02d6 ae00dd        	ldw	x,#221
1238  02d9 89            	pushw	x
1239  02da ae0000        	ldw	x,#0
1240  02dd 89            	pushw	x
1241  02de ae0000        	ldw	x,#L302
1242  02e1 cd0000        	call	_assert_failed
1244  02e4 5b04          	addw	sp,#4
1245  02e6               L041:
1246                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
1248  02e6 0d01          	tnz	(OFST+1,sp)
1249  02e8 2614          	jrne	L173
1250                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
1250                     ; 227                    (uint8_t)TIM2_ICSelection,
1250                     ; 228                    (uint8_t)TIM2_ICFilter);
1252  02ea 7b07          	ld	a,(OFST+7,sp)
1253  02ec 88            	push	a
1254  02ed 7b06          	ld	a,(OFST+6,sp)
1255  02ef 97            	ld	xl,a
1256  02f0 7b03          	ld	a,(OFST+3,sp)
1257  02f2 95            	ld	xh,a
1258  02f3 cd0ad3        	call	L3_TI1_Config
1260  02f6 84            	pop	a
1261                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1263  02f7 7b06          	ld	a,(OFST+6,sp)
1264  02f9 cd08c3        	call	_TIM2_SetIC1Prescaler
1267  02fc 202c          	jra	L373
1268  02fe               L173:
1269                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
1271  02fe 7b01          	ld	a,(OFST+1,sp)
1272  0300 a101          	cp	a,#1
1273  0302 2614          	jrne	L573
1274                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
1274                     ; 237                    (uint8_t)TIM2_ICSelection,
1274                     ; 238                    (uint8_t)TIM2_ICFilter);
1276  0304 7b07          	ld	a,(OFST+7,sp)
1277  0306 88            	push	a
1278  0307 7b06          	ld	a,(OFST+6,sp)
1279  0309 97            	ld	xl,a
1280  030a 7b03          	ld	a,(OFST+3,sp)
1281  030c 95            	ld	xh,a
1282  030d cd0b03        	call	L5_TI2_Config
1284  0310 84            	pop	a
1285                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1287  0311 7b06          	ld	a,(OFST+6,sp)
1288  0313 cd08f2        	call	_TIM2_SetIC2Prescaler
1291  0316 2012          	jra	L373
1292  0318               L573:
1293                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1293                     ; 247                    (uint8_t)TIM2_ICSelection,
1293                     ; 248                    (uint8_t)TIM2_ICFilter);
1295  0318 7b07          	ld	a,(OFST+7,sp)
1296  031a 88            	push	a
1297  031b 7b06          	ld	a,(OFST+6,sp)
1298  031d 97            	ld	xl,a
1299  031e 7b03          	ld	a,(OFST+3,sp)
1300  0320 95            	ld	xh,a
1301  0321 cd0b33        	call	L7_TI3_Config
1303  0324 84            	pop	a
1304                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1306  0325 7b06          	ld	a,(OFST+6,sp)
1307  0327 cd0921        	call	_TIM2_SetIC3Prescaler
1309  032a               L373:
1310                     ; 253 }
1313  032a 85            	popw	x
1314  032b 81            	ret
1405                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1405                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1405                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1405                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1405                     ; 269                      uint8_t TIM2_ICFilter)
1405                     ; 270 {
1406                     	switch	.text
1407  032c               _TIM2_PWMIConfig:
1409  032c 89            	pushw	x
1410  032d 89            	pushw	x
1411       00000002      OFST:	set	2
1414                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1416                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1418                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1420  032e 9e            	ld	a,xh
1421  032f 4d            	tnz	a
1422  0330 2705          	jreq	L641
1423  0332 9e            	ld	a,xh
1424  0333 a101          	cp	a,#1
1425  0335 2603          	jrne	L441
1426  0337               L641:
1427  0337 4f            	clr	a
1428  0338 2010          	jra	L051
1429  033a               L441:
1430  033a ae0113        	ldw	x,#275
1431  033d 89            	pushw	x
1432  033e ae0000        	ldw	x,#0
1433  0341 89            	pushw	x
1434  0342 ae0000        	ldw	x,#L302
1435  0345 cd0000        	call	_assert_failed
1437  0348 5b04          	addw	sp,#4
1438  034a               L051:
1439                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1441  034a 0d04          	tnz	(OFST+2,sp)
1442  034c 2706          	jreq	L451
1443  034e 7b04          	ld	a,(OFST+2,sp)
1444  0350 a144          	cp	a,#68
1445  0352 2603          	jrne	L251
1446  0354               L451:
1447  0354 4f            	clr	a
1448  0355 2010          	jra	L651
1449  0357               L251:
1450  0357 ae0114        	ldw	x,#276
1451  035a 89            	pushw	x
1452  035b ae0000        	ldw	x,#0
1453  035e 89            	pushw	x
1454  035f ae0000        	ldw	x,#L302
1455  0362 cd0000        	call	_assert_failed
1457  0365 5b04          	addw	sp,#4
1458  0367               L651:
1459                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1461  0367 7b07          	ld	a,(OFST+5,sp)
1462  0369 a101          	cp	a,#1
1463  036b 270c          	jreq	L261
1464  036d 7b07          	ld	a,(OFST+5,sp)
1465  036f a102          	cp	a,#2
1466  0371 2706          	jreq	L261
1467  0373 7b07          	ld	a,(OFST+5,sp)
1468  0375 a103          	cp	a,#3
1469  0377 2603          	jrne	L061
1470  0379               L261:
1471  0379 4f            	clr	a
1472  037a 2010          	jra	L461
1473  037c               L061:
1474  037c ae0115        	ldw	x,#277
1475  037f 89            	pushw	x
1476  0380 ae0000        	ldw	x,#0
1477  0383 89            	pushw	x
1478  0384 ae0000        	ldw	x,#L302
1479  0387 cd0000        	call	_assert_failed
1481  038a 5b04          	addw	sp,#4
1482  038c               L461:
1483                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1485  038c 0d08          	tnz	(OFST+6,sp)
1486  038e 2712          	jreq	L071
1487  0390 7b08          	ld	a,(OFST+6,sp)
1488  0392 a104          	cp	a,#4
1489  0394 270c          	jreq	L071
1490  0396 7b08          	ld	a,(OFST+6,sp)
1491  0398 a108          	cp	a,#8
1492  039a 2706          	jreq	L071
1493  039c 7b08          	ld	a,(OFST+6,sp)
1494  039e a10c          	cp	a,#12
1495  03a0 2603          	jrne	L661
1496  03a2               L071:
1497  03a2 4f            	clr	a
1498  03a3 2010          	jra	L271
1499  03a5               L661:
1500  03a5 ae0116        	ldw	x,#278
1501  03a8 89            	pushw	x
1502  03a9 ae0000        	ldw	x,#0
1503  03ac 89            	pushw	x
1504  03ad ae0000        	ldw	x,#L302
1505  03b0 cd0000        	call	_assert_failed
1507  03b3 5b04          	addw	sp,#4
1508  03b5               L271:
1509                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1511  03b5 7b04          	ld	a,(OFST+2,sp)
1512  03b7 a144          	cp	a,#68
1513  03b9 2706          	jreq	L144
1514                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1516  03bb a644          	ld	a,#68
1517  03bd 6b01          	ld	(OFST-1,sp),a
1519  03bf 2002          	jra	L344
1520  03c1               L144:
1521                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1523  03c1 0f01          	clr	(OFST-1,sp)
1524  03c3               L344:
1525                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1527  03c3 7b07          	ld	a,(OFST+5,sp)
1528  03c5 a101          	cp	a,#1
1529  03c7 2606          	jrne	L544
1530                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1532  03c9 a602          	ld	a,#2
1533  03cb 6b02          	ld	(OFST+0,sp),a
1535  03cd 2004          	jra	L744
1536  03cf               L544:
1537                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1539  03cf a601          	ld	a,#1
1540  03d1 6b02          	ld	(OFST+0,sp),a
1541  03d3               L744:
1542                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1544  03d3 0d03          	tnz	(OFST+1,sp)
1545  03d5 2626          	jrne	L154
1546                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1546                     ; 304                    (uint8_t)TIM2_ICFilter);
1548  03d7 7b09          	ld	a,(OFST+7,sp)
1549  03d9 88            	push	a
1550  03da 7b08          	ld	a,(OFST+6,sp)
1551  03dc 97            	ld	xl,a
1552  03dd 7b05          	ld	a,(OFST+3,sp)
1553  03df 95            	ld	xh,a
1554  03e0 cd0ad3        	call	L3_TI1_Config
1556  03e3 84            	pop	a
1557                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1559  03e4 7b08          	ld	a,(OFST+6,sp)
1560  03e6 cd08c3        	call	_TIM2_SetIC1Prescaler
1562                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1564  03e9 7b09          	ld	a,(OFST+7,sp)
1565  03eb 88            	push	a
1566  03ec 7b03          	ld	a,(OFST+1,sp)
1567  03ee 97            	ld	xl,a
1568  03ef 7b02          	ld	a,(OFST+0,sp)
1569  03f1 95            	ld	xh,a
1570  03f2 cd0b03        	call	L5_TI2_Config
1572  03f5 84            	pop	a
1573                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1575  03f6 7b08          	ld	a,(OFST+6,sp)
1576  03f8 cd08f2        	call	_TIM2_SetIC2Prescaler
1579  03fb 2024          	jra	L354
1580  03fd               L154:
1581                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1581                     ; 319                    (uint8_t)TIM2_ICFilter);
1583  03fd 7b09          	ld	a,(OFST+7,sp)
1584  03ff 88            	push	a
1585  0400 7b08          	ld	a,(OFST+6,sp)
1586  0402 97            	ld	xl,a
1587  0403 7b05          	ld	a,(OFST+3,sp)
1588  0405 95            	ld	xh,a
1589  0406 cd0b03        	call	L5_TI2_Config
1591  0409 84            	pop	a
1592                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1594  040a 7b08          	ld	a,(OFST+6,sp)
1595  040c cd08f2        	call	_TIM2_SetIC2Prescaler
1597                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1599  040f 7b09          	ld	a,(OFST+7,sp)
1600  0411 88            	push	a
1601  0412 7b03          	ld	a,(OFST+1,sp)
1602  0414 97            	ld	xl,a
1603  0415 7b02          	ld	a,(OFST+0,sp)
1604  0417 95            	ld	xh,a
1605  0418 cd0ad3        	call	L3_TI1_Config
1607  041b 84            	pop	a
1608                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1610  041c 7b08          	ld	a,(OFST+6,sp)
1611  041e cd08c3        	call	_TIM2_SetIC1Prescaler
1613  0421               L354:
1614                     ; 330 }
1617  0421 5b04          	addw	sp,#4
1618  0423 81            	ret
1674                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1674                     ; 340 {
1675                     	switch	.text
1676  0424               _TIM2_Cmd:
1678  0424 88            	push	a
1679       00000000      OFST:	set	0
1682                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1684  0425 4d            	tnz	a
1685  0426 2704          	jreq	L002
1686  0428 a101          	cp	a,#1
1687  042a 2603          	jrne	L671
1688  042c               L002:
1689  042c 4f            	clr	a
1690  042d 2010          	jra	L202
1691  042f               L671:
1692  042f ae0156        	ldw	x,#342
1693  0432 89            	pushw	x
1694  0433 ae0000        	ldw	x,#0
1695  0436 89            	pushw	x
1696  0437 ae0000        	ldw	x,#L302
1697  043a cd0000        	call	_assert_failed
1699  043d 5b04          	addw	sp,#4
1700  043f               L202:
1701                     ; 345     if (NewState != DISABLE)
1703  043f 0d01          	tnz	(OFST+1,sp)
1704  0441 2706          	jreq	L305
1705                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1707  0443 72105300      	bset	21248,#0
1709  0447 2004          	jra	L505
1710  0449               L305:
1711                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1713  0449 72115300      	bres	21248,#0
1714  044d               L505:
1715                     ; 353 }
1718  044d 84            	pop	a
1719  044e 81            	ret
1799                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1799                     ; 370 {
1800                     	switch	.text
1801  044f               _TIM2_ITConfig:
1803  044f 89            	pushw	x
1804       00000000      OFST:	set	0
1807                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1809  0450 9e            	ld	a,xh
1810  0451 4d            	tnz	a
1811  0452 2708          	jreq	L602
1812  0454 9e            	ld	a,xh
1813  0455 a110          	cp	a,#16
1814  0457 2403          	jruge	L602
1815  0459 4f            	clr	a
1816  045a 2010          	jra	L012
1817  045c               L602:
1818  045c ae0174        	ldw	x,#372
1819  045f 89            	pushw	x
1820  0460 ae0000        	ldw	x,#0
1821  0463 89            	pushw	x
1822  0464 ae0000        	ldw	x,#L302
1823  0467 cd0000        	call	_assert_failed
1825  046a 5b04          	addw	sp,#4
1826  046c               L012:
1827                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1829  046c 0d02          	tnz	(OFST+2,sp)
1830  046e 2706          	jreq	L412
1831  0470 7b02          	ld	a,(OFST+2,sp)
1832  0472 a101          	cp	a,#1
1833  0474 2603          	jrne	L212
1834  0476               L412:
1835  0476 4f            	clr	a
1836  0477 2010          	jra	L612
1837  0479               L212:
1838  0479 ae0175        	ldw	x,#373
1839  047c 89            	pushw	x
1840  047d ae0000        	ldw	x,#0
1841  0480 89            	pushw	x
1842  0481 ae0000        	ldw	x,#L302
1843  0484 cd0000        	call	_assert_failed
1845  0487 5b04          	addw	sp,#4
1846  0489               L612:
1847                     ; 375     if (NewState != DISABLE)
1849  0489 0d02          	tnz	(OFST+2,sp)
1850  048b 270a          	jreq	L545
1851                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1853  048d c65301        	ld	a,21249
1854  0490 1a01          	or	a,(OFST+1,sp)
1855  0492 c75301        	ld	21249,a
1857  0495 2009          	jra	L745
1858  0497               L545:
1859                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1861  0497 7b01          	ld	a,(OFST+1,sp)
1862  0499 43            	cpl	a
1863  049a c45301        	and	a,21249
1864  049d c75301        	ld	21249,a
1865  04a0               L745:
1866                     ; 385 }
1869  04a0 85            	popw	x
1870  04a1 81            	ret
1907                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1907                     ; 395 {
1908                     	switch	.text
1909  04a2               _TIM2_UpdateDisableConfig:
1911  04a2 88            	push	a
1912       00000000      OFST:	set	0
1915                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1917  04a3 4d            	tnz	a
1918  04a4 2704          	jreq	L422
1919  04a6 a101          	cp	a,#1
1920  04a8 2603          	jrne	L222
1921  04aa               L422:
1922  04aa 4f            	clr	a
1923  04ab 2010          	jra	L622
1924  04ad               L222:
1925  04ad ae018d        	ldw	x,#397
1926  04b0 89            	pushw	x
1927  04b1 ae0000        	ldw	x,#0
1928  04b4 89            	pushw	x
1929  04b5 ae0000        	ldw	x,#L302
1930  04b8 cd0000        	call	_assert_failed
1932  04bb 5b04          	addw	sp,#4
1933  04bd               L622:
1934                     ; 400     if (NewState != DISABLE)
1936  04bd 0d01          	tnz	(OFST+1,sp)
1937  04bf 2706          	jreq	L765
1938                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1940  04c1 72125300      	bset	21248,#1
1942  04c5 2004          	jra	L175
1943  04c7               L765:
1944                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1946  04c7 72135300      	bres	21248,#1
1947  04cb               L175:
1948                     ; 408 }
1951  04cb 84            	pop	a
1952  04cc 81            	ret
2011                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2011                     ; 419 {
2012                     	switch	.text
2013  04cd               _TIM2_UpdateRequestConfig:
2015  04cd 88            	push	a
2016       00000000      OFST:	set	0
2019                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2021  04ce 4d            	tnz	a
2022  04cf 2704          	jreq	L432
2023  04d1 a101          	cp	a,#1
2024  04d3 2603          	jrne	L232
2025  04d5               L432:
2026  04d5 4f            	clr	a
2027  04d6 2010          	jra	L632
2028  04d8               L232:
2029  04d8 ae01a5        	ldw	x,#421
2030  04db 89            	pushw	x
2031  04dc ae0000        	ldw	x,#0
2032  04df 89            	pushw	x
2033  04e0 ae0000        	ldw	x,#L302
2034  04e3 cd0000        	call	_assert_failed
2036  04e6 5b04          	addw	sp,#4
2037  04e8               L632:
2038                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2040  04e8 0d01          	tnz	(OFST+1,sp)
2041  04ea 2706          	jreq	L126
2042                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2044  04ec 72145300      	bset	21248,#2
2046  04f0 2004          	jra	L326
2047  04f2               L126:
2048                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2050  04f2 72155300      	bres	21248,#2
2051  04f6               L326:
2052                     ; 432 }
2055  04f6 84            	pop	a
2056  04f7 81            	ret
2114                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2114                     ; 444 {
2115                     	switch	.text
2116  04f8               _TIM2_SelectOnePulseMode:
2118  04f8 88            	push	a
2119       00000000      OFST:	set	0
2122                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2124  04f9 a101          	cp	a,#1
2125  04fb 2703          	jreq	L442
2126  04fd 4d            	tnz	a
2127  04fe 2603          	jrne	L242
2128  0500               L442:
2129  0500 4f            	clr	a
2130  0501 2010          	jra	L642
2131  0503               L242:
2132  0503 ae01be        	ldw	x,#446
2133  0506 89            	pushw	x
2134  0507 ae0000        	ldw	x,#0
2135  050a 89            	pushw	x
2136  050b ae0000        	ldw	x,#L302
2137  050e cd0000        	call	_assert_failed
2139  0511 5b04          	addw	sp,#4
2140  0513               L642:
2141                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2143  0513 0d01          	tnz	(OFST+1,sp)
2144  0515 2706          	jreq	L356
2145                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2147  0517 72165300      	bset	21248,#3
2149  051b 2004          	jra	L556
2150  051d               L356:
2151                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2153  051d 72175300      	bres	21248,#3
2154  0521               L556:
2155                     ; 458 }
2158  0521 84            	pop	a
2159  0522 81            	ret
2228                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2228                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2228                     ; 491 {
2229                     	switch	.text
2230  0523               _TIM2_PrescalerConfig:
2232  0523 89            	pushw	x
2233       00000000      OFST:	set	0
2236                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2238  0524 9f            	ld	a,xl
2239  0525 4d            	tnz	a
2240  0526 2705          	jreq	L452
2241  0528 9f            	ld	a,xl
2242  0529 a101          	cp	a,#1
2243  052b 2603          	jrne	L252
2244  052d               L452:
2245  052d 4f            	clr	a
2246  052e 2010          	jra	L652
2247  0530               L252:
2248  0530 ae01ed        	ldw	x,#493
2249  0533 89            	pushw	x
2250  0534 ae0000        	ldw	x,#0
2251  0537 89            	pushw	x
2252  0538 ae0000        	ldw	x,#L302
2253  053b cd0000        	call	_assert_failed
2255  053e 5b04          	addw	sp,#4
2256  0540               L652:
2257                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2259  0540 0d01          	tnz	(OFST+1,sp)
2260  0542 275a          	jreq	L262
2261  0544 7b01          	ld	a,(OFST+1,sp)
2262  0546 a101          	cp	a,#1
2263  0548 2754          	jreq	L262
2264  054a 7b01          	ld	a,(OFST+1,sp)
2265  054c a102          	cp	a,#2
2266  054e 274e          	jreq	L262
2267  0550 7b01          	ld	a,(OFST+1,sp)
2268  0552 a103          	cp	a,#3
2269  0554 2748          	jreq	L262
2270  0556 7b01          	ld	a,(OFST+1,sp)
2271  0558 a104          	cp	a,#4
2272  055a 2742          	jreq	L262
2273  055c 7b01          	ld	a,(OFST+1,sp)
2274  055e a105          	cp	a,#5
2275  0560 273c          	jreq	L262
2276  0562 7b01          	ld	a,(OFST+1,sp)
2277  0564 a106          	cp	a,#6
2278  0566 2736          	jreq	L262
2279  0568 7b01          	ld	a,(OFST+1,sp)
2280  056a a107          	cp	a,#7
2281  056c 2730          	jreq	L262
2282  056e 7b01          	ld	a,(OFST+1,sp)
2283  0570 a108          	cp	a,#8
2284  0572 272a          	jreq	L262
2285  0574 7b01          	ld	a,(OFST+1,sp)
2286  0576 a109          	cp	a,#9
2287  0578 2724          	jreq	L262
2288  057a 7b01          	ld	a,(OFST+1,sp)
2289  057c a10a          	cp	a,#10
2290  057e 271e          	jreq	L262
2291  0580 7b01          	ld	a,(OFST+1,sp)
2292  0582 a10b          	cp	a,#11
2293  0584 2718          	jreq	L262
2294  0586 7b01          	ld	a,(OFST+1,sp)
2295  0588 a10c          	cp	a,#12
2296  058a 2712          	jreq	L262
2297  058c 7b01          	ld	a,(OFST+1,sp)
2298  058e a10d          	cp	a,#13
2299  0590 270c          	jreq	L262
2300  0592 7b01          	ld	a,(OFST+1,sp)
2301  0594 a10e          	cp	a,#14
2302  0596 2706          	jreq	L262
2303  0598 7b01          	ld	a,(OFST+1,sp)
2304  059a a10f          	cp	a,#15
2305  059c 2603          	jrne	L062
2306  059e               L262:
2307  059e 4f            	clr	a
2308  059f 2010          	jra	L462
2309  05a1               L062:
2310  05a1 ae01ee        	ldw	x,#494
2311  05a4 89            	pushw	x
2312  05a5 ae0000        	ldw	x,#0
2313  05a8 89            	pushw	x
2314  05a9 ae0000        	ldw	x,#L302
2315  05ac cd0000        	call	_assert_failed
2317  05af 5b04          	addw	sp,#4
2318  05b1               L462:
2319                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
2321  05b1 7b01          	ld	a,(OFST+1,sp)
2322  05b3 c7530c        	ld	21260,a
2323                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2325  05b6 7b02          	ld	a,(OFST+2,sp)
2326  05b8 c75304        	ld	21252,a
2327                     ; 501 }
2330  05bb 85            	popw	x
2331  05bc 81            	ret
2390                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2390                     ; 513 {
2391                     	switch	.text
2392  05bd               _TIM2_ForcedOC1Config:
2394  05bd 88            	push	a
2395       00000000      OFST:	set	0
2398                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2400  05be a150          	cp	a,#80
2401  05c0 2704          	jreq	L272
2402  05c2 a140          	cp	a,#64
2403  05c4 2603          	jrne	L072
2404  05c6               L272:
2405  05c6 4f            	clr	a
2406  05c7 2010          	jra	L472
2407  05c9               L072:
2408  05c9 ae0203        	ldw	x,#515
2409  05cc 89            	pushw	x
2410  05cd ae0000        	ldw	x,#0
2411  05d0 89            	pushw	x
2412  05d1 ae0000        	ldw	x,#L302
2413  05d4 cd0000        	call	_assert_failed
2415  05d7 5b04          	addw	sp,#4
2416  05d9               L472:
2417                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2417                     ; 519                               | (uint8_t)TIM2_ForcedAction);
2419  05d9 c65305        	ld	a,21253
2420  05dc a48f          	and	a,#143
2421  05de 1a01          	or	a,(OFST+1,sp)
2422  05e0 c75305        	ld	21253,a
2423                     ; 520 }
2426  05e3 84            	pop	a
2427  05e4 81            	ret
2464                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2464                     ; 532 {
2465                     	switch	.text
2466  05e5               _TIM2_ForcedOC2Config:
2468  05e5 88            	push	a
2469       00000000      OFST:	set	0
2472                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2474  05e6 a150          	cp	a,#80
2475  05e8 2704          	jreq	L203
2476  05ea a140          	cp	a,#64
2477  05ec 2603          	jrne	L003
2478  05ee               L203:
2479  05ee 4f            	clr	a
2480  05ef 2010          	jra	L403
2481  05f1               L003:
2482  05f1 ae0216        	ldw	x,#534
2483  05f4 89            	pushw	x
2484  05f5 ae0000        	ldw	x,#0
2485  05f8 89            	pushw	x
2486  05f9 ae0000        	ldw	x,#L302
2487  05fc cd0000        	call	_assert_failed
2489  05ff 5b04          	addw	sp,#4
2490  0601               L403:
2491                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2491                     ; 538                             | (uint8_t)TIM2_ForcedAction);
2493  0601 c65306        	ld	a,21254
2494  0604 a48f          	and	a,#143
2495  0606 1a01          	or	a,(OFST+1,sp)
2496  0608 c75306        	ld	21254,a
2497                     ; 539 }
2500  060b 84            	pop	a
2501  060c 81            	ret
2538                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2538                     ; 551 {
2539                     	switch	.text
2540  060d               _TIM2_ForcedOC3Config:
2542  060d 88            	push	a
2543       00000000      OFST:	set	0
2546                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2548  060e a150          	cp	a,#80
2549  0610 2704          	jreq	L213
2550  0612 a140          	cp	a,#64
2551  0614 2603          	jrne	L013
2552  0616               L213:
2553  0616 4f            	clr	a
2554  0617 2010          	jra	L413
2555  0619               L013:
2556  0619 ae0229        	ldw	x,#553
2557  061c 89            	pushw	x
2558  061d ae0000        	ldw	x,#0
2559  0620 89            	pushw	x
2560  0621 ae0000        	ldw	x,#L302
2561  0624 cd0000        	call	_assert_failed
2563  0627 5b04          	addw	sp,#4
2564  0629               L413:
2565                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2565                     ; 557                               | (uint8_t)TIM2_ForcedAction);
2567  0629 c65307        	ld	a,21255
2568  062c a48f          	and	a,#143
2569  062e 1a01          	or	a,(OFST+1,sp)
2570  0630 c75307        	ld	21255,a
2571                     ; 558 }
2574  0633 84            	pop	a
2575  0634 81            	ret
2612                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2612                     ; 568 {
2613                     	switch	.text
2614  0635               _TIM2_ARRPreloadConfig:
2616  0635 88            	push	a
2617       00000000      OFST:	set	0
2620                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2622  0636 4d            	tnz	a
2623  0637 2704          	jreq	L223
2624  0639 a101          	cp	a,#1
2625  063b 2603          	jrne	L023
2626  063d               L223:
2627  063d 4f            	clr	a
2628  063e 2010          	jra	L423
2629  0640               L023:
2630  0640 ae023a        	ldw	x,#570
2631  0643 89            	pushw	x
2632  0644 ae0000        	ldw	x,#0
2633  0647 89            	pushw	x
2634  0648 ae0000        	ldw	x,#L302
2635  064b cd0000        	call	_assert_failed
2637  064e 5b04          	addw	sp,#4
2638  0650               L423:
2639                     ; 573     if (NewState != DISABLE)
2641  0650 0d01          	tnz	(OFST+1,sp)
2642  0652 2706          	jreq	L1101
2643                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2645  0654 721e5300      	bset	21248,#7
2647  0658 2004          	jra	L3101
2648  065a               L1101:
2649                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2651  065a 721f5300      	bres	21248,#7
2652  065e               L3101:
2653                     ; 581 }
2656  065e 84            	pop	a
2657  065f 81            	ret
2694                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2694                     ; 591 {
2695                     	switch	.text
2696  0660               _TIM2_OC1PreloadConfig:
2698  0660 88            	push	a
2699       00000000      OFST:	set	0
2702                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2704  0661 4d            	tnz	a
2705  0662 2704          	jreq	L233
2706  0664 a101          	cp	a,#1
2707  0666 2603          	jrne	L033
2708  0668               L233:
2709  0668 4f            	clr	a
2710  0669 2010          	jra	L433
2711  066b               L033:
2712  066b ae0251        	ldw	x,#593
2713  066e 89            	pushw	x
2714  066f ae0000        	ldw	x,#0
2715  0672 89            	pushw	x
2716  0673 ae0000        	ldw	x,#L302
2717  0676 cd0000        	call	_assert_failed
2719  0679 5b04          	addw	sp,#4
2720  067b               L433:
2721                     ; 596     if (NewState != DISABLE)
2723  067b 0d01          	tnz	(OFST+1,sp)
2724  067d 2706          	jreq	L3301
2725                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2727  067f 72165305      	bset	21253,#3
2729  0683 2004          	jra	L5301
2730  0685               L3301:
2731                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2733  0685 72175305      	bres	21253,#3
2734  0689               L5301:
2735                     ; 604 }
2738  0689 84            	pop	a
2739  068a 81            	ret
2776                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2776                     ; 614 {
2777                     	switch	.text
2778  068b               _TIM2_OC2PreloadConfig:
2780  068b 88            	push	a
2781       00000000      OFST:	set	0
2784                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2786  068c 4d            	tnz	a
2787  068d 2704          	jreq	L243
2788  068f a101          	cp	a,#1
2789  0691 2603          	jrne	L043
2790  0693               L243:
2791  0693 4f            	clr	a
2792  0694 2010          	jra	L443
2793  0696               L043:
2794  0696 ae0268        	ldw	x,#616
2795  0699 89            	pushw	x
2796  069a ae0000        	ldw	x,#0
2797  069d 89            	pushw	x
2798  069e ae0000        	ldw	x,#L302
2799  06a1 cd0000        	call	_assert_failed
2801  06a4 5b04          	addw	sp,#4
2802  06a6               L443:
2803                     ; 619     if (NewState != DISABLE)
2805  06a6 0d01          	tnz	(OFST+1,sp)
2806  06a8 2706          	jreq	L5501
2807                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2809  06aa 72165306      	bset	21254,#3
2811  06ae 2004          	jra	L7501
2812  06b0               L5501:
2813                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2815  06b0 72175306      	bres	21254,#3
2816  06b4               L7501:
2817                     ; 627 }
2820  06b4 84            	pop	a
2821  06b5 81            	ret
2858                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2858                     ; 637 {
2859                     	switch	.text
2860  06b6               _TIM2_OC3PreloadConfig:
2862  06b6 88            	push	a
2863       00000000      OFST:	set	0
2866                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2868  06b7 4d            	tnz	a
2869  06b8 2704          	jreq	L253
2870  06ba a101          	cp	a,#1
2871  06bc 2603          	jrne	L053
2872  06be               L253:
2873  06be 4f            	clr	a
2874  06bf 2010          	jra	L453
2875  06c1               L053:
2876  06c1 ae027f        	ldw	x,#639
2877  06c4 89            	pushw	x
2878  06c5 ae0000        	ldw	x,#0
2879  06c8 89            	pushw	x
2880  06c9 ae0000        	ldw	x,#L302
2881  06cc cd0000        	call	_assert_failed
2883  06cf 5b04          	addw	sp,#4
2884  06d1               L453:
2885                     ; 642     if (NewState != DISABLE)
2887  06d1 0d01          	tnz	(OFST+1,sp)
2888  06d3 2706          	jreq	L7701
2889                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2891  06d5 72165307      	bset	21255,#3
2893  06d9 2004          	jra	L1011
2894  06db               L7701:
2895                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2897  06db 72175307      	bres	21255,#3
2898  06df               L1011:
2899                     ; 650 }
2902  06df 84            	pop	a
2903  06e0 81            	ret
2977                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2977                     ; 664 {
2978                     	switch	.text
2979  06e1               _TIM2_GenerateEvent:
2981  06e1 88            	push	a
2982       00000000      OFST:	set	0
2985                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2987  06e2 4d            	tnz	a
2988  06e3 2703          	jreq	L063
2989  06e5 4f            	clr	a
2990  06e6 2010          	jra	L263
2991  06e8               L063:
2992  06e8 ae029a        	ldw	x,#666
2993  06eb 89            	pushw	x
2994  06ec ae0000        	ldw	x,#0
2995  06ef 89            	pushw	x
2996  06f0 ae0000        	ldw	x,#L302
2997  06f3 cd0000        	call	_assert_failed
2999  06f6 5b04          	addw	sp,#4
3000  06f8               L263:
3001                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
3003  06f8 7b01          	ld	a,(OFST+1,sp)
3004  06fa c75304        	ld	21252,a
3005                     ; 670 }
3008  06fd 84            	pop	a
3009  06fe 81            	ret
3046                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3046                     ; 682 {
3047                     	switch	.text
3048  06ff               _TIM2_OC1PolarityConfig:
3050  06ff 88            	push	a
3051       00000000      OFST:	set	0
3054                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3056  0700 4d            	tnz	a
3057  0701 2704          	jreq	L073
3058  0703 a122          	cp	a,#34
3059  0705 2603          	jrne	L663
3060  0707               L073:
3061  0707 4f            	clr	a
3062  0708 2010          	jra	L273
3063  070a               L663:
3064  070a ae02ac        	ldw	x,#684
3065  070d 89            	pushw	x
3066  070e ae0000        	ldw	x,#0
3067  0711 89            	pushw	x
3068  0712 ae0000        	ldw	x,#L302
3069  0715 cd0000        	call	_assert_failed
3071  0718 5b04          	addw	sp,#4
3072  071a               L273:
3073                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3075  071a 0d01          	tnz	(OFST+1,sp)
3076  071c 2706          	jreq	L3511
3077                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3079  071e 72125308      	bset	21256,#1
3081  0722 2004          	jra	L5511
3082  0724               L3511:
3083                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3085  0724 72135308      	bres	21256,#1
3086  0728               L5511:
3087                     ; 695 }
3090  0728 84            	pop	a
3091  0729 81            	ret
3128                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3128                     ; 707 {
3129                     	switch	.text
3130  072a               _TIM2_OC2PolarityConfig:
3132  072a 88            	push	a
3133       00000000      OFST:	set	0
3136                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3138  072b 4d            	tnz	a
3139  072c 2704          	jreq	L004
3140  072e a122          	cp	a,#34
3141  0730 2603          	jrne	L673
3142  0732               L004:
3143  0732 4f            	clr	a
3144  0733 2010          	jra	L204
3145  0735               L673:
3146  0735 ae02c5        	ldw	x,#709
3147  0738 89            	pushw	x
3148  0739 ae0000        	ldw	x,#0
3149  073c 89            	pushw	x
3150  073d ae0000        	ldw	x,#L302
3151  0740 cd0000        	call	_assert_failed
3153  0743 5b04          	addw	sp,#4
3154  0745               L204:
3155                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3157  0745 0d01          	tnz	(OFST+1,sp)
3158  0747 2706          	jreq	L5711
3159                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
3161  0749 721a5308      	bset	21256,#5
3163  074d 2004          	jra	L7711
3164  074f               L5711:
3165                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3167  074f 721b5308      	bres	21256,#5
3168  0753               L7711:
3169                     ; 720 }
3172  0753 84            	pop	a
3173  0754 81            	ret
3210                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3210                     ; 732 {
3211                     	switch	.text
3212  0755               _TIM2_OC3PolarityConfig:
3214  0755 88            	push	a
3215       00000000      OFST:	set	0
3218                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3220  0756 4d            	tnz	a
3221  0757 2704          	jreq	L014
3222  0759 a122          	cp	a,#34
3223  075b 2603          	jrne	L604
3224  075d               L014:
3225  075d 4f            	clr	a
3226  075e 2010          	jra	L214
3227  0760               L604:
3228  0760 ae02de        	ldw	x,#734
3229  0763 89            	pushw	x
3230  0764 ae0000        	ldw	x,#0
3231  0767 89            	pushw	x
3232  0768 ae0000        	ldw	x,#L302
3233  076b cd0000        	call	_assert_failed
3235  076e 5b04          	addw	sp,#4
3236  0770               L214:
3237                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3239  0770 0d01          	tnz	(OFST+1,sp)
3240  0772 2706          	jreq	L7121
3241                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3243  0774 72125309      	bset	21257,#1
3245  0778 2004          	jra	L1221
3246  077a               L7121:
3247                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3249  077a 72135309      	bres	21257,#1
3250  077e               L1221:
3251                     ; 745 }
3254  077e 84            	pop	a
3255  077f 81            	ret
3301                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3301                     ; 760 {
3302                     	switch	.text
3303  0780               _TIM2_CCxCmd:
3305  0780 89            	pushw	x
3306       00000000      OFST:	set	0
3309                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3311  0781 9e            	ld	a,xh
3312  0782 4d            	tnz	a
3313  0783 270a          	jreq	L024
3314  0785 9e            	ld	a,xh
3315  0786 a101          	cp	a,#1
3316  0788 2705          	jreq	L024
3317  078a 9e            	ld	a,xh
3318  078b a102          	cp	a,#2
3319  078d 2603          	jrne	L614
3320  078f               L024:
3321  078f 4f            	clr	a
3322  0790 2010          	jra	L224
3323  0792               L614:
3324  0792 ae02fa        	ldw	x,#762
3325  0795 89            	pushw	x
3326  0796 ae0000        	ldw	x,#0
3327  0799 89            	pushw	x
3328  079a ae0000        	ldw	x,#L302
3329  079d cd0000        	call	_assert_failed
3331  07a0 5b04          	addw	sp,#4
3332  07a2               L224:
3333                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3335  07a2 0d02          	tnz	(OFST+2,sp)
3336  07a4 2706          	jreq	L624
3337  07a6 7b02          	ld	a,(OFST+2,sp)
3338  07a8 a101          	cp	a,#1
3339  07aa 2603          	jrne	L424
3340  07ac               L624:
3341  07ac 4f            	clr	a
3342  07ad 2010          	jra	L034
3343  07af               L424:
3344  07af ae02fb        	ldw	x,#763
3345  07b2 89            	pushw	x
3346  07b3 ae0000        	ldw	x,#0
3347  07b6 89            	pushw	x
3348  07b7 ae0000        	ldw	x,#L302
3349  07ba cd0000        	call	_assert_failed
3351  07bd 5b04          	addw	sp,#4
3352  07bf               L034:
3353                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
3355  07bf 0d01          	tnz	(OFST+1,sp)
3356  07c1 2610          	jrne	L5421
3357                     ; 768         if (NewState != DISABLE)
3359  07c3 0d02          	tnz	(OFST+2,sp)
3360  07c5 2706          	jreq	L7421
3361                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3363  07c7 72105308      	bset	21256,#0
3365  07cb 202a          	jra	L3521
3366  07cd               L7421:
3367                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3369  07cd 72115308      	bres	21256,#0
3370  07d1 2024          	jra	L3521
3371  07d3               L5421:
3372                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
3374  07d3 7b01          	ld	a,(OFST+1,sp)
3375  07d5 a101          	cp	a,#1
3376  07d7 2610          	jrne	L5521
3377                     ; 781         if (NewState != DISABLE)
3379  07d9 0d02          	tnz	(OFST+2,sp)
3380  07db 2706          	jreq	L7521
3381                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3383  07dd 72185308      	bset	21256,#4
3385  07e1 2014          	jra	L3521
3386  07e3               L7521:
3387                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3389  07e3 72195308      	bres	21256,#4
3390  07e7 200e          	jra	L3521
3391  07e9               L5521:
3392                     ; 793         if (NewState != DISABLE)
3394  07e9 0d02          	tnz	(OFST+2,sp)
3395  07eb 2706          	jreq	L5621
3396                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3398  07ed 72105309      	bset	21257,#0
3400  07f1 2004          	jra	L3521
3401  07f3               L5621:
3402                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3404  07f3 72115309      	bres	21257,#0
3405  07f7               L3521:
3406                     ; 802 }
3409  07f7 85            	popw	x
3410  07f8 81            	ret
3456                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3456                     ; 825 {
3457                     	switch	.text
3458  07f9               _TIM2_SelectOCxM:
3460  07f9 89            	pushw	x
3461       00000000      OFST:	set	0
3464                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3466  07fa 9e            	ld	a,xh
3467  07fb 4d            	tnz	a
3468  07fc 270a          	jreq	L634
3469  07fe 9e            	ld	a,xh
3470  07ff a101          	cp	a,#1
3471  0801 2705          	jreq	L634
3472  0803 9e            	ld	a,xh
3473  0804 a102          	cp	a,#2
3474  0806 2603          	jrne	L434
3475  0808               L634:
3476  0808 4f            	clr	a
3477  0809 2010          	jra	L044
3478  080b               L434:
3479  080b ae033b        	ldw	x,#827
3480  080e 89            	pushw	x
3481  080f ae0000        	ldw	x,#0
3482  0812 89            	pushw	x
3483  0813 ae0000        	ldw	x,#L302
3484  0816 cd0000        	call	_assert_failed
3486  0819 5b04          	addw	sp,#4
3487  081b               L044:
3488                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3490  081b 0d02          	tnz	(OFST+2,sp)
3491  081d 272a          	jreq	L444
3492  081f 7b02          	ld	a,(OFST+2,sp)
3493  0821 a110          	cp	a,#16
3494  0823 2724          	jreq	L444
3495  0825 7b02          	ld	a,(OFST+2,sp)
3496  0827 a120          	cp	a,#32
3497  0829 271e          	jreq	L444
3498  082b 7b02          	ld	a,(OFST+2,sp)
3499  082d a130          	cp	a,#48
3500  082f 2718          	jreq	L444
3501  0831 7b02          	ld	a,(OFST+2,sp)
3502  0833 a160          	cp	a,#96
3503  0835 2712          	jreq	L444
3504  0837 7b02          	ld	a,(OFST+2,sp)
3505  0839 a170          	cp	a,#112
3506  083b 270c          	jreq	L444
3507  083d 7b02          	ld	a,(OFST+2,sp)
3508  083f a150          	cp	a,#80
3509  0841 2706          	jreq	L444
3510  0843 7b02          	ld	a,(OFST+2,sp)
3511  0845 a140          	cp	a,#64
3512  0847 2603          	jrne	L244
3513  0849               L444:
3514  0849 4f            	clr	a
3515  084a 2010          	jra	L644
3516  084c               L244:
3517  084c ae033c        	ldw	x,#828
3518  084f 89            	pushw	x
3519  0850 ae0000        	ldw	x,#0
3520  0853 89            	pushw	x
3521  0854 ae0000        	ldw	x,#L302
3522  0857 cd0000        	call	_assert_failed
3524  085a 5b04          	addw	sp,#4
3525  085c               L644:
3526                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
3528  085c 0d01          	tnz	(OFST+1,sp)
3529  085e 2610          	jrne	L3131
3530                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3532  0860 72115308      	bres	21256,#0
3533                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3533                     ; 837                                | (uint8_t)TIM2_OCMode);
3535  0864 c65305        	ld	a,21253
3536  0867 a48f          	and	a,#143
3537  0869 1a02          	or	a,(OFST+2,sp)
3538  086b c75305        	ld	21253,a
3540  086e 2024          	jra	L5131
3541  0870               L3131:
3542                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
3544  0870 7b01          	ld	a,(OFST+1,sp)
3545  0872 a101          	cp	a,#1
3546  0874 2610          	jrne	L7131
3547                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3549  0876 72195308      	bres	21256,#4
3550                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3550                     ; 846                                 | (uint8_t)TIM2_OCMode);
3552  087a c65306        	ld	a,21254
3553  087d a48f          	and	a,#143
3554  087f 1a02          	or	a,(OFST+2,sp)
3555  0881 c75306        	ld	21254,a
3557  0884 200e          	jra	L5131
3558  0886               L7131:
3559                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3561  0886 72115309      	bres	21257,#0
3562                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3562                     ; 855                                 | (uint8_t)TIM2_OCMode);
3564  088a c65307        	ld	a,21255
3565  088d a48f          	and	a,#143
3566  088f 1a02          	or	a,(OFST+2,sp)
3567  0891 c75307        	ld	21255,a
3568  0894               L5131:
3569                     ; 857 }
3572  0894 85            	popw	x
3573  0895 81            	ret
3605                     ; 866 void TIM2_SetCounter(uint16_t Counter)
3605                     ; 867 {
3606                     	switch	.text
3607  0896               _TIM2_SetCounter:
3611                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
3613  0896 9e            	ld	a,xh
3614  0897 c7530a        	ld	21258,a
3615                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
3617  089a 9f            	ld	a,xl
3618  089b c7530b        	ld	21259,a
3619                     ; 872 }
3622  089e 81            	ret
3654                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
3654                     ; 882 {
3655                     	switch	.text
3656  089f               _TIM2_SetAutoreload:
3660                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3662  089f 9e            	ld	a,xh
3663  08a0 c7530d        	ld	21261,a
3664                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
3666  08a3 9f            	ld	a,xl
3667  08a4 c7530e        	ld	21262,a
3668                     ; 888 }
3671  08a7 81            	ret
3703                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
3703                     ; 898 {
3704                     	switch	.text
3705  08a8               _TIM2_SetCompare1:
3709                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3711  08a8 9e            	ld	a,xh
3712  08a9 c7530f        	ld	21263,a
3713                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
3715  08ac 9f            	ld	a,xl
3716  08ad c75310        	ld	21264,a
3717                     ; 903 }
3720  08b0 81            	ret
3752                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
3752                     ; 913 {
3753                     	switch	.text
3754  08b1               _TIM2_SetCompare2:
3758                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3760  08b1 9e            	ld	a,xh
3761  08b2 c75311        	ld	21265,a
3762                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
3764  08b5 9f            	ld	a,xl
3765  08b6 c75312        	ld	21266,a
3766                     ; 918 }
3769  08b9 81            	ret
3801                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
3801                     ; 928 {
3802                     	switch	.text
3803  08ba               _TIM2_SetCompare3:
3807                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3809  08ba 9e            	ld	a,xh
3810  08bb c75313        	ld	21267,a
3811                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
3813  08be 9f            	ld	a,xl
3814  08bf c75314        	ld	21268,a
3815                     ; 933 }
3818  08c2 81            	ret
3855                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3855                     ; 947 {
3856                     	switch	.text
3857  08c3               _TIM2_SetIC1Prescaler:
3859  08c3 88            	push	a
3860       00000000      OFST:	set	0
3863                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3865  08c4 4d            	tnz	a
3866  08c5 270c          	jreq	L664
3867  08c7 a104          	cp	a,#4
3868  08c9 2708          	jreq	L664
3869  08cb a108          	cp	a,#8
3870  08cd 2704          	jreq	L664
3871  08cf a10c          	cp	a,#12
3872  08d1 2603          	jrne	L464
3873  08d3               L664:
3874  08d3 4f            	clr	a
3875  08d4 2010          	jra	L074
3876  08d6               L464:
3877  08d6 ae03b5        	ldw	x,#949
3878  08d9 89            	pushw	x
3879  08da ae0000        	ldw	x,#0
3880  08dd 89            	pushw	x
3881  08de ae0000        	ldw	x,#L302
3882  08e1 cd0000        	call	_assert_failed
3884  08e4 5b04          	addw	sp,#4
3885  08e6               L074:
3886                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3886                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
3888  08e6 c65305        	ld	a,21253
3889  08e9 a4f3          	and	a,#243
3890  08eb 1a01          	or	a,(OFST+1,sp)
3891  08ed c75305        	ld	21253,a
3892                     ; 954 }
3895  08f0 84            	pop	a
3896  08f1 81            	ret
3933                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3933                     ; 967 {
3934                     	switch	.text
3935  08f2               _TIM2_SetIC2Prescaler:
3937  08f2 88            	push	a
3938       00000000      OFST:	set	0
3941                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3943  08f3 4d            	tnz	a
3944  08f4 270c          	jreq	L674
3945  08f6 a104          	cp	a,#4
3946  08f8 2708          	jreq	L674
3947  08fa a108          	cp	a,#8
3948  08fc 2704          	jreq	L674
3949  08fe a10c          	cp	a,#12
3950  0900 2603          	jrne	L474
3951  0902               L674:
3952  0902 4f            	clr	a
3953  0903 2010          	jra	L005
3954  0905               L474:
3955  0905 ae03c9        	ldw	x,#969
3956  0908 89            	pushw	x
3957  0909 ae0000        	ldw	x,#0
3958  090c 89            	pushw	x
3959  090d ae0000        	ldw	x,#L302
3960  0910 cd0000        	call	_assert_failed
3962  0913 5b04          	addw	sp,#4
3963  0915               L005:
3964                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3964                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3966  0915 c65306        	ld	a,21254
3967  0918 a4f3          	and	a,#243
3968  091a 1a01          	or	a,(OFST+1,sp)
3969  091c c75306        	ld	21254,a
3970                     ; 974 }
3973  091f 84            	pop	a
3974  0920 81            	ret
4011                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4011                     ; 987 {
4012                     	switch	.text
4013  0921               _TIM2_SetIC3Prescaler:
4015  0921 88            	push	a
4016       00000000      OFST:	set	0
4019                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4021  0922 4d            	tnz	a
4022  0923 270c          	jreq	L605
4023  0925 a104          	cp	a,#4
4024  0927 2708          	jreq	L605
4025  0929 a108          	cp	a,#8
4026  092b 2704          	jreq	L605
4027  092d a10c          	cp	a,#12
4028  092f 2603          	jrne	L405
4029  0931               L605:
4030  0931 4f            	clr	a
4031  0932 2010          	jra	L015
4032  0934               L405:
4033  0934 ae03de        	ldw	x,#990
4034  0937 89            	pushw	x
4035  0938 ae0000        	ldw	x,#0
4036  093b 89            	pushw	x
4037  093c ae0000        	ldw	x,#L302
4038  093f cd0000        	call	_assert_failed
4040  0942 5b04          	addw	sp,#4
4041  0944               L015:
4042                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4042                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
4044  0944 c65307        	ld	a,21255
4045  0947 a4f3          	and	a,#243
4046  0949 1a01          	or	a,(OFST+1,sp)
4047  094b c75307        	ld	21255,a
4048                     ; 994 }
4051  094e 84            	pop	a
4052  094f 81            	ret
4098                     ; 1001 uint16_t TIM2_GetCapture1(void)
4098                     ; 1002 {
4099                     	switch	.text
4100  0950               _TIM2_GetCapture1:
4102  0950 5204          	subw	sp,#4
4103       00000004      OFST:	set	4
4106                     ; 1004     uint16_t tmpccr1 = 0;
4108                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
4112                     ; 1007     tmpccr1h = TIM2->CCR1H;
4114  0952 c6530f        	ld	a,21263
4115  0955 6b02          	ld	(OFST-2,sp),a
4116                     ; 1008     tmpccr1l = TIM2->CCR1L;
4118  0957 c65310        	ld	a,21264
4119  095a 6b01          	ld	(OFST-3,sp),a
4120                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
4122  095c 7b01          	ld	a,(OFST-3,sp)
4123  095e 5f            	clrw	x
4124  095f 97            	ld	xl,a
4125  0960 1f03          	ldw	(OFST-1,sp),x
4126                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4128  0962 7b02          	ld	a,(OFST-2,sp)
4129  0964 5f            	clrw	x
4130  0965 97            	ld	xl,a
4131  0966 4f            	clr	a
4132  0967 02            	rlwa	x,a
4133  0968 01            	rrwa	x,a
4134  0969 1a04          	or	a,(OFST+0,sp)
4135  096b 01            	rrwa	x,a
4136  096c 1a03          	or	a,(OFST-1,sp)
4137  096e 01            	rrwa	x,a
4138  096f 1f03          	ldw	(OFST-1,sp),x
4139                     ; 1013     return (uint16_t)tmpccr1;
4141  0971 1e03          	ldw	x,(OFST-1,sp)
4144  0973 5b04          	addw	sp,#4
4145  0975 81            	ret
4191                     ; 1021 uint16_t TIM2_GetCapture2(void)
4191                     ; 1022 {
4192                     	switch	.text
4193  0976               _TIM2_GetCapture2:
4195  0976 5204          	subw	sp,#4
4196       00000004      OFST:	set	4
4199                     ; 1024     uint16_t tmpccr2 = 0;
4201                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
4205                     ; 1027     tmpccr2h = TIM2->CCR2H;
4207  0978 c65311        	ld	a,21265
4208  097b 6b02          	ld	(OFST-2,sp),a
4209                     ; 1028     tmpccr2l = TIM2->CCR2L;
4211  097d c65312        	ld	a,21266
4212  0980 6b01          	ld	(OFST-3,sp),a
4213                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
4215  0982 7b01          	ld	a,(OFST-3,sp)
4216  0984 5f            	clrw	x
4217  0985 97            	ld	xl,a
4218  0986 1f03          	ldw	(OFST-1,sp),x
4219                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4221  0988 7b02          	ld	a,(OFST-2,sp)
4222  098a 5f            	clrw	x
4223  098b 97            	ld	xl,a
4224  098c 4f            	clr	a
4225  098d 02            	rlwa	x,a
4226  098e 01            	rrwa	x,a
4227  098f 1a04          	or	a,(OFST+0,sp)
4228  0991 01            	rrwa	x,a
4229  0992 1a03          	or	a,(OFST-1,sp)
4230  0994 01            	rrwa	x,a
4231  0995 1f03          	ldw	(OFST-1,sp),x
4232                     ; 1033     return (uint16_t)tmpccr2;
4234  0997 1e03          	ldw	x,(OFST-1,sp)
4237  0999 5b04          	addw	sp,#4
4238  099b 81            	ret
4284                     ; 1041 uint16_t TIM2_GetCapture3(void)
4284                     ; 1042 {
4285                     	switch	.text
4286  099c               _TIM2_GetCapture3:
4288  099c 5204          	subw	sp,#4
4289       00000004      OFST:	set	4
4292                     ; 1044     uint16_t tmpccr3 = 0;
4294                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
4298                     ; 1047     tmpccr3h = TIM2->CCR3H;
4300  099e c65313        	ld	a,21267
4301  09a1 6b02          	ld	(OFST-2,sp),a
4302                     ; 1048     tmpccr3l = TIM2->CCR3L;
4304  09a3 c65314        	ld	a,21268
4305  09a6 6b01          	ld	(OFST-3,sp),a
4306                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
4308  09a8 7b01          	ld	a,(OFST-3,sp)
4309  09aa 5f            	clrw	x
4310  09ab 97            	ld	xl,a
4311  09ac 1f03          	ldw	(OFST-1,sp),x
4312                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4314  09ae 7b02          	ld	a,(OFST-2,sp)
4315  09b0 5f            	clrw	x
4316  09b1 97            	ld	xl,a
4317  09b2 4f            	clr	a
4318  09b3 02            	rlwa	x,a
4319  09b4 01            	rrwa	x,a
4320  09b5 1a04          	or	a,(OFST+0,sp)
4321  09b7 01            	rrwa	x,a
4322  09b8 1a03          	or	a,(OFST-1,sp)
4323  09ba 01            	rrwa	x,a
4324  09bb 1f03          	ldw	(OFST-1,sp),x
4325                     ; 1053     return (uint16_t)tmpccr3;
4327  09bd 1e03          	ldw	x,(OFST-1,sp)
4330  09bf 5b04          	addw	sp,#4
4331  09c1 81            	ret
4363                     ; 1061 uint16_t TIM2_GetCounter(void)
4363                     ; 1062 {
4364                     	switch	.text
4365  09c2               _TIM2_GetCounter:
4367  09c2 89            	pushw	x
4368       00000002      OFST:	set	2
4371                     ; 1063      uint16_t tmpcntr = 0;
4373                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4375  09c3 c6530a        	ld	a,21258
4376  09c6 5f            	clrw	x
4377  09c7 97            	ld	xl,a
4378  09c8 4f            	clr	a
4379  09c9 02            	rlwa	x,a
4380  09ca 1f01          	ldw	(OFST-1,sp),x
4381                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4383  09cc c6530b        	ld	a,21259
4384  09cf 5f            	clrw	x
4385  09d0 97            	ld	xl,a
4386  09d1 01            	rrwa	x,a
4387  09d2 1a02          	or	a,(OFST+0,sp)
4388  09d4 01            	rrwa	x,a
4389  09d5 1a01          	or	a,(OFST-1,sp)
4390  09d7 01            	rrwa	x,a
4393  09d8 5b02          	addw	sp,#2
4394  09da 81            	ret
4418                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4418                     ; 1077 {
4419                     	switch	.text
4420  09db               _TIM2_GetPrescaler:
4424                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4426  09db c6530c        	ld	a,21260
4429  09de 81            	ret
4565                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4565                     ; 1097 {
4566                     	switch	.text
4567  09df               _TIM2_GetFlagStatus:
4569  09df 89            	pushw	x
4570  09e0 89            	pushw	x
4571       00000002      OFST:	set	2
4574                     ; 1098     FlagStatus bitstatus = RESET;
4576                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4580                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4582  09e1 a30001        	cpw	x,#1
4583  09e4 271e          	jreq	L035
4584  09e6 a30002        	cpw	x,#2
4585  09e9 2719          	jreq	L035
4586  09eb a30004        	cpw	x,#4
4587  09ee 2714          	jreq	L035
4588  09f0 a30008        	cpw	x,#8
4589  09f3 270f          	jreq	L035
4590  09f5 a30200        	cpw	x,#512
4591  09f8 270a          	jreq	L035
4592  09fa a30400        	cpw	x,#1024
4593  09fd 2705          	jreq	L035
4594  09ff a30800        	cpw	x,#2048
4595  0a02 2603          	jrne	L625
4596  0a04               L035:
4597  0a04 4f            	clr	a
4598  0a05 2010          	jra	L235
4599  0a07               L625:
4600  0a07 ae044e        	ldw	x,#1102
4601  0a0a 89            	pushw	x
4602  0a0b ae0000        	ldw	x,#0
4603  0a0e 89            	pushw	x
4604  0a0f ae0000        	ldw	x,#L302
4605  0a12 cd0000        	call	_assert_failed
4607  0a15 5b04          	addw	sp,#4
4608  0a17               L235:
4609                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4611  0a17 c65302        	ld	a,21250
4612  0a1a 1404          	and	a,(OFST+2,sp)
4613  0a1c 6b01          	ld	(OFST-1,sp),a
4614                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4616  0a1e 7b03          	ld	a,(OFST+1,sp)
4617  0a20 6b02          	ld	(OFST+0,sp),a
4618                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4620  0a22 c65303        	ld	a,21251
4621  0a25 1402          	and	a,(OFST+0,sp)
4622  0a27 1a01          	or	a,(OFST-1,sp)
4623  0a29 2706          	jreq	L5561
4624                     ; 1109         bitstatus = SET;
4626  0a2b a601          	ld	a,#1
4627  0a2d 6b02          	ld	(OFST+0,sp),a
4629  0a2f 2002          	jra	L7561
4630  0a31               L5561:
4631                     ; 1113         bitstatus = RESET;
4633  0a31 0f02          	clr	(OFST+0,sp)
4634  0a33               L7561:
4635                     ; 1115     return (FlagStatus)bitstatus;
4637  0a33 7b02          	ld	a,(OFST+0,sp)
4640  0a35 5b04          	addw	sp,#4
4641  0a37 81            	ret
4677                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4677                     ; 1133 {
4678                     	switch	.text
4679  0a38               _TIM2_ClearFlag:
4681  0a38 89            	pushw	x
4682       00000000      OFST:	set	0
4685                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4687  0a39 01            	rrwa	x,a
4688  0a3a a4f0          	and	a,#240
4689  0a3c 01            	rrwa	x,a
4690  0a3d a4f1          	and	a,#241
4691  0a3f 01            	rrwa	x,a
4692  0a40 a30000        	cpw	x,#0
4693  0a43 2607          	jrne	L635
4694  0a45 1e01          	ldw	x,(OFST+1,sp)
4695  0a47 2703          	jreq	L635
4696  0a49 4f            	clr	a
4697  0a4a 2010          	jra	L045
4698  0a4c               L635:
4699  0a4c ae046f        	ldw	x,#1135
4700  0a4f 89            	pushw	x
4701  0a50 ae0000        	ldw	x,#0
4702  0a53 89            	pushw	x
4703  0a54 ae0000        	ldw	x,#L302
4704  0a57 cd0000        	call	_assert_failed
4706  0a5a 5b04          	addw	sp,#4
4707  0a5c               L045:
4708                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4710  0a5c 7b02          	ld	a,(OFST+2,sp)
4711  0a5e 43            	cpl	a
4712  0a5f c75302        	ld	21250,a
4713                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4715  0a62 35ff5303      	mov	21251,#255
4716                     ; 1140 }
4719  0a66 85            	popw	x
4720  0a67 81            	ret
4781                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4781                     ; 1155 {
4782                     	switch	.text
4783  0a68               _TIM2_GetITStatus:
4785  0a68 88            	push	a
4786  0a69 89            	pushw	x
4787       00000002      OFST:	set	2
4790                     ; 1156     ITStatus bitstatus = RESET;
4792                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4796                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4798  0a6a a101          	cp	a,#1
4799  0a6c 270c          	jreq	L645
4800  0a6e a102          	cp	a,#2
4801  0a70 2708          	jreq	L645
4802  0a72 a104          	cp	a,#4
4803  0a74 2704          	jreq	L645
4804  0a76 a108          	cp	a,#8
4805  0a78 2603          	jrne	L445
4806  0a7a               L645:
4807  0a7a 4f            	clr	a
4808  0a7b 2010          	jra	L055
4809  0a7d               L445:
4810  0a7d ae0488        	ldw	x,#1160
4811  0a80 89            	pushw	x
4812  0a81 ae0000        	ldw	x,#0
4813  0a84 89            	pushw	x
4814  0a85 ae0000        	ldw	x,#L302
4815  0a88 cd0000        	call	_assert_failed
4817  0a8b 5b04          	addw	sp,#4
4818  0a8d               L055:
4819                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4821  0a8d c65302        	ld	a,21250
4822  0a90 1403          	and	a,(OFST+1,sp)
4823  0a92 6b01          	ld	(OFST-1,sp),a
4824                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4826  0a94 c65301        	ld	a,21249
4827  0a97 1403          	and	a,(OFST+1,sp)
4828  0a99 6b02          	ld	(OFST+0,sp),a
4829                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4831  0a9b 0d01          	tnz	(OFST-1,sp)
4832  0a9d 270a          	jreq	L5271
4834  0a9f 0d02          	tnz	(OFST+0,sp)
4835  0aa1 2706          	jreq	L5271
4836                     ; 1168         bitstatus = SET;
4838  0aa3 a601          	ld	a,#1
4839  0aa5 6b02          	ld	(OFST+0,sp),a
4841  0aa7 2002          	jra	L7271
4842  0aa9               L5271:
4843                     ; 1172         bitstatus = RESET;
4845  0aa9 0f02          	clr	(OFST+0,sp)
4846  0aab               L7271:
4847                     ; 1174     return (ITStatus)(bitstatus);
4849  0aab 7b02          	ld	a,(OFST+0,sp)
4852  0aad 5b03          	addw	sp,#3
4853  0aaf 81            	ret
4890                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4890                     ; 1189 {
4891                     	switch	.text
4892  0ab0               _TIM2_ClearITPendingBit:
4894  0ab0 88            	push	a
4895       00000000      OFST:	set	0
4898                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
4900  0ab1 4d            	tnz	a
4901  0ab2 2707          	jreq	L455
4902  0ab4 a110          	cp	a,#16
4903  0ab6 2403          	jruge	L455
4904  0ab8 4f            	clr	a
4905  0ab9 2010          	jra	L655
4906  0abb               L455:
4907  0abb ae04a7        	ldw	x,#1191
4908  0abe 89            	pushw	x
4909  0abf ae0000        	ldw	x,#0
4910  0ac2 89            	pushw	x
4911  0ac3 ae0000        	ldw	x,#L302
4912  0ac6 cd0000        	call	_assert_failed
4914  0ac9 5b04          	addw	sp,#4
4915  0acb               L655:
4916                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
4918  0acb 7b01          	ld	a,(OFST+1,sp)
4919  0acd 43            	cpl	a
4920  0ace c75302        	ld	21250,a
4921                     ; 1195 }
4924  0ad1 84            	pop	a
4925  0ad2 81            	ret
4971                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
4971                     ; 1215                        uint8_t TIM2_ICSelection,
4971                     ; 1216                        uint8_t TIM2_ICFilter)
4971                     ; 1217 {
4972                     	switch	.text
4973  0ad3               L3_TI1_Config:
4975  0ad3 89            	pushw	x
4976  0ad4 88            	push	a
4977       00000001      OFST:	set	1
4980                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4982  0ad5 72115308      	bres	21256,#0
4983                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4983                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4985  0ad9 7b06          	ld	a,(OFST+5,sp)
4986  0adb 97            	ld	xl,a
4987  0adc a610          	ld	a,#16
4988  0ade 42            	mul	x,a
4989  0adf 9f            	ld	a,xl
4990  0ae0 1a03          	or	a,(OFST+2,sp)
4991  0ae2 6b01          	ld	(OFST+0,sp),a
4992  0ae4 c65305        	ld	a,21253
4993  0ae7 a40c          	and	a,#12
4994  0ae9 1a01          	or	a,(OFST+0,sp)
4995  0aeb c75305        	ld	21253,a
4996                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4998  0aee 0d02          	tnz	(OFST+1,sp)
4999  0af0 2706          	jreq	L7671
5000                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
5002  0af2 72125308      	bset	21256,#1
5004  0af6 2004          	jra	L1771
5005  0af8               L7671:
5006                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5008  0af8 72135308      	bres	21256,#1
5009  0afc               L1771:
5010                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
5012  0afc 72105308      	bset	21256,#0
5013                     ; 1236 }
5016  0b00 5b03          	addw	sp,#3
5017  0b02 81            	ret
5063                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
5063                     ; 1256                        uint8_t TIM2_ICSelection,
5063                     ; 1257                        uint8_t TIM2_ICFilter)
5063                     ; 1258 {
5064                     	switch	.text
5065  0b03               L5_TI2_Config:
5067  0b03 89            	pushw	x
5068  0b04 88            	push	a
5069       00000001      OFST:	set	1
5072                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5074  0b05 72195308      	bres	21256,#4
5075                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5075                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5077  0b09 7b06          	ld	a,(OFST+5,sp)
5078  0b0b 97            	ld	xl,a
5079  0b0c a610          	ld	a,#16
5080  0b0e 42            	mul	x,a
5081  0b0f 9f            	ld	a,xl
5082  0b10 1a03          	or	a,(OFST+2,sp)
5083  0b12 6b01          	ld	(OFST+0,sp),a
5084  0b14 c65306        	ld	a,21254
5085  0b17 a40c          	and	a,#12
5086  0b19 1a01          	or	a,(OFST+0,sp)
5087  0b1b c75306        	ld	21254,a
5088                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5090  0b1e 0d02          	tnz	(OFST+1,sp)
5091  0b20 2706          	jreq	L3102
5092                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
5094  0b22 721a5308      	bset	21256,#5
5096  0b26 2004          	jra	L5102
5097  0b28               L3102:
5098                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5100  0b28 721b5308      	bres	21256,#5
5101  0b2c               L5102:
5102                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
5104  0b2c 72185308      	bset	21256,#4
5105                     ; 1280 }
5108  0b30 5b03          	addw	sp,#3
5109  0b32 81            	ret
5155                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5155                     ; 1297                        uint8_t TIM2_ICFilter)
5155                     ; 1298 {
5156                     	switch	.text
5157  0b33               L7_TI3_Config:
5159  0b33 89            	pushw	x
5160  0b34 88            	push	a
5161       00000001      OFST:	set	1
5164                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5166  0b35 72115309      	bres	21257,#0
5167                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5167                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5169  0b39 7b06          	ld	a,(OFST+5,sp)
5170  0b3b 97            	ld	xl,a
5171  0b3c a610          	ld	a,#16
5172  0b3e 42            	mul	x,a
5173  0b3f 9f            	ld	a,xl
5174  0b40 1a03          	or	a,(OFST+2,sp)
5175  0b42 6b01          	ld	(OFST+0,sp),a
5176  0b44 c65307        	ld	a,21255
5177  0b47 a40c          	and	a,#12
5178  0b49 1a01          	or	a,(OFST+0,sp)
5179  0b4b c75307        	ld	21255,a
5180                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5182  0b4e 0d02          	tnz	(OFST+1,sp)
5183  0b50 2706          	jreq	L7302
5184                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
5186  0b52 72125309      	bset	21257,#1
5188  0b56 2004          	jra	L1402
5189  0b58               L7302:
5190                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5192  0b58 72135309      	bres	21257,#1
5193  0b5c               L1402:
5194                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
5196  0b5c 72105309      	bset	21257,#0
5197                     ; 1318 }
5200  0b60 5b03          	addw	sp,#3
5201  0b62 81            	ret
5214                     	xdef	_TIM2_ClearITPendingBit
5215                     	xdef	_TIM2_GetITStatus
5216                     	xdef	_TIM2_ClearFlag
5217                     	xdef	_TIM2_GetFlagStatus
5218                     	xdef	_TIM2_GetPrescaler
5219                     	xdef	_TIM2_GetCounter
5220                     	xdef	_TIM2_GetCapture3
5221                     	xdef	_TIM2_GetCapture2
5222                     	xdef	_TIM2_GetCapture1
5223                     	xdef	_TIM2_SetIC3Prescaler
5224                     	xdef	_TIM2_SetIC2Prescaler
5225                     	xdef	_TIM2_SetIC1Prescaler
5226                     	xdef	_TIM2_SetCompare3
5227                     	xdef	_TIM2_SetCompare2
5228                     	xdef	_TIM2_SetCompare1
5229                     	xdef	_TIM2_SetAutoreload
5230                     	xdef	_TIM2_SetCounter
5231                     	xdef	_TIM2_SelectOCxM
5232                     	xdef	_TIM2_CCxCmd
5233                     	xdef	_TIM2_OC3PolarityConfig
5234                     	xdef	_TIM2_OC2PolarityConfig
5235                     	xdef	_TIM2_OC1PolarityConfig
5236                     	xdef	_TIM2_GenerateEvent
5237                     	xdef	_TIM2_OC3PreloadConfig
5238                     	xdef	_TIM2_OC2PreloadConfig
5239                     	xdef	_TIM2_OC1PreloadConfig
5240                     	xdef	_TIM2_ARRPreloadConfig
5241                     	xdef	_TIM2_ForcedOC3Config
5242                     	xdef	_TIM2_ForcedOC2Config
5243                     	xdef	_TIM2_ForcedOC1Config
5244                     	xdef	_TIM2_PrescalerConfig
5245                     	xdef	_TIM2_SelectOnePulseMode
5246                     	xdef	_TIM2_UpdateRequestConfig
5247                     	xdef	_TIM2_UpdateDisableConfig
5248                     	xdef	_TIM2_ITConfig
5249                     	xdef	_TIM2_Cmd
5250                     	xdef	_TIM2_PWMIConfig
5251                     	xdef	_TIM2_ICInit
5252                     	xdef	_TIM2_OC3Init
5253                     	xdef	_TIM2_OC2Init
5254                     	xdef	_TIM2_OC1Init
5255                     	xdef	_TIM2_TimeBaseInit
5256                     	xdef	_TIM2_DeInit
5257                     	xref	_assert_failed
5258                     .const:	section	.text
5259  0000               L302:
5260  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
5261  0012 696d322e6300  	dc.b	"im2.c",0
5281                     	end

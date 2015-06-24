   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 45 void TIM3_DeInit(void)
  44                     ; 46 {
  46                     	switch	.text
  47  0000               _TIM3_DeInit:
  51                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  53  0000 725f5320      	clr	21280
  54                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  56  0004 725f5321      	clr	21281
  57                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  59  0008 725f5323      	clr	21283
  60                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  62  000c 725f5327      	clr	21287
  63                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  65  0010 725f5327      	clr	21287
  66                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  68  0014 725f5325      	clr	21285
  69                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  71  0018 725f5326      	clr	21286
  72                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  74  001c 725f5328      	clr	21288
  75                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  77  0020 725f5329      	clr	21289
  78                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  80  0024 725f532a      	clr	21290
  81                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  83  0028 35ff532b      	mov	21291,#255
  84                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  86  002c 35ff532c      	mov	21292,#255
  87                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  89  0030 725f532d      	clr	21293
  90                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  92  0034 725f532e      	clr	21294
  93                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  95  0038 725f532f      	clr	21295
  96                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  98  003c 725f5330      	clr	21296
  99                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 101  0040 725f5322      	clr	21282
 102                     ; 69 }
 105  0044 81            	ret
 273                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 273                     ; 79                         uint16_t TIM3_Period)
 273                     ; 80 {
 274                     	switch	.text
 275  0045               _TIM3_TimeBaseInit:
 277  0045 88            	push	a
 278       00000000      OFST:	set	0
 281                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 283  0046 c7532a        	ld	21290,a
 284                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 286  0049 7b04          	ld	a,(OFST+4,sp)
 287  004b c7532b        	ld	21291,a
 288                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 290  004e 7b05          	ld	a,(OFST+5,sp)
 291  0050 c7532c        	ld	21292,a
 292                     ; 86 }
 295  0053 84            	pop	a
 296  0054 81            	ret
 454                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 454                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 454                     ; 98                   uint16_t TIM3_Pulse,
 454                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 454                     ; 100 {
 455                     	switch	.text
 456  0055               _TIM3_OC1Init:
 458  0055 89            	pushw	x
 459  0056 88            	push	a
 460       00000001      OFST:	set	1
 463                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 465  0057 9e            	ld	a,xh
 466  0058 4d            	tnz	a
 467  0059 2719          	jreq	L41
 468  005b 9e            	ld	a,xh
 469  005c a110          	cp	a,#16
 470  005e 2714          	jreq	L41
 471  0060 9e            	ld	a,xh
 472  0061 a120          	cp	a,#32
 473  0063 270f          	jreq	L41
 474  0065 9e            	ld	a,xh
 475  0066 a130          	cp	a,#48
 476  0068 270a          	jreq	L41
 477  006a 9e            	ld	a,xh
 478  006b a160          	cp	a,#96
 479  006d 2705          	jreq	L41
 480  006f 9e            	ld	a,xh
 481  0070 a170          	cp	a,#112
 482  0072 2603          	jrne	L21
 483  0074               L41:
 484  0074 4f            	clr	a
 485  0075 2010          	jra	L61
 486  0077               L21:
 487  0077 ae0066        	ldw	x,#102
 488  007a 89            	pushw	x
 489  007b ae0000        	ldw	x,#0
 490  007e 89            	pushw	x
 491  007f ae0000        	ldw	x,#L502
 492  0082 cd0000        	call	_assert_failed
 494  0085 5b04          	addw	sp,#4
 495  0087               L61:
 496                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 498  0087 0d03          	tnz	(OFST+2,sp)
 499  0089 2706          	jreq	L22
 500  008b 7b03          	ld	a,(OFST+2,sp)
 501  008d a111          	cp	a,#17
 502  008f 2603          	jrne	L02
 503  0091               L22:
 504  0091 4f            	clr	a
 505  0092 2010          	jra	L42
 506  0094               L02:
 507  0094 ae0067        	ldw	x,#103
 508  0097 89            	pushw	x
 509  0098 ae0000        	ldw	x,#0
 510  009b 89            	pushw	x
 511  009c ae0000        	ldw	x,#L502
 512  009f cd0000        	call	_assert_failed
 514  00a2 5b04          	addw	sp,#4
 515  00a4               L42:
 516                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 518  00a4 0d08          	tnz	(OFST+7,sp)
 519  00a6 2706          	jreq	L03
 520  00a8 7b08          	ld	a,(OFST+7,sp)
 521  00aa a122          	cp	a,#34
 522  00ac 2603          	jrne	L62
 523  00ae               L03:
 524  00ae 4f            	clr	a
 525  00af 2010          	jra	L23
 526  00b1               L62:
 527  00b1 ae0068        	ldw	x,#104
 528  00b4 89            	pushw	x
 529  00b5 ae0000        	ldw	x,#0
 530  00b8 89            	pushw	x
 531  00b9 ae0000        	ldw	x,#L502
 532  00bc cd0000        	call	_assert_failed
 534  00bf 5b04          	addw	sp,#4
 535  00c1               L23:
 536                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 538  00c1 c65327        	ld	a,21287
 539  00c4 a4fc          	and	a,#252
 540  00c6 c75327        	ld	21287,a
 541                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 543  00c9 7b08          	ld	a,(OFST+7,sp)
 544  00cb a402          	and	a,#2
 545  00cd 6b01          	ld	(OFST+0,sp),a
 546  00cf 7b03          	ld	a,(OFST+2,sp)
 547  00d1 a401          	and	a,#1
 548  00d3 1a01          	or	a,(OFST+0,sp)
 549  00d5 ca5327        	or	a,21287
 550  00d8 c75327        	ld	21287,a
 551                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 553  00db c65325        	ld	a,21285
 554  00de a48f          	and	a,#143
 555  00e0 1a02          	or	a,(OFST+1,sp)
 556  00e2 c75325        	ld	21285,a
 557                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 559  00e5 7b06          	ld	a,(OFST+5,sp)
 560  00e7 c7532d        	ld	21293,a
 561                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 563  00ea 7b07          	ld	a,(OFST+6,sp)
 564  00ec c7532e        	ld	21294,a
 565                     ; 117 }
 568  00ef 5b03          	addw	sp,#3
 569  00f1 81            	ret
 634                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 634                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 634                     ; 130                   uint16_t TIM3_Pulse,
 634                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 634                     ; 132 {
 635                     	switch	.text
 636  00f2               _TIM3_OC2Init:
 638  00f2 89            	pushw	x
 639  00f3 88            	push	a
 640       00000001      OFST:	set	1
 643                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 645  00f4 9e            	ld	a,xh
 646  00f5 4d            	tnz	a
 647  00f6 2719          	jreq	L04
 648  00f8 9e            	ld	a,xh
 649  00f9 a110          	cp	a,#16
 650  00fb 2714          	jreq	L04
 651  00fd 9e            	ld	a,xh
 652  00fe a120          	cp	a,#32
 653  0100 270f          	jreq	L04
 654  0102 9e            	ld	a,xh
 655  0103 a130          	cp	a,#48
 656  0105 270a          	jreq	L04
 657  0107 9e            	ld	a,xh
 658  0108 a160          	cp	a,#96
 659  010a 2705          	jreq	L04
 660  010c 9e            	ld	a,xh
 661  010d a170          	cp	a,#112
 662  010f 2603          	jrne	L63
 663  0111               L04:
 664  0111 4f            	clr	a
 665  0112 2010          	jra	L24
 666  0114               L63:
 667  0114 ae0086        	ldw	x,#134
 668  0117 89            	pushw	x
 669  0118 ae0000        	ldw	x,#0
 670  011b 89            	pushw	x
 671  011c ae0000        	ldw	x,#L502
 672  011f cd0000        	call	_assert_failed
 674  0122 5b04          	addw	sp,#4
 675  0124               L24:
 676                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 678  0124 0d03          	tnz	(OFST+2,sp)
 679  0126 2706          	jreq	L64
 680  0128 7b03          	ld	a,(OFST+2,sp)
 681  012a a111          	cp	a,#17
 682  012c 2603          	jrne	L44
 683  012e               L64:
 684  012e 4f            	clr	a
 685  012f 2010          	jra	L05
 686  0131               L44:
 687  0131 ae0087        	ldw	x,#135
 688  0134 89            	pushw	x
 689  0135 ae0000        	ldw	x,#0
 690  0138 89            	pushw	x
 691  0139 ae0000        	ldw	x,#L502
 692  013c cd0000        	call	_assert_failed
 694  013f 5b04          	addw	sp,#4
 695  0141               L05:
 696                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 698  0141 0d08          	tnz	(OFST+7,sp)
 699  0143 2706          	jreq	L45
 700  0145 7b08          	ld	a,(OFST+7,sp)
 701  0147 a122          	cp	a,#34
 702  0149 2603          	jrne	L25
 703  014b               L45:
 704  014b 4f            	clr	a
 705  014c 2010          	jra	L65
 706  014e               L25:
 707  014e ae0088        	ldw	x,#136
 708  0151 89            	pushw	x
 709  0152 ae0000        	ldw	x,#0
 710  0155 89            	pushw	x
 711  0156 ae0000        	ldw	x,#L502
 712  0159 cd0000        	call	_assert_failed
 714  015c 5b04          	addw	sp,#4
 715  015e               L65:
 716                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 718  015e c65327        	ld	a,21287
 719  0161 a4cf          	and	a,#207
 720  0163 c75327        	ld	21287,a
 721                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 723  0166 7b08          	ld	a,(OFST+7,sp)
 724  0168 a420          	and	a,#32
 725  016a 6b01          	ld	(OFST+0,sp),a
 726  016c 7b03          	ld	a,(OFST+2,sp)
 727  016e a410          	and	a,#16
 728  0170 1a01          	or	a,(OFST+0,sp)
 729  0172 ca5327        	or	a,21287
 730  0175 c75327        	ld	21287,a
 731                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 733  0178 c65326        	ld	a,21286
 734  017b a48f          	and	a,#143
 735  017d 1a02          	or	a,(OFST+1,sp)
 736  017f c75326        	ld	21286,a
 737                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 739  0182 7b06          	ld	a,(OFST+5,sp)
 740  0184 c7532f        	ld	21295,a
 741                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 743  0187 7b07          	ld	a,(OFST+6,sp)
 744  0189 c75330        	ld	21296,a
 745                     ; 152 }
 748  018c 5b03          	addw	sp,#3
 749  018e 81            	ret
 934                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 934                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 934                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 934                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 934                     ; 167                  uint8_t TIM3_ICFilter)
 934                     ; 168 {
 935                     	switch	.text
 936  018f               _TIM3_ICInit:
 938  018f 89            	pushw	x
 939       00000000      OFST:	set	0
 942                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 944  0190 9e            	ld	a,xh
 945  0191 4d            	tnz	a
 946  0192 2705          	jreq	L46
 947  0194 9e            	ld	a,xh
 948  0195 a101          	cp	a,#1
 949  0197 2603          	jrne	L26
 950  0199               L46:
 951  0199 4f            	clr	a
 952  019a 2010          	jra	L66
 953  019c               L26:
 954  019c ae00aa        	ldw	x,#170
 955  019f 89            	pushw	x
 956  01a0 ae0000        	ldw	x,#0
 957  01a3 89            	pushw	x
 958  01a4 ae0000        	ldw	x,#L502
 959  01a7 cd0000        	call	_assert_failed
 961  01aa 5b04          	addw	sp,#4
 962  01ac               L66:
 963                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 965  01ac 0d02          	tnz	(OFST+2,sp)
 966  01ae 2706          	jreq	L27
 967  01b0 7b02          	ld	a,(OFST+2,sp)
 968  01b2 a144          	cp	a,#68
 969  01b4 2603          	jrne	L07
 970  01b6               L27:
 971  01b6 4f            	clr	a
 972  01b7 2010          	jra	L47
 973  01b9               L07:
 974  01b9 ae00ab        	ldw	x,#171
 975  01bc 89            	pushw	x
 976  01bd ae0000        	ldw	x,#0
 977  01c0 89            	pushw	x
 978  01c1 ae0000        	ldw	x,#L502
 979  01c4 cd0000        	call	_assert_failed
 981  01c7 5b04          	addw	sp,#4
 982  01c9               L47:
 983                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 985  01c9 7b05          	ld	a,(OFST+5,sp)
 986  01cb a101          	cp	a,#1
 987  01cd 270c          	jreq	L001
 988  01cf 7b05          	ld	a,(OFST+5,sp)
 989  01d1 a102          	cp	a,#2
 990  01d3 2706          	jreq	L001
 991  01d5 7b05          	ld	a,(OFST+5,sp)
 992  01d7 a103          	cp	a,#3
 993  01d9 2603          	jrne	L67
 994  01db               L001:
 995  01db 4f            	clr	a
 996  01dc 2010          	jra	L201
 997  01de               L67:
 998  01de ae00ac        	ldw	x,#172
 999  01e1 89            	pushw	x
1000  01e2 ae0000        	ldw	x,#0
1001  01e5 89            	pushw	x
1002  01e6 ae0000        	ldw	x,#L502
1003  01e9 cd0000        	call	_assert_failed
1005  01ec 5b04          	addw	sp,#4
1006  01ee               L201:
1007                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1009  01ee 0d06          	tnz	(OFST+6,sp)
1010  01f0 2712          	jreq	L601
1011  01f2 7b06          	ld	a,(OFST+6,sp)
1012  01f4 a104          	cp	a,#4
1013  01f6 270c          	jreq	L601
1014  01f8 7b06          	ld	a,(OFST+6,sp)
1015  01fa a108          	cp	a,#8
1016  01fc 2706          	jreq	L601
1017  01fe 7b06          	ld	a,(OFST+6,sp)
1018  0200 a10c          	cp	a,#12
1019  0202 2603          	jrne	L401
1020  0204               L601:
1021  0204 4f            	clr	a
1022  0205 2010          	jra	L011
1023  0207               L401:
1024  0207 ae00ad        	ldw	x,#173
1025  020a 89            	pushw	x
1026  020b ae0000        	ldw	x,#0
1027  020e 89            	pushw	x
1028  020f ae0000        	ldw	x,#L502
1029  0212 cd0000        	call	_assert_failed
1031  0215 5b04          	addw	sp,#4
1032  0217               L011:
1033                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
1035  0217 7b07          	ld	a,(OFST+7,sp)
1036  0219 a110          	cp	a,#16
1037  021b 2403          	jruge	L211
1038  021d 4f            	clr	a
1039  021e 2010          	jra	L411
1040  0220               L211:
1041  0220 ae00ae        	ldw	x,#174
1042  0223 89            	pushw	x
1043  0224 ae0000        	ldw	x,#0
1044  0227 89            	pushw	x
1045  0228 ae0000        	ldw	x,#L502
1046  022b cd0000        	call	_assert_failed
1048  022e 5b04          	addw	sp,#4
1049  0230               L411:
1050                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
1052  0230 7b01          	ld	a,(OFST+1,sp)
1053  0232 a101          	cp	a,#1
1054  0234 2714          	jreq	L543
1055                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
1055                     ; 180                    (uint8_t)TIM3_ICSelection,
1055                     ; 181                    (uint8_t)TIM3_ICFilter);
1057  0236 7b07          	ld	a,(OFST+7,sp)
1058  0238 88            	push	a
1059  0239 7b06          	ld	a,(OFST+6,sp)
1060  023b 97            	ld	xl,a
1061  023c 7b03          	ld	a,(OFST+3,sp)
1062  023e 95            	ld	xh,a
1063  023f cd08e9        	call	L3_TI1_Config
1065  0242 84            	pop	a
1066                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1068  0243 7b06          	ld	a,(OFST+6,sp)
1069  0245 cd073a        	call	_TIM3_SetIC1Prescaler
1072  0248 2012          	jra	L743
1073  024a               L543:
1074                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
1074                     ; 190                    (uint8_t)TIM3_ICSelection,
1074                     ; 191                    (uint8_t)TIM3_ICFilter);
1076  024a 7b07          	ld	a,(OFST+7,sp)
1077  024c 88            	push	a
1078  024d 7b06          	ld	a,(OFST+6,sp)
1079  024f 97            	ld	xl,a
1080  0250 7b03          	ld	a,(OFST+3,sp)
1081  0252 95            	ld	xh,a
1082  0253 cd0919        	call	L5_TI2_Config
1084  0256 84            	pop	a
1085                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1087  0257 7b06          	ld	a,(OFST+6,sp)
1088  0259 cd0769        	call	_TIM3_SetIC2Prescaler
1090  025c               L743:
1091                     ; 196 }
1094  025c 85            	popw	x
1095  025d 81            	ret
1192                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1192                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1192                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1192                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1192                     ; 210                      uint8_t TIM3_ICFilter)
1192                     ; 211 {
1193                     	switch	.text
1194  025e               _TIM3_PWMIConfig:
1196  025e 89            	pushw	x
1197  025f 89            	pushw	x
1198       00000002      OFST:	set	2
1201                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1203                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1205                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1207  0260 9e            	ld	a,xh
1208  0261 4d            	tnz	a
1209  0262 2705          	jreq	L221
1210  0264 9e            	ld	a,xh
1211  0265 a101          	cp	a,#1
1212  0267 2603          	jrne	L021
1213  0269               L221:
1214  0269 4f            	clr	a
1215  026a 2010          	jra	L421
1216  026c               L021:
1217  026c ae00d8        	ldw	x,#216
1218  026f 89            	pushw	x
1219  0270 ae0000        	ldw	x,#0
1220  0273 89            	pushw	x
1221  0274 ae0000        	ldw	x,#L502
1222  0277 cd0000        	call	_assert_failed
1224  027a 5b04          	addw	sp,#4
1225  027c               L421:
1226                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1228  027c 0d04          	tnz	(OFST+2,sp)
1229  027e 2706          	jreq	L031
1230  0280 7b04          	ld	a,(OFST+2,sp)
1231  0282 a144          	cp	a,#68
1232  0284 2603          	jrne	L621
1233  0286               L031:
1234  0286 4f            	clr	a
1235  0287 2010          	jra	L231
1236  0289               L621:
1237  0289 ae00d9        	ldw	x,#217
1238  028c 89            	pushw	x
1239  028d ae0000        	ldw	x,#0
1240  0290 89            	pushw	x
1241  0291 ae0000        	ldw	x,#L502
1242  0294 cd0000        	call	_assert_failed
1244  0297 5b04          	addw	sp,#4
1245  0299               L231:
1246                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1248  0299 7b07          	ld	a,(OFST+5,sp)
1249  029b a101          	cp	a,#1
1250  029d 270c          	jreq	L631
1251  029f 7b07          	ld	a,(OFST+5,sp)
1252  02a1 a102          	cp	a,#2
1253  02a3 2706          	jreq	L631
1254  02a5 7b07          	ld	a,(OFST+5,sp)
1255  02a7 a103          	cp	a,#3
1256  02a9 2603          	jrne	L431
1257  02ab               L631:
1258  02ab 4f            	clr	a
1259  02ac 2010          	jra	L041
1260  02ae               L431:
1261  02ae ae00da        	ldw	x,#218
1262  02b1 89            	pushw	x
1263  02b2 ae0000        	ldw	x,#0
1264  02b5 89            	pushw	x
1265  02b6 ae0000        	ldw	x,#L502
1266  02b9 cd0000        	call	_assert_failed
1268  02bc 5b04          	addw	sp,#4
1269  02be               L041:
1270                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1272  02be 0d08          	tnz	(OFST+6,sp)
1273  02c0 2712          	jreq	L441
1274  02c2 7b08          	ld	a,(OFST+6,sp)
1275  02c4 a104          	cp	a,#4
1276  02c6 270c          	jreq	L441
1277  02c8 7b08          	ld	a,(OFST+6,sp)
1278  02ca a108          	cp	a,#8
1279  02cc 2706          	jreq	L441
1280  02ce 7b08          	ld	a,(OFST+6,sp)
1281  02d0 a10c          	cp	a,#12
1282  02d2 2603          	jrne	L241
1283  02d4               L441:
1284  02d4 4f            	clr	a
1285  02d5 2010          	jra	L641
1286  02d7               L241:
1287  02d7 ae00db        	ldw	x,#219
1288  02da 89            	pushw	x
1289  02db ae0000        	ldw	x,#0
1290  02de 89            	pushw	x
1291  02df ae0000        	ldw	x,#L502
1292  02e2 cd0000        	call	_assert_failed
1294  02e5 5b04          	addw	sp,#4
1295  02e7               L641:
1296                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1298  02e7 7b04          	ld	a,(OFST+2,sp)
1299  02e9 a144          	cp	a,#68
1300  02eb 2706          	jreq	L714
1301                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1303  02ed a644          	ld	a,#68
1304  02ef 6b01          	ld	(OFST-1,sp),a
1306  02f1 2002          	jra	L124
1307  02f3               L714:
1308                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1310  02f3 0f01          	clr	(OFST-1,sp)
1311  02f5               L124:
1312                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1314  02f5 7b07          	ld	a,(OFST+5,sp)
1315  02f7 a101          	cp	a,#1
1316  02f9 2606          	jrne	L324
1317                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1319  02fb a602          	ld	a,#2
1320  02fd 6b02          	ld	(OFST+0,sp),a
1322  02ff 2004          	jra	L524
1323  0301               L324:
1324                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1326  0301 a601          	ld	a,#1
1327  0303 6b02          	ld	(OFST+0,sp),a
1328  0305               L524:
1329                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1331  0305 7b03          	ld	a,(OFST+1,sp)
1332  0307 a101          	cp	a,#1
1333  0309 2726          	jreq	L724
1334                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1334                     ; 245                    (uint8_t)TIM3_ICFilter);
1336  030b 7b09          	ld	a,(OFST+7,sp)
1337  030d 88            	push	a
1338  030e 7b08          	ld	a,(OFST+6,sp)
1339  0310 97            	ld	xl,a
1340  0311 7b05          	ld	a,(OFST+3,sp)
1341  0313 95            	ld	xh,a
1342  0314 cd08e9        	call	L3_TI1_Config
1344  0317 84            	pop	a
1345                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1347  0318 7b08          	ld	a,(OFST+6,sp)
1348  031a cd073a        	call	_TIM3_SetIC1Prescaler
1350                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1352  031d 7b09          	ld	a,(OFST+7,sp)
1353  031f 88            	push	a
1354  0320 7b03          	ld	a,(OFST+1,sp)
1355  0322 97            	ld	xl,a
1356  0323 7b02          	ld	a,(OFST+0,sp)
1357  0325 95            	ld	xh,a
1358  0326 cd0919        	call	L5_TI2_Config
1360  0329 84            	pop	a
1361                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1363  032a 7b08          	ld	a,(OFST+6,sp)
1364  032c cd0769        	call	_TIM3_SetIC2Prescaler
1367  032f 2024          	jra	L134
1368  0331               L724:
1369                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1369                     ; 260                    (uint8_t)TIM3_ICFilter);
1371  0331 7b09          	ld	a,(OFST+7,sp)
1372  0333 88            	push	a
1373  0334 7b08          	ld	a,(OFST+6,sp)
1374  0336 97            	ld	xl,a
1375  0337 7b05          	ld	a,(OFST+3,sp)
1376  0339 95            	ld	xh,a
1377  033a cd0919        	call	L5_TI2_Config
1379  033d 84            	pop	a
1380                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1382  033e 7b08          	ld	a,(OFST+6,sp)
1383  0340 cd0769        	call	_TIM3_SetIC2Prescaler
1385                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1387  0343 7b09          	ld	a,(OFST+7,sp)
1388  0345 88            	push	a
1389  0346 7b03          	ld	a,(OFST+1,sp)
1390  0348 97            	ld	xl,a
1391  0349 7b02          	ld	a,(OFST+0,sp)
1392  034b 95            	ld	xh,a
1393  034c cd08e9        	call	L3_TI1_Config
1395  034f 84            	pop	a
1396                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1398  0350 7b08          	ld	a,(OFST+6,sp)
1399  0352 cd073a        	call	_TIM3_SetIC1Prescaler
1401  0355               L134:
1402                     ; 271 }
1405  0355 5b04          	addw	sp,#4
1406  0357 81            	ret
1462                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1462                     ; 281 {
1463                     	switch	.text
1464  0358               _TIM3_Cmd:
1466  0358 88            	push	a
1467       00000000      OFST:	set	0
1470                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1472  0359 4d            	tnz	a
1473  035a 2704          	jreq	L451
1474  035c a101          	cp	a,#1
1475  035e 2603          	jrne	L251
1476  0360               L451:
1477  0360 4f            	clr	a
1478  0361 2010          	jra	L651
1479  0363               L251:
1480  0363 ae011b        	ldw	x,#283
1481  0366 89            	pushw	x
1482  0367 ae0000        	ldw	x,#0
1483  036a 89            	pushw	x
1484  036b ae0000        	ldw	x,#L502
1485  036e cd0000        	call	_assert_failed
1487  0371 5b04          	addw	sp,#4
1488  0373               L651:
1489                     ; 286     if (NewState != DISABLE)
1491  0373 0d01          	tnz	(OFST+1,sp)
1492  0375 2706          	jreq	L164
1493                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1495  0377 72105320      	bset	21280,#0
1497  037b 2004          	jra	L364
1498  037d               L164:
1499                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1501  037d 72115320      	bres	21280,#0
1502  0381               L364:
1503                     ; 294 }
1506  0381 84            	pop	a
1507  0382 81            	ret
1580                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1580                     ; 310 {
1581                     	switch	.text
1582  0383               _TIM3_ITConfig:
1584  0383 89            	pushw	x
1585       00000000      OFST:	set	0
1588                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1590  0384 9e            	ld	a,xh
1591  0385 4d            	tnz	a
1592  0386 2708          	jreq	L261
1593  0388 9e            	ld	a,xh
1594  0389 a108          	cp	a,#8
1595  038b 2403          	jruge	L261
1596  038d 4f            	clr	a
1597  038e 2010          	jra	L461
1598  0390               L261:
1599  0390 ae0138        	ldw	x,#312
1600  0393 89            	pushw	x
1601  0394 ae0000        	ldw	x,#0
1602  0397 89            	pushw	x
1603  0398 ae0000        	ldw	x,#L502
1604  039b cd0000        	call	_assert_failed
1606  039e 5b04          	addw	sp,#4
1607  03a0               L461:
1608                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1610  03a0 0d02          	tnz	(OFST+2,sp)
1611  03a2 2706          	jreq	L071
1612  03a4 7b02          	ld	a,(OFST+2,sp)
1613  03a6 a101          	cp	a,#1
1614  03a8 2603          	jrne	L661
1615  03aa               L071:
1616  03aa 4f            	clr	a
1617  03ab 2010          	jra	L271
1618  03ad               L661:
1619  03ad ae0139        	ldw	x,#313
1620  03b0 89            	pushw	x
1621  03b1 ae0000        	ldw	x,#0
1622  03b4 89            	pushw	x
1623  03b5 ae0000        	ldw	x,#L502
1624  03b8 cd0000        	call	_assert_failed
1626  03bb 5b04          	addw	sp,#4
1627  03bd               L271:
1628                     ; 315     if (NewState != DISABLE)
1630  03bd 0d02          	tnz	(OFST+2,sp)
1631  03bf 270a          	jreq	L125
1632                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1634  03c1 c65321        	ld	a,21281
1635  03c4 1a01          	or	a,(OFST+1,sp)
1636  03c6 c75321        	ld	21281,a
1638  03c9 2009          	jra	L325
1639  03cb               L125:
1640                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1642  03cb 7b01          	ld	a,(OFST+1,sp)
1643  03cd 43            	cpl	a
1644  03ce c45321        	and	a,21281
1645  03d1 c75321        	ld	21281,a
1646  03d4               L325:
1647                     ; 325 }
1650  03d4 85            	popw	x
1651  03d5 81            	ret
1688                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1688                     ; 335 {
1689                     	switch	.text
1690  03d6               _TIM3_UpdateDisableConfig:
1692  03d6 88            	push	a
1693       00000000      OFST:	set	0
1696                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1698  03d7 4d            	tnz	a
1699  03d8 2704          	jreq	L002
1700  03da a101          	cp	a,#1
1701  03dc 2603          	jrne	L671
1702  03de               L002:
1703  03de 4f            	clr	a
1704  03df 2010          	jra	L202
1705  03e1               L671:
1706  03e1 ae0151        	ldw	x,#337
1707  03e4 89            	pushw	x
1708  03e5 ae0000        	ldw	x,#0
1709  03e8 89            	pushw	x
1710  03e9 ae0000        	ldw	x,#L502
1711  03ec cd0000        	call	_assert_failed
1713  03ef 5b04          	addw	sp,#4
1714  03f1               L202:
1715                     ; 340     if (NewState != DISABLE)
1717  03f1 0d01          	tnz	(OFST+1,sp)
1718  03f3 2706          	jreq	L345
1719                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1721  03f5 72125320      	bset	21280,#1
1723  03f9 2004          	jra	L545
1724  03fb               L345:
1725                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1727  03fb 72135320      	bres	21280,#1
1728  03ff               L545:
1729                     ; 348 }
1732  03ff 84            	pop	a
1733  0400 81            	ret
1792                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1792                     ; 359 {
1793                     	switch	.text
1794  0401               _TIM3_UpdateRequestConfig:
1796  0401 88            	push	a
1797       00000000      OFST:	set	0
1800                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1802  0402 4d            	tnz	a
1803  0403 2704          	jreq	L012
1804  0405 a101          	cp	a,#1
1805  0407 2603          	jrne	L602
1806  0409               L012:
1807  0409 4f            	clr	a
1808  040a 2010          	jra	L212
1809  040c               L602:
1810  040c ae0169        	ldw	x,#361
1811  040f 89            	pushw	x
1812  0410 ae0000        	ldw	x,#0
1813  0413 89            	pushw	x
1814  0414 ae0000        	ldw	x,#L502
1815  0417 cd0000        	call	_assert_failed
1817  041a 5b04          	addw	sp,#4
1818  041c               L212:
1819                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1821  041c 0d01          	tnz	(OFST+1,sp)
1822  041e 2706          	jreq	L575
1823                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1825  0420 72145320      	bset	21280,#2
1827  0424 2004          	jra	L775
1828  0426               L575:
1829                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1831  0426 72155320      	bres	21280,#2
1832  042a               L775:
1833                     ; 372 }
1836  042a 84            	pop	a
1837  042b 81            	ret
1895                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1895                     ; 384 {
1896                     	switch	.text
1897  042c               _TIM3_SelectOnePulseMode:
1899  042c 88            	push	a
1900       00000000      OFST:	set	0
1903                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1905  042d a101          	cp	a,#1
1906  042f 2703          	jreq	L022
1907  0431 4d            	tnz	a
1908  0432 2603          	jrne	L612
1909  0434               L022:
1910  0434 4f            	clr	a
1911  0435 2010          	jra	L222
1912  0437               L612:
1913  0437 ae0182        	ldw	x,#386
1914  043a 89            	pushw	x
1915  043b ae0000        	ldw	x,#0
1916  043e 89            	pushw	x
1917  043f ae0000        	ldw	x,#L502
1918  0442 cd0000        	call	_assert_failed
1920  0445 5b04          	addw	sp,#4
1921  0447               L222:
1922                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1924  0447 0d01          	tnz	(OFST+1,sp)
1925  0449 2706          	jreq	L726
1926                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1928  044b 72165320      	bset	21280,#3
1930  044f 2004          	jra	L136
1931  0451               L726:
1932                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1934  0451 72175320      	bres	21280,#3
1935  0455               L136:
1936                     ; 398 }
1939  0455 84            	pop	a
1940  0456 81            	ret
2009                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
2009                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
2009                     ; 431 {
2010                     	switch	.text
2011  0457               _TIM3_PrescalerConfig:
2013  0457 89            	pushw	x
2014       00000000      OFST:	set	0
2017                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
2019  0458 9f            	ld	a,xl
2020  0459 4d            	tnz	a
2021  045a 2705          	jreq	L032
2022  045c 9f            	ld	a,xl
2023  045d a101          	cp	a,#1
2024  045f 2603          	jrne	L622
2025  0461               L032:
2026  0461 4f            	clr	a
2027  0462 2010          	jra	L232
2028  0464               L622:
2029  0464 ae01b1        	ldw	x,#433
2030  0467 89            	pushw	x
2031  0468 ae0000        	ldw	x,#0
2032  046b 89            	pushw	x
2033  046c ae0000        	ldw	x,#L502
2034  046f cd0000        	call	_assert_failed
2036  0472 5b04          	addw	sp,#4
2037  0474               L232:
2038                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
2040  0474 0d01          	tnz	(OFST+1,sp)
2041  0476 275a          	jreq	L632
2042  0478 7b01          	ld	a,(OFST+1,sp)
2043  047a a101          	cp	a,#1
2044  047c 2754          	jreq	L632
2045  047e 7b01          	ld	a,(OFST+1,sp)
2046  0480 a102          	cp	a,#2
2047  0482 274e          	jreq	L632
2048  0484 7b01          	ld	a,(OFST+1,sp)
2049  0486 a103          	cp	a,#3
2050  0488 2748          	jreq	L632
2051  048a 7b01          	ld	a,(OFST+1,sp)
2052  048c a104          	cp	a,#4
2053  048e 2742          	jreq	L632
2054  0490 7b01          	ld	a,(OFST+1,sp)
2055  0492 a105          	cp	a,#5
2056  0494 273c          	jreq	L632
2057  0496 7b01          	ld	a,(OFST+1,sp)
2058  0498 a106          	cp	a,#6
2059  049a 2736          	jreq	L632
2060  049c 7b01          	ld	a,(OFST+1,sp)
2061  049e a107          	cp	a,#7
2062  04a0 2730          	jreq	L632
2063  04a2 7b01          	ld	a,(OFST+1,sp)
2064  04a4 a108          	cp	a,#8
2065  04a6 272a          	jreq	L632
2066  04a8 7b01          	ld	a,(OFST+1,sp)
2067  04aa a109          	cp	a,#9
2068  04ac 2724          	jreq	L632
2069  04ae 7b01          	ld	a,(OFST+1,sp)
2070  04b0 a10a          	cp	a,#10
2071  04b2 271e          	jreq	L632
2072  04b4 7b01          	ld	a,(OFST+1,sp)
2073  04b6 a10b          	cp	a,#11
2074  04b8 2718          	jreq	L632
2075  04ba 7b01          	ld	a,(OFST+1,sp)
2076  04bc a10c          	cp	a,#12
2077  04be 2712          	jreq	L632
2078  04c0 7b01          	ld	a,(OFST+1,sp)
2079  04c2 a10d          	cp	a,#13
2080  04c4 270c          	jreq	L632
2081  04c6 7b01          	ld	a,(OFST+1,sp)
2082  04c8 a10e          	cp	a,#14
2083  04ca 2706          	jreq	L632
2084  04cc 7b01          	ld	a,(OFST+1,sp)
2085  04ce a10f          	cp	a,#15
2086  04d0 2603          	jrne	L432
2087  04d2               L632:
2088  04d2 4f            	clr	a
2089  04d3 2010          	jra	L042
2090  04d5               L432:
2091  04d5 ae01b2        	ldw	x,#434
2092  04d8 89            	pushw	x
2093  04d9 ae0000        	ldw	x,#0
2094  04dc 89            	pushw	x
2095  04dd ae0000        	ldw	x,#L502
2096  04e0 cd0000        	call	_assert_failed
2098  04e3 5b04          	addw	sp,#4
2099  04e5               L042:
2100                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
2102  04e5 7b01          	ld	a,(OFST+1,sp)
2103  04e7 c7532a        	ld	21290,a
2104                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
2106  04ea 7b02          	ld	a,(OFST+2,sp)
2107  04ec c75324        	ld	21284,a
2108                     ; 441 }
2111  04ef 85            	popw	x
2112  04f0 81            	ret
2171                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2171                     ; 453 {
2172                     	switch	.text
2173  04f1               _TIM3_ForcedOC1Config:
2175  04f1 88            	push	a
2176       00000000      OFST:	set	0
2179                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2181  04f2 a150          	cp	a,#80
2182  04f4 2704          	jreq	L642
2183  04f6 a140          	cp	a,#64
2184  04f8 2603          	jrne	L442
2185  04fa               L642:
2186  04fa 4f            	clr	a
2187  04fb 2010          	jra	L052
2188  04fd               L442:
2189  04fd ae01c7        	ldw	x,#455
2190  0500 89            	pushw	x
2191  0501 ae0000        	ldw	x,#0
2192  0504 89            	pushw	x
2193  0505 ae0000        	ldw	x,#L502
2194  0508 cd0000        	call	_assert_failed
2196  050b 5b04          	addw	sp,#4
2197  050d               L052:
2198                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2200  050d c65325        	ld	a,21285
2201  0510 a48f          	and	a,#143
2202  0512 1a01          	or	a,(OFST+1,sp)
2203  0514 c75325        	ld	21285,a
2204                     ; 459 }
2207  0517 84            	pop	a
2208  0518 81            	ret
2245                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2245                     ; 471 {
2246                     	switch	.text
2247  0519               _TIM3_ForcedOC2Config:
2249  0519 88            	push	a
2250       00000000      OFST:	set	0
2253                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2255  051a a150          	cp	a,#80
2256  051c 2704          	jreq	L652
2257  051e a140          	cp	a,#64
2258  0520 2603          	jrne	L452
2259  0522               L652:
2260  0522 4f            	clr	a
2261  0523 2010          	jra	L062
2262  0525               L452:
2263  0525 ae01d9        	ldw	x,#473
2264  0528 89            	pushw	x
2265  0529 ae0000        	ldw	x,#0
2266  052c 89            	pushw	x
2267  052d ae0000        	ldw	x,#L502
2268  0530 cd0000        	call	_assert_failed
2270  0533 5b04          	addw	sp,#4
2271  0535               L062:
2272                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2274  0535 c65326        	ld	a,21286
2275  0538 a48f          	and	a,#143
2276  053a 1a01          	or	a,(OFST+1,sp)
2277  053c c75326        	ld	21286,a
2278                     ; 477 }
2281  053f 84            	pop	a
2282  0540 81            	ret
2319                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2319                     ; 487 {
2320                     	switch	.text
2321  0541               _TIM3_ARRPreloadConfig:
2323  0541 88            	push	a
2324       00000000      OFST:	set	0
2327                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2329  0542 4d            	tnz	a
2330  0543 2704          	jreq	L662
2331  0545 a101          	cp	a,#1
2332  0547 2603          	jrne	L462
2333  0549               L662:
2334  0549 4f            	clr	a
2335  054a 2010          	jra	L072
2336  054c               L462:
2337  054c ae01e9        	ldw	x,#489
2338  054f 89            	pushw	x
2339  0550 ae0000        	ldw	x,#0
2340  0553 89            	pushw	x
2341  0554 ae0000        	ldw	x,#L502
2342  0557 cd0000        	call	_assert_failed
2344  055a 5b04          	addw	sp,#4
2345  055c               L072:
2346                     ; 492     if (NewState != DISABLE)
2348  055c 0d01          	tnz	(OFST+1,sp)
2349  055e 2706          	jreq	L747
2350                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
2352  0560 721e5320      	bset	21280,#7
2354  0564 2004          	jra	L157
2355  0566               L747:
2356                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2358  0566 721f5320      	bres	21280,#7
2359  056a               L157:
2360                     ; 500 }
2363  056a 84            	pop	a
2364  056b 81            	ret
2401                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2401                     ; 510 {
2402                     	switch	.text
2403  056c               _TIM3_OC1PreloadConfig:
2405  056c 88            	push	a
2406       00000000      OFST:	set	0
2409                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2411  056d 4d            	tnz	a
2412  056e 2704          	jreq	L672
2413  0570 a101          	cp	a,#1
2414  0572 2603          	jrne	L472
2415  0574               L672:
2416  0574 4f            	clr	a
2417  0575 2010          	jra	L003
2418  0577               L472:
2419  0577 ae0200        	ldw	x,#512
2420  057a 89            	pushw	x
2421  057b ae0000        	ldw	x,#0
2422  057e 89            	pushw	x
2423  057f ae0000        	ldw	x,#L502
2424  0582 cd0000        	call	_assert_failed
2426  0585 5b04          	addw	sp,#4
2427  0587               L003:
2428                     ; 515     if (NewState != DISABLE)
2430  0587 0d01          	tnz	(OFST+1,sp)
2431  0589 2706          	jreq	L177
2432                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2434  058b 72165325      	bset	21285,#3
2436  058f 2004          	jra	L377
2437  0591               L177:
2438                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2440  0591 72175325      	bres	21285,#3
2441  0595               L377:
2442                     ; 523 }
2445  0595 84            	pop	a
2446  0596 81            	ret
2483                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2483                     ; 533 {
2484                     	switch	.text
2485  0597               _TIM3_OC2PreloadConfig:
2487  0597 88            	push	a
2488       00000000      OFST:	set	0
2491                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2493  0598 4d            	tnz	a
2494  0599 2704          	jreq	L603
2495  059b a101          	cp	a,#1
2496  059d 2603          	jrne	L403
2497  059f               L603:
2498  059f 4f            	clr	a
2499  05a0 2010          	jra	L013
2500  05a2               L403:
2501  05a2 ae0217        	ldw	x,#535
2502  05a5 89            	pushw	x
2503  05a6 ae0000        	ldw	x,#0
2504  05a9 89            	pushw	x
2505  05aa ae0000        	ldw	x,#L502
2506  05ad cd0000        	call	_assert_failed
2508  05b0 5b04          	addw	sp,#4
2509  05b2               L013:
2510                     ; 538     if (NewState != DISABLE)
2512  05b2 0d01          	tnz	(OFST+1,sp)
2513  05b4 2706          	jreq	L3101
2514                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2516  05b6 72165326      	bset	21286,#3
2518  05ba 2004          	jra	L5101
2519  05bc               L3101:
2520                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2522  05bc 72175326      	bres	21286,#3
2523  05c0               L5101:
2524                     ; 546 }
2527  05c0 84            	pop	a
2528  05c1 81            	ret
2594                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2594                     ; 558 {
2595                     	switch	.text
2596  05c2               _TIM3_GenerateEvent:
2598  05c2 88            	push	a
2599       00000000      OFST:	set	0
2602                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2604  05c3 4d            	tnz	a
2605  05c4 2703          	jreq	L413
2606  05c6 4f            	clr	a
2607  05c7 2010          	jra	L613
2608  05c9               L413:
2609  05c9 ae0230        	ldw	x,#560
2610  05cc 89            	pushw	x
2611  05cd ae0000        	ldw	x,#0
2612  05d0 89            	pushw	x
2613  05d1 ae0000        	ldw	x,#L502
2614  05d4 cd0000        	call	_assert_failed
2616  05d7 5b04          	addw	sp,#4
2617  05d9               L613:
2618                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
2620  05d9 7b01          	ld	a,(OFST+1,sp)
2621  05db c75324        	ld	21284,a
2622                     ; 564 }
2625  05de 84            	pop	a
2626  05df 81            	ret
2663                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2663                     ; 576 {
2664                     	switch	.text
2665  05e0               _TIM3_OC1PolarityConfig:
2667  05e0 88            	push	a
2668       00000000      OFST:	set	0
2671                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2673  05e1 4d            	tnz	a
2674  05e2 2704          	jreq	L423
2675  05e4 a122          	cp	a,#34
2676  05e6 2603          	jrne	L223
2677  05e8               L423:
2678  05e8 4f            	clr	a
2679  05e9 2010          	jra	L623
2680  05eb               L223:
2681  05eb ae0242        	ldw	x,#578
2682  05ee 89            	pushw	x
2683  05ef ae0000        	ldw	x,#0
2684  05f2 89            	pushw	x
2685  05f3 ae0000        	ldw	x,#L502
2686  05f6 cd0000        	call	_assert_failed
2688  05f9 5b04          	addw	sp,#4
2689  05fb               L623:
2690                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2692  05fb 0d01          	tnz	(OFST+1,sp)
2693  05fd 2706          	jreq	L5601
2694                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2696  05ff 72125327      	bset	21287,#1
2698  0603 2004          	jra	L7601
2699  0605               L5601:
2700                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2702  0605 72135327      	bres	21287,#1
2703  0609               L7601:
2704                     ; 589 }
2707  0609 84            	pop	a
2708  060a 81            	ret
2745                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2745                     ; 601 {
2746                     	switch	.text
2747  060b               _TIM3_OC2PolarityConfig:
2749  060b 88            	push	a
2750       00000000      OFST:	set	0
2753                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2755  060c 4d            	tnz	a
2756  060d 2704          	jreq	L433
2757  060f a122          	cp	a,#34
2758  0611 2603          	jrne	L233
2759  0613               L433:
2760  0613 4f            	clr	a
2761  0614 2010          	jra	L633
2762  0616               L233:
2763  0616 ae025b        	ldw	x,#603
2764  0619 89            	pushw	x
2765  061a ae0000        	ldw	x,#0
2766  061d 89            	pushw	x
2767  061e ae0000        	ldw	x,#L502
2768  0621 cd0000        	call	_assert_failed
2770  0624 5b04          	addw	sp,#4
2771  0626               L633:
2772                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2774  0626 0d01          	tnz	(OFST+1,sp)
2775  0628 2706          	jreq	L7011
2776                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2778  062a 721a5327      	bset	21287,#5
2780  062e 2004          	jra	L1111
2781  0630               L7011:
2782                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2784  0630 721b5327      	bres	21287,#5
2785  0634               L1111:
2786                     ; 614 }
2789  0634 84            	pop	a
2790  0635 81            	ret
2836                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2836                     ; 628 {
2837                     	switch	.text
2838  0636               _TIM3_CCxCmd:
2840  0636 89            	pushw	x
2841       00000000      OFST:	set	0
2844                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2846  0637 9e            	ld	a,xh
2847  0638 4d            	tnz	a
2848  0639 2705          	jreq	L443
2849  063b 9e            	ld	a,xh
2850  063c a101          	cp	a,#1
2851  063e 2603          	jrne	L243
2852  0640               L443:
2853  0640 4f            	clr	a
2854  0641 2010          	jra	L643
2855  0643               L243:
2856  0643 ae0276        	ldw	x,#630
2857  0646 89            	pushw	x
2858  0647 ae0000        	ldw	x,#0
2859  064a 89            	pushw	x
2860  064b ae0000        	ldw	x,#L502
2861  064e cd0000        	call	_assert_failed
2863  0651 5b04          	addw	sp,#4
2864  0653               L643:
2865                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2867  0653 0d02          	tnz	(OFST+2,sp)
2868  0655 2706          	jreq	L253
2869  0657 7b02          	ld	a,(OFST+2,sp)
2870  0659 a101          	cp	a,#1
2871  065b 2603          	jrne	L053
2872  065d               L253:
2873  065d 4f            	clr	a
2874  065e 2010          	jra	L453
2875  0660               L053:
2876  0660 ae0277        	ldw	x,#631
2877  0663 89            	pushw	x
2878  0664 ae0000        	ldw	x,#0
2879  0667 89            	pushw	x
2880  0668 ae0000        	ldw	x,#L502
2881  066b cd0000        	call	_assert_failed
2883  066e 5b04          	addw	sp,#4
2884  0670               L453:
2885                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2887  0670 0d01          	tnz	(OFST+1,sp)
2888  0672 2610          	jrne	L5311
2889                     ; 636         if (NewState != DISABLE)
2891  0674 0d02          	tnz	(OFST+2,sp)
2892  0676 2706          	jreq	L7311
2893                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2895  0678 72105327      	bset	21287,#0
2897  067c 2014          	jra	L3411
2898  067e               L7311:
2899                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2901  067e 72115327      	bres	21287,#0
2902  0682 200e          	jra	L3411
2903  0684               L5311:
2904                     ; 649         if (NewState != DISABLE)
2906  0684 0d02          	tnz	(OFST+2,sp)
2907  0686 2706          	jreq	L5411
2908                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2910  0688 72185327      	bset	21287,#4
2912  068c 2004          	jra	L3411
2913  068e               L5411:
2914                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2916  068e 72195327      	bres	21287,#4
2917  0692               L3411:
2918                     ; 659 }
2921  0692 85            	popw	x
2922  0693 81            	ret
2968                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2968                     ; 681 {
2969                     	switch	.text
2970  0694               _TIM3_SelectOCxM:
2972  0694 89            	pushw	x
2973       00000000      OFST:	set	0
2976                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2978  0695 9e            	ld	a,xh
2979  0696 4d            	tnz	a
2980  0697 2705          	jreq	L263
2981  0699 9e            	ld	a,xh
2982  069a a101          	cp	a,#1
2983  069c 2603          	jrne	L063
2984  069e               L263:
2985  069e 4f            	clr	a
2986  069f 2010          	jra	L463
2987  06a1               L063:
2988  06a1 ae02ab        	ldw	x,#683
2989  06a4 89            	pushw	x
2990  06a5 ae0000        	ldw	x,#0
2991  06a8 89            	pushw	x
2992  06a9 ae0000        	ldw	x,#L502
2993  06ac cd0000        	call	_assert_failed
2995  06af 5b04          	addw	sp,#4
2996  06b1               L463:
2997                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2999  06b1 0d02          	tnz	(OFST+2,sp)
3000  06b3 272a          	jreq	L073
3001  06b5 7b02          	ld	a,(OFST+2,sp)
3002  06b7 a110          	cp	a,#16
3003  06b9 2724          	jreq	L073
3004  06bb 7b02          	ld	a,(OFST+2,sp)
3005  06bd a120          	cp	a,#32
3006  06bf 271e          	jreq	L073
3007  06c1 7b02          	ld	a,(OFST+2,sp)
3008  06c3 a130          	cp	a,#48
3009  06c5 2718          	jreq	L073
3010  06c7 7b02          	ld	a,(OFST+2,sp)
3011  06c9 a160          	cp	a,#96
3012  06cb 2712          	jreq	L073
3013  06cd 7b02          	ld	a,(OFST+2,sp)
3014  06cf a170          	cp	a,#112
3015  06d1 270c          	jreq	L073
3016  06d3 7b02          	ld	a,(OFST+2,sp)
3017  06d5 a150          	cp	a,#80
3018  06d7 2706          	jreq	L073
3019  06d9 7b02          	ld	a,(OFST+2,sp)
3020  06db a140          	cp	a,#64
3021  06dd 2603          	jrne	L663
3022  06df               L073:
3023  06df 4f            	clr	a
3024  06e0 2010          	jra	L273
3025  06e2               L663:
3026  06e2 ae02ac        	ldw	x,#684
3027  06e5 89            	pushw	x
3028  06e6 ae0000        	ldw	x,#0
3029  06e9 89            	pushw	x
3030  06ea ae0000        	ldw	x,#L502
3031  06ed cd0000        	call	_assert_failed
3033  06f0 5b04          	addw	sp,#4
3034  06f2               L273:
3035                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
3037  06f2 0d01          	tnz	(OFST+1,sp)
3038  06f4 2610          	jrne	L3711
3039                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3041  06f6 72115327      	bres	21287,#0
3042                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3044  06fa c65325        	ld	a,21285
3045  06fd a48f          	and	a,#143
3046  06ff 1a02          	or	a,(OFST+2,sp)
3047  0701 c75325        	ld	21285,a
3049  0704 200e          	jra	L5711
3050  0706               L3711:
3051                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
3053  0706 72195327      	bres	21287,#4
3054                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3056  070a c65326        	ld	a,21286
3057  070d a48f          	and	a,#143
3058  070f 1a02          	or	a,(OFST+2,sp)
3059  0711 c75326        	ld	21286,a
3060  0714               L5711:
3061                     ; 702 }
3064  0714 85            	popw	x
3065  0715 81            	ret
3099                     ; 711 void TIM3_SetCounter(uint16_t Counter)
3099                     ; 712 {
3100                     	switch	.text
3101  0716               _TIM3_SetCounter:
3105                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
3107  0716 9e            	ld	a,xh
3108  0717 c75328        	ld	21288,a
3109                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
3111  071a 9f            	ld	a,xl
3112  071b c75329        	ld	21289,a
3113                     ; 717 }
3116  071e 81            	ret
3150                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
3150                     ; 727 {
3151                     	switch	.text
3152  071f               _TIM3_SetAutoreload:
3156                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
3158  071f 9e            	ld	a,xh
3159  0720 c7532b        	ld	21291,a
3160                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
3162  0723 9f            	ld	a,xl
3163  0724 c7532c        	ld	21292,a
3164                     ; 731 }
3167  0727 81            	ret
3201                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
3201                     ; 741 {
3202                     	switch	.text
3203  0728               _TIM3_SetCompare1:
3207                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
3209  0728 9e            	ld	a,xh
3210  0729 c7532d        	ld	21293,a
3211                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
3213  072c 9f            	ld	a,xl
3214  072d c7532e        	ld	21294,a
3215                     ; 745 }
3218  0730 81            	ret
3252                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
3252                     ; 755 {
3253                     	switch	.text
3254  0731               _TIM3_SetCompare2:
3258                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3260  0731 9e            	ld	a,xh
3261  0732 c7532f        	ld	21295,a
3262                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
3264  0735 9f            	ld	a,xl
3265  0736 c75330        	ld	21296,a
3266                     ; 759 }
3269  0739 81            	ret
3306                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3306                     ; 773 {
3307                     	switch	.text
3308  073a               _TIM3_SetIC1Prescaler:
3310  073a 88            	push	a
3311       00000000      OFST:	set	0
3314                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3316  073b 4d            	tnz	a
3317  073c 270c          	jreq	L014
3318  073e a104          	cp	a,#4
3319  0740 2708          	jreq	L014
3320  0742 a108          	cp	a,#8
3321  0744 2704          	jreq	L014
3322  0746 a10c          	cp	a,#12
3323  0748 2603          	jrne	L604
3324  074a               L014:
3325  074a 4f            	clr	a
3326  074b 2010          	jra	L214
3327  074d               L604:
3328  074d ae0307        	ldw	x,#775
3329  0750 89            	pushw	x
3330  0751 ae0000        	ldw	x,#0
3331  0754 89            	pushw	x
3332  0755 ae0000        	ldw	x,#L502
3333  0758 cd0000        	call	_assert_failed
3335  075b 5b04          	addw	sp,#4
3336  075d               L214:
3337                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3339  075d c65325        	ld	a,21285
3340  0760 a4f3          	and	a,#243
3341  0762 1a01          	or	a,(OFST+1,sp)
3342  0764 c75325        	ld	21285,a
3343                     ; 779 }
3346  0767 84            	pop	a
3347  0768 81            	ret
3384                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3384                     ; 792 {
3385                     	switch	.text
3386  0769               _TIM3_SetIC2Prescaler:
3388  0769 88            	push	a
3389       00000000      OFST:	set	0
3392                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3394  076a 4d            	tnz	a
3395  076b 270c          	jreq	L024
3396  076d a104          	cp	a,#4
3397  076f 2708          	jreq	L024
3398  0771 a108          	cp	a,#8
3399  0773 2704          	jreq	L024
3400  0775 a10c          	cp	a,#12
3401  0777 2603          	jrne	L614
3402  0779               L024:
3403  0779 4f            	clr	a
3404  077a 2010          	jra	L224
3405  077c               L614:
3406  077c ae031a        	ldw	x,#794
3407  077f 89            	pushw	x
3408  0780 ae0000        	ldw	x,#0
3409  0783 89            	pushw	x
3410  0784 ae0000        	ldw	x,#L502
3411  0787 cd0000        	call	_assert_failed
3413  078a 5b04          	addw	sp,#4
3414  078c               L224:
3415                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3417  078c c65326        	ld	a,21286
3418  078f a4f3          	and	a,#243
3419  0791 1a01          	or	a,(OFST+1,sp)
3420  0793 c75326        	ld	21286,a
3421                     ; 798 }
3424  0796 84            	pop	a
3425  0797 81            	ret
3477                     ; 804 uint16_t TIM3_GetCapture1(void)
3477                     ; 805 {
3478                     	switch	.text
3479  0798               _TIM3_GetCapture1:
3481  0798 5204          	subw	sp,#4
3482       00000004      OFST:	set	4
3485                     ; 807     uint16_t tmpccr1 = 0;
3487                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
3491                     ; 810     tmpccr1h = TIM3->CCR1H;
3493  079a c6532d        	ld	a,21293
3494  079d 6b02          	ld	(OFST-2,sp),a
3495                     ; 811     tmpccr1l = TIM3->CCR1L;
3497  079f c6532e        	ld	a,21294
3498  07a2 6b01          	ld	(OFST-3,sp),a
3499                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
3501  07a4 7b01          	ld	a,(OFST-3,sp)
3502  07a6 5f            	clrw	x
3503  07a7 97            	ld	xl,a
3504  07a8 1f03          	ldw	(OFST-1,sp),x
3505                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3507  07aa 7b02          	ld	a,(OFST-2,sp)
3508  07ac 5f            	clrw	x
3509  07ad 97            	ld	xl,a
3510  07ae 4f            	clr	a
3511  07af 02            	rlwa	x,a
3512  07b0 01            	rrwa	x,a
3513  07b1 1a04          	or	a,(OFST+0,sp)
3514  07b3 01            	rrwa	x,a
3515  07b4 1a03          	or	a,(OFST-1,sp)
3516  07b6 01            	rrwa	x,a
3517  07b7 1f03          	ldw	(OFST-1,sp),x
3518                     ; 816     return (uint16_t)tmpccr1;
3520  07b9 1e03          	ldw	x,(OFST-1,sp)
3523  07bb 5b04          	addw	sp,#4
3524  07bd 81            	ret
3576                     ; 824 uint16_t TIM3_GetCapture2(void)
3576                     ; 825 {
3577                     	switch	.text
3578  07be               _TIM3_GetCapture2:
3580  07be 5204          	subw	sp,#4
3581       00000004      OFST:	set	4
3584                     ; 827     uint16_t tmpccr2 = 0;
3586                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
3590                     ; 830     tmpccr2h = TIM3->CCR2H;
3592  07c0 c6532f        	ld	a,21295
3593  07c3 6b02          	ld	(OFST-2,sp),a
3594                     ; 831     tmpccr2l = TIM3->CCR2L;
3596  07c5 c65330        	ld	a,21296
3597  07c8 6b01          	ld	(OFST-3,sp),a
3598                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
3600  07ca 7b01          	ld	a,(OFST-3,sp)
3601  07cc 5f            	clrw	x
3602  07cd 97            	ld	xl,a
3603  07ce 1f03          	ldw	(OFST-1,sp),x
3604                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3606  07d0 7b02          	ld	a,(OFST-2,sp)
3607  07d2 5f            	clrw	x
3608  07d3 97            	ld	xl,a
3609  07d4 4f            	clr	a
3610  07d5 02            	rlwa	x,a
3611  07d6 01            	rrwa	x,a
3612  07d7 1a04          	or	a,(OFST+0,sp)
3613  07d9 01            	rrwa	x,a
3614  07da 1a03          	or	a,(OFST-1,sp)
3615  07dc 01            	rrwa	x,a
3616  07dd 1f03          	ldw	(OFST-1,sp),x
3617                     ; 836     return (uint16_t)tmpccr2;
3619  07df 1e03          	ldw	x,(OFST-1,sp)
3622  07e1 5b04          	addw	sp,#4
3623  07e3 81            	ret
3657                     ; 844 uint16_t TIM3_GetCounter(void)
3657                     ; 845 {
3658                     	switch	.text
3659  07e4               _TIM3_GetCounter:
3661  07e4 89            	pushw	x
3662       00000002      OFST:	set	2
3665                     ; 846    uint16_t tmpcntr = 0;
3667                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3669  07e5 c65328        	ld	a,21288
3670  07e8 5f            	clrw	x
3671  07e9 97            	ld	xl,a
3672  07ea 4f            	clr	a
3673  07eb 02            	rlwa	x,a
3674  07ec 1f01          	ldw	(OFST-1,sp),x
3675                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3677  07ee c65329        	ld	a,21289
3678  07f1 5f            	clrw	x
3679  07f2 97            	ld	xl,a
3680  07f3 01            	rrwa	x,a
3681  07f4 1a02          	or	a,(OFST+0,sp)
3682  07f6 01            	rrwa	x,a
3683  07f7 1a01          	or	a,(OFST-1,sp)
3684  07f9 01            	rrwa	x,a
3687  07fa 5b02          	addw	sp,#2
3688  07fc 81            	ret
3712                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3712                     ; 860 {
3713                     	switch	.text
3714  07fd               _TIM3_GetPrescaler:
3718                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3720  07fd c6532a        	ld	a,21290
3723  0800 81            	ret
3849                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3849                     ; 878 {
3850                     	switch	.text
3851  0801               _TIM3_GetFlagStatus:
3853  0801 89            	pushw	x
3854  0802 89            	pushw	x
3855       00000002      OFST:	set	2
3858                     ; 879    FlagStatus bitstatus = RESET;
3860                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3864                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3866  0803 a30001        	cpw	x,#1
3867  0806 2714          	jreq	L044
3868  0808 a30002        	cpw	x,#2
3869  080b 270f          	jreq	L044
3870  080d a30004        	cpw	x,#4
3871  0810 270a          	jreq	L044
3872  0812 a30200        	cpw	x,#512
3873  0815 2705          	jreq	L044
3874  0817 a30400        	cpw	x,#1024
3875  081a 2603          	jrne	L634
3876  081c               L044:
3877  081c 4f            	clr	a
3878  081d 2010          	jra	L244
3879  081f               L634:
3880  081f ae0373        	ldw	x,#883
3881  0822 89            	pushw	x
3882  0823 ae0000        	ldw	x,#0
3883  0826 89            	pushw	x
3884  0827 ae0000        	ldw	x,#L502
3885  082a cd0000        	call	_assert_failed
3887  082d 5b04          	addw	sp,#4
3888  082f               L244:
3889                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3891  082f c65322        	ld	a,21282
3892  0832 1404          	and	a,(OFST+2,sp)
3893  0834 6b01          	ld	(OFST-1,sp),a
3894                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3896  0836 7b03          	ld	a,(OFST+1,sp)
3897  0838 6b02          	ld	(OFST+0,sp),a
3898                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3900  083a c65323        	ld	a,21283
3901  083d 1402          	and	a,(OFST+0,sp)
3902  083f 1a01          	or	a,(OFST-1,sp)
3903  0841 2706          	jreq	L5051
3904                     ; 890         bitstatus = SET;
3906  0843 a601          	ld	a,#1
3907  0845 6b02          	ld	(OFST+0,sp),a
3909  0847 2002          	jra	L7051
3910  0849               L5051:
3911                     ; 894         bitstatus = RESET;
3913  0849 0f02          	clr	(OFST+0,sp)
3914  084b               L7051:
3915                     ; 896     return (FlagStatus)bitstatus;
3917  084b 7b02          	ld	a,(OFST+0,sp)
3920  084d 5b04          	addw	sp,#4
3921  084f 81            	ret
3957                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3957                     ; 912 {
3958                     	switch	.text
3959  0850               _TIM3_ClearFlag:
3961  0850 89            	pushw	x
3962       00000000      OFST:	set	0
3965                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3967  0851 01            	rrwa	x,a
3968  0852 a4f8          	and	a,#248
3969  0854 01            	rrwa	x,a
3970  0855 a4f9          	and	a,#249
3971  0857 01            	rrwa	x,a
3972  0858 a30000        	cpw	x,#0
3973  085b 2607          	jrne	L644
3974  085d 1e01          	ldw	x,(OFST+1,sp)
3975  085f 2703          	jreq	L644
3976  0861 4f            	clr	a
3977  0862 2010          	jra	L054
3978  0864               L644:
3979  0864 ae0392        	ldw	x,#914
3980  0867 89            	pushw	x
3981  0868 ae0000        	ldw	x,#0
3982  086b 89            	pushw	x
3983  086c ae0000        	ldw	x,#L502
3984  086f cd0000        	call	_assert_failed
3986  0872 5b04          	addw	sp,#4
3987  0874               L054:
3988                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3990  0874 7b02          	ld	a,(OFST+2,sp)
3991  0876 43            	cpl	a
3992  0877 c75322        	ld	21282,a
3993                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3995  087a 7b01          	ld	a,(OFST+1,sp)
3996  087c 43            	cpl	a
3997  087d c75323        	ld	21283,a
3998                     ; 919 }
4001  0880 85            	popw	x
4002  0881 81            	ret
4067                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4067                     ; 933 {
4068                     	switch	.text
4069  0882               _TIM3_GetITStatus:
4071  0882 88            	push	a
4072  0883 89            	pushw	x
4073       00000002      OFST:	set	2
4076                     ; 934     ITStatus bitstatus = RESET;
4078                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
4082                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
4084  0884 a101          	cp	a,#1
4085  0886 2708          	jreq	L654
4086  0888 a102          	cp	a,#2
4087  088a 2704          	jreq	L654
4088  088c a104          	cp	a,#4
4089  088e 2603          	jrne	L454
4090  0890               L654:
4091  0890 4f            	clr	a
4092  0891 2010          	jra	L064
4093  0893               L454:
4094  0893 ae03aa        	ldw	x,#938
4095  0896 89            	pushw	x
4096  0897 ae0000        	ldw	x,#0
4097  089a 89            	pushw	x
4098  089b ae0000        	ldw	x,#L502
4099  089e cd0000        	call	_assert_failed
4101  08a1 5b04          	addw	sp,#4
4102  08a3               L064:
4103                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
4105  08a3 c65322        	ld	a,21282
4106  08a6 1403          	and	a,(OFST+1,sp)
4107  08a8 6b01          	ld	(OFST-1,sp),a
4108                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
4110  08aa c65321        	ld	a,21281
4111  08ad 1403          	and	a,(OFST+1,sp)
4112  08af 6b02          	ld	(OFST+0,sp),a
4113                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
4115  08b1 0d01          	tnz	(OFST-1,sp)
4116  08b3 270a          	jreq	L1651
4118  08b5 0d02          	tnz	(OFST+0,sp)
4119  08b7 2706          	jreq	L1651
4120                     ; 946         bitstatus = SET;
4122  08b9 a601          	ld	a,#1
4123  08bb 6b02          	ld	(OFST+0,sp),a
4125  08bd 2002          	jra	L3651
4126  08bf               L1651:
4127                     ; 950         bitstatus = RESET;
4129  08bf 0f02          	clr	(OFST+0,sp)
4130  08c1               L3651:
4131                     ; 952     return (ITStatus)(bitstatus);
4133  08c1 7b02          	ld	a,(OFST+0,sp)
4136  08c3 5b03          	addw	sp,#3
4137  08c5 81            	ret
4174                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4174                     ; 966 {
4175                     	switch	.text
4176  08c6               _TIM3_ClearITPendingBit:
4178  08c6 88            	push	a
4179       00000000      OFST:	set	0
4182                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
4184  08c7 4d            	tnz	a
4185  08c8 2707          	jreq	L464
4186  08ca a108          	cp	a,#8
4187  08cc 2403          	jruge	L464
4188  08ce 4f            	clr	a
4189  08cf 2010          	jra	L664
4190  08d1               L464:
4191  08d1 ae03c8        	ldw	x,#968
4192  08d4 89            	pushw	x
4193  08d5 ae0000        	ldw	x,#0
4194  08d8 89            	pushw	x
4195  08d9 ae0000        	ldw	x,#L502
4196  08dc cd0000        	call	_assert_failed
4198  08df 5b04          	addw	sp,#4
4199  08e1               L664:
4200                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
4202  08e1 7b01          	ld	a,(OFST+1,sp)
4203  08e3 43            	cpl	a
4204  08e4 c75322        	ld	21282,a
4205                     ; 972 }
4208  08e7 84            	pop	a
4209  08e8 81            	ret
4261                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
4261                     ; 992                        uint8_t TIM3_ICSelection,
4261                     ; 993                        uint8_t TIM3_ICFilter)
4261                     ; 994 {
4262                     	switch	.text
4263  08e9               L3_TI1_Config:
4265  08e9 89            	pushw	x
4266  08ea 88            	push	a
4267       00000001      OFST:	set	1
4270                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
4272  08eb 72115327      	bres	21287,#0
4273                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
4275  08ef 7b06          	ld	a,(OFST+5,sp)
4276  08f1 97            	ld	xl,a
4277  08f2 a610          	ld	a,#16
4278  08f4 42            	mul	x,a
4279  08f5 9f            	ld	a,xl
4280  08f6 1a03          	or	a,(OFST+2,sp)
4281  08f8 6b01          	ld	(OFST+0,sp),a
4282  08fa c65325        	ld	a,21285
4283  08fd a40c          	and	a,#12
4284  08ff 1a01          	or	a,(OFST+0,sp)
4285  0901 c75325        	ld	21285,a
4286                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4288  0904 0d02          	tnz	(OFST+1,sp)
4289  0906 2706          	jreq	L1361
4290                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
4292  0908 72125327      	bset	21287,#1
4294  090c 2004          	jra	L3361
4295  090e               L1361:
4296                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
4298  090e 72135327      	bres	21287,#1
4299  0912               L3361:
4300                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
4302  0912 72105327      	bset	21287,#0
4303                     ; 1012 }
4306  0916 5b03          	addw	sp,#3
4307  0918 81            	ret
4359                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
4359                     ; 1032                        uint8_t TIM3_ICSelection,
4359                     ; 1033                        uint8_t TIM3_ICFilter)
4359                     ; 1034 {
4360                     	switch	.text
4361  0919               L5_TI2_Config:
4363  0919 89            	pushw	x
4364  091a 88            	push	a
4365       00000001      OFST:	set	1
4368                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4370  091b 72195327      	bres	21287,#4
4371                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4371                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4371                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
4373  091f 7b06          	ld	a,(OFST+5,sp)
4374  0921 97            	ld	xl,a
4375  0922 a610          	ld	a,#16
4376  0924 42            	mul	x,a
4377  0925 9f            	ld	a,xl
4378  0926 1a03          	or	a,(OFST+2,sp)
4379  0928 6b01          	ld	(OFST+0,sp),a
4380  092a c65326        	ld	a,21286
4381  092d a40c          	and	a,#12
4382  092f 1a01          	or	a,(OFST+0,sp)
4383  0931 c75326        	ld	21286,a
4384                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4386  0934 0d02          	tnz	(OFST+1,sp)
4387  0936 2706          	jreq	L3661
4388                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
4390  0938 721a5327      	bset	21287,#5
4392  093c 2004          	jra	L5661
4393  093e               L3661:
4394                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4396  093e 721b5327      	bres	21287,#5
4397  0942               L5661:
4398                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
4400  0942 72185327      	bset	21287,#4
4401                     ; 1056 }
4404  0946 5b03          	addw	sp,#3
4405  0948 81            	ret
4418                     	xdef	_TIM3_ClearITPendingBit
4419                     	xdef	_TIM3_GetITStatus
4420                     	xdef	_TIM3_ClearFlag
4421                     	xdef	_TIM3_GetFlagStatus
4422                     	xdef	_TIM3_GetPrescaler
4423                     	xdef	_TIM3_GetCounter
4424                     	xdef	_TIM3_GetCapture2
4425                     	xdef	_TIM3_GetCapture1
4426                     	xdef	_TIM3_SetIC2Prescaler
4427                     	xdef	_TIM3_SetIC1Prescaler
4428                     	xdef	_TIM3_SetCompare2
4429                     	xdef	_TIM3_SetCompare1
4430                     	xdef	_TIM3_SetAutoreload
4431                     	xdef	_TIM3_SetCounter
4432                     	xdef	_TIM3_SelectOCxM
4433                     	xdef	_TIM3_CCxCmd
4434                     	xdef	_TIM3_OC2PolarityConfig
4435                     	xdef	_TIM3_OC1PolarityConfig
4436                     	xdef	_TIM3_GenerateEvent
4437                     	xdef	_TIM3_OC2PreloadConfig
4438                     	xdef	_TIM3_OC1PreloadConfig
4439                     	xdef	_TIM3_ARRPreloadConfig
4440                     	xdef	_TIM3_ForcedOC2Config
4441                     	xdef	_TIM3_ForcedOC1Config
4442                     	xdef	_TIM3_PrescalerConfig
4443                     	xdef	_TIM3_SelectOnePulseMode
4444                     	xdef	_TIM3_UpdateRequestConfig
4445                     	xdef	_TIM3_UpdateDisableConfig
4446                     	xdef	_TIM3_ITConfig
4447                     	xdef	_TIM3_Cmd
4448                     	xdef	_TIM3_PWMIConfig
4449                     	xdef	_TIM3_ICInit
4450                     	xdef	_TIM3_OC2Init
4451                     	xdef	_TIM3_OC1Init
4452                     	xdef	_TIM3_TimeBaseInit
4453                     	xdef	_TIM3_DeInit
4454                     	xref	_assert_failed
4455                     .const:	section	.text
4456  0000               L502:
4457  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
4458  0012 696d332e6300  	dc.b	"im3.c",0
4478                     	end

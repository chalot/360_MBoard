   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 45 void TIM3_DeInit(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  52  0000 725f5320      	clr	21280
  53                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  55  0004 725f5321      	clr	21281
  56                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  58  0008 725f5323      	clr	21283
  59                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  61  000c 725f5327      	clr	21287
  62                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  64  0010 725f5327      	clr	21287
  65                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  67  0014 725f5325      	clr	21285
  68                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  70  0018 725f5326      	clr	21286
  71                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  73  001c 725f5328      	clr	21288
  74                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  76  0020 725f5329      	clr	21289
  77                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  79  0024 725f532a      	clr	21290
  80                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  82  0028 35ff532b      	mov	21291,#255
  83                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  85  002c 35ff532c      	mov	21292,#255
  86                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  88  0030 725f532d      	clr	21293
  89                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  91  0034 725f532e      	clr	21294
  92                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  94  0038 725f532f      	clr	21295
  95                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  97  003c 725f5330      	clr	21296
  98                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
 100  0040 725f5322      	clr	21282
 101                     ; 69 }
 104  0044 81            	ret
 272                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 272                     ; 79                         uint16_t TIM3_Period)
 272                     ; 80 {
 273                     	switch	.text
 274  0045               _TIM3_TimeBaseInit:
 276  0045 88            	push	a
 277       00000000      OFST:	set	0
 280                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 282  0046 c7532a        	ld	21290,a
 283                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 285  0049 7b04          	ld	a,(OFST+4,sp)
 286  004b c7532b        	ld	21291,a
 287                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 289  004e 7b05          	ld	a,(OFST+5,sp)
 290  0050 c7532c        	ld	21292,a
 291                     ; 86 }
 294  0053 84            	pop	a
 295  0054 81            	ret
 453                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 453                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 453                     ; 98                   uint16_t TIM3_Pulse,
 453                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 453                     ; 100 {
 454                     	switch	.text
 455  0055               _TIM3_OC1Init:
 457  0055 89            	pushw	x
 458  0056 88            	push	a
 459       00000001      OFST:	set	1
 462                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 464  0057 9e            	ld	a,xh
 465  0058 4d            	tnz	a
 466  0059 2719          	jreq	L41
 467  005b 9e            	ld	a,xh
 468  005c a110          	cp	a,#16
 469  005e 2714          	jreq	L41
 470  0060 9e            	ld	a,xh
 471  0061 a120          	cp	a,#32
 472  0063 270f          	jreq	L41
 473  0065 9e            	ld	a,xh
 474  0066 a130          	cp	a,#48
 475  0068 270a          	jreq	L41
 476  006a 9e            	ld	a,xh
 477  006b a160          	cp	a,#96
 478  006d 2705          	jreq	L41
 479  006f 9e            	ld	a,xh
 480  0070 a170          	cp	a,#112
 481  0072 2603          	jrne	L21
 482  0074               L41:
 483  0074 4f            	clr	a
 484  0075 2010          	jra	L61
 485  0077               L21:
 486  0077 ae0066        	ldw	x,#102
 487  007a 89            	pushw	x
 488  007b ae0000        	ldw	x,#0
 489  007e 89            	pushw	x
 490  007f ae0000        	ldw	x,#L502
 491  0082 cd0000        	call	_assert_failed
 493  0085 5b04          	addw	sp,#4
 494  0087               L61:
 495                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 497  0087 0d03          	tnz	(OFST+2,sp)
 498  0089 2706          	jreq	L22
 499  008b 7b03          	ld	a,(OFST+2,sp)
 500  008d a111          	cp	a,#17
 501  008f 2603          	jrne	L02
 502  0091               L22:
 503  0091 4f            	clr	a
 504  0092 2010          	jra	L42
 505  0094               L02:
 506  0094 ae0067        	ldw	x,#103
 507  0097 89            	pushw	x
 508  0098 ae0000        	ldw	x,#0
 509  009b 89            	pushw	x
 510  009c ae0000        	ldw	x,#L502
 511  009f cd0000        	call	_assert_failed
 513  00a2 5b04          	addw	sp,#4
 514  00a4               L42:
 515                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 517  00a4 0d08          	tnz	(OFST+7,sp)
 518  00a6 2706          	jreq	L03
 519  00a8 7b08          	ld	a,(OFST+7,sp)
 520  00aa a122          	cp	a,#34
 521  00ac 2603          	jrne	L62
 522  00ae               L03:
 523  00ae 4f            	clr	a
 524  00af 2010          	jra	L23
 525  00b1               L62:
 526  00b1 ae0068        	ldw	x,#104
 527  00b4 89            	pushw	x
 528  00b5 ae0000        	ldw	x,#0
 529  00b8 89            	pushw	x
 530  00b9 ae0000        	ldw	x,#L502
 531  00bc cd0000        	call	_assert_failed
 533  00bf 5b04          	addw	sp,#4
 534  00c1               L23:
 535                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 537  00c1 c65327        	ld	a,21287
 538  00c4 a4fc          	and	a,#252
 539  00c6 c75327        	ld	21287,a
 540                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 542  00c9 7b08          	ld	a,(OFST+7,sp)
 543  00cb a402          	and	a,#2
 544  00cd 6b01          	ld	(OFST+0,sp),a
 545  00cf 7b03          	ld	a,(OFST+2,sp)
 546  00d1 a401          	and	a,#1
 547  00d3 1a01          	or	a,(OFST+0,sp)
 548  00d5 ca5327        	or	a,21287
 549  00d8 c75327        	ld	21287,a
 550                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 552  00db c65325        	ld	a,21285
 553  00de a48f          	and	a,#143
 554  00e0 1a02          	or	a,(OFST+1,sp)
 555  00e2 c75325        	ld	21285,a
 556                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 558  00e5 7b06          	ld	a,(OFST+5,sp)
 559  00e7 c7532d        	ld	21293,a
 560                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 562  00ea 7b07          	ld	a,(OFST+6,sp)
 563  00ec c7532e        	ld	21294,a
 564                     ; 117 }
 567  00ef 5b03          	addw	sp,#3
 568  00f1 81            	ret
 633                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 633                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 633                     ; 130                   uint16_t TIM3_Pulse,
 633                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 633                     ; 132 {
 634                     	switch	.text
 635  00f2               _TIM3_OC2Init:
 637  00f2 89            	pushw	x
 638  00f3 88            	push	a
 639       00000001      OFST:	set	1
 642                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 644  00f4 9e            	ld	a,xh
 645  00f5 4d            	tnz	a
 646  00f6 2719          	jreq	L04
 647  00f8 9e            	ld	a,xh
 648  00f9 a110          	cp	a,#16
 649  00fb 2714          	jreq	L04
 650  00fd 9e            	ld	a,xh
 651  00fe a120          	cp	a,#32
 652  0100 270f          	jreq	L04
 653  0102 9e            	ld	a,xh
 654  0103 a130          	cp	a,#48
 655  0105 270a          	jreq	L04
 656  0107 9e            	ld	a,xh
 657  0108 a160          	cp	a,#96
 658  010a 2705          	jreq	L04
 659  010c 9e            	ld	a,xh
 660  010d a170          	cp	a,#112
 661  010f 2603          	jrne	L63
 662  0111               L04:
 663  0111 4f            	clr	a
 664  0112 2010          	jra	L24
 665  0114               L63:
 666  0114 ae0086        	ldw	x,#134
 667  0117 89            	pushw	x
 668  0118 ae0000        	ldw	x,#0
 669  011b 89            	pushw	x
 670  011c ae0000        	ldw	x,#L502
 671  011f cd0000        	call	_assert_failed
 673  0122 5b04          	addw	sp,#4
 674  0124               L24:
 675                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 677  0124 0d03          	tnz	(OFST+2,sp)
 678  0126 2706          	jreq	L64
 679  0128 7b03          	ld	a,(OFST+2,sp)
 680  012a a111          	cp	a,#17
 681  012c 2603          	jrne	L44
 682  012e               L64:
 683  012e 4f            	clr	a
 684  012f 2010          	jra	L05
 685  0131               L44:
 686  0131 ae0087        	ldw	x,#135
 687  0134 89            	pushw	x
 688  0135 ae0000        	ldw	x,#0
 689  0138 89            	pushw	x
 690  0139 ae0000        	ldw	x,#L502
 691  013c cd0000        	call	_assert_failed
 693  013f 5b04          	addw	sp,#4
 694  0141               L05:
 695                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 697  0141 0d08          	tnz	(OFST+7,sp)
 698  0143 2706          	jreq	L45
 699  0145 7b08          	ld	a,(OFST+7,sp)
 700  0147 a122          	cp	a,#34
 701  0149 2603          	jrne	L25
 702  014b               L45:
 703  014b 4f            	clr	a
 704  014c 2010          	jra	L65
 705  014e               L25:
 706  014e ae0088        	ldw	x,#136
 707  0151 89            	pushw	x
 708  0152 ae0000        	ldw	x,#0
 709  0155 89            	pushw	x
 710  0156 ae0000        	ldw	x,#L502
 711  0159 cd0000        	call	_assert_failed
 713  015c 5b04          	addw	sp,#4
 714  015e               L65:
 715                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 717  015e c65327        	ld	a,21287
 718  0161 a4cf          	and	a,#207
 719  0163 c75327        	ld	21287,a
 720                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 722  0166 7b08          	ld	a,(OFST+7,sp)
 723  0168 a420          	and	a,#32
 724  016a 6b01          	ld	(OFST+0,sp),a
 725  016c 7b03          	ld	a,(OFST+2,sp)
 726  016e a410          	and	a,#16
 727  0170 1a01          	or	a,(OFST+0,sp)
 728  0172 ca5327        	or	a,21287
 729  0175 c75327        	ld	21287,a
 730                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 732  0178 c65326        	ld	a,21286
 733  017b a48f          	and	a,#143
 734  017d 1a02          	or	a,(OFST+1,sp)
 735  017f c75326        	ld	21286,a
 736                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 738  0182 7b06          	ld	a,(OFST+5,sp)
 739  0184 c7532f        	ld	21295,a
 740                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 742  0187 7b07          	ld	a,(OFST+6,sp)
 743  0189 c75330        	ld	21296,a
 744                     ; 152 }
 747  018c 5b03          	addw	sp,#3
 748  018e 81            	ret
 933                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 933                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 933                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 933                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 933                     ; 167                  uint8_t TIM3_ICFilter)
 933                     ; 168 {
 934                     	switch	.text
 935  018f               _TIM3_ICInit:
 937  018f 89            	pushw	x
 938       00000000      OFST:	set	0
 941                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 943  0190 9e            	ld	a,xh
 944  0191 4d            	tnz	a
 945  0192 2705          	jreq	L46
 946  0194 9e            	ld	a,xh
 947  0195 a101          	cp	a,#1
 948  0197 2603          	jrne	L26
 949  0199               L46:
 950  0199 4f            	clr	a
 951  019a 2010          	jra	L66
 952  019c               L26:
 953  019c ae00aa        	ldw	x,#170
 954  019f 89            	pushw	x
 955  01a0 ae0000        	ldw	x,#0
 956  01a3 89            	pushw	x
 957  01a4 ae0000        	ldw	x,#L502
 958  01a7 cd0000        	call	_assert_failed
 960  01aa 5b04          	addw	sp,#4
 961  01ac               L66:
 962                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 964  01ac 0d02          	tnz	(OFST+2,sp)
 965  01ae 2706          	jreq	L27
 966  01b0 7b02          	ld	a,(OFST+2,sp)
 967  01b2 a144          	cp	a,#68
 968  01b4 2603          	jrne	L07
 969  01b6               L27:
 970  01b6 4f            	clr	a
 971  01b7 2010          	jra	L47
 972  01b9               L07:
 973  01b9 ae00ab        	ldw	x,#171
 974  01bc 89            	pushw	x
 975  01bd ae0000        	ldw	x,#0
 976  01c0 89            	pushw	x
 977  01c1 ae0000        	ldw	x,#L502
 978  01c4 cd0000        	call	_assert_failed
 980  01c7 5b04          	addw	sp,#4
 981  01c9               L47:
 982                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 984  01c9 7b05          	ld	a,(OFST+5,sp)
 985  01cb a101          	cp	a,#1
 986  01cd 270c          	jreq	L001
 987  01cf 7b05          	ld	a,(OFST+5,sp)
 988  01d1 a102          	cp	a,#2
 989  01d3 2706          	jreq	L001
 990  01d5 7b05          	ld	a,(OFST+5,sp)
 991  01d7 a103          	cp	a,#3
 992  01d9 2603          	jrne	L67
 993  01db               L001:
 994  01db 4f            	clr	a
 995  01dc 2010          	jra	L201
 996  01de               L67:
 997  01de ae00ac        	ldw	x,#172
 998  01e1 89            	pushw	x
 999  01e2 ae0000        	ldw	x,#0
1000  01e5 89            	pushw	x
1001  01e6 ae0000        	ldw	x,#L502
1002  01e9 cd0000        	call	_assert_failed
1004  01ec 5b04          	addw	sp,#4
1005  01ee               L201:
1006                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1008  01ee 0d06          	tnz	(OFST+6,sp)
1009  01f0 2712          	jreq	L601
1010  01f2 7b06          	ld	a,(OFST+6,sp)
1011  01f4 a104          	cp	a,#4
1012  01f6 270c          	jreq	L601
1013  01f8 7b06          	ld	a,(OFST+6,sp)
1014  01fa a108          	cp	a,#8
1015  01fc 2706          	jreq	L601
1016  01fe 7b06          	ld	a,(OFST+6,sp)
1017  0200 a10c          	cp	a,#12
1018  0202 2603          	jrne	L401
1019  0204               L601:
1020  0204 4f            	clr	a
1021  0205 2010          	jra	L011
1022  0207               L401:
1023  0207 ae00ad        	ldw	x,#173
1024  020a 89            	pushw	x
1025  020b ae0000        	ldw	x,#0
1026  020e 89            	pushw	x
1027  020f ae0000        	ldw	x,#L502
1028  0212 cd0000        	call	_assert_failed
1030  0215 5b04          	addw	sp,#4
1031  0217               L011:
1032                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
1034  0217 7b07          	ld	a,(OFST+7,sp)
1035  0219 a110          	cp	a,#16
1036  021b 2403          	jruge	L211
1037  021d 4f            	clr	a
1038  021e 2010          	jra	L411
1039  0220               L211:
1040  0220 ae00ae        	ldw	x,#174
1041  0223 89            	pushw	x
1042  0224 ae0000        	ldw	x,#0
1043  0227 89            	pushw	x
1044  0228 ae0000        	ldw	x,#L502
1045  022b cd0000        	call	_assert_failed
1047  022e 5b04          	addw	sp,#4
1048  0230               L411:
1049                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
1051  0230 7b01          	ld	a,(OFST+1,sp)
1052  0232 a101          	cp	a,#1
1053  0234 2714          	jreq	L543
1054                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
1054                     ; 180                    (uint8_t)TIM3_ICSelection,
1054                     ; 181                    (uint8_t)TIM3_ICFilter);
1056  0236 7b07          	ld	a,(OFST+7,sp)
1057  0238 88            	push	a
1058  0239 7b06          	ld	a,(OFST+6,sp)
1059  023b 97            	ld	xl,a
1060  023c 7b03          	ld	a,(OFST+3,sp)
1061  023e 95            	ld	xh,a
1062  023f cd08e9        	call	L3_TI1_Config
1064  0242 84            	pop	a
1065                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1067  0243 7b06          	ld	a,(OFST+6,sp)
1068  0245 cd073a        	call	_TIM3_SetIC1Prescaler
1071  0248 2012          	jra	L743
1072  024a               L543:
1073                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
1073                     ; 190                    (uint8_t)TIM3_ICSelection,
1073                     ; 191                    (uint8_t)TIM3_ICFilter);
1075  024a 7b07          	ld	a,(OFST+7,sp)
1076  024c 88            	push	a
1077  024d 7b06          	ld	a,(OFST+6,sp)
1078  024f 97            	ld	xl,a
1079  0250 7b03          	ld	a,(OFST+3,sp)
1080  0252 95            	ld	xh,a
1081  0253 cd0919        	call	L5_TI2_Config
1083  0256 84            	pop	a
1084                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1086  0257 7b06          	ld	a,(OFST+6,sp)
1087  0259 cd0769        	call	_TIM3_SetIC2Prescaler
1089  025c               L743:
1090                     ; 196 }
1093  025c 85            	popw	x
1094  025d 81            	ret
1191                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1191                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1191                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1191                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1191                     ; 210                      uint8_t TIM3_ICFilter)
1191                     ; 211 {
1192                     	switch	.text
1193  025e               _TIM3_PWMIConfig:
1195  025e 89            	pushw	x
1196  025f 89            	pushw	x
1197       00000002      OFST:	set	2
1200                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1202                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1204                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1206  0260 9e            	ld	a,xh
1207  0261 4d            	tnz	a
1208  0262 2705          	jreq	L221
1209  0264 9e            	ld	a,xh
1210  0265 a101          	cp	a,#1
1211  0267 2603          	jrne	L021
1212  0269               L221:
1213  0269 4f            	clr	a
1214  026a 2010          	jra	L421
1215  026c               L021:
1216  026c ae00d8        	ldw	x,#216
1217  026f 89            	pushw	x
1218  0270 ae0000        	ldw	x,#0
1219  0273 89            	pushw	x
1220  0274 ae0000        	ldw	x,#L502
1221  0277 cd0000        	call	_assert_failed
1223  027a 5b04          	addw	sp,#4
1224  027c               L421:
1225                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1227  027c 0d04          	tnz	(OFST+2,sp)
1228  027e 2706          	jreq	L031
1229  0280 7b04          	ld	a,(OFST+2,sp)
1230  0282 a144          	cp	a,#68
1231  0284 2603          	jrne	L621
1232  0286               L031:
1233  0286 4f            	clr	a
1234  0287 2010          	jra	L231
1235  0289               L621:
1236  0289 ae00d9        	ldw	x,#217
1237  028c 89            	pushw	x
1238  028d ae0000        	ldw	x,#0
1239  0290 89            	pushw	x
1240  0291 ae0000        	ldw	x,#L502
1241  0294 cd0000        	call	_assert_failed
1243  0297 5b04          	addw	sp,#4
1244  0299               L231:
1245                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1247  0299 7b07          	ld	a,(OFST+5,sp)
1248  029b a101          	cp	a,#1
1249  029d 270c          	jreq	L631
1250  029f 7b07          	ld	a,(OFST+5,sp)
1251  02a1 a102          	cp	a,#2
1252  02a3 2706          	jreq	L631
1253  02a5 7b07          	ld	a,(OFST+5,sp)
1254  02a7 a103          	cp	a,#3
1255  02a9 2603          	jrne	L431
1256  02ab               L631:
1257  02ab 4f            	clr	a
1258  02ac 2010          	jra	L041
1259  02ae               L431:
1260  02ae ae00da        	ldw	x,#218
1261  02b1 89            	pushw	x
1262  02b2 ae0000        	ldw	x,#0
1263  02b5 89            	pushw	x
1264  02b6 ae0000        	ldw	x,#L502
1265  02b9 cd0000        	call	_assert_failed
1267  02bc 5b04          	addw	sp,#4
1268  02be               L041:
1269                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1271  02be 0d08          	tnz	(OFST+6,sp)
1272  02c0 2712          	jreq	L441
1273  02c2 7b08          	ld	a,(OFST+6,sp)
1274  02c4 a104          	cp	a,#4
1275  02c6 270c          	jreq	L441
1276  02c8 7b08          	ld	a,(OFST+6,sp)
1277  02ca a108          	cp	a,#8
1278  02cc 2706          	jreq	L441
1279  02ce 7b08          	ld	a,(OFST+6,sp)
1280  02d0 a10c          	cp	a,#12
1281  02d2 2603          	jrne	L241
1282  02d4               L441:
1283  02d4 4f            	clr	a
1284  02d5 2010          	jra	L641
1285  02d7               L241:
1286  02d7 ae00db        	ldw	x,#219
1287  02da 89            	pushw	x
1288  02db ae0000        	ldw	x,#0
1289  02de 89            	pushw	x
1290  02df ae0000        	ldw	x,#L502
1291  02e2 cd0000        	call	_assert_failed
1293  02e5 5b04          	addw	sp,#4
1294  02e7               L641:
1295                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1297  02e7 7b04          	ld	a,(OFST+2,sp)
1298  02e9 a144          	cp	a,#68
1299  02eb 2706          	jreq	L714
1300                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1302  02ed a644          	ld	a,#68
1303  02ef 6b01          	ld	(OFST-1,sp),a
1305  02f1 2002          	jra	L124
1306  02f3               L714:
1307                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1309  02f3 0f01          	clr	(OFST-1,sp)
1310  02f5               L124:
1311                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1313  02f5 7b07          	ld	a,(OFST+5,sp)
1314  02f7 a101          	cp	a,#1
1315  02f9 2606          	jrne	L324
1316                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1318  02fb a602          	ld	a,#2
1319  02fd 6b02          	ld	(OFST+0,sp),a
1321  02ff 2004          	jra	L524
1322  0301               L324:
1323                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1325  0301 a601          	ld	a,#1
1326  0303 6b02          	ld	(OFST+0,sp),a
1327  0305               L524:
1328                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1330  0305 7b03          	ld	a,(OFST+1,sp)
1331  0307 a101          	cp	a,#1
1332  0309 2726          	jreq	L724
1333                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1333                     ; 245                    (uint8_t)TIM3_ICFilter);
1335  030b 7b09          	ld	a,(OFST+7,sp)
1336  030d 88            	push	a
1337  030e 7b08          	ld	a,(OFST+6,sp)
1338  0310 97            	ld	xl,a
1339  0311 7b05          	ld	a,(OFST+3,sp)
1340  0313 95            	ld	xh,a
1341  0314 cd08e9        	call	L3_TI1_Config
1343  0317 84            	pop	a
1344                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1346  0318 7b08          	ld	a,(OFST+6,sp)
1347  031a cd073a        	call	_TIM3_SetIC1Prescaler
1349                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1351  031d 7b09          	ld	a,(OFST+7,sp)
1352  031f 88            	push	a
1353  0320 7b03          	ld	a,(OFST+1,sp)
1354  0322 97            	ld	xl,a
1355  0323 7b02          	ld	a,(OFST+0,sp)
1356  0325 95            	ld	xh,a
1357  0326 cd0919        	call	L5_TI2_Config
1359  0329 84            	pop	a
1360                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1362  032a 7b08          	ld	a,(OFST+6,sp)
1363  032c cd0769        	call	_TIM3_SetIC2Prescaler
1366  032f 2024          	jra	L134
1367  0331               L724:
1368                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1368                     ; 260                    (uint8_t)TIM3_ICFilter);
1370  0331 7b09          	ld	a,(OFST+7,sp)
1371  0333 88            	push	a
1372  0334 7b08          	ld	a,(OFST+6,sp)
1373  0336 97            	ld	xl,a
1374  0337 7b05          	ld	a,(OFST+3,sp)
1375  0339 95            	ld	xh,a
1376  033a cd0919        	call	L5_TI2_Config
1378  033d 84            	pop	a
1379                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1381  033e 7b08          	ld	a,(OFST+6,sp)
1382  0340 cd0769        	call	_TIM3_SetIC2Prescaler
1384                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1386  0343 7b09          	ld	a,(OFST+7,sp)
1387  0345 88            	push	a
1388  0346 7b03          	ld	a,(OFST+1,sp)
1389  0348 97            	ld	xl,a
1390  0349 7b02          	ld	a,(OFST+0,sp)
1391  034b 95            	ld	xh,a
1392  034c cd08e9        	call	L3_TI1_Config
1394  034f 84            	pop	a
1395                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1397  0350 7b08          	ld	a,(OFST+6,sp)
1398  0352 cd073a        	call	_TIM3_SetIC1Prescaler
1400  0355               L134:
1401                     ; 271 }
1404  0355 5b04          	addw	sp,#4
1405  0357 81            	ret
1461                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1461                     ; 281 {
1462                     	switch	.text
1463  0358               _TIM3_Cmd:
1465  0358 88            	push	a
1466       00000000      OFST:	set	0
1469                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1471  0359 4d            	tnz	a
1472  035a 2704          	jreq	L451
1473  035c a101          	cp	a,#1
1474  035e 2603          	jrne	L251
1475  0360               L451:
1476  0360 4f            	clr	a
1477  0361 2010          	jra	L651
1478  0363               L251:
1479  0363 ae011b        	ldw	x,#283
1480  0366 89            	pushw	x
1481  0367 ae0000        	ldw	x,#0
1482  036a 89            	pushw	x
1483  036b ae0000        	ldw	x,#L502
1484  036e cd0000        	call	_assert_failed
1486  0371 5b04          	addw	sp,#4
1487  0373               L651:
1488                     ; 286     if (NewState != DISABLE)
1490  0373 0d01          	tnz	(OFST+1,sp)
1491  0375 2706          	jreq	L164
1492                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1494  0377 72105320      	bset	21280,#0
1496  037b 2004          	jra	L364
1497  037d               L164:
1498                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1500  037d 72115320      	bres	21280,#0
1501  0381               L364:
1502                     ; 294 }
1505  0381 84            	pop	a
1506  0382 81            	ret
1579                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1579                     ; 310 {
1580                     	switch	.text
1581  0383               _TIM3_ITConfig:
1583  0383 89            	pushw	x
1584       00000000      OFST:	set	0
1587                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1589  0384 9e            	ld	a,xh
1590  0385 4d            	tnz	a
1591  0386 2708          	jreq	L261
1592  0388 9e            	ld	a,xh
1593  0389 a108          	cp	a,#8
1594  038b 2403          	jruge	L261
1595  038d 4f            	clr	a
1596  038e 2010          	jra	L461
1597  0390               L261:
1598  0390 ae0138        	ldw	x,#312
1599  0393 89            	pushw	x
1600  0394 ae0000        	ldw	x,#0
1601  0397 89            	pushw	x
1602  0398 ae0000        	ldw	x,#L502
1603  039b cd0000        	call	_assert_failed
1605  039e 5b04          	addw	sp,#4
1606  03a0               L461:
1607                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1609  03a0 0d02          	tnz	(OFST+2,sp)
1610  03a2 2706          	jreq	L071
1611  03a4 7b02          	ld	a,(OFST+2,sp)
1612  03a6 a101          	cp	a,#1
1613  03a8 2603          	jrne	L661
1614  03aa               L071:
1615  03aa 4f            	clr	a
1616  03ab 2010          	jra	L271
1617  03ad               L661:
1618  03ad ae0139        	ldw	x,#313
1619  03b0 89            	pushw	x
1620  03b1 ae0000        	ldw	x,#0
1621  03b4 89            	pushw	x
1622  03b5 ae0000        	ldw	x,#L502
1623  03b8 cd0000        	call	_assert_failed
1625  03bb 5b04          	addw	sp,#4
1626  03bd               L271:
1627                     ; 315     if (NewState != DISABLE)
1629  03bd 0d02          	tnz	(OFST+2,sp)
1630  03bf 270a          	jreq	L125
1631                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1633  03c1 c65321        	ld	a,21281
1634  03c4 1a01          	or	a,(OFST+1,sp)
1635  03c6 c75321        	ld	21281,a
1637  03c9 2009          	jra	L325
1638  03cb               L125:
1639                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1641  03cb 7b01          	ld	a,(OFST+1,sp)
1642  03cd 43            	cpl	a
1643  03ce c45321        	and	a,21281
1644  03d1 c75321        	ld	21281,a
1645  03d4               L325:
1646                     ; 325 }
1649  03d4 85            	popw	x
1650  03d5 81            	ret
1687                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1687                     ; 335 {
1688                     	switch	.text
1689  03d6               _TIM3_UpdateDisableConfig:
1691  03d6 88            	push	a
1692       00000000      OFST:	set	0
1695                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1697  03d7 4d            	tnz	a
1698  03d8 2704          	jreq	L002
1699  03da a101          	cp	a,#1
1700  03dc 2603          	jrne	L671
1701  03de               L002:
1702  03de 4f            	clr	a
1703  03df 2010          	jra	L202
1704  03e1               L671:
1705  03e1 ae0151        	ldw	x,#337
1706  03e4 89            	pushw	x
1707  03e5 ae0000        	ldw	x,#0
1708  03e8 89            	pushw	x
1709  03e9 ae0000        	ldw	x,#L502
1710  03ec cd0000        	call	_assert_failed
1712  03ef 5b04          	addw	sp,#4
1713  03f1               L202:
1714                     ; 340     if (NewState != DISABLE)
1716  03f1 0d01          	tnz	(OFST+1,sp)
1717  03f3 2706          	jreq	L345
1718                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1720  03f5 72125320      	bset	21280,#1
1722  03f9 2004          	jra	L545
1723  03fb               L345:
1724                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1726  03fb 72135320      	bres	21280,#1
1727  03ff               L545:
1728                     ; 348 }
1731  03ff 84            	pop	a
1732  0400 81            	ret
1791                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1791                     ; 359 {
1792                     	switch	.text
1793  0401               _TIM3_UpdateRequestConfig:
1795  0401 88            	push	a
1796       00000000      OFST:	set	0
1799                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1801  0402 4d            	tnz	a
1802  0403 2704          	jreq	L012
1803  0405 a101          	cp	a,#1
1804  0407 2603          	jrne	L602
1805  0409               L012:
1806  0409 4f            	clr	a
1807  040a 2010          	jra	L212
1808  040c               L602:
1809  040c ae0169        	ldw	x,#361
1810  040f 89            	pushw	x
1811  0410 ae0000        	ldw	x,#0
1812  0413 89            	pushw	x
1813  0414 ae0000        	ldw	x,#L502
1814  0417 cd0000        	call	_assert_failed
1816  041a 5b04          	addw	sp,#4
1817  041c               L212:
1818                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1820  041c 0d01          	tnz	(OFST+1,sp)
1821  041e 2706          	jreq	L575
1822                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1824  0420 72145320      	bset	21280,#2
1826  0424 2004          	jra	L775
1827  0426               L575:
1828                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1830  0426 72155320      	bres	21280,#2
1831  042a               L775:
1832                     ; 372 }
1835  042a 84            	pop	a
1836  042b 81            	ret
1894                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1894                     ; 384 {
1895                     	switch	.text
1896  042c               _TIM3_SelectOnePulseMode:
1898  042c 88            	push	a
1899       00000000      OFST:	set	0
1902                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1904  042d a101          	cp	a,#1
1905  042f 2703          	jreq	L022
1906  0431 4d            	tnz	a
1907  0432 2603          	jrne	L612
1908  0434               L022:
1909  0434 4f            	clr	a
1910  0435 2010          	jra	L222
1911  0437               L612:
1912  0437 ae0182        	ldw	x,#386
1913  043a 89            	pushw	x
1914  043b ae0000        	ldw	x,#0
1915  043e 89            	pushw	x
1916  043f ae0000        	ldw	x,#L502
1917  0442 cd0000        	call	_assert_failed
1919  0445 5b04          	addw	sp,#4
1920  0447               L222:
1921                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1923  0447 0d01          	tnz	(OFST+1,sp)
1924  0449 2706          	jreq	L726
1925                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1927  044b 72165320      	bset	21280,#3
1929  044f 2004          	jra	L136
1930  0451               L726:
1931                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1933  0451 72175320      	bres	21280,#3
1934  0455               L136:
1935                     ; 398 }
1938  0455 84            	pop	a
1939  0456 81            	ret
2008                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
2008                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
2008                     ; 431 {
2009                     	switch	.text
2010  0457               _TIM3_PrescalerConfig:
2012  0457 89            	pushw	x
2013       00000000      OFST:	set	0
2016                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
2018  0458 9f            	ld	a,xl
2019  0459 4d            	tnz	a
2020  045a 2705          	jreq	L032
2021  045c 9f            	ld	a,xl
2022  045d a101          	cp	a,#1
2023  045f 2603          	jrne	L622
2024  0461               L032:
2025  0461 4f            	clr	a
2026  0462 2010          	jra	L232
2027  0464               L622:
2028  0464 ae01b1        	ldw	x,#433
2029  0467 89            	pushw	x
2030  0468 ae0000        	ldw	x,#0
2031  046b 89            	pushw	x
2032  046c ae0000        	ldw	x,#L502
2033  046f cd0000        	call	_assert_failed
2035  0472 5b04          	addw	sp,#4
2036  0474               L232:
2037                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
2039  0474 0d01          	tnz	(OFST+1,sp)
2040  0476 275a          	jreq	L632
2041  0478 7b01          	ld	a,(OFST+1,sp)
2042  047a a101          	cp	a,#1
2043  047c 2754          	jreq	L632
2044  047e 7b01          	ld	a,(OFST+1,sp)
2045  0480 a102          	cp	a,#2
2046  0482 274e          	jreq	L632
2047  0484 7b01          	ld	a,(OFST+1,sp)
2048  0486 a103          	cp	a,#3
2049  0488 2748          	jreq	L632
2050  048a 7b01          	ld	a,(OFST+1,sp)
2051  048c a104          	cp	a,#4
2052  048e 2742          	jreq	L632
2053  0490 7b01          	ld	a,(OFST+1,sp)
2054  0492 a105          	cp	a,#5
2055  0494 273c          	jreq	L632
2056  0496 7b01          	ld	a,(OFST+1,sp)
2057  0498 a106          	cp	a,#6
2058  049a 2736          	jreq	L632
2059  049c 7b01          	ld	a,(OFST+1,sp)
2060  049e a107          	cp	a,#7
2061  04a0 2730          	jreq	L632
2062  04a2 7b01          	ld	a,(OFST+1,sp)
2063  04a4 a108          	cp	a,#8
2064  04a6 272a          	jreq	L632
2065  04a8 7b01          	ld	a,(OFST+1,sp)
2066  04aa a109          	cp	a,#9
2067  04ac 2724          	jreq	L632
2068  04ae 7b01          	ld	a,(OFST+1,sp)
2069  04b0 a10a          	cp	a,#10
2070  04b2 271e          	jreq	L632
2071  04b4 7b01          	ld	a,(OFST+1,sp)
2072  04b6 a10b          	cp	a,#11
2073  04b8 2718          	jreq	L632
2074  04ba 7b01          	ld	a,(OFST+1,sp)
2075  04bc a10c          	cp	a,#12
2076  04be 2712          	jreq	L632
2077  04c0 7b01          	ld	a,(OFST+1,sp)
2078  04c2 a10d          	cp	a,#13
2079  04c4 270c          	jreq	L632
2080  04c6 7b01          	ld	a,(OFST+1,sp)
2081  04c8 a10e          	cp	a,#14
2082  04ca 2706          	jreq	L632
2083  04cc 7b01          	ld	a,(OFST+1,sp)
2084  04ce a10f          	cp	a,#15
2085  04d0 2603          	jrne	L432
2086  04d2               L632:
2087  04d2 4f            	clr	a
2088  04d3 2010          	jra	L042
2089  04d5               L432:
2090  04d5 ae01b2        	ldw	x,#434
2091  04d8 89            	pushw	x
2092  04d9 ae0000        	ldw	x,#0
2093  04dc 89            	pushw	x
2094  04dd ae0000        	ldw	x,#L502
2095  04e0 cd0000        	call	_assert_failed
2097  04e3 5b04          	addw	sp,#4
2098  04e5               L042:
2099                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
2101  04e5 7b01          	ld	a,(OFST+1,sp)
2102  04e7 c7532a        	ld	21290,a
2103                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
2105  04ea 7b02          	ld	a,(OFST+2,sp)
2106  04ec c75324        	ld	21284,a
2107                     ; 441 }
2110  04ef 85            	popw	x
2111  04f0 81            	ret
2170                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2170                     ; 453 {
2171                     	switch	.text
2172  04f1               _TIM3_ForcedOC1Config:
2174  04f1 88            	push	a
2175       00000000      OFST:	set	0
2178                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2180  04f2 a150          	cp	a,#80
2181  04f4 2704          	jreq	L642
2182  04f6 a140          	cp	a,#64
2183  04f8 2603          	jrne	L442
2184  04fa               L642:
2185  04fa 4f            	clr	a
2186  04fb 2010          	jra	L052
2187  04fd               L442:
2188  04fd ae01c7        	ldw	x,#455
2189  0500 89            	pushw	x
2190  0501 ae0000        	ldw	x,#0
2191  0504 89            	pushw	x
2192  0505 ae0000        	ldw	x,#L502
2193  0508 cd0000        	call	_assert_failed
2195  050b 5b04          	addw	sp,#4
2196  050d               L052:
2197                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2199  050d c65325        	ld	a,21285
2200  0510 a48f          	and	a,#143
2201  0512 1a01          	or	a,(OFST+1,sp)
2202  0514 c75325        	ld	21285,a
2203                     ; 459 }
2206  0517 84            	pop	a
2207  0518 81            	ret
2244                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2244                     ; 471 {
2245                     	switch	.text
2246  0519               _TIM3_ForcedOC2Config:
2248  0519 88            	push	a
2249       00000000      OFST:	set	0
2252                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2254  051a a150          	cp	a,#80
2255  051c 2704          	jreq	L652
2256  051e a140          	cp	a,#64
2257  0520 2603          	jrne	L452
2258  0522               L652:
2259  0522 4f            	clr	a
2260  0523 2010          	jra	L062
2261  0525               L452:
2262  0525 ae01d9        	ldw	x,#473
2263  0528 89            	pushw	x
2264  0529 ae0000        	ldw	x,#0
2265  052c 89            	pushw	x
2266  052d ae0000        	ldw	x,#L502
2267  0530 cd0000        	call	_assert_failed
2269  0533 5b04          	addw	sp,#4
2270  0535               L062:
2271                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2273  0535 c65326        	ld	a,21286
2274  0538 a48f          	and	a,#143
2275  053a 1a01          	or	a,(OFST+1,sp)
2276  053c c75326        	ld	21286,a
2277                     ; 477 }
2280  053f 84            	pop	a
2281  0540 81            	ret
2318                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2318                     ; 487 {
2319                     	switch	.text
2320  0541               _TIM3_ARRPreloadConfig:
2322  0541 88            	push	a
2323       00000000      OFST:	set	0
2326                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2328  0542 4d            	tnz	a
2329  0543 2704          	jreq	L662
2330  0545 a101          	cp	a,#1
2331  0547 2603          	jrne	L462
2332  0549               L662:
2333  0549 4f            	clr	a
2334  054a 2010          	jra	L072
2335  054c               L462:
2336  054c ae01e9        	ldw	x,#489
2337  054f 89            	pushw	x
2338  0550 ae0000        	ldw	x,#0
2339  0553 89            	pushw	x
2340  0554 ae0000        	ldw	x,#L502
2341  0557 cd0000        	call	_assert_failed
2343  055a 5b04          	addw	sp,#4
2344  055c               L072:
2345                     ; 492     if (NewState != DISABLE)
2347  055c 0d01          	tnz	(OFST+1,sp)
2348  055e 2706          	jreq	L747
2349                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
2351  0560 721e5320      	bset	21280,#7
2353  0564 2004          	jra	L157
2354  0566               L747:
2355                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2357  0566 721f5320      	bres	21280,#7
2358  056a               L157:
2359                     ; 500 }
2362  056a 84            	pop	a
2363  056b 81            	ret
2400                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2400                     ; 510 {
2401                     	switch	.text
2402  056c               _TIM3_OC1PreloadConfig:
2404  056c 88            	push	a
2405       00000000      OFST:	set	0
2408                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2410  056d 4d            	tnz	a
2411  056e 2704          	jreq	L672
2412  0570 a101          	cp	a,#1
2413  0572 2603          	jrne	L472
2414  0574               L672:
2415  0574 4f            	clr	a
2416  0575 2010          	jra	L003
2417  0577               L472:
2418  0577 ae0200        	ldw	x,#512
2419  057a 89            	pushw	x
2420  057b ae0000        	ldw	x,#0
2421  057e 89            	pushw	x
2422  057f ae0000        	ldw	x,#L502
2423  0582 cd0000        	call	_assert_failed
2425  0585 5b04          	addw	sp,#4
2426  0587               L003:
2427                     ; 515     if (NewState != DISABLE)
2429  0587 0d01          	tnz	(OFST+1,sp)
2430  0589 2706          	jreq	L177
2431                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2433  058b 72165325      	bset	21285,#3
2435  058f 2004          	jra	L377
2436  0591               L177:
2437                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2439  0591 72175325      	bres	21285,#3
2440  0595               L377:
2441                     ; 523 }
2444  0595 84            	pop	a
2445  0596 81            	ret
2482                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2482                     ; 533 {
2483                     	switch	.text
2484  0597               _TIM3_OC2PreloadConfig:
2486  0597 88            	push	a
2487       00000000      OFST:	set	0
2490                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2492  0598 4d            	tnz	a
2493  0599 2704          	jreq	L603
2494  059b a101          	cp	a,#1
2495  059d 2603          	jrne	L403
2496  059f               L603:
2497  059f 4f            	clr	a
2498  05a0 2010          	jra	L013
2499  05a2               L403:
2500  05a2 ae0217        	ldw	x,#535
2501  05a5 89            	pushw	x
2502  05a6 ae0000        	ldw	x,#0
2503  05a9 89            	pushw	x
2504  05aa ae0000        	ldw	x,#L502
2505  05ad cd0000        	call	_assert_failed
2507  05b0 5b04          	addw	sp,#4
2508  05b2               L013:
2509                     ; 538     if (NewState != DISABLE)
2511  05b2 0d01          	tnz	(OFST+1,sp)
2512  05b4 2706          	jreq	L3101
2513                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2515  05b6 72165326      	bset	21286,#3
2517  05ba 2004          	jra	L5101
2518  05bc               L3101:
2519                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2521  05bc 72175326      	bres	21286,#3
2522  05c0               L5101:
2523                     ; 546 }
2526  05c0 84            	pop	a
2527  05c1 81            	ret
2593                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2593                     ; 558 {
2594                     	switch	.text
2595  05c2               _TIM3_GenerateEvent:
2597  05c2 88            	push	a
2598       00000000      OFST:	set	0
2601                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2603  05c3 4d            	tnz	a
2604  05c4 2703          	jreq	L413
2605  05c6 4f            	clr	a
2606  05c7 2010          	jra	L613
2607  05c9               L413:
2608  05c9 ae0230        	ldw	x,#560
2609  05cc 89            	pushw	x
2610  05cd ae0000        	ldw	x,#0
2611  05d0 89            	pushw	x
2612  05d1 ae0000        	ldw	x,#L502
2613  05d4 cd0000        	call	_assert_failed
2615  05d7 5b04          	addw	sp,#4
2616  05d9               L613:
2617                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
2619  05d9 7b01          	ld	a,(OFST+1,sp)
2620  05db c75324        	ld	21284,a
2621                     ; 564 }
2624  05de 84            	pop	a
2625  05df 81            	ret
2662                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2662                     ; 576 {
2663                     	switch	.text
2664  05e0               _TIM3_OC1PolarityConfig:
2666  05e0 88            	push	a
2667       00000000      OFST:	set	0
2670                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2672  05e1 4d            	tnz	a
2673  05e2 2704          	jreq	L423
2674  05e4 a122          	cp	a,#34
2675  05e6 2603          	jrne	L223
2676  05e8               L423:
2677  05e8 4f            	clr	a
2678  05e9 2010          	jra	L623
2679  05eb               L223:
2680  05eb ae0242        	ldw	x,#578
2681  05ee 89            	pushw	x
2682  05ef ae0000        	ldw	x,#0
2683  05f2 89            	pushw	x
2684  05f3 ae0000        	ldw	x,#L502
2685  05f6 cd0000        	call	_assert_failed
2687  05f9 5b04          	addw	sp,#4
2688  05fb               L623:
2689                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2691  05fb 0d01          	tnz	(OFST+1,sp)
2692  05fd 2706          	jreq	L5601
2693                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2695  05ff 72125327      	bset	21287,#1
2697  0603 2004          	jra	L7601
2698  0605               L5601:
2699                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2701  0605 72135327      	bres	21287,#1
2702  0609               L7601:
2703                     ; 589 }
2706  0609 84            	pop	a
2707  060a 81            	ret
2744                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2744                     ; 601 {
2745                     	switch	.text
2746  060b               _TIM3_OC2PolarityConfig:
2748  060b 88            	push	a
2749       00000000      OFST:	set	0
2752                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2754  060c 4d            	tnz	a
2755  060d 2704          	jreq	L433
2756  060f a122          	cp	a,#34
2757  0611 2603          	jrne	L233
2758  0613               L433:
2759  0613 4f            	clr	a
2760  0614 2010          	jra	L633
2761  0616               L233:
2762  0616 ae025b        	ldw	x,#603
2763  0619 89            	pushw	x
2764  061a ae0000        	ldw	x,#0
2765  061d 89            	pushw	x
2766  061e ae0000        	ldw	x,#L502
2767  0621 cd0000        	call	_assert_failed
2769  0624 5b04          	addw	sp,#4
2770  0626               L633:
2771                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2773  0626 0d01          	tnz	(OFST+1,sp)
2774  0628 2706          	jreq	L7011
2775                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2777  062a 721a5327      	bset	21287,#5
2779  062e 2004          	jra	L1111
2780  0630               L7011:
2781                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2783  0630 721b5327      	bres	21287,#5
2784  0634               L1111:
2785                     ; 614 }
2788  0634 84            	pop	a
2789  0635 81            	ret
2835                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2835                     ; 628 {
2836                     	switch	.text
2837  0636               _TIM3_CCxCmd:
2839  0636 89            	pushw	x
2840       00000000      OFST:	set	0
2843                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2845  0637 9e            	ld	a,xh
2846  0638 4d            	tnz	a
2847  0639 2705          	jreq	L443
2848  063b 9e            	ld	a,xh
2849  063c a101          	cp	a,#1
2850  063e 2603          	jrne	L243
2851  0640               L443:
2852  0640 4f            	clr	a
2853  0641 2010          	jra	L643
2854  0643               L243:
2855  0643 ae0276        	ldw	x,#630
2856  0646 89            	pushw	x
2857  0647 ae0000        	ldw	x,#0
2858  064a 89            	pushw	x
2859  064b ae0000        	ldw	x,#L502
2860  064e cd0000        	call	_assert_failed
2862  0651 5b04          	addw	sp,#4
2863  0653               L643:
2864                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2866  0653 0d02          	tnz	(OFST+2,sp)
2867  0655 2706          	jreq	L253
2868  0657 7b02          	ld	a,(OFST+2,sp)
2869  0659 a101          	cp	a,#1
2870  065b 2603          	jrne	L053
2871  065d               L253:
2872  065d 4f            	clr	a
2873  065e 2010          	jra	L453
2874  0660               L053:
2875  0660 ae0277        	ldw	x,#631
2876  0663 89            	pushw	x
2877  0664 ae0000        	ldw	x,#0
2878  0667 89            	pushw	x
2879  0668 ae0000        	ldw	x,#L502
2880  066b cd0000        	call	_assert_failed
2882  066e 5b04          	addw	sp,#4
2883  0670               L453:
2884                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2886  0670 0d01          	tnz	(OFST+1,sp)
2887  0672 2610          	jrne	L5311
2888                     ; 636         if (NewState != DISABLE)
2890  0674 0d02          	tnz	(OFST+2,sp)
2891  0676 2706          	jreq	L7311
2892                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2894  0678 72105327      	bset	21287,#0
2896  067c 2014          	jra	L3411
2897  067e               L7311:
2898                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2900  067e 72115327      	bres	21287,#0
2901  0682 200e          	jra	L3411
2902  0684               L5311:
2903                     ; 649         if (NewState != DISABLE)
2905  0684 0d02          	tnz	(OFST+2,sp)
2906  0686 2706          	jreq	L5411
2907                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2909  0688 72185327      	bset	21287,#4
2911  068c 2004          	jra	L3411
2912  068e               L5411:
2913                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2915  068e 72195327      	bres	21287,#4
2916  0692               L3411:
2917                     ; 659 }
2920  0692 85            	popw	x
2921  0693 81            	ret
2967                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2967                     ; 681 {
2968                     	switch	.text
2969  0694               _TIM3_SelectOCxM:
2971  0694 89            	pushw	x
2972       00000000      OFST:	set	0
2975                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2977  0695 9e            	ld	a,xh
2978  0696 4d            	tnz	a
2979  0697 2705          	jreq	L263
2980  0699 9e            	ld	a,xh
2981  069a a101          	cp	a,#1
2982  069c 2603          	jrne	L063
2983  069e               L263:
2984  069e 4f            	clr	a
2985  069f 2010          	jra	L463
2986  06a1               L063:
2987  06a1 ae02ab        	ldw	x,#683
2988  06a4 89            	pushw	x
2989  06a5 ae0000        	ldw	x,#0
2990  06a8 89            	pushw	x
2991  06a9 ae0000        	ldw	x,#L502
2992  06ac cd0000        	call	_assert_failed
2994  06af 5b04          	addw	sp,#4
2995  06b1               L463:
2996                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2998  06b1 0d02          	tnz	(OFST+2,sp)
2999  06b3 272a          	jreq	L073
3000  06b5 7b02          	ld	a,(OFST+2,sp)
3001  06b7 a110          	cp	a,#16
3002  06b9 2724          	jreq	L073
3003  06bb 7b02          	ld	a,(OFST+2,sp)
3004  06bd a120          	cp	a,#32
3005  06bf 271e          	jreq	L073
3006  06c1 7b02          	ld	a,(OFST+2,sp)
3007  06c3 a130          	cp	a,#48
3008  06c5 2718          	jreq	L073
3009  06c7 7b02          	ld	a,(OFST+2,sp)
3010  06c9 a160          	cp	a,#96
3011  06cb 2712          	jreq	L073
3012  06cd 7b02          	ld	a,(OFST+2,sp)
3013  06cf a170          	cp	a,#112
3014  06d1 270c          	jreq	L073
3015  06d3 7b02          	ld	a,(OFST+2,sp)
3016  06d5 a150          	cp	a,#80
3017  06d7 2706          	jreq	L073
3018  06d9 7b02          	ld	a,(OFST+2,sp)
3019  06db a140          	cp	a,#64
3020  06dd 2603          	jrne	L663
3021  06df               L073:
3022  06df 4f            	clr	a
3023  06e0 2010          	jra	L273
3024  06e2               L663:
3025  06e2 ae02ac        	ldw	x,#684
3026  06e5 89            	pushw	x
3027  06e6 ae0000        	ldw	x,#0
3028  06e9 89            	pushw	x
3029  06ea ae0000        	ldw	x,#L502
3030  06ed cd0000        	call	_assert_failed
3032  06f0 5b04          	addw	sp,#4
3033  06f2               L273:
3034                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
3036  06f2 0d01          	tnz	(OFST+1,sp)
3037  06f4 2610          	jrne	L3711
3038                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3040  06f6 72115327      	bres	21287,#0
3041                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3043  06fa c65325        	ld	a,21285
3044  06fd a48f          	and	a,#143
3045  06ff 1a02          	or	a,(OFST+2,sp)
3046  0701 c75325        	ld	21285,a
3048  0704 200e          	jra	L5711
3049  0706               L3711:
3050                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
3052  0706 72195327      	bres	21287,#4
3053                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3055  070a c65326        	ld	a,21286
3056  070d a48f          	and	a,#143
3057  070f 1a02          	or	a,(OFST+2,sp)
3058  0711 c75326        	ld	21286,a
3059  0714               L5711:
3060                     ; 702 }
3063  0714 85            	popw	x
3064  0715 81            	ret
3098                     ; 711 void TIM3_SetCounter(uint16_t Counter)
3098                     ; 712 {
3099                     	switch	.text
3100  0716               _TIM3_SetCounter:
3104                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
3106  0716 9e            	ld	a,xh
3107  0717 c75328        	ld	21288,a
3108                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
3110  071a 9f            	ld	a,xl
3111  071b c75329        	ld	21289,a
3112                     ; 717 }
3115  071e 81            	ret
3149                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
3149                     ; 727 {
3150                     	switch	.text
3151  071f               _TIM3_SetAutoreload:
3155                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
3157  071f 9e            	ld	a,xh
3158  0720 c7532b        	ld	21291,a
3159                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
3161  0723 9f            	ld	a,xl
3162  0724 c7532c        	ld	21292,a
3163                     ; 731 }
3166  0727 81            	ret
3200                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
3200                     ; 741 {
3201                     	switch	.text
3202  0728               _TIM3_SetCompare1:
3206                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
3208  0728 9e            	ld	a,xh
3209  0729 c7532d        	ld	21293,a
3210                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
3212  072c 9f            	ld	a,xl
3213  072d c7532e        	ld	21294,a
3214                     ; 745 }
3217  0730 81            	ret
3251                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
3251                     ; 755 {
3252                     	switch	.text
3253  0731               _TIM3_SetCompare2:
3257                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3259  0731 9e            	ld	a,xh
3260  0732 c7532f        	ld	21295,a
3261                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
3263  0735 9f            	ld	a,xl
3264  0736 c75330        	ld	21296,a
3265                     ; 759 }
3268  0739 81            	ret
3305                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3305                     ; 773 {
3306                     	switch	.text
3307  073a               _TIM3_SetIC1Prescaler:
3309  073a 88            	push	a
3310       00000000      OFST:	set	0
3313                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3315  073b 4d            	tnz	a
3316  073c 270c          	jreq	L014
3317  073e a104          	cp	a,#4
3318  0740 2708          	jreq	L014
3319  0742 a108          	cp	a,#8
3320  0744 2704          	jreq	L014
3321  0746 a10c          	cp	a,#12
3322  0748 2603          	jrne	L604
3323  074a               L014:
3324  074a 4f            	clr	a
3325  074b 2010          	jra	L214
3326  074d               L604:
3327  074d ae0307        	ldw	x,#775
3328  0750 89            	pushw	x
3329  0751 ae0000        	ldw	x,#0
3330  0754 89            	pushw	x
3331  0755 ae0000        	ldw	x,#L502
3332  0758 cd0000        	call	_assert_failed
3334  075b 5b04          	addw	sp,#4
3335  075d               L214:
3336                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3338  075d c65325        	ld	a,21285
3339  0760 a4f3          	and	a,#243
3340  0762 1a01          	or	a,(OFST+1,sp)
3341  0764 c75325        	ld	21285,a
3342                     ; 779 }
3345  0767 84            	pop	a
3346  0768 81            	ret
3383                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3383                     ; 792 {
3384                     	switch	.text
3385  0769               _TIM3_SetIC2Prescaler:
3387  0769 88            	push	a
3388       00000000      OFST:	set	0
3391                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3393  076a 4d            	tnz	a
3394  076b 270c          	jreq	L024
3395  076d a104          	cp	a,#4
3396  076f 2708          	jreq	L024
3397  0771 a108          	cp	a,#8
3398  0773 2704          	jreq	L024
3399  0775 a10c          	cp	a,#12
3400  0777 2603          	jrne	L614
3401  0779               L024:
3402  0779 4f            	clr	a
3403  077a 2010          	jra	L224
3404  077c               L614:
3405  077c ae031a        	ldw	x,#794
3406  077f 89            	pushw	x
3407  0780 ae0000        	ldw	x,#0
3408  0783 89            	pushw	x
3409  0784 ae0000        	ldw	x,#L502
3410  0787 cd0000        	call	_assert_failed
3412  078a 5b04          	addw	sp,#4
3413  078c               L224:
3414                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3416  078c c65326        	ld	a,21286
3417  078f a4f3          	and	a,#243
3418  0791 1a01          	or	a,(OFST+1,sp)
3419  0793 c75326        	ld	21286,a
3420                     ; 798 }
3423  0796 84            	pop	a
3424  0797 81            	ret
3476                     ; 804 uint16_t TIM3_GetCapture1(void)
3476                     ; 805 {
3477                     	switch	.text
3478  0798               _TIM3_GetCapture1:
3480  0798 5204          	subw	sp,#4
3481       00000004      OFST:	set	4
3484                     ; 807     uint16_t tmpccr1 = 0;
3486                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
3490                     ; 810     tmpccr1h = TIM3->CCR1H;
3492  079a c6532d        	ld	a,21293
3493  079d 6b02          	ld	(OFST-2,sp),a
3494                     ; 811     tmpccr1l = TIM3->CCR1L;
3496  079f c6532e        	ld	a,21294
3497  07a2 6b01          	ld	(OFST-3,sp),a
3498                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
3500  07a4 7b01          	ld	a,(OFST-3,sp)
3501  07a6 5f            	clrw	x
3502  07a7 97            	ld	xl,a
3503  07a8 1f03          	ldw	(OFST-1,sp),x
3504                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3506  07aa 7b02          	ld	a,(OFST-2,sp)
3507  07ac 5f            	clrw	x
3508  07ad 97            	ld	xl,a
3509  07ae 4f            	clr	a
3510  07af 02            	rlwa	x,a
3511  07b0 01            	rrwa	x,a
3512  07b1 1a04          	or	a,(OFST+0,sp)
3513  07b3 01            	rrwa	x,a
3514  07b4 1a03          	or	a,(OFST-1,sp)
3515  07b6 01            	rrwa	x,a
3516  07b7 1f03          	ldw	(OFST-1,sp),x
3517                     ; 816     return (uint16_t)tmpccr1;
3519  07b9 1e03          	ldw	x,(OFST-1,sp)
3522  07bb 5b04          	addw	sp,#4
3523  07bd 81            	ret
3575                     ; 824 uint16_t TIM3_GetCapture2(void)
3575                     ; 825 {
3576                     	switch	.text
3577  07be               _TIM3_GetCapture2:
3579  07be 5204          	subw	sp,#4
3580       00000004      OFST:	set	4
3583                     ; 827     uint16_t tmpccr2 = 0;
3585                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
3589                     ; 830     tmpccr2h = TIM3->CCR2H;
3591  07c0 c6532f        	ld	a,21295
3592  07c3 6b02          	ld	(OFST-2,sp),a
3593                     ; 831     tmpccr2l = TIM3->CCR2L;
3595  07c5 c65330        	ld	a,21296
3596  07c8 6b01          	ld	(OFST-3,sp),a
3597                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
3599  07ca 7b01          	ld	a,(OFST-3,sp)
3600  07cc 5f            	clrw	x
3601  07cd 97            	ld	xl,a
3602  07ce 1f03          	ldw	(OFST-1,sp),x
3603                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3605  07d0 7b02          	ld	a,(OFST-2,sp)
3606  07d2 5f            	clrw	x
3607  07d3 97            	ld	xl,a
3608  07d4 4f            	clr	a
3609  07d5 02            	rlwa	x,a
3610  07d6 01            	rrwa	x,a
3611  07d7 1a04          	or	a,(OFST+0,sp)
3612  07d9 01            	rrwa	x,a
3613  07da 1a03          	or	a,(OFST-1,sp)
3614  07dc 01            	rrwa	x,a
3615  07dd 1f03          	ldw	(OFST-1,sp),x
3616                     ; 836     return (uint16_t)tmpccr2;
3618  07df 1e03          	ldw	x,(OFST-1,sp)
3621  07e1 5b04          	addw	sp,#4
3622  07e3 81            	ret
3656                     ; 844 uint16_t TIM3_GetCounter(void)
3656                     ; 845 {
3657                     	switch	.text
3658  07e4               _TIM3_GetCounter:
3660  07e4 89            	pushw	x
3661       00000002      OFST:	set	2
3664                     ; 846    uint16_t tmpcntr = 0;
3666                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3668  07e5 c65328        	ld	a,21288
3669  07e8 5f            	clrw	x
3670  07e9 97            	ld	xl,a
3671  07ea 4f            	clr	a
3672  07eb 02            	rlwa	x,a
3673  07ec 1f01          	ldw	(OFST-1,sp),x
3674                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3676  07ee c65329        	ld	a,21289
3677  07f1 5f            	clrw	x
3678  07f2 97            	ld	xl,a
3679  07f3 01            	rrwa	x,a
3680  07f4 1a02          	or	a,(OFST+0,sp)
3681  07f6 01            	rrwa	x,a
3682  07f7 1a01          	or	a,(OFST-1,sp)
3683  07f9 01            	rrwa	x,a
3686  07fa 5b02          	addw	sp,#2
3687  07fc 81            	ret
3711                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3711                     ; 860 {
3712                     	switch	.text
3713  07fd               _TIM3_GetPrescaler:
3717                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3719  07fd c6532a        	ld	a,21290
3722  0800 81            	ret
3848                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3848                     ; 878 {
3849                     	switch	.text
3850  0801               _TIM3_GetFlagStatus:
3852  0801 89            	pushw	x
3853  0802 89            	pushw	x
3854       00000002      OFST:	set	2
3857                     ; 879    FlagStatus bitstatus = RESET;
3859                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3863                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3865  0803 a30001        	cpw	x,#1
3866  0806 2714          	jreq	L044
3867  0808 a30002        	cpw	x,#2
3868  080b 270f          	jreq	L044
3869  080d a30004        	cpw	x,#4
3870  0810 270a          	jreq	L044
3871  0812 a30200        	cpw	x,#512
3872  0815 2705          	jreq	L044
3873  0817 a30400        	cpw	x,#1024
3874  081a 2603          	jrne	L634
3875  081c               L044:
3876  081c 4f            	clr	a
3877  081d 2010          	jra	L244
3878  081f               L634:
3879  081f ae0373        	ldw	x,#883
3880  0822 89            	pushw	x
3881  0823 ae0000        	ldw	x,#0
3882  0826 89            	pushw	x
3883  0827 ae0000        	ldw	x,#L502
3884  082a cd0000        	call	_assert_failed
3886  082d 5b04          	addw	sp,#4
3887  082f               L244:
3888                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3890  082f c65322        	ld	a,21282
3891  0832 1404          	and	a,(OFST+2,sp)
3892  0834 6b01          	ld	(OFST-1,sp),a
3893                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3895  0836 7b03          	ld	a,(OFST+1,sp)
3896  0838 6b02          	ld	(OFST+0,sp),a
3897                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3899  083a c65323        	ld	a,21283
3900  083d 1402          	and	a,(OFST+0,sp)
3901  083f 1a01          	or	a,(OFST-1,sp)
3902  0841 2706          	jreq	L5051
3903                     ; 890         bitstatus = SET;
3905  0843 a601          	ld	a,#1
3906  0845 6b02          	ld	(OFST+0,sp),a
3908  0847 2002          	jra	L7051
3909  0849               L5051:
3910                     ; 894         bitstatus = RESET;
3912  0849 0f02          	clr	(OFST+0,sp)
3913  084b               L7051:
3914                     ; 896     return (FlagStatus)bitstatus;
3916  084b 7b02          	ld	a,(OFST+0,sp)
3919  084d 5b04          	addw	sp,#4
3920  084f 81            	ret
3956                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3956                     ; 912 {
3957                     	switch	.text
3958  0850               _TIM3_ClearFlag:
3960  0850 89            	pushw	x
3961       00000000      OFST:	set	0
3964                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3966  0851 01            	rrwa	x,a
3967  0852 a4f8          	and	a,#248
3968  0854 01            	rrwa	x,a
3969  0855 a4f9          	and	a,#249
3970  0857 01            	rrwa	x,a
3971  0858 a30000        	cpw	x,#0
3972  085b 2607          	jrne	L644
3973  085d 1e01          	ldw	x,(OFST+1,sp)
3974  085f 2703          	jreq	L644
3975  0861 4f            	clr	a
3976  0862 2010          	jra	L054
3977  0864               L644:
3978  0864 ae0392        	ldw	x,#914
3979  0867 89            	pushw	x
3980  0868 ae0000        	ldw	x,#0
3981  086b 89            	pushw	x
3982  086c ae0000        	ldw	x,#L502
3983  086f cd0000        	call	_assert_failed
3985  0872 5b04          	addw	sp,#4
3986  0874               L054:
3987                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3989  0874 7b02          	ld	a,(OFST+2,sp)
3990  0876 43            	cpl	a
3991  0877 c75322        	ld	21282,a
3992                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3994  087a 7b01          	ld	a,(OFST+1,sp)
3995  087c 43            	cpl	a
3996  087d c75323        	ld	21283,a
3997                     ; 919 }
4000  0880 85            	popw	x
4001  0881 81            	ret
4066                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4066                     ; 933 {
4067                     	switch	.text
4068  0882               _TIM3_GetITStatus:
4070  0882 88            	push	a
4071  0883 89            	pushw	x
4072       00000002      OFST:	set	2
4075                     ; 934     ITStatus bitstatus = RESET;
4077                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
4081                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
4083  0884 a101          	cp	a,#1
4084  0886 2708          	jreq	L654
4085  0888 a102          	cp	a,#2
4086  088a 2704          	jreq	L654
4087  088c a104          	cp	a,#4
4088  088e 2603          	jrne	L454
4089  0890               L654:
4090  0890 4f            	clr	a
4091  0891 2010          	jra	L064
4092  0893               L454:
4093  0893 ae03aa        	ldw	x,#938
4094  0896 89            	pushw	x
4095  0897 ae0000        	ldw	x,#0
4096  089a 89            	pushw	x
4097  089b ae0000        	ldw	x,#L502
4098  089e cd0000        	call	_assert_failed
4100  08a1 5b04          	addw	sp,#4
4101  08a3               L064:
4102                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
4104  08a3 c65322        	ld	a,21282
4105  08a6 1403          	and	a,(OFST+1,sp)
4106  08a8 6b01          	ld	(OFST-1,sp),a
4107                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
4109  08aa c65321        	ld	a,21281
4110  08ad 1403          	and	a,(OFST+1,sp)
4111  08af 6b02          	ld	(OFST+0,sp),a
4112                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
4114  08b1 0d01          	tnz	(OFST-1,sp)
4115  08b3 270a          	jreq	L1651
4117  08b5 0d02          	tnz	(OFST+0,sp)
4118  08b7 2706          	jreq	L1651
4119                     ; 946         bitstatus = SET;
4121  08b9 a601          	ld	a,#1
4122  08bb 6b02          	ld	(OFST+0,sp),a
4124  08bd 2002          	jra	L3651
4125  08bf               L1651:
4126                     ; 950         bitstatus = RESET;
4128  08bf 0f02          	clr	(OFST+0,sp)
4129  08c1               L3651:
4130                     ; 952     return (ITStatus)(bitstatus);
4132  08c1 7b02          	ld	a,(OFST+0,sp)
4135  08c3 5b03          	addw	sp,#3
4136  08c5 81            	ret
4173                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4173                     ; 966 {
4174                     	switch	.text
4175  08c6               _TIM3_ClearITPendingBit:
4177  08c6 88            	push	a
4178       00000000      OFST:	set	0
4181                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
4183  08c7 4d            	tnz	a
4184  08c8 2707          	jreq	L464
4185  08ca a108          	cp	a,#8
4186  08cc 2403          	jruge	L464
4187  08ce 4f            	clr	a
4188  08cf 2010          	jra	L664
4189  08d1               L464:
4190  08d1 ae03c8        	ldw	x,#968
4191  08d4 89            	pushw	x
4192  08d5 ae0000        	ldw	x,#0
4193  08d8 89            	pushw	x
4194  08d9 ae0000        	ldw	x,#L502
4195  08dc cd0000        	call	_assert_failed
4197  08df 5b04          	addw	sp,#4
4198  08e1               L664:
4199                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
4201  08e1 7b01          	ld	a,(OFST+1,sp)
4202  08e3 43            	cpl	a
4203  08e4 c75322        	ld	21282,a
4204                     ; 972 }
4207  08e7 84            	pop	a
4208  08e8 81            	ret
4260                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
4260                     ; 992                        uint8_t TIM3_ICSelection,
4260                     ; 993                        uint8_t TIM3_ICFilter)
4260                     ; 994 {
4261                     	switch	.text
4262  08e9               L3_TI1_Config:
4264  08e9 89            	pushw	x
4265  08ea 88            	push	a
4266       00000001      OFST:	set	1
4269                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
4271  08eb 72115327      	bres	21287,#0
4272                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
4274  08ef 7b06          	ld	a,(OFST+5,sp)
4275  08f1 97            	ld	xl,a
4276  08f2 a610          	ld	a,#16
4277  08f4 42            	mul	x,a
4278  08f5 9f            	ld	a,xl
4279  08f6 1a03          	or	a,(OFST+2,sp)
4280  08f8 6b01          	ld	(OFST+0,sp),a
4281  08fa c65325        	ld	a,21285
4282  08fd a40c          	and	a,#12
4283  08ff 1a01          	or	a,(OFST+0,sp)
4284  0901 c75325        	ld	21285,a
4285                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4287  0904 0d02          	tnz	(OFST+1,sp)
4288  0906 2706          	jreq	L1361
4289                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
4291  0908 72125327      	bset	21287,#1
4293  090c 2004          	jra	L3361
4294  090e               L1361:
4295                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
4297  090e 72135327      	bres	21287,#1
4298  0912               L3361:
4299                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
4301  0912 72105327      	bset	21287,#0
4302                     ; 1012 }
4305  0916 5b03          	addw	sp,#3
4306  0918 81            	ret
4358                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
4358                     ; 1032                        uint8_t TIM3_ICSelection,
4358                     ; 1033                        uint8_t TIM3_ICFilter)
4358                     ; 1034 {
4359                     	switch	.text
4360  0919               L5_TI2_Config:
4362  0919 89            	pushw	x
4363  091a 88            	push	a
4364       00000001      OFST:	set	1
4367                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4369  091b 72195327      	bres	21287,#4
4370                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4370                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4370                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
4372  091f 7b06          	ld	a,(OFST+5,sp)
4373  0921 97            	ld	xl,a
4374  0922 a610          	ld	a,#16
4375  0924 42            	mul	x,a
4376  0925 9f            	ld	a,xl
4377  0926 1a03          	or	a,(OFST+2,sp)
4378  0928 6b01          	ld	(OFST+0,sp),a
4379  092a c65326        	ld	a,21286
4380  092d a40c          	and	a,#12
4381  092f 1a01          	or	a,(OFST+0,sp)
4382  0931 c75326        	ld	21286,a
4383                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4385  0934 0d02          	tnz	(OFST+1,sp)
4386  0936 2706          	jreq	L3661
4387                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
4389  0938 721a5327      	bset	21287,#5
4391  093c 2004          	jra	L5661
4392  093e               L3661:
4393                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4395  093e 721b5327      	bres	21287,#5
4396  0942               L5661:
4397                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
4399  0942 72185327      	bset	21287,#4
4400                     ; 1056 }
4403  0946 5b03          	addw	sp,#3
4404  0948 81            	ret
4417                     	xdef	_TIM3_ClearITPendingBit
4418                     	xdef	_TIM3_GetITStatus
4419                     	xdef	_TIM3_ClearFlag
4420                     	xdef	_TIM3_GetFlagStatus
4421                     	xdef	_TIM3_GetPrescaler
4422                     	xdef	_TIM3_GetCounter
4423                     	xdef	_TIM3_GetCapture2
4424                     	xdef	_TIM3_GetCapture1
4425                     	xdef	_TIM3_SetIC2Prescaler
4426                     	xdef	_TIM3_SetIC1Prescaler
4427                     	xdef	_TIM3_SetCompare2
4428                     	xdef	_TIM3_SetCompare1
4429                     	xdef	_TIM3_SetAutoreload
4430                     	xdef	_TIM3_SetCounter
4431                     	xdef	_TIM3_SelectOCxM
4432                     	xdef	_TIM3_CCxCmd
4433                     	xdef	_TIM3_OC2PolarityConfig
4434                     	xdef	_TIM3_OC1PolarityConfig
4435                     	xdef	_TIM3_GenerateEvent
4436                     	xdef	_TIM3_OC2PreloadConfig
4437                     	xdef	_TIM3_OC1PreloadConfig
4438                     	xdef	_TIM3_ARRPreloadConfig
4439                     	xdef	_TIM3_ForcedOC2Config
4440                     	xdef	_TIM3_ForcedOC1Config
4441                     	xdef	_TIM3_PrescalerConfig
4442                     	xdef	_TIM3_SelectOnePulseMode
4443                     	xdef	_TIM3_UpdateRequestConfig
4444                     	xdef	_TIM3_UpdateDisableConfig
4445                     	xdef	_TIM3_ITConfig
4446                     	xdef	_TIM3_Cmd
4447                     	xdef	_TIM3_PWMIConfig
4448                     	xdef	_TIM3_ICInit
4449                     	xdef	_TIM3_OC2Init
4450                     	xdef	_TIM3_OC1Init
4451                     	xdef	_TIM3_TimeBaseInit
4452                     	xdef	_TIM3_DeInit
4453                     	xref	_assert_failed
4454                     .const:	section	.text
4455  0000               L502:
4456  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
4457  0012 696d332e6300  	dc.b	"im3.c",0
4477                     	end

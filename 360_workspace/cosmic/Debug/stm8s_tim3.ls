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
 270                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 270                     ; 79                         uint16_t TIM3_Period)
 270                     ; 80 {
 271                     	switch	.text
 272  0045               _TIM3_TimeBaseInit:
 274  0045 88            	push	a
 275       00000000      OFST:	set	0
 278                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 280  0046 c7532a        	ld	21290,a
 281                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 283  0049 7b04          	ld	a,(OFST+4,sp)
 284  004b c7532b        	ld	21291,a
 285                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 287  004e 7b05          	ld	a,(OFST+5,sp)
 288  0050 c7532c        	ld	21292,a
 289                     ; 86 }
 292  0053 84            	pop	a
 293  0054 81            	ret
 449                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 449                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 449                     ; 98                   uint16_t TIM3_Pulse,
 449                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 449                     ; 100 {
 450                     	switch	.text
 451  0055               _TIM3_OC1Init:
 453  0055 89            	pushw	x
 454  0056 88            	push	a
 455       00000001      OFST:	set	1
 458                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 460  0057 9e            	ld	a,xh
 461  0058 4d            	tnz	a
 462  0059 2719          	jreq	L41
 463  005b 9e            	ld	a,xh
 464  005c a110          	cp	a,#16
 465  005e 2714          	jreq	L41
 466  0060 9e            	ld	a,xh
 467  0061 a120          	cp	a,#32
 468  0063 270f          	jreq	L41
 469  0065 9e            	ld	a,xh
 470  0066 a130          	cp	a,#48
 471  0068 270a          	jreq	L41
 472  006a 9e            	ld	a,xh
 473  006b a160          	cp	a,#96
 474  006d 2705          	jreq	L41
 475  006f 9e            	ld	a,xh
 476  0070 a170          	cp	a,#112
 477  0072 2603          	jrne	L21
 478  0074               L41:
 479  0074 4f            	clr	a
 480  0075 2010          	jra	L61
 481  0077               L21:
 482  0077 ae0066        	ldw	x,#102
 483  007a 89            	pushw	x
 484  007b ae0000        	ldw	x,#0
 485  007e 89            	pushw	x
 486  007f ae0000        	ldw	x,#L102
 487  0082 cd0000        	call	_assert_failed
 489  0085 5b04          	addw	sp,#4
 490  0087               L61:
 491                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 493  0087 0d03          	tnz	(OFST+2,sp)
 494  0089 2706          	jreq	L22
 495  008b 7b03          	ld	a,(OFST+2,sp)
 496  008d a111          	cp	a,#17
 497  008f 2603          	jrne	L02
 498  0091               L22:
 499  0091 4f            	clr	a
 500  0092 2010          	jra	L42
 501  0094               L02:
 502  0094 ae0067        	ldw	x,#103
 503  0097 89            	pushw	x
 504  0098 ae0000        	ldw	x,#0
 505  009b 89            	pushw	x
 506  009c ae0000        	ldw	x,#L102
 507  009f cd0000        	call	_assert_failed
 509  00a2 5b04          	addw	sp,#4
 510  00a4               L42:
 511                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 513  00a4 0d08          	tnz	(OFST+7,sp)
 514  00a6 2706          	jreq	L03
 515  00a8 7b08          	ld	a,(OFST+7,sp)
 516  00aa a122          	cp	a,#34
 517  00ac 2603          	jrne	L62
 518  00ae               L03:
 519  00ae 4f            	clr	a
 520  00af 2010          	jra	L23
 521  00b1               L62:
 522  00b1 ae0068        	ldw	x,#104
 523  00b4 89            	pushw	x
 524  00b5 ae0000        	ldw	x,#0
 525  00b8 89            	pushw	x
 526  00b9 ae0000        	ldw	x,#L102
 527  00bc cd0000        	call	_assert_failed
 529  00bf 5b04          	addw	sp,#4
 530  00c1               L23:
 531                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 533  00c1 c65327        	ld	a,21287
 534  00c4 a4fc          	and	a,#252
 535  00c6 c75327        	ld	21287,a
 536                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 538  00c9 7b08          	ld	a,(OFST+7,sp)
 539  00cb a402          	and	a,#2
 540  00cd 6b01          	ld	(OFST+0,sp),a
 541  00cf 7b03          	ld	a,(OFST+2,sp)
 542  00d1 a401          	and	a,#1
 543  00d3 1a01          	or	a,(OFST+0,sp)
 544  00d5 ca5327        	or	a,21287
 545  00d8 c75327        	ld	21287,a
 546                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 548  00db c65325        	ld	a,21285
 549  00de a48f          	and	a,#143
 550  00e0 1a02          	or	a,(OFST+1,sp)
 551  00e2 c75325        	ld	21285,a
 552                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 554  00e5 7b06          	ld	a,(OFST+5,sp)
 555  00e7 c7532d        	ld	21293,a
 556                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 558  00ea 7b07          	ld	a,(OFST+6,sp)
 559  00ec c7532e        	ld	21294,a
 560                     ; 117 }
 563  00ef 5b03          	addw	sp,#3
 564  00f1 81            	ret
 627                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 627                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 627                     ; 130                   uint16_t TIM3_Pulse,
 627                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 627                     ; 132 {
 628                     	switch	.text
 629  00f2               _TIM3_OC2Init:
 631  00f2 89            	pushw	x
 632  00f3 88            	push	a
 633       00000001      OFST:	set	1
 636                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 638  00f4 9e            	ld	a,xh
 639  00f5 4d            	tnz	a
 640  00f6 2719          	jreq	L04
 641  00f8 9e            	ld	a,xh
 642  00f9 a110          	cp	a,#16
 643  00fb 2714          	jreq	L04
 644  00fd 9e            	ld	a,xh
 645  00fe a120          	cp	a,#32
 646  0100 270f          	jreq	L04
 647  0102 9e            	ld	a,xh
 648  0103 a130          	cp	a,#48
 649  0105 270a          	jreq	L04
 650  0107 9e            	ld	a,xh
 651  0108 a160          	cp	a,#96
 652  010a 2705          	jreq	L04
 653  010c 9e            	ld	a,xh
 654  010d a170          	cp	a,#112
 655  010f 2603          	jrne	L63
 656  0111               L04:
 657  0111 4f            	clr	a
 658  0112 2010          	jra	L24
 659  0114               L63:
 660  0114 ae0086        	ldw	x,#134
 661  0117 89            	pushw	x
 662  0118 ae0000        	ldw	x,#0
 663  011b 89            	pushw	x
 664  011c ae0000        	ldw	x,#L102
 665  011f cd0000        	call	_assert_failed
 667  0122 5b04          	addw	sp,#4
 668  0124               L24:
 669                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 671  0124 0d03          	tnz	(OFST+2,sp)
 672  0126 2706          	jreq	L64
 673  0128 7b03          	ld	a,(OFST+2,sp)
 674  012a a111          	cp	a,#17
 675  012c 2603          	jrne	L44
 676  012e               L64:
 677  012e 4f            	clr	a
 678  012f 2010          	jra	L05
 679  0131               L44:
 680  0131 ae0087        	ldw	x,#135
 681  0134 89            	pushw	x
 682  0135 ae0000        	ldw	x,#0
 683  0138 89            	pushw	x
 684  0139 ae0000        	ldw	x,#L102
 685  013c cd0000        	call	_assert_failed
 687  013f 5b04          	addw	sp,#4
 688  0141               L05:
 689                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 691  0141 0d08          	tnz	(OFST+7,sp)
 692  0143 2706          	jreq	L45
 693  0145 7b08          	ld	a,(OFST+7,sp)
 694  0147 a122          	cp	a,#34
 695  0149 2603          	jrne	L25
 696  014b               L45:
 697  014b 4f            	clr	a
 698  014c 2010          	jra	L65
 699  014e               L25:
 700  014e ae0088        	ldw	x,#136
 701  0151 89            	pushw	x
 702  0152 ae0000        	ldw	x,#0
 703  0155 89            	pushw	x
 704  0156 ae0000        	ldw	x,#L102
 705  0159 cd0000        	call	_assert_failed
 707  015c 5b04          	addw	sp,#4
 708  015e               L65:
 709                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 711  015e c65327        	ld	a,21287
 712  0161 a4cf          	and	a,#207
 713  0163 c75327        	ld	21287,a
 714                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 716  0166 7b08          	ld	a,(OFST+7,sp)
 717  0168 a420          	and	a,#32
 718  016a 6b01          	ld	(OFST+0,sp),a
 719  016c 7b03          	ld	a,(OFST+2,sp)
 720  016e a410          	and	a,#16
 721  0170 1a01          	or	a,(OFST+0,sp)
 722  0172 ca5327        	or	a,21287
 723  0175 c75327        	ld	21287,a
 724                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 726  0178 c65326        	ld	a,21286
 727  017b a48f          	and	a,#143
 728  017d 1a02          	or	a,(OFST+1,sp)
 729  017f c75326        	ld	21286,a
 730                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 732  0182 7b06          	ld	a,(OFST+5,sp)
 733  0184 c7532f        	ld	21295,a
 734                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 736  0187 7b07          	ld	a,(OFST+6,sp)
 737  0189 c75330        	ld	21296,a
 738                     ; 152 }
 741  018c 5b03          	addw	sp,#3
 742  018e 81            	ret
 925                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 925                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 925                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 925                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 925                     ; 167                  uint8_t TIM3_ICFilter)
 925                     ; 168 {
 926                     	switch	.text
 927  018f               _TIM3_ICInit:
 929  018f 89            	pushw	x
 930       00000000      OFST:	set	0
 933                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 935  0190 9e            	ld	a,xh
 936  0191 4d            	tnz	a
 937  0192 2705          	jreq	L46
 938  0194 9e            	ld	a,xh
 939  0195 a101          	cp	a,#1
 940  0197 2603          	jrne	L26
 941  0199               L46:
 942  0199 4f            	clr	a
 943  019a 2010          	jra	L66
 944  019c               L26:
 945  019c ae00aa        	ldw	x,#170
 946  019f 89            	pushw	x
 947  01a0 ae0000        	ldw	x,#0
 948  01a3 89            	pushw	x
 949  01a4 ae0000        	ldw	x,#L102
 950  01a7 cd0000        	call	_assert_failed
 952  01aa 5b04          	addw	sp,#4
 953  01ac               L66:
 954                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 956  01ac 0d02          	tnz	(OFST+2,sp)
 957  01ae 2706          	jreq	L27
 958  01b0 7b02          	ld	a,(OFST+2,sp)
 959  01b2 a144          	cp	a,#68
 960  01b4 2603          	jrne	L07
 961  01b6               L27:
 962  01b6 4f            	clr	a
 963  01b7 2010          	jra	L47
 964  01b9               L07:
 965  01b9 ae00ab        	ldw	x,#171
 966  01bc 89            	pushw	x
 967  01bd ae0000        	ldw	x,#0
 968  01c0 89            	pushw	x
 969  01c1 ae0000        	ldw	x,#L102
 970  01c4 cd0000        	call	_assert_failed
 972  01c7 5b04          	addw	sp,#4
 973  01c9               L47:
 974                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 976  01c9 7b05          	ld	a,(OFST+5,sp)
 977  01cb a101          	cp	a,#1
 978  01cd 270c          	jreq	L001
 979  01cf 7b05          	ld	a,(OFST+5,sp)
 980  01d1 a102          	cp	a,#2
 981  01d3 2706          	jreq	L001
 982  01d5 7b05          	ld	a,(OFST+5,sp)
 983  01d7 a103          	cp	a,#3
 984  01d9 2603          	jrne	L67
 985  01db               L001:
 986  01db 4f            	clr	a
 987  01dc 2010          	jra	L201
 988  01de               L67:
 989  01de ae00ac        	ldw	x,#172
 990  01e1 89            	pushw	x
 991  01e2 ae0000        	ldw	x,#0
 992  01e5 89            	pushw	x
 993  01e6 ae0000        	ldw	x,#L102
 994  01e9 cd0000        	call	_assert_failed
 996  01ec 5b04          	addw	sp,#4
 997  01ee               L201:
 998                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1000  01ee 0d06          	tnz	(OFST+6,sp)
1001  01f0 2712          	jreq	L601
1002  01f2 7b06          	ld	a,(OFST+6,sp)
1003  01f4 a104          	cp	a,#4
1004  01f6 270c          	jreq	L601
1005  01f8 7b06          	ld	a,(OFST+6,sp)
1006  01fa a108          	cp	a,#8
1007  01fc 2706          	jreq	L601
1008  01fe 7b06          	ld	a,(OFST+6,sp)
1009  0200 a10c          	cp	a,#12
1010  0202 2603          	jrne	L401
1011  0204               L601:
1012  0204 4f            	clr	a
1013  0205 2010          	jra	L011
1014  0207               L401:
1015  0207 ae00ad        	ldw	x,#173
1016  020a 89            	pushw	x
1017  020b ae0000        	ldw	x,#0
1018  020e 89            	pushw	x
1019  020f ae0000        	ldw	x,#L102
1020  0212 cd0000        	call	_assert_failed
1022  0215 5b04          	addw	sp,#4
1023  0217               L011:
1024                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
1026  0217 7b07          	ld	a,(OFST+7,sp)
1027  0219 a110          	cp	a,#16
1028  021b 2403          	jruge	L211
1029  021d 4f            	clr	a
1030  021e 2010          	jra	L411
1031  0220               L211:
1032  0220 ae00ae        	ldw	x,#174
1033  0223 89            	pushw	x
1034  0224 ae0000        	ldw	x,#0
1035  0227 89            	pushw	x
1036  0228 ae0000        	ldw	x,#L102
1037  022b cd0000        	call	_assert_failed
1039  022e 5b04          	addw	sp,#4
1040  0230               L411:
1041                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
1043  0230 7b01          	ld	a,(OFST+1,sp)
1044  0232 a101          	cp	a,#1
1045  0234 2714          	jreq	L533
1046                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
1046                     ; 180                    (uint8_t)TIM3_ICSelection,
1046                     ; 181                    (uint8_t)TIM3_ICFilter);
1048  0236 7b07          	ld	a,(OFST+7,sp)
1049  0238 88            	push	a
1050  0239 7b06          	ld	a,(OFST+6,sp)
1051  023b 97            	ld	xl,a
1052  023c 7b03          	ld	a,(OFST+3,sp)
1053  023e 95            	ld	xh,a
1054  023f cd08e9        	call	L3_TI1_Config
1056  0242 84            	pop	a
1057                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1059  0243 7b06          	ld	a,(OFST+6,sp)
1060  0245 cd073a        	call	_TIM3_SetIC1Prescaler
1063  0248 2012          	jra	L733
1064  024a               L533:
1065                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
1065                     ; 190                    (uint8_t)TIM3_ICSelection,
1065                     ; 191                    (uint8_t)TIM3_ICFilter);
1067  024a 7b07          	ld	a,(OFST+7,sp)
1068  024c 88            	push	a
1069  024d 7b06          	ld	a,(OFST+6,sp)
1070  024f 97            	ld	xl,a
1071  0250 7b03          	ld	a,(OFST+3,sp)
1072  0252 95            	ld	xh,a
1073  0253 cd0919        	call	L5_TI2_Config
1075  0256 84            	pop	a
1076                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1078  0257 7b06          	ld	a,(OFST+6,sp)
1079  0259 cd0769        	call	_TIM3_SetIC2Prescaler
1081  025c               L733:
1082                     ; 196 }
1085  025c 85            	popw	x
1086  025d 81            	ret
1177                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1177                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1177                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1177                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1177                     ; 210                      uint8_t TIM3_ICFilter)
1177                     ; 211 {
1178                     	switch	.text
1179  025e               _TIM3_PWMIConfig:
1181  025e 89            	pushw	x
1182  025f 89            	pushw	x
1183       00000002      OFST:	set	2
1186                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1188                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1190                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1192  0260 9e            	ld	a,xh
1193  0261 4d            	tnz	a
1194  0262 2705          	jreq	L221
1195  0264 9e            	ld	a,xh
1196  0265 a101          	cp	a,#1
1197  0267 2603          	jrne	L021
1198  0269               L221:
1199  0269 4f            	clr	a
1200  026a 2010          	jra	L421
1201  026c               L021:
1202  026c ae00d8        	ldw	x,#216
1203  026f 89            	pushw	x
1204  0270 ae0000        	ldw	x,#0
1205  0273 89            	pushw	x
1206  0274 ae0000        	ldw	x,#L102
1207  0277 cd0000        	call	_assert_failed
1209  027a 5b04          	addw	sp,#4
1210  027c               L421:
1211                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1213  027c 0d04          	tnz	(OFST+2,sp)
1214  027e 2706          	jreq	L031
1215  0280 7b04          	ld	a,(OFST+2,sp)
1216  0282 a144          	cp	a,#68
1217  0284 2603          	jrne	L621
1218  0286               L031:
1219  0286 4f            	clr	a
1220  0287 2010          	jra	L231
1221  0289               L621:
1222  0289 ae00d9        	ldw	x,#217
1223  028c 89            	pushw	x
1224  028d ae0000        	ldw	x,#0
1225  0290 89            	pushw	x
1226  0291 ae0000        	ldw	x,#L102
1227  0294 cd0000        	call	_assert_failed
1229  0297 5b04          	addw	sp,#4
1230  0299               L231:
1231                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1233  0299 7b07          	ld	a,(OFST+5,sp)
1234  029b a101          	cp	a,#1
1235  029d 270c          	jreq	L631
1236  029f 7b07          	ld	a,(OFST+5,sp)
1237  02a1 a102          	cp	a,#2
1238  02a3 2706          	jreq	L631
1239  02a5 7b07          	ld	a,(OFST+5,sp)
1240  02a7 a103          	cp	a,#3
1241  02a9 2603          	jrne	L431
1242  02ab               L631:
1243  02ab 4f            	clr	a
1244  02ac 2010          	jra	L041
1245  02ae               L431:
1246  02ae ae00da        	ldw	x,#218
1247  02b1 89            	pushw	x
1248  02b2 ae0000        	ldw	x,#0
1249  02b5 89            	pushw	x
1250  02b6 ae0000        	ldw	x,#L102
1251  02b9 cd0000        	call	_assert_failed
1253  02bc 5b04          	addw	sp,#4
1254  02be               L041:
1255                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1257  02be 0d08          	tnz	(OFST+6,sp)
1258  02c0 2712          	jreq	L441
1259  02c2 7b08          	ld	a,(OFST+6,sp)
1260  02c4 a104          	cp	a,#4
1261  02c6 270c          	jreq	L441
1262  02c8 7b08          	ld	a,(OFST+6,sp)
1263  02ca a108          	cp	a,#8
1264  02cc 2706          	jreq	L441
1265  02ce 7b08          	ld	a,(OFST+6,sp)
1266  02d0 a10c          	cp	a,#12
1267  02d2 2603          	jrne	L241
1268  02d4               L441:
1269  02d4 4f            	clr	a
1270  02d5 2010          	jra	L641
1271  02d7               L241:
1272  02d7 ae00db        	ldw	x,#219
1273  02da 89            	pushw	x
1274  02db ae0000        	ldw	x,#0
1275  02de 89            	pushw	x
1276  02df ae0000        	ldw	x,#L102
1277  02e2 cd0000        	call	_assert_failed
1279  02e5 5b04          	addw	sp,#4
1280  02e7               L641:
1281                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1283  02e7 7b04          	ld	a,(OFST+2,sp)
1284  02e9 a144          	cp	a,#68
1285  02eb 2706          	jreq	L104
1286                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1288  02ed a644          	ld	a,#68
1289  02ef 6b01          	ld	(OFST-1,sp),a
1291  02f1 2002          	jra	L304
1292  02f3               L104:
1293                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1295  02f3 0f01          	clr	(OFST-1,sp)
1296  02f5               L304:
1297                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1299  02f5 7b07          	ld	a,(OFST+5,sp)
1300  02f7 a101          	cp	a,#1
1301  02f9 2606          	jrne	L504
1302                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1304  02fb a602          	ld	a,#2
1305  02fd 6b02          	ld	(OFST+0,sp),a
1307  02ff 2004          	jra	L704
1308  0301               L504:
1309                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1311  0301 a601          	ld	a,#1
1312  0303 6b02          	ld	(OFST+0,sp),a
1313  0305               L704:
1314                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1316  0305 7b03          	ld	a,(OFST+1,sp)
1317  0307 a101          	cp	a,#1
1318  0309 2726          	jreq	L114
1319                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1319                     ; 245                    (uint8_t)TIM3_ICFilter);
1321  030b 7b09          	ld	a,(OFST+7,sp)
1322  030d 88            	push	a
1323  030e 7b08          	ld	a,(OFST+6,sp)
1324  0310 97            	ld	xl,a
1325  0311 7b05          	ld	a,(OFST+3,sp)
1326  0313 95            	ld	xh,a
1327  0314 cd08e9        	call	L3_TI1_Config
1329  0317 84            	pop	a
1330                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1332  0318 7b08          	ld	a,(OFST+6,sp)
1333  031a cd073a        	call	_TIM3_SetIC1Prescaler
1335                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1337  031d 7b09          	ld	a,(OFST+7,sp)
1338  031f 88            	push	a
1339  0320 7b03          	ld	a,(OFST+1,sp)
1340  0322 97            	ld	xl,a
1341  0323 7b02          	ld	a,(OFST+0,sp)
1342  0325 95            	ld	xh,a
1343  0326 cd0919        	call	L5_TI2_Config
1345  0329 84            	pop	a
1346                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1348  032a 7b08          	ld	a,(OFST+6,sp)
1349  032c cd0769        	call	_TIM3_SetIC2Prescaler
1352  032f 2024          	jra	L314
1353  0331               L114:
1354                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1354                     ; 260                    (uint8_t)TIM3_ICFilter);
1356  0331 7b09          	ld	a,(OFST+7,sp)
1357  0333 88            	push	a
1358  0334 7b08          	ld	a,(OFST+6,sp)
1359  0336 97            	ld	xl,a
1360  0337 7b05          	ld	a,(OFST+3,sp)
1361  0339 95            	ld	xh,a
1362  033a cd0919        	call	L5_TI2_Config
1364  033d 84            	pop	a
1365                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1367  033e 7b08          	ld	a,(OFST+6,sp)
1368  0340 cd0769        	call	_TIM3_SetIC2Prescaler
1370                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1372  0343 7b09          	ld	a,(OFST+7,sp)
1373  0345 88            	push	a
1374  0346 7b03          	ld	a,(OFST+1,sp)
1375  0348 97            	ld	xl,a
1376  0349 7b02          	ld	a,(OFST+0,sp)
1377  034b 95            	ld	xh,a
1378  034c cd08e9        	call	L3_TI1_Config
1380  034f 84            	pop	a
1381                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1383  0350 7b08          	ld	a,(OFST+6,sp)
1384  0352 cd073a        	call	_TIM3_SetIC1Prescaler
1386  0355               L314:
1387                     ; 271 }
1390  0355 5b04          	addw	sp,#4
1391  0357 81            	ret
1447                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1447                     ; 281 {
1448                     	switch	.text
1449  0358               _TIM3_Cmd:
1451  0358 88            	push	a
1452       00000000      OFST:	set	0
1455                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1457  0359 4d            	tnz	a
1458  035a 2704          	jreq	L451
1459  035c a101          	cp	a,#1
1460  035e 2603          	jrne	L251
1461  0360               L451:
1462  0360 4f            	clr	a
1463  0361 2010          	jra	L651
1464  0363               L251:
1465  0363 ae011b        	ldw	x,#283
1466  0366 89            	pushw	x
1467  0367 ae0000        	ldw	x,#0
1468  036a 89            	pushw	x
1469  036b ae0000        	ldw	x,#L102
1470  036e cd0000        	call	_assert_failed
1472  0371 5b04          	addw	sp,#4
1473  0373               L651:
1474                     ; 286     if (NewState != DISABLE)
1476  0373 0d01          	tnz	(OFST+1,sp)
1477  0375 2706          	jreq	L344
1478                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1480  0377 72105320      	bset	21280,#0
1482  037b 2004          	jra	L544
1483  037d               L344:
1484                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1486  037d 72115320      	bres	21280,#0
1487  0381               L544:
1488                     ; 294 }
1491  0381 84            	pop	a
1492  0382 81            	ret
1565                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1565                     ; 310 {
1566                     	switch	.text
1567  0383               _TIM3_ITConfig:
1569  0383 89            	pushw	x
1570       00000000      OFST:	set	0
1573                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1575  0384 9e            	ld	a,xh
1576  0385 4d            	tnz	a
1577  0386 2708          	jreq	L261
1578  0388 9e            	ld	a,xh
1579  0389 a108          	cp	a,#8
1580  038b 2403          	jruge	L261
1581  038d 4f            	clr	a
1582  038e 2010          	jra	L461
1583  0390               L261:
1584  0390 ae0138        	ldw	x,#312
1585  0393 89            	pushw	x
1586  0394 ae0000        	ldw	x,#0
1587  0397 89            	pushw	x
1588  0398 ae0000        	ldw	x,#L102
1589  039b cd0000        	call	_assert_failed
1591  039e 5b04          	addw	sp,#4
1592  03a0               L461:
1593                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1595  03a0 0d02          	tnz	(OFST+2,sp)
1596  03a2 2706          	jreq	L071
1597  03a4 7b02          	ld	a,(OFST+2,sp)
1598  03a6 a101          	cp	a,#1
1599  03a8 2603          	jrne	L661
1600  03aa               L071:
1601  03aa 4f            	clr	a
1602  03ab 2010          	jra	L271
1603  03ad               L661:
1604  03ad ae0139        	ldw	x,#313
1605  03b0 89            	pushw	x
1606  03b1 ae0000        	ldw	x,#0
1607  03b4 89            	pushw	x
1608  03b5 ae0000        	ldw	x,#L102
1609  03b8 cd0000        	call	_assert_failed
1611  03bb 5b04          	addw	sp,#4
1612  03bd               L271:
1613                     ; 315     if (NewState != DISABLE)
1615  03bd 0d02          	tnz	(OFST+2,sp)
1616  03bf 270a          	jreq	L305
1617                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1619  03c1 c65321        	ld	a,21281
1620  03c4 1a01          	or	a,(OFST+1,sp)
1621  03c6 c75321        	ld	21281,a
1623  03c9 2009          	jra	L505
1624  03cb               L305:
1625                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1627  03cb 7b01          	ld	a,(OFST+1,sp)
1628  03cd 43            	cpl	a
1629  03ce c45321        	and	a,21281
1630  03d1 c75321        	ld	21281,a
1631  03d4               L505:
1632                     ; 325 }
1635  03d4 85            	popw	x
1636  03d5 81            	ret
1673                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1673                     ; 335 {
1674                     	switch	.text
1675  03d6               _TIM3_UpdateDisableConfig:
1677  03d6 88            	push	a
1678       00000000      OFST:	set	0
1681                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1683  03d7 4d            	tnz	a
1684  03d8 2704          	jreq	L002
1685  03da a101          	cp	a,#1
1686  03dc 2603          	jrne	L671
1687  03de               L002:
1688  03de 4f            	clr	a
1689  03df 2010          	jra	L202
1690  03e1               L671:
1691  03e1 ae0151        	ldw	x,#337
1692  03e4 89            	pushw	x
1693  03e5 ae0000        	ldw	x,#0
1694  03e8 89            	pushw	x
1695  03e9 ae0000        	ldw	x,#L102
1696  03ec cd0000        	call	_assert_failed
1698  03ef 5b04          	addw	sp,#4
1699  03f1               L202:
1700                     ; 340     if (NewState != DISABLE)
1702  03f1 0d01          	tnz	(OFST+1,sp)
1703  03f3 2706          	jreq	L525
1704                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1706  03f5 72125320      	bset	21280,#1
1708  03f9 2004          	jra	L725
1709  03fb               L525:
1710                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1712  03fb 72135320      	bres	21280,#1
1713  03ff               L725:
1714                     ; 348 }
1717  03ff 84            	pop	a
1718  0400 81            	ret
1777                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1777                     ; 359 {
1778                     	switch	.text
1779  0401               _TIM3_UpdateRequestConfig:
1781  0401 88            	push	a
1782       00000000      OFST:	set	0
1785                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1787  0402 4d            	tnz	a
1788  0403 2704          	jreq	L012
1789  0405 a101          	cp	a,#1
1790  0407 2603          	jrne	L602
1791  0409               L012:
1792  0409 4f            	clr	a
1793  040a 2010          	jra	L212
1794  040c               L602:
1795  040c ae0169        	ldw	x,#361
1796  040f 89            	pushw	x
1797  0410 ae0000        	ldw	x,#0
1798  0413 89            	pushw	x
1799  0414 ae0000        	ldw	x,#L102
1800  0417 cd0000        	call	_assert_failed
1802  041a 5b04          	addw	sp,#4
1803  041c               L212:
1804                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1806  041c 0d01          	tnz	(OFST+1,sp)
1807  041e 2706          	jreq	L755
1808                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1810  0420 72145320      	bset	21280,#2
1812  0424 2004          	jra	L165
1813  0426               L755:
1814                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1816  0426 72155320      	bres	21280,#2
1817  042a               L165:
1818                     ; 372 }
1821  042a 84            	pop	a
1822  042b 81            	ret
1880                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1880                     ; 384 {
1881                     	switch	.text
1882  042c               _TIM3_SelectOnePulseMode:
1884  042c 88            	push	a
1885       00000000      OFST:	set	0
1888                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1890  042d a101          	cp	a,#1
1891  042f 2703          	jreq	L022
1892  0431 4d            	tnz	a
1893  0432 2603          	jrne	L612
1894  0434               L022:
1895  0434 4f            	clr	a
1896  0435 2010          	jra	L222
1897  0437               L612:
1898  0437 ae0182        	ldw	x,#386
1899  043a 89            	pushw	x
1900  043b ae0000        	ldw	x,#0
1901  043e 89            	pushw	x
1902  043f ae0000        	ldw	x,#L102
1903  0442 cd0000        	call	_assert_failed
1905  0445 5b04          	addw	sp,#4
1906  0447               L222:
1907                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1909  0447 0d01          	tnz	(OFST+1,sp)
1910  0449 2706          	jreq	L116
1911                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1913  044b 72165320      	bset	21280,#3
1915  044f 2004          	jra	L316
1916  0451               L116:
1917                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1919  0451 72175320      	bres	21280,#3
1920  0455               L316:
1921                     ; 398 }
1924  0455 84            	pop	a
1925  0456 81            	ret
1994                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
1994                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
1994                     ; 431 {
1995                     	switch	.text
1996  0457               _TIM3_PrescalerConfig:
1998  0457 89            	pushw	x
1999       00000000      OFST:	set	0
2002                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
2004  0458 9f            	ld	a,xl
2005  0459 4d            	tnz	a
2006  045a 2705          	jreq	L032
2007  045c 9f            	ld	a,xl
2008  045d a101          	cp	a,#1
2009  045f 2603          	jrne	L622
2010  0461               L032:
2011  0461 4f            	clr	a
2012  0462 2010          	jra	L232
2013  0464               L622:
2014  0464 ae01b1        	ldw	x,#433
2015  0467 89            	pushw	x
2016  0468 ae0000        	ldw	x,#0
2017  046b 89            	pushw	x
2018  046c ae0000        	ldw	x,#L102
2019  046f cd0000        	call	_assert_failed
2021  0472 5b04          	addw	sp,#4
2022  0474               L232:
2023                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
2025  0474 0d01          	tnz	(OFST+1,sp)
2026  0476 275a          	jreq	L632
2027  0478 7b01          	ld	a,(OFST+1,sp)
2028  047a a101          	cp	a,#1
2029  047c 2754          	jreq	L632
2030  047e 7b01          	ld	a,(OFST+1,sp)
2031  0480 a102          	cp	a,#2
2032  0482 274e          	jreq	L632
2033  0484 7b01          	ld	a,(OFST+1,sp)
2034  0486 a103          	cp	a,#3
2035  0488 2748          	jreq	L632
2036  048a 7b01          	ld	a,(OFST+1,sp)
2037  048c a104          	cp	a,#4
2038  048e 2742          	jreq	L632
2039  0490 7b01          	ld	a,(OFST+1,sp)
2040  0492 a105          	cp	a,#5
2041  0494 273c          	jreq	L632
2042  0496 7b01          	ld	a,(OFST+1,sp)
2043  0498 a106          	cp	a,#6
2044  049a 2736          	jreq	L632
2045  049c 7b01          	ld	a,(OFST+1,sp)
2046  049e a107          	cp	a,#7
2047  04a0 2730          	jreq	L632
2048  04a2 7b01          	ld	a,(OFST+1,sp)
2049  04a4 a108          	cp	a,#8
2050  04a6 272a          	jreq	L632
2051  04a8 7b01          	ld	a,(OFST+1,sp)
2052  04aa a109          	cp	a,#9
2053  04ac 2724          	jreq	L632
2054  04ae 7b01          	ld	a,(OFST+1,sp)
2055  04b0 a10a          	cp	a,#10
2056  04b2 271e          	jreq	L632
2057  04b4 7b01          	ld	a,(OFST+1,sp)
2058  04b6 a10b          	cp	a,#11
2059  04b8 2718          	jreq	L632
2060  04ba 7b01          	ld	a,(OFST+1,sp)
2061  04bc a10c          	cp	a,#12
2062  04be 2712          	jreq	L632
2063  04c0 7b01          	ld	a,(OFST+1,sp)
2064  04c2 a10d          	cp	a,#13
2065  04c4 270c          	jreq	L632
2066  04c6 7b01          	ld	a,(OFST+1,sp)
2067  04c8 a10e          	cp	a,#14
2068  04ca 2706          	jreq	L632
2069  04cc 7b01          	ld	a,(OFST+1,sp)
2070  04ce a10f          	cp	a,#15
2071  04d0 2603          	jrne	L432
2072  04d2               L632:
2073  04d2 4f            	clr	a
2074  04d3 2010          	jra	L042
2075  04d5               L432:
2076  04d5 ae01b2        	ldw	x,#434
2077  04d8 89            	pushw	x
2078  04d9 ae0000        	ldw	x,#0
2079  04dc 89            	pushw	x
2080  04dd ae0000        	ldw	x,#L102
2081  04e0 cd0000        	call	_assert_failed
2083  04e3 5b04          	addw	sp,#4
2084  04e5               L042:
2085                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
2087  04e5 7b01          	ld	a,(OFST+1,sp)
2088  04e7 c7532a        	ld	21290,a
2089                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
2091  04ea 7b02          	ld	a,(OFST+2,sp)
2092  04ec c75324        	ld	21284,a
2093                     ; 441 }
2096  04ef 85            	popw	x
2097  04f0 81            	ret
2156                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2156                     ; 453 {
2157                     	switch	.text
2158  04f1               _TIM3_ForcedOC1Config:
2160  04f1 88            	push	a
2161       00000000      OFST:	set	0
2164                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2166  04f2 a150          	cp	a,#80
2167  04f4 2704          	jreq	L642
2168  04f6 a140          	cp	a,#64
2169  04f8 2603          	jrne	L442
2170  04fa               L642:
2171  04fa 4f            	clr	a
2172  04fb 2010          	jra	L052
2173  04fd               L442:
2174  04fd ae01c7        	ldw	x,#455
2175  0500 89            	pushw	x
2176  0501 ae0000        	ldw	x,#0
2177  0504 89            	pushw	x
2178  0505 ae0000        	ldw	x,#L102
2179  0508 cd0000        	call	_assert_failed
2181  050b 5b04          	addw	sp,#4
2182  050d               L052:
2183                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2185  050d c65325        	ld	a,21285
2186  0510 a48f          	and	a,#143
2187  0512 1a01          	or	a,(OFST+1,sp)
2188  0514 c75325        	ld	21285,a
2189                     ; 459 }
2192  0517 84            	pop	a
2193  0518 81            	ret
2230                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2230                     ; 471 {
2231                     	switch	.text
2232  0519               _TIM3_ForcedOC2Config:
2234  0519 88            	push	a
2235       00000000      OFST:	set	0
2238                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2240  051a a150          	cp	a,#80
2241  051c 2704          	jreq	L652
2242  051e a140          	cp	a,#64
2243  0520 2603          	jrne	L452
2244  0522               L652:
2245  0522 4f            	clr	a
2246  0523 2010          	jra	L062
2247  0525               L452:
2248  0525 ae01d9        	ldw	x,#473
2249  0528 89            	pushw	x
2250  0529 ae0000        	ldw	x,#0
2251  052c 89            	pushw	x
2252  052d ae0000        	ldw	x,#L102
2253  0530 cd0000        	call	_assert_failed
2255  0533 5b04          	addw	sp,#4
2256  0535               L062:
2257                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2259  0535 c65326        	ld	a,21286
2260  0538 a48f          	and	a,#143
2261  053a 1a01          	or	a,(OFST+1,sp)
2262  053c c75326        	ld	21286,a
2263                     ; 477 }
2266  053f 84            	pop	a
2267  0540 81            	ret
2304                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2304                     ; 487 {
2305                     	switch	.text
2306  0541               _TIM3_ARRPreloadConfig:
2308  0541 88            	push	a
2309       00000000      OFST:	set	0
2312                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2314  0542 4d            	tnz	a
2315  0543 2704          	jreq	L662
2316  0545 a101          	cp	a,#1
2317  0547 2603          	jrne	L462
2318  0549               L662:
2319  0549 4f            	clr	a
2320  054a 2010          	jra	L072
2321  054c               L462:
2322  054c ae01e9        	ldw	x,#489
2323  054f 89            	pushw	x
2324  0550 ae0000        	ldw	x,#0
2325  0553 89            	pushw	x
2326  0554 ae0000        	ldw	x,#L102
2327  0557 cd0000        	call	_assert_failed
2329  055a 5b04          	addw	sp,#4
2330  055c               L072:
2331                     ; 492     if (NewState != DISABLE)
2333  055c 0d01          	tnz	(OFST+1,sp)
2334  055e 2706          	jreq	L137
2335                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
2337  0560 721e5320      	bset	21280,#7
2339  0564 2004          	jra	L337
2340  0566               L137:
2341                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2343  0566 721f5320      	bres	21280,#7
2344  056a               L337:
2345                     ; 500 }
2348  056a 84            	pop	a
2349  056b 81            	ret
2386                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2386                     ; 510 {
2387                     	switch	.text
2388  056c               _TIM3_OC1PreloadConfig:
2390  056c 88            	push	a
2391       00000000      OFST:	set	0
2394                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2396  056d 4d            	tnz	a
2397  056e 2704          	jreq	L672
2398  0570 a101          	cp	a,#1
2399  0572 2603          	jrne	L472
2400  0574               L672:
2401  0574 4f            	clr	a
2402  0575 2010          	jra	L003
2403  0577               L472:
2404  0577 ae0200        	ldw	x,#512
2405  057a 89            	pushw	x
2406  057b ae0000        	ldw	x,#0
2407  057e 89            	pushw	x
2408  057f ae0000        	ldw	x,#L102
2409  0582 cd0000        	call	_assert_failed
2411  0585 5b04          	addw	sp,#4
2412  0587               L003:
2413                     ; 515     if (NewState != DISABLE)
2415  0587 0d01          	tnz	(OFST+1,sp)
2416  0589 2706          	jreq	L357
2417                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2419  058b 72165325      	bset	21285,#3
2421  058f 2004          	jra	L557
2422  0591               L357:
2423                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2425  0591 72175325      	bres	21285,#3
2426  0595               L557:
2427                     ; 523 }
2430  0595 84            	pop	a
2431  0596 81            	ret
2468                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2468                     ; 533 {
2469                     	switch	.text
2470  0597               _TIM3_OC2PreloadConfig:
2472  0597 88            	push	a
2473       00000000      OFST:	set	0
2476                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2478  0598 4d            	tnz	a
2479  0599 2704          	jreq	L603
2480  059b a101          	cp	a,#1
2481  059d 2603          	jrne	L403
2482  059f               L603:
2483  059f 4f            	clr	a
2484  05a0 2010          	jra	L013
2485  05a2               L403:
2486  05a2 ae0217        	ldw	x,#535
2487  05a5 89            	pushw	x
2488  05a6 ae0000        	ldw	x,#0
2489  05a9 89            	pushw	x
2490  05aa ae0000        	ldw	x,#L102
2491  05ad cd0000        	call	_assert_failed
2493  05b0 5b04          	addw	sp,#4
2494  05b2               L013:
2495                     ; 538     if (NewState != DISABLE)
2497  05b2 0d01          	tnz	(OFST+1,sp)
2498  05b4 2706          	jreq	L577
2499                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2501  05b6 72165326      	bset	21286,#3
2503  05ba 2004          	jra	L777
2504  05bc               L577:
2505                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2507  05bc 72175326      	bres	21286,#3
2508  05c0               L777:
2509                     ; 546 }
2512  05c0 84            	pop	a
2513  05c1 81            	ret
2579                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2579                     ; 558 {
2580                     	switch	.text
2581  05c2               _TIM3_GenerateEvent:
2583  05c2 88            	push	a
2584       00000000      OFST:	set	0
2587                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2589  05c3 4d            	tnz	a
2590  05c4 2703          	jreq	L413
2591  05c6 4f            	clr	a
2592  05c7 2010          	jra	L613
2593  05c9               L413:
2594  05c9 ae0230        	ldw	x,#560
2595  05cc 89            	pushw	x
2596  05cd ae0000        	ldw	x,#0
2597  05d0 89            	pushw	x
2598  05d1 ae0000        	ldw	x,#L102
2599  05d4 cd0000        	call	_assert_failed
2601  05d7 5b04          	addw	sp,#4
2602  05d9               L613:
2603                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
2605  05d9 7b01          	ld	a,(OFST+1,sp)
2606  05db c75324        	ld	21284,a
2607                     ; 564 }
2610  05de 84            	pop	a
2611  05df 81            	ret
2648                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2648                     ; 576 {
2649                     	switch	.text
2650  05e0               _TIM3_OC1PolarityConfig:
2652  05e0 88            	push	a
2653       00000000      OFST:	set	0
2656                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2658  05e1 4d            	tnz	a
2659  05e2 2704          	jreq	L423
2660  05e4 a122          	cp	a,#34
2661  05e6 2603          	jrne	L223
2662  05e8               L423:
2663  05e8 4f            	clr	a
2664  05e9 2010          	jra	L623
2665  05eb               L223:
2666  05eb ae0242        	ldw	x,#578
2667  05ee 89            	pushw	x
2668  05ef ae0000        	ldw	x,#0
2669  05f2 89            	pushw	x
2670  05f3 ae0000        	ldw	x,#L102
2671  05f6 cd0000        	call	_assert_failed
2673  05f9 5b04          	addw	sp,#4
2674  05fb               L623:
2675                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2677  05fb 0d01          	tnz	(OFST+1,sp)
2678  05fd 2706          	jreq	L7401
2679                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2681  05ff 72125327      	bset	21287,#1
2683  0603 2004          	jra	L1501
2684  0605               L7401:
2685                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2687  0605 72135327      	bres	21287,#1
2688  0609               L1501:
2689                     ; 589 }
2692  0609 84            	pop	a
2693  060a 81            	ret
2730                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2730                     ; 601 {
2731                     	switch	.text
2732  060b               _TIM3_OC2PolarityConfig:
2734  060b 88            	push	a
2735       00000000      OFST:	set	0
2738                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2740  060c 4d            	tnz	a
2741  060d 2704          	jreq	L433
2742  060f a122          	cp	a,#34
2743  0611 2603          	jrne	L233
2744  0613               L433:
2745  0613 4f            	clr	a
2746  0614 2010          	jra	L633
2747  0616               L233:
2748  0616 ae025b        	ldw	x,#603
2749  0619 89            	pushw	x
2750  061a ae0000        	ldw	x,#0
2751  061d 89            	pushw	x
2752  061e ae0000        	ldw	x,#L102
2753  0621 cd0000        	call	_assert_failed
2755  0624 5b04          	addw	sp,#4
2756  0626               L633:
2757                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2759  0626 0d01          	tnz	(OFST+1,sp)
2760  0628 2706          	jreq	L1701
2761                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2763  062a 721a5327      	bset	21287,#5
2765  062e 2004          	jra	L3701
2766  0630               L1701:
2767                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2769  0630 721b5327      	bres	21287,#5
2770  0634               L3701:
2771                     ; 614 }
2774  0634 84            	pop	a
2775  0635 81            	ret
2821                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2821                     ; 628 {
2822                     	switch	.text
2823  0636               _TIM3_CCxCmd:
2825  0636 89            	pushw	x
2826       00000000      OFST:	set	0
2829                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2831  0637 9e            	ld	a,xh
2832  0638 4d            	tnz	a
2833  0639 2705          	jreq	L443
2834  063b 9e            	ld	a,xh
2835  063c a101          	cp	a,#1
2836  063e 2603          	jrne	L243
2837  0640               L443:
2838  0640 4f            	clr	a
2839  0641 2010          	jra	L643
2840  0643               L243:
2841  0643 ae0276        	ldw	x,#630
2842  0646 89            	pushw	x
2843  0647 ae0000        	ldw	x,#0
2844  064a 89            	pushw	x
2845  064b ae0000        	ldw	x,#L102
2846  064e cd0000        	call	_assert_failed
2848  0651 5b04          	addw	sp,#4
2849  0653               L643:
2850                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2852  0653 0d02          	tnz	(OFST+2,sp)
2853  0655 2706          	jreq	L253
2854  0657 7b02          	ld	a,(OFST+2,sp)
2855  0659 a101          	cp	a,#1
2856  065b 2603          	jrne	L053
2857  065d               L253:
2858  065d 4f            	clr	a
2859  065e 2010          	jra	L453
2860  0660               L053:
2861  0660 ae0277        	ldw	x,#631
2862  0663 89            	pushw	x
2863  0664 ae0000        	ldw	x,#0
2864  0667 89            	pushw	x
2865  0668 ae0000        	ldw	x,#L102
2866  066b cd0000        	call	_assert_failed
2868  066e 5b04          	addw	sp,#4
2869  0670               L453:
2870                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2872  0670 0d01          	tnz	(OFST+1,sp)
2873  0672 2610          	jrne	L7111
2874                     ; 636         if (NewState != DISABLE)
2876  0674 0d02          	tnz	(OFST+2,sp)
2877  0676 2706          	jreq	L1211
2878                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2880  0678 72105327      	bset	21287,#0
2882  067c 2014          	jra	L5211
2883  067e               L1211:
2884                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2886  067e 72115327      	bres	21287,#0
2887  0682 200e          	jra	L5211
2888  0684               L7111:
2889                     ; 649         if (NewState != DISABLE)
2891  0684 0d02          	tnz	(OFST+2,sp)
2892  0686 2706          	jreq	L7211
2893                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2895  0688 72185327      	bset	21287,#4
2897  068c 2004          	jra	L5211
2898  068e               L7211:
2899                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2901  068e 72195327      	bres	21287,#4
2902  0692               L5211:
2903                     ; 659 }
2906  0692 85            	popw	x
2907  0693 81            	ret
2953                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2953                     ; 681 {
2954                     	switch	.text
2955  0694               _TIM3_SelectOCxM:
2957  0694 89            	pushw	x
2958       00000000      OFST:	set	0
2961                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2963  0695 9e            	ld	a,xh
2964  0696 4d            	tnz	a
2965  0697 2705          	jreq	L263
2966  0699 9e            	ld	a,xh
2967  069a a101          	cp	a,#1
2968  069c 2603          	jrne	L063
2969  069e               L263:
2970  069e 4f            	clr	a
2971  069f 2010          	jra	L463
2972  06a1               L063:
2973  06a1 ae02ab        	ldw	x,#683
2974  06a4 89            	pushw	x
2975  06a5 ae0000        	ldw	x,#0
2976  06a8 89            	pushw	x
2977  06a9 ae0000        	ldw	x,#L102
2978  06ac cd0000        	call	_assert_failed
2980  06af 5b04          	addw	sp,#4
2981  06b1               L463:
2982                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2984  06b1 0d02          	tnz	(OFST+2,sp)
2985  06b3 272a          	jreq	L073
2986  06b5 7b02          	ld	a,(OFST+2,sp)
2987  06b7 a110          	cp	a,#16
2988  06b9 2724          	jreq	L073
2989  06bb 7b02          	ld	a,(OFST+2,sp)
2990  06bd a120          	cp	a,#32
2991  06bf 271e          	jreq	L073
2992  06c1 7b02          	ld	a,(OFST+2,sp)
2993  06c3 a130          	cp	a,#48
2994  06c5 2718          	jreq	L073
2995  06c7 7b02          	ld	a,(OFST+2,sp)
2996  06c9 a160          	cp	a,#96
2997  06cb 2712          	jreq	L073
2998  06cd 7b02          	ld	a,(OFST+2,sp)
2999  06cf a170          	cp	a,#112
3000  06d1 270c          	jreq	L073
3001  06d3 7b02          	ld	a,(OFST+2,sp)
3002  06d5 a150          	cp	a,#80
3003  06d7 2706          	jreq	L073
3004  06d9 7b02          	ld	a,(OFST+2,sp)
3005  06db a140          	cp	a,#64
3006  06dd 2603          	jrne	L663
3007  06df               L073:
3008  06df 4f            	clr	a
3009  06e0 2010          	jra	L273
3010  06e2               L663:
3011  06e2 ae02ac        	ldw	x,#684
3012  06e5 89            	pushw	x
3013  06e6 ae0000        	ldw	x,#0
3014  06e9 89            	pushw	x
3015  06ea ae0000        	ldw	x,#L102
3016  06ed cd0000        	call	_assert_failed
3018  06f0 5b04          	addw	sp,#4
3019  06f2               L273:
3020                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
3022  06f2 0d01          	tnz	(OFST+1,sp)
3023  06f4 2610          	jrne	L5511
3024                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3026  06f6 72115327      	bres	21287,#0
3027                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3029  06fa c65325        	ld	a,21285
3030  06fd a48f          	and	a,#143
3031  06ff 1a02          	or	a,(OFST+2,sp)
3032  0701 c75325        	ld	21285,a
3034  0704 200e          	jra	L7511
3035  0706               L5511:
3036                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
3038  0706 72195327      	bres	21287,#4
3039                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3041  070a c65326        	ld	a,21286
3042  070d a48f          	and	a,#143
3043  070f 1a02          	or	a,(OFST+2,sp)
3044  0711 c75326        	ld	21286,a
3045  0714               L7511:
3046                     ; 702 }
3049  0714 85            	popw	x
3050  0715 81            	ret
3082                     ; 711 void TIM3_SetCounter(uint16_t Counter)
3082                     ; 712 {
3083                     	switch	.text
3084  0716               _TIM3_SetCounter:
3088                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
3090  0716 9e            	ld	a,xh
3091  0717 c75328        	ld	21288,a
3092                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
3094  071a 9f            	ld	a,xl
3095  071b c75329        	ld	21289,a
3096                     ; 717 }
3099  071e 81            	ret
3131                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
3131                     ; 727 {
3132                     	switch	.text
3133  071f               _TIM3_SetAutoreload:
3137                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
3139  071f 9e            	ld	a,xh
3140  0720 c7532b        	ld	21291,a
3141                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
3143  0723 9f            	ld	a,xl
3144  0724 c7532c        	ld	21292,a
3145                     ; 731 }
3148  0727 81            	ret
3180                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
3180                     ; 741 {
3181                     	switch	.text
3182  0728               _TIM3_SetCompare1:
3186                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
3188  0728 9e            	ld	a,xh
3189  0729 c7532d        	ld	21293,a
3190                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
3192  072c 9f            	ld	a,xl
3193  072d c7532e        	ld	21294,a
3194                     ; 745 }
3197  0730 81            	ret
3229                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
3229                     ; 755 {
3230                     	switch	.text
3231  0731               _TIM3_SetCompare2:
3235                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3237  0731 9e            	ld	a,xh
3238  0732 c7532f        	ld	21295,a
3239                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
3241  0735 9f            	ld	a,xl
3242  0736 c75330        	ld	21296,a
3243                     ; 759 }
3246  0739 81            	ret
3283                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3283                     ; 773 {
3284                     	switch	.text
3285  073a               _TIM3_SetIC1Prescaler:
3287  073a 88            	push	a
3288       00000000      OFST:	set	0
3291                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3293  073b 4d            	tnz	a
3294  073c 270c          	jreq	L014
3295  073e a104          	cp	a,#4
3296  0740 2708          	jreq	L014
3297  0742 a108          	cp	a,#8
3298  0744 2704          	jreq	L014
3299  0746 a10c          	cp	a,#12
3300  0748 2603          	jrne	L604
3301  074a               L014:
3302  074a 4f            	clr	a
3303  074b 2010          	jra	L214
3304  074d               L604:
3305  074d ae0307        	ldw	x,#775
3306  0750 89            	pushw	x
3307  0751 ae0000        	ldw	x,#0
3308  0754 89            	pushw	x
3309  0755 ae0000        	ldw	x,#L102
3310  0758 cd0000        	call	_assert_failed
3312  075b 5b04          	addw	sp,#4
3313  075d               L214:
3314                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3316  075d c65325        	ld	a,21285
3317  0760 a4f3          	and	a,#243
3318  0762 1a01          	or	a,(OFST+1,sp)
3319  0764 c75325        	ld	21285,a
3320                     ; 779 }
3323  0767 84            	pop	a
3324  0768 81            	ret
3361                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3361                     ; 792 {
3362                     	switch	.text
3363  0769               _TIM3_SetIC2Prescaler:
3365  0769 88            	push	a
3366       00000000      OFST:	set	0
3369                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3371  076a 4d            	tnz	a
3372  076b 270c          	jreq	L024
3373  076d a104          	cp	a,#4
3374  076f 2708          	jreq	L024
3375  0771 a108          	cp	a,#8
3376  0773 2704          	jreq	L024
3377  0775 a10c          	cp	a,#12
3378  0777 2603          	jrne	L614
3379  0779               L024:
3380  0779 4f            	clr	a
3381  077a 2010          	jra	L224
3382  077c               L614:
3383  077c ae031a        	ldw	x,#794
3384  077f 89            	pushw	x
3385  0780 ae0000        	ldw	x,#0
3386  0783 89            	pushw	x
3387  0784 ae0000        	ldw	x,#L102
3388  0787 cd0000        	call	_assert_failed
3390  078a 5b04          	addw	sp,#4
3391  078c               L224:
3392                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3394  078c c65326        	ld	a,21286
3395  078f a4f3          	and	a,#243
3396  0791 1a01          	or	a,(OFST+1,sp)
3397  0793 c75326        	ld	21286,a
3398                     ; 798 }
3401  0796 84            	pop	a
3402  0797 81            	ret
3448                     ; 804 uint16_t TIM3_GetCapture1(void)
3448                     ; 805 {
3449                     	switch	.text
3450  0798               _TIM3_GetCapture1:
3452  0798 5204          	subw	sp,#4
3453       00000004      OFST:	set	4
3456                     ; 807     uint16_t tmpccr1 = 0;
3458                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
3462                     ; 810     tmpccr1h = TIM3->CCR1H;
3464  079a c6532d        	ld	a,21293
3465  079d 6b02          	ld	(OFST-2,sp),a
3466                     ; 811     tmpccr1l = TIM3->CCR1L;
3468  079f c6532e        	ld	a,21294
3469  07a2 6b01          	ld	(OFST-3,sp),a
3470                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
3472  07a4 7b01          	ld	a,(OFST-3,sp)
3473  07a6 5f            	clrw	x
3474  07a7 97            	ld	xl,a
3475  07a8 1f03          	ldw	(OFST-1,sp),x
3476                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3478  07aa 7b02          	ld	a,(OFST-2,sp)
3479  07ac 5f            	clrw	x
3480  07ad 97            	ld	xl,a
3481  07ae 4f            	clr	a
3482  07af 02            	rlwa	x,a
3483  07b0 01            	rrwa	x,a
3484  07b1 1a04          	or	a,(OFST+0,sp)
3485  07b3 01            	rrwa	x,a
3486  07b4 1a03          	or	a,(OFST-1,sp)
3487  07b6 01            	rrwa	x,a
3488  07b7 1f03          	ldw	(OFST-1,sp),x
3489                     ; 816     return (uint16_t)tmpccr1;
3491  07b9 1e03          	ldw	x,(OFST-1,sp)
3494  07bb 5b04          	addw	sp,#4
3495  07bd 81            	ret
3541                     ; 824 uint16_t TIM3_GetCapture2(void)
3541                     ; 825 {
3542                     	switch	.text
3543  07be               _TIM3_GetCapture2:
3545  07be 5204          	subw	sp,#4
3546       00000004      OFST:	set	4
3549                     ; 827     uint16_t tmpccr2 = 0;
3551                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
3555                     ; 830     tmpccr2h = TIM3->CCR2H;
3557  07c0 c6532f        	ld	a,21295
3558  07c3 6b02          	ld	(OFST-2,sp),a
3559                     ; 831     tmpccr2l = TIM3->CCR2L;
3561  07c5 c65330        	ld	a,21296
3562  07c8 6b01          	ld	(OFST-3,sp),a
3563                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
3565  07ca 7b01          	ld	a,(OFST-3,sp)
3566  07cc 5f            	clrw	x
3567  07cd 97            	ld	xl,a
3568  07ce 1f03          	ldw	(OFST-1,sp),x
3569                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3571  07d0 7b02          	ld	a,(OFST-2,sp)
3572  07d2 5f            	clrw	x
3573  07d3 97            	ld	xl,a
3574  07d4 4f            	clr	a
3575  07d5 02            	rlwa	x,a
3576  07d6 01            	rrwa	x,a
3577  07d7 1a04          	or	a,(OFST+0,sp)
3578  07d9 01            	rrwa	x,a
3579  07da 1a03          	or	a,(OFST-1,sp)
3580  07dc 01            	rrwa	x,a
3581  07dd 1f03          	ldw	(OFST-1,sp),x
3582                     ; 836     return (uint16_t)tmpccr2;
3584  07df 1e03          	ldw	x,(OFST-1,sp)
3587  07e1 5b04          	addw	sp,#4
3588  07e3 81            	ret
3620                     ; 844 uint16_t TIM3_GetCounter(void)
3620                     ; 845 {
3621                     	switch	.text
3622  07e4               _TIM3_GetCounter:
3624  07e4 89            	pushw	x
3625       00000002      OFST:	set	2
3628                     ; 846    uint16_t tmpcntr = 0;
3630                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3632  07e5 c65328        	ld	a,21288
3633  07e8 5f            	clrw	x
3634  07e9 97            	ld	xl,a
3635  07ea 4f            	clr	a
3636  07eb 02            	rlwa	x,a
3637  07ec 1f01          	ldw	(OFST-1,sp),x
3638                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3640  07ee c65329        	ld	a,21289
3641  07f1 5f            	clrw	x
3642  07f2 97            	ld	xl,a
3643  07f3 01            	rrwa	x,a
3644  07f4 1a02          	or	a,(OFST+0,sp)
3645  07f6 01            	rrwa	x,a
3646  07f7 1a01          	or	a,(OFST-1,sp)
3647  07f9 01            	rrwa	x,a
3650  07fa 5b02          	addw	sp,#2
3651  07fc 81            	ret
3675                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3675                     ; 860 {
3676                     	switch	.text
3677  07fd               _TIM3_GetPrescaler:
3681                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3683  07fd c6532a        	ld	a,21290
3686  0800 81            	ret
3808                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3808                     ; 878 {
3809                     	switch	.text
3810  0801               _TIM3_GetFlagStatus:
3812  0801 89            	pushw	x
3813  0802 89            	pushw	x
3814       00000002      OFST:	set	2
3817                     ; 879    FlagStatus bitstatus = RESET;
3819                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3823                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3825  0803 a30001        	cpw	x,#1
3826  0806 2714          	jreq	L044
3827  0808 a30002        	cpw	x,#2
3828  080b 270f          	jreq	L044
3829  080d a30004        	cpw	x,#4
3830  0810 270a          	jreq	L044
3831  0812 a30200        	cpw	x,#512
3832  0815 2705          	jreq	L044
3833  0817 a30400        	cpw	x,#1024
3834  081a 2603          	jrne	L634
3835  081c               L044:
3836  081c 4f            	clr	a
3837  081d 2010          	jra	L244
3838  081f               L634:
3839  081f ae0373        	ldw	x,#883
3840  0822 89            	pushw	x
3841  0823 ae0000        	ldw	x,#0
3842  0826 89            	pushw	x
3843  0827 ae0000        	ldw	x,#L102
3844  082a cd0000        	call	_assert_failed
3846  082d 5b04          	addw	sp,#4
3847  082f               L244:
3848                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3850  082f c65322        	ld	a,21282
3851  0832 1404          	and	a,(OFST+2,sp)
3852  0834 6b01          	ld	(OFST-1,sp),a
3853                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3855  0836 7b03          	ld	a,(OFST+1,sp)
3856  0838 6b02          	ld	(OFST+0,sp),a
3857                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3859  083a c65323        	ld	a,21283
3860  083d 1402          	and	a,(OFST+0,sp)
3861  083f 1a01          	or	a,(OFST-1,sp)
3862  0841 2706          	jreq	L5341
3863                     ; 890         bitstatus = SET;
3865  0843 a601          	ld	a,#1
3866  0845 6b02          	ld	(OFST+0,sp),a
3868  0847 2002          	jra	L7341
3869  0849               L5341:
3870                     ; 894         bitstatus = RESET;
3872  0849 0f02          	clr	(OFST+0,sp)
3873  084b               L7341:
3874                     ; 896     return (FlagStatus)bitstatus;
3876  084b 7b02          	ld	a,(OFST+0,sp)
3879  084d 5b04          	addw	sp,#4
3880  084f 81            	ret
3916                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3916                     ; 912 {
3917                     	switch	.text
3918  0850               _TIM3_ClearFlag:
3920  0850 89            	pushw	x
3921       00000000      OFST:	set	0
3924                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3926  0851 01            	rrwa	x,a
3927  0852 a4f8          	and	a,#248
3928  0854 01            	rrwa	x,a
3929  0855 a4f9          	and	a,#249
3930  0857 01            	rrwa	x,a
3931  0858 a30000        	cpw	x,#0
3932  085b 2607          	jrne	L644
3933  085d 1e01          	ldw	x,(OFST+1,sp)
3934  085f 2703          	jreq	L644
3935  0861 4f            	clr	a
3936  0862 2010          	jra	L054
3937  0864               L644:
3938  0864 ae0392        	ldw	x,#914
3939  0867 89            	pushw	x
3940  0868 ae0000        	ldw	x,#0
3941  086b 89            	pushw	x
3942  086c ae0000        	ldw	x,#L102
3943  086f cd0000        	call	_assert_failed
3945  0872 5b04          	addw	sp,#4
3946  0874               L054:
3947                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
3949  0874 7b02          	ld	a,(OFST+2,sp)
3950  0876 43            	cpl	a
3951  0877 c75322        	ld	21282,a
3952                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
3954  087a 7b01          	ld	a,(OFST+1,sp)
3955  087c 43            	cpl	a
3956  087d c75323        	ld	21283,a
3957                     ; 919 }
3960  0880 85            	popw	x
3961  0881 81            	ret
4022                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4022                     ; 933 {
4023                     	switch	.text
4024  0882               _TIM3_GetITStatus:
4026  0882 88            	push	a
4027  0883 89            	pushw	x
4028       00000002      OFST:	set	2
4031                     ; 934     ITStatus bitstatus = RESET;
4033                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
4037                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
4039  0884 a101          	cp	a,#1
4040  0886 2708          	jreq	L654
4041  0888 a102          	cp	a,#2
4042  088a 2704          	jreq	L654
4043  088c a104          	cp	a,#4
4044  088e 2603          	jrne	L454
4045  0890               L654:
4046  0890 4f            	clr	a
4047  0891 2010          	jra	L064
4048  0893               L454:
4049  0893 ae03aa        	ldw	x,#938
4050  0896 89            	pushw	x
4051  0897 ae0000        	ldw	x,#0
4052  089a 89            	pushw	x
4053  089b ae0000        	ldw	x,#L102
4054  089e cd0000        	call	_assert_failed
4056  08a1 5b04          	addw	sp,#4
4057  08a3               L064:
4058                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
4060  08a3 c65322        	ld	a,21282
4061  08a6 1403          	and	a,(OFST+1,sp)
4062  08a8 6b01          	ld	(OFST-1,sp),a
4063                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
4065  08aa c65321        	ld	a,21281
4066  08ad 1403          	and	a,(OFST+1,sp)
4067  08af 6b02          	ld	(OFST+0,sp),a
4068                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
4070  08b1 0d01          	tnz	(OFST-1,sp)
4071  08b3 270a          	jreq	L5051
4073  08b5 0d02          	tnz	(OFST+0,sp)
4074  08b7 2706          	jreq	L5051
4075                     ; 946         bitstatus = SET;
4077  08b9 a601          	ld	a,#1
4078  08bb 6b02          	ld	(OFST+0,sp),a
4080  08bd 2002          	jra	L7051
4081  08bf               L5051:
4082                     ; 950         bitstatus = RESET;
4084  08bf 0f02          	clr	(OFST+0,sp)
4085  08c1               L7051:
4086                     ; 952     return (ITStatus)(bitstatus);
4088  08c1 7b02          	ld	a,(OFST+0,sp)
4091  08c3 5b03          	addw	sp,#3
4092  08c5 81            	ret
4129                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4129                     ; 966 {
4130                     	switch	.text
4131  08c6               _TIM3_ClearITPendingBit:
4133  08c6 88            	push	a
4134       00000000      OFST:	set	0
4137                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
4139  08c7 4d            	tnz	a
4140  08c8 2707          	jreq	L464
4141  08ca a108          	cp	a,#8
4142  08cc 2403          	jruge	L464
4143  08ce 4f            	clr	a
4144  08cf 2010          	jra	L664
4145  08d1               L464:
4146  08d1 ae03c8        	ldw	x,#968
4147  08d4 89            	pushw	x
4148  08d5 ae0000        	ldw	x,#0
4149  08d8 89            	pushw	x
4150  08d9 ae0000        	ldw	x,#L102
4151  08dc cd0000        	call	_assert_failed
4153  08df 5b04          	addw	sp,#4
4154  08e1               L664:
4155                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
4157  08e1 7b01          	ld	a,(OFST+1,sp)
4158  08e3 43            	cpl	a
4159  08e4 c75322        	ld	21282,a
4160                     ; 972 }
4163  08e7 84            	pop	a
4164  08e8 81            	ret
4210                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
4210                     ; 992                        uint8_t TIM3_ICSelection,
4210                     ; 993                        uint8_t TIM3_ICFilter)
4210                     ; 994 {
4211                     	switch	.text
4212  08e9               L3_TI1_Config:
4214  08e9 89            	pushw	x
4215  08ea 88            	push	a
4216       00000001      OFST:	set	1
4219                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
4221  08eb 72115327      	bres	21287,#0
4222                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
4224  08ef 7b06          	ld	a,(OFST+5,sp)
4225  08f1 97            	ld	xl,a
4226  08f2 a610          	ld	a,#16
4227  08f4 42            	mul	x,a
4228  08f5 9f            	ld	a,xl
4229  08f6 1a03          	or	a,(OFST+2,sp)
4230  08f8 6b01          	ld	(OFST+0,sp),a
4231  08fa c65325        	ld	a,21285
4232  08fd a40c          	and	a,#12
4233  08ff 1a01          	or	a,(OFST+0,sp)
4234  0901 c75325        	ld	21285,a
4235                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4237  0904 0d02          	tnz	(OFST+1,sp)
4238  0906 2706          	jreq	L7451
4239                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
4241  0908 72125327      	bset	21287,#1
4243  090c 2004          	jra	L1551
4244  090e               L7451:
4245                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
4247  090e 72135327      	bres	21287,#1
4248  0912               L1551:
4249                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
4251  0912 72105327      	bset	21287,#0
4252                     ; 1012 }
4255  0916 5b03          	addw	sp,#3
4256  0918 81            	ret
4302                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
4302                     ; 1032                        uint8_t TIM3_ICSelection,
4302                     ; 1033                        uint8_t TIM3_ICFilter)
4302                     ; 1034 {
4303                     	switch	.text
4304  0919               L5_TI2_Config:
4306  0919 89            	pushw	x
4307  091a 88            	push	a
4308       00000001      OFST:	set	1
4311                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4313  091b 72195327      	bres	21287,#4
4314                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4314                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4314                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
4316  091f 7b06          	ld	a,(OFST+5,sp)
4317  0921 97            	ld	xl,a
4318  0922 a610          	ld	a,#16
4319  0924 42            	mul	x,a
4320  0925 9f            	ld	a,xl
4321  0926 1a03          	or	a,(OFST+2,sp)
4322  0928 6b01          	ld	(OFST+0,sp),a
4323  092a c65326        	ld	a,21286
4324  092d a40c          	and	a,#12
4325  092f 1a01          	or	a,(OFST+0,sp)
4326  0931 c75326        	ld	21286,a
4327                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4329  0934 0d02          	tnz	(OFST+1,sp)
4330  0936 2706          	jreq	L3751
4331                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
4333  0938 721a5327      	bset	21287,#5
4335  093c 2004          	jra	L5751
4336  093e               L3751:
4337                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4339  093e 721b5327      	bres	21287,#5
4340  0942               L5751:
4341                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
4343  0942 72185327      	bset	21287,#4
4344                     ; 1056 }
4347  0946 5b03          	addw	sp,#3
4348  0948 81            	ret
4361                     	xdef	_TIM3_ClearITPendingBit
4362                     	xdef	_TIM3_GetITStatus
4363                     	xdef	_TIM3_ClearFlag
4364                     	xdef	_TIM3_GetFlagStatus
4365                     	xdef	_TIM3_GetPrescaler
4366                     	xdef	_TIM3_GetCounter
4367                     	xdef	_TIM3_GetCapture2
4368                     	xdef	_TIM3_GetCapture1
4369                     	xdef	_TIM3_SetIC2Prescaler
4370                     	xdef	_TIM3_SetIC1Prescaler
4371                     	xdef	_TIM3_SetCompare2
4372                     	xdef	_TIM3_SetCompare1
4373                     	xdef	_TIM3_SetAutoreload
4374                     	xdef	_TIM3_SetCounter
4375                     	xdef	_TIM3_SelectOCxM
4376                     	xdef	_TIM3_CCxCmd
4377                     	xdef	_TIM3_OC2PolarityConfig
4378                     	xdef	_TIM3_OC1PolarityConfig
4379                     	xdef	_TIM3_GenerateEvent
4380                     	xdef	_TIM3_OC2PreloadConfig
4381                     	xdef	_TIM3_OC1PreloadConfig
4382                     	xdef	_TIM3_ARRPreloadConfig
4383                     	xdef	_TIM3_ForcedOC2Config
4384                     	xdef	_TIM3_ForcedOC1Config
4385                     	xdef	_TIM3_PrescalerConfig
4386                     	xdef	_TIM3_SelectOnePulseMode
4387                     	xdef	_TIM3_UpdateRequestConfig
4388                     	xdef	_TIM3_UpdateDisableConfig
4389                     	xdef	_TIM3_ITConfig
4390                     	xdef	_TIM3_Cmd
4391                     	xdef	_TIM3_PWMIConfig
4392                     	xdef	_TIM3_ICInit
4393                     	xdef	_TIM3_OC2Init
4394                     	xdef	_TIM3_OC1Init
4395                     	xdef	_TIM3_TimeBaseInit
4396                     	xdef	_TIM3_DeInit
4397                     	xref	_assert_failed
4398                     .const:	section	.text
4399  0000               L102:
4400  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
4401  0012 696d332e6300  	dc.b	"im3.c",0
4421                     	end

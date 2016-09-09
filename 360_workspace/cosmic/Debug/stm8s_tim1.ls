   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 52 void TIM1_DeInit(void)
  43                     ; 53 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 58     TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f5254      	clr	21076
  65                     ; 59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  67  0014 725f5256      	clr	21078
  68                     ; 61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  70  0018 725f525c      	clr	21084
  71                     ; 62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  73  001c 725f525d      	clr	21085
  74                     ; 64     TIM1->CCMR1 = 0x01;
  76  0020 35015258      	mov	21080,#1
  77                     ; 65     TIM1->CCMR2 = 0x01;
  79  0024 35015259      	mov	21081,#1
  80                     ; 66     TIM1->CCMR3 = 0x01;
  82  0028 3501525a      	mov	21082,#1
  83                     ; 67     TIM1->CCMR4 = 0x01;
  85  002c 3501525b      	mov	21083,#1
  86                     ; 69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  94  0038 725f5258      	clr	21080
  95                     ; 72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  97  003c 725f5259      	clr	21081
  98                     ; 73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 100  0040 725f525a      	clr	21082
 101                     ; 74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 103  0044 725f525b      	clr	21083
 104                     ; 75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 106  0048 725f525e      	clr	21086
 107                     ; 76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 109  004c 725f525f      	clr	21087
 110                     ; 77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 112  0050 725f5260      	clr	21088
 113                     ; 78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 115  0054 725f5261      	clr	21089
 116                     ; 79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 118  0058 35ff5262      	mov	21090,#255
 119                     ; 80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 121  005c 35ff5263      	mov	21091,#255
 122                     ; 81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 124  0060 725f5265      	clr	21093
 125                     ; 82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 127  0064 725f5266      	clr	21094
 128                     ; 83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 130  0068 725f5267      	clr	21095
 131                     ; 84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 133  006c 725f5268      	clr	21096
 134                     ; 85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 136  0070 725f5269      	clr	21097
 137                     ; 86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 139  0074 725f526a      	clr	21098
 140                     ; 87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 142  0078 725f526b      	clr	21099
 143                     ; 88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 145  007c 725f526c      	clr	21100
 146                     ; 89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 148  0080 725f526f      	clr	21103
 149                     ; 90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 151  0084 35015257      	mov	21079,#1
 152                     ; 91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 154  0088 725f526e      	clr	21102
 155                     ; 92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 157  008c 725f526d      	clr	21101
 158                     ; 93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 160  0090 725f5264      	clr	21092
 161                     ; 94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 163  0094 725f5255      	clr	21077
 164                     ; 95 }
 167  0098 81            	ret
 271                     ; 105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 271                     ; 106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 271                     ; 107                        uint16_t TIM1_Period,
 271                     ; 108                        uint8_t TIM1_RepetitionCounter)
 271                     ; 109 {
 272                     	switch	.text
 273  0099               _TIM1_TimeBaseInit:
 275  0099 89            	pushw	x
 276       00000000      OFST:	set	0
 279                     ; 112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 281  009a 0d05          	tnz	(OFST+5,sp)
 282  009c 2718          	jreq	L21
 283  009e 7b05          	ld	a,(OFST+5,sp)
 284  00a0 a110          	cp	a,#16
 285  00a2 2712          	jreq	L21
 286  00a4 7b05          	ld	a,(OFST+5,sp)
 287  00a6 a120          	cp	a,#32
 288  00a8 270c          	jreq	L21
 289  00aa 7b05          	ld	a,(OFST+5,sp)
 290  00ac a140          	cp	a,#64
 291  00ae 2706          	jreq	L21
 292  00b0 7b05          	ld	a,(OFST+5,sp)
 293  00b2 a160          	cp	a,#96
 294  00b4 2603          	jrne	L01
 295  00b6               L21:
 296  00b6 4f            	clr	a
 297  00b7 2010          	jra	L41
 298  00b9               L01:
 299  00b9 ae0070        	ldw	x,#112
 300  00bc 89            	pushw	x
 301  00bd ae0000        	ldw	x,#0
 302  00c0 89            	pushw	x
 303  00c1 ae0000        	ldw	x,#L37
 304  00c4 cd0000        	call	_assert_failed
 306  00c7 5b04          	addw	sp,#4
 307  00c9               L41:
 308                     ; 115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 310  00c9 7b06          	ld	a,(OFST+6,sp)
 311  00cb c75262        	ld	21090,a
 312                     ; 116     TIM1->ARRL = (uint8_t)(TIM1_Period);
 314  00ce 7b07          	ld	a,(OFST+7,sp)
 315  00d0 c75263        	ld	21091,a
 316                     ; 119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 318  00d3 7b01          	ld	a,(OFST+1,sp)
 319  00d5 c75260        	ld	21088,a
 320                     ; 120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 322  00d8 7b02          	ld	a,(OFST+2,sp)
 323  00da c75261        	ld	21089,a
 324                     ; 123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 324                     ; 124                            | (uint8_t)(TIM1_CounterMode));
 326  00dd c65250        	ld	a,21072
 327  00e0 a48f          	and	a,#143
 328  00e2 1a05          	or	a,(OFST+5,sp)
 329  00e4 c75250        	ld	21072,a
 330                     ; 127     TIM1->RCR = TIM1_RepetitionCounter;
 332  00e7 7b08          	ld	a,(OFST+8,sp)
 333  00e9 c75264        	ld	21092,a
 334                     ; 129 }
 337  00ec 85            	popw	x
 338  00ed 81            	ret
 622                     ; 150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 622                     ; 151                   TIM1_OutputState_TypeDef TIM1_OutputState,
 622                     ; 152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 622                     ; 153                   uint16_t TIM1_Pulse,
 622                     ; 154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 622                     ; 155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 622                     ; 156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 622                     ; 157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 622                     ; 158 {
 623                     	switch	.text
 624  00ee               _TIM1_OC1Init:
 626  00ee 89            	pushw	x
 627  00ef 5203          	subw	sp,#3
 628       00000003      OFST:	set	3
 631                     ; 160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 633  00f1 9e            	ld	a,xh
 634  00f2 4d            	tnz	a
 635  00f3 2719          	jreq	L22
 636  00f5 9e            	ld	a,xh
 637  00f6 a110          	cp	a,#16
 638  00f8 2714          	jreq	L22
 639  00fa 9e            	ld	a,xh
 640  00fb a120          	cp	a,#32
 641  00fd 270f          	jreq	L22
 642  00ff 9e            	ld	a,xh
 643  0100 a130          	cp	a,#48
 644  0102 270a          	jreq	L22
 645  0104 9e            	ld	a,xh
 646  0105 a160          	cp	a,#96
 647  0107 2705          	jreq	L22
 648  0109 9e            	ld	a,xh
 649  010a a170          	cp	a,#112
 650  010c 2603          	jrne	L02
 651  010e               L22:
 652  010e 4f            	clr	a
 653  010f 2010          	jra	L42
 654  0111               L02:
 655  0111 ae00a0        	ldw	x,#160
 656  0114 89            	pushw	x
 657  0115 ae0000        	ldw	x,#0
 658  0118 89            	pushw	x
 659  0119 ae0000        	ldw	x,#L37
 660  011c cd0000        	call	_assert_failed
 662  011f 5b04          	addw	sp,#4
 663  0121               L42:
 664                     ; 161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 666  0121 0d05          	tnz	(OFST+2,sp)
 667  0123 2706          	jreq	L03
 668  0125 7b05          	ld	a,(OFST+2,sp)
 669  0127 a111          	cp	a,#17
 670  0129 2603          	jrne	L62
 671  012b               L03:
 672  012b 4f            	clr	a
 673  012c 2010          	jra	L23
 674  012e               L62:
 675  012e ae00a1        	ldw	x,#161
 676  0131 89            	pushw	x
 677  0132 ae0000        	ldw	x,#0
 678  0135 89            	pushw	x
 679  0136 ae0000        	ldw	x,#L37
 680  0139 cd0000        	call	_assert_failed
 682  013c 5b04          	addw	sp,#4
 683  013e               L23:
 684                     ; 162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 686  013e 0d08          	tnz	(OFST+5,sp)
 687  0140 2706          	jreq	L63
 688  0142 7b08          	ld	a,(OFST+5,sp)
 689  0144 a144          	cp	a,#68
 690  0146 2603          	jrne	L43
 691  0148               L63:
 692  0148 4f            	clr	a
 693  0149 2010          	jra	L04
 694  014b               L43:
 695  014b ae00a2        	ldw	x,#162
 696  014e 89            	pushw	x
 697  014f ae0000        	ldw	x,#0
 698  0152 89            	pushw	x
 699  0153 ae0000        	ldw	x,#L37
 700  0156 cd0000        	call	_assert_failed
 702  0159 5b04          	addw	sp,#4
 703  015b               L04:
 704                     ; 163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 706  015b 0d0b          	tnz	(OFST+8,sp)
 707  015d 2706          	jreq	L44
 708  015f 7b0b          	ld	a,(OFST+8,sp)
 709  0161 a122          	cp	a,#34
 710  0163 2603          	jrne	L24
 711  0165               L44:
 712  0165 4f            	clr	a
 713  0166 2010          	jra	L64
 714  0168               L24:
 715  0168 ae00a3        	ldw	x,#163
 716  016b 89            	pushw	x
 717  016c ae0000        	ldw	x,#0
 718  016f 89            	pushw	x
 719  0170 ae0000        	ldw	x,#L37
 720  0173 cd0000        	call	_assert_failed
 722  0176 5b04          	addw	sp,#4
 723  0178               L64:
 724                     ; 164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 726  0178 0d0c          	tnz	(OFST+9,sp)
 727  017a 2706          	jreq	L25
 728  017c 7b0c          	ld	a,(OFST+9,sp)
 729  017e a188          	cp	a,#136
 730  0180 2603          	jrne	L05
 731  0182               L25:
 732  0182 4f            	clr	a
 733  0183 2010          	jra	L45
 734  0185               L05:
 735  0185 ae00a4        	ldw	x,#164
 736  0188 89            	pushw	x
 737  0189 ae0000        	ldw	x,#0
 738  018c 89            	pushw	x
 739  018d ae0000        	ldw	x,#L37
 740  0190 cd0000        	call	_assert_failed
 742  0193 5b04          	addw	sp,#4
 743  0195               L45:
 744                     ; 165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 746  0195 7b0d          	ld	a,(OFST+10,sp)
 747  0197 a155          	cp	a,#85
 748  0199 2704          	jreq	L06
 749  019b 0d0d          	tnz	(OFST+10,sp)
 750  019d 2603          	jrne	L65
 751  019f               L06:
 752  019f 4f            	clr	a
 753  01a0 2010          	jra	L26
 754  01a2               L65:
 755  01a2 ae00a5        	ldw	x,#165
 756  01a5 89            	pushw	x
 757  01a6 ae0000        	ldw	x,#0
 758  01a9 89            	pushw	x
 759  01aa ae0000        	ldw	x,#L37
 760  01ad cd0000        	call	_assert_failed
 762  01b0 5b04          	addw	sp,#4
 763  01b2               L26:
 764                     ; 166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 766  01b2 7b0e          	ld	a,(OFST+11,sp)
 767  01b4 a12a          	cp	a,#42
 768  01b6 2704          	jreq	L66
 769  01b8 0d0e          	tnz	(OFST+11,sp)
 770  01ba 2603          	jrne	L46
 771  01bc               L66:
 772  01bc 4f            	clr	a
 773  01bd 2010          	jra	L07
 774  01bf               L46:
 775  01bf ae00a6        	ldw	x,#166
 776  01c2 89            	pushw	x
 777  01c3 ae0000        	ldw	x,#0
 778  01c6 89            	pushw	x
 779  01c7 ae0000        	ldw	x,#L37
 780  01ca cd0000        	call	_assert_failed
 782  01cd 5b04          	addw	sp,#4
 783  01cf               L07:
 784                     ; 170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 784                     ; 171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 786  01cf c6525c        	ld	a,21084
 787  01d2 a4f0          	and	a,#240
 788  01d4 c7525c        	ld	21084,a
 789                     ; 174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 789                     ; 175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 789                     ; 176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 789                     ; 177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 791  01d7 7b0c          	ld	a,(OFST+9,sp)
 792  01d9 a408          	and	a,#8
 793  01db 6b03          	ld	(OFST+0,sp),a
 794  01dd 7b0b          	ld	a,(OFST+8,sp)
 795  01df a402          	and	a,#2
 796  01e1 1a03          	or	a,(OFST+0,sp)
 797  01e3 6b02          	ld	(OFST-1,sp),a
 798  01e5 7b08          	ld	a,(OFST+5,sp)
 799  01e7 a404          	and	a,#4
 800  01e9 6b01          	ld	(OFST-2,sp),a
 801  01eb 7b05          	ld	a,(OFST+2,sp)
 802  01ed a401          	and	a,#1
 803  01ef 1a01          	or	a,(OFST-2,sp)
 804  01f1 1a02          	or	a,(OFST-1,sp)
 805  01f3 ca525c        	or	a,21084
 806  01f6 c7525c        	ld	21084,a
 807                     ; 180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 807                     ; 181                             (uint8_t)TIM1_OCMode);
 809  01f9 c65258        	ld	a,21080
 810  01fc a48f          	and	a,#143
 811  01fe 1a04          	or	a,(OFST+1,sp)
 812  0200 c75258        	ld	21080,a
 813                     ; 184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 815  0203 c6526f        	ld	a,21103
 816  0206 a4fc          	and	a,#252
 817  0208 c7526f        	ld	21103,a
 818                     ; 186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 818                     ; 187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 820  020b 7b0e          	ld	a,(OFST+11,sp)
 821  020d a402          	and	a,#2
 822  020f 6b03          	ld	(OFST+0,sp),a
 823  0211 7b0d          	ld	a,(OFST+10,sp)
 824  0213 a401          	and	a,#1
 825  0215 1a03          	or	a,(OFST+0,sp)
 826  0217 ca526f        	or	a,21103
 827  021a c7526f        	ld	21103,a
 828                     ; 190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 830  021d 7b09          	ld	a,(OFST+6,sp)
 831  021f c75265        	ld	21093,a
 832                     ; 191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 834  0222 7b0a          	ld	a,(OFST+7,sp)
 835  0224 c75266        	ld	21094,a
 836                     ; 192 }
 839  0227 5b05          	addw	sp,#5
 840  0229 81            	ret
 943                     ; 213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 943                     ; 214                   TIM1_OutputState_TypeDef TIM1_OutputState,
 943                     ; 215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 943                     ; 216                   uint16_t TIM1_Pulse,
 943                     ; 217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 943                     ; 218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 943                     ; 219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 943                     ; 220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 943                     ; 221 {
 944                     	switch	.text
 945  022a               _TIM1_OC2Init:
 947  022a 89            	pushw	x
 948  022b 5203          	subw	sp,#3
 949       00000003      OFST:	set	3
 952                     ; 223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 954  022d 9e            	ld	a,xh
 955  022e 4d            	tnz	a
 956  022f 2719          	jreq	L67
 957  0231 9e            	ld	a,xh
 958  0232 a110          	cp	a,#16
 959  0234 2714          	jreq	L67
 960  0236 9e            	ld	a,xh
 961  0237 a120          	cp	a,#32
 962  0239 270f          	jreq	L67
 963  023b 9e            	ld	a,xh
 964  023c a130          	cp	a,#48
 965  023e 270a          	jreq	L67
 966  0240 9e            	ld	a,xh
 967  0241 a160          	cp	a,#96
 968  0243 2705          	jreq	L67
 969  0245 9e            	ld	a,xh
 970  0246 a170          	cp	a,#112
 971  0248 2603          	jrne	L47
 972  024a               L67:
 973  024a 4f            	clr	a
 974  024b 2010          	jra	L001
 975  024d               L47:
 976  024d ae00df        	ldw	x,#223
 977  0250 89            	pushw	x
 978  0251 ae0000        	ldw	x,#0
 979  0254 89            	pushw	x
 980  0255 ae0000        	ldw	x,#L37
 981  0258 cd0000        	call	_assert_failed
 983  025b 5b04          	addw	sp,#4
 984  025d               L001:
 985                     ; 224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 987  025d 0d05          	tnz	(OFST+2,sp)
 988  025f 2706          	jreq	L401
 989  0261 7b05          	ld	a,(OFST+2,sp)
 990  0263 a111          	cp	a,#17
 991  0265 2603          	jrne	L201
 992  0267               L401:
 993  0267 4f            	clr	a
 994  0268 2010          	jra	L601
 995  026a               L201:
 996  026a ae00e0        	ldw	x,#224
 997  026d 89            	pushw	x
 998  026e ae0000        	ldw	x,#0
 999  0271 89            	pushw	x
1000  0272 ae0000        	ldw	x,#L37
1001  0275 cd0000        	call	_assert_failed
1003  0278 5b04          	addw	sp,#4
1004  027a               L601:
1005                     ; 225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1007  027a 0d08          	tnz	(OFST+5,sp)
1008  027c 2706          	jreq	L211
1009  027e 7b08          	ld	a,(OFST+5,sp)
1010  0280 a144          	cp	a,#68
1011  0282 2603          	jrne	L011
1012  0284               L211:
1013  0284 4f            	clr	a
1014  0285 2010          	jra	L411
1015  0287               L011:
1016  0287 ae00e1        	ldw	x,#225
1017  028a 89            	pushw	x
1018  028b ae0000        	ldw	x,#0
1019  028e 89            	pushw	x
1020  028f ae0000        	ldw	x,#L37
1021  0292 cd0000        	call	_assert_failed
1023  0295 5b04          	addw	sp,#4
1024  0297               L411:
1025                     ; 226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1027  0297 0d0b          	tnz	(OFST+8,sp)
1028  0299 2706          	jreq	L021
1029  029b 7b0b          	ld	a,(OFST+8,sp)
1030  029d a122          	cp	a,#34
1031  029f 2603          	jrne	L611
1032  02a1               L021:
1033  02a1 4f            	clr	a
1034  02a2 2010          	jra	L221
1035  02a4               L611:
1036  02a4 ae00e2        	ldw	x,#226
1037  02a7 89            	pushw	x
1038  02a8 ae0000        	ldw	x,#0
1039  02ab 89            	pushw	x
1040  02ac ae0000        	ldw	x,#L37
1041  02af cd0000        	call	_assert_failed
1043  02b2 5b04          	addw	sp,#4
1044  02b4               L221:
1045                     ; 227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1047  02b4 0d0c          	tnz	(OFST+9,sp)
1048  02b6 2706          	jreq	L621
1049  02b8 7b0c          	ld	a,(OFST+9,sp)
1050  02ba a188          	cp	a,#136
1051  02bc 2603          	jrne	L421
1052  02be               L621:
1053  02be 4f            	clr	a
1054  02bf 2010          	jra	L031
1055  02c1               L421:
1056  02c1 ae00e3        	ldw	x,#227
1057  02c4 89            	pushw	x
1058  02c5 ae0000        	ldw	x,#0
1059  02c8 89            	pushw	x
1060  02c9 ae0000        	ldw	x,#L37
1061  02cc cd0000        	call	_assert_failed
1063  02cf 5b04          	addw	sp,#4
1064  02d1               L031:
1065                     ; 228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1067  02d1 7b0d          	ld	a,(OFST+10,sp)
1068  02d3 a155          	cp	a,#85
1069  02d5 2704          	jreq	L431
1070  02d7 0d0d          	tnz	(OFST+10,sp)
1071  02d9 2603          	jrne	L231
1072  02db               L431:
1073  02db 4f            	clr	a
1074  02dc 2010          	jra	L631
1075  02de               L231:
1076  02de ae00e4        	ldw	x,#228
1077  02e1 89            	pushw	x
1078  02e2 ae0000        	ldw	x,#0
1079  02e5 89            	pushw	x
1080  02e6 ae0000        	ldw	x,#L37
1081  02e9 cd0000        	call	_assert_failed
1083  02ec 5b04          	addw	sp,#4
1084  02ee               L631:
1085                     ; 229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1087  02ee 7b0e          	ld	a,(OFST+11,sp)
1088  02f0 a12a          	cp	a,#42
1089  02f2 2704          	jreq	L241
1090  02f4 0d0e          	tnz	(OFST+11,sp)
1091  02f6 2603          	jrne	L041
1092  02f8               L241:
1093  02f8 4f            	clr	a
1094  02f9 2010          	jra	L441
1095  02fb               L041:
1096  02fb ae00e5        	ldw	x,#229
1097  02fe 89            	pushw	x
1098  02ff ae0000        	ldw	x,#0
1099  0302 89            	pushw	x
1100  0303 ae0000        	ldw	x,#L37
1101  0306 cd0000        	call	_assert_failed
1103  0309 5b04          	addw	sp,#4
1104  030b               L441:
1105                     ; 233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1105                     ; 234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1107  030b c6525c        	ld	a,21084
1108  030e a40f          	and	a,#15
1109  0310 c7525c        	ld	21084,a
1110                     ; 238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1110                     ; 239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1110                     ; 240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1110                     ; 241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1112  0313 7b0c          	ld	a,(OFST+9,sp)
1113  0315 a480          	and	a,#128
1114  0317 6b03          	ld	(OFST+0,sp),a
1115  0319 7b0b          	ld	a,(OFST+8,sp)
1116  031b a420          	and	a,#32
1117  031d 1a03          	or	a,(OFST+0,sp)
1118  031f 6b02          	ld	(OFST-1,sp),a
1119  0321 7b08          	ld	a,(OFST+5,sp)
1120  0323 a440          	and	a,#64
1121  0325 6b01          	ld	(OFST-2,sp),a
1122  0327 7b05          	ld	a,(OFST+2,sp)
1123  0329 a410          	and	a,#16
1124  032b 1a01          	or	a,(OFST-2,sp)
1125  032d 1a02          	or	a,(OFST-1,sp)
1126  032f ca525c        	or	a,21084
1127  0332 c7525c        	ld	21084,a
1128                     ; 244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1128                     ; 245                              (uint8_t)TIM1_OCMode);
1130  0335 c65259        	ld	a,21081
1131  0338 a48f          	and	a,#143
1132  033a 1a04          	or	a,(OFST+1,sp)
1133  033c c75259        	ld	21081,a
1134                     ; 248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1136  033f c6526f        	ld	a,21103
1137  0342 a4f3          	and	a,#243
1138  0344 c7526f        	ld	21103,a
1139                     ; 250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1139                     ; 251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1141  0347 7b0e          	ld	a,(OFST+11,sp)
1142  0349 a408          	and	a,#8
1143  034b 6b03          	ld	(OFST+0,sp),a
1144  034d 7b0d          	ld	a,(OFST+10,sp)
1145  034f a404          	and	a,#4
1146  0351 1a03          	or	a,(OFST+0,sp)
1147  0353 ca526f        	or	a,21103
1148  0356 c7526f        	ld	21103,a
1149                     ; 254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1151  0359 7b09          	ld	a,(OFST+6,sp)
1152  035b c75267        	ld	21095,a
1153                     ; 255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1155  035e 7b0a          	ld	a,(OFST+7,sp)
1156  0360 c75268        	ld	21096,a
1157                     ; 257 }
1160  0363 5b05          	addw	sp,#5
1161  0365 81            	ret
1264                     ; 278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1264                     ; 279                   TIM1_OutputState_TypeDef TIM1_OutputState,
1264                     ; 280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1264                     ; 281                   uint16_t TIM1_Pulse,
1264                     ; 282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1264                     ; 283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1264                     ; 284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1264                     ; 285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1264                     ; 286 {
1265                     	switch	.text
1266  0366               _TIM1_OC3Init:
1268  0366 89            	pushw	x
1269  0367 5203          	subw	sp,#3
1270       00000003      OFST:	set	3
1273                     ; 288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1275  0369 9e            	ld	a,xh
1276  036a 4d            	tnz	a
1277  036b 2719          	jreq	L251
1278  036d 9e            	ld	a,xh
1279  036e a110          	cp	a,#16
1280  0370 2714          	jreq	L251
1281  0372 9e            	ld	a,xh
1282  0373 a120          	cp	a,#32
1283  0375 270f          	jreq	L251
1284  0377 9e            	ld	a,xh
1285  0378 a130          	cp	a,#48
1286  037a 270a          	jreq	L251
1287  037c 9e            	ld	a,xh
1288  037d a160          	cp	a,#96
1289  037f 2705          	jreq	L251
1290  0381 9e            	ld	a,xh
1291  0382 a170          	cp	a,#112
1292  0384 2603          	jrne	L051
1293  0386               L251:
1294  0386 4f            	clr	a
1295  0387 2010          	jra	L451
1296  0389               L051:
1297  0389 ae0120        	ldw	x,#288
1298  038c 89            	pushw	x
1299  038d ae0000        	ldw	x,#0
1300  0390 89            	pushw	x
1301  0391 ae0000        	ldw	x,#L37
1302  0394 cd0000        	call	_assert_failed
1304  0397 5b04          	addw	sp,#4
1305  0399               L451:
1306                     ; 289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1308  0399 0d05          	tnz	(OFST+2,sp)
1309  039b 2706          	jreq	L061
1310  039d 7b05          	ld	a,(OFST+2,sp)
1311  039f a111          	cp	a,#17
1312  03a1 2603          	jrne	L651
1313  03a3               L061:
1314  03a3 4f            	clr	a
1315  03a4 2010          	jra	L261
1316  03a6               L651:
1317  03a6 ae0121        	ldw	x,#289
1318  03a9 89            	pushw	x
1319  03aa ae0000        	ldw	x,#0
1320  03ad 89            	pushw	x
1321  03ae ae0000        	ldw	x,#L37
1322  03b1 cd0000        	call	_assert_failed
1324  03b4 5b04          	addw	sp,#4
1325  03b6               L261:
1326                     ; 290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1328  03b6 0d08          	tnz	(OFST+5,sp)
1329  03b8 2706          	jreq	L661
1330  03ba 7b08          	ld	a,(OFST+5,sp)
1331  03bc a144          	cp	a,#68
1332  03be 2603          	jrne	L461
1333  03c0               L661:
1334  03c0 4f            	clr	a
1335  03c1 2010          	jra	L071
1336  03c3               L461:
1337  03c3 ae0122        	ldw	x,#290
1338  03c6 89            	pushw	x
1339  03c7 ae0000        	ldw	x,#0
1340  03ca 89            	pushw	x
1341  03cb ae0000        	ldw	x,#L37
1342  03ce cd0000        	call	_assert_failed
1344  03d1 5b04          	addw	sp,#4
1345  03d3               L071:
1346                     ; 291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1348  03d3 0d0b          	tnz	(OFST+8,sp)
1349  03d5 2706          	jreq	L471
1350  03d7 7b0b          	ld	a,(OFST+8,sp)
1351  03d9 a122          	cp	a,#34
1352  03db 2603          	jrne	L271
1353  03dd               L471:
1354  03dd 4f            	clr	a
1355  03de 2010          	jra	L671
1356  03e0               L271:
1357  03e0 ae0123        	ldw	x,#291
1358  03e3 89            	pushw	x
1359  03e4 ae0000        	ldw	x,#0
1360  03e7 89            	pushw	x
1361  03e8 ae0000        	ldw	x,#L37
1362  03eb cd0000        	call	_assert_failed
1364  03ee 5b04          	addw	sp,#4
1365  03f0               L671:
1366                     ; 292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1368  03f0 0d0c          	tnz	(OFST+9,sp)
1369  03f2 2706          	jreq	L202
1370  03f4 7b0c          	ld	a,(OFST+9,sp)
1371  03f6 a188          	cp	a,#136
1372  03f8 2603          	jrne	L002
1373  03fa               L202:
1374  03fa 4f            	clr	a
1375  03fb 2010          	jra	L402
1376  03fd               L002:
1377  03fd ae0124        	ldw	x,#292
1378  0400 89            	pushw	x
1379  0401 ae0000        	ldw	x,#0
1380  0404 89            	pushw	x
1381  0405 ae0000        	ldw	x,#L37
1382  0408 cd0000        	call	_assert_failed
1384  040b 5b04          	addw	sp,#4
1385  040d               L402:
1386                     ; 293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1388  040d 7b0d          	ld	a,(OFST+10,sp)
1389  040f a155          	cp	a,#85
1390  0411 2704          	jreq	L012
1391  0413 0d0d          	tnz	(OFST+10,sp)
1392  0415 2603          	jrne	L602
1393  0417               L012:
1394  0417 4f            	clr	a
1395  0418 2010          	jra	L212
1396  041a               L602:
1397  041a ae0125        	ldw	x,#293
1398  041d 89            	pushw	x
1399  041e ae0000        	ldw	x,#0
1400  0421 89            	pushw	x
1401  0422 ae0000        	ldw	x,#L37
1402  0425 cd0000        	call	_assert_failed
1404  0428 5b04          	addw	sp,#4
1405  042a               L212:
1406                     ; 294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1408  042a 7b0e          	ld	a,(OFST+11,sp)
1409  042c a12a          	cp	a,#42
1410  042e 2704          	jreq	L612
1411  0430 0d0e          	tnz	(OFST+11,sp)
1412  0432 2603          	jrne	L412
1413  0434               L612:
1414  0434 4f            	clr	a
1415  0435 2010          	jra	L022
1416  0437               L412:
1417  0437 ae0126        	ldw	x,#294
1418  043a 89            	pushw	x
1419  043b ae0000        	ldw	x,#0
1420  043e 89            	pushw	x
1421  043f ae0000        	ldw	x,#L37
1422  0442 cd0000        	call	_assert_failed
1424  0445 5b04          	addw	sp,#4
1425  0447               L022:
1426                     ; 298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1426                     ; 299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1428  0447 c6525d        	ld	a,21085
1429  044a a4f0          	and	a,#240
1430  044c c7525d        	ld	21085,a
1431                     ; 302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1431                     ; 303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1431                     ; 304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1431                     ; 305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1433  044f 7b0c          	ld	a,(OFST+9,sp)
1434  0451 a408          	and	a,#8
1435  0453 6b03          	ld	(OFST+0,sp),a
1436  0455 7b0b          	ld	a,(OFST+8,sp)
1437  0457 a402          	and	a,#2
1438  0459 1a03          	or	a,(OFST+0,sp)
1439  045b 6b02          	ld	(OFST-1,sp),a
1440  045d 7b08          	ld	a,(OFST+5,sp)
1441  045f a404          	and	a,#4
1442  0461 6b01          	ld	(OFST-2,sp),a
1443  0463 7b05          	ld	a,(OFST+2,sp)
1444  0465 a401          	and	a,#1
1445  0467 1a01          	or	a,(OFST-2,sp)
1446  0469 1a02          	or	a,(OFST-1,sp)
1447  046b ca525d        	or	a,21085
1448  046e c7525d        	ld	21085,a
1449                     ; 308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1449                     ; 309                              (uint8_t)TIM1_OCMode);
1451  0471 c6525a        	ld	a,21082
1452  0474 a48f          	and	a,#143
1453  0476 1a04          	or	a,(OFST+1,sp)
1454  0478 c7525a        	ld	21082,a
1455                     ; 312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1457  047b c6526f        	ld	a,21103
1458  047e a4cf          	and	a,#207
1459  0480 c7526f        	ld	21103,a
1460                     ; 314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1460                     ; 315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1462  0483 7b0e          	ld	a,(OFST+11,sp)
1463  0485 a420          	and	a,#32
1464  0487 6b03          	ld	(OFST+0,sp),a
1465  0489 7b0d          	ld	a,(OFST+10,sp)
1466  048b a410          	and	a,#16
1467  048d 1a03          	or	a,(OFST+0,sp)
1468  048f ca526f        	or	a,21103
1469  0492 c7526f        	ld	21103,a
1470                     ; 318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1472  0495 7b09          	ld	a,(OFST+6,sp)
1473  0497 c75269        	ld	21097,a
1474                     ; 319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1476  049a 7b0a          	ld	a,(OFST+7,sp)
1477  049c c7526a        	ld	21098,a
1478                     ; 321 }
1481  049f 5b05          	addw	sp,#5
1482  04a1 81            	ret
1555                     ; 336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1555                     ; 337                   TIM1_OutputState_TypeDef TIM1_OutputState,
1555                     ; 338                   uint16_t TIM1_Pulse,
1555                     ; 339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1555                     ; 340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1555                     ; 341 {
1556                     	switch	.text
1557  04a2               _TIM1_OC4Init:
1559  04a2 89            	pushw	x
1560  04a3 88            	push	a
1561       00000001      OFST:	set	1
1564                     ; 343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1566  04a4 9e            	ld	a,xh
1567  04a5 4d            	tnz	a
1568  04a6 2719          	jreq	L622
1569  04a8 9e            	ld	a,xh
1570  04a9 a110          	cp	a,#16
1571  04ab 2714          	jreq	L622
1572  04ad 9e            	ld	a,xh
1573  04ae a120          	cp	a,#32
1574  04b0 270f          	jreq	L622
1575  04b2 9e            	ld	a,xh
1576  04b3 a130          	cp	a,#48
1577  04b5 270a          	jreq	L622
1578  04b7 9e            	ld	a,xh
1579  04b8 a160          	cp	a,#96
1580  04ba 2705          	jreq	L622
1581  04bc 9e            	ld	a,xh
1582  04bd a170          	cp	a,#112
1583  04bf 2603          	jrne	L422
1584  04c1               L622:
1585  04c1 4f            	clr	a
1586  04c2 2010          	jra	L032
1587  04c4               L422:
1588  04c4 ae0157        	ldw	x,#343
1589  04c7 89            	pushw	x
1590  04c8 ae0000        	ldw	x,#0
1591  04cb 89            	pushw	x
1592  04cc ae0000        	ldw	x,#L37
1593  04cf cd0000        	call	_assert_failed
1595  04d2 5b04          	addw	sp,#4
1596  04d4               L032:
1597                     ; 344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1599  04d4 0d03          	tnz	(OFST+2,sp)
1600  04d6 2706          	jreq	L432
1601  04d8 7b03          	ld	a,(OFST+2,sp)
1602  04da a111          	cp	a,#17
1603  04dc 2603          	jrne	L232
1604  04de               L432:
1605  04de 4f            	clr	a
1606  04df 2010          	jra	L632
1607  04e1               L232:
1608  04e1 ae0158        	ldw	x,#344
1609  04e4 89            	pushw	x
1610  04e5 ae0000        	ldw	x,#0
1611  04e8 89            	pushw	x
1612  04e9 ae0000        	ldw	x,#L37
1613  04ec cd0000        	call	_assert_failed
1615  04ef 5b04          	addw	sp,#4
1616  04f1               L632:
1617                     ; 345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1619  04f1 0d08          	tnz	(OFST+7,sp)
1620  04f3 2706          	jreq	L242
1621  04f5 7b08          	ld	a,(OFST+7,sp)
1622  04f7 a122          	cp	a,#34
1623  04f9 2603          	jrne	L042
1624  04fb               L242:
1625  04fb 4f            	clr	a
1626  04fc 2010          	jra	L442
1627  04fe               L042:
1628  04fe ae0159        	ldw	x,#345
1629  0501 89            	pushw	x
1630  0502 ae0000        	ldw	x,#0
1631  0505 89            	pushw	x
1632  0506 ae0000        	ldw	x,#L37
1633  0509 cd0000        	call	_assert_failed
1635  050c 5b04          	addw	sp,#4
1636  050e               L442:
1637                     ; 346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1639  050e 7b09          	ld	a,(OFST+8,sp)
1640  0510 a155          	cp	a,#85
1641  0512 2704          	jreq	L052
1642  0514 0d09          	tnz	(OFST+8,sp)
1643  0516 2603          	jrne	L642
1644  0518               L052:
1645  0518 4f            	clr	a
1646  0519 2010          	jra	L252
1647  051b               L642:
1648  051b ae015a        	ldw	x,#346
1649  051e 89            	pushw	x
1650  051f ae0000        	ldw	x,#0
1651  0522 89            	pushw	x
1652  0523 ae0000        	ldw	x,#L37
1653  0526 cd0000        	call	_assert_failed
1655  0529 5b04          	addw	sp,#4
1656  052b               L252:
1657                     ; 349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1659  052b c6525d        	ld	a,21085
1660  052e a4cf          	and	a,#207
1661  0530 c7525d        	ld	21085,a
1662                     ; 351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1662                     ; 352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1664  0533 7b08          	ld	a,(OFST+7,sp)
1665  0535 a420          	and	a,#32
1666  0537 6b01          	ld	(OFST+0,sp),a
1667  0539 7b03          	ld	a,(OFST+2,sp)
1668  053b a410          	and	a,#16
1669  053d 1a01          	or	a,(OFST+0,sp)
1670  053f ca525d        	or	a,21085
1671  0542 c7525d        	ld	21085,a
1672                     ; 355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1672                     ; 356                             TIM1_OCMode);
1674  0545 c6525b        	ld	a,21083
1675  0548 a48f          	and	a,#143
1676  054a 1a02          	or	a,(OFST+1,sp)
1677  054c c7525b        	ld	21083,a
1678                     ; 359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1680  054f 0d09          	tnz	(OFST+8,sp)
1681  0551 270a          	jreq	L124
1682                     ; 361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1684  0553 c6526f        	ld	a,21103
1685  0556 aadf          	or	a,#223
1686  0558 c7526f        	ld	21103,a
1688  055b 2004          	jra	L324
1689  055d               L124:
1690                     ; 365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1692  055d 721d526f      	bres	21103,#6
1693  0561               L324:
1694                     ; 369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1696  0561 7b06          	ld	a,(OFST+5,sp)
1697  0563 c7526b        	ld	21099,a
1698                     ; 370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1700  0566 7b07          	ld	a,(OFST+6,sp)
1701  0568 c7526c        	ld	21100,a
1702                     ; 372 }
1705  056b 5b03          	addw	sp,#3
1706  056d 81            	ret
1910                     ; 387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1910                     ; 388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1910                     ; 389                      uint8_t TIM1_DeadTime,
1910                     ; 390                      TIM1_BreakState_TypeDef TIM1_Break,
1910                     ; 391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1910                     ; 392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1910                     ; 393 {
1911                     	switch	.text
1912  056e               _TIM1_BDTRConfig:
1914  056e 89            	pushw	x
1915  056f 88            	push	a
1916       00000001      OFST:	set	1
1919                     ; 395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1921  0570 9e            	ld	a,xh
1922  0571 a104          	cp	a,#4
1923  0573 2704          	jreq	L062
1924  0575 9e            	ld	a,xh
1925  0576 4d            	tnz	a
1926  0577 2603          	jrne	L652
1927  0579               L062:
1928  0579 4f            	clr	a
1929  057a 2010          	jra	L262
1930  057c               L652:
1931  057c ae018b        	ldw	x,#395
1932  057f 89            	pushw	x
1933  0580 ae0000        	ldw	x,#0
1934  0583 89            	pushw	x
1935  0584 ae0000        	ldw	x,#L37
1936  0587 cd0000        	call	_assert_failed
1938  058a 5b04          	addw	sp,#4
1939  058c               L262:
1940                     ; 396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1942  058c 0d03          	tnz	(OFST+2,sp)
1943  058e 2712          	jreq	L662
1944  0590 7b03          	ld	a,(OFST+2,sp)
1945  0592 a101          	cp	a,#1
1946  0594 270c          	jreq	L662
1947  0596 7b03          	ld	a,(OFST+2,sp)
1948  0598 a102          	cp	a,#2
1949  059a 2706          	jreq	L662
1950  059c 7b03          	ld	a,(OFST+2,sp)
1951  059e a103          	cp	a,#3
1952  05a0 2603          	jrne	L462
1953  05a2               L662:
1954  05a2 4f            	clr	a
1955  05a3 2010          	jra	L072
1956  05a5               L462:
1957  05a5 ae018c        	ldw	x,#396
1958  05a8 89            	pushw	x
1959  05a9 ae0000        	ldw	x,#0
1960  05ac 89            	pushw	x
1961  05ad ae0000        	ldw	x,#L37
1962  05b0 cd0000        	call	_assert_failed
1964  05b3 5b04          	addw	sp,#4
1965  05b5               L072:
1966                     ; 397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1968  05b5 7b07          	ld	a,(OFST+6,sp)
1969  05b7 a110          	cp	a,#16
1970  05b9 2704          	jreq	L472
1971  05bb 0d07          	tnz	(OFST+6,sp)
1972  05bd 2603          	jrne	L272
1973  05bf               L472:
1974  05bf 4f            	clr	a
1975  05c0 2010          	jra	L672
1976  05c2               L272:
1977  05c2 ae018d        	ldw	x,#397
1978  05c5 89            	pushw	x
1979  05c6 ae0000        	ldw	x,#0
1980  05c9 89            	pushw	x
1981  05ca ae0000        	ldw	x,#L37
1982  05cd cd0000        	call	_assert_failed
1984  05d0 5b04          	addw	sp,#4
1985  05d2               L672:
1986                     ; 398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1988  05d2 0d08          	tnz	(OFST+7,sp)
1989  05d4 2706          	jreq	L203
1990  05d6 7b08          	ld	a,(OFST+7,sp)
1991  05d8 a120          	cp	a,#32
1992  05da 2603          	jrne	L003
1993  05dc               L203:
1994  05dc 4f            	clr	a
1995  05dd 2010          	jra	L403
1996  05df               L003:
1997  05df ae018e        	ldw	x,#398
1998  05e2 89            	pushw	x
1999  05e3 ae0000        	ldw	x,#0
2000  05e6 89            	pushw	x
2001  05e7 ae0000        	ldw	x,#L37
2002  05ea cd0000        	call	_assert_failed
2004  05ed 5b04          	addw	sp,#4
2005  05ef               L403:
2006                     ; 399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2008  05ef 7b09          	ld	a,(OFST+8,sp)
2009  05f1 a140          	cp	a,#64
2010  05f3 2704          	jreq	L013
2011  05f5 0d09          	tnz	(OFST+8,sp)
2012  05f7 2603          	jrne	L603
2013  05f9               L013:
2014  05f9 4f            	clr	a
2015  05fa 2010          	jra	L213
2016  05fc               L603:
2017  05fc ae018f        	ldw	x,#399
2018  05ff 89            	pushw	x
2019  0600 ae0000        	ldw	x,#0
2020  0603 89            	pushw	x
2021  0604 ae0000        	ldw	x,#L37
2022  0607 cd0000        	call	_assert_failed
2024  060a 5b04          	addw	sp,#4
2025  060c               L213:
2026                     ; 401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2028  060c 7b06          	ld	a,(OFST+5,sp)
2029  060e c7526e        	ld	21102,a
2030                     ; 405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2030                     ; 406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2030                     ; 407                             (uint8_t)TIM1_AutomaticOutput));
2032  0611 7b07          	ld	a,(OFST+6,sp)
2033  0613 1a08          	or	a,(OFST+7,sp)
2034  0615 1a09          	or	a,(OFST+8,sp)
2035  0617 6b01          	ld	(OFST+0,sp),a
2036  0619 7b02          	ld	a,(OFST+1,sp)
2037  061b 1a03          	or	a,(OFST+2,sp)
2038  061d 1a01          	or	a,(OFST+0,sp)
2039  061f c7526d        	ld	21101,a
2040                     ; 409 }
2043  0622 5b03          	addw	sp,#3
2044  0624 81            	ret
2245                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2245                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2245                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2245                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2245                     ; 427                  uint8_t TIM1_ICFilter)
2245                     ; 428 {
2246                     	switch	.text
2247  0625               _TIM1_ICInit:
2249  0625 89            	pushw	x
2250       00000000      OFST:	set	0
2253                     ; 431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2255  0626 9e            	ld	a,xh
2256  0627 4d            	tnz	a
2257  0628 270f          	jreq	L023
2258  062a 9e            	ld	a,xh
2259  062b a101          	cp	a,#1
2260  062d 270a          	jreq	L023
2261  062f 9e            	ld	a,xh
2262  0630 a102          	cp	a,#2
2263  0632 2705          	jreq	L023
2264  0634 9e            	ld	a,xh
2265  0635 a103          	cp	a,#3
2266  0637 2603          	jrne	L613
2267  0639               L023:
2268  0639 4f            	clr	a
2269  063a 2010          	jra	L223
2270  063c               L613:
2271  063c ae01af        	ldw	x,#431
2272  063f 89            	pushw	x
2273  0640 ae0000        	ldw	x,#0
2274  0643 89            	pushw	x
2275  0644 ae0000        	ldw	x,#L37
2276  0647 cd0000        	call	_assert_failed
2278  064a 5b04          	addw	sp,#4
2279  064c               L223:
2280                     ; 432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2282  064c 0d02          	tnz	(OFST+2,sp)
2283  064e 2706          	jreq	L623
2284  0650 7b02          	ld	a,(OFST+2,sp)
2285  0652 a101          	cp	a,#1
2286  0654 2603          	jrne	L423
2287  0656               L623:
2288  0656 4f            	clr	a
2289  0657 2010          	jra	L033
2290  0659               L423:
2291  0659 ae01b0        	ldw	x,#432
2292  065c 89            	pushw	x
2293  065d ae0000        	ldw	x,#0
2294  0660 89            	pushw	x
2295  0661 ae0000        	ldw	x,#L37
2296  0664 cd0000        	call	_assert_failed
2298  0667 5b04          	addw	sp,#4
2299  0669               L033:
2300                     ; 433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2302  0669 7b05          	ld	a,(OFST+5,sp)
2303  066b a101          	cp	a,#1
2304  066d 270c          	jreq	L433
2305  066f 7b05          	ld	a,(OFST+5,sp)
2306  0671 a102          	cp	a,#2
2307  0673 2706          	jreq	L433
2308  0675 7b05          	ld	a,(OFST+5,sp)
2309  0677 a103          	cp	a,#3
2310  0679 2603          	jrne	L233
2311  067b               L433:
2312  067b 4f            	clr	a
2313  067c 2010          	jra	L633
2314  067e               L233:
2315  067e ae01b1        	ldw	x,#433
2316  0681 89            	pushw	x
2317  0682 ae0000        	ldw	x,#0
2318  0685 89            	pushw	x
2319  0686 ae0000        	ldw	x,#L37
2320  0689 cd0000        	call	_assert_failed
2322  068c 5b04          	addw	sp,#4
2323  068e               L633:
2324                     ; 434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2326  068e 0d06          	tnz	(OFST+6,sp)
2327  0690 2712          	jreq	L243
2328  0692 7b06          	ld	a,(OFST+6,sp)
2329  0694 a104          	cp	a,#4
2330  0696 270c          	jreq	L243
2331  0698 7b06          	ld	a,(OFST+6,sp)
2332  069a a108          	cp	a,#8
2333  069c 2706          	jreq	L243
2334  069e 7b06          	ld	a,(OFST+6,sp)
2335  06a0 a10c          	cp	a,#12
2336  06a2 2603          	jrne	L043
2337  06a4               L243:
2338  06a4 4f            	clr	a
2339  06a5 2010          	jra	L443
2340  06a7               L043:
2341  06a7 ae01b2        	ldw	x,#434
2342  06aa 89            	pushw	x
2343  06ab ae0000        	ldw	x,#0
2344  06ae 89            	pushw	x
2345  06af ae0000        	ldw	x,#L37
2346  06b2 cd0000        	call	_assert_failed
2348  06b5 5b04          	addw	sp,#4
2349  06b7               L443:
2350                     ; 435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2352  06b7 7b07          	ld	a,(OFST+7,sp)
2353  06b9 a110          	cp	a,#16
2354  06bb 2403          	jruge	L643
2355  06bd 4f            	clr	a
2356  06be 2010          	jra	L053
2357  06c0               L643:
2358  06c0 ae01b3        	ldw	x,#435
2359  06c3 89            	pushw	x
2360  06c4 ae0000        	ldw	x,#0
2361  06c7 89            	pushw	x
2362  06c8 ae0000        	ldw	x,#L37
2363  06cb cd0000        	call	_assert_failed
2365  06ce 5b04          	addw	sp,#4
2366  06d0               L053:
2367                     ; 437     if (TIM1_Channel == TIM1_CHANNEL_1)
2369  06d0 0d01          	tnz	(OFST+1,sp)
2370  06d2 2614          	jrne	L746
2371                     ; 440         TI1_Config((uint8_t)TIM1_ICPolarity,
2371                     ; 441                    (uint8_t)TIM1_ICSelection,
2371                     ; 442                    (uint8_t)TIM1_ICFilter);
2373  06d4 7b07          	ld	a,(OFST+7,sp)
2374  06d6 88            	push	a
2375  06d7 7b06          	ld	a,(OFST+6,sp)
2376  06d9 97            	ld	xl,a
2377  06da 7b03          	ld	a,(OFST+3,sp)
2378  06dc 95            	ld	xh,a
2379  06dd cd150c        	call	L3_TI1_Config
2381  06e0 84            	pop	a
2382                     ; 444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2384  06e1 7b06          	ld	a,(OFST+6,sp)
2385  06e3 cd126b        	call	_TIM1_SetIC1Prescaler
2388  06e6 2046          	jra	L156
2389  06e8               L746:
2390                     ; 446     else if (TIM1_Channel == TIM1_CHANNEL_2)
2392  06e8 7b01          	ld	a,(OFST+1,sp)
2393  06ea a101          	cp	a,#1
2394  06ec 2614          	jrne	L356
2395                     ; 449         TI2_Config((uint8_t)TIM1_ICPolarity,
2395                     ; 450                    (uint8_t)TIM1_ICSelection,
2395                     ; 451                    (uint8_t)TIM1_ICFilter);
2397  06ee 7b07          	ld	a,(OFST+7,sp)
2398  06f0 88            	push	a
2399  06f1 7b06          	ld	a,(OFST+6,sp)
2400  06f3 97            	ld	xl,a
2401  06f4 7b03          	ld	a,(OFST+3,sp)
2402  06f6 95            	ld	xh,a
2403  06f7 cd153c        	call	L5_TI2_Config
2405  06fa 84            	pop	a
2406                     ; 453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2408  06fb 7b06          	ld	a,(OFST+6,sp)
2409  06fd cd129a        	call	_TIM1_SetIC2Prescaler
2412  0700 202c          	jra	L156
2413  0702               L356:
2414                     ; 455     else if (TIM1_Channel == TIM1_CHANNEL_3)
2416  0702 7b01          	ld	a,(OFST+1,sp)
2417  0704 a102          	cp	a,#2
2418  0706 2614          	jrne	L756
2419                     ; 458         TI3_Config((uint8_t)TIM1_ICPolarity,
2419                     ; 459                    (uint8_t)TIM1_ICSelection,
2419                     ; 460                    (uint8_t)TIM1_ICFilter);
2421  0708 7b07          	ld	a,(OFST+7,sp)
2422  070a 88            	push	a
2423  070b 7b06          	ld	a,(OFST+6,sp)
2424  070d 97            	ld	xl,a
2425  070e 7b03          	ld	a,(OFST+3,sp)
2426  0710 95            	ld	xh,a
2427  0711 cd156c        	call	L7_TI3_Config
2429  0714 84            	pop	a
2430                     ; 462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2432  0715 7b06          	ld	a,(OFST+6,sp)
2433  0717 cd12c9        	call	_TIM1_SetIC3Prescaler
2436  071a 2012          	jra	L156
2437  071c               L756:
2438                     ; 467         TI4_Config((uint8_t)TIM1_ICPolarity,
2438                     ; 468                    (uint8_t)TIM1_ICSelection,
2438                     ; 469                    (uint8_t)TIM1_ICFilter);
2440  071c 7b07          	ld	a,(OFST+7,sp)
2441  071e 88            	push	a
2442  071f 7b06          	ld	a,(OFST+6,sp)
2443  0721 97            	ld	xl,a
2444  0722 7b03          	ld	a,(OFST+3,sp)
2445  0724 95            	ld	xh,a
2446  0725 cd159c        	call	L11_TI4_Config
2448  0728 84            	pop	a
2449                     ; 471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2451  0729 7b06          	ld	a,(OFST+6,sp)
2452  072b cd12f8        	call	_TIM1_SetIC4Prescaler
2454  072e               L156:
2455                     ; 474 }
2458  072e 85            	popw	x
2459  072f 81            	ret
2550                     ; 490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2550                     ; 491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2550                     ; 492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2550                     ; 493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2550                     ; 494                      uint8_t TIM1_ICFilter)
2550                     ; 495 {
2551                     	switch	.text
2552  0730               _TIM1_PWMIConfig:
2554  0730 89            	pushw	x
2555  0731 89            	pushw	x
2556       00000002      OFST:	set	2
2559                     ; 496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2561                     ; 497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2563                     ; 500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2565  0732 9e            	ld	a,xh
2566  0733 4d            	tnz	a
2567  0734 2705          	jreq	L653
2568  0736 9e            	ld	a,xh
2569  0737 a101          	cp	a,#1
2570  0739 2603          	jrne	L453
2571  073b               L653:
2572  073b 4f            	clr	a
2573  073c 2010          	jra	L063
2574  073e               L453:
2575  073e ae01f4        	ldw	x,#500
2576  0741 89            	pushw	x
2577  0742 ae0000        	ldw	x,#0
2578  0745 89            	pushw	x
2579  0746 ae0000        	ldw	x,#L37
2580  0749 cd0000        	call	_assert_failed
2582  074c 5b04          	addw	sp,#4
2583  074e               L063:
2584                     ; 501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2586  074e 0d04          	tnz	(OFST+2,sp)
2587  0750 2706          	jreq	L463
2588  0752 7b04          	ld	a,(OFST+2,sp)
2589  0754 a101          	cp	a,#1
2590  0756 2603          	jrne	L263
2591  0758               L463:
2592  0758 4f            	clr	a
2593  0759 2010          	jra	L663
2594  075b               L263:
2595  075b ae01f5        	ldw	x,#501
2596  075e 89            	pushw	x
2597  075f ae0000        	ldw	x,#0
2598  0762 89            	pushw	x
2599  0763 ae0000        	ldw	x,#L37
2600  0766 cd0000        	call	_assert_failed
2602  0769 5b04          	addw	sp,#4
2603  076b               L663:
2604                     ; 502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2606  076b 7b07          	ld	a,(OFST+5,sp)
2607  076d a101          	cp	a,#1
2608  076f 270c          	jreq	L273
2609  0771 7b07          	ld	a,(OFST+5,sp)
2610  0773 a102          	cp	a,#2
2611  0775 2706          	jreq	L273
2612  0777 7b07          	ld	a,(OFST+5,sp)
2613  0779 a103          	cp	a,#3
2614  077b 2603          	jrne	L073
2615  077d               L273:
2616  077d 4f            	clr	a
2617  077e 2010          	jra	L473
2618  0780               L073:
2619  0780 ae01f6        	ldw	x,#502
2620  0783 89            	pushw	x
2621  0784 ae0000        	ldw	x,#0
2622  0787 89            	pushw	x
2623  0788 ae0000        	ldw	x,#L37
2624  078b cd0000        	call	_assert_failed
2626  078e 5b04          	addw	sp,#4
2627  0790               L473:
2628                     ; 503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2630  0790 0d08          	tnz	(OFST+6,sp)
2631  0792 2712          	jreq	L004
2632  0794 7b08          	ld	a,(OFST+6,sp)
2633  0796 a104          	cp	a,#4
2634  0798 270c          	jreq	L004
2635  079a 7b08          	ld	a,(OFST+6,sp)
2636  079c a108          	cp	a,#8
2637  079e 2706          	jreq	L004
2638  07a0 7b08          	ld	a,(OFST+6,sp)
2639  07a2 a10c          	cp	a,#12
2640  07a4 2603          	jrne	L673
2641  07a6               L004:
2642  07a6 4f            	clr	a
2643  07a7 2010          	jra	L204
2644  07a9               L673:
2645  07a9 ae01f7        	ldw	x,#503
2646  07ac 89            	pushw	x
2647  07ad ae0000        	ldw	x,#0
2648  07b0 89            	pushw	x
2649  07b1 ae0000        	ldw	x,#L37
2650  07b4 cd0000        	call	_assert_failed
2652  07b7 5b04          	addw	sp,#4
2653  07b9               L204:
2654                     ; 506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2656  07b9 7b04          	ld	a,(OFST+2,sp)
2657  07bb a101          	cp	a,#1
2658  07bd 2706          	jreq	L327
2659                     ; 508         icpolarity = TIM1_ICPOLARITY_FALLING;
2661  07bf a601          	ld	a,#1
2662  07c1 6b01          	ld	(OFST-1,sp),a
2664  07c3 2002          	jra	L527
2665  07c5               L327:
2666                     ; 512         icpolarity = TIM1_ICPOLARITY_RISING;
2668  07c5 0f01          	clr	(OFST-1,sp)
2669  07c7               L527:
2670                     ; 516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2672  07c7 7b07          	ld	a,(OFST+5,sp)
2673  07c9 a101          	cp	a,#1
2674  07cb 2606          	jrne	L727
2675                     ; 518         icselection = TIM1_ICSELECTION_INDIRECTTI;
2677  07cd a602          	ld	a,#2
2678  07cf 6b02          	ld	(OFST+0,sp),a
2680  07d1 2004          	jra	L137
2681  07d3               L727:
2682                     ; 522         icselection = TIM1_ICSELECTION_DIRECTTI;
2684  07d3 a601          	ld	a,#1
2685  07d5 6b02          	ld	(OFST+0,sp),a
2686  07d7               L137:
2687                     ; 525     if (TIM1_Channel == TIM1_CHANNEL_1)
2689  07d7 0d03          	tnz	(OFST+1,sp)
2690  07d9 2626          	jrne	L337
2691                     ; 528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2691                     ; 529                    (uint8_t)TIM1_ICFilter);
2693  07db 7b09          	ld	a,(OFST+7,sp)
2694  07dd 88            	push	a
2695  07de 7b08          	ld	a,(OFST+6,sp)
2696  07e0 97            	ld	xl,a
2697  07e1 7b05          	ld	a,(OFST+3,sp)
2698  07e3 95            	ld	xh,a
2699  07e4 cd150c        	call	L3_TI1_Config
2701  07e7 84            	pop	a
2702                     ; 532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2704  07e8 7b08          	ld	a,(OFST+6,sp)
2705  07ea cd126b        	call	_TIM1_SetIC1Prescaler
2707                     ; 535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2709  07ed 7b09          	ld	a,(OFST+7,sp)
2710  07ef 88            	push	a
2711  07f0 7b03          	ld	a,(OFST+1,sp)
2712  07f2 97            	ld	xl,a
2713  07f3 7b02          	ld	a,(OFST+0,sp)
2714  07f5 95            	ld	xh,a
2715  07f6 cd153c        	call	L5_TI2_Config
2717  07f9 84            	pop	a
2718                     ; 538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2720  07fa 7b08          	ld	a,(OFST+6,sp)
2721  07fc cd129a        	call	_TIM1_SetIC2Prescaler
2724  07ff 2024          	jra	L537
2725  0801               L337:
2726                     ; 543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2726                     ; 544                    (uint8_t)TIM1_ICFilter);
2728  0801 7b09          	ld	a,(OFST+7,sp)
2729  0803 88            	push	a
2730  0804 7b08          	ld	a,(OFST+6,sp)
2731  0806 97            	ld	xl,a
2732  0807 7b05          	ld	a,(OFST+3,sp)
2733  0809 95            	ld	xh,a
2734  080a cd153c        	call	L5_TI2_Config
2736  080d 84            	pop	a
2737                     ; 547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2739  080e 7b08          	ld	a,(OFST+6,sp)
2740  0810 cd129a        	call	_TIM1_SetIC2Prescaler
2742                     ; 550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2744  0813 7b09          	ld	a,(OFST+7,sp)
2745  0815 88            	push	a
2746  0816 7b03          	ld	a,(OFST+1,sp)
2747  0818 97            	ld	xl,a
2748  0819 7b02          	ld	a,(OFST+0,sp)
2749  081b 95            	ld	xh,a
2750  081c cd150c        	call	L3_TI1_Config
2752  081f 84            	pop	a
2753                     ; 553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2755  0820 7b08          	ld	a,(OFST+6,sp)
2756  0822 cd126b        	call	_TIM1_SetIC1Prescaler
2758  0825               L537:
2759                     ; 555 }
2762  0825 5b04          	addw	sp,#4
2763  0827 81            	ret
2819                     ; 563 void TIM1_Cmd(FunctionalState NewState)
2819                     ; 564 {
2820                     	switch	.text
2821  0828               _TIM1_Cmd:
2823  0828 88            	push	a
2824       00000000      OFST:	set	0
2827                     ; 566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2829  0829 4d            	tnz	a
2830  082a 2704          	jreq	L014
2831  082c a101          	cp	a,#1
2832  082e 2603          	jrne	L604
2833  0830               L014:
2834  0830 4f            	clr	a
2835  0831 2010          	jra	L214
2836  0833               L604:
2837  0833 ae0236        	ldw	x,#566
2838  0836 89            	pushw	x
2839  0837 ae0000        	ldw	x,#0
2840  083a 89            	pushw	x
2841  083b ae0000        	ldw	x,#L37
2842  083e cd0000        	call	_assert_failed
2844  0841 5b04          	addw	sp,#4
2845  0843               L214:
2846                     ; 569     if (NewState != DISABLE)
2848  0843 0d01          	tnz	(OFST+1,sp)
2849  0845 2706          	jreq	L567
2850                     ; 571         TIM1->CR1 |= TIM1_CR1_CEN;
2852  0847 72105250      	bset	21072,#0
2854  084b 2004          	jra	L767
2855  084d               L567:
2856                     ; 575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2858  084d 72115250      	bres	21072,#0
2859  0851               L767:
2860                     ; 577 }
2863  0851 84            	pop	a
2864  0852 81            	ret
2901                     ; 585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2901                     ; 586 {
2902                     	switch	.text
2903  0853               _TIM1_CtrlPWMOutputs:
2905  0853 88            	push	a
2906       00000000      OFST:	set	0
2909                     ; 588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2911  0854 4d            	tnz	a
2912  0855 2704          	jreq	L024
2913  0857 a101          	cp	a,#1
2914  0859 2603          	jrne	L614
2915  085b               L024:
2916  085b 4f            	clr	a
2917  085c 2010          	jra	L224
2918  085e               L614:
2919  085e ae024c        	ldw	x,#588
2920  0861 89            	pushw	x
2921  0862 ae0000        	ldw	x,#0
2922  0865 89            	pushw	x
2923  0866 ae0000        	ldw	x,#L37
2924  0869 cd0000        	call	_assert_failed
2926  086c 5b04          	addw	sp,#4
2927  086e               L224:
2928                     ; 592     if (NewState != DISABLE)
2930  086e 0d01          	tnz	(OFST+1,sp)
2931  0870 2706          	jreq	L7001
2932                     ; 594         TIM1->BKR |= TIM1_BKR_MOE;
2934  0872 721e526d      	bset	21101,#7
2936  0876 2004          	jra	L1101
2937  0878               L7001:
2938                     ; 598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2940  0878 721f526d      	bres	21101,#7
2941  087c               L1101:
2942                     ; 600 }
2945  087c 84            	pop	a
2946  087d 81            	ret
3054                     ; 619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3054                     ; 620 {
3055                     	switch	.text
3056  087e               _TIM1_ITConfig:
3058  087e 89            	pushw	x
3059       00000000      OFST:	set	0
3062                     ; 622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
3064  087f 9e            	ld	a,xh
3065  0880 4d            	tnz	a
3066  0881 2703          	jreq	L624
3067  0883 4f            	clr	a
3068  0884 2010          	jra	L034
3069  0886               L624:
3070  0886 ae026e        	ldw	x,#622
3071  0889 89            	pushw	x
3072  088a ae0000        	ldw	x,#0
3073  088d 89            	pushw	x
3074  088e ae0000        	ldw	x,#L37
3075  0891 cd0000        	call	_assert_failed
3077  0894 5b04          	addw	sp,#4
3078  0896               L034:
3079                     ; 623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3081  0896 0d02          	tnz	(OFST+2,sp)
3082  0898 2706          	jreq	L434
3083  089a 7b02          	ld	a,(OFST+2,sp)
3084  089c a101          	cp	a,#1
3085  089e 2603          	jrne	L234
3086  08a0               L434:
3087  08a0 4f            	clr	a
3088  08a1 2010          	jra	L634
3089  08a3               L234:
3090  08a3 ae026f        	ldw	x,#623
3091  08a6 89            	pushw	x
3092  08a7 ae0000        	ldw	x,#0
3093  08aa 89            	pushw	x
3094  08ab ae0000        	ldw	x,#L37
3095  08ae cd0000        	call	_assert_failed
3097  08b1 5b04          	addw	sp,#4
3098  08b3               L634:
3099                     ; 625     if (NewState != DISABLE)
3101  08b3 0d02          	tnz	(OFST+2,sp)
3102  08b5 270a          	jreq	L1601
3103                     ; 628         TIM1->IER |= (uint8_t)TIM1_IT;
3105  08b7 c65254        	ld	a,21076
3106  08ba 1a01          	or	a,(OFST+1,sp)
3107  08bc c75254        	ld	21076,a
3109  08bf 2009          	jra	L3601
3110  08c1               L1601:
3111                     ; 633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3113  08c1 7b01          	ld	a,(OFST+1,sp)
3114  08c3 43            	cpl	a
3115  08c4 c45254        	and	a,21076
3116  08c7 c75254        	ld	21076,a
3117  08ca               L3601:
3118                     ; 635 }
3121  08ca 85            	popw	x
3122  08cb 81            	ret
3146                     ; 642 void TIM1_InternalClockConfig(void)
3146                     ; 643 {
3147                     	switch	.text
3148  08cc               _TIM1_InternalClockConfig:
3152                     ; 645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3154  08cc c65252        	ld	a,21074
3155  08cf a4f8          	and	a,#248
3156  08d1 c75252        	ld	21074,a
3157                     ; 646 }
3160  08d4 81            	ret
3276                     ; 664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3276                     ; 665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3276                     ; 666                               uint8_t ExtTRGFilter)
3276                     ; 667 {
3277                     	switch	.text
3278  08d5               _TIM1_ETRClockMode1Config:
3280  08d5 89            	pushw	x
3281       00000000      OFST:	set	0
3284                     ; 669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3286  08d6 9e            	ld	a,xh
3287  08d7 4d            	tnz	a
3288  08d8 270f          	jreq	L644
3289  08da 9e            	ld	a,xh
3290  08db a110          	cp	a,#16
3291  08dd 270a          	jreq	L644
3292  08df 9e            	ld	a,xh
3293  08e0 a120          	cp	a,#32
3294  08e2 2705          	jreq	L644
3295  08e4 9e            	ld	a,xh
3296  08e5 a130          	cp	a,#48
3297  08e7 2603          	jrne	L444
3298  08e9               L644:
3299  08e9 4f            	clr	a
3300  08ea 2010          	jra	L054
3301  08ec               L444:
3302  08ec ae029d        	ldw	x,#669
3303  08ef 89            	pushw	x
3304  08f0 ae0000        	ldw	x,#0
3305  08f3 89            	pushw	x
3306  08f4 ae0000        	ldw	x,#L37
3307  08f7 cd0000        	call	_assert_failed
3309  08fa 5b04          	addw	sp,#4
3310  08fc               L054:
3311                     ; 670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3313  08fc 7b02          	ld	a,(OFST+2,sp)
3314  08fe a180          	cp	a,#128
3315  0900 2704          	jreq	L454
3316  0902 0d02          	tnz	(OFST+2,sp)
3317  0904 2603          	jrne	L254
3318  0906               L454:
3319  0906 4f            	clr	a
3320  0907 2010          	jra	L654
3321  0909               L254:
3322  0909 ae029e        	ldw	x,#670
3323  090c 89            	pushw	x
3324  090d ae0000        	ldw	x,#0
3325  0910 89            	pushw	x
3326  0911 ae0000        	ldw	x,#L37
3327  0914 cd0000        	call	_assert_failed
3329  0917 5b04          	addw	sp,#4
3330  0919               L654:
3331                     ; 673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3333  0919 7b05          	ld	a,(OFST+5,sp)
3334  091b 88            	push	a
3335  091c 7b03          	ld	a,(OFST+3,sp)
3336  091e 97            	ld	xl,a
3337  091f 7b02          	ld	a,(OFST+2,sp)
3338  0921 95            	ld	xh,a
3339  0922 ad63          	call	_TIM1_ETRConfig
3341  0924 84            	pop	a
3342                     ; 676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3342                     ; 677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3344  0925 c65252        	ld	a,21074
3345  0928 a488          	and	a,#136
3346  092a aa77          	or	a,#119
3347  092c c75252        	ld	21074,a
3348                     ; 678 }
3351  092f 85            	popw	x
3352  0930 81            	ret
3409                     ; 696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3409                     ; 697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3409                     ; 698                               uint8_t ExtTRGFilter)
3409                     ; 699 {
3410                     	switch	.text
3411  0931               _TIM1_ETRClockMode2Config:
3413  0931 89            	pushw	x
3414       00000000      OFST:	set	0
3417                     ; 701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3419  0932 9e            	ld	a,xh
3420  0933 4d            	tnz	a
3421  0934 270f          	jreq	L464
3422  0936 9e            	ld	a,xh
3423  0937 a110          	cp	a,#16
3424  0939 270a          	jreq	L464
3425  093b 9e            	ld	a,xh
3426  093c a120          	cp	a,#32
3427  093e 2705          	jreq	L464
3428  0940 9e            	ld	a,xh
3429  0941 a130          	cp	a,#48
3430  0943 2603          	jrne	L264
3431  0945               L464:
3432  0945 4f            	clr	a
3433  0946 2010          	jra	L664
3434  0948               L264:
3435  0948 ae02bd        	ldw	x,#701
3436  094b 89            	pushw	x
3437  094c ae0000        	ldw	x,#0
3438  094f 89            	pushw	x
3439  0950 ae0000        	ldw	x,#L37
3440  0953 cd0000        	call	_assert_failed
3442  0956 5b04          	addw	sp,#4
3443  0958               L664:
3444                     ; 702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3446  0958 7b02          	ld	a,(OFST+2,sp)
3447  095a a180          	cp	a,#128
3448  095c 2704          	jreq	L274
3449  095e 0d02          	tnz	(OFST+2,sp)
3450  0960 2603          	jrne	L074
3451  0962               L274:
3452  0962 4f            	clr	a
3453  0963 2010          	jra	L474
3454  0965               L074:
3455  0965 ae02be        	ldw	x,#702
3456  0968 89            	pushw	x
3457  0969 ae0000        	ldw	x,#0
3458  096c 89            	pushw	x
3459  096d ae0000        	ldw	x,#L37
3460  0970 cd0000        	call	_assert_failed
3462  0973 5b04          	addw	sp,#4
3463  0975               L474:
3464                     ; 705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3466  0975 7b05          	ld	a,(OFST+5,sp)
3467  0977 88            	push	a
3468  0978 7b03          	ld	a,(OFST+3,sp)
3469  097a 97            	ld	xl,a
3470  097b 7b02          	ld	a,(OFST+2,sp)
3471  097d 95            	ld	xh,a
3472  097e ad07          	call	_TIM1_ETRConfig
3474  0980 84            	pop	a
3475                     ; 708     TIM1->ETR |= TIM1_ETR_ECE;
3477  0981 721c5253      	bset	21075,#6
3478                     ; 709 }
3481  0985 85            	popw	x
3482  0986 81            	ret
3537                     ; 727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3537                     ; 728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3537                     ; 729                     uint8_t ExtTRGFilter)
3537                     ; 730 {
3538                     	switch	.text
3539  0987               _TIM1_ETRConfig:
3541  0987 89            	pushw	x
3542       00000000      OFST:	set	0
3545                     ; 732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3547  0988 7b05          	ld	a,(OFST+5,sp)
3548  098a a110          	cp	a,#16
3549  098c 2403          	jruge	L005
3550  098e 4f            	clr	a
3551  098f 2010          	jra	L205
3552  0991               L005:
3553  0991 ae02dc        	ldw	x,#732
3554  0994 89            	pushw	x
3555  0995 ae0000        	ldw	x,#0
3556  0998 89            	pushw	x
3557  0999 ae0000        	ldw	x,#L37
3558  099c cd0000        	call	_assert_failed
3560  099f 5b04          	addw	sp,#4
3561  09a1               L205:
3562                     ; 734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3562                     ; 735                       (uint8_t)ExtTRGFilter );
3564  09a1 7b01          	ld	a,(OFST+1,sp)
3565  09a3 1a02          	or	a,(OFST+2,sp)
3566  09a5 1a05          	or	a,(OFST+5,sp)
3567  09a7 ca5253        	or	a,21075
3568  09aa c75253        	ld	21075,a
3569                     ; 736 }
3572  09ad 85            	popw	x
3573  09ae 81            	ret
3661                     ; 753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3661                     ; 754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3661                     ; 755                                  uint8_t ICFilter)
3661                     ; 756 {
3662                     	switch	.text
3663  09af               _TIM1_TIxExternalClockConfig:
3665  09af 89            	pushw	x
3666       00000000      OFST:	set	0
3669                     ; 758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3671  09b0 9e            	ld	a,xh
3672  09b1 a140          	cp	a,#64
3673  09b3 270a          	jreq	L015
3674  09b5 9e            	ld	a,xh
3675  09b6 a160          	cp	a,#96
3676  09b8 2705          	jreq	L015
3677  09ba 9e            	ld	a,xh
3678  09bb a150          	cp	a,#80
3679  09bd 2603          	jrne	L605
3680  09bf               L015:
3681  09bf 4f            	clr	a
3682  09c0 2010          	jra	L215
3683  09c2               L605:
3684  09c2 ae02f6        	ldw	x,#758
3685  09c5 89            	pushw	x
3686  09c6 ae0000        	ldw	x,#0
3687  09c9 89            	pushw	x
3688  09ca ae0000        	ldw	x,#L37
3689  09cd cd0000        	call	_assert_failed
3691  09d0 5b04          	addw	sp,#4
3692  09d2               L215:
3693                     ; 759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3695  09d2 0d02          	tnz	(OFST+2,sp)
3696  09d4 2706          	jreq	L615
3697  09d6 7b02          	ld	a,(OFST+2,sp)
3698  09d8 a101          	cp	a,#1
3699  09da 2603          	jrne	L415
3700  09dc               L615:
3701  09dc 4f            	clr	a
3702  09dd 2010          	jra	L025
3703  09df               L415:
3704  09df ae02f7        	ldw	x,#759
3705  09e2 89            	pushw	x
3706  09e3 ae0000        	ldw	x,#0
3707  09e6 89            	pushw	x
3708  09e7 ae0000        	ldw	x,#L37
3709  09ea cd0000        	call	_assert_failed
3711  09ed 5b04          	addw	sp,#4
3712  09ef               L025:
3713                     ; 760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3715  09ef 7b05          	ld	a,(OFST+5,sp)
3716  09f1 a110          	cp	a,#16
3717  09f3 2403          	jruge	L225
3718  09f5 4f            	clr	a
3719  09f6 2010          	jra	L425
3720  09f8               L225:
3721  09f8 ae02f8        	ldw	x,#760
3722  09fb 89            	pushw	x
3723  09fc ae0000        	ldw	x,#0
3724  09ff 89            	pushw	x
3725  0a00 ae0000        	ldw	x,#L37
3726  0a03 cd0000        	call	_assert_failed
3728  0a06 5b04          	addw	sp,#4
3729  0a08               L425:
3730                     ; 763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3732  0a08 7b01          	ld	a,(OFST+1,sp)
3733  0a0a a160          	cp	a,#96
3734  0a0c 260f          	jrne	L3521
3735                     ; 765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3737  0a0e 7b05          	ld	a,(OFST+5,sp)
3738  0a10 88            	push	a
3739  0a11 ae0001        	ldw	x,#1
3740  0a14 7b03          	ld	a,(OFST+3,sp)
3741  0a16 95            	ld	xh,a
3742  0a17 cd153c        	call	L5_TI2_Config
3744  0a1a 84            	pop	a
3746  0a1b 200d          	jra	L5521
3747  0a1d               L3521:
3748                     ; 769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3750  0a1d 7b05          	ld	a,(OFST+5,sp)
3751  0a1f 88            	push	a
3752  0a20 ae0001        	ldw	x,#1
3753  0a23 7b03          	ld	a,(OFST+3,sp)
3754  0a25 95            	ld	xh,a
3755  0a26 cd150c        	call	L3_TI1_Config
3757  0a29 84            	pop	a
3758  0a2a               L5521:
3759                     ; 773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3761  0a2a 7b01          	ld	a,(OFST+1,sp)
3762  0a2c ad0a          	call	_TIM1_SelectInputTrigger
3764                     ; 776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3766  0a2e c65252        	ld	a,21074
3767  0a31 aa07          	or	a,#7
3768  0a33 c75252        	ld	21074,a
3769                     ; 777 }
3772  0a36 85            	popw	x
3773  0a37 81            	ret
3859                     ; 789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3859                     ; 790 {
3860                     	switch	.text
3861  0a38               _TIM1_SelectInputTrigger:
3863  0a38 88            	push	a
3864       00000000      OFST:	set	0
3867                     ; 792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3869  0a39 a140          	cp	a,#64
3870  0a3b 2713          	jreq	L235
3871  0a3d a150          	cp	a,#80
3872  0a3f 270f          	jreq	L235
3873  0a41 a160          	cp	a,#96
3874  0a43 270b          	jreq	L235
3875  0a45 a170          	cp	a,#112
3876  0a47 2707          	jreq	L235
3877  0a49 a130          	cp	a,#48
3878  0a4b 2703          	jreq	L235
3879  0a4d 4d            	tnz	a
3880  0a4e 2603          	jrne	L035
3881  0a50               L235:
3882  0a50 4f            	clr	a
3883  0a51 2010          	jra	L435
3884  0a53               L035:
3885  0a53 ae0318        	ldw	x,#792
3886  0a56 89            	pushw	x
3887  0a57 ae0000        	ldw	x,#0
3888  0a5a 89            	pushw	x
3889  0a5b ae0000        	ldw	x,#L37
3890  0a5e cd0000        	call	_assert_failed
3892  0a61 5b04          	addw	sp,#4
3893  0a63               L435:
3894                     ; 795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3896  0a63 c65252        	ld	a,21074
3897  0a66 a48f          	and	a,#143
3898  0a68 1a01          	or	a,(OFST+1,sp)
3899  0a6a c75252        	ld	21074,a
3900                     ; 796 }
3903  0a6d 84            	pop	a
3904  0a6e 81            	ret
3941                     ; 806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3941                     ; 807 {
3942                     	switch	.text
3943  0a6f               _TIM1_UpdateDisableConfig:
3945  0a6f 88            	push	a
3946       00000000      OFST:	set	0
3949                     ; 809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3951  0a70 4d            	tnz	a
3952  0a71 2704          	jreq	L245
3953  0a73 a101          	cp	a,#1
3954  0a75 2603          	jrne	L045
3955  0a77               L245:
3956  0a77 4f            	clr	a
3957  0a78 2010          	jra	L445
3958  0a7a               L045:
3959  0a7a ae0329        	ldw	x,#809
3960  0a7d 89            	pushw	x
3961  0a7e ae0000        	ldw	x,#0
3962  0a81 89            	pushw	x
3963  0a82 ae0000        	ldw	x,#L37
3964  0a85 cd0000        	call	_assert_failed
3966  0a88 5b04          	addw	sp,#4
3967  0a8a               L445:
3968                     ; 812     if (NewState != DISABLE)
3970  0a8a 0d01          	tnz	(OFST+1,sp)
3971  0a8c 2706          	jreq	L3331
3972                     ; 814         TIM1->CR1 |= TIM1_CR1_UDIS;
3974  0a8e 72125250      	bset	21072,#1
3976  0a92 2004          	jra	L5331
3977  0a94               L3331:
3978                     ; 818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
3980  0a94 72135250      	bres	21072,#1
3981  0a98               L5331:
3982                     ; 820 }
3985  0a98 84            	pop	a
3986  0a99 81            	ret
4045                     ; 830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4045                     ; 831 {
4046                     	switch	.text
4047  0a9a               _TIM1_UpdateRequestConfig:
4049  0a9a 88            	push	a
4050       00000000      OFST:	set	0
4053                     ; 833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4055  0a9b 4d            	tnz	a
4056  0a9c 2704          	jreq	L255
4057  0a9e a101          	cp	a,#1
4058  0aa0 2603          	jrne	L055
4059  0aa2               L255:
4060  0aa2 4f            	clr	a
4061  0aa3 2010          	jra	L455
4062  0aa5               L055:
4063  0aa5 ae0341        	ldw	x,#833
4064  0aa8 89            	pushw	x
4065  0aa9 ae0000        	ldw	x,#0
4066  0aac 89            	pushw	x
4067  0aad ae0000        	ldw	x,#L37
4068  0ab0 cd0000        	call	_assert_failed
4070  0ab3 5b04          	addw	sp,#4
4071  0ab5               L455:
4072                     ; 836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4074  0ab5 0d01          	tnz	(OFST+1,sp)
4075  0ab7 2706          	jreq	L5631
4076                     ; 838         TIM1->CR1 |= TIM1_CR1_URS;
4078  0ab9 72145250      	bset	21072,#2
4080  0abd 2004          	jra	L7631
4081  0abf               L5631:
4082                     ; 842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4084  0abf 72155250      	bres	21072,#2
4085  0ac3               L7631:
4086                     ; 844 }
4089  0ac3 84            	pop	a
4090  0ac4 81            	ret
4127                     ; 853 void TIM1_SelectHallSensor(FunctionalState NewState)
4127                     ; 854 {
4128                     	switch	.text
4129  0ac5               _TIM1_SelectHallSensor:
4131  0ac5 88            	push	a
4132       00000000      OFST:	set	0
4135                     ; 856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4137  0ac6 4d            	tnz	a
4138  0ac7 2704          	jreq	L265
4139  0ac9 a101          	cp	a,#1
4140  0acb 2603          	jrne	L065
4141  0acd               L265:
4142  0acd 4f            	clr	a
4143  0ace 2010          	jra	L465
4144  0ad0               L065:
4145  0ad0 ae0358        	ldw	x,#856
4146  0ad3 89            	pushw	x
4147  0ad4 ae0000        	ldw	x,#0
4148  0ad7 89            	pushw	x
4149  0ad8 ae0000        	ldw	x,#L37
4150  0adb cd0000        	call	_assert_failed
4152  0ade 5b04          	addw	sp,#4
4153  0ae0               L465:
4154                     ; 859     if (NewState != DISABLE)
4156  0ae0 0d01          	tnz	(OFST+1,sp)
4157  0ae2 2706          	jreq	L7041
4158                     ; 861         TIM1->CR2 |= TIM1_CR2_TI1S;
4160  0ae4 721e5251      	bset	21073,#7
4162  0ae8 2004          	jra	L1141
4163  0aea               L7041:
4164                     ; 865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4166  0aea 721f5251      	bres	21073,#7
4167  0aee               L1141:
4168                     ; 867 }
4171  0aee 84            	pop	a
4172  0aef 81            	ret
4230                     ; 878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4230                     ; 879 {
4231                     	switch	.text
4232  0af0               _TIM1_SelectOnePulseMode:
4234  0af0 88            	push	a
4235       00000000      OFST:	set	0
4238                     ; 881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4240  0af1 a101          	cp	a,#1
4241  0af3 2703          	jreq	L275
4242  0af5 4d            	tnz	a
4243  0af6 2603          	jrne	L075
4244  0af8               L275:
4245  0af8 4f            	clr	a
4246  0af9 2010          	jra	L475
4247  0afb               L075:
4248  0afb ae0371        	ldw	x,#881
4249  0afe 89            	pushw	x
4250  0aff ae0000        	ldw	x,#0
4251  0b02 89            	pushw	x
4252  0b03 ae0000        	ldw	x,#L37
4253  0b06 cd0000        	call	_assert_failed
4255  0b09 5b04          	addw	sp,#4
4256  0b0b               L475:
4257                     ; 884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4259  0b0b 0d01          	tnz	(OFST+1,sp)
4260  0b0d 2706          	jreq	L1441
4261                     ; 886         TIM1->CR1 |= TIM1_CR1_OPM;
4263  0b0f 72165250      	bset	21072,#3
4265  0b13 2004          	jra	L3441
4266  0b15               L1441:
4267                     ; 890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4269  0b15 72175250      	bres	21072,#3
4270  0b19               L3441:
4271                     ; 893 }
4274  0b19 84            	pop	a
4275  0b1a 81            	ret
4374                     ; 909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4374                     ; 910 {
4375                     	switch	.text
4376  0b1b               _TIM1_SelectOutputTrigger:
4378  0b1b 88            	push	a
4379       00000000      OFST:	set	0
4382                     ; 912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4384  0b1c 4d            	tnz	a
4385  0b1d 2718          	jreq	L206
4386  0b1f a110          	cp	a,#16
4387  0b21 2714          	jreq	L206
4388  0b23 a120          	cp	a,#32
4389  0b25 2710          	jreq	L206
4390  0b27 a130          	cp	a,#48
4391  0b29 270c          	jreq	L206
4392  0b2b a140          	cp	a,#64
4393  0b2d 2708          	jreq	L206
4394  0b2f a150          	cp	a,#80
4395  0b31 2704          	jreq	L206
4396  0b33 a160          	cp	a,#96
4397  0b35 2603          	jrne	L006
4398  0b37               L206:
4399  0b37 4f            	clr	a
4400  0b38 2010          	jra	L406
4401  0b3a               L006:
4402  0b3a ae0390        	ldw	x,#912
4403  0b3d 89            	pushw	x
4404  0b3e ae0000        	ldw	x,#0
4405  0b41 89            	pushw	x
4406  0b42 ae0000        	ldw	x,#L37
4407  0b45 cd0000        	call	_assert_failed
4409  0b48 5b04          	addw	sp,#4
4410  0b4a               L406:
4411                     ; 915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4411                     ; 916                           (uint8_t) TIM1_TRGOSource);
4413  0b4a c65251        	ld	a,21073
4414  0b4d a48f          	and	a,#143
4415  0b4f 1a01          	or	a,(OFST+1,sp)
4416  0b51 c75251        	ld	21073,a
4417                     ; 917 }
4420  0b54 84            	pop	a
4421  0b55 81            	ret
4496                     ; 929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4496                     ; 930 {
4497                     	switch	.text
4498  0b56               _TIM1_SelectSlaveMode:
4500  0b56 88            	push	a
4501       00000000      OFST:	set	0
4504                     ; 933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4506  0b57 a104          	cp	a,#4
4507  0b59 270c          	jreq	L216
4508  0b5b a105          	cp	a,#5
4509  0b5d 2708          	jreq	L216
4510  0b5f a106          	cp	a,#6
4511  0b61 2704          	jreq	L216
4512  0b63 a107          	cp	a,#7
4513  0b65 2603          	jrne	L016
4514  0b67               L216:
4515  0b67 4f            	clr	a
4516  0b68 2010          	jra	L416
4517  0b6a               L016:
4518  0b6a ae03a5        	ldw	x,#933
4519  0b6d 89            	pushw	x
4520  0b6e ae0000        	ldw	x,#0
4521  0b71 89            	pushw	x
4522  0b72 ae0000        	ldw	x,#L37
4523  0b75 cd0000        	call	_assert_failed
4525  0b78 5b04          	addw	sp,#4
4526  0b7a               L416:
4527                     ; 936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4527                     ; 937                            (uint8_t)TIM1_SlaveMode);
4529  0b7a c65252        	ld	a,21074
4530  0b7d a4f8          	and	a,#248
4531  0b7f 1a01          	or	a,(OFST+1,sp)
4532  0b81 c75252        	ld	21074,a
4533                     ; 939 }
4536  0b84 84            	pop	a
4537  0b85 81            	ret
4574                     ; 947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4574                     ; 948 {
4575                     	switch	.text
4576  0b86               _TIM1_SelectMasterSlaveMode:
4578  0b86 88            	push	a
4579       00000000      OFST:	set	0
4582                     ; 950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4584  0b87 4d            	tnz	a
4585  0b88 2704          	jreq	L226
4586  0b8a a101          	cp	a,#1
4587  0b8c 2603          	jrne	L026
4588  0b8e               L226:
4589  0b8e 4f            	clr	a
4590  0b8f 2010          	jra	L426
4591  0b91               L026:
4592  0b91 ae03b6        	ldw	x,#950
4593  0b94 89            	pushw	x
4594  0b95 ae0000        	ldw	x,#0
4595  0b98 89            	pushw	x
4596  0b99 ae0000        	ldw	x,#L37
4597  0b9c cd0000        	call	_assert_failed
4599  0b9f 5b04          	addw	sp,#4
4600  0ba1               L426:
4601                     ; 953     if (NewState != DISABLE)
4603  0ba1 0d01          	tnz	(OFST+1,sp)
4604  0ba3 2706          	jreq	L5551
4605                     ; 955         TIM1->SMCR |= TIM1_SMCR_MSM;
4607  0ba5 721e5252      	bset	21074,#7
4609  0ba9 2004          	jra	L7551
4610  0bab               L5551:
4611                     ; 959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4613  0bab 721f5252      	bres	21074,#7
4614  0baf               L7551:
4615                     ; 961 }
4618  0baf 84            	pop	a
4619  0bb0 81            	ret
4706                     ; 983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4706                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4706                     ; 985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4706                     ; 986 {
4707                     	switch	.text
4708  0bb1               _TIM1_EncoderInterfaceConfig:
4710  0bb1 89            	pushw	x
4711       00000000      OFST:	set	0
4714                     ; 990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4716  0bb2 9e            	ld	a,xh
4717  0bb3 a101          	cp	a,#1
4718  0bb5 270a          	jreq	L236
4719  0bb7 9e            	ld	a,xh
4720  0bb8 a102          	cp	a,#2
4721  0bba 2705          	jreq	L236
4722  0bbc 9e            	ld	a,xh
4723  0bbd a103          	cp	a,#3
4724  0bbf 2603          	jrne	L036
4725  0bc1               L236:
4726  0bc1 4f            	clr	a
4727  0bc2 2010          	jra	L436
4728  0bc4               L036:
4729  0bc4 ae03de        	ldw	x,#990
4730  0bc7 89            	pushw	x
4731  0bc8 ae0000        	ldw	x,#0
4732  0bcb 89            	pushw	x
4733  0bcc ae0000        	ldw	x,#L37
4734  0bcf cd0000        	call	_assert_failed
4736  0bd2 5b04          	addw	sp,#4
4737  0bd4               L436:
4738                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4740  0bd4 0d02          	tnz	(OFST+2,sp)
4741  0bd6 2706          	jreq	L046
4742  0bd8 7b02          	ld	a,(OFST+2,sp)
4743  0bda a101          	cp	a,#1
4744  0bdc 2603          	jrne	L636
4745  0bde               L046:
4746  0bde 4f            	clr	a
4747  0bdf 2010          	jra	L246
4748  0be1               L636:
4749  0be1 ae03df        	ldw	x,#991
4750  0be4 89            	pushw	x
4751  0be5 ae0000        	ldw	x,#0
4752  0be8 89            	pushw	x
4753  0be9 ae0000        	ldw	x,#L37
4754  0bec cd0000        	call	_assert_failed
4756  0bef 5b04          	addw	sp,#4
4757  0bf1               L246:
4758                     ; 992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4760  0bf1 0d05          	tnz	(OFST+5,sp)
4761  0bf3 2706          	jreq	L646
4762  0bf5 7b05          	ld	a,(OFST+5,sp)
4763  0bf7 a101          	cp	a,#1
4764  0bf9 2603          	jrne	L446
4765  0bfb               L646:
4766  0bfb 4f            	clr	a
4767  0bfc 2010          	jra	L056
4768  0bfe               L446:
4769  0bfe ae03e0        	ldw	x,#992
4770  0c01 89            	pushw	x
4771  0c02 ae0000        	ldw	x,#0
4772  0c05 89            	pushw	x
4773  0c06 ae0000        	ldw	x,#L37
4774  0c09 cd0000        	call	_assert_failed
4776  0c0c 5b04          	addw	sp,#4
4777  0c0e               L056:
4778                     ; 995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4780  0c0e 0d02          	tnz	(OFST+2,sp)
4781  0c10 2706          	jreq	L1261
4782                     ; 997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4784  0c12 7212525c      	bset	21084,#1
4786  0c16 2004          	jra	L3261
4787  0c18               L1261:
4788                     ; 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4790  0c18 7213525c      	bres	21084,#1
4791  0c1c               L3261:
4792                     ; 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4794  0c1c 0d05          	tnz	(OFST+5,sp)
4795  0c1e 2706          	jreq	L5261
4796                     ; 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4798  0c20 721a525c      	bset	21084,#5
4800  0c24 2004          	jra	L7261
4801  0c26               L5261:
4802                     ; 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4804  0c26 721b525c      	bres	21084,#5
4805  0c2a               L7261:
4806                     ; 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4806                     ; 1014                            | (uint8_t) TIM1_EncoderMode);
4808  0c2a c65252        	ld	a,21074
4809  0c2d a4f0          	and	a,#240
4810  0c2f 1a01          	or	a,(OFST+1,sp)
4811  0c31 c75252        	ld	21074,a
4812                     ; 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4812                     ; 1018                             | (uint8_t) CCMR_TIxDirect_Set);
4814  0c34 c65258        	ld	a,21080
4815  0c37 a4fc          	and	a,#252
4816  0c39 aa01          	or	a,#1
4817  0c3b c75258        	ld	21080,a
4818                     ; 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4818                     ; 1020                             | (uint8_t) CCMR_TIxDirect_Set);
4820  0c3e c65259        	ld	a,21081
4821  0c41 a4fc          	and	a,#252
4822  0c43 aa01          	or	a,#1
4823  0c45 c75259        	ld	21081,a
4824                     ; 1022 }
4827  0c48 85            	popw	x
4828  0c49 81            	ret
4894                     ; 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
4894                     ; 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4894                     ; 1037 {
4895                     	switch	.text
4896  0c4a               _TIM1_PrescalerConfig:
4898  0c4a 89            	pushw	x
4899       00000000      OFST:	set	0
4902                     ; 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4904  0c4b 0d05          	tnz	(OFST+5,sp)
4905  0c4d 2706          	jreq	L656
4906  0c4f 7b05          	ld	a,(OFST+5,sp)
4907  0c51 a101          	cp	a,#1
4908  0c53 2603          	jrne	L456
4909  0c55               L656:
4910  0c55 4f            	clr	a
4911  0c56 2010          	jra	L066
4912  0c58               L456:
4913  0c58 ae040f        	ldw	x,#1039
4914  0c5b 89            	pushw	x
4915  0c5c ae0000        	ldw	x,#0
4916  0c5f 89            	pushw	x
4917  0c60 ae0000        	ldw	x,#L37
4918  0c63 cd0000        	call	_assert_failed
4920  0c66 5b04          	addw	sp,#4
4921  0c68               L066:
4922                     ; 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4924  0c68 7b01          	ld	a,(OFST+1,sp)
4925  0c6a c75260        	ld	21088,a
4926                     ; 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
4928  0c6d 7b02          	ld	a,(OFST+2,sp)
4929  0c6f c75261        	ld	21089,a
4930                     ; 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4932  0c72 7b05          	ld	a,(OFST+5,sp)
4933  0c74 c75257        	ld	21079,a
4934                     ; 1048 }
4937  0c77 85            	popw	x
4938  0c78 81            	ret
4975                     ; 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
4975                     ; 1062 {
4976                     	switch	.text
4977  0c79               _TIM1_CounterModeConfig:
4979  0c79 88            	push	a
4980       00000000      OFST:	set	0
4983                     ; 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
4985  0c7a 4d            	tnz	a
4986  0c7b 2710          	jreq	L666
4987  0c7d a110          	cp	a,#16
4988  0c7f 270c          	jreq	L666
4989  0c81 a120          	cp	a,#32
4990  0c83 2708          	jreq	L666
4991  0c85 a140          	cp	a,#64
4992  0c87 2704          	jreq	L666
4993  0c89 a160          	cp	a,#96
4994  0c8b 2603          	jrne	L466
4995  0c8d               L666:
4996  0c8d 4f            	clr	a
4997  0c8e 2010          	jra	L076
4998  0c90               L466:
4999  0c90 ae0428        	ldw	x,#1064
5000  0c93 89            	pushw	x
5001  0c94 ae0000        	ldw	x,#0
5002  0c97 89            	pushw	x
5003  0c98 ae0000        	ldw	x,#L37
5004  0c9b cd0000        	call	_assert_failed
5006  0c9e 5b04          	addw	sp,#4
5007  0ca0               L076:
5008                     ; 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5008                     ; 1069                           | (uint8_t)TIM1_CounterMode);
5010  0ca0 c65250        	ld	a,21072
5011  0ca3 a48f          	and	a,#143
5012  0ca5 1a01          	or	a,(OFST+1,sp)
5013  0ca7 c75250        	ld	21072,a
5014                     ; 1070 }
5017  0caa 84            	pop	a
5018  0cab 81            	ret
5077                     ; 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5077                     ; 1082 {
5078                     	switch	.text
5079  0cac               _TIM1_ForcedOC1Config:
5081  0cac 88            	push	a
5082       00000000      OFST:	set	0
5085                     ; 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5087  0cad a150          	cp	a,#80
5088  0caf 2704          	jreq	L676
5089  0cb1 a140          	cp	a,#64
5090  0cb3 2603          	jrne	L476
5091  0cb5               L676:
5092  0cb5 4f            	clr	a
5093  0cb6 2010          	jra	L007
5094  0cb8               L476:
5095  0cb8 ae043c        	ldw	x,#1084
5096  0cbb 89            	pushw	x
5097  0cbc ae0000        	ldw	x,#0
5098  0cbf 89            	pushw	x
5099  0cc0 ae0000        	ldw	x,#L37
5100  0cc3 cd0000        	call	_assert_failed
5102  0cc6 5b04          	addw	sp,#4
5103  0cc8               L007:
5104                     ; 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5104                     ; 1088                              (uint8_t)TIM1_ForcedAction);
5106  0cc8 c65258        	ld	a,21080
5107  0ccb a48f          	and	a,#143
5108  0ccd 1a01          	or	a,(OFST+1,sp)
5109  0ccf c75258        	ld	21080,a
5110                     ; 1089 }
5113  0cd2 84            	pop	a
5114  0cd3 81            	ret
5151                     ; 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5151                     ; 1101 {
5152                     	switch	.text
5153  0cd4               _TIM1_ForcedOC2Config:
5155  0cd4 88            	push	a
5156       00000000      OFST:	set	0
5159                     ; 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5161  0cd5 a150          	cp	a,#80
5162  0cd7 2704          	jreq	L607
5163  0cd9 a140          	cp	a,#64
5164  0cdb 2603          	jrne	L407
5165  0cdd               L607:
5166  0cdd 4f            	clr	a
5167  0cde 2010          	jra	L017
5168  0ce0               L407:
5169  0ce0 ae044f        	ldw	x,#1103
5170  0ce3 89            	pushw	x
5171  0ce4 ae0000        	ldw	x,#0
5172  0ce7 89            	pushw	x
5173  0ce8 ae0000        	ldw	x,#L37
5174  0ceb cd0000        	call	_assert_failed
5176  0cee 5b04          	addw	sp,#4
5177  0cf0               L017:
5178                     ; 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5178                     ; 1107                               | (uint8_t)TIM1_ForcedAction);
5180  0cf0 c65259        	ld	a,21081
5181  0cf3 a48f          	and	a,#143
5182  0cf5 1a01          	or	a,(OFST+1,sp)
5183  0cf7 c75259        	ld	21081,a
5184                     ; 1108 }
5187  0cfa 84            	pop	a
5188  0cfb 81            	ret
5225                     ; 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5225                     ; 1121 {
5226                     	switch	.text
5227  0cfc               _TIM1_ForcedOC3Config:
5229  0cfc 88            	push	a
5230       00000000      OFST:	set	0
5233                     ; 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5235  0cfd a150          	cp	a,#80
5236  0cff 2704          	jreq	L617
5237  0d01 a140          	cp	a,#64
5238  0d03 2603          	jrne	L417
5239  0d05               L617:
5240  0d05 4f            	clr	a
5241  0d06 2010          	jra	L027
5242  0d08               L417:
5243  0d08 ae0463        	ldw	x,#1123
5244  0d0b 89            	pushw	x
5245  0d0c ae0000        	ldw	x,#0
5246  0d0f 89            	pushw	x
5247  0d10 ae0000        	ldw	x,#L37
5248  0d13 cd0000        	call	_assert_failed
5250  0d16 5b04          	addw	sp,#4
5251  0d18               L027:
5252                     ; 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5252                     ; 1127                               | (uint8_t)TIM1_ForcedAction);
5254  0d18 c6525a        	ld	a,21082
5255  0d1b a48f          	and	a,#143
5256  0d1d 1a01          	or	a,(OFST+1,sp)
5257  0d1f c7525a        	ld	21082,a
5258                     ; 1128 }
5261  0d22 84            	pop	a
5262  0d23 81            	ret
5299                     ; 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5299                     ; 1141 {
5300                     	switch	.text
5301  0d24               _TIM1_ForcedOC4Config:
5303  0d24 88            	push	a
5304       00000000      OFST:	set	0
5307                     ; 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5309  0d25 a150          	cp	a,#80
5310  0d27 2704          	jreq	L627
5311  0d29 a140          	cp	a,#64
5312  0d2b 2603          	jrne	L427
5313  0d2d               L627:
5314  0d2d 4f            	clr	a
5315  0d2e 2010          	jra	L037
5316  0d30               L427:
5317  0d30 ae0477        	ldw	x,#1143
5318  0d33 89            	pushw	x
5319  0d34 ae0000        	ldw	x,#0
5320  0d37 89            	pushw	x
5321  0d38 ae0000        	ldw	x,#L37
5322  0d3b cd0000        	call	_assert_failed
5324  0d3e 5b04          	addw	sp,#4
5325  0d40               L037:
5326                     ; 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5326                     ; 1147                               | (uint8_t)TIM1_ForcedAction);
5328  0d40 c6525b        	ld	a,21083
5329  0d43 a48f          	and	a,#143
5330  0d45 1a01          	or	a,(OFST+1,sp)
5331  0d47 c7525b        	ld	21083,a
5332                     ; 1148 }
5335  0d4a 84            	pop	a
5336  0d4b 81            	ret
5373                     ; 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5373                     ; 1158 {
5374                     	switch	.text
5375  0d4c               _TIM1_ARRPreloadConfig:
5377  0d4c 88            	push	a
5378       00000000      OFST:	set	0
5381                     ; 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5383  0d4d 4d            	tnz	a
5384  0d4e 2704          	jreq	L637
5385  0d50 a101          	cp	a,#1
5386  0d52 2603          	jrne	L437
5387  0d54               L637:
5388  0d54 4f            	clr	a
5389  0d55 2010          	jra	L047
5390  0d57               L437:
5391  0d57 ae0488        	ldw	x,#1160
5392  0d5a 89            	pushw	x
5393  0d5b ae0000        	ldw	x,#0
5394  0d5e 89            	pushw	x
5395  0d5f ae0000        	ldw	x,#L37
5396  0d62 cd0000        	call	_assert_failed
5398  0d65 5b04          	addw	sp,#4
5399  0d67               L047:
5400                     ; 1163     if (NewState != DISABLE)
5402  0d67 0d01          	tnz	(OFST+1,sp)
5403  0d69 2706          	jreq	L5102
5404                     ; 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
5406  0d6b 721e5250      	bset	21072,#7
5408  0d6f 2004          	jra	L7102
5409  0d71               L5102:
5410                     ; 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5412  0d71 721f5250      	bres	21072,#7
5413  0d75               L7102:
5414                     ; 1171 }
5417  0d75 84            	pop	a
5418  0d76 81            	ret
5454                     ; 1180 void TIM1_SelectCOM(FunctionalState NewState)
5454                     ; 1181 {
5455                     	switch	.text
5456  0d77               _TIM1_SelectCOM:
5458  0d77 88            	push	a
5459       00000000      OFST:	set	0
5462                     ; 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5464  0d78 4d            	tnz	a
5465  0d79 2704          	jreq	L647
5466  0d7b a101          	cp	a,#1
5467  0d7d 2603          	jrne	L447
5468  0d7f               L647:
5469  0d7f 4f            	clr	a
5470  0d80 2010          	jra	L057
5471  0d82               L447:
5472  0d82 ae049f        	ldw	x,#1183
5473  0d85 89            	pushw	x
5474  0d86 ae0000        	ldw	x,#0
5475  0d89 89            	pushw	x
5476  0d8a ae0000        	ldw	x,#L37
5477  0d8d cd0000        	call	_assert_failed
5479  0d90 5b04          	addw	sp,#4
5480  0d92               L057:
5481                     ; 1186     if (NewState != DISABLE)
5483  0d92 0d01          	tnz	(OFST+1,sp)
5484  0d94 2706          	jreq	L7302
5485                     ; 1188         TIM1->CR2 |= TIM1_CR2_COMS;
5487  0d96 72145251      	bset	21073,#2
5489  0d9a 2004          	jra	L1402
5490  0d9c               L7302:
5491                     ; 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5493  0d9c 72155251      	bres	21073,#2
5494  0da0               L1402:
5495                     ; 1194 }
5498  0da0 84            	pop	a
5499  0da1 81            	ret
5536                     ; 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
5536                     ; 1203 {
5537                     	switch	.text
5538  0da2               _TIM1_CCPreloadControl:
5540  0da2 88            	push	a
5541       00000000      OFST:	set	0
5544                     ; 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5546  0da3 4d            	tnz	a
5547  0da4 2704          	jreq	L657
5548  0da6 a101          	cp	a,#1
5549  0da8 2603          	jrne	L457
5550  0daa               L657:
5551  0daa 4f            	clr	a
5552  0dab 2010          	jra	L067
5553  0dad               L457:
5554  0dad ae04b5        	ldw	x,#1205
5555  0db0 89            	pushw	x
5556  0db1 ae0000        	ldw	x,#0
5557  0db4 89            	pushw	x
5558  0db5 ae0000        	ldw	x,#L37
5559  0db8 cd0000        	call	_assert_failed
5561  0dbb 5b04          	addw	sp,#4
5562  0dbd               L067:
5563                     ; 1208     if (NewState != DISABLE)
5565  0dbd 0d01          	tnz	(OFST+1,sp)
5566  0dbf 2706          	jreq	L1602
5567                     ; 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
5569  0dc1 72105251      	bset	21073,#0
5571  0dc5 2004          	jra	L3602
5572  0dc7               L1602:
5573                     ; 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5575  0dc7 72115251      	bres	21073,#0
5576  0dcb               L3602:
5577                     ; 1216 }
5580  0dcb 84            	pop	a
5581  0dcc 81            	ret
5618                     ; 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5618                     ; 1226 {
5619                     	switch	.text
5620  0dcd               _TIM1_OC1PreloadConfig:
5622  0dcd 88            	push	a
5623       00000000      OFST:	set	0
5626                     ; 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5628  0dce 4d            	tnz	a
5629  0dcf 2704          	jreq	L667
5630  0dd1 a101          	cp	a,#1
5631  0dd3 2603          	jrne	L467
5632  0dd5               L667:
5633  0dd5 4f            	clr	a
5634  0dd6 2010          	jra	L077
5635  0dd8               L467:
5636  0dd8 ae04cc        	ldw	x,#1228
5637  0ddb 89            	pushw	x
5638  0ddc ae0000        	ldw	x,#0
5639  0ddf 89            	pushw	x
5640  0de0 ae0000        	ldw	x,#L37
5641  0de3 cd0000        	call	_assert_failed
5643  0de6 5b04          	addw	sp,#4
5644  0de8               L077:
5645                     ; 1231     if (NewState != DISABLE)
5647  0de8 0d01          	tnz	(OFST+1,sp)
5648  0dea 2706          	jreq	L3012
5649                     ; 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5651  0dec 72165258      	bset	21080,#3
5653  0df0 2004          	jra	L5012
5654  0df2               L3012:
5655                     ; 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5657  0df2 72175258      	bres	21080,#3
5658  0df6               L5012:
5659                     ; 1239 }
5662  0df6 84            	pop	a
5663  0df7 81            	ret
5700                     ; 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5700                     ; 1249 {
5701                     	switch	.text
5702  0df8               _TIM1_OC2PreloadConfig:
5704  0df8 88            	push	a
5705       00000000      OFST:	set	0
5708                     ; 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5710  0df9 4d            	tnz	a
5711  0dfa 2704          	jreq	L677
5712  0dfc a101          	cp	a,#1
5713  0dfe 2603          	jrne	L477
5714  0e00               L677:
5715  0e00 4f            	clr	a
5716  0e01 2010          	jra	L0001
5717  0e03               L477:
5718  0e03 ae04e3        	ldw	x,#1251
5719  0e06 89            	pushw	x
5720  0e07 ae0000        	ldw	x,#0
5721  0e0a 89            	pushw	x
5722  0e0b ae0000        	ldw	x,#L37
5723  0e0e cd0000        	call	_assert_failed
5725  0e11 5b04          	addw	sp,#4
5726  0e13               L0001:
5727                     ; 1254     if (NewState != DISABLE)
5729  0e13 0d01          	tnz	(OFST+1,sp)
5730  0e15 2706          	jreq	L5212
5731                     ; 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5733  0e17 72165259      	bset	21081,#3
5735  0e1b 2004          	jra	L7212
5736  0e1d               L5212:
5737                     ; 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5739  0e1d 72175259      	bres	21081,#3
5740  0e21               L7212:
5741                     ; 1262 }
5744  0e21 84            	pop	a
5745  0e22 81            	ret
5782                     ; 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5782                     ; 1272 {
5783                     	switch	.text
5784  0e23               _TIM1_OC3PreloadConfig:
5786  0e23 88            	push	a
5787       00000000      OFST:	set	0
5790                     ; 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5792  0e24 4d            	tnz	a
5793  0e25 2704          	jreq	L6001
5794  0e27 a101          	cp	a,#1
5795  0e29 2603          	jrne	L4001
5796  0e2b               L6001:
5797  0e2b 4f            	clr	a
5798  0e2c 2010          	jra	L0101
5799  0e2e               L4001:
5800  0e2e ae04fa        	ldw	x,#1274
5801  0e31 89            	pushw	x
5802  0e32 ae0000        	ldw	x,#0
5803  0e35 89            	pushw	x
5804  0e36 ae0000        	ldw	x,#L37
5805  0e39 cd0000        	call	_assert_failed
5807  0e3c 5b04          	addw	sp,#4
5808  0e3e               L0101:
5809                     ; 1277     if (NewState != DISABLE)
5811  0e3e 0d01          	tnz	(OFST+1,sp)
5812  0e40 2706          	jreq	L7412
5813                     ; 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5815  0e42 7216525a      	bset	21082,#3
5817  0e46 2004          	jra	L1512
5818  0e48               L7412:
5819                     ; 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5821  0e48 7217525a      	bres	21082,#3
5822  0e4c               L1512:
5823                     ; 1285 }
5826  0e4c 84            	pop	a
5827  0e4d 81            	ret
5864                     ; 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5864                     ; 1296 {
5865                     	switch	.text
5866  0e4e               _TIM1_OC4PreloadConfig:
5868  0e4e 88            	push	a
5869       00000000      OFST:	set	0
5872                     ; 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5874  0e4f 4d            	tnz	a
5875  0e50 2704          	jreq	L6101
5876  0e52 a101          	cp	a,#1
5877  0e54 2603          	jrne	L4101
5878  0e56               L6101:
5879  0e56 4f            	clr	a
5880  0e57 2010          	jra	L0201
5881  0e59               L4101:
5882  0e59 ae0512        	ldw	x,#1298
5883  0e5c 89            	pushw	x
5884  0e5d ae0000        	ldw	x,#0
5885  0e60 89            	pushw	x
5886  0e61 ae0000        	ldw	x,#L37
5887  0e64 cd0000        	call	_assert_failed
5889  0e67 5b04          	addw	sp,#4
5890  0e69               L0201:
5891                     ; 1301     if (NewState != DISABLE)
5893  0e69 0d01          	tnz	(OFST+1,sp)
5894  0e6b 2706          	jreq	L1712
5895                     ; 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5897  0e6d 7216525b      	bset	21083,#3
5899  0e71 2004          	jra	L3712
5900  0e73               L1712:
5901                     ; 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5903  0e73 7217525b      	bres	21083,#3
5904  0e77               L3712:
5905                     ; 1309 }
5908  0e77 84            	pop	a
5909  0e78 81            	ret
5945                     ; 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
5945                     ; 1318 {
5946                     	switch	.text
5947  0e79               _TIM1_OC1FastConfig:
5949  0e79 88            	push	a
5950       00000000      OFST:	set	0
5953                     ; 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5955  0e7a 4d            	tnz	a
5956  0e7b 2704          	jreq	L6201
5957  0e7d a101          	cp	a,#1
5958  0e7f 2603          	jrne	L4201
5959  0e81               L6201:
5960  0e81 4f            	clr	a
5961  0e82 2010          	jra	L0301
5962  0e84               L4201:
5963  0e84 ae0528        	ldw	x,#1320
5964  0e87 89            	pushw	x
5965  0e88 ae0000        	ldw	x,#0
5966  0e8b 89            	pushw	x
5967  0e8c ae0000        	ldw	x,#L37
5968  0e8f cd0000        	call	_assert_failed
5970  0e92 5b04          	addw	sp,#4
5971  0e94               L0301:
5972                     ; 1323     if (NewState != DISABLE)
5974  0e94 0d01          	tnz	(OFST+1,sp)
5975  0e96 2706          	jreq	L3122
5976                     ; 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
5978  0e98 72145258      	bset	21080,#2
5980  0e9c 2004          	jra	L5122
5981  0e9e               L3122:
5982                     ; 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5984  0e9e 72155258      	bres	21080,#2
5985  0ea2               L5122:
5986                     ; 1331 }
5989  0ea2 84            	pop	a
5990  0ea3 81            	ret
6026                     ; 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
6026                     ; 1342 {
6027                     	switch	.text
6028  0ea4               _TIM1_OC2FastConfig:
6030  0ea4 88            	push	a
6031       00000000      OFST:	set	0
6034                     ; 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6036  0ea5 4d            	tnz	a
6037  0ea6 2704          	jreq	L6301
6038  0ea8 a101          	cp	a,#1
6039  0eaa 2603          	jrne	L4301
6040  0eac               L6301:
6041  0eac 4f            	clr	a
6042  0ead 2010          	jra	L0401
6043  0eaf               L4301:
6044  0eaf ae0540        	ldw	x,#1344
6045  0eb2 89            	pushw	x
6046  0eb3 ae0000        	ldw	x,#0
6047  0eb6 89            	pushw	x
6048  0eb7 ae0000        	ldw	x,#L37
6049  0eba cd0000        	call	_assert_failed
6051  0ebd 5b04          	addw	sp,#4
6052  0ebf               L0401:
6053                     ; 1347     if (NewState != DISABLE)
6055  0ebf 0d01          	tnz	(OFST+1,sp)
6056  0ec1 2706          	jreq	L5322
6057                     ; 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6059  0ec3 72145259      	bset	21081,#2
6061  0ec7 2004          	jra	L7322
6062  0ec9               L5322:
6063                     ; 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6065  0ec9 72155259      	bres	21081,#2
6066  0ecd               L7322:
6067                     ; 1355 }
6070  0ecd 84            	pop	a
6071  0ece 81            	ret
6107                     ; 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
6107                     ; 1365 {
6108                     	switch	.text
6109  0ecf               _TIM1_OC3FastConfig:
6111  0ecf 88            	push	a
6112       00000000      OFST:	set	0
6115                     ; 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6117  0ed0 4d            	tnz	a
6118  0ed1 2704          	jreq	L6401
6119  0ed3 a101          	cp	a,#1
6120  0ed5 2603          	jrne	L4401
6121  0ed7               L6401:
6122  0ed7 4f            	clr	a
6123  0ed8 2010          	jra	L0501
6124  0eda               L4401:
6125  0eda ae0557        	ldw	x,#1367
6126  0edd 89            	pushw	x
6127  0ede ae0000        	ldw	x,#0
6128  0ee1 89            	pushw	x
6129  0ee2 ae0000        	ldw	x,#L37
6130  0ee5 cd0000        	call	_assert_failed
6132  0ee8 5b04          	addw	sp,#4
6133  0eea               L0501:
6134                     ; 1370     if (NewState != DISABLE)
6136  0eea 0d01          	tnz	(OFST+1,sp)
6137  0eec 2706          	jreq	L7522
6138                     ; 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6140  0eee 7214525a      	bset	21082,#2
6142  0ef2 2004          	jra	L1622
6143  0ef4               L7522:
6144                     ; 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6146  0ef4 7215525a      	bres	21082,#2
6147  0ef8               L1622:
6148                     ; 1378 }
6151  0ef8 84            	pop	a
6152  0ef9 81            	ret
6188                     ; 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
6188                     ; 1388 {
6189                     	switch	.text
6190  0efa               _TIM1_OC4FastConfig:
6192  0efa 88            	push	a
6193       00000000      OFST:	set	0
6196                     ; 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6198  0efb 4d            	tnz	a
6199  0efc 2704          	jreq	L6501
6200  0efe a101          	cp	a,#1
6201  0f00 2603          	jrne	L4501
6202  0f02               L6501:
6203  0f02 4f            	clr	a
6204  0f03 2010          	jra	L0601
6205  0f05               L4501:
6206  0f05 ae056e        	ldw	x,#1390
6207  0f08 89            	pushw	x
6208  0f09 ae0000        	ldw	x,#0
6209  0f0c 89            	pushw	x
6210  0f0d ae0000        	ldw	x,#L37
6211  0f10 cd0000        	call	_assert_failed
6213  0f13 5b04          	addw	sp,#4
6214  0f15               L0601:
6215                     ; 1393     if (NewState != DISABLE)
6217  0f15 0d01          	tnz	(OFST+1,sp)
6218  0f17 2706          	jreq	L1032
6219                     ; 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6221  0f19 7214525b      	bset	21083,#2
6223  0f1d 2004          	jra	L3032
6224  0f1f               L1032:
6225                     ; 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6227  0f1f 7215525b      	bres	21083,#2
6228  0f23               L3032:
6229                     ; 1401 }
6232  0f23 84            	pop	a
6233  0f24 81            	ret
6339                     ; 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6339                     ; 1419 {
6340                     	switch	.text
6341  0f25               _TIM1_GenerateEvent:
6343  0f25 88            	push	a
6344       00000000      OFST:	set	0
6347                     ; 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6349  0f26 4d            	tnz	a
6350  0f27 2703          	jreq	L4601
6351  0f29 4f            	clr	a
6352  0f2a 2010          	jra	L6601
6353  0f2c               L4601:
6354  0f2c ae058d        	ldw	x,#1421
6355  0f2f 89            	pushw	x
6356  0f30 ae0000        	ldw	x,#0
6357  0f33 89            	pushw	x
6358  0f34 ae0000        	ldw	x,#L37
6359  0f37 cd0000        	call	_assert_failed
6361  0f3a 5b04          	addw	sp,#4
6362  0f3c               L6601:
6363                     ; 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
6365  0f3c 7b01          	ld	a,(OFST+1,sp)
6366  0f3e c75257        	ld	21079,a
6367                     ; 1425 }
6370  0f41 84            	pop	a
6371  0f42 81            	ret
6408                     ; 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6408                     ; 1437 {
6409                     	switch	.text
6410  0f43               _TIM1_OC1PolarityConfig:
6412  0f43 88            	push	a
6413       00000000      OFST:	set	0
6416                     ; 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6418  0f44 4d            	tnz	a
6419  0f45 2704          	jreq	L4701
6420  0f47 a122          	cp	a,#34
6421  0f49 2603          	jrne	L2701
6422  0f4b               L4701:
6423  0f4b 4f            	clr	a
6424  0f4c 2010          	jra	L6701
6425  0f4e               L2701:
6426  0f4e ae059f        	ldw	x,#1439
6427  0f51 89            	pushw	x
6428  0f52 ae0000        	ldw	x,#0
6429  0f55 89            	pushw	x
6430  0f56 ae0000        	ldw	x,#L37
6431  0f59 cd0000        	call	_assert_failed
6433  0f5c 5b04          	addw	sp,#4
6434  0f5e               L6701:
6435                     ; 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6437  0f5e 0d01          	tnz	(OFST+1,sp)
6438  0f60 2706          	jreq	L5632
6439                     ; 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
6441  0f62 7212525c      	bset	21084,#1
6443  0f66 2004          	jra	L7632
6444  0f68               L5632:
6445                     ; 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6447  0f68 7213525c      	bres	21084,#1
6448  0f6c               L7632:
6449                     ; 1450 }
6452  0f6c 84            	pop	a
6453  0f6d 81            	ret
6490                     ; 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6490                     ; 1462 {
6491                     	switch	.text
6492  0f6e               _TIM1_OC1NPolarityConfig:
6494  0f6e 88            	push	a
6495       00000000      OFST:	set	0
6498                     ; 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6500  0f6f 4d            	tnz	a
6501  0f70 2704          	jreq	L4011
6502  0f72 a188          	cp	a,#136
6503  0f74 2603          	jrne	L2011
6504  0f76               L4011:
6505  0f76 4f            	clr	a
6506  0f77 2010          	jra	L6011
6507  0f79               L2011:
6508  0f79 ae05b8        	ldw	x,#1464
6509  0f7c 89            	pushw	x
6510  0f7d ae0000        	ldw	x,#0
6511  0f80 89            	pushw	x
6512  0f81 ae0000        	ldw	x,#L37
6513  0f84 cd0000        	call	_assert_failed
6515  0f87 5b04          	addw	sp,#4
6516  0f89               L6011:
6517                     ; 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6519  0f89 0d01          	tnz	(OFST+1,sp)
6520  0f8b 2706          	jreq	L7042
6521                     ; 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6523  0f8d 7216525c      	bset	21084,#3
6525  0f91 2004          	jra	L1142
6526  0f93               L7042:
6527                     ; 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6529  0f93 7217525c      	bres	21084,#3
6530  0f97               L1142:
6531                     ; 1475 }
6534  0f97 84            	pop	a
6535  0f98 81            	ret
6572                     ; 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6572                     ; 1487 {
6573                     	switch	.text
6574  0f99               _TIM1_OC2PolarityConfig:
6576  0f99 88            	push	a
6577       00000000      OFST:	set	0
6580                     ; 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6582  0f9a 4d            	tnz	a
6583  0f9b 2704          	jreq	L4111
6584  0f9d a122          	cp	a,#34
6585  0f9f 2603          	jrne	L2111
6586  0fa1               L4111:
6587  0fa1 4f            	clr	a
6588  0fa2 2010          	jra	L6111
6589  0fa4               L2111:
6590  0fa4 ae05d1        	ldw	x,#1489
6591  0fa7 89            	pushw	x
6592  0fa8 ae0000        	ldw	x,#0
6593  0fab 89            	pushw	x
6594  0fac ae0000        	ldw	x,#L37
6595  0faf cd0000        	call	_assert_failed
6597  0fb2 5b04          	addw	sp,#4
6598  0fb4               L6111:
6599                     ; 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6601  0fb4 0d01          	tnz	(OFST+1,sp)
6602  0fb6 2706          	jreq	L1342
6603                     ; 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
6605  0fb8 721a525c      	bset	21084,#5
6607  0fbc 2004          	jra	L3342
6608  0fbe               L1342:
6609                     ; 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6611  0fbe 721b525c      	bres	21084,#5
6612  0fc2               L3342:
6613                     ; 1500 }
6616  0fc2 84            	pop	a
6617  0fc3 81            	ret
6654                     ; 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6654                     ; 1511 {
6655                     	switch	.text
6656  0fc4               _TIM1_OC2NPolarityConfig:
6658  0fc4 88            	push	a
6659       00000000      OFST:	set	0
6662                     ; 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6664  0fc5 4d            	tnz	a
6665  0fc6 2704          	jreq	L4211
6666  0fc8 a188          	cp	a,#136
6667  0fca 2603          	jrne	L2211
6668  0fcc               L4211:
6669  0fcc 4f            	clr	a
6670  0fcd 2010          	jra	L6211
6671  0fcf               L2211:
6672  0fcf ae05e9        	ldw	x,#1513
6673  0fd2 89            	pushw	x
6674  0fd3 ae0000        	ldw	x,#0
6675  0fd6 89            	pushw	x
6676  0fd7 ae0000        	ldw	x,#L37
6677  0fda cd0000        	call	_assert_failed
6679  0fdd 5b04          	addw	sp,#4
6680  0fdf               L6211:
6681                     ; 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6683  0fdf 0d01          	tnz	(OFST+1,sp)
6684  0fe1 2706          	jreq	L3542
6685                     ; 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6687  0fe3 721e525c      	bset	21084,#7
6689  0fe7 2004          	jra	L5542
6690  0fe9               L3542:
6691                     ; 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6693  0fe9 721f525c      	bres	21084,#7
6694  0fed               L5542:
6695                     ; 1524 }
6698  0fed 84            	pop	a
6699  0fee 81            	ret
6736                     ; 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6736                     ; 1536 {
6737                     	switch	.text
6738  0fef               _TIM1_OC3PolarityConfig:
6740  0fef 88            	push	a
6741       00000000      OFST:	set	0
6744                     ; 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6746  0ff0 4d            	tnz	a
6747  0ff1 2704          	jreq	L4311
6748  0ff3 a122          	cp	a,#34
6749  0ff5 2603          	jrne	L2311
6750  0ff7               L4311:
6751  0ff7 4f            	clr	a
6752  0ff8 2010          	jra	L6311
6753  0ffa               L2311:
6754  0ffa ae0602        	ldw	x,#1538
6755  0ffd 89            	pushw	x
6756  0ffe ae0000        	ldw	x,#0
6757  1001 89            	pushw	x
6758  1002 ae0000        	ldw	x,#L37
6759  1005 cd0000        	call	_assert_failed
6761  1008 5b04          	addw	sp,#4
6762  100a               L6311:
6763                     ; 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6765  100a 0d01          	tnz	(OFST+1,sp)
6766  100c 2706          	jreq	L5742
6767                     ; 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
6769  100e 7212525d      	bset	21085,#1
6771  1012 2004          	jra	L7742
6772  1014               L5742:
6773                     ; 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6775  1014 7213525d      	bres	21085,#1
6776  1018               L7742:
6777                     ; 1549 }
6780  1018 84            	pop	a
6781  1019 81            	ret
6818                     ; 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6818                     ; 1561 {
6819                     	switch	.text
6820  101a               _TIM1_OC3NPolarityConfig:
6822  101a 88            	push	a
6823       00000000      OFST:	set	0
6826                     ; 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6828  101b 4d            	tnz	a
6829  101c 2704          	jreq	L4411
6830  101e a188          	cp	a,#136
6831  1020 2603          	jrne	L2411
6832  1022               L4411:
6833  1022 4f            	clr	a
6834  1023 2010          	jra	L6411
6835  1025               L2411:
6836  1025 ae061b        	ldw	x,#1563
6837  1028 89            	pushw	x
6838  1029 ae0000        	ldw	x,#0
6839  102c 89            	pushw	x
6840  102d ae0000        	ldw	x,#L37
6841  1030 cd0000        	call	_assert_failed
6843  1033 5b04          	addw	sp,#4
6844  1035               L6411:
6845                     ; 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6847  1035 0d01          	tnz	(OFST+1,sp)
6848  1037 2706          	jreq	L7152
6849                     ; 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6851  1039 7216525d      	bset	21085,#3
6853  103d 2004          	jra	L1252
6854  103f               L7152:
6855                     ; 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6857  103f 7217525d      	bres	21085,#3
6858  1043               L1252:
6859                     ; 1574 }
6862  1043 84            	pop	a
6863  1044 81            	ret
6900                     ; 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6900                     ; 1585 {
6901                     	switch	.text
6902  1045               _TIM1_OC4PolarityConfig:
6904  1045 88            	push	a
6905       00000000      OFST:	set	0
6908                     ; 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6910  1046 4d            	tnz	a
6911  1047 2704          	jreq	L4511
6912  1049 a122          	cp	a,#34
6913  104b 2603          	jrne	L2511
6914  104d               L4511:
6915  104d 4f            	clr	a
6916  104e 2010          	jra	L6511
6917  1050               L2511:
6918  1050 ae0633        	ldw	x,#1587
6919  1053 89            	pushw	x
6920  1054 ae0000        	ldw	x,#0
6921  1057 89            	pushw	x
6922  1058 ae0000        	ldw	x,#L37
6923  105b cd0000        	call	_assert_failed
6925  105e 5b04          	addw	sp,#4
6926  1060               L6511:
6927                     ; 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6929  1060 0d01          	tnz	(OFST+1,sp)
6930  1062 2706          	jreq	L1452
6931                     ; 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
6933  1064 721a525d      	bset	21085,#5
6935  1068 2004          	jra	L3452
6936  106a               L1452:
6937                     ; 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6939  106a 721b525d      	bres	21085,#5
6940  106e               L3452:
6941                     ; 1598 }
6944  106e 84            	pop	a
6945  106f 81            	ret
6991                     ; 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6991                     ; 1614 {
6992                     	switch	.text
6993  1070               _TIM1_CCxCmd:
6995  1070 89            	pushw	x
6996       00000000      OFST:	set	0
6999                     ; 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7001  1071 9e            	ld	a,xh
7002  1072 4d            	tnz	a
7003  1073 270f          	jreq	L4611
7004  1075 9e            	ld	a,xh
7005  1076 a101          	cp	a,#1
7006  1078 270a          	jreq	L4611
7007  107a 9e            	ld	a,xh
7008  107b a102          	cp	a,#2
7009  107d 2705          	jreq	L4611
7010  107f 9e            	ld	a,xh
7011  1080 a103          	cp	a,#3
7012  1082 2603          	jrne	L2611
7013  1084               L4611:
7014  1084 4f            	clr	a
7015  1085 2010          	jra	L6611
7016  1087               L2611:
7017  1087 ae0650        	ldw	x,#1616
7018  108a 89            	pushw	x
7019  108b ae0000        	ldw	x,#0
7020  108e 89            	pushw	x
7021  108f ae0000        	ldw	x,#L37
7022  1092 cd0000        	call	_assert_failed
7024  1095 5b04          	addw	sp,#4
7025  1097               L6611:
7026                     ; 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7028  1097 0d02          	tnz	(OFST+2,sp)
7029  1099 2706          	jreq	L2711
7030  109b 7b02          	ld	a,(OFST+2,sp)
7031  109d a101          	cp	a,#1
7032  109f 2603          	jrne	L0711
7033  10a1               L2711:
7034  10a1 4f            	clr	a
7035  10a2 2010          	jra	L4711
7036  10a4               L0711:
7037  10a4 ae0651        	ldw	x,#1617
7038  10a7 89            	pushw	x
7039  10a8 ae0000        	ldw	x,#0
7040  10ab 89            	pushw	x
7041  10ac ae0000        	ldw	x,#L37
7042  10af cd0000        	call	_assert_failed
7044  10b2 5b04          	addw	sp,#4
7045  10b4               L4711:
7046                     ; 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
7048  10b4 0d01          	tnz	(OFST+1,sp)
7049  10b6 2610          	jrne	L7652
7050                     ; 1622         if (NewState != DISABLE)
7052  10b8 0d02          	tnz	(OFST+2,sp)
7053  10ba 2706          	jreq	L1752
7054                     ; 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
7056  10bc 7210525c      	bset	21084,#0
7058  10c0 2040          	jra	L5752
7059  10c2               L1752:
7060                     ; 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7062  10c2 7211525c      	bres	21084,#0
7063  10c6 203a          	jra	L5752
7064  10c8               L7652:
7065                     ; 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
7067  10c8 7b01          	ld	a,(OFST+1,sp)
7068  10ca a101          	cp	a,#1
7069  10cc 2610          	jrne	L7752
7070                     ; 1635         if (NewState != DISABLE)
7072  10ce 0d02          	tnz	(OFST+2,sp)
7073  10d0 2706          	jreq	L1062
7074                     ; 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
7076  10d2 7218525c      	bset	21084,#4
7078  10d6 202a          	jra	L5752
7079  10d8               L1062:
7080                     ; 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7082  10d8 7219525c      	bres	21084,#4
7083  10dc 2024          	jra	L5752
7084  10de               L7752:
7085                     ; 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
7087  10de 7b01          	ld	a,(OFST+1,sp)
7088  10e0 a102          	cp	a,#2
7089  10e2 2610          	jrne	L7062
7090                     ; 1647         if (NewState != DISABLE)
7092  10e4 0d02          	tnz	(OFST+2,sp)
7093  10e6 2706          	jreq	L1162
7094                     ; 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
7096  10e8 7210525d      	bset	21085,#0
7098  10ec 2014          	jra	L5752
7099  10ee               L1162:
7100                     ; 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7102  10ee 7211525d      	bres	21085,#0
7103  10f2 200e          	jra	L5752
7104  10f4               L7062:
7105                     ; 1659         if (NewState != DISABLE)
7107  10f4 0d02          	tnz	(OFST+2,sp)
7108  10f6 2706          	jreq	L7162
7109                     ; 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
7111  10f8 7218525d      	bset	21085,#4
7113  10fc 2004          	jra	L5752
7114  10fe               L7162:
7115                     ; 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7117  10fe 7219525d      	bres	21085,#4
7118  1102               L5752:
7119                     ; 1668 }
7122  1102 85            	popw	x
7123  1103 81            	ret
7169                     ; 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7169                     ; 1682 {
7170                     	switch	.text
7171  1104               _TIM1_CCxNCmd:
7173  1104 89            	pushw	x
7174       00000000      OFST:	set	0
7177                     ; 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7179  1105 9e            	ld	a,xh
7180  1106 4d            	tnz	a
7181  1107 270a          	jreq	L2021
7182  1109 9e            	ld	a,xh
7183  110a a101          	cp	a,#1
7184  110c 2705          	jreq	L2021
7185  110e 9e            	ld	a,xh
7186  110f a102          	cp	a,#2
7187  1111 2603          	jrne	L0021
7188  1113               L2021:
7189  1113 4f            	clr	a
7190  1114 2010          	jra	L4021
7191  1116               L0021:
7192  1116 ae0694        	ldw	x,#1684
7193  1119 89            	pushw	x
7194  111a ae0000        	ldw	x,#0
7195  111d 89            	pushw	x
7196  111e ae0000        	ldw	x,#L37
7197  1121 cd0000        	call	_assert_failed
7199  1124 5b04          	addw	sp,#4
7200  1126               L4021:
7201                     ; 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7203  1126 0d02          	tnz	(OFST+2,sp)
7204  1128 2706          	jreq	L0121
7205  112a 7b02          	ld	a,(OFST+2,sp)
7206  112c a101          	cp	a,#1
7207  112e 2603          	jrne	L6021
7208  1130               L0121:
7209  1130 4f            	clr	a
7210  1131 2010          	jra	L2121
7211  1133               L6021:
7212  1133 ae0695        	ldw	x,#1685
7213  1136 89            	pushw	x
7214  1137 ae0000        	ldw	x,#0
7215  113a 89            	pushw	x
7216  113b ae0000        	ldw	x,#L37
7217  113e cd0000        	call	_assert_failed
7219  1141 5b04          	addw	sp,#4
7220  1143               L2121:
7221                     ; 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
7223  1143 0d01          	tnz	(OFST+1,sp)
7224  1145 2610          	jrne	L5462
7225                     ; 1690         if (NewState != DISABLE)
7227  1147 0d02          	tnz	(OFST+2,sp)
7228  1149 2706          	jreq	L7462
7229                     ; 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7231  114b 7214525c      	bset	21084,#2
7233  114f 202a          	jra	L3562
7234  1151               L7462:
7235                     ; 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7237  1151 7215525c      	bres	21084,#2
7238  1155 2024          	jra	L3562
7239  1157               L5462:
7240                     ; 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
7242  1157 7b01          	ld	a,(OFST+1,sp)
7243  1159 a101          	cp	a,#1
7244  115b 2610          	jrne	L5562
7245                     ; 1702         if (NewState != DISABLE)
7247  115d 0d02          	tnz	(OFST+2,sp)
7248  115f 2706          	jreq	L7562
7249                     ; 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7251  1161 721c525c      	bset	21084,#6
7253  1165 2014          	jra	L3562
7254  1167               L7562:
7255                     ; 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7257  1167 721d525c      	bres	21084,#6
7258  116b 200e          	jra	L3562
7259  116d               L5562:
7260                     ; 1714         if (NewState != DISABLE)
7262  116d 0d02          	tnz	(OFST+2,sp)
7263  116f 2706          	jreq	L5662
7264                     ; 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7266  1171 7214525d      	bset	21085,#2
7268  1175 2004          	jra	L3562
7269  1177               L5662:
7270                     ; 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7272  1177 7215525d      	bres	21085,#2
7273  117b               L3562:
7274                     ; 1723 }
7277  117b 85            	popw	x
7278  117c 81            	ret
7324                     ; 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7324                     ; 1748 {
7325                     	switch	.text
7326  117d               _TIM1_SelectOCxM:
7328  117d 89            	pushw	x
7329       00000000      OFST:	set	0
7332                     ; 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7334  117e 9e            	ld	a,xh
7335  117f 4d            	tnz	a
7336  1180 270f          	jreq	L0221
7337  1182 9e            	ld	a,xh
7338  1183 a101          	cp	a,#1
7339  1185 270a          	jreq	L0221
7340  1187 9e            	ld	a,xh
7341  1188 a102          	cp	a,#2
7342  118a 2705          	jreq	L0221
7343  118c 9e            	ld	a,xh
7344  118d a103          	cp	a,#3
7345  118f 2603          	jrne	L6121
7346  1191               L0221:
7347  1191 4f            	clr	a
7348  1192 2010          	jra	L2221
7349  1194               L6121:
7350  1194 ae06d6        	ldw	x,#1750
7351  1197 89            	pushw	x
7352  1198 ae0000        	ldw	x,#0
7353  119b 89            	pushw	x
7354  119c ae0000        	ldw	x,#L37
7355  119f cd0000        	call	_assert_failed
7357  11a2 5b04          	addw	sp,#4
7358  11a4               L2221:
7359                     ; 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7361  11a4 0d02          	tnz	(OFST+2,sp)
7362  11a6 272a          	jreq	L6221
7363  11a8 7b02          	ld	a,(OFST+2,sp)
7364  11aa a110          	cp	a,#16
7365  11ac 2724          	jreq	L6221
7366  11ae 7b02          	ld	a,(OFST+2,sp)
7367  11b0 a120          	cp	a,#32
7368  11b2 271e          	jreq	L6221
7369  11b4 7b02          	ld	a,(OFST+2,sp)
7370  11b6 a130          	cp	a,#48
7371  11b8 2718          	jreq	L6221
7372  11ba 7b02          	ld	a,(OFST+2,sp)
7373  11bc a160          	cp	a,#96
7374  11be 2712          	jreq	L6221
7375  11c0 7b02          	ld	a,(OFST+2,sp)
7376  11c2 a170          	cp	a,#112
7377  11c4 270c          	jreq	L6221
7378  11c6 7b02          	ld	a,(OFST+2,sp)
7379  11c8 a150          	cp	a,#80
7380  11ca 2706          	jreq	L6221
7381  11cc 7b02          	ld	a,(OFST+2,sp)
7382  11ce a140          	cp	a,#64
7383  11d0 2603          	jrne	L4221
7384  11d2               L6221:
7385  11d2 4f            	clr	a
7386  11d3 2010          	jra	L0321
7387  11d5               L4221:
7388  11d5 ae06d7        	ldw	x,#1751
7389  11d8 89            	pushw	x
7390  11d9 ae0000        	ldw	x,#0
7391  11dc 89            	pushw	x
7392  11dd ae0000        	ldw	x,#L37
7393  11e0 cd0000        	call	_assert_failed
7395  11e3 5b04          	addw	sp,#4
7396  11e5               L0321:
7397                     ; 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
7399  11e5 0d01          	tnz	(OFST+1,sp)
7400  11e7 2610          	jrne	L3172
7401                     ; 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7403  11e9 7211525c      	bres	21084,#0
7404                     ; 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7404                     ; 1760                                 | (uint8_t)TIM1_OCMode);
7406  11ed c65258        	ld	a,21080
7407  11f0 a48f          	and	a,#143
7408  11f2 1a02          	or	a,(OFST+2,sp)
7409  11f4 c75258        	ld	21080,a
7411  11f7 203a          	jra	L5172
7412  11f9               L3172:
7413                     ; 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
7415  11f9 7b01          	ld	a,(OFST+1,sp)
7416  11fb a101          	cp	a,#1
7417  11fd 2610          	jrne	L7172
7418                     ; 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7420  11ff 7219525c      	bres	21084,#4
7421                     ; 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7421                     ; 1769                                 | (uint8_t)TIM1_OCMode);
7423  1203 c65259        	ld	a,21081
7424  1206 a48f          	and	a,#143
7425  1208 1a02          	or	a,(OFST+2,sp)
7426  120a c75259        	ld	21081,a
7428  120d 2024          	jra	L5172
7429  120f               L7172:
7430                     ; 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
7432  120f 7b01          	ld	a,(OFST+1,sp)
7433  1211 a102          	cp	a,#2
7434  1213 2610          	jrne	L3272
7435                     ; 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7437  1215 7211525d      	bres	21085,#0
7438                     ; 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7438                     ; 1778                                 | (uint8_t)TIM1_OCMode);
7440  1219 c6525a        	ld	a,21082
7441  121c a48f          	and	a,#143
7442  121e 1a02          	or	a,(OFST+2,sp)
7443  1220 c7525a        	ld	21082,a
7445  1223 200e          	jra	L5172
7446  1225               L3272:
7447                     ; 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7449  1225 7219525d      	bres	21085,#4
7450                     ; 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7450                     ; 1787                                 | (uint8_t)TIM1_OCMode);
7452  1229 c6525b        	ld	a,21083
7453  122c a48f          	and	a,#143
7454  122e 1a02          	or	a,(OFST+2,sp)
7455  1230 c7525b        	ld	21083,a
7456  1233               L5172:
7457                     ; 1789 }
7460  1233 85            	popw	x
7461  1234 81            	ret
7493                     ; 1798 void TIM1_SetCounter(uint16_t Counter)
7493                     ; 1799 {
7494                     	switch	.text
7495  1235               _TIM1_SetCounter:
7499                     ; 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
7501  1235 9e            	ld	a,xh
7502  1236 c7525e        	ld	21086,a
7503                     ; 1802     TIM1->CNTRL = (uint8_t)(Counter);
7505  1239 9f            	ld	a,xl
7506  123a c7525f        	ld	21087,a
7507                     ; 1804 }
7510  123d 81            	ret
7542                     ; 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
7542                     ; 1814 {
7543                     	switch	.text
7544  123e               _TIM1_SetAutoreload:
7548                     ; 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7550  123e 9e            	ld	a,xh
7551  123f c75262        	ld	21090,a
7552                     ; 1818     TIM1->ARRL = (uint8_t)(Autoreload);
7554  1242 9f            	ld	a,xl
7555  1243 c75263        	ld	21091,a
7556                     ; 1820 }
7559  1246 81            	ret
7591                     ; 1829 void TIM1_SetCompare1(uint16_t Compare1)
7591                     ; 1830 {
7592                     	switch	.text
7593  1247               _TIM1_SetCompare1:
7597                     ; 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7599  1247 9e            	ld	a,xh
7600  1248 c75265        	ld	21093,a
7601                     ; 1833     TIM1->CCR1L = (uint8_t)(Compare1);
7603  124b 9f            	ld	a,xl
7604  124c c75266        	ld	21094,a
7605                     ; 1835 }
7608  124f 81            	ret
7640                     ; 1844 void TIM1_SetCompare2(uint16_t Compare2)
7640                     ; 1845 {
7641                     	switch	.text
7642  1250               _TIM1_SetCompare2:
7646                     ; 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7648  1250 9e            	ld	a,xh
7649  1251 c75267        	ld	21095,a
7650                     ; 1848     TIM1->CCR2L = (uint8_t)(Compare2);
7652  1254 9f            	ld	a,xl
7653  1255 c75268        	ld	21096,a
7654                     ; 1850 }
7657  1258 81            	ret
7689                     ; 1859 void TIM1_SetCompare3(uint16_t Compare3)
7689                     ; 1860 {
7690                     	switch	.text
7691  1259               _TIM1_SetCompare3:
7695                     ; 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7697  1259 9e            	ld	a,xh
7698  125a c75269        	ld	21097,a
7699                     ; 1863     TIM1->CCR3L = (uint8_t)(Compare3);
7701  125d 9f            	ld	a,xl
7702  125e c7526a        	ld	21098,a
7703                     ; 1865 }
7706  1261 81            	ret
7738                     ; 1874 void TIM1_SetCompare4(uint16_t Compare4)
7738                     ; 1875 {
7739                     	switch	.text
7740  1262               _TIM1_SetCompare4:
7744                     ; 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7746  1262 9e            	ld	a,xh
7747  1263 c7526b        	ld	21099,a
7748                     ; 1878     TIM1->CCR4L = (uint8_t)(Compare4);
7750  1266 9f            	ld	a,xl
7751  1267 c7526c        	ld	21100,a
7752                     ; 1879 }
7755  126a 81            	ret
7792                     ; 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7792                     ; 1893 {
7793                     	switch	.text
7794  126b               _TIM1_SetIC1Prescaler:
7796  126b 88            	push	a
7797       00000000      OFST:	set	0
7800                     ; 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7802  126c 4d            	tnz	a
7803  126d 270c          	jreq	L2521
7804  126f a104          	cp	a,#4
7805  1271 2708          	jreq	L2521
7806  1273 a108          	cp	a,#8
7807  1275 2704          	jreq	L2521
7808  1277 a10c          	cp	a,#12
7809  1279 2603          	jrne	L0521
7810  127b               L2521:
7811  127b 4f            	clr	a
7812  127c 2010          	jra	L4521
7813  127e               L0521:
7814  127e ae0767        	ldw	x,#1895
7815  1281 89            	pushw	x
7816  1282 ae0000        	ldw	x,#0
7817  1285 89            	pushw	x
7818  1286 ae0000        	ldw	x,#L37
7819  1289 cd0000        	call	_assert_failed
7821  128c 5b04          	addw	sp,#4
7822  128e               L4521:
7823                     ; 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7823                     ; 1899                             | (uint8_t)TIM1_IC1Prescaler);
7825  128e c65258        	ld	a,21080
7826  1291 a4f3          	and	a,#243
7827  1293 1a01          	or	a,(OFST+1,sp)
7828  1295 c75258        	ld	21080,a
7829                     ; 1901 }
7832  1298 84            	pop	a
7833  1299 81            	ret
7870                     ; 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7870                     ; 1914 {
7871                     	switch	.text
7872  129a               _TIM1_SetIC2Prescaler:
7874  129a 88            	push	a
7875       00000000      OFST:	set	0
7878                     ; 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7880  129b 4d            	tnz	a
7881  129c 270c          	jreq	L2621
7882  129e a104          	cp	a,#4
7883  12a0 2708          	jreq	L2621
7884  12a2 a108          	cp	a,#8
7885  12a4 2704          	jreq	L2621
7886  12a6 a10c          	cp	a,#12
7887  12a8 2603          	jrne	L0621
7888  12aa               L2621:
7889  12aa 4f            	clr	a
7890  12ab 2010          	jra	L4621
7891  12ad               L0621:
7892  12ad ae077d        	ldw	x,#1917
7893  12b0 89            	pushw	x
7894  12b1 ae0000        	ldw	x,#0
7895  12b4 89            	pushw	x
7896  12b5 ae0000        	ldw	x,#L37
7897  12b8 cd0000        	call	_assert_failed
7899  12bb 5b04          	addw	sp,#4
7900  12bd               L4621:
7901                     ; 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7901                     ; 1921                             | (uint8_t)TIM1_IC2Prescaler);
7903  12bd c65259        	ld	a,21081
7904  12c0 a4f3          	and	a,#243
7905  12c2 1a01          	or	a,(OFST+1,sp)
7906  12c4 c75259        	ld	21081,a
7907                     ; 1922 }
7910  12c7 84            	pop	a
7911  12c8 81            	ret
7948                     ; 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7948                     ; 1936 {
7949                     	switch	.text
7950  12c9               _TIM1_SetIC3Prescaler:
7952  12c9 88            	push	a
7953       00000000      OFST:	set	0
7956                     ; 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
7958  12ca 4d            	tnz	a
7959  12cb 270c          	jreq	L2721
7960  12cd a104          	cp	a,#4
7961  12cf 2708          	jreq	L2721
7962  12d1 a108          	cp	a,#8
7963  12d3 2704          	jreq	L2721
7964  12d5 a10c          	cp	a,#12
7965  12d7 2603          	jrne	L0721
7966  12d9               L2721:
7967  12d9 4f            	clr	a
7968  12da 2010          	jra	L4721
7969  12dc               L0721:
7970  12dc ae0793        	ldw	x,#1939
7971  12df 89            	pushw	x
7972  12e0 ae0000        	ldw	x,#0
7973  12e3 89            	pushw	x
7974  12e4 ae0000        	ldw	x,#L37
7975  12e7 cd0000        	call	_assert_failed
7977  12ea 5b04          	addw	sp,#4
7978  12ec               L4721:
7979                     ; 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
7979                     ; 1943                             (uint8_t)TIM1_IC3Prescaler);
7981  12ec c6525a        	ld	a,21082
7982  12ef a4f3          	and	a,#243
7983  12f1 1a01          	or	a,(OFST+1,sp)
7984  12f3 c7525a        	ld	21082,a
7985                     ; 1944 }
7988  12f6 84            	pop	a
7989  12f7 81            	ret
8026                     ; 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8026                     ; 1957 {
8027                     	switch	.text
8028  12f8               _TIM1_SetIC4Prescaler:
8030  12f8 88            	push	a
8031       00000000      OFST:	set	0
8034                     ; 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8036  12f9 4d            	tnz	a
8037  12fa 270c          	jreq	L2031
8038  12fc a104          	cp	a,#4
8039  12fe 2708          	jreq	L2031
8040  1300 a108          	cp	a,#8
8041  1302 2704          	jreq	L2031
8042  1304 a10c          	cp	a,#12
8043  1306 2603          	jrne	L0031
8044  1308               L2031:
8045  1308 4f            	clr	a
8046  1309 2010          	jra	L4031
8047  130b               L0031:
8048  130b ae07a8        	ldw	x,#1960
8049  130e 89            	pushw	x
8050  130f ae0000        	ldw	x,#0
8051  1312 89            	pushw	x
8052  1313 ae0000        	ldw	x,#L37
8053  1316 cd0000        	call	_assert_failed
8055  1319 5b04          	addw	sp,#4
8056  131b               L4031:
8057                     ; 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8057                     ; 1964                             (uint8_t)TIM1_IC4Prescaler);
8059  131b c6525b        	ld	a,21083
8060  131e a4f3          	and	a,#243
8061  1320 1a01          	or	a,(OFST+1,sp)
8062  1322 c7525b        	ld	21083,a
8063                     ; 1965 }
8066  1325 84            	pop	a
8067  1326 81            	ret
8113                     ; 1972 uint16_t TIM1_GetCapture1(void)
8113                     ; 1973 {
8114                     	switch	.text
8115  1327               _TIM1_GetCapture1:
8117  1327 5204          	subw	sp,#4
8118       00000004      OFST:	set	4
8121                     ; 1976     uint16_t tmpccr1 = 0;
8123                     ; 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
8127                     ; 1979     tmpccr1h = TIM1->CCR1H;
8129  1329 c65265        	ld	a,21093
8130  132c 6b02          	ld	(OFST-2,sp),a
8131                     ; 1980     tmpccr1l = TIM1->CCR1L;
8133  132e c65266        	ld	a,21094
8134  1331 6b01          	ld	(OFST-3,sp),a
8135                     ; 1982     tmpccr1 = (uint16_t)(tmpccr1l);
8137  1333 7b01          	ld	a,(OFST-3,sp)
8138  1335 5f            	clrw	x
8139  1336 97            	ld	xl,a
8140  1337 1f03          	ldw	(OFST-1,sp),x
8141                     ; 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8143  1339 7b02          	ld	a,(OFST-2,sp)
8144  133b 5f            	clrw	x
8145  133c 97            	ld	xl,a
8146  133d 4f            	clr	a
8147  133e 02            	rlwa	x,a
8148  133f 01            	rrwa	x,a
8149  1340 1a04          	or	a,(OFST+0,sp)
8150  1342 01            	rrwa	x,a
8151  1343 1a03          	or	a,(OFST-1,sp)
8152  1345 01            	rrwa	x,a
8153  1346 1f03          	ldw	(OFST-1,sp),x
8154                     ; 1985     return (uint16_t)tmpccr1;
8156  1348 1e03          	ldw	x,(OFST-1,sp)
8159  134a 5b04          	addw	sp,#4
8160  134c 81            	ret
8206                     ; 1993 uint16_t TIM1_GetCapture2(void)
8206                     ; 1994 {
8207                     	switch	.text
8208  134d               _TIM1_GetCapture2:
8210  134d 5204          	subw	sp,#4
8211       00000004      OFST:	set	4
8214                     ; 1997     uint16_t tmpccr2 = 0;
8216                     ; 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
8220                     ; 2000     tmpccr2h = TIM1->CCR2H;
8222  134f c65267        	ld	a,21095
8223  1352 6b02          	ld	(OFST-2,sp),a
8224                     ; 2001     tmpccr2l = TIM1->CCR2L;
8226  1354 c65268        	ld	a,21096
8227  1357 6b01          	ld	(OFST-3,sp),a
8228                     ; 2003     tmpccr2 = (uint16_t)(tmpccr2l);
8230  1359 7b01          	ld	a,(OFST-3,sp)
8231  135b 5f            	clrw	x
8232  135c 97            	ld	xl,a
8233  135d 1f03          	ldw	(OFST-1,sp),x
8234                     ; 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8236  135f 7b02          	ld	a,(OFST-2,sp)
8237  1361 5f            	clrw	x
8238  1362 97            	ld	xl,a
8239  1363 4f            	clr	a
8240  1364 02            	rlwa	x,a
8241  1365 01            	rrwa	x,a
8242  1366 1a04          	or	a,(OFST+0,sp)
8243  1368 01            	rrwa	x,a
8244  1369 1a03          	or	a,(OFST-1,sp)
8245  136b 01            	rrwa	x,a
8246  136c 1f03          	ldw	(OFST-1,sp),x
8247                     ; 2006     return (uint16_t)tmpccr2;
8249  136e 1e03          	ldw	x,(OFST-1,sp)
8252  1370 5b04          	addw	sp,#4
8253  1372 81            	ret
8299                     ; 2014 uint16_t TIM1_GetCapture3(void)
8299                     ; 2015 {
8300                     	switch	.text
8301  1373               _TIM1_GetCapture3:
8303  1373 5204          	subw	sp,#4
8304       00000004      OFST:	set	4
8307                     ; 2017     uint16_t tmpccr3 = 0;
8309                     ; 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
8313                     ; 2020     tmpccr3h = TIM1->CCR3H;
8315  1375 c65269        	ld	a,21097
8316  1378 6b02          	ld	(OFST-2,sp),a
8317                     ; 2021     tmpccr3l = TIM1->CCR3L;
8319  137a c6526a        	ld	a,21098
8320  137d 6b01          	ld	(OFST-3,sp),a
8321                     ; 2023     tmpccr3 = (uint16_t)(tmpccr3l);
8323  137f 7b01          	ld	a,(OFST-3,sp)
8324  1381 5f            	clrw	x
8325  1382 97            	ld	xl,a
8326  1383 1f03          	ldw	(OFST-1,sp),x
8327                     ; 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8329  1385 7b02          	ld	a,(OFST-2,sp)
8330  1387 5f            	clrw	x
8331  1388 97            	ld	xl,a
8332  1389 4f            	clr	a
8333  138a 02            	rlwa	x,a
8334  138b 01            	rrwa	x,a
8335  138c 1a04          	or	a,(OFST+0,sp)
8336  138e 01            	rrwa	x,a
8337  138f 1a03          	or	a,(OFST-1,sp)
8338  1391 01            	rrwa	x,a
8339  1392 1f03          	ldw	(OFST-1,sp),x
8340                     ; 2026     return (uint16_t)tmpccr3;
8342  1394 1e03          	ldw	x,(OFST-1,sp)
8345  1396 5b04          	addw	sp,#4
8346  1398 81            	ret
8392                     ; 2034 uint16_t TIM1_GetCapture4(void)
8392                     ; 2035 {
8393                     	switch	.text
8394  1399               _TIM1_GetCapture4:
8396  1399 5204          	subw	sp,#4
8397       00000004      OFST:	set	4
8400                     ; 2037     uint16_t tmpccr4 = 0;
8402                     ; 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
8406                     ; 2040     tmpccr4h = TIM1->CCR4H;
8408  139b c6526b        	ld	a,21099
8409  139e 6b02          	ld	(OFST-2,sp),a
8410                     ; 2041     tmpccr4l = TIM1->CCR4L;
8412  13a0 c6526c        	ld	a,21100
8413  13a3 6b01          	ld	(OFST-3,sp),a
8414                     ; 2043     tmpccr4 = (uint16_t)(tmpccr4l);
8416  13a5 7b01          	ld	a,(OFST-3,sp)
8417  13a7 5f            	clrw	x
8418  13a8 97            	ld	xl,a
8419  13a9 1f03          	ldw	(OFST-1,sp),x
8420                     ; 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8422  13ab 7b02          	ld	a,(OFST-2,sp)
8423  13ad 5f            	clrw	x
8424  13ae 97            	ld	xl,a
8425  13af 4f            	clr	a
8426  13b0 02            	rlwa	x,a
8427  13b1 01            	rrwa	x,a
8428  13b2 1a04          	or	a,(OFST+0,sp)
8429  13b4 01            	rrwa	x,a
8430  13b5 1a03          	or	a,(OFST-1,sp)
8431  13b7 01            	rrwa	x,a
8432  13b8 1f03          	ldw	(OFST-1,sp),x
8433                     ; 2046     return (uint16_t)tmpccr4;
8435  13ba 1e03          	ldw	x,(OFST-1,sp)
8438  13bc 5b04          	addw	sp,#4
8439  13be 81            	ret
8471                     ; 2054 uint16_t TIM1_GetCounter(void)
8471                     ; 2055 {
8472                     	switch	.text
8473  13bf               _TIM1_GetCounter:
8475  13bf 89            	pushw	x
8476       00000002      OFST:	set	2
8479                     ; 2056   uint16_t tmpcntr = 0;
8481                     ; 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8483  13c0 c6525e        	ld	a,21086
8484  13c3 5f            	clrw	x
8485  13c4 97            	ld	xl,a
8486  13c5 4f            	clr	a
8487  13c6 02            	rlwa	x,a
8488  13c7 1f01          	ldw	(OFST-1,sp),x
8489                     ; 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8491  13c9 c6525f        	ld	a,21087
8492  13cc 5f            	clrw	x
8493  13cd 97            	ld	xl,a
8494  13ce 01            	rrwa	x,a
8495  13cf 1a02          	or	a,(OFST+0,sp)
8496  13d1 01            	rrwa	x,a
8497  13d2 1a01          	or	a,(OFST-1,sp)
8498  13d4 01            	rrwa	x,a
8501  13d5 5b02          	addw	sp,#2
8502  13d7 81            	ret
8534                     ; 2069 uint16_t TIM1_GetPrescaler(void)
8534                     ; 2070 {
8535                     	switch	.text
8536  13d8               _TIM1_GetPrescaler:
8538  13d8 89            	pushw	x
8539       00000002      OFST:	set	2
8542                     ; 2071    uint16_t temp = 0;
8544                     ; 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
8546  13d9 c65260        	ld	a,21088
8547  13dc 5f            	clrw	x
8548  13dd 97            	ld	xl,a
8549  13de 4f            	clr	a
8550  13df 02            	rlwa	x,a
8551  13e0 1f01          	ldw	(OFST-1,sp),x
8552                     ; 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8554  13e2 c65261        	ld	a,21089
8555  13e5 5f            	clrw	x
8556  13e6 97            	ld	xl,a
8557  13e7 01            	rrwa	x,a
8558  13e8 1a02          	or	a,(OFST+0,sp)
8559  13ea 01            	rrwa	x,a
8560  13eb 1a01          	or	a,(OFST-1,sp)
8561  13ed 01            	rrwa	x,a
8564  13ee 5b02          	addw	sp,#2
8565  13f0 81            	ret
8736                     ; 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8736                     ; 2098 {
8737                     	switch	.text
8738  13f1               _TIM1_GetFlagStatus:
8740  13f1 89            	pushw	x
8741  13f2 89            	pushw	x
8742       00000002      OFST:	set	2
8745                     ; 2099     FlagStatus bitstatus = RESET;
8747                     ; 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8751                     ; 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8753  13f3 a30001        	cpw	x,#1
8754  13f6 2737          	jreq	L6231
8755  13f8 a30002        	cpw	x,#2
8756  13fb 2732          	jreq	L6231
8757  13fd a30004        	cpw	x,#4
8758  1400 272d          	jreq	L6231
8759  1402 a30008        	cpw	x,#8
8760  1405 2728          	jreq	L6231
8761  1407 a30010        	cpw	x,#16
8762  140a 2723          	jreq	L6231
8763  140c a30020        	cpw	x,#32
8764  140f 271e          	jreq	L6231
8765  1411 a30040        	cpw	x,#64
8766  1414 2719          	jreq	L6231
8767  1416 a30080        	cpw	x,#128
8768  1419 2714          	jreq	L6231
8769  141b a30200        	cpw	x,#512
8770  141e 270f          	jreq	L6231
8771  1420 a30400        	cpw	x,#1024
8772  1423 270a          	jreq	L6231
8773  1425 a30800        	cpw	x,#2048
8774  1428 2705          	jreq	L6231
8775  142a a31000        	cpw	x,#4096
8776  142d 2603          	jrne	L4231
8777  142f               L6231:
8778  142f 4f            	clr	a
8779  1430 2010          	jra	L0331
8780  1432               L4231:
8781  1432 ae0837        	ldw	x,#2103
8782  1435 89            	pushw	x
8783  1436 ae0000        	ldw	x,#0
8784  1439 89            	pushw	x
8785  143a ae0000        	ldw	x,#L37
8786  143d cd0000        	call	_assert_failed
8788  1440 5b04          	addw	sp,#4
8789  1442               L0331:
8790                     ; 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8792  1442 c65255        	ld	a,21077
8793  1445 1404          	and	a,(OFST+2,sp)
8794  1447 6b01          	ld	(OFST-1,sp),a
8795                     ; 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8797  1449 7b03          	ld	a,(OFST+1,sp)
8798  144b 6b02          	ld	(OFST+0,sp),a
8799                     ; 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8801  144d c65256        	ld	a,21078
8802  1450 1402          	and	a,(OFST+0,sp)
8803  1452 1a01          	or	a,(OFST-1,sp)
8804  1454 2706          	jreq	L1533
8805                     ; 2110         bitstatus = SET;
8807  1456 a601          	ld	a,#1
8808  1458 6b02          	ld	(OFST+0,sp),a
8810  145a 2002          	jra	L3533
8811  145c               L1533:
8812                     ; 2114         bitstatus = RESET;
8814  145c 0f02          	clr	(OFST+0,sp)
8815  145e               L3533:
8816                     ; 2116     return (FlagStatus)(bitstatus);
8818  145e 7b02          	ld	a,(OFST+0,sp)
8821  1460 5b04          	addw	sp,#4
8822  1462 81            	ret
8858                     ; 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8858                     ; 2138 {
8859                     	switch	.text
8860  1463               _TIM1_ClearFlag:
8862  1463 89            	pushw	x
8863       00000000      OFST:	set	0
8866                     ; 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8868  1464 01            	rrwa	x,a
8869  1465 9f            	ld	a,xl
8870  1466 a4e1          	and	a,#225
8871  1468 97            	ld	xl,a
8872  1469 4f            	clr	a
8873  146a 02            	rlwa	x,a
8874  146b 5d            	tnzw	x
8875  146c 2607          	jrne	L4331
8876  146e 1e01          	ldw	x,(OFST+1,sp)
8877  1470 2703          	jreq	L4331
8878  1472 4f            	clr	a
8879  1473 2010          	jra	L6331
8880  1475               L4331:
8881  1475 ae085c        	ldw	x,#2140
8882  1478 89            	pushw	x
8883  1479 ae0000        	ldw	x,#0
8884  147c 89            	pushw	x
8885  147d ae0000        	ldw	x,#L37
8886  1480 cd0000        	call	_assert_failed
8888  1483 5b04          	addw	sp,#4
8889  1485               L6331:
8890                     ; 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8892  1485 7b02          	ld	a,(OFST+2,sp)
8893  1487 43            	cpl	a
8894  1488 c75255        	ld	21077,a
8895                     ; 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8895                     ; 2145                           (uint8_t)0x1E);
8897  148b 7b01          	ld	a,(OFST+1,sp)
8898  148d 43            	cpl	a
8899  148e a41e          	and	a,#30
8900  1490 c75256        	ld	21078,a
8901                     ; 2146 }
8904  1493 85            	popw	x
8905  1494 81            	ret
8966                     ; 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
8966                     ; 2163 {
8967                     	switch	.text
8968  1495               _TIM1_GetITStatus:
8970  1495 88            	push	a
8971  1496 89            	pushw	x
8972       00000002      OFST:	set	2
8975                     ; 2164     ITStatus bitstatus = RESET;
8977                     ; 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
8981                     ; 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
8983  1497 a101          	cp	a,#1
8984  1499 271c          	jreq	L4431
8985  149b a102          	cp	a,#2
8986  149d 2718          	jreq	L4431
8987  149f a104          	cp	a,#4
8988  14a1 2714          	jreq	L4431
8989  14a3 a108          	cp	a,#8
8990  14a5 2710          	jreq	L4431
8991  14a7 a110          	cp	a,#16
8992  14a9 270c          	jreq	L4431
8993  14ab a120          	cp	a,#32
8994  14ad 2708          	jreq	L4431
8995  14af a140          	cp	a,#64
8996  14b1 2704          	jreq	L4431
8997  14b3 a180          	cp	a,#128
8998  14b5 2603          	jrne	L2431
8999  14b7               L4431:
9000  14b7 4f            	clr	a
9001  14b8 2010          	jra	L6431
9002  14ba               L2431:
9003  14ba ae0878        	ldw	x,#2168
9004  14bd 89            	pushw	x
9005  14be ae0000        	ldw	x,#0
9006  14c1 89            	pushw	x
9007  14c2 ae0000        	ldw	x,#L37
9008  14c5 cd0000        	call	_assert_failed
9010  14c8 5b04          	addw	sp,#4
9011  14ca               L6431:
9012                     ; 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9014  14ca c65255        	ld	a,21077
9015  14cd 1403          	and	a,(OFST+1,sp)
9016  14cf 6b01          	ld	(OFST-1,sp),a
9017                     ; 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9019  14d1 c65254        	ld	a,21076
9020  14d4 1403          	and	a,(OFST+1,sp)
9021  14d6 6b02          	ld	(OFST+0,sp),a
9022                     ; 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9024  14d8 0d01          	tnz	(OFST-1,sp)
9025  14da 270a          	jreq	L1243
9027  14dc 0d02          	tnz	(OFST+0,sp)
9028  14de 2706          	jreq	L1243
9029                     ; 2176         bitstatus = SET;
9031  14e0 a601          	ld	a,#1
9032  14e2 6b02          	ld	(OFST+0,sp),a
9034  14e4 2002          	jra	L3243
9035  14e6               L1243:
9036                     ; 2180         bitstatus = RESET;
9038  14e6 0f02          	clr	(OFST+0,sp)
9039  14e8               L3243:
9040                     ; 2182     return (ITStatus)(bitstatus);
9042  14e8 7b02          	ld	a,(OFST+0,sp)
9045  14ea 5b03          	addw	sp,#3
9046  14ec 81            	ret
9083                     ; 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9083                     ; 2200 {
9084                     	switch	.text
9085  14ed               _TIM1_ClearITPendingBit:
9087  14ed 88            	push	a
9088       00000000      OFST:	set	0
9091                     ; 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
9093  14ee 4d            	tnz	a
9094  14ef 2703          	jreq	L2531
9095  14f1 4f            	clr	a
9096  14f2 2010          	jra	L4531
9097  14f4               L2531:
9098  14f4 ae089a        	ldw	x,#2202
9099  14f7 89            	pushw	x
9100  14f8 ae0000        	ldw	x,#0
9101  14fb 89            	pushw	x
9102  14fc ae0000        	ldw	x,#L37
9103  14ff cd0000        	call	_assert_failed
9105  1502 5b04          	addw	sp,#4
9106  1504               L4531:
9107                     ; 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9109  1504 7b01          	ld	a,(OFST+1,sp)
9110  1506 43            	cpl	a
9111  1507 c75255        	ld	21077,a
9112                     ; 2206 }
9115  150a 84            	pop	a
9116  150b 81            	ret
9162                     ; 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
9162                     ; 2225                        uint8_t TIM1_ICSelection,
9162                     ; 2226                        uint8_t TIM1_ICFilter)
9162                     ; 2227 {
9163                     	switch	.text
9164  150c               L3_TI1_Config:
9166  150c 89            	pushw	x
9167  150d 88            	push	a
9168       00000001      OFST:	set	1
9171                     ; 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9173  150e 7211525c      	bres	21084,#0
9174                     ; 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9174                     ; 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9176  1512 7b06          	ld	a,(OFST+5,sp)
9177  1514 97            	ld	xl,a
9178  1515 a610          	ld	a,#16
9179  1517 42            	mul	x,a
9180  1518 9f            	ld	a,xl
9181  1519 1a03          	or	a,(OFST+2,sp)
9182  151b 6b01          	ld	(OFST+0,sp),a
9183  151d c65258        	ld	a,21080
9184  1520 a40c          	and	a,#12
9185  1522 1a01          	or	a,(OFST+0,sp)
9186  1524 c75258        	ld	21080,a
9187                     ; 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9189  1527 0d02          	tnz	(OFST+1,sp)
9190  1529 2706          	jreq	L3643
9191                     ; 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
9193  152b 7212525c      	bset	21084,#1
9195  152f 2004          	jra	L5643
9196  1531               L3643:
9197                     ; 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9199  1531 7213525c      	bres	21084,#1
9200  1535               L5643:
9201                     ; 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9203  1535 7210525c      	bset	21084,#0
9204                     ; 2248 }
9207  1539 5b03          	addw	sp,#3
9208  153b 81            	ret
9254                     ; 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
9254                     ; 2267                        uint8_t TIM1_ICSelection,
9254                     ; 2268                        uint8_t TIM1_ICFilter)
9254                     ; 2269 {
9255                     	switch	.text
9256  153c               L5_TI2_Config:
9258  153c 89            	pushw	x
9259  153d 88            	push	a
9260       00000001      OFST:	set	1
9263                     ; 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9265  153e 7219525c      	bres	21084,#4
9266                     ; 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9266                     ; 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9268  1542 7b06          	ld	a,(OFST+5,sp)
9269  1544 97            	ld	xl,a
9270  1545 a610          	ld	a,#16
9271  1547 42            	mul	x,a
9272  1548 9f            	ld	a,xl
9273  1549 1a03          	or	a,(OFST+2,sp)
9274  154b 6b01          	ld	(OFST+0,sp),a
9275  154d c65259        	ld	a,21081
9276  1550 a40c          	and	a,#12
9277  1552 1a01          	or	a,(OFST+0,sp)
9278  1554 c75259        	ld	21081,a
9279                     ; 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9281  1557 0d02          	tnz	(OFST+1,sp)
9282  1559 2706          	jreq	L7053
9283                     ; 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
9285  155b 721a525c      	bset	21084,#5
9287  155f 2004          	jra	L1153
9288  1561               L7053:
9289                     ; 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9291  1561 721b525c      	bres	21084,#5
9292  1565               L1153:
9293                     ; 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9295  1565 7218525c      	bset	21084,#4
9296                     ; 2287 }
9299  1569 5b03          	addw	sp,#3
9300  156b 81            	ret
9346                     ; 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
9346                     ; 2306                        uint8_t TIM1_ICSelection,
9346                     ; 2307                        uint8_t TIM1_ICFilter)
9346                     ; 2308 {
9347                     	switch	.text
9348  156c               L7_TI3_Config:
9350  156c 89            	pushw	x
9351  156d 88            	push	a
9352       00000001      OFST:	set	1
9355                     ; 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9357  156e 7211525d      	bres	21085,#0
9358                     ; 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9358                     ; 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9360  1572 7b06          	ld	a,(OFST+5,sp)
9361  1574 97            	ld	xl,a
9362  1575 a610          	ld	a,#16
9363  1577 42            	mul	x,a
9364  1578 9f            	ld	a,xl
9365  1579 1a03          	or	a,(OFST+2,sp)
9366  157b 6b01          	ld	(OFST+0,sp),a
9367  157d c6525a        	ld	a,21082
9368  1580 a40c          	and	a,#12
9369  1582 1a01          	or	a,(OFST+0,sp)
9370  1584 c7525a        	ld	21082,a
9371                     ; 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9373  1587 0d02          	tnz	(OFST+1,sp)
9374  1589 2706          	jreq	L3353
9375                     ; 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
9377  158b 7212525d      	bset	21085,#1
9379  158f 2004          	jra	L5353
9380  1591               L3353:
9381                     ; 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9383  1591 7213525d      	bres	21085,#1
9384  1595               L5353:
9385                     ; 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9387  1595 7210525d      	bset	21085,#0
9388                     ; 2327 }
9391  1599 5b03          	addw	sp,#3
9392  159b 81            	ret
9438                     ; 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
9438                     ; 2347                        uint8_t TIM1_ICSelection,
9438                     ; 2348                        uint8_t TIM1_ICFilter)
9438                     ; 2349 {
9439                     	switch	.text
9440  159c               L11_TI4_Config:
9442  159c 89            	pushw	x
9443  159d 88            	push	a
9444       00000001      OFST:	set	1
9447                     ; 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9449  159e 7219525d      	bres	21085,#4
9450                     ; 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9450                     ; 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9452  15a2 7b06          	ld	a,(OFST+5,sp)
9453  15a4 97            	ld	xl,a
9454  15a5 a610          	ld	a,#16
9455  15a7 42            	mul	x,a
9456  15a8 9f            	ld	a,xl
9457  15a9 1a03          	or	a,(OFST+2,sp)
9458  15ab 6b01          	ld	(OFST+0,sp),a
9459  15ad c6525b        	ld	a,21083
9460  15b0 a40c          	and	a,#12
9461  15b2 1a01          	or	a,(OFST+0,sp)
9462  15b4 c7525b        	ld	21083,a
9463                     ; 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9465  15b7 0d02          	tnz	(OFST+1,sp)
9466  15b9 2706          	jreq	L7553
9467                     ; 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
9469  15bb 721a525d      	bset	21085,#5
9471  15bf 2004          	jra	L1653
9472  15c1               L7553:
9473                     ; 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9475  15c1 721b525d      	bres	21085,#5
9476  15c5               L1653:
9477                     ; 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9479  15c5 7218525d      	bset	21085,#4
9480                     ; 2370 }
9483  15c9 5b03          	addw	sp,#3
9484  15cb 81            	ret
9497                     	xdef	_TIM1_ClearITPendingBit
9498                     	xdef	_TIM1_GetITStatus
9499                     	xdef	_TIM1_ClearFlag
9500                     	xdef	_TIM1_GetFlagStatus
9501                     	xdef	_TIM1_GetPrescaler
9502                     	xdef	_TIM1_GetCounter
9503                     	xdef	_TIM1_GetCapture4
9504                     	xdef	_TIM1_GetCapture3
9505                     	xdef	_TIM1_GetCapture2
9506                     	xdef	_TIM1_GetCapture1
9507                     	xdef	_TIM1_SetIC4Prescaler
9508                     	xdef	_TIM1_SetIC3Prescaler
9509                     	xdef	_TIM1_SetIC2Prescaler
9510                     	xdef	_TIM1_SetIC1Prescaler
9511                     	xdef	_TIM1_SetCompare4
9512                     	xdef	_TIM1_SetCompare3
9513                     	xdef	_TIM1_SetCompare2
9514                     	xdef	_TIM1_SetCompare1
9515                     	xdef	_TIM1_SetAutoreload
9516                     	xdef	_TIM1_SetCounter
9517                     	xdef	_TIM1_SelectOCxM
9518                     	xdef	_TIM1_CCxNCmd
9519                     	xdef	_TIM1_CCxCmd
9520                     	xdef	_TIM1_OC4PolarityConfig
9521                     	xdef	_TIM1_OC3NPolarityConfig
9522                     	xdef	_TIM1_OC3PolarityConfig
9523                     	xdef	_TIM1_OC2NPolarityConfig
9524                     	xdef	_TIM1_OC2PolarityConfig
9525                     	xdef	_TIM1_OC1NPolarityConfig
9526                     	xdef	_TIM1_OC1PolarityConfig
9527                     	xdef	_TIM1_GenerateEvent
9528                     	xdef	_TIM1_OC4FastConfig
9529                     	xdef	_TIM1_OC3FastConfig
9530                     	xdef	_TIM1_OC2FastConfig
9531                     	xdef	_TIM1_OC1FastConfig
9532                     	xdef	_TIM1_OC4PreloadConfig
9533                     	xdef	_TIM1_OC3PreloadConfig
9534                     	xdef	_TIM1_OC2PreloadConfig
9535                     	xdef	_TIM1_OC1PreloadConfig
9536                     	xdef	_TIM1_CCPreloadControl
9537                     	xdef	_TIM1_SelectCOM
9538                     	xdef	_TIM1_ARRPreloadConfig
9539                     	xdef	_TIM1_ForcedOC4Config
9540                     	xdef	_TIM1_ForcedOC3Config
9541                     	xdef	_TIM1_ForcedOC2Config
9542                     	xdef	_TIM1_ForcedOC1Config
9543                     	xdef	_TIM1_CounterModeConfig
9544                     	xdef	_TIM1_PrescalerConfig
9545                     	xdef	_TIM1_EncoderInterfaceConfig
9546                     	xdef	_TIM1_SelectMasterSlaveMode
9547                     	xdef	_TIM1_SelectSlaveMode
9548                     	xdef	_TIM1_SelectOutputTrigger
9549                     	xdef	_TIM1_SelectOnePulseMode
9550                     	xdef	_TIM1_SelectHallSensor
9551                     	xdef	_TIM1_UpdateRequestConfig
9552                     	xdef	_TIM1_UpdateDisableConfig
9553                     	xdef	_TIM1_SelectInputTrigger
9554                     	xdef	_TIM1_TIxExternalClockConfig
9555                     	xdef	_TIM1_ETRConfig
9556                     	xdef	_TIM1_ETRClockMode2Config
9557                     	xdef	_TIM1_ETRClockMode1Config
9558                     	xdef	_TIM1_InternalClockConfig
9559                     	xdef	_TIM1_ITConfig
9560                     	xdef	_TIM1_CtrlPWMOutputs
9561                     	xdef	_TIM1_Cmd
9562                     	xdef	_TIM1_PWMIConfig
9563                     	xdef	_TIM1_ICInit
9564                     	xdef	_TIM1_BDTRConfig
9565                     	xdef	_TIM1_OC4Init
9566                     	xdef	_TIM1_OC3Init
9567                     	xdef	_TIM1_OC2Init
9568                     	xdef	_TIM1_OC1Init
9569                     	xdef	_TIM1_TimeBaseInit
9570                     	xdef	_TIM1_DeInit
9571                     	xref	_assert_failed
9572                     .const:	section	.text
9573  0000               L37:
9574  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
9575  0012 696d312e6300  	dc.b	"im1.c",0
9595                     	end

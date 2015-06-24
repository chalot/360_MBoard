   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 52 void TIM1_DeInit(void)
  44                     ; 53 {
  46                     	switch	.text
  47  0000               _TIM1_DeInit:
  51                     ; 54     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 55     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 56     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 57     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 58     TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 59     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 61     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 62     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 64     TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 65     TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 66     TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 67     TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 69     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 70     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 71     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 72     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 73     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 74     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 75     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 76     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 77     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 78     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 79     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 80     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 81     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 82     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 83     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 84     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 85     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 86     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 87     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 88     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 89     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 90     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 91     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 92     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 93     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 94     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 95 }
 168  0098 81            	ret
 278                     ; 105 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 106                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 107                        uint16_t TIM1_Period,
 278                     ; 108                        uint8_t TIM1_RepetitionCounter)
 278                     ; 109 {
 279                     	switch	.text
 280  0099               _TIM1_TimeBaseInit:
 282  0099 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 112     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288  009a 0d05          	tnz	(OFST+5,sp)
 289  009c 2718          	jreq	L21
 290  009e 7b05          	ld	a,(OFST+5,sp)
 291  00a0 a110          	cp	a,#16
 292  00a2 2712          	jreq	L21
 293  00a4 7b05          	ld	a,(OFST+5,sp)
 294  00a6 a120          	cp	a,#32
 295  00a8 270c          	jreq	L21
 296  00aa 7b05          	ld	a,(OFST+5,sp)
 297  00ac a140          	cp	a,#64
 298  00ae 2706          	jreq	L21
 299  00b0 7b05          	ld	a,(OFST+5,sp)
 300  00b2 a160          	cp	a,#96
 301  00b4 2603          	jrne	L01
 302  00b6               L21:
 303  00b6 4f            	clr	a
 304  00b7 2010          	jra	L41
 305  00b9               L01:
 306  00b9 ae0070        	ldw	x,#112
 307  00bc 89            	pushw	x
 308  00bd ae0000        	ldw	x,#0
 309  00c0 89            	pushw	x
 310  00c1 ae0000        	ldw	x,#L101
 311  00c4 cd0000        	call	_assert_failed
 313  00c7 5b04          	addw	sp,#4
 314  00c9               L41:
 315                     ; 115     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 317  00c9 7b06          	ld	a,(OFST+6,sp)
 318  00cb c75262        	ld	21090,a
 319                     ; 116     TIM1->ARRL = (uint8_t)(TIM1_Period);
 321  00ce 7b07          	ld	a,(OFST+7,sp)
 322  00d0 c75263        	ld	21091,a
 323                     ; 119     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 325  00d3 7b01          	ld	a,(OFST+1,sp)
 326  00d5 c75260        	ld	21088,a
 327                     ; 120     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 329  00d8 7b02          	ld	a,(OFST+2,sp)
 330  00da c75261        	ld	21089,a
 331                     ; 123     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 331                     ; 124                            | (uint8_t)(TIM1_CounterMode));
 333  00dd c65250        	ld	a,21072
 334  00e0 a48f          	and	a,#143
 335  00e2 1a05          	or	a,(OFST+5,sp)
 336  00e4 c75250        	ld	21072,a
 337                     ; 127     TIM1->RCR = TIM1_RepetitionCounter;
 339  00e7 7b08          	ld	a,(OFST+8,sp)
 340  00e9 c75264        	ld	21092,a
 341                     ; 129 }
 344  00ec 85            	popw	x
 345  00ed 81            	ret
 631                     ; 150 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 631                     ; 151                   TIM1_OutputState_TypeDef TIM1_OutputState,
 631                     ; 152                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 631                     ; 153                   uint16_t TIM1_Pulse,
 631                     ; 154                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 631                     ; 155                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 631                     ; 156                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 631                     ; 157                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 631                     ; 158 {
 632                     	switch	.text
 633  00ee               _TIM1_OC1Init:
 635  00ee 89            	pushw	x
 636  00ef 5203          	subw	sp,#3
 637       00000003      OFST:	set	3
 640                     ; 160     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 642  00f1 9e            	ld	a,xh
 643  00f2 4d            	tnz	a
 644  00f3 2719          	jreq	L22
 645  00f5 9e            	ld	a,xh
 646  00f6 a110          	cp	a,#16
 647  00f8 2714          	jreq	L22
 648  00fa 9e            	ld	a,xh
 649  00fb a120          	cp	a,#32
 650  00fd 270f          	jreq	L22
 651  00ff 9e            	ld	a,xh
 652  0100 a130          	cp	a,#48
 653  0102 270a          	jreq	L22
 654  0104 9e            	ld	a,xh
 655  0105 a160          	cp	a,#96
 656  0107 2705          	jreq	L22
 657  0109 9e            	ld	a,xh
 658  010a a170          	cp	a,#112
 659  010c 2603          	jrne	L02
 660  010e               L22:
 661  010e 4f            	clr	a
 662  010f 2010          	jra	L42
 663  0111               L02:
 664  0111 ae00a0        	ldw	x,#160
 665  0114 89            	pushw	x
 666  0115 ae0000        	ldw	x,#0
 667  0118 89            	pushw	x
 668  0119 ae0000        	ldw	x,#L101
 669  011c cd0000        	call	_assert_failed
 671  011f 5b04          	addw	sp,#4
 672  0121               L42:
 673                     ; 161     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 675  0121 0d05          	tnz	(OFST+2,sp)
 676  0123 2706          	jreq	L03
 677  0125 7b05          	ld	a,(OFST+2,sp)
 678  0127 a111          	cp	a,#17
 679  0129 2603          	jrne	L62
 680  012b               L03:
 681  012b 4f            	clr	a
 682  012c 2010          	jra	L23
 683  012e               L62:
 684  012e ae00a1        	ldw	x,#161
 685  0131 89            	pushw	x
 686  0132 ae0000        	ldw	x,#0
 687  0135 89            	pushw	x
 688  0136 ae0000        	ldw	x,#L101
 689  0139 cd0000        	call	_assert_failed
 691  013c 5b04          	addw	sp,#4
 692  013e               L23:
 693                     ; 162     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 695  013e 0d08          	tnz	(OFST+5,sp)
 696  0140 2706          	jreq	L63
 697  0142 7b08          	ld	a,(OFST+5,sp)
 698  0144 a144          	cp	a,#68
 699  0146 2603          	jrne	L43
 700  0148               L63:
 701  0148 4f            	clr	a
 702  0149 2010          	jra	L04
 703  014b               L43:
 704  014b ae00a2        	ldw	x,#162
 705  014e 89            	pushw	x
 706  014f ae0000        	ldw	x,#0
 707  0152 89            	pushw	x
 708  0153 ae0000        	ldw	x,#L101
 709  0156 cd0000        	call	_assert_failed
 711  0159 5b04          	addw	sp,#4
 712  015b               L04:
 713                     ; 163     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 715  015b 0d0b          	tnz	(OFST+8,sp)
 716  015d 2706          	jreq	L44
 717  015f 7b0b          	ld	a,(OFST+8,sp)
 718  0161 a122          	cp	a,#34
 719  0163 2603          	jrne	L24
 720  0165               L44:
 721  0165 4f            	clr	a
 722  0166 2010          	jra	L64
 723  0168               L24:
 724  0168 ae00a3        	ldw	x,#163
 725  016b 89            	pushw	x
 726  016c ae0000        	ldw	x,#0
 727  016f 89            	pushw	x
 728  0170 ae0000        	ldw	x,#L101
 729  0173 cd0000        	call	_assert_failed
 731  0176 5b04          	addw	sp,#4
 732  0178               L64:
 733                     ; 164     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 735  0178 0d0c          	tnz	(OFST+9,sp)
 736  017a 2706          	jreq	L25
 737  017c 7b0c          	ld	a,(OFST+9,sp)
 738  017e a188          	cp	a,#136
 739  0180 2603          	jrne	L05
 740  0182               L25:
 741  0182 4f            	clr	a
 742  0183 2010          	jra	L45
 743  0185               L05:
 744  0185 ae00a4        	ldw	x,#164
 745  0188 89            	pushw	x
 746  0189 ae0000        	ldw	x,#0
 747  018c 89            	pushw	x
 748  018d ae0000        	ldw	x,#L101
 749  0190 cd0000        	call	_assert_failed
 751  0193 5b04          	addw	sp,#4
 752  0195               L45:
 753                     ; 165     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 755  0195 7b0d          	ld	a,(OFST+10,sp)
 756  0197 a155          	cp	a,#85
 757  0199 2704          	jreq	L06
 758  019b 0d0d          	tnz	(OFST+10,sp)
 759  019d 2603          	jrne	L65
 760  019f               L06:
 761  019f 4f            	clr	a
 762  01a0 2010          	jra	L26
 763  01a2               L65:
 764  01a2 ae00a5        	ldw	x,#165
 765  01a5 89            	pushw	x
 766  01a6 ae0000        	ldw	x,#0
 767  01a9 89            	pushw	x
 768  01aa ae0000        	ldw	x,#L101
 769  01ad cd0000        	call	_assert_failed
 771  01b0 5b04          	addw	sp,#4
 772  01b2               L26:
 773                     ; 166     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 775  01b2 7b0e          	ld	a,(OFST+11,sp)
 776  01b4 a12a          	cp	a,#42
 777  01b6 2704          	jreq	L66
 778  01b8 0d0e          	tnz	(OFST+11,sp)
 779  01ba 2603          	jrne	L46
 780  01bc               L66:
 781  01bc 4f            	clr	a
 782  01bd 2010          	jra	L07
 783  01bf               L46:
 784  01bf ae00a6        	ldw	x,#166
 785  01c2 89            	pushw	x
 786  01c3 ae0000        	ldw	x,#0
 787  01c6 89            	pushw	x
 788  01c7 ae0000        	ldw	x,#L101
 789  01ca cd0000        	call	_assert_failed
 791  01cd 5b04          	addw	sp,#4
 792  01cf               L07:
 793                     ; 170     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 793                     ; 171                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 795  01cf c6525c        	ld	a,21084
 796  01d2 a4f0          	and	a,#240
 797  01d4 c7525c        	ld	21084,a
 798                     ; 174   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 798                     ; 175                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 798                     ; 176                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 798                     ; 177                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 800  01d7 7b0c          	ld	a,(OFST+9,sp)
 801  01d9 a408          	and	a,#8
 802  01db 6b03          	ld	(OFST+0,sp),a
 803  01dd 7b0b          	ld	a,(OFST+8,sp)
 804  01df a402          	and	a,#2
 805  01e1 1a03          	or	a,(OFST+0,sp)
 806  01e3 6b02          	ld	(OFST-1,sp),a
 807  01e5 7b08          	ld	a,(OFST+5,sp)
 808  01e7 a404          	and	a,#4
 809  01e9 6b01          	ld	(OFST-2,sp),a
 810  01eb 7b05          	ld	a,(OFST+2,sp)
 811  01ed a401          	and	a,#1
 812  01ef 1a01          	or	a,(OFST-2,sp)
 813  01f1 1a02          	or	a,(OFST-1,sp)
 814  01f3 ca525c        	or	a,21084
 815  01f6 c7525c        	ld	21084,a
 816                     ; 180     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 816                     ; 181                             (uint8_t)TIM1_OCMode);
 818  01f9 c65258        	ld	a,21080
 819  01fc a48f          	and	a,#143
 820  01fe 1a04          	or	a,(OFST+1,sp)
 821  0200 c75258        	ld	21080,a
 822                     ; 184     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 824  0203 c6526f        	ld	a,21103
 825  0206 a4fc          	and	a,#252
 826  0208 c7526f        	ld	21103,a
 827                     ; 186     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 827                     ; 187                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 829  020b 7b0e          	ld	a,(OFST+11,sp)
 830  020d a402          	and	a,#2
 831  020f 6b03          	ld	(OFST+0,sp),a
 832  0211 7b0d          	ld	a,(OFST+10,sp)
 833  0213 a401          	and	a,#1
 834  0215 1a03          	or	a,(OFST+0,sp)
 835  0217 ca526f        	or	a,21103
 836  021a c7526f        	ld	21103,a
 837                     ; 190     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 839  021d 7b09          	ld	a,(OFST+6,sp)
 840  021f c75265        	ld	21093,a
 841                     ; 191     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 843  0222 7b0a          	ld	a,(OFST+7,sp)
 844  0224 c75266        	ld	21094,a
 845                     ; 192 }
 848  0227 5b05          	addw	sp,#5
 849  0229 81            	ret
 954                     ; 213 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 954                     ; 214                   TIM1_OutputState_TypeDef TIM1_OutputState,
 954                     ; 215                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 954                     ; 216                   uint16_t TIM1_Pulse,
 954                     ; 217                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 954                     ; 218                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 954                     ; 219                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 954                     ; 220                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 954                     ; 221 {
 955                     	switch	.text
 956  022a               _TIM1_OC2Init:
 958  022a 89            	pushw	x
 959  022b 5203          	subw	sp,#3
 960       00000003      OFST:	set	3
 963                     ; 223     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 965  022d 9e            	ld	a,xh
 966  022e 4d            	tnz	a
 967  022f 2719          	jreq	L67
 968  0231 9e            	ld	a,xh
 969  0232 a110          	cp	a,#16
 970  0234 2714          	jreq	L67
 971  0236 9e            	ld	a,xh
 972  0237 a120          	cp	a,#32
 973  0239 270f          	jreq	L67
 974  023b 9e            	ld	a,xh
 975  023c a130          	cp	a,#48
 976  023e 270a          	jreq	L67
 977  0240 9e            	ld	a,xh
 978  0241 a160          	cp	a,#96
 979  0243 2705          	jreq	L67
 980  0245 9e            	ld	a,xh
 981  0246 a170          	cp	a,#112
 982  0248 2603          	jrne	L47
 983  024a               L67:
 984  024a 4f            	clr	a
 985  024b 2010          	jra	L001
 986  024d               L47:
 987  024d ae00df        	ldw	x,#223
 988  0250 89            	pushw	x
 989  0251 ae0000        	ldw	x,#0
 990  0254 89            	pushw	x
 991  0255 ae0000        	ldw	x,#L101
 992  0258 cd0000        	call	_assert_failed
 994  025b 5b04          	addw	sp,#4
 995  025d               L001:
 996                     ; 224     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 998  025d 0d05          	tnz	(OFST+2,sp)
 999  025f 2706          	jreq	L401
1000  0261 7b05          	ld	a,(OFST+2,sp)
1001  0263 a111          	cp	a,#17
1002  0265 2603          	jrne	L201
1003  0267               L401:
1004  0267 4f            	clr	a
1005  0268 2010          	jra	L601
1006  026a               L201:
1007  026a ae00e0        	ldw	x,#224
1008  026d 89            	pushw	x
1009  026e ae0000        	ldw	x,#0
1010  0271 89            	pushw	x
1011  0272 ae0000        	ldw	x,#L101
1012  0275 cd0000        	call	_assert_failed
1014  0278 5b04          	addw	sp,#4
1015  027a               L601:
1016                     ; 225     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1018  027a 0d08          	tnz	(OFST+5,sp)
1019  027c 2706          	jreq	L211
1020  027e 7b08          	ld	a,(OFST+5,sp)
1021  0280 a144          	cp	a,#68
1022  0282 2603          	jrne	L011
1023  0284               L211:
1024  0284 4f            	clr	a
1025  0285 2010          	jra	L411
1026  0287               L011:
1027  0287 ae00e1        	ldw	x,#225
1028  028a 89            	pushw	x
1029  028b ae0000        	ldw	x,#0
1030  028e 89            	pushw	x
1031  028f ae0000        	ldw	x,#L101
1032  0292 cd0000        	call	_assert_failed
1034  0295 5b04          	addw	sp,#4
1035  0297               L411:
1036                     ; 226     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1038  0297 0d0b          	tnz	(OFST+8,sp)
1039  0299 2706          	jreq	L021
1040  029b 7b0b          	ld	a,(OFST+8,sp)
1041  029d a122          	cp	a,#34
1042  029f 2603          	jrne	L611
1043  02a1               L021:
1044  02a1 4f            	clr	a
1045  02a2 2010          	jra	L221
1046  02a4               L611:
1047  02a4 ae00e2        	ldw	x,#226
1048  02a7 89            	pushw	x
1049  02a8 ae0000        	ldw	x,#0
1050  02ab 89            	pushw	x
1051  02ac ae0000        	ldw	x,#L101
1052  02af cd0000        	call	_assert_failed
1054  02b2 5b04          	addw	sp,#4
1055  02b4               L221:
1056                     ; 227     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1058  02b4 0d0c          	tnz	(OFST+9,sp)
1059  02b6 2706          	jreq	L621
1060  02b8 7b0c          	ld	a,(OFST+9,sp)
1061  02ba a188          	cp	a,#136
1062  02bc 2603          	jrne	L421
1063  02be               L621:
1064  02be 4f            	clr	a
1065  02bf 2010          	jra	L031
1066  02c1               L421:
1067  02c1 ae00e3        	ldw	x,#227
1068  02c4 89            	pushw	x
1069  02c5 ae0000        	ldw	x,#0
1070  02c8 89            	pushw	x
1071  02c9 ae0000        	ldw	x,#L101
1072  02cc cd0000        	call	_assert_failed
1074  02cf 5b04          	addw	sp,#4
1075  02d1               L031:
1076                     ; 228     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1078  02d1 7b0d          	ld	a,(OFST+10,sp)
1079  02d3 a155          	cp	a,#85
1080  02d5 2704          	jreq	L431
1081  02d7 0d0d          	tnz	(OFST+10,sp)
1082  02d9 2603          	jrne	L231
1083  02db               L431:
1084  02db 4f            	clr	a
1085  02dc 2010          	jra	L631
1086  02de               L231:
1087  02de ae00e4        	ldw	x,#228
1088  02e1 89            	pushw	x
1089  02e2 ae0000        	ldw	x,#0
1090  02e5 89            	pushw	x
1091  02e6 ae0000        	ldw	x,#L101
1092  02e9 cd0000        	call	_assert_failed
1094  02ec 5b04          	addw	sp,#4
1095  02ee               L631:
1096                     ; 229     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1098  02ee 7b0e          	ld	a,(OFST+11,sp)
1099  02f0 a12a          	cp	a,#42
1100  02f2 2704          	jreq	L241
1101  02f4 0d0e          	tnz	(OFST+11,sp)
1102  02f6 2603          	jrne	L041
1103  02f8               L241:
1104  02f8 4f            	clr	a
1105  02f9 2010          	jra	L441
1106  02fb               L041:
1107  02fb ae00e5        	ldw	x,#229
1108  02fe 89            	pushw	x
1109  02ff ae0000        	ldw	x,#0
1110  0302 89            	pushw	x
1111  0303 ae0000        	ldw	x,#L101
1112  0306 cd0000        	call	_assert_failed
1114  0309 5b04          	addw	sp,#4
1115  030b               L441:
1116                     ; 233     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1116                     ; 234                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1118  030b c6525c        	ld	a,21084
1119  030e a40f          	and	a,#15
1120  0310 c7525c        	ld	21084,a
1121                     ; 238     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1121                     ; 239                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1121                     ; 240                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1121                     ; 241                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1123  0313 7b0c          	ld	a,(OFST+9,sp)
1124  0315 a480          	and	a,#128
1125  0317 6b03          	ld	(OFST+0,sp),a
1126  0319 7b0b          	ld	a,(OFST+8,sp)
1127  031b a420          	and	a,#32
1128  031d 1a03          	or	a,(OFST+0,sp)
1129  031f 6b02          	ld	(OFST-1,sp),a
1130  0321 7b08          	ld	a,(OFST+5,sp)
1131  0323 a440          	and	a,#64
1132  0325 6b01          	ld	(OFST-2,sp),a
1133  0327 7b05          	ld	a,(OFST+2,sp)
1134  0329 a410          	and	a,#16
1135  032b 1a01          	or	a,(OFST-2,sp)
1136  032d 1a02          	or	a,(OFST-1,sp)
1137  032f ca525c        	or	a,21084
1138  0332 c7525c        	ld	21084,a
1139                     ; 244     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1139                     ; 245                              (uint8_t)TIM1_OCMode);
1141  0335 c65259        	ld	a,21081
1142  0338 a48f          	and	a,#143
1143  033a 1a04          	or	a,(OFST+1,sp)
1144  033c c75259        	ld	21081,a
1145                     ; 248     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1147  033f c6526f        	ld	a,21103
1148  0342 a4f3          	and	a,#243
1149  0344 c7526f        	ld	21103,a
1150                     ; 250     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1150                     ; 251                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1152  0347 7b0e          	ld	a,(OFST+11,sp)
1153  0349 a408          	and	a,#8
1154  034b 6b03          	ld	(OFST+0,sp),a
1155  034d 7b0d          	ld	a,(OFST+10,sp)
1156  034f a404          	and	a,#4
1157  0351 1a03          	or	a,(OFST+0,sp)
1158  0353 ca526f        	or	a,21103
1159  0356 c7526f        	ld	21103,a
1160                     ; 254     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1162  0359 7b09          	ld	a,(OFST+6,sp)
1163  035b c75267        	ld	21095,a
1164                     ; 255     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1166  035e 7b0a          	ld	a,(OFST+7,sp)
1167  0360 c75268        	ld	21096,a
1168                     ; 257 }
1171  0363 5b05          	addw	sp,#5
1172  0365 81            	ret
1277                     ; 278 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1277                     ; 279                   TIM1_OutputState_TypeDef TIM1_OutputState,
1277                     ; 280                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1277                     ; 281                   uint16_t TIM1_Pulse,
1277                     ; 282                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1277                     ; 283                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1277                     ; 284                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1277                     ; 285                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1277                     ; 286 {
1278                     	switch	.text
1279  0366               _TIM1_OC3Init:
1281  0366 89            	pushw	x
1282  0367 5203          	subw	sp,#3
1283       00000003      OFST:	set	3
1286                     ; 288     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1288  0369 9e            	ld	a,xh
1289  036a 4d            	tnz	a
1290  036b 2719          	jreq	L251
1291  036d 9e            	ld	a,xh
1292  036e a110          	cp	a,#16
1293  0370 2714          	jreq	L251
1294  0372 9e            	ld	a,xh
1295  0373 a120          	cp	a,#32
1296  0375 270f          	jreq	L251
1297  0377 9e            	ld	a,xh
1298  0378 a130          	cp	a,#48
1299  037a 270a          	jreq	L251
1300  037c 9e            	ld	a,xh
1301  037d a160          	cp	a,#96
1302  037f 2705          	jreq	L251
1303  0381 9e            	ld	a,xh
1304  0382 a170          	cp	a,#112
1305  0384 2603          	jrne	L051
1306  0386               L251:
1307  0386 4f            	clr	a
1308  0387 2010          	jra	L451
1309  0389               L051:
1310  0389 ae0120        	ldw	x,#288
1311  038c 89            	pushw	x
1312  038d ae0000        	ldw	x,#0
1313  0390 89            	pushw	x
1314  0391 ae0000        	ldw	x,#L101
1315  0394 cd0000        	call	_assert_failed
1317  0397 5b04          	addw	sp,#4
1318  0399               L451:
1319                     ; 289     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1321  0399 0d05          	tnz	(OFST+2,sp)
1322  039b 2706          	jreq	L061
1323  039d 7b05          	ld	a,(OFST+2,sp)
1324  039f a111          	cp	a,#17
1325  03a1 2603          	jrne	L651
1326  03a3               L061:
1327  03a3 4f            	clr	a
1328  03a4 2010          	jra	L261
1329  03a6               L651:
1330  03a6 ae0121        	ldw	x,#289
1331  03a9 89            	pushw	x
1332  03aa ae0000        	ldw	x,#0
1333  03ad 89            	pushw	x
1334  03ae ae0000        	ldw	x,#L101
1335  03b1 cd0000        	call	_assert_failed
1337  03b4 5b04          	addw	sp,#4
1338  03b6               L261:
1339                     ; 290     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1341  03b6 0d08          	tnz	(OFST+5,sp)
1342  03b8 2706          	jreq	L661
1343  03ba 7b08          	ld	a,(OFST+5,sp)
1344  03bc a144          	cp	a,#68
1345  03be 2603          	jrne	L461
1346  03c0               L661:
1347  03c0 4f            	clr	a
1348  03c1 2010          	jra	L071
1349  03c3               L461:
1350  03c3 ae0122        	ldw	x,#290
1351  03c6 89            	pushw	x
1352  03c7 ae0000        	ldw	x,#0
1353  03ca 89            	pushw	x
1354  03cb ae0000        	ldw	x,#L101
1355  03ce cd0000        	call	_assert_failed
1357  03d1 5b04          	addw	sp,#4
1358  03d3               L071:
1359                     ; 291     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1361  03d3 0d0b          	tnz	(OFST+8,sp)
1362  03d5 2706          	jreq	L471
1363  03d7 7b0b          	ld	a,(OFST+8,sp)
1364  03d9 a122          	cp	a,#34
1365  03db 2603          	jrne	L271
1366  03dd               L471:
1367  03dd 4f            	clr	a
1368  03de 2010          	jra	L671
1369  03e0               L271:
1370  03e0 ae0123        	ldw	x,#291
1371  03e3 89            	pushw	x
1372  03e4 ae0000        	ldw	x,#0
1373  03e7 89            	pushw	x
1374  03e8 ae0000        	ldw	x,#L101
1375  03eb cd0000        	call	_assert_failed
1377  03ee 5b04          	addw	sp,#4
1378  03f0               L671:
1379                     ; 292     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1381  03f0 0d0c          	tnz	(OFST+9,sp)
1382  03f2 2706          	jreq	L202
1383  03f4 7b0c          	ld	a,(OFST+9,sp)
1384  03f6 a188          	cp	a,#136
1385  03f8 2603          	jrne	L002
1386  03fa               L202:
1387  03fa 4f            	clr	a
1388  03fb 2010          	jra	L402
1389  03fd               L002:
1390  03fd ae0124        	ldw	x,#292
1391  0400 89            	pushw	x
1392  0401 ae0000        	ldw	x,#0
1393  0404 89            	pushw	x
1394  0405 ae0000        	ldw	x,#L101
1395  0408 cd0000        	call	_assert_failed
1397  040b 5b04          	addw	sp,#4
1398  040d               L402:
1399                     ; 293     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1401  040d 7b0d          	ld	a,(OFST+10,sp)
1402  040f a155          	cp	a,#85
1403  0411 2704          	jreq	L012
1404  0413 0d0d          	tnz	(OFST+10,sp)
1405  0415 2603          	jrne	L602
1406  0417               L012:
1407  0417 4f            	clr	a
1408  0418 2010          	jra	L212
1409  041a               L602:
1410  041a ae0125        	ldw	x,#293
1411  041d 89            	pushw	x
1412  041e ae0000        	ldw	x,#0
1413  0421 89            	pushw	x
1414  0422 ae0000        	ldw	x,#L101
1415  0425 cd0000        	call	_assert_failed
1417  0428 5b04          	addw	sp,#4
1418  042a               L212:
1419                     ; 294     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1421  042a 7b0e          	ld	a,(OFST+11,sp)
1422  042c a12a          	cp	a,#42
1423  042e 2704          	jreq	L612
1424  0430 0d0e          	tnz	(OFST+11,sp)
1425  0432 2603          	jrne	L412
1426  0434               L612:
1427  0434 4f            	clr	a
1428  0435 2010          	jra	L022
1429  0437               L412:
1430  0437 ae0126        	ldw	x,#294
1431  043a 89            	pushw	x
1432  043b ae0000        	ldw	x,#0
1433  043e 89            	pushw	x
1434  043f ae0000        	ldw	x,#L101
1435  0442 cd0000        	call	_assert_failed
1437  0445 5b04          	addw	sp,#4
1438  0447               L022:
1439                     ; 298     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1439                     ; 299                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1441  0447 c6525d        	ld	a,21085
1442  044a a4f0          	and	a,#240
1443  044c c7525d        	ld	21085,a
1444                     ; 302     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1444                     ; 303                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1444                     ; 304                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1444                     ; 305                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1446  044f 7b0c          	ld	a,(OFST+9,sp)
1447  0451 a408          	and	a,#8
1448  0453 6b03          	ld	(OFST+0,sp),a
1449  0455 7b0b          	ld	a,(OFST+8,sp)
1450  0457 a402          	and	a,#2
1451  0459 1a03          	or	a,(OFST+0,sp)
1452  045b 6b02          	ld	(OFST-1,sp),a
1453  045d 7b08          	ld	a,(OFST+5,sp)
1454  045f a404          	and	a,#4
1455  0461 6b01          	ld	(OFST-2,sp),a
1456  0463 7b05          	ld	a,(OFST+2,sp)
1457  0465 a401          	and	a,#1
1458  0467 1a01          	or	a,(OFST-2,sp)
1459  0469 1a02          	or	a,(OFST-1,sp)
1460  046b ca525d        	or	a,21085
1461  046e c7525d        	ld	21085,a
1462                     ; 308     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1462                     ; 309                              (uint8_t)TIM1_OCMode);
1464  0471 c6525a        	ld	a,21082
1465  0474 a48f          	and	a,#143
1466  0476 1a04          	or	a,(OFST+1,sp)
1467  0478 c7525a        	ld	21082,a
1468                     ; 312     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1470  047b c6526f        	ld	a,21103
1471  047e a4cf          	and	a,#207
1472  0480 c7526f        	ld	21103,a
1473                     ; 314     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1473                     ; 315                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1475  0483 7b0e          	ld	a,(OFST+11,sp)
1476  0485 a420          	and	a,#32
1477  0487 6b03          	ld	(OFST+0,sp),a
1478  0489 7b0d          	ld	a,(OFST+10,sp)
1479  048b a410          	and	a,#16
1480  048d 1a03          	or	a,(OFST+0,sp)
1481  048f ca526f        	or	a,21103
1482  0492 c7526f        	ld	21103,a
1483                     ; 318     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1485  0495 7b09          	ld	a,(OFST+6,sp)
1486  0497 c75269        	ld	21097,a
1487                     ; 319     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1489  049a 7b0a          	ld	a,(OFST+7,sp)
1490  049c c7526a        	ld	21098,a
1491                     ; 321 }
1494  049f 5b05          	addw	sp,#5
1495  04a1 81            	ret
1570                     ; 336 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1570                     ; 337                   TIM1_OutputState_TypeDef TIM1_OutputState,
1570                     ; 338                   uint16_t TIM1_Pulse,
1570                     ; 339                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1570                     ; 340                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1570                     ; 341 {
1571                     	switch	.text
1572  04a2               _TIM1_OC4Init:
1574  04a2 89            	pushw	x
1575  04a3 88            	push	a
1576       00000001      OFST:	set	1
1579                     ; 343     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1581  04a4 9e            	ld	a,xh
1582  04a5 4d            	tnz	a
1583  04a6 2719          	jreq	L622
1584  04a8 9e            	ld	a,xh
1585  04a9 a110          	cp	a,#16
1586  04ab 2714          	jreq	L622
1587  04ad 9e            	ld	a,xh
1588  04ae a120          	cp	a,#32
1589  04b0 270f          	jreq	L622
1590  04b2 9e            	ld	a,xh
1591  04b3 a130          	cp	a,#48
1592  04b5 270a          	jreq	L622
1593  04b7 9e            	ld	a,xh
1594  04b8 a160          	cp	a,#96
1595  04ba 2705          	jreq	L622
1596  04bc 9e            	ld	a,xh
1597  04bd a170          	cp	a,#112
1598  04bf 2603          	jrne	L422
1599  04c1               L622:
1600  04c1 4f            	clr	a
1601  04c2 2010          	jra	L032
1602  04c4               L422:
1603  04c4 ae0157        	ldw	x,#343
1604  04c7 89            	pushw	x
1605  04c8 ae0000        	ldw	x,#0
1606  04cb 89            	pushw	x
1607  04cc ae0000        	ldw	x,#L101
1608  04cf cd0000        	call	_assert_failed
1610  04d2 5b04          	addw	sp,#4
1611  04d4               L032:
1612                     ; 344     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1614  04d4 0d03          	tnz	(OFST+2,sp)
1615  04d6 2706          	jreq	L432
1616  04d8 7b03          	ld	a,(OFST+2,sp)
1617  04da a111          	cp	a,#17
1618  04dc 2603          	jrne	L232
1619  04de               L432:
1620  04de 4f            	clr	a
1621  04df 2010          	jra	L632
1622  04e1               L232:
1623  04e1 ae0158        	ldw	x,#344
1624  04e4 89            	pushw	x
1625  04e5 ae0000        	ldw	x,#0
1626  04e8 89            	pushw	x
1627  04e9 ae0000        	ldw	x,#L101
1628  04ec cd0000        	call	_assert_failed
1630  04ef 5b04          	addw	sp,#4
1631  04f1               L632:
1632                     ; 345     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1634  04f1 0d08          	tnz	(OFST+7,sp)
1635  04f3 2706          	jreq	L242
1636  04f5 7b08          	ld	a,(OFST+7,sp)
1637  04f7 a122          	cp	a,#34
1638  04f9 2603          	jrne	L042
1639  04fb               L242:
1640  04fb 4f            	clr	a
1641  04fc 2010          	jra	L442
1642  04fe               L042:
1643  04fe ae0159        	ldw	x,#345
1644  0501 89            	pushw	x
1645  0502 ae0000        	ldw	x,#0
1646  0505 89            	pushw	x
1647  0506 ae0000        	ldw	x,#L101
1648  0509 cd0000        	call	_assert_failed
1650  050c 5b04          	addw	sp,#4
1651  050e               L442:
1652                     ; 346     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1654  050e 7b09          	ld	a,(OFST+8,sp)
1655  0510 a155          	cp	a,#85
1656  0512 2704          	jreq	L052
1657  0514 0d09          	tnz	(OFST+8,sp)
1658  0516 2603          	jrne	L642
1659  0518               L052:
1660  0518 4f            	clr	a
1661  0519 2010          	jra	L252
1662  051b               L642:
1663  051b ae015a        	ldw	x,#346
1664  051e 89            	pushw	x
1665  051f ae0000        	ldw	x,#0
1666  0522 89            	pushw	x
1667  0523 ae0000        	ldw	x,#L101
1668  0526 cd0000        	call	_assert_failed
1670  0529 5b04          	addw	sp,#4
1671  052b               L252:
1672                     ; 349     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1674  052b c6525d        	ld	a,21085
1675  052e a4cf          	and	a,#207
1676  0530 c7525d        	ld	21085,a
1677                     ; 351     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1677                     ; 352                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1679  0533 7b08          	ld	a,(OFST+7,sp)
1680  0535 a420          	and	a,#32
1681  0537 6b01          	ld	(OFST+0,sp),a
1682  0539 7b03          	ld	a,(OFST+2,sp)
1683  053b a410          	and	a,#16
1684  053d 1a01          	or	a,(OFST+0,sp)
1685  053f ca525d        	or	a,21085
1686  0542 c7525d        	ld	21085,a
1687                     ; 355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1687                     ; 356                             TIM1_OCMode);
1689  0545 c6525b        	ld	a,21083
1690  0548 a48f          	and	a,#143
1691  054a 1a02          	or	a,(OFST+1,sp)
1692  054c c7525b        	ld	21083,a
1693                     ; 359     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1695  054f 0d09          	tnz	(OFST+8,sp)
1696  0551 270a          	jreq	L734
1697                     ; 361         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1699  0553 c6526f        	ld	a,21103
1700  0556 aadf          	or	a,#223
1701  0558 c7526f        	ld	21103,a
1703  055b 2004          	jra	L144
1704  055d               L734:
1705                     ; 365         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1707  055d 721d526f      	bres	21103,#6
1708  0561               L144:
1709                     ; 369     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1711  0561 7b06          	ld	a,(OFST+5,sp)
1712  0563 c7526b        	ld	21099,a
1713                     ; 370     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1715  0566 7b07          	ld	a,(OFST+6,sp)
1716  0568 c7526c        	ld	21100,a
1717                     ; 372 }
1720  056b 5b03          	addw	sp,#3
1721  056d 81            	ret
1927                     ; 387 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1927                     ; 388                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1927                     ; 389                      uint8_t TIM1_DeadTime,
1927                     ; 390                      TIM1_BreakState_TypeDef TIM1_Break,
1927                     ; 391                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1927                     ; 392                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1927                     ; 393 {
1928                     	switch	.text
1929  056e               _TIM1_BDTRConfig:
1931  056e 89            	pushw	x
1932  056f 88            	push	a
1933       00000001      OFST:	set	1
1936                     ; 395     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1938  0570 9e            	ld	a,xh
1939  0571 a104          	cp	a,#4
1940  0573 2704          	jreq	L062
1941  0575 9e            	ld	a,xh
1942  0576 4d            	tnz	a
1943  0577 2603          	jrne	L652
1944  0579               L062:
1945  0579 4f            	clr	a
1946  057a 2010          	jra	L262
1947  057c               L652:
1948  057c ae018b        	ldw	x,#395
1949  057f 89            	pushw	x
1950  0580 ae0000        	ldw	x,#0
1951  0583 89            	pushw	x
1952  0584 ae0000        	ldw	x,#L101
1953  0587 cd0000        	call	_assert_failed
1955  058a 5b04          	addw	sp,#4
1956  058c               L262:
1957                     ; 396     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1959  058c 0d03          	tnz	(OFST+2,sp)
1960  058e 2712          	jreq	L662
1961  0590 7b03          	ld	a,(OFST+2,sp)
1962  0592 a101          	cp	a,#1
1963  0594 270c          	jreq	L662
1964  0596 7b03          	ld	a,(OFST+2,sp)
1965  0598 a102          	cp	a,#2
1966  059a 2706          	jreq	L662
1967  059c 7b03          	ld	a,(OFST+2,sp)
1968  059e a103          	cp	a,#3
1969  05a0 2603          	jrne	L462
1970  05a2               L662:
1971  05a2 4f            	clr	a
1972  05a3 2010          	jra	L072
1973  05a5               L462:
1974  05a5 ae018c        	ldw	x,#396
1975  05a8 89            	pushw	x
1976  05a9 ae0000        	ldw	x,#0
1977  05ac 89            	pushw	x
1978  05ad ae0000        	ldw	x,#L101
1979  05b0 cd0000        	call	_assert_failed
1981  05b3 5b04          	addw	sp,#4
1982  05b5               L072:
1983                     ; 397     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1985  05b5 7b07          	ld	a,(OFST+6,sp)
1986  05b7 a110          	cp	a,#16
1987  05b9 2704          	jreq	L472
1988  05bb 0d07          	tnz	(OFST+6,sp)
1989  05bd 2603          	jrne	L272
1990  05bf               L472:
1991  05bf 4f            	clr	a
1992  05c0 2010          	jra	L672
1993  05c2               L272:
1994  05c2 ae018d        	ldw	x,#397
1995  05c5 89            	pushw	x
1996  05c6 ae0000        	ldw	x,#0
1997  05c9 89            	pushw	x
1998  05ca ae0000        	ldw	x,#L101
1999  05cd cd0000        	call	_assert_failed
2001  05d0 5b04          	addw	sp,#4
2002  05d2               L672:
2003                     ; 398     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
2005  05d2 0d08          	tnz	(OFST+7,sp)
2006  05d4 2706          	jreq	L203
2007  05d6 7b08          	ld	a,(OFST+7,sp)
2008  05d8 a120          	cp	a,#32
2009  05da 2603          	jrne	L003
2010  05dc               L203:
2011  05dc 4f            	clr	a
2012  05dd 2010          	jra	L403
2013  05df               L003:
2014  05df ae018e        	ldw	x,#398
2015  05e2 89            	pushw	x
2016  05e3 ae0000        	ldw	x,#0
2017  05e6 89            	pushw	x
2018  05e7 ae0000        	ldw	x,#L101
2019  05ea cd0000        	call	_assert_failed
2021  05ed 5b04          	addw	sp,#4
2022  05ef               L403:
2023                     ; 399     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2025  05ef 7b09          	ld	a,(OFST+8,sp)
2026  05f1 a140          	cp	a,#64
2027  05f3 2704          	jreq	L013
2028  05f5 0d09          	tnz	(OFST+8,sp)
2029  05f7 2603          	jrne	L603
2030  05f9               L013:
2031  05f9 4f            	clr	a
2032  05fa 2010          	jra	L213
2033  05fc               L603:
2034  05fc ae018f        	ldw	x,#399
2035  05ff 89            	pushw	x
2036  0600 ae0000        	ldw	x,#0
2037  0603 89            	pushw	x
2038  0604 ae0000        	ldw	x,#L101
2039  0607 cd0000        	call	_assert_failed
2041  060a 5b04          	addw	sp,#4
2042  060c               L213:
2043                     ; 401     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2045  060c 7b06          	ld	a,(OFST+5,sp)
2046  060e c7526e        	ld	21102,a
2047                     ; 405     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2047                     ; 406                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2047                     ; 407                             (uint8_t)TIM1_AutomaticOutput));
2049  0611 7b07          	ld	a,(OFST+6,sp)
2050  0613 1a08          	or	a,(OFST+7,sp)
2051  0615 1a09          	or	a,(OFST+8,sp)
2052  0617 6b01          	ld	(OFST+0,sp),a
2053  0619 7b02          	ld	a,(OFST+1,sp)
2054  061b 1a03          	or	a,(OFST+2,sp)
2055  061d 1a01          	or	a,(OFST+0,sp)
2056  061f c7526d        	ld	21101,a
2057                     ; 409 }
2060  0622 5b03          	addw	sp,#3
2061  0624 81            	ret
2264                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2264                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2264                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2264                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2264                     ; 427                  uint8_t TIM1_ICFilter)
2264                     ; 428 {
2265                     	switch	.text
2266  0625               _TIM1_ICInit:
2268  0625 89            	pushw	x
2269       00000000      OFST:	set	0
2272                     ; 431     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2274  0626 9e            	ld	a,xh
2275  0627 4d            	tnz	a
2276  0628 270f          	jreq	L023
2277  062a 9e            	ld	a,xh
2278  062b a101          	cp	a,#1
2279  062d 270a          	jreq	L023
2280  062f 9e            	ld	a,xh
2281  0630 a102          	cp	a,#2
2282  0632 2705          	jreq	L023
2283  0634 9e            	ld	a,xh
2284  0635 a103          	cp	a,#3
2285  0637 2603          	jrne	L613
2286  0639               L023:
2287  0639 4f            	clr	a
2288  063a 2010          	jra	L223
2289  063c               L613:
2290  063c ae01af        	ldw	x,#431
2291  063f 89            	pushw	x
2292  0640 ae0000        	ldw	x,#0
2293  0643 89            	pushw	x
2294  0644 ae0000        	ldw	x,#L101
2295  0647 cd0000        	call	_assert_failed
2297  064a 5b04          	addw	sp,#4
2298  064c               L223:
2299                     ; 432     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2301  064c 0d02          	tnz	(OFST+2,sp)
2302  064e 2706          	jreq	L623
2303  0650 7b02          	ld	a,(OFST+2,sp)
2304  0652 a101          	cp	a,#1
2305  0654 2603          	jrne	L423
2306  0656               L623:
2307  0656 4f            	clr	a
2308  0657 2010          	jra	L033
2309  0659               L423:
2310  0659 ae01b0        	ldw	x,#432
2311  065c 89            	pushw	x
2312  065d ae0000        	ldw	x,#0
2313  0660 89            	pushw	x
2314  0661 ae0000        	ldw	x,#L101
2315  0664 cd0000        	call	_assert_failed
2317  0667 5b04          	addw	sp,#4
2318  0669               L033:
2319                     ; 433     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2321  0669 7b05          	ld	a,(OFST+5,sp)
2322  066b a101          	cp	a,#1
2323  066d 270c          	jreq	L433
2324  066f 7b05          	ld	a,(OFST+5,sp)
2325  0671 a102          	cp	a,#2
2326  0673 2706          	jreq	L433
2327  0675 7b05          	ld	a,(OFST+5,sp)
2328  0677 a103          	cp	a,#3
2329  0679 2603          	jrne	L233
2330  067b               L433:
2331  067b 4f            	clr	a
2332  067c 2010          	jra	L633
2333  067e               L233:
2334  067e ae01b1        	ldw	x,#433
2335  0681 89            	pushw	x
2336  0682 ae0000        	ldw	x,#0
2337  0685 89            	pushw	x
2338  0686 ae0000        	ldw	x,#L101
2339  0689 cd0000        	call	_assert_failed
2341  068c 5b04          	addw	sp,#4
2342  068e               L633:
2343                     ; 434     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2345  068e 0d06          	tnz	(OFST+6,sp)
2346  0690 2712          	jreq	L243
2347  0692 7b06          	ld	a,(OFST+6,sp)
2348  0694 a104          	cp	a,#4
2349  0696 270c          	jreq	L243
2350  0698 7b06          	ld	a,(OFST+6,sp)
2351  069a a108          	cp	a,#8
2352  069c 2706          	jreq	L243
2353  069e 7b06          	ld	a,(OFST+6,sp)
2354  06a0 a10c          	cp	a,#12
2355  06a2 2603          	jrne	L043
2356  06a4               L243:
2357  06a4 4f            	clr	a
2358  06a5 2010          	jra	L443
2359  06a7               L043:
2360  06a7 ae01b2        	ldw	x,#434
2361  06aa 89            	pushw	x
2362  06ab ae0000        	ldw	x,#0
2363  06ae 89            	pushw	x
2364  06af ae0000        	ldw	x,#L101
2365  06b2 cd0000        	call	_assert_failed
2367  06b5 5b04          	addw	sp,#4
2368  06b7               L443:
2369                     ; 435     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2371  06b7 7b07          	ld	a,(OFST+7,sp)
2372  06b9 a110          	cp	a,#16
2373  06bb 2403          	jruge	L643
2374  06bd 4f            	clr	a
2375  06be 2010          	jra	L053
2376  06c0               L643:
2377  06c0 ae01b3        	ldw	x,#435
2378  06c3 89            	pushw	x
2379  06c4 ae0000        	ldw	x,#0
2380  06c7 89            	pushw	x
2381  06c8 ae0000        	ldw	x,#L101
2382  06cb cd0000        	call	_assert_failed
2384  06ce 5b04          	addw	sp,#4
2385  06d0               L053:
2386                     ; 437     if (TIM1_Channel == TIM1_CHANNEL_1)
2388  06d0 0d01          	tnz	(OFST+1,sp)
2389  06d2 2614          	jrne	L176
2390                     ; 440         TI1_Config((uint8_t)TIM1_ICPolarity,
2390                     ; 441                    (uint8_t)TIM1_ICSelection,
2390                     ; 442                    (uint8_t)TIM1_ICFilter);
2392  06d4 7b07          	ld	a,(OFST+7,sp)
2393  06d6 88            	push	a
2394  06d7 7b06          	ld	a,(OFST+6,sp)
2395  06d9 97            	ld	xl,a
2396  06da 7b03          	ld	a,(OFST+3,sp)
2397  06dc 95            	ld	xh,a
2398  06dd cd150c        	call	L3_TI1_Config
2400  06e0 84            	pop	a
2401                     ; 444         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2403  06e1 7b06          	ld	a,(OFST+6,sp)
2404  06e3 cd126b        	call	_TIM1_SetIC1Prescaler
2407  06e6 2046          	jra	L376
2408  06e8               L176:
2409                     ; 446     else if (TIM1_Channel == TIM1_CHANNEL_2)
2411  06e8 7b01          	ld	a,(OFST+1,sp)
2412  06ea a101          	cp	a,#1
2413  06ec 2614          	jrne	L576
2414                     ; 449         TI2_Config((uint8_t)TIM1_ICPolarity,
2414                     ; 450                    (uint8_t)TIM1_ICSelection,
2414                     ; 451                    (uint8_t)TIM1_ICFilter);
2416  06ee 7b07          	ld	a,(OFST+7,sp)
2417  06f0 88            	push	a
2418  06f1 7b06          	ld	a,(OFST+6,sp)
2419  06f3 97            	ld	xl,a
2420  06f4 7b03          	ld	a,(OFST+3,sp)
2421  06f6 95            	ld	xh,a
2422  06f7 cd153c        	call	L5_TI2_Config
2424  06fa 84            	pop	a
2425                     ; 453         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2427  06fb 7b06          	ld	a,(OFST+6,sp)
2428  06fd cd129a        	call	_TIM1_SetIC2Prescaler
2431  0700 202c          	jra	L376
2432  0702               L576:
2433                     ; 455     else if (TIM1_Channel == TIM1_CHANNEL_3)
2435  0702 7b01          	ld	a,(OFST+1,sp)
2436  0704 a102          	cp	a,#2
2437  0706 2614          	jrne	L107
2438                     ; 458         TI3_Config((uint8_t)TIM1_ICPolarity,
2438                     ; 459                    (uint8_t)TIM1_ICSelection,
2438                     ; 460                    (uint8_t)TIM1_ICFilter);
2440  0708 7b07          	ld	a,(OFST+7,sp)
2441  070a 88            	push	a
2442  070b 7b06          	ld	a,(OFST+6,sp)
2443  070d 97            	ld	xl,a
2444  070e 7b03          	ld	a,(OFST+3,sp)
2445  0710 95            	ld	xh,a
2446  0711 cd156c        	call	L7_TI3_Config
2448  0714 84            	pop	a
2449                     ; 462         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2451  0715 7b06          	ld	a,(OFST+6,sp)
2452  0717 cd12c9        	call	_TIM1_SetIC3Prescaler
2455  071a 2012          	jra	L376
2456  071c               L107:
2457                     ; 467         TI4_Config((uint8_t)TIM1_ICPolarity,
2457                     ; 468                    (uint8_t)TIM1_ICSelection,
2457                     ; 469                    (uint8_t)TIM1_ICFilter);
2459  071c 7b07          	ld	a,(OFST+7,sp)
2460  071e 88            	push	a
2461  071f 7b06          	ld	a,(OFST+6,sp)
2462  0721 97            	ld	xl,a
2463  0722 7b03          	ld	a,(OFST+3,sp)
2464  0724 95            	ld	xh,a
2465  0725 cd159c        	call	L11_TI4_Config
2467  0728 84            	pop	a
2468                     ; 471         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2470  0729 7b06          	ld	a,(OFST+6,sp)
2471  072b cd12f8        	call	_TIM1_SetIC4Prescaler
2473  072e               L376:
2474                     ; 474 }
2477  072e 85            	popw	x
2478  072f 81            	ret
2575                     ; 490 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2575                     ; 491                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2575                     ; 492                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2575                     ; 493                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2575                     ; 494                      uint8_t TIM1_ICFilter)
2575                     ; 495 {
2576                     	switch	.text
2577  0730               _TIM1_PWMIConfig:
2579  0730 89            	pushw	x
2580  0731 89            	pushw	x
2581       00000002      OFST:	set	2
2584                     ; 496     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2586                     ; 497     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2588                     ; 500     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2590  0732 9e            	ld	a,xh
2591  0733 4d            	tnz	a
2592  0734 2705          	jreq	L653
2593  0736 9e            	ld	a,xh
2594  0737 a101          	cp	a,#1
2595  0739 2603          	jrne	L453
2596  073b               L653:
2597  073b 4f            	clr	a
2598  073c 2010          	jra	L063
2599  073e               L453:
2600  073e ae01f4        	ldw	x,#500
2601  0741 89            	pushw	x
2602  0742 ae0000        	ldw	x,#0
2603  0745 89            	pushw	x
2604  0746 ae0000        	ldw	x,#L101
2605  0749 cd0000        	call	_assert_failed
2607  074c 5b04          	addw	sp,#4
2608  074e               L063:
2609                     ; 501     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2611  074e 0d04          	tnz	(OFST+2,sp)
2612  0750 2706          	jreq	L463
2613  0752 7b04          	ld	a,(OFST+2,sp)
2614  0754 a101          	cp	a,#1
2615  0756 2603          	jrne	L263
2616  0758               L463:
2617  0758 4f            	clr	a
2618  0759 2010          	jra	L663
2619  075b               L263:
2620  075b ae01f5        	ldw	x,#501
2621  075e 89            	pushw	x
2622  075f ae0000        	ldw	x,#0
2623  0762 89            	pushw	x
2624  0763 ae0000        	ldw	x,#L101
2625  0766 cd0000        	call	_assert_failed
2627  0769 5b04          	addw	sp,#4
2628  076b               L663:
2629                     ; 502     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2631  076b 7b07          	ld	a,(OFST+5,sp)
2632  076d a101          	cp	a,#1
2633  076f 270c          	jreq	L273
2634  0771 7b07          	ld	a,(OFST+5,sp)
2635  0773 a102          	cp	a,#2
2636  0775 2706          	jreq	L273
2637  0777 7b07          	ld	a,(OFST+5,sp)
2638  0779 a103          	cp	a,#3
2639  077b 2603          	jrne	L073
2640  077d               L273:
2641  077d 4f            	clr	a
2642  077e 2010          	jra	L473
2643  0780               L073:
2644  0780 ae01f6        	ldw	x,#502
2645  0783 89            	pushw	x
2646  0784 ae0000        	ldw	x,#0
2647  0787 89            	pushw	x
2648  0788 ae0000        	ldw	x,#L101
2649  078b cd0000        	call	_assert_failed
2651  078e 5b04          	addw	sp,#4
2652  0790               L473:
2653                     ; 503     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2655  0790 0d08          	tnz	(OFST+6,sp)
2656  0792 2712          	jreq	L004
2657  0794 7b08          	ld	a,(OFST+6,sp)
2658  0796 a104          	cp	a,#4
2659  0798 270c          	jreq	L004
2660  079a 7b08          	ld	a,(OFST+6,sp)
2661  079c a108          	cp	a,#8
2662  079e 2706          	jreq	L004
2663  07a0 7b08          	ld	a,(OFST+6,sp)
2664  07a2 a10c          	cp	a,#12
2665  07a4 2603          	jrne	L673
2666  07a6               L004:
2667  07a6 4f            	clr	a
2668  07a7 2010          	jra	L204
2669  07a9               L673:
2670  07a9 ae01f7        	ldw	x,#503
2671  07ac 89            	pushw	x
2672  07ad ae0000        	ldw	x,#0
2673  07b0 89            	pushw	x
2674  07b1 ae0000        	ldw	x,#L101
2675  07b4 cd0000        	call	_assert_failed
2677  07b7 5b04          	addw	sp,#4
2678  07b9               L204:
2679                     ; 506     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2681  07b9 7b04          	ld	a,(OFST+2,sp)
2682  07bb a101          	cp	a,#1
2683  07bd 2706          	jreq	L357
2684                     ; 508         icpolarity = TIM1_ICPOLARITY_FALLING;
2686  07bf a601          	ld	a,#1
2687  07c1 6b01          	ld	(OFST-1,sp),a
2689  07c3 2002          	jra	L557
2690  07c5               L357:
2691                     ; 512         icpolarity = TIM1_ICPOLARITY_RISING;
2693  07c5 0f01          	clr	(OFST-1,sp)
2694  07c7               L557:
2695                     ; 516     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2697  07c7 7b07          	ld	a,(OFST+5,sp)
2698  07c9 a101          	cp	a,#1
2699  07cb 2606          	jrne	L757
2700                     ; 518         icselection = TIM1_ICSELECTION_INDIRECTTI;
2702  07cd a602          	ld	a,#2
2703  07cf 6b02          	ld	(OFST+0,sp),a
2705  07d1 2004          	jra	L167
2706  07d3               L757:
2707                     ; 522         icselection = TIM1_ICSELECTION_DIRECTTI;
2709  07d3 a601          	ld	a,#1
2710  07d5 6b02          	ld	(OFST+0,sp),a
2711  07d7               L167:
2712                     ; 525     if (TIM1_Channel == TIM1_CHANNEL_1)
2714  07d7 0d03          	tnz	(OFST+1,sp)
2715  07d9 2626          	jrne	L367
2716                     ; 528         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2716                     ; 529                    (uint8_t)TIM1_ICFilter);
2718  07db 7b09          	ld	a,(OFST+7,sp)
2719  07dd 88            	push	a
2720  07de 7b08          	ld	a,(OFST+6,sp)
2721  07e0 97            	ld	xl,a
2722  07e1 7b05          	ld	a,(OFST+3,sp)
2723  07e3 95            	ld	xh,a
2724  07e4 cd150c        	call	L3_TI1_Config
2726  07e7 84            	pop	a
2727                     ; 532         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2729  07e8 7b08          	ld	a,(OFST+6,sp)
2730  07ea cd126b        	call	_TIM1_SetIC1Prescaler
2732                     ; 535         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2734  07ed 7b09          	ld	a,(OFST+7,sp)
2735  07ef 88            	push	a
2736  07f0 7b03          	ld	a,(OFST+1,sp)
2737  07f2 97            	ld	xl,a
2738  07f3 7b02          	ld	a,(OFST+0,sp)
2739  07f5 95            	ld	xh,a
2740  07f6 cd153c        	call	L5_TI2_Config
2742  07f9 84            	pop	a
2743                     ; 538         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2745  07fa 7b08          	ld	a,(OFST+6,sp)
2746  07fc cd129a        	call	_TIM1_SetIC2Prescaler
2749  07ff 2024          	jra	L567
2750  0801               L367:
2751                     ; 543         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2751                     ; 544                    (uint8_t)TIM1_ICFilter);
2753  0801 7b09          	ld	a,(OFST+7,sp)
2754  0803 88            	push	a
2755  0804 7b08          	ld	a,(OFST+6,sp)
2756  0806 97            	ld	xl,a
2757  0807 7b05          	ld	a,(OFST+3,sp)
2758  0809 95            	ld	xh,a
2759  080a cd153c        	call	L5_TI2_Config
2761  080d 84            	pop	a
2762                     ; 547         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2764  080e 7b08          	ld	a,(OFST+6,sp)
2765  0810 cd129a        	call	_TIM1_SetIC2Prescaler
2767                     ; 550         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2769  0813 7b09          	ld	a,(OFST+7,sp)
2770  0815 88            	push	a
2771  0816 7b03          	ld	a,(OFST+1,sp)
2772  0818 97            	ld	xl,a
2773  0819 7b02          	ld	a,(OFST+0,sp)
2774  081b 95            	ld	xh,a
2775  081c cd150c        	call	L3_TI1_Config
2777  081f 84            	pop	a
2778                     ; 553         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2780  0820 7b08          	ld	a,(OFST+6,sp)
2781  0822 cd126b        	call	_TIM1_SetIC1Prescaler
2783  0825               L567:
2784                     ; 555 }
2787  0825 5b04          	addw	sp,#4
2788  0827 81            	ret
2844                     ; 563 void TIM1_Cmd(FunctionalState NewState)
2844                     ; 564 {
2845                     	switch	.text
2846  0828               _TIM1_Cmd:
2848  0828 88            	push	a
2849       00000000      OFST:	set	0
2852                     ; 566     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2854  0829 4d            	tnz	a
2855  082a 2704          	jreq	L014
2856  082c a101          	cp	a,#1
2857  082e 2603          	jrne	L604
2858  0830               L014:
2859  0830 4f            	clr	a
2860  0831 2010          	jra	L214
2861  0833               L604:
2862  0833 ae0236        	ldw	x,#566
2863  0836 89            	pushw	x
2864  0837 ae0000        	ldw	x,#0
2865  083a 89            	pushw	x
2866  083b ae0000        	ldw	x,#L101
2867  083e cd0000        	call	_assert_failed
2869  0841 5b04          	addw	sp,#4
2870  0843               L214:
2871                     ; 569     if (NewState != DISABLE)
2873  0843 0d01          	tnz	(OFST+1,sp)
2874  0845 2706          	jreq	L5101
2875                     ; 571         TIM1->CR1 |= TIM1_CR1_CEN;
2877  0847 72105250      	bset	21072,#0
2879  084b 2004          	jra	L7101
2880  084d               L5101:
2881                     ; 575         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2883  084d 72115250      	bres	21072,#0
2884  0851               L7101:
2885                     ; 577 }
2888  0851 84            	pop	a
2889  0852 81            	ret
2926                     ; 585 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2926                     ; 586 {
2927                     	switch	.text
2928  0853               _TIM1_CtrlPWMOutputs:
2930  0853 88            	push	a
2931       00000000      OFST:	set	0
2934                     ; 588     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2936  0854 4d            	tnz	a
2937  0855 2704          	jreq	L024
2938  0857 a101          	cp	a,#1
2939  0859 2603          	jrne	L614
2940  085b               L024:
2941  085b 4f            	clr	a
2942  085c 2010          	jra	L224
2943  085e               L614:
2944  085e ae024c        	ldw	x,#588
2945  0861 89            	pushw	x
2946  0862 ae0000        	ldw	x,#0
2947  0865 89            	pushw	x
2948  0866 ae0000        	ldw	x,#L101
2949  0869 cd0000        	call	_assert_failed
2951  086c 5b04          	addw	sp,#4
2952  086e               L224:
2953                     ; 592     if (NewState != DISABLE)
2955  086e 0d01          	tnz	(OFST+1,sp)
2956  0870 2706          	jreq	L7301
2957                     ; 594         TIM1->BKR |= TIM1_BKR_MOE;
2959  0872 721e526d      	bset	21101,#7
2961  0876 2004          	jra	L1401
2962  0878               L7301:
2963                     ; 598         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2965  0878 721f526d      	bres	21101,#7
2966  087c               L1401:
2967                     ; 600 }
2970  087c 84            	pop	a
2971  087d 81            	ret
3079                     ; 619 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3079                     ; 620 {
3080                     	switch	.text
3081  087e               _TIM1_ITConfig:
3083  087e 89            	pushw	x
3084       00000000      OFST:	set	0
3087                     ; 622     assert_param(IS_TIM1_IT_OK(TIM1_IT));
3089  087f 9e            	ld	a,xh
3090  0880 4d            	tnz	a
3091  0881 2703          	jreq	L624
3092  0883 4f            	clr	a
3093  0884 2010          	jra	L034
3094  0886               L624:
3095  0886 ae026e        	ldw	x,#622
3096  0889 89            	pushw	x
3097  088a ae0000        	ldw	x,#0
3098  088d 89            	pushw	x
3099  088e ae0000        	ldw	x,#L101
3100  0891 cd0000        	call	_assert_failed
3102  0894 5b04          	addw	sp,#4
3103  0896               L034:
3104                     ; 623     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3106  0896 0d02          	tnz	(OFST+2,sp)
3107  0898 2706          	jreq	L434
3108  089a 7b02          	ld	a,(OFST+2,sp)
3109  089c a101          	cp	a,#1
3110  089e 2603          	jrne	L234
3111  08a0               L434:
3112  08a0 4f            	clr	a
3113  08a1 2010          	jra	L634
3114  08a3               L234:
3115  08a3 ae026f        	ldw	x,#623
3116  08a6 89            	pushw	x
3117  08a7 ae0000        	ldw	x,#0
3118  08aa 89            	pushw	x
3119  08ab ae0000        	ldw	x,#L101
3120  08ae cd0000        	call	_assert_failed
3122  08b1 5b04          	addw	sp,#4
3123  08b3               L634:
3124                     ; 625     if (NewState != DISABLE)
3126  08b3 0d02          	tnz	(OFST+2,sp)
3127  08b5 270a          	jreq	L1111
3128                     ; 628         TIM1->IER |= (uint8_t)TIM1_IT;
3130  08b7 c65254        	ld	a,21076
3131  08ba 1a01          	or	a,(OFST+1,sp)
3132  08bc c75254        	ld	21076,a
3134  08bf 2009          	jra	L3111
3135  08c1               L1111:
3136                     ; 633         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3138  08c1 7b01          	ld	a,(OFST+1,sp)
3139  08c3 43            	cpl	a
3140  08c4 c45254        	and	a,21076
3141  08c7 c75254        	ld	21076,a
3142  08ca               L3111:
3143                     ; 635 }
3146  08ca 85            	popw	x
3147  08cb 81            	ret
3171                     ; 642 void TIM1_InternalClockConfig(void)
3171                     ; 643 {
3172                     	switch	.text
3173  08cc               _TIM1_InternalClockConfig:
3177                     ; 645     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3179  08cc c65252        	ld	a,21074
3180  08cf a4f8          	and	a,#248
3181  08d1 c75252        	ld	21074,a
3182                     ; 646 }
3185  08d4 81            	ret
3303                     ; 664 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3303                     ; 665                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3303                     ; 666                               uint8_t ExtTRGFilter)
3303                     ; 667 {
3304                     	switch	.text
3305  08d5               _TIM1_ETRClockMode1Config:
3307  08d5 89            	pushw	x
3308       00000000      OFST:	set	0
3311                     ; 669     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3313  08d6 9e            	ld	a,xh
3314  08d7 4d            	tnz	a
3315  08d8 270f          	jreq	L644
3316  08da 9e            	ld	a,xh
3317  08db a110          	cp	a,#16
3318  08dd 270a          	jreq	L644
3319  08df 9e            	ld	a,xh
3320  08e0 a120          	cp	a,#32
3321  08e2 2705          	jreq	L644
3322  08e4 9e            	ld	a,xh
3323  08e5 a130          	cp	a,#48
3324  08e7 2603          	jrne	L444
3325  08e9               L644:
3326  08e9 4f            	clr	a
3327  08ea 2010          	jra	L054
3328  08ec               L444:
3329  08ec ae029d        	ldw	x,#669
3330  08ef 89            	pushw	x
3331  08f0 ae0000        	ldw	x,#0
3332  08f3 89            	pushw	x
3333  08f4 ae0000        	ldw	x,#L101
3334  08f7 cd0000        	call	_assert_failed
3336  08fa 5b04          	addw	sp,#4
3337  08fc               L054:
3338                     ; 670     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3340  08fc 7b02          	ld	a,(OFST+2,sp)
3341  08fe a180          	cp	a,#128
3342  0900 2704          	jreq	L454
3343  0902 0d02          	tnz	(OFST+2,sp)
3344  0904 2603          	jrne	L254
3345  0906               L454:
3346  0906 4f            	clr	a
3347  0907 2010          	jra	L654
3348  0909               L254:
3349  0909 ae029e        	ldw	x,#670
3350  090c 89            	pushw	x
3351  090d ae0000        	ldw	x,#0
3352  0910 89            	pushw	x
3353  0911 ae0000        	ldw	x,#L101
3354  0914 cd0000        	call	_assert_failed
3356  0917 5b04          	addw	sp,#4
3357  0919               L654:
3358                     ; 673     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3360  0919 7b05          	ld	a,(OFST+5,sp)
3361  091b 88            	push	a
3362  091c 7b03          	ld	a,(OFST+3,sp)
3363  091e 97            	ld	xl,a
3364  091f 7b02          	ld	a,(OFST+2,sp)
3365  0921 95            	ld	xh,a
3366  0922 ad63          	call	_TIM1_ETRConfig
3368  0924 84            	pop	a
3369                     ; 676     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3369                     ; 677                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3371  0925 c65252        	ld	a,21074
3372  0928 a488          	and	a,#136
3373  092a aa77          	or	a,#119
3374  092c c75252        	ld	21074,a
3375                     ; 678 }
3378  092f 85            	popw	x
3379  0930 81            	ret
3438                     ; 696 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3438                     ; 697                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3438                     ; 698                               uint8_t ExtTRGFilter)
3438                     ; 699 {
3439                     	switch	.text
3440  0931               _TIM1_ETRClockMode2Config:
3442  0931 89            	pushw	x
3443       00000000      OFST:	set	0
3446                     ; 701     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3448  0932 9e            	ld	a,xh
3449  0933 4d            	tnz	a
3450  0934 270f          	jreq	L464
3451  0936 9e            	ld	a,xh
3452  0937 a110          	cp	a,#16
3453  0939 270a          	jreq	L464
3454  093b 9e            	ld	a,xh
3455  093c a120          	cp	a,#32
3456  093e 2705          	jreq	L464
3457  0940 9e            	ld	a,xh
3458  0941 a130          	cp	a,#48
3459  0943 2603          	jrne	L264
3460  0945               L464:
3461  0945 4f            	clr	a
3462  0946 2010          	jra	L664
3463  0948               L264:
3464  0948 ae02bd        	ldw	x,#701
3465  094b 89            	pushw	x
3466  094c ae0000        	ldw	x,#0
3467  094f 89            	pushw	x
3468  0950 ae0000        	ldw	x,#L101
3469  0953 cd0000        	call	_assert_failed
3471  0956 5b04          	addw	sp,#4
3472  0958               L664:
3473                     ; 702     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3475  0958 7b02          	ld	a,(OFST+2,sp)
3476  095a a180          	cp	a,#128
3477  095c 2704          	jreq	L274
3478  095e 0d02          	tnz	(OFST+2,sp)
3479  0960 2603          	jrne	L074
3480  0962               L274:
3481  0962 4f            	clr	a
3482  0963 2010          	jra	L474
3483  0965               L074:
3484  0965 ae02be        	ldw	x,#702
3485  0968 89            	pushw	x
3486  0969 ae0000        	ldw	x,#0
3487  096c 89            	pushw	x
3488  096d ae0000        	ldw	x,#L101
3489  0970 cd0000        	call	_assert_failed
3491  0973 5b04          	addw	sp,#4
3492  0975               L474:
3493                     ; 705     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3495  0975 7b05          	ld	a,(OFST+5,sp)
3496  0977 88            	push	a
3497  0978 7b03          	ld	a,(OFST+3,sp)
3498  097a 97            	ld	xl,a
3499  097b 7b02          	ld	a,(OFST+2,sp)
3500  097d 95            	ld	xh,a
3501  097e ad07          	call	_TIM1_ETRConfig
3503  0980 84            	pop	a
3504                     ; 708     TIM1->ETR |= TIM1_ETR_ECE;
3506  0981 721c5253      	bset	21075,#6
3507                     ; 709 }
3510  0985 85            	popw	x
3511  0986 81            	ret
3568                     ; 727 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3568                     ; 728                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3568                     ; 729                     uint8_t ExtTRGFilter)
3568                     ; 730 {
3569                     	switch	.text
3570  0987               _TIM1_ETRConfig:
3572  0987 89            	pushw	x
3573       00000000      OFST:	set	0
3576                     ; 732     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3578  0988 7b05          	ld	a,(OFST+5,sp)
3579  098a a110          	cp	a,#16
3580  098c 2403          	jruge	L005
3581  098e 4f            	clr	a
3582  098f 2010          	jra	L205
3583  0991               L005:
3584  0991 ae02dc        	ldw	x,#732
3585  0994 89            	pushw	x
3586  0995 ae0000        	ldw	x,#0
3587  0998 89            	pushw	x
3588  0999 ae0000        	ldw	x,#L101
3589  099c cd0000        	call	_assert_failed
3591  099f 5b04          	addw	sp,#4
3592  09a1               L205:
3593                     ; 734     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3593                     ; 735                       (uint8_t)ExtTRGFilter );
3595  09a1 7b01          	ld	a,(OFST+1,sp)
3596  09a3 1a02          	or	a,(OFST+2,sp)
3597  09a5 1a05          	or	a,(OFST+5,sp)
3598  09a7 ca5253        	or	a,21075
3599  09aa c75253        	ld	21075,a
3600                     ; 736 }
3603  09ad 85            	popw	x
3604  09ae 81            	ret
3694                     ; 753 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3694                     ; 754                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3694                     ; 755                                  uint8_t ICFilter)
3694                     ; 756 {
3695                     	switch	.text
3696  09af               _TIM1_TIxExternalClockConfig:
3698  09af 89            	pushw	x
3699       00000000      OFST:	set	0
3702                     ; 758     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3704  09b0 9e            	ld	a,xh
3705  09b1 a140          	cp	a,#64
3706  09b3 270a          	jreq	L015
3707  09b5 9e            	ld	a,xh
3708  09b6 a160          	cp	a,#96
3709  09b8 2705          	jreq	L015
3710  09ba 9e            	ld	a,xh
3711  09bb a150          	cp	a,#80
3712  09bd 2603          	jrne	L605
3713  09bf               L015:
3714  09bf 4f            	clr	a
3715  09c0 2010          	jra	L215
3716  09c2               L605:
3717  09c2 ae02f6        	ldw	x,#758
3718  09c5 89            	pushw	x
3719  09c6 ae0000        	ldw	x,#0
3720  09c9 89            	pushw	x
3721  09ca ae0000        	ldw	x,#L101
3722  09cd cd0000        	call	_assert_failed
3724  09d0 5b04          	addw	sp,#4
3725  09d2               L215:
3726                     ; 759     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3728  09d2 0d02          	tnz	(OFST+2,sp)
3729  09d4 2706          	jreq	L615
3730  09d6 7b02          	ld	a,(OFST+2,sp)
3731  09d8 a101          	cp	a,#1
3732  09da 2603          	jrne	L415
3733  09dc               L615:
3734  09dc 4f            	clr	a
3735  09dd 2010          	jra	L025
3736  09df               L415:
3737  09df ae02f7        	ldw	x,#759
3738  09e2 89            	pushw	x
3739  09e3 ae0000        	ldw	x,#0
3740  09e6 89            	pushw	x
3741  09e7 ae0000        	ldw	x,#L101
3742  09ea cd0000        	call	_assert_failed
3744  09ed 5b04          	addw	sp,#4
3745  09ef               L025:
3746                     ; 760     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3748  09ef 7b05          	ld	a,(OFST+5,sp)
3749  09f1 a110          	cp	a,#16
3750  09f3 2403          	jruge	L225
3751  09f5 4f            	clr	a
3752  09f6 2010          	jra	L425
3753  09f8               L225:
3754  09f8 ae02f8        	ldw	x,#760
3755  09fb 89            	pushw	x
3756  09fc ae0000        	ldw	x,#0
3757  09ff 89            	pushw	x
3758  0a00 ae0000        	ldw	x,#L101
3759  0a03 cd0000        	call	_assert_failed
3761  0a06 5b04          	addw	sp,#4
3762  0a08               L425:
3763                     ; 763     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3765  0a08 7b01          	ld	a,(OFST+1,sp)
3766  0a0a a160          	cp	a,#96
3767  0a0c 260f          	jrne	L3131
3768                     ; 765         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3770  0a0e 7b05          	ld	a,(OFST+5,sp)
3771  0a10 88            	push	a
3772  0a11 ae0001        	ldw	x,#1
3773  0a14 7b03          	ld	a,(OFST+3,sp)
3774  0a16 95            	ld	xh,a
3775  0a17 cd153c        	call	L5_TI2_Config
3777  0a1a 84            	pop	a
3779  0a1b 200d          	jra	L5131
3780  0a1d               L3131:
3781                     ; 769         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3783  0a1d 7b05          	ld	a,(OFST+5,sp)
3784  0a1f 88            	push	a
3785  0a20 ae0001        	ldw	x,#1
3786  0a23 7b03          	ld	a,(OFST+3,sp)
3787  0a25 95            	ld	xh,a
3788  0a26 cd150c        	call	L3_TI1_Config
3790  0a29 84            	pop	a
3791  0a2a               L5131:
3792                     ; 773     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3794  0a2a 7b01          	ld	a,(OFST+1,sp)
3795  0a2c ad0a          	call	_TIM1_SelectInputTrigger
3797                     ; 776     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3799  0a2e c65252        	ld	a,21074
3800  0a31 aa07          	or	a,#7
3801  0a33 c75252        	ld	21074,a
3802                     ; 777 }
3805  0a36 85            	popw	x
3806  0a37 81            	ret
3892                     ; 789 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3892                     ; 790 {
3893                     	switch	.text
3894  0a38               _TIM1_SelectInputTrigger:
3896  0a38 88            	push	a
3897       00000000      OFST:	set	0
3900                     ; 792     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3902  0a39 a140          	cp	a,#64
3903  0a3b 2713          	jreq	L235
3904  0a3d a150          	cp	a,#80
3905  0a3f 270f          	jreq	L235
3906  0a41 a160          	cp	a,#96
3907  0a43 270b          	jreq	L235
3908  0a45 a170          	cp	a,#112
3909  0a47 2707          	jreq	L235
3910  0a49 a130          	cp	a,#48
3911  0a4b 2703          	jreq	L235
3912  0a4d 4d            	tnz	a
3913  0a4e 2603          	jrne	L035
3914  0a50               L235:
3915  0a50 4f            	clr	a
3916  0a51 2010          	jra	L435
3917  0a53               L035:
3918  0a53 ae0318        	ldw	x,#792
3919  0a56 89            	pushw	x
3920  0a57 ae0000        	ldw	x,#0
3921  0a5a 89            	pushw	x
3922  0a5b ae0000        	ldw	x,#L101
3923  0a5e cd0000        	call	_assert_failed
3925  0a61 5b04          	addw	sp,#4
3926  0a63               L435:
3927                     ; 795     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3929  0a63 c65252        	ld	a,21074
3930  0a66 a48f          	and	a,#143
3931  0a68 1a01          	or	a,(OFST+1,sp)
3932  0a6a c75252        	ld	21074,a
3933                     ; 796 }
3936  0a6d 84            	pop	a
3937  0a6e 81            	ret
3974                     ; 806 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3974                     ; 807 {
3975                     	switch	.text
3976  0a6f               _TIM1_UpdateDisableConfig:
3978  0a6f 88            	push	a
3979       00000000      OFST:	set	0
3982                     ; 809     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3984  0a70 4d            	tnz	a
3985  0a71 2704          	jreq	L245
3986  0a73 a101          	cp	a,#1
3987  0a75 2603          	jrne	L045
3988  0a77               L245:
3989  0a77 4f            	clr	a
3990  0a78 2010          	jra	L445
3991  0a7a               L045:
3992  0a7a ae0329        	ldw	x,#809
3993  0a7d 89            	pushw	x
3994  0a7e ae0000        	ldw	x,#0
3995  0a81 89            	pushw	x
3996  0a82 ae0000        	ldw	x,#L101
3997  0a85 cd0000        	call	_assert_failed
3999  0a88 5b04          	addw	sp,#4
4000  0a8a               L445:
4001                     ; 812     if (NewState != DISABLE)
4003  0a8a 0d01          	tnz	(OFST+1,sp)
4004  0a8c 2706          	jreq	L3731
4005                     ; 814         TIM1->CR1 |= TIM1_CR1_UDIS;
4007  0a8e 72125250      	bset	21072,#1
4009  0a92 2004          	jra	L5731
4010  0a94               L3731:
4011                     ; 818         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
4013  0a94 72135250      	bres	21072,#1
4014  0a98               L5731:
4015                     ; 820 }
4018  0a98 84            	pop	a
4019  0a99 81            	ret
4078                     ; 830 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4078                     ; 831 {
4079                     	switch	.text
4080  0a9a               _TIM1_UpdateRequestConfig:
4082  0a9a 88            	push	a
4083       00000000      OFST:	set	0
4086                     ; 833     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4088  0a9b 4d            	tnz	a
4089  0a9c 2704          	jreq	L255
4090  0a9e a101          	cp	a,#1
4091  0aa0 2603          	jrne	L055
4092  0aa2               L255:
4093  0aa2 4f            	clr	a
4094  0aa3 2010          	jra	L455
4095  0aa5               L055:
4096  0aa5 ae0341        	ldw	x,#833
4097  0aa8 89            	pushw	x
4098  0aa9 ae0000        	ldw	x,#0
4099  0aac 89            	pushw	x
4100  0aad ae0000        	ldw	x,#L101
4101  0ab0 cd0000        	call	_assert_failed
4103  0ab3 5b04          	addw	sp,#4
4104  0ab5               L455:
4105                     ; 836     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4107  0ab5 0d01          	tnz	(OFST+1,sp)
4108  0ab7 2706          	jreq	L5241
4109                     ; 838         TIM1->CR1 |= TIM1_CR1_URS;
4111  0ab9 72145250      	bset	21072,#2
4113  0abd 2004          	jra	L7241
4114  0abf               L5241:
4115                     ; 842         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4117  0abf 72155250      	bres	21072,#2
4118  0ac3               L7241:
4119                     ; 844 }
4122  0ac3 84            	pop	a
4123  0ac4 81            	ret
4160                     ; 853 void TIM1_SelectHallSensor(FunctionalState NewState)
4160                     ; 854 {
4161                     	switch	.text
4162  0ac5               _TIM1_SelectHallSensor:
4164  0ac5 88            	push	a
4165       00000000      OFST:	set	0
4168                     ; 856     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4170  0ac6 4d            	tnz	a
4171  0ac7 2704          	jreq	L265
4172  0ac9 a101          	cp	a,#1
4173  0acb 2603          	jrne	L065
4174  0acd               L265:
4175  0acd 4f            	clr	a
4176  0ace 2010          	jra	L465
4177  0ad0               L065:
4178  0ad0 ae0358        	ldw	x,#856
4179  0ad3 89            	pushw	x
4180  0ad4 ae0000        	ldw	x,#0
4181  0ad7 89            	pushw	x
4182  0ad8 ae0000        	ldw	x,#L101
4183  0adb cd0000        	call	_assert_failed
4185  0ade 5b04          	addw	sp,#4
4186  0ae0               L465:
4187                     ; 859     if (NewState != DISABLE)
4189  0ae0 0d01          	tnz	(OFST+1,sp)
4190  0ae2 2706          	jreq	L7441
4191                     ; 861         TIM1->CR2 |= TIM1_CR2_TI1S;
4193  0ae4 721e5251      	bset	21073,#7
4195  0ae8 2004          	jra	L1541
4196  0aea               L7441:
4197                     ; 865         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4199  0aea 721f5251      	bres	21073,#7
4200  0aee               L1541:
4201                     ; 867 }
4204  0aee 84            	pop	a
4205  0aef 81            	ret
4263                     ; 878 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4263                     ; 879 {
4264                     	switch	.text
4265  0af0               _TIM1_SelectOnePulseMode:
4267  0af0 88            	push	a
4268       00000000      OFST:	set	0
4271                     ; 881     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4273  0af1 a101          	cp	a,#1
4274  0af3 2703          	jreq	L275
4275  0af5 4d            	tnz	a
4276  0af6 2603          	jrne	L075
4277  0af8               L275:
4278  0af8 4f            	clr	a
4279  0af9 2010          	jra	L475
4280  0afb               L075:
4281  0afb ae0371        	ldw	x,#881
4282  0afe 89            	pushw	x
4283  0aff ae0000        	ldw	x,#0
4284  0b02 89            	pushw	x
4285  0b03 ae0000        	ldw	x,#L101
4286  0b06 cd0000        	call	_assert_failed
4288  0b09 5b04          	addw	sp,#4
4289  0b0b               L475:
4290                     ; 884     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4292  0b0b 0d01          	tnz	(OFST+1,sp)
4293  0b0d 2706          	jreq	L1051
4294                     ; 886         TIM1->CR1 |= TIM1_CR1_OPM;
4296  0b0f 72165250      	bset	21072,#3
4298  0b13 2004          	jra	L3051
4299  0b15               L1051:
4300                     ; 890         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4302  0b15 72175250      	bres	21072,#3
4303  0b19               L3051:
4304                     ; 893 }
4307  0b19 84            	pop	a
4308  0b1a 81            	ret
4407                     ; 909 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4407                     ; 910 {
4408                     	switch	.text
4409  0b1b               _TIM1_SelectOutputTrigger:
4411  0b1b 88            	push	a
4412       00000000      OFST:	set	0
4415                     ; 912     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4417  0b1c 4d            	tnz	a
4418  0b1d 2718          	jreq	L206
4419  0b1f a110          	cp	a,#16
4420  0b21 2714          	jreq	L206
4421  0b23 a120          	cp	a,#32
4422  0b25 2710          	jreq	L206
4423  0b27 a130          	cp	a,#48
4424  0b29 270c          	jreq	L206
4425  0b2b a140          	cp	a,#64
4426  0b2d 2708          	jreq	L206
4427  0b2f a150          	cp	a,#80
4428  0b31 2704          	jreq	L206
4429  0b33 a160          	cp	a,#96
4430  0b35 2603          	jrne	L006
4431  0b37               L206:
4432  0b37 4f            	clr	a
4433  0b38 2010          	jra	L406
4434  0b3a               L006:
4435  0b3a ae0390        	ldw	x,#912
4436  0b3d 89            	pushw	x
4437  0b3e ae0000        	ldw	x,#0
4438  0b41 89            	pushw	x
4439  0b42 ae0000        	ldw	x,#L101
4440  0b45 cd0000        	call	_assert_failed
4442  0b48 5b04          	addw	sp,#4
4443  0b4a               L406:
4444                     ; 915     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4444                     ; 916                           (uint8_t) TIM1_TRGOSource);
4446  0b4a c65251        	ld	a,21073
4447  0b4d a48f          	and	a,#143
4448  0b4f 1a01          	or	a,(OFST+1,sp)
4449  0b51 c75251        	ld	21073,a
4450                     ; 917 }
4453  0b54 84            	pop	a
4454  0b55 81            	ret
4529                     ; 929 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4529                     ; 930 {
4530                     	switch	.text
4531  0b56               _TIM1_SelectSlaveMode:
4533  0b56 88            	push	a
4534       00000000      OFST:	set	0
4537                     ; 933     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4539  0b57 a104          	cp	a,#4
4540  0b59 270c          	jreq	L216
4541  0b5b a105          	cp	a,#5
4542  0b5d 2708          	jreq	L216
4543  0b5f a106          	cp	a,#6
4544  0b61 2704          	jreq	L216
4545  0b63 a107          	cp	a,#7
4546  0b65 2603          	jrne	L016
4547  0b67               L216:
4548  0b67 4f            	clr	a
4549  0b68 2010          	jra	L416
4550  0b6a               L016:
4551  0b6a ae03a5        	ldw	x,#933
4552  0b6d 89            	pushw	x
4553  0b6e ae0000        	ldw	x,#0
4554  0b71 89            	pushw	x
4555  0b72 ae0000        	ldw	x,#L101
4556  0b75 cd0000        	call	_assert_failed
4558  0b78 5b04          	addw	sp,#4
4559  0b7a               L416:
4560                     ; 936     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4560                     ; 937                            (uint8_t)TIM1_SlaveMode);
4562  0b7a c65252        	ld	a,21074
4563  0b7d a4f8          	and	a,#248
4564  0b7f 1a01          	or	a,(OFST+1,sp)
4565  0b81 c75252        	ld	21074,a
4566                     ; 939 }
4569  0b84 84            	pop	a
4570  0b85 81            	ret
4607                     ; 947 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4607                     ; 948 {
4608                     	switch	.text
4609  0b86               _TIM1_SelectMasterSlaveMode:
4611  0b86 88            	push	a
4612       00000000      OFST:	set	0
4615                     ; 950     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4617  0b87 4d            	tnz	a
4618  0b88 2704          	jreq	L226
4619  0b8a a101          	cp	a,#1
4620  0b8c 2603          	jrne	L026
4621  0b8e               L226:
4622  0b8e 4f            	clr	a
4623  0b8f 2010          	jra	L426
4624  0b91               L026:
4625  0b91 ae03b6        	ldw	x,#950
4626  0b94 89            	pushw	x
4627  0b95 ae0000        	ldw	x,#0
4628  0b98 89            	pushw	x
4629  0b99 ae0000        	ldw	x,#L101
4630  0b9c cd0000        	call	_assert_failed
4632  0b9f 5b04          	addw	sp,#4
4633  0ba1               L426:
4634                     ; 953     if (NewState != DISABLE)
4636  0ba1 0d01          	tnz	(OFST+1,sp)
4637  0ba3 2706          	jreq	L5161
4638                     ; 955         TIM1->SMCR |= TIM1_SMCR_MSM;
4640  0ba5 721e5252      	bset	21074,#7
4642  0ba9 2004          	jra	L7161
4643  0bab               L5161:
4644                     ; 959         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4646  0bab 721f5252      	bres	21074,#7
4647  0baf               L7161:
4648                     ; 961 }
4651  0baf 84            	pop	a
4652  0bb0 81            	ret
4739                     ; 983 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4739                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4739                     ; 985                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4739                     ; 986 {
4740                     	switch	.text
4741  0bb1               _TIM1_EncoderInterfaceConfig:
4743  0bb1 89            	pushw	x
4744       00000000      OFST:	set	0
4747                     ; 990     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4749  0bb2 9e            	ld	a,xh
4750  0bb3 a101          	cp	a,#1
4751  0bb5 270a          	jreq	L236
4752  0bb7 9e            	ld	a,xh
4753  0bb8 a102          	cp	a,#2
4754  0bba 2705          	jreq	L236
4755  0bbc 9e            	ld	a,xh
4756  0bbd a103          	cp	a,#3
4757  0bbf 2603          	jrne	L036
4758  0bc1               L236:
4759  0bc1 4f            	clr	a
4760  0bc2 2010          	jra	L436
4761  0bc4               L036:
4762  0bc4 ae03de        	ldw	x,#990
4763  0bc7 89            	pushw	x
4764  0bc8 ae0000        	ldw	x,#0
4765  0bcb 89            	pushw	x
4766  0bcc ae0000        	ldw	x,#L101
4767  0bcf cd0000        	call	_assert_failed
4769  0bd2 5b04          	addw	sp,#4
4770  0bd4               L436:
4771                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4773  0bd4 0d02          	tnz	(OFST+2,sp)
4774  0bd6 2706          	jreq	L046
4775  0bd8 7b02          	ld	a,(OFST+2,sp)
4776  0bda a101          	cp	a,#1
4777  0bdc 2603          	jrne	L636
4778  0bde               L046:
4779  0bde 4f            	clr	a
4780  0bdf 2010          	jra	L246
4781  0be1               L636:
4782  0be1 ae03df        	ldw	x,#991
4783  0be4 89            	pushw	x
4784  0be5 ae0000        	ldw	x,#0
4785  0be8 89            	pushw	x
4786  0be9 ae0000        	ldw	x,#L101
4787  0bec cd0000        	call	_assert_failed
4789  0bef 5b04          	addw	sp,#4
4790  0bf1               L246:
4791                     ; 992     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4793  0bf1 0d05          	tnz	(OFST+5,sp)
4794  0bf3 2706          	jreq	L646
4795  0bf5 7b05          	ld	a,(OFST+5,sp)
4796  0bf7 a101          	cp	a,#1
4797  0bf9 2603          	jrne	L446
4798  0bfb               L646:
4799  0bfb 4f            	clr	a
4800  0bfc 2010          	jra	L056
4801  0bfe               L446:
4802  0bfe ae03e0        	ldw	x,#992
4803  0c01 89            	pushw	x
4804  0c02 ae0000        	ldw	x,#0
4805  0c05 89            	pushw	x
4806  0c06 ae0000        	ldw	x,#L101
4807  0c09 cd0000        	call	_assert_failed
4809  0c0c 5b04          	addw	sp,#4
4810  0c0e               L056:
4811                     ; 995     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4813  0c0e 0d02          	tnz	(OFST+2,sp)
4814  0c10 2706          	jreq	L1661
4815                     ; 997         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4817  0c12 7212525c      	bset	21084,#1
4819  0c16 2004          	jra	L3661
4820  0c18               L1661:
4821                     ; 1001         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4823  0c18 7213525c      	bres	21084,#1
4824  0c1c               L3661:
4825                     ; 1004     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4827  0c1c 0d05          	tnz	(OFST+5,sp)
4828  0c1e 2706          	jreq	L5661
4829                     ; 1006         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4831  0c20 721a525c      	bset	21084,#5
4833  0c24 2004          	jra	L7661
4834  0c26               L5661:
4835                     ; 1010         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4837  0c26 721b525c      	bres	21084,#5
4838  0c2a               L7661:
4839                     ; 1013     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4839                     ; 1014                            | (uint8_t) TIM1_EncoderMode);
4841  0c2a c65252        	ld	a,21074
4842  0c2d a4f0          	and	a,#240
4843  0c2f 1a01          	or	a,(OFST+1,sp)
4844  0c31 c75252        	ld	21074,a
4845                     ; 1017     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4845                     ; 1018                             | (uint8_t) CCMR_TIxDirect_Set);
4847  0c34 c65258        	ld	a,21080
4848  0c37 a4fc          	and	a,#252
4849  0c39 aa01          	or	a,#1
4850  0c3b c75258        	ld	21080,a
4851                     ; 1019     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4851                     ; 1020                             | (uint8_t) CCMR_TIxDirect_Set);
4853  0c3e c65259        	ld	a,21081
4854  0c41 a4fc          	and	a,#252
4855  0c43 aa01          	or	a,#1
4856  0c45 c75259        	ld	21081,a
4857                     ; 1022 }
4860  0c48 85            	popw	x
4861  0c49 81            	ret
4929                     ; 1035 void TIM1_PrescalerConfig(uint16_t Prescaler,
4929                     ; 1036                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4929                     ; 1037 {
4930                     	switch	.text
4931  0c4a               _TIM1_PrescalerConfig:
4933  0c4a 89            	pushw	x
4934       00000000      OFST:	set	0
4937                     ; 1039     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4939  0c4b 0d05          	tnz	(OFST+5,sp)
4940  0c4d 2706          	jreq	L656
4941  0c4f 7b05          	ld	a,(OFST+5,sp)
4942  0c51 a101          	cp	a,#1
4943  0c53 2603          	jrne	L456
4944  0c55               L656:
4945  0c55 4f            	clr	a
4946  0c56 2010          	jra	L066
4947  0c58               L456:
4948  0c58 ae040f        	ldw	x,#1039
4949  0c5b 89            	pushw	x
4950  0c5c ae0000        	ldw	x,#0
4951  0c5f 89            	pushw	x
4952  0c60 ae0000        	ldw	x,#L101
4953  0c63 cd0000        	call	_assert_failed
4955  0c66 5b04          	addw	sp,#4
4956  0c68               L066:
4957                     ; 1042     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4959  0c68 7b01          	ld	a,(OFST+1,sp)
4960  0c6a c75260        	ld	21088,a
4961                     ; 1043     TIM1->PSCRL = (uint8_t)(Prescaler);
4963  0c6d 7b02          	ld	a,(OFST+2,sp)
4964  0c6f c75261        	ld	21089,a
4965                     ; 1046     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4967  0c72 7b05          	ld	a,(OFST+5,sp)
4968  0c74 c75257        	ld	21079,a
4969                     ; 1048 }
4972  0c77 85            	popw	x
4973  0c78 81            	ret
5010                     ; 1061 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
5010                     ; 1062 {
5011                     	switch	.text
5012  0c79               _TIM1_CounterModeConfig:
5014  0c79 88            	push	a
5015       00000000      OFST:	set	0
5018                     ; 1064     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
5020  0c7a 4d            	tnz	a
5021  0c7b 2710          	jreq	L666
5022  0c7d a110          	cp	a,#16
5023  0c7f 270c          	jreq	L666
5024  0c81 a120          	cp	a,#32
5025  0c83 2708          	jreq	L666
5026  0c85 a140          	cp	a,#64
5027  0c87 2704          	jreq	L666
5028  0c89 a160          	cp	a,#96
5029  0c8b 2603          	jrne	L466
5030  0c8d               L666:
5031  0c8d 4f            	clr	a
5032  0c8e 2010          	jra	L076
5033  0c90               L466:
5034  0c90 ae0428        	ldw	x,#1064
5035  0c93 89            	pushw	x
5036  0c94 ae0000        	ldw	x,#0
5037  0c97 89            	pushw	x
5038  0c98 ae0000        	ldw	x,#L101
5039  0c9b cd0000        	call	_assert_failed
5041  0c9e 5b04          	addw	sp,#4
5042  0ca0               L076:
5043                     ; 1068     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5043                     ; 1069                           | (uint8_t)TIM1_CounterMode);
5045  0ca0 c65250        	ld	a,21072
5046  0ca3 a48f          	and	a,#143
5047  0ca5 1a01          	or	a,(OFST+1,sp)
5048  0ca7 c75250        	ld	21072,a
5049                     ; 1070 }
5052  0caa 84            	pop	a
5053  0cab 81            	ret
5112                     ; 1081 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5112                     ; 1082 {
5113                     	switch	.text
5114  0cac               _TIM1_ForcedOC1Config:
5116  0cac 88            	push	a
5117       00000000      OFST:	set	0
5120                     ; 1084     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5122  0cad a150          	cp	a,#80
5123  0caf 2704          	jreq	L676
5124  0cb1 a140          	cp	a,#64
5125  0cb3 2603          	jrne	L476
5126  0cb5               L676:
5127  0cb5 4f            	clr	a
5128  0cb6 2010          	jra	L007
5129  0cb8               L476:
5130  0cb8 ae043c        	ldw	x,#1084
5131  0cbb 89            	pushw	x
5132  0cbc ae0000        	ldw	x,#0
5133  0cbf 89            	pushw	x
5134  0cc0 ae0000        	ldw	x,#L101
5135  0cc3 cd0000        	call	_assert_failed
5137  0cc6 5b04          	addw	sp,#4
5138  0cc8               L007:
5139                     ; 1087     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5139                     ; 1088                              (uint8_t)TIM1_ForcedAction);
5141  0cc8 c65258        	ld	a,21080
5142  0ccb a48f          	and	a,#143
5143  0ccd 1a01          	or	a,(OFST+1,sp)
5144  0ccf c75258        	ld	21080,a
5145                     ; 1089 }
5148  0cd2 84            	pop	a
5149  0cd3 81            	ret
5186                     ; 1100 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5186                     ; 1101 {
5187                     	switch	.text
5188  0cd4               _TIM1_ForcedOC2Config:
5190  0cd4 88            	push	a
5191       00000000      OFST:	set	0
5194                     ; 1103     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5196  0cd5 a150          	cp	a,#80
5197  0cd7 2704          	jreq	L607
5198  0cd9 a140          	cp	a,#64
5199  0cdb 2603          	jrne	L407
5200  0cdd               L607:
5201  0cdd 4f            	clr	a
5202  0cde 2010          	jra	L017
5203  0ce0               L407:
5204  0ce0 ae044f        	ldw	x,#1103
5205  0ce3 89            	pushw	x
5206  0ce4 ae0000        	ldw	x,#0
5207  0ce7 89            	pushw	x
5208  0ce8 ae0000        	ldw	x,#L101
5209  0ceb cd0000        	call	_assert_failed
5211  0cee 5b04          	addw	sp,#4
5212  0cf0               L017:
5213                     ; 1106     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5213                     ; 1107                               | (uint8_t)TIM1_ForcedAction);
5215  0cf0 c65259        	ld	a,21081
5216  0cf3 a48f          	and	a,#143
5217  0cf5 1a01          	or	a,(OFST+1,sp)
5218  0cf7 c75259        	ld	21081,a
5219                     ; 1108 }
5222  0cfa 84            	pop	a
5223  0cfb 81            	ret
5260                     ; 1120 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5260                     ; 1121 {
5261                     	switch	.text
5262  0cfc               _TIM1_ForcedOC3Config:
5264  0cfc 88            	push	a
5265       00000000      OFST:	set	0
5268                     ; 1123     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5270  0cfd a150          	cp	a,#80
5271  0cff 2704          	jreq	L617
5272  0d01 a140          	cp	a,#64
5273  0d03 2603          	jrne	L417
5274  0d05               L617:
5275  0d05 4f            	clr	a
5276  0d06 2010          	jra	L027
5277  0d08               L417:
5278  0d08 ae0463        	ldw	x,#1123
5279  0d0b 89            	pushw	x
5280  0d0c ae0000        	ldw	x,#0
5281  0d0f 89            	pushw	x
5282  0d10 ae0000        	ldw	x,#L101
5283  0d13 cd0000        	call	_assert_failed
5285  0d16 5b04          	addw	sp,#4
5286  0d18               L027:
5287                     ; 1126     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5287                     ; 1127                               | (uint8_t)TIM1_ForcedAction);
5289  0d18 c6525a        	ld	a,21082
5290  0d1b a48f          	and	a,#143
5291  0d1d 1a01          	or	a,(OFST+1,sp)
5292  0d1f c7525a        	ld	21082,a
5293                     ; 1128 }
5296  0d22 84            	pop	a
5297  0d23 81            	ret
5334                     ; 1140 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5334                     ; 1141 {
5335                     	switch	.text
5336  0d24               _TIM1_ForcedOC4Config:
5338  0d24 88            	push	a
5339       00000000      OFST:	set	0
5342                     ; 1143     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5344  0d25 a150          	cp	a,#80
5345  0d27 2704          	jreq	L627
5346  0d29 a140          	cp	a,#64
5347  0d2b 2603          	jrne	L427
5348  0d2d               L627:
5349  0d2d 4f            	clr	a
5350  0d2e 2010          	jra	L037
5351  0d30               L427:
5352  0d30 ae0477        	ldw	x,#1143
5353  0d33 89            	pushw	x
5354  0d34 ae0000        	ldw	x,#0
5355  0d37 89            	pushw	x
5356  0d38 ae0000        	ldw	x,#L101
5357  0d3b cd0000        	call	_assert_failed
5359  0d3e 5b04          	addw	sp,#4
5360  0d40               L037:
5361                     ; 1146     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5361                     ; 1147                               | (uint8_t)TIM1_ForcedAction);
5363  0d40 c6525b        	ld	a,21083
5364  0d43 a48f          	and	a,#143
5365  0d45 1a01          	or	a,(OFST+1,sp)
5366  0d47 c7525b        	ld	21083,a
5367                     ; 1148 }
5370  0d4a 84            	pop	a
5371  0d4b 81            	ret
5408                     ; 1157 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5408                     ; 1158 {
5409                     	switch	.text
5410  0d4c               _TIM1_ARRPreloadConfig:
5412  0d4c 88            	push	a
5413       00000000      OFST:	set	0
5416                     ; 1160     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5418  0d4d 4d            	tnz	a
5419  0d4e 2704          	jreq	L637
5420  0d50 a101          	cp	a,#1
5421  0d52 2603          	jrne	L437
5422  0d54               L637:
5423  0d54 4f            	clr	a
5424  0d55 2010          	jra	L047
5425  0d57               L437:
5426  0d57 ae0488        	ldw	x,#1160
5427  0d5a 89            	pushw	x
5428  0d5b ae0000        	ldw	x,#0
5429  0d5e 89            	pushw	x
5430  0d5f ae0000        	ldw	x,#L101
5431  0d62 cd0000        	call	_assert_failed
5433  0d65 5b04          	addw	sp,#4
5434  0d67               L047:
5435                     ; 1163     if (NewState != DISABLE)
5437  0d67 0d01          	tnz	(OFST+1,sp)
5438  0d69 2706          	jreq	L7502
5439                     ; 1165         TIM1->CR1 |= TIM1_CR1_ARPE;
5441  0d6b 721e5250      	bset	21072,#7
5443  0d6f 2004          	jra	L1602
5444  0d71               L7502:
5445                     ; 1169         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5447  0d71 721f5250      	bres	21072,#7
5448  0d75               L1602:
5449                     ; 1171 }
5452  0d75 84            	pop	a
5453  0d76 81            	ret
5489                     ; 1180 void TIM1_SelectCOM(FunctionalState NewState)
5489                     ; 1181 {
5490                     	switch	.text
5491  0d77               _TIM1_SelectCOM:
5493  0d77 88            	push	a
5494       00000000      OFST:	set	0
5497                     ; 1183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5499  0d78 4d            	tnz	a
5500  0d79 2704          	jreq	L647
5501  0d7b a101          	cp	a,#1
5502  0d7d 2603          	jrne	L447
5503  0d7f               L647:
5504  0d7f 4f            	clr	a
5505  0d80 2010          	jra	L057
5506  0d82               L447:
5507  0d82 ae049f        	ldw	x,#1183
5508  0d85 89            	pushw	x
5509  0d86 ae0000        	ldw	x,#0
5510  0d89 89            	pushw	x
5511  0d8a ae0000        	ldw	x,#L101
5512  0d8d cd0000        	call	_assert_failed
5514  0d90 5b04          	addw	sp,#4
5515  0d92               L057:
5516                     ; 1186     if (NewState != DISABLE)
5518  0d92 0d01          	tnz	(OFST+1,sp)
5519  0d94 2706          	jreq	L1012
5520                     ; 1188         TIM1->CR2 |= TIM1_CR2_COMS;
5522  0d96 72145251      	bset	21073,#2
5524  0d9a 2004          	jra	L3012
5525  0d9c               L1012:
5526                     ; 1192         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5528  0d9c 72155251      	bres	21073,#2
5529  0da0               L3012:
5530                     ; 1194 }
5533  0da0 84            	pop	a
5534  0da1 81            	ret
5571                     ; 1202 void TIM1_CCPreloadControl(FunctionalState NewState)
5571                     ; 1203 {
5572                     	switch	.text
5573  0da2               _TIM1_CCPreloadControl:
5575  0da2 88            	push	a
5576       00000000      OFST:	set	0
5579                     ; 1205     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5581  0da3 4d            	tnz	a
5582  0da4 2704          	jreq	L657
5583  0da6 a101          	cp	a,#1
5584  0da8 2603          	jrne	L457
5585  0daa               L657:
5586  0daa 4f            	clr	a
5587  0dab 2010          	jra	L067
5588  0dad               L457:
5589  0dad ae04b5        	ldw	x,#1205
5590  0db0 89            	pushw	x
5591  0db1 ae0000        	ldw	x,#0
5592  0db4 89            	pushw	x
5593  0db5 ae0000        	ldw	x,#L101
5594  0db8 cd0000        	call	_assert_failed
5596  0dbb 5b04          	addw	sp,#4
5597  0dbd               L067:
5598                     ; 1208     if (NewState != DISABLE)
5600  0dbd 0d01          	tnz	(OFST+1,sp)
5601  0dbf 2706          	jreq	L3212
5602                     ; 1210         TIM1->CR2 |= TIM1_CR2_CCPC;
5604  0dc1 72105251      	bset	21073,#0
5606  0dc5 2004          	jra	L5212
5607  0dc7               L3212:
5608                     ; 1214         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5610  0dc7 72115251      	bres	21073,#0
5611  0dcb               L5212:
5612                     ; 1216 }
5615  0dcb 84            	pop	a
5616  0dcc 81            	ret
5653                     ; 1225 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5653                     ; 1226 {
5654                     	switch	.text
5655  0dcd               _TIM1_OC1PreloadConfig:
5657  0dcd 88            	push	a
5658       00000000      OFST:	set	0
5661                     ; 1228     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5663  0dce 4d            	tnz	a
5664  0dcf 2704          	jreq	L667
5665  0dd1 a101          	cp	a,#1
5666  0dd3 2603          	jrne	L467
5667  0dd5               L667:
5668  0dd5 4f            	clr	a
5669  0dd6 2010          	jra	L077
5670  0dd8               L467:
5671  0dd8 ae04cc        	ldw	x,#1228
5672  0ddb 89            	pushw	x
5673  0ddc ae0000        	ldw	x,#0
5674  0ddf 89            	pushw	x
5675  0de0 ae0000        	ldw	x,#L101
5676  0de3 cd0000        	call	_assert_failed
5678  0de6 5b04          	addw	sp,#4
5679  0de8               L077:
5680                     ; 1231     if (NewState != DISABLE)
5682  0de8 0d01          	tnz	(OFST+1,sp)
5683  0dea 2706          	jreq	L5412
5684                     ; 1233         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5686  0dec 72165258      	bset	21080,#3
5688  0df0 2004          	jra	L7412
5689  0df2               L5412:
5690                     ; 1237         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5692  0df2 72175258      	bres	21080,#3
5693  0df6               L7412:
5694                     ; 1239 }
5697  0df6 84            	pop	a
5698  0df7 81            	ret
5735                     ; 1248 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5735                     ; 1249 {
5736                     	switch	.text
5737  0df8               _TIM1_OC2PreloadConfig:
5739  0df8 88            	push	a
5740       00000000      OFST:	set	0
5743                     ; 1251     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5745  0df9 4d            	tnz	a
5746  0dfa 2704          	jreq	L677
5747  0dfc a101          	cp	a,#1
5748  0dfe 2603          	jrne	L477
5749  0e00               L677:
5750  0e00 4f            	clr	a
5751  0e01 2010          	jra	L0001
5752  0e03               L477:
5753  0e03 ae04e3        	ldw	x,#1251
5754  0e06 89            	pushw	x
5755  0e07 ae0000        	ldw	x,#0
5756  0e0a 89            	pushw	x
5757  0e0b ae0000        	ldw	x,#L101
5758  0e0e cd0000        	call	_assert_failed
5760  0e11 5b04          	addw	sp,#4
5761  0e13               L0001:
5762                     ; 1254     if (NewState != DISABLE)
5764  0e13 0d01          	tnz	(OFST+1,sp)
5765  0e15 2706          	jreq	L7612
5766                     ; 1256         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5768  0e17 72165259      	bset	21081,#3
5770  0e1b 2004          	jra	L1712
5771  0e1d               L7612:
5772                     ; 1260         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5774  0e1d 72175259      	bres	21081,#3
5775  0e21               L1712:
5776                     ; 1262 }
5779  0e21 84            	pop	a
5780  0e22 81            	ret
5817                     ; 1271 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5817                     ; 1272 {
5818                     	switch	.text
5819  0e23               _TIM1_OC3PreloadConfig:
5821  0e23 88            	push	a
5822       00000000      OFST:	set	0
5825                     ; 1274     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5827  0e24 4d            	tnz	a
5828  0e25 2704          	jreq	L6001
5829  0e27 a101          	cp	a,#1
5830  0e29 2603          	jrne	L4001
5831  0e2b               L6001:
5832  0e2b 4f            	clr	a
5833  0e2c 2010          	jra	L0101
5834  0e2e               L4001:
5835  0e2e ae04fa        	ldw	x,#1274
5836  0e31 89            	pushw	x
5837  0e32 ae0000        	ldw	x,#0
5838  0e35 89            	pushw	x
5839  0e36 ae0000        	ldw	x,#L101
5840  0e39 cd0000        	call	_assert_failed
5842  0e3c 5b04          	addw	sp,#4
5843  0e3e               L0101:
5844                     ; 1277     if (NewState != DISABLE)
5846  0e3e 0d01          	tnz	(OFST+1,sp)
5847  0e40 2706          	jreq	L1122
5848                     ; 1279         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5850  0e42 7216525a      	bset	21082,#3
5852  0e46 2004          	jra	L3122
5853  0e48               L1122:
5854                     ; 1283         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5856  0e48 7217525a      	bres	21082,#3
5857  0e4c               L3122:
5858                     ; 1285 }
5861  0e4c 84            	pop	a
5862  0e4d 81            	ret
5899                     ; 1295 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5899                     ; 1296 {
5900                     	switch	.text
5901  0e4e               _TIM1_OC4PreloadConfig:
5903  0e4e 88            	push	a
5904       00000000      OFST:	set	0
5907                     ; 1298     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5909  0e4f 4d            	tnz	a
5910  0e50 2704          	jreq	L6101
5911  0e52 a101          	cp	a,#1
5912  0e54 2603          	jrne	L4101
5913  0e56               L6101:
5914  0e56 4f            	clr	a
5915  0e57 2010          	jra	L0201
5916  0e59               L4101:
5917  0e59 ae0512        	ldw	x,#1298
5918  0e5c 89            	pushw	x
5919  0e5d ae0000        	ldw	x,#0
5920  0e60 89            	pushw	x
5921  0e61 ae0000        	ldw	x,#L101
5922  0e64 cd0000        	call	_assert_failed
5924  0e67 5b04          	addw	sp,#4
5925  0e69               L0201:
5926                     ; 1301     if (NewState != DISABLE)
5928  0e69 0d01          	tnz	(OFST+1,sp)
5929  0e6b 2706          	jreq	L3322
5930                     ; 1303         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5932  0e6d 7216525b      	bset	21083,#3
5934  0e71 2004          	jra	L5322
5935  0e73               L3322:
5936                     ; 1307         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5938  0e73 7217525b      	bres	21083,#3
5939  0e77               L5322:
5940                     ; 1309 }
5943  0e77 84            	pop	a
5944  0e78 81            	ret
5980                     ; 1317 void TIM1_OC1FastConfig(FunctionalState NewState)
5980                     ; 1318 {
5981                     	switch	.text
5982  0e79               _TIM1_OC1FastConfig:
5984  0e79 88            	push	a
5985       00000000      OFST:	set	0
5988                     ; 1320     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5990  0e7a 4d            	tnz	a
5991  0e7b 2704          	jreq	L6201
5992  0e7d a101          	cp	a,#1
5993  0e7f 2603          	jrne	L4201
5994  0e81               L6201:
5995  0e81 4f            	clr	a
5996  0e82 2010          	jra	L0301
5997  0e84               L4201:
5998  0e84 ae0528        	ldw	x,#1320
5999  0e87 89            	pushw	x
6000  0e88 ae0000        	ldw	x,#0
6001  0e8b 89            	pushw	x
6002  0e8c ae0000        	ldw	x,#L101
6003  0e8f cd0000        	call	_assert_failed
6005  0e92 5b04          	addw	sp,#4
6006  0e94               L0301:
6007                     ; 1323     if (NewState != DISABLE)
6009  0e94 0d01          	tnz	(OFST+1,sp)
6010  0e96 2706          	jreq	L5522
6011                     ; 1325         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
6013  0e98 72145258      	bset	21080,#2
6015  0e9c 2004          	jra	L7522
6016  0e9e               L5522:
6017                     ; 1329         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6019  0e9e 72155258      	bres	21080,#2
6020  0ea2               L7522:
6021                     ; 1331 }
6024  0ea2 84            	pop	a
6025  0ea3 81            	ret
6061                     ; 1341 void TIM1_OC2FastConfig(FunctionalState NewState)
6061                     ; 1342 {
6062                     	switch	.text
6063  0ea4               _TIM1_OC2FastConfig:
6065  0ea4 88            	push	a
6066       00000000      OFST:	set	0
6069                     ; 1344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6071  0ea5 4d            	tnz	a
6072  0ea6 2704          	jreq	L6301
6073  0ea8 a101          	cp	a,#1
6074  0eaa 2603          	jrne	L4301
6075  0eac               L6301:
6076  0eac 4f            	clr	a
6077  0ead 2010          	jra	L0401
6078  0eaf               L4301:
6079  0eaf ae0540        	ldw	x,#1344
6080  0eb2 89            	pushw	x
6081  0eb3 ae0000        	ldw	x,#0
6082  0eb6 89            	pushw	x
6083  0eb7 ae0000        	ldw	x,#L101
6084  0eba cd0000        	call	_assert_failed
6086  0ebd 5b04          	addw	sp,#4
6087  0ebf               L0401:
6088                     ; 1347     if (NewState != DISABLE)
6090  0ebf 0d01          	tnz	(OFST+1,sp)
6091  0ec1 2706          	jreq	L7722
6092                     ; 1349         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6094  0ec3 72145259      	bset	21081,#2
6096  0ec7 2004          	jra	L1032
6097  0ec9               L7722:
6098                     ; 1353         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6100  0ec9 72155259      	bres	21081,#2
6101  0ecd               L1032:
6102                     ; 1355 }
6105  0ecd 84            	pop	a
6106  0ece 81            	ret
6142                     ; 1364 void TIM1_OC3FastConfig(FunctionalState NewState)
6142                     ; 1365 {
6143                     	switch	.text
6144  0ecf               _TIM1_OC3FastConfig:
6146  0ecf 88            	push	a
6147       00000000      OFST:	set	0
6150                     ; 1367     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6152  0ed0 4d            	tnz	a
6153  0ed1 2704          	jreq	L6401
6154  0ed3 a101          	cp	a,#1
6155  0ed5 2603          	jrne	L4401
6156  0ed7               L6401:
6157  0ed7 4f            	clr	a
6158  0ed8 2010          	jra	L0501
6159  0eda               L4401:
6160  0eda ae0557        	ldw	x,#1367
6161  0edd 89            	pushw	x
6162  0ede ae0000        	ldw	x,#0
6163  0ee1 89            	pushw	x
6164  0ee2 ae0000        	ldw	x,#L101
6165  0ee5 cd0000        	call	_assert_failed
6167  0ee8 5b04          	addw	sp,#4
6168  0eea               L0501:
6169                     ; 1370     if (NewState != DISABLE)
6171  0eea 0d01          	tnz	(OFST+1,sp)
6172  0eec 2706          	jreq	L1232
6173                     ; 1372         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6175  0eee 7214525a      	bset	21082,#2
6177  0ef2 2004          	jra	L3232
6178  0ef4               L1232:
6179                     ; 1376         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6181  0ef4 7215525a      	bres	21082,#2
6182  0ef8               L3232:
6183                     ; 1378 }
6186  0ef8 84            	pop	a
6187  0ef9 81            	ret
6223                     ; 1387 void TIM1_OC4FastConfig(FunctionalState NewState)
6223                     ; 1388 {
6224                     	switch	.text
6225  0efa               _TIM1_OC4FastConfig:
6227  0efa 88            	push	a
6228       00000000      OFST:	set	0
6231                     ; 1390     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6233  0efb 4d            	tnz	a
6234  0efc 2704          	jreq	L6501
6235  0efe a101          	cp	a,#1
6236  0f00 2603          	jrne	L4501
6237  0f02               L6501:
6238  0f02 4f            	clr	a
6239  0f03 2010          	jra	L0601
6240  0f05               L4501:
6241  0f05 ae056e        	ldw	x,#1390
6242  0f08 89            	pushw	x
6243  0f09 ae0000        	ldw	x,#0
6244  0f0c 89            	pushw	x
6245  0f0d ae0000        	ldw	x,#L101
6246  0f10 cd0000        	call	_assert_failed
6248  0f13 5b04          	addw	sp,#4
6249  0f15               L0601:
6250                     ; 1393     if (NewState != DISABLE)
6252  0f15 0d01          	tnz	(OFST+1,sp)
6253  0f17 2706          	jreq	L3432
6254                     ; 1395         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6256  0f19 7214525b      	bset	21083,#2
6258  0f1d 2004          	jra	L5432
6259  0f1f               L3432:
6260                     ; 1399         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6262  0f1f 7215525b      	bres	21083,#2
6263  0f23               L5432:
6264                     ; 1401 }
6267  0f23 84            	pop	a
6268  0f24 81            	ret
6374                     ; 1418 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6374                     ; 1419 {
6375                     	switch	.text
6376  0f25               _TIM1_GenerateEvent:
6378  0f25 88            	push	a
6379       00000000      OFST:	set	0
6382                     ; 1421     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6384  0f26 4d            	tnz	a
6385  0f27 2703          	jreq	L4601
6386  0f29 4f            	clr	a
6387  0f2a 2010          	jra	L6601
6388  0f2c               L4601:
6389  0f2c ae058d        	ldw	x,#1421
6390  0f2f 89            	pushw	x
6391  0f30 ae0000        	ldw	x,#0
6392  0f33 89            	pushw	x
6393  0f34 ae0000        	ldw	x,#L101
6394  0f37 cd0000        	call	_assert_failed
6396  0f3a 5b04          	addw	sp,#4
6397  0f3c               L6601:
6398                     ; 1424     TIM1->EGR = (uint8_t)TIM1_EventSource;
6400  0f3c 7b01          	ld	a,(OFST+1,sp)
6401  0f3e c75257        	ld	21079,a
6402                     ; 1425 }
6405  0f41 84            	pop	a
6406  0f42 81            	ret
6443                     ; 1436 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6443                     ; 1437 {
6444                     	switch	.text
6445  0f43               _TIM1_OC1PolarityConfig:
6447  0f43 88            	push	a
6448       00000000      OFST:	set	0
6451                     ; 1439     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6453  0f44 4d            	tnz	a
6454  0f45 2704          	jreq	L4701
6455  0f47 a122          	cp	a,#34
6456  0f49 2603          	jrne	L2701
6457  0f4b               L4701:
6458  0f4b 4f            	clr	a
6459  0f4c 2010          	jra	L6701
6460  0f4e               L2701:
6461  0f4e ae059f        	ldw	x,#1439
6462  0f51 89            	pushw	x
6463  0f52 ae0000        	ldw	x,#0
6464  0f55 89            	pushw	x
6465  0f56 ae0000        	ldw	x,#L101
6466  0f59 cd0000        	call	_assert_failed
6468  0f5c 5b04          	addw	sp,#4
6469  0f5e               L6701:
6470                     ; 1442     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6472  0f5e 0d01          	tnz	(OFST+1,sp)
6473  0f60 2706          	jreq	L7242
6474                     ; 1444         TIM1->CCER1 |= TIM1_CCER1_CC1P;
6476  0f62 7212525c      	bset	21084,#1
6478  0f66 2004          	jra	L1342
6479  0f68               L7242:
6480                     ; 1448         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6482  0f68 7213525c      	bres	21084,#1
6483  0f6c               L1342:
6484                     ; 1450 }
6487  0f6c 84            	pop	a
6488  0f6d 81            	ret
6525                     ; 1461 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6525                     ; 1462 {
6526                     	switch	.text
6527  0f6e               _TIM1_OC1NPolarityConfig:
6529  0f6e 88            	push	a
6530       00000000      OFST:	set	0
6533                     ; 1464     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6535  0f6f 4d            	tnz	a
6536  0f70 2704          	jreq	L4011
6537  0f72 a188          	cp	a,#136
6538  0f74 2603          	jrne	L2011
6539  0f76               L4011:
6540  0f76 4f            	clr	a
6541  0f77 2010          	jra	L6011
6542  0f79               L2011:
6543  0f79 ae05b8        	ldw	x,#1464
6544  0f7c 89            	pushw	x
6545  0f7d ae0000        	ldw	x,#0
6546  0f80 89            	pushw	x
6547  0f81 ae0000        	ldw	x,#L101
6548  0f84 cd0000        	call	_assert_failed
6550  0f87 5b04          	addw	sp,#4
6551  0f89               L6011:
6552                     ; 1467     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6554  0f89 0d01          	tnz	(OFST+1,sp)
6555  0f8b 2706          	jreq	L1542
6556                     ; 1469         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6558  0f8d 7216525c      	bset	21084,#3
6560  0f91 2004          	jra	L3542
6561  0f93               L1542:
6562                     ; 1473         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6564  0f93 7217525c      	bres	21084,#3
6565  0f97               L3542:
6566                     ; 1475 }
6569  0f97 84            	pop	a
6570  0f98 81            	ret
6607                     ; 1486 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6607                     ; 1487 {
6608                     	switch	.text
6609  0f99               _TIM1_OC2PolarityConfig:
6611  0f99 88            	push	a
6612       00000000      OFST:	set	0
6615                     ; 1489     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6617  0f9a 4d            	tnz	a
6618  0f9b 2704          	jreq	L4111
6619  0f9d a122          	cp	a,#34
6620  0f9f 2603          	jrne	L2111
6621  0fa1               L4111:
6622  0fa1 4f            	clr	a
6623  0fa2 2010          	jra	L6111
6624  0fa4               L2111:
6625  0fa4 ae05d1        	ldw	x,#1489
6626  0fa7 89            	pushw	x
6627  0fa8 ae0000        	ldw	x,#0
6628  0fab 89            	pushw	x
6629  0fac ae0000        	ldw	x,#L101
6630  0faf cd0000        	call	_assert_failed
6632  0fb2 5b04          	addw	sp,#4
6633  0fb4               L6111:
6634                     ; 1492     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6636  0fb4 0d01          	tnz	(OFST+1,sp)
6637  0fb6 2706          	jreq	L3742
6638                     ; 1494         TIM1->CCER1 |= TIM1_CCER1_CC2P;
6640  0fb8 721a525c      	bset	21084,#5
6642  0fbc 2004          	jra	L5742
6643  0fbe               L3742:
6644                     ; 1498         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6646  0fbe 721b525c      	bres	21084,#5
6647  0fc2               L5742:
6648                     ; 1500 }
6651  0fc2 84            	pop	a
6652  0fc3 81            	ret
6689                     ; 1510 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6689                     ; 1511 {
6690                     	switch	.text
6691  0fc4               _TIM1_OC2NPolarityConfig:
6693  0fc4 88            	push	a
6694       00000000      OFST:	set	0
6697                     ; 1513     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6699  0fc5 4d            	tnz	a
6700  0fc6 2704          	jreq	L4211
6701  0fc8 a188          	cp	a,#136
6702  0fca 2603          	jrne	L2211
6703  0fcc               L4211:
6704  0fcc 4f            	clr	a
6705  0fcd 2010          	jra	L6211
6706  0fcf               L2211:
6707  0fcf ae05e9        	ldw	x,#1513
6708  0fd2 89            	pushw	x
6709  0fd3 ae0000        	ldw	x,#0
6710  0fd6 89            	pushw	x
6711  0fd7 ae0000        	ldw	x,#L101
6712  0fda cd0000        	call	_assert_failed
6714  0fdd 5b04          	addw	sp,#4
6715  0fdf               L6211:
6716                     ; 1516     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6718  0fdf 0d01          	tnz	(OFST+1,sp)
6719  0fe1 2706          	jreq	L5152
6720                     ; 1518         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6722  0fe3 721e525c      	bset	21084,#7
6724  0fe7 2004          	jra	L7152
6725  0fe9               L5152:
6726                     ; 1522         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6728  0fe9 721f525c      	bres	21084,#7
6729  0fed               L7152:
6730                     ; 1524 }
6733  0fed 84            	pop	a
6734  0fee 81            	ret
6771                     ; 1535 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6771                     ; 1536 {
6772                     	switch	.text
6773  0fef               _TIM1_OC3PolarityConfig:
6775  0fef 88            	push	a
6776       00000000      OFST:	set	0
6779                     ; 1538     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6781  0ff0 4d            	tnz	a
6782  0ff1 2704          	jreq	L4311
6783  0ff3 a122          	cp	a,#34
6784  0ff5 2603          	jrne	L2311
6785  0ff7               L4311:
6786  0ff7 4f            	clr	a
6787  0ff8 2010          	jra	L6311
6788  0ffa               L2311:
6789  0ffa ae0602        	ldw	x,#1538
6790  0ffd 89            	pushw	x
6791  0ffe ae0000        	ldw	x,#0
6792  1001 89            	pushw	x
6793  1002 ae0000        	ldw	x,#L101
6794  1005 cd0000        	call	_assert_failed
6796  1008 5b04          	addw	sp,#4
6797  100a               L6311:
6798                     ; 1541     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6800  100a 0d01          	tnz	(OFST+1,sp)
6801  100c 2706          	jreq	L7352
6802                     ; 1543         TIM1->CCER2 |= TIM1_CCER2_CC3P;
6804  100e 7212525d      	bset	21085,#1
6806  1012 2004          	jra	L1452
6807  1014               L7352:
6808                     ; 1547         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6810  1014 7213525d      	bres	21085,#1
6811  1018               L1452:
6812                     ; 1549 }
6815  1018 84            	pop	a
6816  1019 81            	ret
6853                     ; 1560 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6853                     ; 1561 {
6854                     	switch	.text
6855  101a               _TIM1_OC3NPolarityConfig:
6857  101a 88            	push	a
6858       00000000      OFST:	set	0
6861                     ; 1563     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6863  101b 4d            	tnz	a
6864  101c 2704          	jreq	L4411
6865  101e a188          	cp	a,#136
6866  1020 2603          	jrne	L2411
6867  1022               L4411:
6868  1022 4f            	clr	a
6869  1023 2010          	jra	L6411
6870  1025               L2411:
6871  1025 ae061b        	ldw	x,#1563
6872  1028 89            	pushw	x
6873  1029 ae0000        	ldw	x,#0
6874  102c 89            	pushw	x
6875  102d ae0000        	ldw	x,#L101
6876  1030 cd0000        	call	_assert_failed
6878  1033 5b04          	addw	sp,#4
6879  1035               L6411:
6880                     ; 1566     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6882  1035 0d01          	tnz	(OFST+1,sp)
6883  1037 2706          	jreq	L1652
6884                     ; 1568         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6886  1039 7216525d      	bset	21085,#3
6888  103d 2004          	jra	L3652
6889  103f               L1652:
6890                     ; 1572         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6892  103f 7217525d      	bres	21085,#3
6893  1043               L3652:
6894                     ; 1574 }
6897  1043 84            	pop	a
6898  1044 81            	ret
6935                     ; 1584 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6935                     ; 1585 {
6936                     	switch	.text
6937  1045               _TIM1_OC4PolarityConfig:
6939  1045 88            	push	a
6940       00000000      OFST:	set	0
6943                     ; 1587     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6945  1046 4d            	tnz	a
6946  1047 2704          	jreq	L4511
6947  1049 a122          	cp	a,#34
6948  104b 2603          	jrne	L2511
6949  104d               L4511:
6950  104d 4f            	clr	a
6951  104e 2010          	jra	L6511
6952  1050               L2511:
6953  1050 ae0633        	ldw	x,#1587
6954  1053 89            	pushw	x
6955  1054 ae0000        	ldw	x,#0
6956  1057 89            	pushw	x
6957  1058 ae0000        	ldw	x,#L101
6958  105b cd0000        	call	_assert_failed
6960  105e 5b04          	addw	sp,#4
6961  1060               L6511:
6962                     ; 1590     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6964  1060 0d01          	tnz	(OFST+1,sp)
6965  1062 2706          	jreq	L3062
6966                     ; 1592         TIM1->CCER2 |= TIM1_CCER2_CC4P;
6968  1064 721a525d      	bset	21085,#5
6970  1068 2004          	jra	L5062
6971  106a               L3062:
6972                     ; 1596         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6974  106a 721b525d      	bres	21085,#5
6975  106e               L5062:
6976                     ; 1598 }
6979  106e 84            	pop	a
6980  106f 81            	ret
7026                     ; 1613 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7026                     ; 1614 {
7027                     	switch	.text
7028  1070               _TIM1_CCxCmd:
7030  1070 89            	pushw	x
7031       00000000      OFST:	set	0
7034                     ; 1616     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7036  1071 9e            	ld	a,xh
7037  1072 4d            	tnz	a
7038  1073 270f          	jreq	L4611
7039  1075 9e            	ld	a,xh
7040  1076 a101          	cp	a,#1
7041  1078 270a          	jreq	L4611
7042  107a 9e            	ld	a,xh
7043  107b a102          	cp	a,#2
7044  107d 2705          	jreq	L4611
7045  107f 9e            	ld	a,xh
7046  1080 a103          	cp	a,#3
7047  1082 2603          	jrne	L2611
7048  1084               L4611:
7049  1084 4f            	clr	a
7050  1085 2010          	jra	L6611
7051  1087               L2611:
7052  1087 ae0650        	ldw	x,#1616
7053  108a 89            	pushw	x
7054  108b ae0000        	ldw	x,#0
7055  108e 89            	pushw	x
7056  108f ae0000        	ldw	x,#L101
7057  1092 cd0000        	call	_assert_failed
7059  1095 5b04          	addw	sp,#4
7060  1097               L6611:
7061                     ; 1617     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7063  1097 0d02          	tnz	(OFST+2,sp)
7064  1099 2706          	jreq	L2711
7065  109b 7b02          	ld	a,(OFST+2,sp)
7066  109d a101          	cp	a,#1
7067  109f 2603          	jrne	L0711
7068  10a1               L2711:
7069  10a1 4f            	clr	a
7070  10a2 2010          	jra	L4711
7071  10a4               L0711:
7072  10a4 ae0651        	ldw	x,#1617
7073  10a7 89            	pushw	x
7074  10a8 ae0000        	ldw	x,#0
7075  10ab 89            	pushw	x
7076  10ac ae0000        	ldw	x,#L101
7077  10af cd0000        	call	_assert_failed
7079  10b2 5b04          	addw	sp,#4
7080  10b4               L4711:
7081                     ; 1619     if (TIM1_Channel == TIM1_CHANNEL_1)
7083  10b4 0d01          	tnz	(OFST+1,sp)
7084  10b6 2610          	jrne	L1362
7085                     ; 1622         if (NewState != DISABLE)
7087  10b8 0d02          	tnz	(OFST+2,sp)
7088  10ba 2706          	jreq	L3362
7089                     ; 1624             TIM1->CCER1 |= TIM1_CCER1_CC1E;
7091  10bc 7210525c      	bset	21084,#0
7093  10c0 2040          	jra	L7362
7094  10c2               L3362:
7095                     ; 1628             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7097  10c2 7211525c      	bres	21084,#0
7098  10c6 203a          	jra	L7362
7099  10c8               L1362:
7100                     ; 1632     else if (TIM1_Channel == TIM1_CHANNEL_2)
7102  10c8 7b01          	ld	a,(OFST+1,sp)
7103  10ca a101          	cp	a,#1
7104  10cc 2610          	jrne	L1462
7105                     ; 1635         if (NewState != DISABLE)
7107  10ce 0d02          	tnz	(OFST+2,sp)
7108  10d0 2706          	jreq	L3462
7109                     ; 1637             TIM1->CCER1 |= TIM1_CCER1_CC2E;
7111  10d2 7218525c      	bset	21084,#4
7113  10d6 202a          	jra	L7362
7114  10d8               L3462:
7115                     ; 1641             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7117  10d8 7219525c      	bres	21084,#4
7118  10dc 2024          	jra	L7362
7119  10de               L1462:
7120                     ; 1644     else if (TIM1_Channel == TIM1_CHANNEL_3)
7122  10de 7b01          	ld	a,(OFST+1,sp)
7123  10e0 a102          	cp	a,#2
7124  10e2 2610          	jrne	L1562
7125                     ; 1647         if (NewState != DISABLE)
7127  10e4 0d02          	tnz	(OFST+2,sp)
7128  10e6 2706          	jreq	L3562
7129                     ; 1649             TIM1->CCER2 |= TIM1_CCER2_CC3E;
7131  10e8 7210525d      	bset	21085,#0
7133  10ec 2014          	jra	L7362
7134  10ee               L3562:
7135                     ; 1653             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7137  10ee 7211525d      	bres	21085,#0
7138  10f2 200e          	jra	L7362
7139  10f4               L1562:
7140                     ; 1659         if (NewState != DISABLE)
7142  10f4 0d02          	tnz	(OFST+2,sp)
7143  10f6 2706          	jreq	L1662
7144                     ; 1661             TIM1->CCER2 |= TIM1_CCER2_CC4E;
7146  10f8 7218525d      	bset	21085,#4
7148  10fc 2004          	jra	L7362
7149  10fe               L1662:
7150                     ; 1665             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7152  10fe 7219525d      	bres	21085,#4
7153  1102               L7362:
7154                     ; 1668 }
7157  1102 85            	popw	x
7158  1103 81            	ret
7204                     ; 1681 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7204                     ; 1682 {
7205                     	switch	.text
7206  1104               _TIM1_CCxNCmd:
7208  1104 89            	pushw	x
7209       00000000      OFST:	set	0
7212                     ; 1684     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7214  1105 9e            	ld	a,xh
7215  1106 4d            	tnz	a
7216  1107 270a          	jreq	L2021
7217  1109 9e            	ld	a,xh
7218  110a a101          	cp	a,#1
7219  110c 2705          	jreq	L2021
7220  110e 9e            	ld	a,xh
7221  110f a102          	cp	a,#2
7222  1111 2603          	jrne	L0021
7223  1113               L2021:
7224  1113 4f            	clr	a
7225  1114 2010          	jra	L4021
7226  1116               L0021:
7227  1116 ae0694        	ldw	x,#1684
7228  1119 89            	pushw	x
7229  111a ae0000        	ldw	x,#0
7230  111d 89            	pushw	x
7231  111e ae0000        	ldw	x,#L101
7232  1121 cd0000        	call	_assert_failed
7234  1124 5b04          	addw	sp,#4
7235  1126               L4021:
7236                     ; 1685     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7238  1126 0d02          	tnz	(OFST+2,sp)
7239  1128 2706          	jreq	L0121
7240  112a 7b02          	ld	a,(OFST+2,sp)
7241  112c a101          	cp	a,#1
7242  112e 2603          	jrne	L6021
7243  1130               L0121:
7244  1130 4f            	clr	a
7245  1131 2010          	jra	L2121
7246  1133               L6021:
7247  1133 ae0695        	ldw	x,#1685
7248  1136 89            	pushw	x
7249  1137 ae0000        	ldw	x,#0
7250  113a 89            	pushw	x
7251  113b ae0000        	ldw	x,#L101
7252  113e cd0000        	call	_assert_failed
7254  1141 5b04          	addw	sp,#4
7255  1143               L2121:
7256                     ; 1687     if (TIM1_Channel == TIM1_CHANNEL_1)
7258  1143 0d01          	tnz	(OFST+1,sp)
7259  1145 2610          	jrne	L7072
7260                     ; 1690         if (NewState != DISABLE)
7262  1147 0d02          	tnz	(OFST+2,sp)
7263  1149 2706          	jreq	L1172
7264                     ; 1692             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7266  114b 7214525c      	bset	21084,#2
7268  114f 202a          	jra	L5172
7269  1151               L1172:
7270                     ; 1696             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7272  1151 7215525c      	bres	21084,#2
7273  1155 2024          	jra	L5172
7274  1157               L7072:
7275                     ; 1699     else if (TIM1_Channel == TIM1_CHANNEL_2)
7277  1157 7b01          	ld	a,(OFST+1,sp)
7278  1159 a101          	cp	a,#1
7279  115b 2610          	jrne	L7172
7280                     ; 1702         if (NewState != DISABLE)
7282  115d 0d02          	tnz	(OFST+2,sp)
7283  115f 2706          	jreq	L1272
7284                     ; 1704             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7286  1161 721c525c      	bset	21084,#6
7288  1165 2014          	jra	L5172
7289  1167               L1272:
7290                     ; 1708             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7292  1167 721d525c      	bres	21084,#6
7293  116b 200e          	jra	L5172
7294  116d               L7172:
7295                     ; 1714         if (NewState != DISABLE)
7297  116d 0d02          	tnz	(OFST+2,sp)
7298  116f 2706          	jreq	L7272
7299                     ; 1716             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7301  1171 7214525d      	bset	21085,#2
7303  1175 2004          	jra	L5172
7304  1177               L7272:
7305                     ; 1720             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7307  1177 7215525d      	bres	21085,#2
7308  117b               L5172:
7309                     ; 1723 }
7312  117b 85            	popw	x
7313  117c 81            	ret
7359                     ; 1747 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7359                     ; 1748 {
7360                     	switch	.text
7361  117d               _TIM1_SelectOCxM:
7363  117d 89            	pushw	x
7364       00000000      OFST:	set	0
7367                     ; 1750     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7369  117e 9e            	ld	a,xh
7370  117f 4d            	tnz	a
7371  1180 270f          	jreq	L0221
7372  1182 9e            	ld	a,xh
7373  1183 a101          	cp	a,#1
7374  1185 270a          	jreq	L0221
7375  1187 9e            	ld	a,xh
7376  1188 a102          	cp	a,#2
7377  118a 2705          	jreq	L0221
7378  118c 9e            	ld	a,xh
7379  118d a103          	cp	a,#3
7380  118f 2603          	jrne	L6121
7381  1191               L0221:
7382  1191 4f            	clr	a
7383  1192 2010          	jra	L2221
7384  1194               L6121:
7385  1194 ae06d6        	ldw	x,#1750
7386  1197 89            	pushw	x
7387  1198 ae0000        	ldw	x,#0
7388  119b 89            	pushw	x
7389  119c ae0000        	ldw	x,#L101
7390  119f cd0000        	call	_assert_failed
7392  11a2 5b04          	addw	sp,#4
7393  11a4               L2221:
7394                     ; 1751     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7396  11a4 0d02          	tnz	(OFST+2,sp)
7397  11a6 272a          	jreq	L6221
7398  11a8 7b02          	ld	a,(OFST+2,sp)
7399  11aa a110          	cp	a,#16
7400  11ac 2724          	jreq	L6221
7401  11ae 7b02          	ld	a,(OFST+2,sp)
7402  11b0 a120          	cp	a,#32
7403  11b2 271e          	jreq	L6221
7404  11b4 7b02          	ld	a,(OFST+2,sp)
7405  11b6 a130          	cp	a,#48
7406  11b8 2718          	jreq	L6221
7407  11ba 7b02          	ld	a,(OFST+2,sp)
7408  11bc a160          	cp	a,#96
7409  11be 2712          	jreq	L6221
7410  11c0 7b02          	ld	a,(OFST+2,sp)
7411  11c2 a170          	cp	a,#112
7412  11c4 270c          	jreq	L6221
7413  11c6 7b02          	ld	a,(OFST+2,sp)
7414  11c8 a150          	cp	a,#80
7415  11ca 2706          	jreq	L6221
7416  11cc 7b02          	ld	a,(OFST+2,sp)
7417  11ce a140          	cp	a,#64
7418  11d0 2603          	jrne	L4221
7419  11d2               L6221:
7420  11d2 4f            	clr	a
7421  11d3 2010          	jra	L0321
7422  11d5               L4221:
7423  11d5 ae06d7        	ldw	x,#1751
7424  11d8 89            	pushw	x
7425  11d9 ae0000        	ldw	x,#0
7426  11dc 89            	pushw	x
7427  11dd ae0000        	ldw	x,#L101
7428  11e0 cd0000        	call	_assert_failed
7430  11e3 5b04          	addw	sp,#4
7431  11e5               L0321:
7432                     ; 1753     if (TIM1_Channel == TIM1_CHANNEL_1)
7434  11e5 0d01          	tnz	(OFST+1,sp)
7435  11e7 2610          	jrne	L5572
7436                     ; 1756         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7438  11e9 7211525c      	bres	21084,#0
7439                     ; 1759         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7439                     ; 1760                                 | (uint8_t)TIM1_OCMode);
7441  11ed c65258        	ld	a,21080
7442  11f0 a48f          	and	a,#143
7443  11f2 1a02          	or	a,(OFST+2,sp)
7444  11f4 c75258        	ld	21080,a
7446  11f7 203a          	jra	L7572
7447  11f9               L5572:
7448                     ; 1762     else if (TIM1_Channel == TIM1_CHANNEL_2)
7450  11f9 7b01          	ld	a,(OFST+1,sp)
7451  11fb a101          	cp	a,#1
7452  11fd 2610          	jrne	L1672
7453                     ; 1765         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7455  11ff 7219525c      	bres	21084,#4
7456                     ; 1768         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7456                     ; 1769                                 | (uint8_t)TIM1_OCMode);
7458  1203 c65259        	ld	a,21081
7459  1206 a48f          	and	a,#143
7460  1208 1a02          	or	a,(OFST+2,sp)
7461  120a c75259        	ld	21081,a
7463  120d 2024          	jra	L7572
7464  120f               L1672:
7465                     ; 1771     else if (TIM1_Channel == TIM1_CHANNEL_3)
7467  120f 7b01          	ld	a,(OFST+1,sp)
7468  1211 a102          	cp	a,#2
7469  1213 2610          	jrne	L5672
7470                     ; 1774         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7472  1215 7211525d      	bres	21085,#0
7473                     ; 1777         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7473                     ; 1778                                 | (uint8_t)TIM1_OCMode);
7475  1219 c6525a        	ld	a,21082
7476  121c a48f          	and	a,#143
7477  121e 1a02          	or	a,(OFST+2,sp)
7478  1220 c7525a        	ld	21082,a
7480  1223 200e          	jra	L7572
7481  1225               L5672:
7482                     ; 1783         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7484  1225 7219525d      	bres	21085,#4
7485                     ; 1786         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7485                     ; 1787                                 | (uint8_t)TIM1_OCMode);
7487  1229 c6525b        	ld	a,21083
7488  122c a48f          	and	a,#143
7489  122e 1a02          	or	a,(OFST+2,sp)
7490  1230 c7525b        	ld	21083,a
7491  1233               L7572:
7492                     ; 1789 }
7495  1233 85            	popw	x
7496  1234 81            	ret
7530                     ; 1798 void TIM1_SetCounter(uint16_t Counter)
7530                     ; 1799 {
7531                     	switch	.text
7532  1235               _TIM1_SetCounter:
7536                     ; 1801     TIM1->CNTRH = (uint8_t)(Counter >> 8);
7538  1235 9e            	ld	a,xh
7539  1236 c7525e        	ld	21086,a
7540                     ; 1802     TIM1->CNTRL = (uint8_t)(Counter);
7542  1239 9f            	ld	a,xl
7543  123a c7525f        	ld	21087,a
7544                     ; 1804 }
7547  123d 81            	ret
7581                     ; 1813 void TIM1_SetAutoreload(uint16_t Autoreload)
7581                     ; 1814 {
7582                     	switch	.text
7583  123e               _TIM1_SetAutoreload:
7587                     ; 1817     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7589  123e 9e            	ld	a,xh
7590  123f c75262        	ld	21090,a
7591                     ; 1818     TIM1->ARRL = (uint8_t)(Autoreload);
7593  1242 9f            	ld	a,xl
7594  1243 c75263        	ld	21091,a
7595                     ; 1820 }
7598  1246 81            	ret
7632                     ; 1829 void TIM1_SetCompare1(uint16_t Compare1)
7632                     ; 1830 {
7633                     	switch	.text
7634  1247               _TIM1_SetCompare1:
7638                     ; 1832     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7640  1247 9e            	ld	a,xh
7641  1248 c75265        	ld	21093,a
7642                     ; 1833     TIM1->CCR1L = (uint8_t)(Compare1);
7644  124b 9f            	ld	a,xl
7645  124c c75266        	ld	21094,a
7646                     ; 1835 }
7649  124f 81            	ret
7683                     ; 1844 void TIM1_SetCompare2(uint16_t Compare2)
7683                     ; 1845 {
7684                     	switch	.text
7685  1250               _TIM1_SetCompare2:
7689                     ; 1847     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7691  1250 9e            	ld	a,xh
7692  1251 c75267        	ld	21095,a
7693                     ; 1848     TIM1->CCR2L = (uint8_t)(Compare2);
7695  1254 9f            	ld	a,xl
7696  1255 c75268        	ld	21096,a
7697                     ; 1850 }
7700  1258 81            	ret
7734                     ; 1859 void TIM1_SetCompare3(uint16_t Compare3)
7734                     ; 1860 {
7735                     	switch	.text
7736  1259               _TIM1_SetCompare3:
7740                     ; 1862     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7742  1259 9e            	ld	a,xh
7743  125a c75269        	ld	21097,a
7744                     ; 1863     TIM1->CCR3L = (uint8_t)(Compare3);
7746  125d 9f            	ld	a,xl
7747  125e c7526a        	ld	21098,a
7748                     ; 1865 }
7751  1261 81            	ret
7785                     ; 1874 void TIM1_SetCompare4(uint16_t Compare4)
7785                     ; 1875 {
7786                     	switch	.text
7787  1262               _TIM1_SetCompare4:
7791                     ; 1877     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7793  1262 9e            	ld	a,xh
7794  1263 c7526b        	ld	21099,a
7795                     ; 1878     TIM1->CCR4L = (uint8_t)(Compare4);
7797  1266 9f            	ld	a,xl
7798  1267 c7526c        	ld	21100,a
7799                     ; 1879 }
7802  126a 81            	ret
7839                     ; 1892 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7839                     ; 1893 {
7840                     	switch	.text
7841  126b               _TIM1_SetIC1Prescaler:
7843  126b 88            	push	a
7844       00000000      OFST:	set	0
7847                     ; 1895     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7849  126c 4d            	tnz	a
7850  126d 270c          	jreq	L2521
7851  126f a104          	cp	a,#4
7852  1271 2708          	jreq	L2521
7853  1273 a108          	cp	a,#8
7854  1275 2704          	jreq	L2521
7855  1277 a10c          	cp	a,#12
7856  1279 2603          	jrne	L0521
7857  127b               L2521:
7858  127b 4f            	clr	a
7859  127c 2010          	jra	L4521
7860  127e               L0521:
7861  127e ae0767        	ldw	x,#1895
7862  1281 89            	pushw	x
7863  1282 ae0000        	ldw	x,#0
7864  1285 89            	pushw	x
7865  1286 ae0000        	ldw	x,#L101
7866  1289 cd0000        	call	_assert_failed
7868  128c 5b04          	addw	sp,#4
7869  128e               L4521:
7870                     ; 1898     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7870                     ; 1899                             | (uint8_t)TIM1_IC1Prescaler);
7872  128e c65258        	ld	a,21080
7873  1291 a4f3          	and	a,#243
7874  1293 1a01          	or	a,(OFST+1,sp)
7875  1295 c75258        	ld	21080,a
7876                     ; 1901 }
7879  1298 84            	pop	a
7880  1299 81            	ret
7917                     ; 1913 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7917                     ; 1914 {
7918                     	switch	.text
7919  129a               _TIM1_SetIC2Prescaler:
7921  129a 88            	push	a
7922       00000000      OFST:	set	0
7925                     ; 1917     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7927  129b 4d            	tnz	a
7928  129c 270c          	jreq	L2621
7929  129e a104          	cp	a,#4
7930  12a0 2708          	jreq	L2621
7931  12a2 a108          	cp	a,#8
7932  12a4 2704          	jreq	L2621
7933  12a6 a10c          	cp	a,#12
7934  12a8 2603          	jrne	L0621
7935  12aa               L2621:
7936  12aa 4f            	clr	a
7937  12ab 2010          	jra	L4621
7938  12ad               L0621:
7939  12ad ae077d        	ldw	x,#1917
7940  12b0 89            	pushw	x
7941  12b1 ae0000        	ldw	x,#0
7942  12b4 89            	pushw	x
7943  12b5 ae0000        	ldw	x,#L101
7944  12b8 cd0000        	call	_assert_failed
7946  12bb 5b04          	addw	sp,#4
7947  12bd               L4621:
7948                     ; 1920     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7948                     ; 1921                             | (uint8_t)TIM1_IC2Prescaler);
7950  12bd c65259        	ld	a,21081
7951  12c0 a4f3          	and	a,#243
7952  12c2 1a01          	or	a,(OFST+1,sp)
7953  12c4 c75259        	ld	21081,a
7954                     ; 1922 }
7957  12c7 84            	pop	a
7958  12c8 81            	ret
7995                     ; 1935 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
7995                     ; 1936 {
7996                     	switch	.text
7997  12c9               _TIM1_SetIC3Prescaler:
7999  12c9 88            	push	a
8000       00000000      OFST:	set	0
8003                     ; 1939     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
8005  12ca 4d            	tnz	a
8006  12cb 270c          	jreq	L2721
8007  12cd a104          	cp	a,#4
8008  12cf 2708          	jreq	L2721
8009  12d1 a108          	cp	a,#8
8010  12d3 2704          	jreq	L2721
8011  12d5 a10c          	cp	a,#12
8012  12d7 2603          	jrne	L0721
8013  12d9               L2721:
8014  12d9 4f            	clr	a
8015  12da 2010          	jra	L4721
8016  12dc               L0721:
8017  12dc ae0793        	ldw	x,#1939
8018  12df 89            	pushw	x
8019  12e0 ae0000        	ldw	x,#0
8020  12e3 89            	pushw	x
8021  12e4 ae0000        	ldw	x,#L101
8022  12e7 cd0000        	call	_assert_failed
8024  12ea 5b04          	addw	sp,#4
8025  12ec               L4721:
8026                     ; 1942     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
8026                     ; 1943                             (uint8_t)TIM1_IC3Prescaler);
8028  12ec c6525a        	ld	a,21082
8029  12ef a4f3          	and	a,#243
8030  12f1 1a01          	or	a,(OFST+1,sp)
8031  12f3 c7525a        	ld	21082,a
8032                     ; 1944 }
8035  12f6 84            	pop	a
8036  12f7 81            	ret
8073                     ; 1956 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8073                     ; 1957 {
8074                     	switch	.text
8075  12f8               _TIM1_SetIC4Prescaler:
8077  12f8 88            	push	a
8078       00000000      OFST:	set	0
8081                     ; 1960     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8083  12f9 4d            	tnz	a
8084  12fa 270c          	jreq	L2031
8085  12fc a104          	cp	a,#4
8086  12fe 2708          	jreq	L2031
8087  1300 a108          	cp	a,#8
8088  1302 2704          	jreq	L2031
8089  1304 a10c          	cp	a,#12
8090  1306 2603          	jrne	L0031
8091  1308               L2031:
8092  1308 4f            	clr	a
8093  1309 2010          	jra	L4031
8094  130b               L0031:
8095  130b ae07a8        	ldw	x,#1960
8096  130e 89            	pushw	x
8097  130f ae0000        	ldw	x,#0
8098  1312 89            	pushw	x
8099  1313 ae0000        	ldw	x,#L101
8100  1316 cd0000        	call	_assert_failed
8102  1319 5b04          	addw	sp,#4
8103  131b               L4031:
8104                     ; 1963     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8104                     ; 1964                             (uint8_t)TIM1_IC4Prescaler);
8106  131b c6525b        	ld	a,21083
8107  131e a4f3          	and	a,#243
8108  1320 1a01          	or	a,(OFST+1,sp)
8109  1322 c7525b        	ld	21083,a
8110                     ; 1965 }
8113  1325 84            	pop	a
8114  1326 81            	ret
8166                     ; 1972 uint16_t TIM1_GetCapture1(void)
8166                     ; 1973 {
8167                     	switch	.text
8168  1327               _TIM1_GetCapture1:
8170  1327 5204          	subw	sp,#4
8171       00000004      OFST:	set	4
8174                     ; 1976     uint16_t tmpccr1 = 0;
8176                     ; 1977     uint8_t tmpccr1l=0, tmpccr1h=0;
8180                     ; 1979     tmpccr1h = TIM1->CCR1H;
8182  1329 c65265        	ld	a,21093
8183  132c 6b02          	ld	(OFST-2,sp),a
8184                     ; 1980     tmpccr1l = TIM1->CCR1L;
8186  132e c65266        	ld	a,21094
8187  1331 6b01          	ld	(OFST-3,sp),a
8188                     ; 1982     tmpccr1 = (uint16_t)(tmpccr1l);
8190  1333 7b01          	ld	a,(OFST-3,sp)
8191  1335 5f            	clrw	x
8192  1336 97            	ld	xl,a
8193  1337 1f03          	ldw	(OFST-1,sp),x
8194                     ; 1983     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8196  1339 7b02          	ld	a,(OFST-2,sp)
8197  133b 5f            	clrw	x
8198  133c 97            	ld	xl,a
8199  133d 4f            	clr	a
8200  133e 02            	rlwa	x,a
8201  133f 01            	rrwa	x,a
8202  1340 1a04          	or	a,(OFST+0,sp)
8203  1342 01            	rrwa	x,a
8204  1343 1a03          	or	a,(OFST-1,sp)
8205  1345 01            	rrwa	x,a
8206  1346 1f03          	ldw	(OFST-1,sp),x
8207                     ; 1985     return (uint16_t)tmpccr1;
8209  1348 1e03          	ldw	x,(OFST-1,sp)
8212  134a 5b04          	addw	sp,#4
8213  134c 81            	ret
8265                     ; 1993 uint16_t TIM1_GetCapture2(void)
8265                     ; 1994 {
8266                     	switch	.text
8267  134d               _TIM1_GetCapture2:
8269  134d 5204          	subw	sp,#4
8270       00000004      OFST:	set	4
8273                     ; 1997     uint16_t tmpccr2 = 0;
8275                     ; 1998     uint8_t tmpccr2l=0, tmpccr2h=0;
8279                     ; 2000     tmpccr2h = TIM1->CCR2H;
8281  134f c65267        	ld	a,21095
8282  1352 6b02          	ld	(OFST-2,sp),a
8283                     ; 2001     tmpccr2l = TIM1->CCR2L;
8285  1354 c65268        	ld	a,21096
8286  1357 6b01          	ld	(OFST-3,sp),a
8287                     ; 2003     tmpccr2 = (uint16_t)(tmpccr2l);
8289  1359 7b01          	ld	a,(OFST-3,sp)
8290  135b 5f            	clrw	x
8291  135c 97            	ld	xl,a
8292  135d 1f03          	ldw	(OFST-1,sp),x
8293                     ; 2004     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8295  135f 7b02          	ld	a,(OFST-2,sp)
8296  1361 5f            	clrw	x
8297  1362 97            	ld	xl,a
8298  1363 4f            	clr	a
8299  1364 02            	rlwa	x,a
8300  1365 01            	rrwa	x,a
8301  1366 1a04          	or	a,(OFST+0,sp)
8302  1368 01            	rrwa	x,a
8303  1369 1a03          	or	a,(OFST-1,sp)
8304  136b 01            	rrwa	x,a
8305  136c 1f03          	ldw	(OFST-1,sp),x
8306                     ; 2006     return (uint16_t)tmpccr2;
8308  136e 1e03          	ldw	x,(OFST-1,sp)
8311  1370 5b04          	addw	sp,#4
8312  1372 81            	ret
8364                     ; 2014 uint16_t TIM1_GetCapture3(void)
8364                     ; 2015 {
8365                     	switch	.text
8366  1373               _TIM1_GetCapture3:
8368  1373 5204          	subw	sp,#4
8369       00000004      OFST:	set	4
8372                     ; 2017     uint16_t tmpccr3 = 0;
8374                     ; 2018     uint8_t tmpccr3l=0, tmpccr3h=0;
8378                     ; 2020     tmpccr3h = TIM1->CCR3H;
8380  1375 c65269        	ld	a,21097
8381  1378 6b02          	ld	(OFST-2,sp),a
8382                     ; 2021     tmpccr3l = TIM1->CCR3L;
8384  137a c6526a        	ld	a,21098
8385  137d 6b01          	ld	(OFST-3,sp),a
8386                     ; 2023     tmpccr3 = (uint16_t)(tmpccr3l);
8388  137f 7b01          	ld	a,(OFST-3,sp)
8389  1381 5f            	clrw	x
8390  1382 97            	ld	xl,a
8391  1383 1f03          	ldw	(OFST-1,sp),x
8392                     ; 2024     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8394  1385 7b02          	ld	a,(OFST-2,sp)
8395  1387 5f            	clrw	x
8396  1388 97            	ld	xl,a
8397  1389 4f            	clr	a
8398  138a 02            	rlwa	x,a
8399  138b 01            	rrwa	x,a
8400  138c 1a04          	or	a,(OFST+0,sp)
8401  138e 01            	rrwa	x,a
8402  138f 1a03          	or	a,(OFST-1,sp)
8403  1391 01            	rrwa	x,a
8404  1392 1f03          	ldw	(OFST-1,sp),x
8405                     ; 2026     return (uint16_t)tmpccr3;
8407  1394 1e03          	ldw	x,(OFST-1,sp)
8410  1396 5b04          	addw	sp,#4
8411  1398 81            	ret
8463                     ; 2034 uint16_t TIM1_GetCapture4(void)
8463                     ; 2035 {
8464                     	switch	.text
8465  1399               _TIM1_GetCapture4:
8467  1399 5204          	subw	sp,#4
8468       00000004      OFST:	set	4
8471                     ; 2037     uint16_t tmpccr4 = 0;
8473                     ; 2038     uint8_t tmpccr4l=0, tmpccr4h=0;
8477                     ; 2040     tmpccr4h = TIM1->CCR4H;
8479  139b c6526b        	ld	a,21099
8480  139e 6b02          	ld	(OFST-2,sp),a
8481                     ; 2041     tmpccr4l = TIM1->CCR4L;
8483  13a0 c6526c        	ld	a,21100
8484  13a3 6b01          	ld	(OFST-3,sp),a
8485                     ; 2043     tmpccr4 = (uint16_t)(tmpccr4l);
8487  13a5 7b01          	ld	a,(OFST-3,sp)
8488  13a7 5f            	clrw	x
8489  13a8 97            	ld	xl,a
8490  13a9 1f03          	ldw	(OFST-1,sp),x
8491                     ; 2044     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8493  13ab 7b02          	ld	a,(OFST-2,sp)
8494  13ad 5f            	clrw	x
8495  13ae 97            	ld	xl,a
8496  13af 4f            	clr	a
8497  13b0 02            	rlwa	x,a
8498  13b1 01            	rrwa	x,a
8499  13b2 1a04          	or	a,(OFST+0,sp)
8500  13b4 01            	rrwa	x,a
8501  13b5 1a03          	or	a,(OFST-1,sp)
8502  13b7 01            	rrwa	x,a
8503  13b8 1f03          	ldw	(OFST-1,sp),x
8504                     ; 2046     return (uint16_t)tmpccr4;
8506  13ba 1e03          	ldw	x,(OFST-1,sp)
8509  13bc 5b04          	addw	sp,#4
8510  13be 81            	ret
8544                     ; 2054 uint16_t TIM1_GetCounter(void)
8544                     ; 2055 {
8545                     	switch	.text
8546  13bf               _TIM1_GetCounter:
8548  13bf 89            	pushw	x
8549       00000002      OFST:	set	2
8552                     ; 2056   uint16_t tmpcntr = 0;
8554                     ; 2058   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8556  13c0 c6525e        	ld	a,21086
8557  13c3 5f            	clrw	x
8558  13c4 97            	ld	xl,a
8559  13c5 4f            	clr	a
8560  13c6 02            	rlwa	x,a
8561  13c7 1f01          	ldw	(OFST-1,sp),x
8562                     ; 2061     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8564  13c9 c6525f        	ld	a,21087
8565  13cc 5f            	clrw	x
8566  13cd 97            	ld	xl,a
8567  13ce 01            	rrwa	x,a
8568  13cf 1a02          	or	a,(OFST+0,sp)
8569  13d1 01            	rrwa	x,a
8570  13d2 1a01          	or	a,(OFST-1,sp)
8571  13d4 01            	rrwa	x,a
8574  13d5 5b02          	addw	sp,#2
8575  13d7 81            	ret
8609                     ; 2069 uint16_t TIM1_GetPrescaler(void)
8609                     ; 2070 {
8610                     	switch	.text
8611  13d8               _TIM1_GetPrescaler:
8613  13d8 89            	pushw	x
8614       00000002      OFST:	set	2
8617                     ; 2071    uint16_t temp = 0;
8619                     ; 2073    temp = ((uint16_t)TIM1->PSCRH << 8);
8621  13d9 c65260        	ld	a,21088
8622  13dc 5f            	clrw	x
8623  13dd 97            	ld	xl,a
8624  13de 4f            	clr	a
8625  13df 02            	rlwa	x,a
8626  13e0 1f01          	ldw	(OFST-1,sp),x
8627                     ; 2076     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8629  13e2 c65261        	ld	a,21089
8630  13e5 5f            	clrw	x
8631  13e6 97            	ld	xl,a
8632  13e7 01            	rrwa	x,a
8633  13e8 1a02          	or	a,(OFST+0,sp)
8634  13ea 01            	rrwa	x,a
8635  13eb 1a01          	or	a,(OFST-1,sp)
8636  13ed 01            	rrwa	x,a
8639  13ee 5b02          	addw	sp,#2
8640  13f0 81            	ret
8815                     ; 2097 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8815                     ; 2098 {
8816                     	switch	.text
8817  13f1               _TIM1_GetFlagStatus:
8819  13f1 89            	pushw	x
8820  13f2 89            	pushw	x
8821       00000002      OFST:	set	2
8824                     ; 2099     FlagStatus bitstatus = RESET;
8826                     ; 2100     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8830                     ; 2103     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8832  13f3 a30001        	cpw	x,#1
8833  13f6 2737          	jreq	L6231
8834  13f8 a30002        	cpw	x,#2
8835  13fb 2732          	jreq	L6231
8836  13fd a30004        	cpw	x,#4
8837  1400 272d          	jreq	L6231
8838  1402 a30008        	cpw	x,#8
8839  1405 2728          	jreq	L6231
8840  1407 a30010        	cpw	x,#16
8841  140a 2723          	jreq	L6231
8842  140c a30020        	cpw	x,#32
8843  140f 271e          	jreq	L6231
8844  1411 a30040        	cpw	x,#64
8845  1414 2719          	jreq	L6231
8846  1416 a30080        	cpw	x,#128
8847  1419 2714          	jreq	L6231
8848  141b a30200        	cpw	x,#512
8849  141e 270f          	jreq	L6231
8850  1420 a30400        	cpw	x,#1024
8851  1423 270a          	jreq	L6231
8852  1425 a30800        	cpw	x,#2048
8853  1428 2705          	jreq	L6231
8854  142a a31000        	cpw	x,#4096
8855  142d 2603          	jrne	L4231
8856  142f               L6231:
8857  142f 4f            	clr	a
8858  1430 2010          	jra	L0331
8859  1432               L4231:
8860  1432 ae0837        	ldw	x,#2103
8861  1435 89            	pushw	x
8862  1436 ae0000        	ldw	x,#0
8863  1439 89            	pushw	x
8864  143a ae0000        	ldw	x,#L101
8865  143d cd0000        	call	_assert_failed
8867  1440 5b04          	addw	sp,#4
8868  1442               L0331:
8869                     ; 2105     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8871  1442 c65255        	ld	a,21077
8872  1445 1404          	and	a,(OFST+2,sp)
8873  1447 6b01          	ld	(OFST-1,sp),a
8874                     ; 2106     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8876  1449 7b03          	ld	a,(OFST+1,sp)
8877  144b 6b02          	ld	(OFST+0,sp),a
8878                     ; 2108     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8880  144d c65256        	ld	a,21078
8881  1450 1402          	and	a,(OFST+0,sp)
8882  1452 1a01          	or	a,(OFST-1,sp)
8883  1454 2706          	jreq	L7643
8884                     ; 2110         bitstatus = SET;
8886  1456 a601          	ld	a,#1
8887  1458 6b02          	ld	(OFST+0,sp),a
8889  145a 2002          	jra	L1743
8890  145c               L7643:
8891                     ; 2114         bitstatus = RESET;
8893  145c 0f02          	clr	(OFST+0,sp)
8894  145e               L1743:
8895                     ; 2116     return (FlagStatus)(bitstatus);
8897  145e 7b02          	ld	a,(OFST+0,sp)
8900  1460 5b04          	addw	sp,#4
8901  1462 81            	ret
8937                     ; 2137 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8937                     ; 2138 {
8938                     	switch	.text
8939  1463               _TIM1_ClearFlag:
8941  1463 89            	pushw	x
8942       00000000      OFST:	set	0
8945                     ; 2140     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8947  1464 01            	rrwa	x,a
8948  1465 9f            	ld	a,xl
8949  1466 a4e1          	and	a,#225
8950  1468 97            	ld	xl,a
8951  1469 4f            	clr	a
8952  146a 02            	rlwa	x,a
8953  146b 5d            	tnzw	x
8954  146c 2607          	jrne	L4331
8955  146e 1e01          	ldw	x,(OFST+1,sp)
8956  1470 2703          	jreq	L4331
8957  1472 4f            	clr	a
8958  1473 2010          	jra	L6331
8959  1475               L4331:
8960  1475 ae085c        	ldw	x,#2140
8961  1478 89            	pushw	x
8962  1479 ae0000        	ldw	x,#0
8963  147c 89            	pushw	x
8964  147d ae0000        	ldw	x,#L101
8965  1480 cd0000        	call	_assert_failed
8967  1483 5b04          	addw	sp,#4
8968  1485               L6331:
8969                     ; 2143     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
8971  1485 7b02          	ld	a,(OFST+2,sp)
8972  1487 43            	cpl	a
8973  1488 c75255        	ld	21077,a
8974                     ; 2144     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
8974                     ; 2145                           (uint8_t)0x1E);
8976  148b 7b01          	ld	a,(OFST+1,sp)
8977  148d 43            	cpl	a
8978  148e a41e          	and	a,#30
8979  1490 c75256        	ld	21078,a
8980                     ; 2146 }
8983  1493 85            	popw	x
8984  1494 81            	ret
9049                     ; 2162 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9049                     ; 2163 {
9050                     	switch	.text
9051  1495               _TIM1_GetITStatus:
9053  1495 88            	push	a
9054  1496 89            	pushw	x
9055       00000002      OFST:	set	2
9058                     ; 2164     ITStatus bitstatus = RESET;
9060                     ; 2165     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9064                     ; 2168     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9066  1497 a101          	cp	a,#1
9067  1499 271c          	jreq	L4431
9068  149b a102          	cp	a,#2
9069  149d 2718          	jreq	L4431
9070  149f a104          	cp	a,#4
9071  14a1 2714          	jreq	L4431
9072  14a3 a108          	cp	a,#8
9073  14a5 2710          	jreq	L4431
9074  14a7 a110          	cp	a,#16
9075  14a9 270c          	jreq	L4431
9076  14ab a120          	cp	a,#32
9077  14ad 2708          	jreq	L4431
9078  14af a140          	cp	a,#64
9079  14b1 2704          	jreq	L4431
9080  14b3 a180          	cp	a,#128
9081  14b5 2603          	jrne	L2431
9082  14b7               L4431:
9083  14b7 4f            	clr	a
9084  14b8 2010          	jra	L6431
9085  14ba               L2431:
9086  14ba ae0878        	ldw	x,#2168
9087  14bd 89            	pushw	x
9088  14be ae0000        	ldw	x,#0
9089  14c1 89            	pushw	x
9090  14c2 ae0000        	ldw	x,#L101
9091  14c5 cd0000        	call	_assert_failed
9093  14c8 5b04          	addw	sp,#4
9094  14ca               L6431:
9095                     ; 2170     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9097  14ca c65255        	ld	a,21077
9098  14cd 1403          	and	a,(OFST+1,sp)
9099  14cf 6b01          	ld	(OFST-1,sp),a
9100                     ; 2172     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9102  14d1 c65254        	ld	a,21076
9103  14d4 1403          	and	a,(OFST+1,sp)
9104  14d6 6b02          	ld	(OFST+0,sp),a
9105                     ; 2174     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9107  14d8 0d01          	tnz	(OFST-1,sp)
9108  14da 270a          	jreq	L3453
9110  14dc 0d02          	tnz	(OFST+0,sp)
9111  14de 2706          	jreq	L3453
9112                     ; 2176         bitstatus = SET;
9114  14e0 a601          	ld	a,#1
9115  14e2 6b02          	ld	(OFST+0,sp),a
9117  14e4 2002          	jra	L5453
9118  14e6               L3453:
9119                     ; 2180         bitstatus = RESET;
9121  14e6 0f02          	clr	(OFST+0,sp)
9122  14e8               L5453:
9123                     ; 2182     return (ITStatus)(bitstatus);
9125  14e8 7b02          	ld	a,(OFST+0,sp)
9128  14ea 5b03          	addw	sp,#3
9129  14ec 81            	ret
9166                     ; 2199 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9166                     ; 2200 {
9167                     	switch	.text
9168  14ed               _TIM1_ClearITPendingBit:
9170  14ed 88            	push	a
9171       00000000      OFST:	set	0
9174                     ; 2202     assert_param(IS_TIM1_IT_OK(TIM1_IT));
9176  14ee 4d            	tnz	a
9177  14ef 2703          	jreq	L2531
9178  14f1 4f            	clr	a
9179  14f2 2010          	jra	L4531
9180  14f4               L2531:
9181  14f4 ae089a        	ldw	x,#2202
9182  14f7 89            	pushw	x
9183  14f8 ae0000        	ldw	x,#0
9184  14fb 89            	pushw	x
9185  14fc ae0000        	ldw	x,#L101
9186  14ff cd0000        	call	_assert_failed
9188  1502 5b04          	addw	sp,#4
9189  1504               L4531:
9190                     ; 2205     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9192  1504 7b01          	ld	a,(OFST+1,sp)
9193  1506 43            	cpl	a
9194  1507 c75255        	ld	21077,a
9195                     ; 2206 }
9198  150a 84            	pop	a
9199  150b 81            	ret
9251                     ; 2224 static void TI1_Config(uint8_t TIM1_ICPolarity,
9251                     ; 2225                        uint8_t TIM1_ICSelection,
9251                     ; 2226                        uint8_t TIM1_ICFilter)
9251                     ; 2227 {
9252                     	switch	.text
9253  150c               L3_TI1_Config:
9255  150c 89            	pushw	x
9256  150d 88            	push	a
9257       00000001      OFST:	set	1
9260                     ; 2230     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9262  150e 7211525c      	bres	21084,#0
9263                     ; 2233     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9263                     ; 2234                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9265  1512 7b06          	ld	a,(OFST+5,sp)
9266  1514 97            	ld	xl,a
9267  1515 a610          	ld	a,#16
9268  1517 42            	mul	x,a
9269  1518 9f            	ld	a,xl
9270  1519 1a03          	or	a,(OFST+2,sp)
9271  151b 6b01          	ld	(OFST+0,sp),a
9272  151d c65258        	ld	a,21080
9273  1520 a40c          	and	a,#12
9274  1522 1a01          	or	a,(OFST+0,sp)
9275  1524 c75258        	ld	21080,a
9276                     ; 2237     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9278  1527 0d02          	tnz	(OFST+1,sp)
9279  1529 2706          	jreq	L3163
9280                     ; 2239         TIM1->CCER1 |= TIM1_CCER1_CC1P;
9282  152b 7212525c      	bset	21084,#1
9284  152f 2004          	jra	L5163
9285  1531               L3163:
9286                     ; 2243         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9288  1531 7213525c      	bres	21084,#1
9289  1535               L5163:
9290                     ; 2247     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9292  1535 7210525c      	bset	21084,#0
9293                     ; 2248 }
9296  1539 5b03          	addw	sp,#3
9297  153b 81            	ret
9349                     ; 2266 static void TI2_Config(uint8_t TIM1_ICPolarity,
9349                     ; 2267                        uint8_t TIM1_ICSelection,
9349                     ; 2268                        uint8_t TIM1_ICFilter)
9349                     ; 2269 {
9350                     	switch	.text
9351  153c               L5_TI2_Config:
9353  153c 89            	pushw	x
9354  153d 88            	push	a
9355       00000001      OFST:	set	1
9358                     ; 2271     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9360  153e 7219525c      	bres	21084,#4
9361                     ; 2274     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9361                     ; 2275                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9363  1542 7b06          	ld	a,(OFST+5,sp)
9364  1544 97            	ld	xl,a
9365  1545 a610          	ld	a,#16
9366  1547 42            	mul	x,a
9367  1548 9f            	ld	a,xl
9368  1549 1a03          	or	a,(OFST+2,sp)
9369  154b 6b01          	ld	(OFST+0,sp),a
9370  154d c65259        	ld	a,21081
9371  1550 a40c          	and	a,#12
9372  1552 1a01          	or	a,(OFST+0,sp)
9373  1554 c75259        	ld	21081,a
9374                     ; 2277     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9376  1557 0d02          	tnz	(OFST+1,sp)
9377  1559 2706          	jreq	L5463
9378                     ; 2279         TIM1->CCER1 |= TIM1_CCER1_CC2P;
9380  155b 721a525c      	bset	21084,#5
9382  155f 2004          	jra	L7463
9383  1561               L5463:
9384                     ; 2283         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9386  1561 721b525c      	bres	21084,#5
9387  1565               L7463:
9388                     ; 2286     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9390  1565 7218525c      	bset	21084,#4
9391                     ; 2287 }
9394  1569 5b03          	addw	sp,#3
9395  156b 81            	ret
9447                     ; 2305 static void TI3_Config(uint8_t TIM1_ICPolarity,
9447                     ; 2306                        uint8_t TIM1_ICSelection,
9447                     ; 2307                        uint8_t TIM1_ICFilter)
9447                     ; 2308 {
9448                     	switch	.text
9449  156c               L7_TI3_Config:
9451  156c 89            	pushw	x
9452  156d 88            	push	a
9453       00000001      OFST:	set	1
9456                     ; 2310     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9458  156e 7211525d      	bres	21085,#0
9459                     ; 2313     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9459                     ; 2314                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9461  1572 7b06          	ld	a,(OFST+5,sp)
9462  1574 97            	ld	xl,a
9463  1575 a610          	ld	a,#16
9464  1577 42            	mul	x,a
9465  1578 9f            	ld	a,xl
9466  1579 1a03          	or	a,(OFST+2,sp)
9467  157b 6b01          	ld	(OFST+0,sp),a
9468  157d c6525a        	ld	a,21082
9469  1580 a40c          	and	a,#12
9470  1582 1a01          	or	a,(OFST+0,sp)
9471  1584 c7525a        	ld	21082,a
9472                     ; 2317     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9474  1587 0d02          	tnz	(OFST+1,sp)
9475  1589 2706          	jreq	L7763
9476                     ; 2319         TIM1->CCER2 |= TIM1_CCER2_CC3P;
9478  158b 7212525d      	bset	21085,#1
9480  158f 2004          	jra	L1073
9481  1591               L7763:
9482                     ; 2323         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9484  1591 7213525d      	bres	21085,#1
9485  1595               L1073:
9486                     ; 2326     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9488  1595 7210525d      	bset	21085,#0
9489                     ; 2327 }
9492  1599 5b03          	addw	sp,#3
9493  159b 81            	ret
9545                     ; 2346 static void TI4_Config(uint8_t TIM1_ICPolarity,
9545                     ; 2347                        uint8_t TIM1_ICSelection,
9545                     ; 2348                        uint8_t TIM1_ICFilter)
9545                     ; 2349 {
9546                     	switch	.text
9547  159c               L11_TI4_Config:
9549  159c 89            	pushw	x
9550  159d 88            	push	a
9551       00000001      OFST:	set	1
9554                     ; 2352     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9556  159e 7219525d      	bres	21085,#4
9557                     ; 2355     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9557                     ; 2356                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9559  15a2 7b06          	ld	a,(OFST+5,sp)
9560  15a4 97            	ld	xl,a
9561  15a5 a610          	ld	a,#16
9562  15a7 42            	mul	x,a
9563  15a8 9f            	ld	a,xl
9564  15a9 1a03          	or	a,(OFST+2,sp)
9565  15ab 6b01          	ld	(OFST+0,sp),a
9566  15ad c6525b        	ld	a,21083
9567  15b0 a40c          	and	a,#12
9568  15b2 1a01          	or	a,(OFST+0,sp)
9569  15b4 c7525b        	ld	21083,a
9570                     ; 2359     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9572  15b7 0d02          	tnz	(OFST+1,sp)
9573  15b9 2706          	jreq	L1373
9574                     ; 2361         TIM1->CCER2 |= TIM1_CCER2_CC4P;
9576  15bb 721a525d      	bset	21085,#5
9578  15bf 2004          	jra	L3373
9579  15c1               L1373:
9580                     ; 2365         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9582  15c1 721b525d      	bres	21085,#5
9583  15c5               L3373:
9584                     ; 2369     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9586  15c5 7218525d      	bset	21085,#4
9587                     ; 2370 }
9590  15c9 5b03          	addw	sp,#3
9591  15cb 81            	ret
9604                     	xdef	_TIM1_ClearITPendingBit
9605                     	xdef	_TIM1_GetITStatus
9606                     	xdef	_TIM1_ClearFlag
9607                     	xdef	_TIM1_GetFlagStatus
9608                     	xdef	_TIM1_GetPrescaler
9609                     	xdef	_TIM1_GetCounter
9610                     	xdef	_TIM1_GetCapture4
9611                     	xdef	_TIM1_GetCapture3
9612                     	xdef	_TIM1_GetCapture2
9613                     	xdef	_TIM1_GetCapture1
9614                     	xdef	_TIM1_SetIC4Prescaler
9615                     	xdef	_TIM1_SetIC3Prescaler
9616                     	xdef	_TIM1_SetIC2Prescaler
9617                     	xdef	_TIM1_SetIC1Prescaler
9618                     	xdef	_TIM1_SetCompare4
9619                     	xdef	_TIM1_SetCompare3
9620                     	xdef	_TIM1_SetCompare2
9621                     	xdef	_TIM1_SetCompare1
9622                     	xdef	_TIM1_SetAutoreload
9623                     	xdef	_TIM1_SetCounter
9624                     	xdef	_TIM1_SelectOCxM
9625                     	xdef	_TIM1_CCxNCmd
9626                     	xdef	_TIM1_CCxCmd
9627                     	xdef	_TIM1_OC4PolarityConfig
9628                     	xdef	_TIM1_OC3NPolarityConfig
9629                     	xdef	_TIM1_OC3PolarityConfig
9630                     	xdef	_TIM1_OC2NPolarityConfig
9631                     	xdef	_TIM1_OC2PolarityConfig
9632                     	xdef	_TIM1_OC1NPolarityConfig
9633                     	xdef	_TIM1_OC1PolarityConfig
9634                     	xdef	_TIM1_GenerateEvent
9635                     	xdef	_TIM1_OC4FastConfig
9636                     	xdef	_TIM1_OC3FastConfig
9637                     	xdef	_TIM1_OC2FastConfig
9638                     	xdef	_TIM1_OC1FastConfig
9639                     	xdef	_TIM1_OC4PreloadConfig
9640                     	xdef	_TIM1_OC3PreloadConfig
9641                     	xdef	_TIM1_OC2PreloadConfig
9642                     	xdef	_TIM1_OC1PreloadConfig
9643                     	xdef	_TIM1_CCPreloadControl
9644                     	xdef	_TIM1_SelectCOM
9645                     	xdef	_TIM1_ARRPreloadConfig
9646                     	xdef	_TIM1_ForcedOC4Config
9647                     	xdef	_TIM1_ForcedOC3Config
9648                     	xdef	_TIM1_ForcedOC2Config
9649                     	xdef	_TIM1_ForcedOC1Config
9650                     	xdef	_TIM1_CounterModeConfig
9651                     	xdef	_TIM1_PrescalerConfig
9652                     	xdef	_TIM1_EncoderInterfaceConfig
9653                     	xdef	_TIM1_SelectMasterSlaveMode
9654                     	xdef	_TIM1_SelectSlaveMode
9655                     	xdef	_TIM1_SelectOutputTrigger
9656                     	xdef	_TIM1_SelectOnePulseMode
9657                     	xdef	_TIM1_SelectHallSensor
9658                     	xdef	_TIM1_UpdateRequestConfig
9659                     	xdef	_TIM1_UpdateDisableConfig
9660                     	xdef	_TIM1_SelectInputTrigger
9661                     	xdef	_TIM1_TIxExternalClockConfig
9662                     	xdef	_TIM1_ETRConfig
9663                     	xdef	_TIM1_ETRClockMode2Config
9664                     	xdef	_TIM1_ETRClockMode1Config
9665                     	xdef	_TIM1_InternalClockConfig
9666                     	xdef	_TIM1_ITConfig
9667                     	xdef	_TIM1_CtrlPWMOutputs
9668                     	xdef	_TIM1_Cmd
9669                     	xdef	_TIM1_PWMIConfig
9670                     	xdef	_TIM1_ICInit
9671                     	xdef	_TIM1_BDTRConfig
9672                     	xdef	_TIM1_OC4Init
9673                     	xdef	_TIM1_OC3Init
9674                     	xdef	_TIM1_OC2Init
9675                     	xdef	_TIM1_OC1Init
9676                     	xdef	_TIM1_TimeBaseInit
9677                     	xdef	_TIM1_DeInit
9678                     	xref	_assert_failed
9679                     .const:	section	.text
9680  0000               L101:
9681  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
9682  0012 696d312e6300  	dc.b	"im1.c",0
9702                     	end

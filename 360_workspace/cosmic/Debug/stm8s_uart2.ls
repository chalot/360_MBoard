   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 47 void UART2_DeInit(void)
  43                     ; 48 {
  45                     	switch	.text
  46  0000               _UART2_DeInit:
  50                     ; 51     (void) UART2->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 52     (void)UART2->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  76  001e 725f5248      	clr	21064
  77                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  79  0022 725f5249      	clr	21065
  80                     ; 64 }
  83  0026 81            	ret
 405                     .const:	section	.text
 406  0000               L21:
 407  0000 00098969      	dc.l	625001
 408  0004               L25:
 409  0004 00000064      	dc.l	100
 410                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 410                     ; 81 {
 411                     	switch	.text
 412  0027               _UART2_Init:
 414  0027 520e          	subw	sp,#14
 415       0000000e      OFST:	set	14
 418                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 422                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 426                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 428  0029 96            	ldw	x,sp
 429  002a 1c0011        	addw	x,#OFST+3
 430  002d cd0000        	call	c_ltor
 432  0030 ae0000        	ldw	x,#L21
 433  0033 cd0000        	call	c_lcmp
 435  0036 2403          	jruge	L01
 436  0038 4f            	clr	a
 437  0039 2010          	jra	L41
 438  003b               L01:
 439  003b ae0056        	ldw	x,#86
 440  003e 89            	pushw	x
 441  003f ae0000        	ldw	x,#0
 442  0042 89            	pushw	x
 443  0043 ae0008        	ldw	x,#L302
 444  0046 cd0000        	call	_assert_failed
 446  0049 5b04          	addw	sp,#4
 447  004b               L41:
 448                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 450  004b 0d15          	tnz	(OFST+7,sp)
 451  004d 2706          	jreq	L02
 452  004f 7b15          	ld	a,(OFST+7,sp)
 453  0051 a110          	cp	a,#16
 454  0053 2603          	jrne	L61
 455  0055               L02:
 456  0055 4f            	clr	a
 457  0056 2010          	jra	L22
 458  0058               L61:
 459  0058 ae0057        	ldw	x,#87
 460  005b 89            	pushw	x
 461  005c ae0000        	ldw	x,#0
 462  005f 89            	pushw	x
 463  0060 ae0008        	ldw	x,#L302
 464  0063 cd0000        	call	_assert_failed
 466  0066 5b04          	addw	sp,#4
 467  0068               L22:
 468                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 470  0068 0d16          	tnz	(OFST+8,sp)
 471  006a 2712          	jreq	L62
 472  006c 7b16          	ld	a,(OFST+8,sp)
 473  006e a110          	cp	a,#16
 474  0070 270c          	jreq	L62
 475  0072 7b16          	ld	a,(OFST+8,sp)
 476  0074 a120          	cp	a,#32
 477  0076 2706          	jreq	L62
 478  0078 7b16          	ld	a,(OFST+8,sp)
 479  007a a130          	cp	a,#48
 480  007c 2603          	jrne	L42
 481  007e               L62:
 482  007e 4f            	clr	a
 483  007f 2010          	jra	L03
 484  0081               L42:
 485  0081 ae0058        	ldw	x,#88
 486  0084 89            	pushw	x
 487  0085 ae0000        	ldw	x,#0
 488  0088 89            	pushw	x
 489  0089 ae0008        	ldw	x,#L302
 490  008c cd0000        	call	_assert_failed
 492  008f 5b04          	addw	sp,#4
 493  0091               L03:
 494                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 496  0091 0d17          	tnz	(OFST+9,sp)
 497  0093 270c          	jreq	L43
 498  0095 7b17          	ld	a,(OFST+9,sp)
 499  0097 a104          	cp	a,#4
 500  0099 2706          	jreq	L43
 501  009b 7b17          	ld	a,(OFST+9,sp)
 502  009d a106          	cp	a,#6
 503  009f 2603          	jrne	L23
 504  00a1               L43:
 505  00a1 4f            	clr	a
 506  00a2 2010          	jra	L63
 507  00a4               L23:
 508  00a4 ae0059        	ldw	x,#89
 509  00a7 89            	pushw	x
 510  00a8 ae0000        	ldw	x,#0
 511  00ab 89            	pushw	x
 512  00ac ae0008        	ldw	x,#L302
 513  00af cd0000        	call	_assert_failed
 515  00b2 5b04          	addw	sp,#4
 516  00b4               L63:
 517                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 519  00b4 7b19          	ld	a,(OFST+11,sp)
 520  00b6 a108          	cp	a,#8
 521  00b8 2730          	jreq	L24
 522  00ba 7b19          	ld	a,(OFST+11,sp)
 523  00bc a140          	cp	a,#64
 524  00be 272a          	jreq	L24
 525  00c0 7b19          	ld	a,(OFST+11,sp)
 526  00c2 a104          	cp	a,#4
 527  00c4 2724          	jreq	L24
 528  00c6 7b19          	ld	a,(OFST+11,sp)
 529  00c8 a180          	cp	a,#128
 530  00ca 271e          	jreq	L24
 531  00cc 7b19          	ld	a,(OFST+11,sp)
 532  00ce a10c          	cp	a,#12
 533  00d0 2718          	jreq	L24
 534  00d2 7b19          	ld	a,(OFST+11,sp)
 535  00d4 a10c          	cp	a,#12
 536  00d6 2712          	jreq	L24
 537  00d8 7b19          	ld	a,(OFST+11,sp)
 538  00da a144          	cp	a,#68
 539  00dc 270c          	jreq	L24
 540  00de 7b19          	ld	a,(OFST+11,sp)
 541  00e0 a1c0          	cp	a,#192
 542  00e2 2706          	jreq	L24
 543  00e4 7b19          	ld	a,(OFST+11,sp)
 544  00e6 a188          	cp	a,#136
 545  00e8 2603          	jrne	L04
 546  00ea               L24:
 547  00ea 4f            	clr	a
 548  00eb 2010          	jra	L44
 549  00ed               L04:
 550  00ed ae005a        	ldw	x,#90
 551  00f0 89            	pushw	x
 552  00f1 ae0000        	ldw	x,#0
 553  00f4 89            	pushw	x
 554  00f5 ae0008        	ldw	x,#L302
 555  00f8 cd0000        	call	_assert_failed
 557  00fb 5b04          	addw	sp,#4
 558  00fd               L44:
 559                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 561  00fd 7b18          	ld	a,(OFST+10,sp)
 562  00ff a488          	and	a,#136
 563  0101 a188          	cp	a,#136
 564  0103 271b          	jreq	L64
 565  0105 7b18          	ld	a,(OFST+10,sp)
 566  0107 a444          	and	a,#68
 567  0109 a144          	cp	a,#68
 568  010b 2713          	jreq	L64
 569  010d 7b18          	ld	a,(OFST+10,sp)
 570  010f a422          	and	a,#34
 571  0111 a122          	cp	a,#34
 572  0113 270b          	jreq	L64
 573  0115 7b18          	ld	a,(OFST+10,sp)
 574  0117 a411          	and	a,#17
 575  0119 a111          	cp	a,#17
 576  011b 2703          	jreq	L64
 577  011d 4f            	clr	a
 578  011e 2010          	jra	L05
 579  0120               L64:
 580  0120 ae005b        	ldw	x,#91
 581  0123 89            	pushw	x
 582  0124 ae0000        	ldw	x,#0
 583  0127 89            	pushw	x
 584  0128 ae0008        	ldw	x,#L302
 585  012b cd0000        	call	_assert_failed
 587  012e 5b04          	addw	sp,#4
 588  0130               L05:
 589                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 591  0130 72195244      	bres	21060,#4
 592                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 594  0134 c65244        	ld	a,21060
 595  0137 1a15          	or	a,(OFST+7,sp)
 596  0139 c75244        	ld	21060,a
 597                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 599  013c c65246        	ld	a,21062
 600  013f a4cf          	and	a,#207
 601  0141 c75246        	ld	21062,a
 602                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 604  0144 c65246        	ld	a,21062
 605  0147 1a16          	or	a,(OFST+8,sp)
 606  0149 c75246        	ld	21062,a
 607                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 609  014c c65244        	ld	a,21060
 610  014f a4f9          	and	a,#249
 611  0151 c75244        	ld	21060,a
 612                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 614  0154 c65244        	ld	a,21060
 615  0157 1a17          	or	a,(OFST+9,sp)
 616  0159 c75244        	ld	21060,a
 617                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 619  015c 725f5242      	clr	21058
 620                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 622  0160 c65243        	ld	a,21059
 623  0163 a40f          	and	a,#15
 624  0165 c75243        	ld	21059,a
 625                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 627  0168 c65243        	ld	a,21059
 628  016b a4f0          	and	a,#240
 629  016d c75243        	ld	21059,a
 630                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 632  0170 96            	ldw	x,sp
 633  0171 1c0011        	addw	x,#OFST+3
 634  0174 cd0000        	call	c_ltor
 636  0177 a604          	ld	a,#4
 637  0179 cd0000        	call	c_llsh
 639  017c 96            	ldw	x,sp
 640  017d 1c0001        	addw	x,#OFST-13
 641  0180 cd0000        	call	c_rtol
 643  0183 cd0000        	call	_CLK_GetClockFreq
 645  0186 96            	ldw	x,sp
 646  0187 1c0001        	addw	x,#OFST-13
 647  018a cd0000        	call	c_ludv
 649  018d 96            	ldw	x,sp
 650  018e 1c000b        	addw	x,#OFST-3
 651  0191 cd0000        	call	c_rtol
 653                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 655  0194 96            	ldw	x,sp
 656  0195 1c0011        	addw	x,#OFST+3
 657  0198 cd0000        	call	c_ltor
 659  019b a604          	ld	a,#4
 660  019d cd0000        	call	c_llsh
 662  01a0 96            	ldw	x,sp
 663  01a1 1c0001        	addw	x,#OFST-13
 664  01a4 cd0000        	call	c_rtol
 666  01a7 cd0000        	call	_CLK_GetClockFreq
 668  01aa a664          	ld	a,#100
 669  01ac cd0000        	call	c_smul
 671  01af 96            	ldw	x,sp
 672  01b0 1c0001        	addw	x,#OFST-13
 673  01b3 cd0000        	call	c_ludv
 675  01b6 96            	ldw	x,sp
 676  01b7 1c0007        	addw	x,#OFST-7
 677  01ba cd0000        	call	c_rtol
 679                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 679                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 681  01bd 96            	ldw	x,sp
 682  01be 1c000b        	addw	x,#OFST-3
 683  01c1 cd0000        	call	c_ltor
 685  01c4 a664          	ld	a,#100
 686  01c6 cd0000        	call	c_smul
 688  01c9 96            	ldw	x,sp
 689  01ca 1c0001        	addw	x,#OFST-13
 690  01cd cd0000        	call	c_rtol
 692  01d0 96            	ldw	x,sp
 693  01d1 1c0007        	addw	x,#OFST-7
 694  01d4 cd0000        	call	c_ltor
 696  01d7 96            	ldw	x,sp
 697  01d8 1c0001        	addw	x,#OFST-13
 698  01db cd0000        	call	c_lsub
 700  01de a604          	ld	a,#4
 701  01e0 cd0000        	call	c_llsh
 703  01e3 ae0004        	ldw	x,#L25
 704  01e6 cd0000        	call	c_ludv
 706  01e9 b603          	ld	a,c_lreg+3
 707  01eb a40f          	and	a,#15
 708  01ed 6b05          	ld	(OFST-9,sp),a
 709                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 711  01ef 96            	ldw	x,sp
 712  01f0 1c000b        	addw	x,#OFST-3
 713  01f3 cd0000        	call	c_ltor
 715  01f6 a604          	ld	a,#4
 716  01f8 cd0000        	call	c_lursh
 718  01fb b603          	ld	a,c_lreg+3
 719  01fd a4f0          	and	a,#240
 720  01ff b703          	ld	c_lreg+3,a
 721  0201 3f02          	clr	c_lreg+2
 722  0203 3f01          	clr	c_lreg+1
 723  0205 3f00          	clr	c_lreg
 724  0207 b603          	ld	a,c_lreg+3
 725  0209 6b06          	ld	(OFST-8,sp),a
 726                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 728  020b 7b05          	ld	a,(OFST-9,sp)
 729  020d 1a06          	or	a,(OFST-8,sp)
 730  020f c75243        	ld	21059,a
 731                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 733  0212 7b0e          	ld	a,(OFST+0,sp)
 734  0214 c75242        	ld	21058,a
 735                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 737  0217 c65245        	ld	a,21061
 738  021a a4f3          	and	a,#243
 739  021c c75245        	ld	21061,a
 740                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 742  021f c65246        	ld	a,21062
 743  0222 a4f8          	and	a,#248
 744  0224 c75246        	ld	21062,a
 745                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 745                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 747  0227 7b18          	ld	a,(OFST+10,sp)
 748  0229 a407          	and	a,#7
 749  022b ca5246        	or	a,21062
 750  022e c75246        	ld	21062,a
 751                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 753  0231 7b19          	ld	a,(OFST+11,sp)
 754  0233 a504          	bcp	a,#4
 755  0235 2706          	jreq	L502
 756                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 758  0237 72165245      	bset	21061,#3
 760  023b 2004          	jra	L702
 761  023d               L502:
 762                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 764  023d 72175245      	bres	21061,#3
 765  0241               L702:
 766                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 768  0241 7b19          	ld	a,(OFST+11,sp)
 769  0243 a508          	bcp	a,#8
 770  0245 2706          	jreq	L112
 771                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 773  0247 72145245      	bset	21061,#2
 775  024b 2004          	jra	L312
 776  024d               L112:
 777                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 779  024d 72155245      	bres	21061,#2
 780  0251               L312:
 781                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 783  0251 7b18          	ld	a,(OFST+10,sp)
 784  0253 a580          	bcp	a,#128
 785  0255 2706          	jreq	L512
 786                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 788  0257 72175246      	bres	21062,#3
 790  025b 200a          	jra	L712
 791  025d               L512:
 792                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 794  025d 7b18          	ld	a,(OFST+10,sp)
 795  025f a408          	and	a,#8
 796  0261 ca5246        	or	a,21062
 797  0264 c75246        	ld	21062,a
 798  0267               L712:
 799                     ; 168 }
 802  0267 5b0e          	addw	sp,#14
 803  0269 81            	ret
 858                     ; 176 void UART2_Cmd(FunctionalState NewState)
 858                     ; 177 {
 859                     	switch	.text
 860  026a               _UART2_Cmd:
 864                     ; 179     if (NewState != DISABLE)
 866  026a 4d            	tnz	a
 867  026b 2706          	jreq	L742
 868                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 870  026d 721b5244      	bres	21060,#5
 872  0271 2004          	jra	L152
 873  0273               L742:
 874                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 876  0273 721a5244      	bset	21060,#5
 877  0277               L152:
 878                     ; 189 }
 881  0277 81            	ret
1014                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
1014                     ; 207 {
1015                     	switch	.text
1016  0278               _UART2_ITConfig:
1018  0278 89            	pushw	x
1019  0279 89            	pushw	x
1020       00000002      OFST:	set	2
1023                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
1027                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
1029  027a a30100        	cpw	x,#256
1030  027d 271e          	jreq	L26
1031  027f a30277        	cpw	x,#631
1032  0282 2719          	jreq	L26
1033  0284 a30266        	cpw	x,#614
1034  0287 2714          	jreq	L26
1035  0289 a30205        	cpw	x,#517
1036  028c 270f          	jreq	L26
1037  028e a30244        	cpw	x,#580
1038  0291 270a          	jreq	L26
1039  0293 a30412        	cpw	x,#1042
1040  0296 2705          	jreq	L26
1041  0298 a30346        	cpw	x,#838
1042  029b 2603          	jrne	L06
1043  029d               L26:
1044  029d 4f            	clr	a
1045  029e 2010          	jra	L46
1046  02a0               L06:
1047  02a0 ae00d3        	ldw	x,#211
1048  02a3 89            	pushw	x
1049  02a4 ae0000        	ldw	x,#0
1050  02a7 89            	pushw	x
1051  02a8 ae0008        	ldw	x,#L302
1052  02ab cd0000        	call	_assert_failed
1054  02ae 5b04          	addw	sp,#4
1055  02b0               L46:
1056                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1058  02b0 0d07          	tnz	(OFST+5,sp)
1059  02b2 2706          	jreq	L07
1060  02b4 7b07          	ld	a,(OFST+5,sp)
1061  02b6 a101          	cp	a,#1
1062  02b8 2603          	jrne	L66
1063  02ba               L07:
1064  02ba 4f            	clr	a
1065  02bb 2010          	jra	L27
1066  02bd               L66:
1067  02bd ae00d4        	ldw	x,#212
1068  02c0 89            	pushw	x
1069  02c1 ae0000        	ldw	x,#0
1070  02c4 89            	pushw	x
1071  02c5 ae0008        	ldw	x,#L302
1072  02c8 cd0000        	call	_assert_failed
1074  02cb 5b04          	addw	sp,#4
1075  02cd               L27:
1076                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
1078  02cd 7b03          	ld	a,(OFST+1,sp)
1079  02cf 6b01          	ld	(OFST-1,sp),a
1080                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
1082  02d1 7b04          	ld	a,(OFST+2,sp)
1083  02d3 a40f          	and	a,#15
1084  02d5 5f            	clrw	x
1085  02d6 97            	ld	xl,a
1086  02d7 a601          	ld	a,#1
1087  02d9 5d            	tnzw	x
1088  02da 2704          	jreq	L47
1089  02dc               L67:
1090  02dc 48            	sll	a
1091  02dd 5a            	decw	x
1092  02de 26fc          	jrne	L67
1093  02e0               L47:
1094  02e0 6b02          	ld	(OFST+0,sp),a
1095                     ; 220     if (NewState != DISABLE)
1097  02e2 0d07          	tnz	(OFST+5,sp)
1098  02e4 273a          	jreq	L333
1099                     ; 223         if (uartreg == 0x01)
1101  02e6 7b01          	ld	a,(OFST-1,sp)
1102  02e8 a101          	cp	a,#1
1103  02ea 260a          	jrne	L533
1104                     ; 225             UART2->CR1 |= itpos;
1106  02ec c65244        	ld	a,21060
1107  02ef 1a02          	or	a,(OFST+0,sp)
1108  02f1 c75244        	ld	21060,a
1110  02f4 2066          	jra	L153
1111  02f6               L533:
1112                     ; 227         else if (uartreg == 0x02)
1114  02f6 7b01          	ld	a,(OFST-1,sp)
1115  02f8 a102          	cp	a,#2
1116  02fa 260a          	jrne	L143
1117                     ; 229             UART2->CR2 |= itpos;
1119  02fc c65245        	ld	a,21061
1120  02ff 1a02          	or	a,(OFST+0,sp)
1121  0301 c75245        	ld	21061,a
1123  0304 2056          	jra	L153
1124  0306               L143:
1125                     ; 231         else if (uartreg == 0x03)
1127  0306 7b01          	ld	a,(OFST-1,sp)
1128  0308 a103          	cp	a,#3
1129  030a 260a          	jrne	L543
1130                     ; 233             UART2->CR4 |= itpos;
1132  030c c65247        	ld	a,21063
1133  030f 1a02          	or	a,(OFST+0,sp)
1134  0311 c75247        	ld	21063,a
1136  0314 2046          	jra	L153
1137  0316               L543:
1138                     ; 237             UART2->CR6 |= itpos;
1140  0316 c65249        	ld	a,21065
1141  0319 1a02          	or	a,(OFST+0,sp)
1142  031b c75249        	ld	21065,a
1143  031e 203c          	jra	L153
1144  0320               L333:
1145                     ; 243         if (uartreg == 0x01)
1147  0320 7b01          	ld	a,(OFST-1,sp)
1148  0322 a101          	cp	a,#1
1149  0324 260b          	jrne	L353
1150                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
1152  0326 7b02          	ld	a,(OFST+0,sp)
1153  0328 43            	cpl	a
1154  0329 c45244        	and	a,21060
1155  032c c75244        	ld	21060,a
1157  032f 202b          	jra	L153
1158  0331               L353:
1159                     ; 247         else if (uartreg == 0x02)
1161  0331 7b01          	ld	a,(OFST-1,sp)
1162  0333 a102          	cp	a,#2
1163  0335 260b          	jrne	L753
1164                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
1166  0337 7b02          	ld	a,(OFST+0,sp)
1167  0339 43            	cpl	a
1168  033a c45245        	and	a,21061
1169  033d c75245        	ld	21061,a
1171  0340 201a          	jra	L153
1172  0342               L753:
1173                     ; 251         else if (uartreg == 0x03)
1175  0342 7b01          	ld	a,(OFST-1,sp)
1176  0344 a103          	cp	a,#3
1177  0346 260b          	jrne	L363
1178                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
1180  0348 7b02          	ld	a,(OFST+0,sp)
1181  034a 43            	cpl	a
1182  034b c45247        	and	a,21063
1183  034e c75247        	ld	21063,a
1185  0351 2009          	jra	L153
1186  0353               L363:
1187                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
1189  0353 7b02          	ld	a,(OFST+0,sp)
1190  0355 43            	cpl	a
1191  0356 c45249        	and	a,21065
1192  0359 c75249        	ld	21065,a
1193  035c               L153:
1194                     ; 260 }
1197  035c 5b04          	addw	sp,#4
1198  035e 81            	ret
1256                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1256                     ; 268 {
1257                     	switch	.text
1258  035f               _UART2_IrDAConfig:
1260  035f 88            	push	a
1261       00000000      OFST:	set	0
1264                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1266  0360 a101          	cp	a,#1
1267  0362 2703          	jreq	L401
1268  0364 4d            	tnz	a
1269  0365 2603          	jrne	L201
1270  0367               L401:
1271  0367 4f            	clr	a
1272  0368 2010          	jra	L601
1273  036a               L201:
1274  036a ae010d        	ldw	x,#269
1275  036d 89            	pushw	x
1276  036e ae0000        	ldw	x,#0
1277  0371 89            	pushw	x
1278  0372 ae0008        	ldw	x,#L302
1279  0375 cd0000        	call	_assert_failed
1281  0378 5b04          	addw	sp,#4
1282  037a               L601:
1283                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1285  037a 0d01          	tnz	(OFST+1,sp)
1286  037c 2706          	jreq	L514
1287                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1289  037e 72145248      	bset	21064,#2
1291  0382 2004          	jra	L714
1292  0384               L514:
1293                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1295  0384 72155248      	bres	21064,#2
1296  0388               L714:
1297                     ; 279 }
1300  0388 84            	pop	a
1301  0389 81            	ret
1337                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1337                     ; 288 {
1338                     	switch	.text
1339  038a               _UART2_IrDACmd:
1341  038a 88            	push	a
1342       00000000      OFST:	set	0
1345                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1347  038b 4d            	tnz	a
1348  038c 2704          	jreq	L411
1349  038e a101          	cp	a,#1
1350  0390 2603          	jrne	L211
1351  0392               L411:
1352  0392 4f            	clr	a
1353  0393 2010          	jra	L611
1354  0395               L211:
1355  0395 ae0122        	ldw	x,#290
1356  0398 89            	pushw	x
1357  0399 ae0000        	ldw	x,#0
1358  039c 89            	pushw	x
1359  039d ae0008        	ldw	x,#L302
1360  03a0 cd0000        	call	_assert_failed
1362  03a3 5b04          	addw	sp,#4
1363  03a5               L611:
1364                     ; 292     if (NewState != DISABLE)
1366  03a5 0d01          	tnz	(OFST+1,sp)
1367  03a7 2706          	jreq	L734
1368                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1370  03a9 72125248      	bset	21064,#1
1372  03ad 2004          	jra	L144
1373  03af               L734:
1374                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1376  03af 72135248      	bres	21064,#1
1377  03b3               L144:
1378                     ; 302 }
1381  03b3 84            	pop	a
1382  03b4 81            	ret
1442                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1442                     ; 312 {
1443                     	switch	.text
1444  03b5               _UART2_LINBreakDetectionConfig:
1446  03b5 88            	push	a
1447       00000000      OFST:	set	0
1450                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1452  03b6 4d            	tnz	a
1453  03b7 2704          	jreq	L421
1454  03b9 a101          	cp	a,#1
1455  03bb 2603          	jrne	L221
1456  03bd               L421:
1457  03bd 4f            	clr	a
1458  03be 2010          	jra	L621
1459  03c0               L221:
1460  03c0 ae013a        	ldw	x,#314
1461  03c3 89            	pushw	x
1462  03c4 ae0000        	ldw	x,#0
1463  03c7 89            	pushw	x
1464  03c8 ae0008        	ldw	x,#L302
1465  03cb cd0000        	call	_assert_failed
1467  03ce 5b04          	addw	sp,#4
1468  03d0               L621:
1469                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1471  03d0 0d01          	tnz	(OFST+1,sp)
1472  03d2 2706          	jreq	L174
1473                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1475  03d4 721a5247      	bset	21063,#5
1477  03d8 2004          	jra	L374
1478  03da               L174:
1479                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1481  03da 721b5247      	bres	21063,#5
1482  03de               L374:
1483                     ; 324 }
1486  03de 84            	pop	a
1487  03df 81            	ret
1609                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1609                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1609                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1609                     ; 339 {
1610                     	switch	.text
1611  03e0               _UART2_LINConfig:
1613  03e0 89            	pushw	x
1614       00000000      OFST:	set	0
1617                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1619  03e1 9e            	ld	a,xh
1620  03e2 4d            	tnz	a
1621  03e3 2705          	jreq	L431
1622  03e5 9e            	ld	a,xh
1623  03e6 a101          	cp	a,#1
1624  03e8 2603          	jrne	L231
1625  03ea               L431:
1626  03ea 4f            	clr	a
1627  03eb 2010          	jra	L631
1628  03ed               L231:
1629  03ed ae0155        	ldw	x,#341
1630  03f0 89            	pushw	x
1631  03f1 ae0000        	ldw	x,#0
1632  03f4 89            	pushw	x
1633  03f5 ae0008        	ldw	x,#L302
1634  03f8 cd0000        	call	_assert_failed
1636  03fb 5b04          	addw	sp,#4
1637  03fd               L631:
1638                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1640  03fd 7b02          	ld	a,(OFST+2,sp)
1641  03ff a101          	cp	a,#1
1642  0401 2704          	jreq	L241
1643  0403 0d02          	tnz	(OFST+2,sp)
1644  0405 2603          	jrne	L041
1645  0407               L241:
1646  0407 4f            	clr	a
1647  0408 2010          	jra	L441
1648  040a               L041:
1649  040a ae0156        	ldw	x,#342
1650  040d 89            	pushw	x
1651  040e ae0000        	ldw	x,#0
1652  0411 89            	pushw	x
1653  0412 ae0008        	ldw	x,#L302
1654  0415 cd0000        	call	_assert_failed
1656  0418 5b04          	addw	sp,#4
1657  041a               L441:
1658                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1660  041a 0d05          	tnz	(OFST+5,sp)
1661  041c 2706          	jreq	L051
1662  041e 7b05          	ld	a,(OFST+5,sp)
1663  0420 a101          	cp	a,#1
1664  0422 2603          	jrne	L641
1665  0424               L051:
1666  0424 4f            	clr	a
1667  0425 2010          	jra	L251
1668  0427               L641:
1669  0427 ae0157        	ldw	x,#343
1670  042a 89            	pushw	x
1671  042b ae0000        	ldw	x,#0
1672  042e 89            	pushw	x
1673  042f ae0008        	ldw	x,#L302
1674  0432 cd0000        	call	_assert_failed
1676  0435 5b04          	addw	sp,#4
1677  0437               L251:
1678                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1680  0437 0d01          	tnz	(OFST+1,sp)
1681  0439 2706          	jreq	L355
1682                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1684  043b 721a5249      	bset	21065,#5
1686  043f 2004          	jra	L555
1687  0441               L355:
1688                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1690  0441 721b5249      	bres	21065,#5
1691  0445               L555:
1692                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1694  0445 0d02          	tnz	(OFST+2,sp)
1695  0447 2706          	jreq	L755
1696                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1698  0449 72185249      	bset	21065,#4
1700  044d 2004          	jra	L165
1701  044f               L755:
1702                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1704  044f 72195249      	bres	21065,#4
1705  0453               L165:
1706                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1708  0453 0d05          	tnz	(OFST+5,sp)
1709  0455 2706          	jreq	L365
1710                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1712  0457 721e5249      	bset	21065,#7
1714  045b 2004          	jra	L565
1715  045d               L365:
1716                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1718  045d 721f5249      	bres	21065,#7
1719  0461               L565:
1720                     ; 371 }
1723  0461 85            	popw	x
1724  0462 81            	ret
1760                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1760                     ; 380 {
1761                     	switch	.text
1762  0463               _UART2_LINCmd:
1764  0463 88            	push	a
1765       00000000      OFST:	set	0
1768                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1770  0464 4d            	tnz	a
1771  0465 2704          	jreq	L061
1772  0467 a101          	cp	a,#1
1773  0469 2603          	jrne	L651
1774  046b               L061:
1775  046b 4f            	clr	a
1776  046c 2010          	jra	L261
1777  046e               L651:
1778  046e ae017d        	ldw	x,#381
1779  0471 89            	pushw	x
1780  0472 ae0000        	ldw	x,#0
1781  0475 89            	pushw	x
1782  0476 ae0008        	ldw	x,#L302
1783  0479 cd0000        	call	_assert_failed
1785  047c 5b04          	addw	sp,#4
1786  047e               L261:
1787                     ; 383     if (NewState != DISABLE)
1789  047e 0d01          	tnz	(OFST+1,sp)
1790  0480 2706          	jreq	L506
1791                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1793  0482 721c5246      	bset	21062,#6
1795  0486 2004          	jra	L706
1796  0488               L506:
1797                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1799  0488 721d5246      	bres	21062,#6
1800  048c               L706:
1801                     ; 393 }
1804  048c 84            	pop	a
1805  048d 81            	ret
1841                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1841                     ; 401 {
1842                     	switch	.text
1843  048e               _UART2_SmartCardCmd:
1845  048e 88            	push	a
1846       00000000      OFST:	set	0
1849                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1851  048f 4d            	tnz	a
1852  0490 2704          	jreq	L071
1853  0492 a101          	cp	a,#1
1854  0494 2603          	jrne	L661
1855  0496               L071:
1856  0496 4f            	clr	a
1857  0497 2010          	jra	L271
1858  0499               L661:
1859  0499 ae0193        	ldw	x,#403
1860  049c 89            	pushw	x
1861  049d ae0000        	ldw	x,#0
1862  04a0 89            	pushw	x
1863  04a1 ae0008        	ldw	x,#L302
1864  04a4 cd0000        	call	_assert_failed
1866  04a7 5b04          	addw	sp,#4
1867  04a9               L271:
1868                     ; 405     if (NewState != DISABLE)
1870  04a9 0d01          	tnz	(OFST+1,sp)
1871  04ab 2706          	jreq	L726
1872                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1874  04ad 721a5248      	bset	21064,#5
1876  04b1 2004          	jra	L136
1877  04b3               L726:
1878                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1880  04b3 721b5248      	bres	21064,#5
1881  04b7               L136:
1882                     ; 415 }
1885  04b7 84            	pop	a
1886  04b8 81            	ret
1923                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1923                     ; 424 {
1924                     	switch	.text
1925  04b9               _UART2_SmartCardNACKCmd:
1927  04b9 88            	push	a
1928       00000000      OFST:	set	0
1931                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1933  04ba 4d            	tnz	a
1934  04bb 2704          	jreq	L002
1935  04bd a101          	cp	a,#1
1936  04bf 2603          	jrne	L671
1937  04c1               L002:
1938  04c1 4f            	clr	a
1939  04c2 2010          	jra	L202
1940  04c4               L671:
1941  04c4 ae01aa        	ldw	x,#426
1942  04c7 89            	pushw	x
1943  04c8 ae0000        	ldw	x,#0
1944  04cb 89            	pushw	x
1945  04cc ae0008        	ldw	x,#L302
1946  04cf cd0000        	call	_assert_failed
1948  04d2 5b04          	addw	sp,#4
1949  04d4               L202:
1950                     ; 428     if (NewState != DISABLE)
1952  04d4 0d01          	tnz	(OFST+1,sp)
1953  04d6 2706          	jreq	L156
1954                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1956  04d8 72185248      	bset	21064,#4
1958  04dc 2004          	jra	L356
1959  04de               L156:
1960                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1962  04de 72195248      	bres	21064,#4
1963  04e2               L356:
1964                     ; 438 }
1967  04e2 84            	pop	a
1968  04e3 81            	ret
2026                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
2026                     ; 447 {
2027                     	switch	.text
2028  04e4               _UART2_WakeUpConfig:
2030  04e4 88            	push	a
2031       00000000      OFST:	set	0
2034                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
2036  04e5 4d            	tnz	a
2037  04e6 2704          	jreq	L012
2038  04e8 a108          	cp	a,#8
2039  04ea 2603          	jrne	L602
2040  04ec               L012:
2041  04ec 4f            	clr	a
2042  04ed 2010          	jra	L212
2043  04ef               L602:
2044  04ef ae01c0        	ldw	x,#448
2045  04f2 89            	pushw	x
2046  04f3 ae0000        	ldw	x,#0
2047  04f6 89            	pushw	x
2048  04f7 ae0008        	ldw	x,#L302
2049  04fa cd0000        	call	_assert_failed
2051  04fd 5b04          	addw	sp,#4
2052  04ff               L212:
2053                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
2055  04ff 72175244      	bres	21060,#3
2056                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
2058  0503 c65244        	ld	a,21060
2059  0506 1a01          	or	a,(OFST+1,sp)
2060  0508 c75244        	ld	21060,a
2061                     ; 452 }
2064  050b 84            	pop	a
2065  050c 81            	ret
2102                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
2102                     ; 461 {
2103                     	switch	.text
2104  050d               _UART2_ReceiverWakeUpCmd:
2106  050d 88            	push	a
2107       00000000      OFST:	set	0
2110                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2112  050e 4d            	tnz	a
2113  050f 2704          	jreq	L022
2114  0511 a101          	cp	a,#1
2115  0513 2603          	jrne	L612
2116  0515               L022:
2117  0515 4f            	clr	a
2118  0516 2010          	jra	L222
2119  0518               L612:
2120  0518 ae01ce        	ldw	x,#462
2121  051b 89            	pushw	x
2122  051c ae0000        	ldw	x,#0
2123  051f 89            	pushw	x
2124  0520 ae0008        	ldw	x,#L302
2125  0523 cd0000        	call	_assert_failed
2127  0526 5b04          	addw	sp,#4
2128  0528               L222:
2129                     ; 464     if (NewState != DISABLE)
2131  0528 0d01          	tnz	(OFST+1,sp)
2132  052a 2706          	jreq	L127
2133                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
2135  052c 72125245      	bset	21061,#1
2137  0530 2004          	jra	L327
2138  0532               L127:
2139                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
2141  0532 72135245      	bres	21061,#1
2142  0536               L327:
2143                     ; 474 }
2146  0536 84            	pop	a
2147  0537 81            	ret
2170                     ; 481 uint8_t UART2_ReceiveData8(void)
2170                     ; 482 {
2171                     	switch	.text
2172  0538               _UART2_ReceiveData8:
2176                     ; 483     return ((uint8_t)UART2->DR);
2178  0538 c65241        	ld	a,21057
2181  053b 81            	ret
2215                     ; 491 uint16_t UART2_ReceiveData9(void)
2215                     ; 492 {
2216                     	switch	.text
2217  053c               _UART2_ReceiveData9:
2219  053c 89            	pushw	x
2220       00000002      OFST:	set	2
2223                     ; 493   uint16_t temp = 0;
2225                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
2227  053d c65244        	ld	a,21060
2228  0540 5f            	clrw	x
2229  0541 a480          	and	a,#128
2230  0543 5f            	clrw	x
2231  0544 02            	rlwa	x,a
2232  0545 58            	sllw	x
2233  0546 1f01          	ldw	(OFST-1,sp),x
2234                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
2236  0548 c65241        	ld	a,21057
2237  054b 5f            	clrw	x
2238  054c 97            	ld	xl,a
2239  054d 01            	rrwa	x,a
2240  054e 1a02          	or	a,(OFST+0,sp)
2241  0550 01            	rrwa	x,a
2242  0551 1a01          	or	a,(OFST-1,sp)
2243  0553 01            	rrwa	x,a
2244  0554 01            	rrwa	x,a
2245  0555 a4ff          	and	a,#255
2246  0557 01            	rrwa	x,a
2247  0558 a401          	and	a,#1
2248  055a 01            	rrwa	x,a
2251  055b 5b02          	addw	sp,#2
2252  055d 81            	ret
2286                     ; 505 void UART2_SendData8(uint8_t Data)
2286                     ; 506 {
2287                     	switch	.text
2288  055e               _UART2_SendData8:
2292                     ; 508     UART2->DR = Data;
2294  055e c75241        	ld	21057,a
2295                     ; 509 }
2298  0561 81            	ret
2332                     ; 516 void UART2_SendData9(uint16_t Data)
2332                     ; 517 {
2333                     	switch	.text
2334  0562               _UART2_SendData9:
2336  0562 89            	pushw	x
2337       00000000      OFST:	set	0
2340                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
2342  0563 721d5244      	bres	21060,#6
2343                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
2345  0567 54            	srlw	x
2346  0568 54            	srlw	x
2347  0569 9f            	ld	a,xl
2348  056a a440          	and	a,#64
2349  056c ca5244        	or	a,21060
2350  056f c75244        	ld	21060,a
2351                     ; 525     UART2->DR   = (uint8_t)(Data);                    
2353  0572 7b02          	ld	a,(OFST+2,sp)
2354  0574 c75241        	ld	21057,a
2355                     ; 527 }
2358  0577 85            	popw	x
2359  0578 81            	ret
2382                     ; 534 void UART2_SendBreak(void)
2382                     ; 535 {
2383                     	switch	.text
2384  0579               _UART2_SendBreak:
2388                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
2390  0579 72105245      	bset	21061,#0
2391                     ; 537 }
2394  057d 81            	ret
2429                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
2429                     ; 545 {
2430                     	switch	.text
2431  057e               _UART2_SetAddress:
2433  057e 88            	push	a
2434       00000000      OFST:	set	0
2437                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2439  057f a110          	cp	a,#16
2440  0581 2403          	jruge	L042
2441  0583 4f            	clr	a
2442  0584 2010          	jra	L242
2443  0586               L042:
2444  0586 ae0223        	ldw	x,#547
2445  0589 89            	pushw	x
2446  058a ae0000        	ldw	x,#0
2447  058d 89            	pushw	x
2448  058e ae0008        	ldw	x,#L302
2449  0591 cd0000        	call	_assert_failed
2451  0594 5b04          	addw	sp,#4
2452  0596               L242:
2453                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2455  0596 c65247        	ld	a,21063
2456  0599 a4f0          	and	a,#240
2457  059b c75247        	ld	21063,a
2458                     ; 552     UART2->CR4 |= UART2_Address;
2460  059e c65247        	ld	a,21063
2461  05a1 1a01          	or	a,(OFST+1,sp)
2462  05a3 c75247        	ld	21063,a
2463                     ; 553 }
2466  05a6 84            	pop	a
2467  05a7 81            	ret
2501                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2501                     ; 562 {
2502                     	switch	.text
2503  05a8               _UART2_SetGuardTime:
2507                     ; 564     UART2->GTR = UART2_GuardTime;
2509  05a8 c7524a        	ld	21066,a
2510                     ; 565 }
2513  05ab 81            	ret
2547                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2547                     ; 590 {
2548                     	switch	.text
2549  05ac               _UART2_SetPrescaler:
2553                     ; 592     UART2->PSCR = UART2_Prescaler;
2555  05ac c7524b        	ld	21067,a
2556                     ; 593 }
2559  05af 81            	ret
2717                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2717                     ; 602 {
2718                     	switch	.text
2719  05b0               _UART2_GetFlagStatus:
2721  05b0 89            	pushw	x
2722  05b1 88            	push	a
2723       00000001      OFST:	set	1
2726                     ; 603     FlagStatus status = RESET;
2728                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2730  05b2 a30080        	cpw	x,#128
2731  05b5 2737          	jreq	L452
2732  05b7 a30040        	cpw	x,#64
2733  05ba 2732          	jreq	L452
2734  05bc a30020        	cpw	x,#32
2735  05bf 272d          	jreq	L452
2736  05c1 a30010        	cpw	x,#16
2737  05c4 2728          	jreq	L452
2738  05c6 a30008        	cpw	x,#8
2739  05c9 2723          	jreq	L452
2740  05cb a30004        	cpw	x,#4
2741  05ce 271e          	jreq	L452
2742  05d0 a30002        	cpw	x,#2
2743  05d3 2719          	jreq	L452
2744  05d5 a30001        	cpw	x,#1
2745  05d8 2714          	jreq	L452
2746  05da a30101        	cpw	x,#257
2747  05dd 270f          	jreq	L452
2748  05df a30301        	cpw	x,#769
2749  05e2 270a          	jreq	L452
2750  05e4 a30302        	cpw	x,#770
2751  05e7 2705          	jreq	L452
2752  05e9 a30210        	cpw	x,#528
2753  05ec 2603          	jrne	L252
2754  05ee               L452:
2755  05ee 4f            	clr	a
2756  05ef 2010          	jra	L652
2757  05f1               L252:
2758  05f1 ae025e        	ldw	x,#606
2759  05f4 89            	pushw	x
2760  05f5 ae0000        	ldw	x,#0
2761  05f8 89            	pushw	x
2762  05f9 ae0008        	ldw	x,#L302
2763  05fc cd0000        	call	_assert_failed
2765  05ff 5b04          	addw	sp,#4
2766  0601               L652:
2767                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2769  0601 1e02          	ldw	x,(OFST+1,sp)
2770  0603 a30210        	cpw	x,#528
2771  0606 2611          	jrne	L7511
2772                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2774  0608 c65247        	ld	a,21063
2775  060b 1503          	bcp	a,(OFST+2,sp)
2776  060d 2706          	jreq	L1611
2777                     ; 614             status = SET;
2779  060f a601          	ld	a,#1
2780  0611 6b01          	ld	(OFST+0,sp),a
2782  0613 2039          	jra	L5611
2783  0615               L1611:
2784                     ; 619             status = RESET;
2786  0615 0f01          	clr	(OFST+0,sp)
2787  0617 2035          	jra	L5611
2788  0619               L7511:
2789                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2791  0619 1e02          	ldw	x,(OFST+1,sp)
2792  061b a30101        	cpw	x,#257
2793  061e 2611          	jrne	L7611
2794                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2796  0620 c65245        	ld	a,21061
2797  0623 1503          	bcp	a,(OFST+2,sp)
2798  0625 2706          	jreq	L1711
2799                     ; 627             status = SET;
2801  0627 a601          	ld	a,#1
2802  0629 6b01          	ld	(OFST+0,sp),a
2804  062b 2021          	jra	L5611
2805  062d               L1711:
2806                     ; 632             status = RESET;
2808  062d 0f01          	clr	(OFST+0,sp)
2809  062f 201d          	jra	L5611
2810  0631               L7611:
2811                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2813  0631 1e02          	ldw	x,(OFST+1,sp)
2814  0633 a30302        	cpw	x,#770
2815  0636 2707          	jreq	L1021
2817  0638 1e02          	ldw	x,(OFST+1,sp)
2818  063a a30301        	cpw	x,#769
2819  063d 2614          	jrne	L7711
2820  063f               L1021:
2821                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2823  063f c65249        	ld	a,21065
2824  0642 1503          	bcp	a,(OFST+2,sp)
2825  0644 2706          	jreq	L3021
2826                     ; 640             status = SET;
2828  0646 a601          	ld	a,#1
2829  0648 6b01          	ld	(OFST+0,sp),a
2831  064a 2002          	jra	L5611
2832  064c               L3021:
2833                     ; 645             status = RESET;
2835  064c 0f01          	clr	(OFST+0,sp)
2836  064e               L5611:
2837                     ; 663     return  status;
2839  064e 7b01          	ld	a,(OFST+0,sp)
2842  0650 5b03          	addw	sp,#3
2843  0652 81            	ret
2844  0653               L7711:
2845                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2847  0653 c65240        	ld	a,21056
2848  0656 1503          	bcp	a,(OFST+2,sp)
2849  0658 2706          	jreq	L1121
2850                     ; 653             status = SET;
2852  065a a601          	ld	a,#1
2853  065c 6b01          	ld	(OFST+0,sp),a
2855  065e 20ee          	jra	L5611
2856  0660               L1121:
2857                     ; 658             status = RESET;
2859  0660 0f01          	clr	(OFST+0,sp)
2860  0662 20ea          	jra	L5611
2896                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2896                     ; 694 {
2897                     	switch	.text
2898  0664               _UART2_ClearFlag:
2900  0664 89            	pushw	x
2901       00000000      OFST:	set	0
2904                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2906  0665 a30020        	cpw	x,#32
2907  0668 270f          	jreq	L462
2908  066a a30302        	cpw	x,#770
2909  066d 270a          	jreq	L462
2910  066f a30301        	cpw	x,#769
2911  0672 2705          	jreq	L462
2912  0674 a30210        	cpw	x,#528
2913  0677 2603          	jrne	L262
2914  0679               L462:
2915  0679 4f            	clr	a
2916  067a 2010          	jra	L662
2917  067c               L262:
2918  067c ae02b7        	ldw	x,#695
2919  067f 89            	pushw	x
2920  0680 ae0000        	ldw	x,#0
2921  0683 89            	pushw	x
2922  0684 ae0008        	ldw	x,#L302
2923  0687 cd0000        	call	_assert_failed
2925  068a 5b04          	addw	sp,#4
2926  068c               L662:
2927                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2929  068c 1e01          	ldw	x,(OFST+1,sp)
2930  068e a30020        	cpw	x,#32
2931  0691 2606          	jrne	L3321
2932                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2934  0693 35df5240      	mov	21056,#223
2936  0697 201e          	jra	L5321
2937  0699               L3321:
2938                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2940  0699 1e01          	ldw	x,(OFST+1,sp)
2941  069b a30210        	cpw	x,#528
2942  069e 2606          	jrne	L7321
2943                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2945  06a0 72195247      	bres	21063,#4
2947  06a4 2011          	jra	L5321
2948  06a6               L7321:
2949                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2951  06a6 1e01          	ldw	x,(OFST+1,sp)
2952  06a8 a30302        	cpw	x,#770
2953  06ab 2606          	jrne	L3421
2954                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2956  06ad 72135249      	bres	21065,#1
2958  06b1 2004          	jra	L5321
2959  06b3               L3421:
2960                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2962  06b3 72115249      	bres	21065,#0
2963  06b7               L5321:
2964                     ; 717 }
2967  06b7 85            	popw	x
2968  06b8 81            	ret
3051                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
3051                     ; 733 {
3052                     	switch	.text
3053  06b9               _UART2_GetITStatus:
3055  06b9 89            	pushw	x
3056  06ba 89            	pushw	x
3057       00000002      OFST:	set	2
3060                     ; 734     ITStatus pendingbitstatus = RESET;
3062                     ; 735     uint8_t itpos = 0;
3064                     ; 736     uint8_t itmask1 = 0;
3066                     ; 737     uint8_t itmask2 = 0;
3068                     ; 738     uint8_t enablestatus = 0;
3070                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
3072  06bb a30277        	cpw	x,#631
3073  06be 2723          	jreq	L472
3074  06c0 a30266        	cpw	x,#614
3075  06c3 271e          	jreq	L472
3076  06c5 a30255        	cpw	x,#597
3077  06c8 2719          	jreq	L472
3078  06ca a30244        	cpw	x,#580
3079  06cd 2714          	jreq	L472
3080  06cf a30235        	cpw	x,#565
3081  06d2 270f          	jreq	L472
3082  06d4 a30346        	cpw	x,#838
3083  06d7 270a          	jreq	L472
3084  06d9 a30412        	cpw	x,#1042
3085  06dc 2705          	jreq	L472
3086  06de a30100        	cpw	x,#256
3087  06e1 2603          	jrne	L272
3088  06e3               L472:
3089  06e3 4f            	clr	a
3090  06e4 2010          	jra	L672
3091  06e6               L272:
3092  06e6 ae02e5        	ldw	x,#741
3093  06e9 89            	pushw	x
3094  06ea ae0000        	ldw	x,#0
3095  06ed 89            	pushw	x
3096  06ee ae0008        	ldw	x,#L302
3097  06f1 cd0000        	call	_assert_failed
3099  06f4 5b04          	addw	sp,#4
3100  06f6               L672:
3101                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
3103  06f6 7b04          	ld	a,(OFST+2,sp)
3104  06f8 a40f          	and	a,#15
3105  06fa 5f            	clrw	x
3106  06fb 97            	ld	xl,a
3107  06fc a601          	ld	a,#1
3108  06fe 5d            	tnzw	x
3109  06ff 2704          	jreq	L003
3110  0701               L203:
3111  0701 48            	sll	a
3112  0702 5a            	decw	x
3113  0703 26fc          	jrne	L203
3114  0705               L003:
3115  0705 6b01          	ld	(OFST-1,sp),a
3116                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
3118  0707 7b04          	ld	a,(OFST+2,sp)
3119  0709 4e            	swap	a
3120  070a a40f          	and	a,#15
3121  070c 6b02          	ld	(OFST+0,sp),a
3122                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
3124  070e 7b02          	ld	a,(OFST+0,sp)
3125  0710 5f            	clrw	x
3126  0711 97            	ld	xl,a
3127  0712 a601          	ld	a,#1
3128  0714 5d            	tnzw	x
3129  0715 2704          	jreq	L403
3130  0717               L603:
3131  0717 48            	sll	a
3132  0718 5a            	decw	x
3133  0719 26fc          	jrne	L603
3134  071b               L403:
3135  071b 6b02          	ld	(OFST+0,sp),a
3136                     ; 751     if (UART2_IT == UART2_IT_PE)
3138  071d 1e03          	ldw	x,(OFST+1,sp)
3139  071f a30100        	cpw	x,#256
3140  0722 261c          	jrne	L1131
3141                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
3143  0724 c65244        	ld	a,21060
3144  0727 1402          	and	a,(OFST+0,sp)
3145  0729 6b02          	ld	(OFST+0,sp),a
3146                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3148  072b c65240        	ld	a,21056
3149  072e 1501          	bcp	a,(OFST-1,sp)
3150  0730 270a          	jreq	L3131
3152  0732 0d02          	tnz	(OFST+0,sp)
3153  0734 2706          	jreq	L3131
3154                     ; 760             pendingbitstatus = SET;
3156  0736 a601          	ld	a,#1
3157  0738 6b02          	ld	(OFST+0,sp),a
3159  073a 2064          	jra	L7131
3160  073c               L3131:
3161                     ; 765             pendingbitstatus = RESET;
3163  073c 0f02          	clr	(OFST+0,sp)
3164  073e 2060          	jra	L7131
3165  0740               L1131:
3166                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
3168  0740 1e03          	ldw	x,(OFST+1,sp)
3169  0742 a30346        	cpw	x,#838
3170  0745 261c          	jrne	L1231
3171                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
3173  0747 c65247        	ld	a,21063
3174  074a 1402          	and	a,(OFST+0,sp)
3175  074c 6b02          	ld	(OFST+0,sp),a
3176                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
3178  074e c65247        	ld	a,21063
3179  0751 1501          	bcp	a,(OFST-1,sp)
3180  0753 270a          	jreq	L3231
3182  0755 0d02          	tnz	(OFST+0,sp)
3183  0757 2706          	jreq	L3231
3184                     ; 776             pendingbitstatus = SET;
3186  0759 a601          	ld	a,#1
3187  075b 6b02          	ld	(OFST+0,sp),a
3189  075d 2041          	jra	L7131
3190  075f               L3231:
3191                     ; 781             pendingbitstatus = RESET;
3193  075f 0f02          	clr	(OFST+0,sp)
3194  0761 203d          	jra	L7131
3195  0763               L1231:
3196                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
3198  0763 1e03          	ldw	x,(OFST+1,sp)
3199  0765 a30412        	cpw	x,#1042
3200  0768 261c          	jrne	L1331
3201                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
3203  076a c65249        	ld	a,21065
3204  076d 1402          	and	a,(OFST+0,sp)
3205  076f 6b02          	ld	(OFST+0,sp),a
3206                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
3208  0771 c65249        	ld	a,21065
3209  0774 1501          	bcp	a,(OFST-1,sp)
3210  0776 270a          	jreq	L3331
3212  0778 0d02          	tnz	(OFST+0,sp)
3213  077a 2706          	jreq	L3331
3214                     ; 792             pendingbitstatus = SET;
3216  077c a601          	ld	a,#1
3217  077e 6b02          	ld	(OFST+0,sp),a
3219  0780 201e          	jra	L7131
3220  0782               L3331:
3221                     ; 797             pendingbitstatus = RESET;
3223  0782 0f02          	clr	(OFST+0,sp)
3224  0784 201a          	jra	L7131
3225  0786               L1331:
3226                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
3228  0786 c65245        	ld	a,21061
3229  0789 1402          	and	a,(OFST+0,sp)
3230  078b 6b02          	ld	(OFST+0,sp),a
3231                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
3233  078d c65240        	ld	a,21056
3234  0790 1501          	bcp	a,(OFST-1,sp)
3235  0792 270a          	jreq	L1431
3237  0794 0d02          	tnz	(OFST+0,sp)
3238  0796 2706          	jreq	L1431
3239                     ; 808             pendingbitstatus = SET;
3241  0798 a601          	ld	a,#1
3242  079a 6b02          	ld	(OFST+0,sp),a
3244  079c 2002          	jra	L7131
3245  079e               L1431:
3246                     ; 813             pendingbitstatus = RESET;
3248  079e 0f02          	clr	(OFST+0,sp)
3249  07a0               L7131:
3250                     ; 817     return  pendingbitstatus;
3252  07a0 7b02          	ld	a,(OFST+0,sp)
3255  07a2 5b04          	addw	sp,#4
3256  07a4 81            	ret
3293                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
3293                     ; 847 {
3294                     	switch	.text
3295  07a5               _UART2_ClearITPendingBit:
3297  07a5 89            	pushw	x
3298       00000000      OFST:	set	0
3301                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
3303  07a6 a30255        	cpw	x,#597
3304  07a9 270a          	jreq	L413
3305  07ab a30412        	cpw	x,#1042
3306  07ae 2705          	jreq	L413
3307  07b0 a30346        	cpw	x,#838
3308  07b3 2603          	jrne	L213
3309  07b5               L413:
3310  07b5 4f            	clr	a
3311  07b6 2010          	jra	L613
3312  07b8               L213:
3313  07b8 ae0350        	ldw	x,#848
3314  07bb 89            	pushw	x
3315  07bc ae0000        	ldw	x,#0
3316  07bf 89            	pushw	x
3317  07c0 ae0008        	ldw	x,#L302
3318  07c3 cd0000        	call	_assert_failed
3320  07c6 5b04          	addw	sp,#4
3321  07c8               L613:
3322                     ; 851     if (UART2_IT == UART2_IT_RXNE)
3324  07c8 1e01          	ldw	x,(OFST+1,sp)
3325  07ca a30255        	cpw	x,#597
3326  07cd 2606          	jrne	L3631
3327                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
3329  07cf 35df5240      	mov	21056,#223
3331  07d3 2011          	jra	L5631
3332  07d5               L3631:
3333                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
3335  07d5 1e01          	ldw	x,(OFST+1,sp)
3336  07d7 a30346        	cpw	x,#838
3337  07da 2606          	jrne	L7631
3338                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
3340  07dc 72195247      	bres	21063,#4
3342  07e0 2004          	jra	L5631
3343  07e2               L7631:
3344                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
3346  07e2 72135249      	bres	21065,#1
3347  07e6               L5631:
3348                     ; 865 }
3351  07e6 85            	popw	x
3352  07e7 81            	ret
3365                     	xdef	_UART2_ClearITPendingBit
3366                     	xdef	_UART2_GetITStatus
3367                     	xdef	_UART2_ClearFlag
3368                     	xdef	_UART2_GetFlagStatus
3369                     	xdef	_UART2_SetPrescaler
3370                     	xdef	_UART2_SetGuardTime
3371                     	xdef	_UART2_SetAddress
3372                     	xdef	_UART2_SendBreak
3373                     	xdef	_UART2_SendData9
3374                     	xdef	_UART2_SendData8
3375                     	xdef	_UART2_ReceiveData9
3376                     	xdef	_UART2_ReceiveData8
3377                     	xdef	_UART2_ReceiverWakeUpCmd
3378                     	xdef	_UART2_WakeUpConfig
3379                     	xdef	_UART2_SmartCardNACKCmd
3380                     	xdef	_UART2_SmartCardCmd
3381                     	xdef	_UART2_LINCmd
3382                     	xdef	_UART2_LINConfig
3383                     	xdef	_UART2_LINBreakDetectionConfig
3384                     	xdef	_UART2_IrDACmd
3385                     	xdef	_UART2_IrDAConfig
3386                     	xdef	_UART2_ITConfig
3387                     	xdef	_UART2_Cmd
3388                     	xdef	_UART2_Init
3389                     	xdef	_UART2_DeInit
3390                     	xref	_assert_failed
3391                     	xref	_CLK_GetClockFreq
3392                     	switch	.const
3393  0008               L302:
3394  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_u"
3395  001a 617274322e63  	dc.b	"art2.c",0
3396                     	xref.b	c_lreg
3397                     	xref.b	c_x
3417                     	xref	c_lursh
3418                     	xref	c_lsub
3419                     	xref	c_smul
3420                     	xref	c_ludv
3421                     	xref	c_rtol
3422                     	xref	c_llsh
3423                     	xref	c_lcmp
3424                     	xref	c_ltor
3425                     	end

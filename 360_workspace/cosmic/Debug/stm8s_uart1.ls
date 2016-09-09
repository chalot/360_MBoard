   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 46 void UART1_DeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _UART1_DeInit:
  50                     ; 50     (void)UART1->SR;
  52  0000 c65230        	ld	a,21040
  53                     ; 51     (void)UART1->DR;
  55  0003 c65231        	ld	a,21041
  56                     ; 53     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  58  0006 725f5233      	clr	21043
  59                     ; 54     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  61  000a 725f5232      	clr	21042
  62                     ; 56     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  64  000e 725f5234      	clr	21044
  65                     ; 57     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  67  0012 725f5235      	clr	21045
  68                     ; 58     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  70  0016 725f5236      	clr	21046
  71                     ; 59     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  73  001a 725f5237      	clr	21047
  74                     ; 60     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  76  001e 725f5238      	clr	21048
  77                     ; 62     UART1->GTR = UART1_GTR_RESET_VALUE;
  79  0022 725f5239      	clr	21049
  80                     ; 63     UART1->PSCR = UART1_PSCR_RESET_VALUE;
  82  0026 725f523a      	clr	21050
  83                     ; 64 }
  86  002a 81            	ret
 384                     .const:	section	.text
 385  0000               L21:
 386  0000 00098969      	dc.l	625001
 387  0004               L25:
 388  0004 00000064      	dc.l	100
 389                     ; 83 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 389                     ; 84                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 389                     ; 85                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 389                     ; 86 {
 390                     	switch	.text
 391  002b               _UART1_Init:
 393  002b 520c          	subw	sp,#12
 394       0000000c      OFST:	set	12
 397                     ; 87     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 401                     ; 90     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 403  002d 96            	ldw	x,sp
 404  002e 1c000f        	addw	x,#OFST+3
 405  0031 cd0000        	call	c_ltor
 407  0034 ae0000        	ldw	x,#L21
 408  0037 cd0000        	call	c_lcmp
 410  003a 2403          	jruge	L01
 411  003c 4f            	clr	a
 412  003d 2010          	jra	L41
 413  003f               L01:
 414  003f ae005a        	ldw	x,#90
 415  0042 89            	pushw	x
 416  0043 ae0000        	ldw	x,#0
 417  0046 89            	pushw	x
 418  0047 ae0008        	ldw	x,#L561
 419  004a cd0000        	call	_assert_failed
 421  004d 5b04          	addw	sp,#4
 422  004f               L41:
 423                     ; 91     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 425  004f 0d13          	tnz	(OFST+7,sp)
 426  0051 2706          	jreq	L02
 427  0053 7b13          	ld	a,(OFST+7,sp)
 428  0055 a110          	cp	a,#16
 429  0057 2603          	jrne	L61
 430  0059               L02:
 431  0059 4f            	clr	a
 432  005a 2010          	jra	L22
 433  005c               L61:
 434  005c ae005b        	ldw	x,#91
 435  005f 89            	pushw	x
 436  0060 ae0000        	ldw	x,#0
 437  0063 89            	pushw	x
 438  0064 ae0008        	ldw	x,#L561
 439  0067 cd0000        	call	_assert_failed
 441  006a 5b04          	addw	sp,#4
 442  006c               L22:
 443                     ; 92     assert_param(IS_UART1_STOPBITS_OK(StopBits));
 445  006c 0d14          	tnz	(OFST+8,sp)
 446  006e 2712          	jreq	L62
 447  0070 7b14          	ld	a,(OFST+8,sp)
 448  0072 a110          	cp	a,#16
 449  0074 270c          	jreq	L62
 450  0076 7b14          	ld	a,(OFST+8,sp)
 451  0078 a120          	cp	a,#32
 452  007a 2706          	jreq	L62
 453  007c 7b14          	ld	a,(OFST+8,sp)
 454  007e a130          	cp	a,#48
 455  0080 2603          	jrne	L42
 456  0082               L62:
 457  0082 4f            	clr	a
 458  0083 2010          	jra	L03
 459  0085               L42:
 460  0085 ae005c        	ldw	x,#92
 461  0088 89            	pushw	x
 462  0089 ae0000        	ldw	x,#0
 463  008c 89            	pushw	x
 464  008d ae0008        	ldw	x,#L561
 465  0090 cd0000        	call	_assert_failed
 467  0093 5b04          	addw	sp,#4
 468  0095               L03:
 469                     ; 93     assert_param(IS_UART1_PARITY_OK(Parity));
 471  0095 0d15          	tnz	(OFST+9,sp)
 472  0097 270c          	jreq	L43
 473  0099 7b15          	ld	a,(OFST+9,sp)
 474  009b a104          	cp	a,#4
 475  009d 2706          	jreq	L43
 476  009f 7b15          	ld	a,(OFST+9,sp)
 477  00a1 a106          	cp	a,#6
 478  00a3 2603          	jrne	L23
 479  00a5               L43:
 480  00a5 4f            	clr	a
 481  00a6 2010          	jra	L63
 482  00a8               L23:
 483  00a8 ae005d        	ldw	x,#93
 484  00ab 89            	pushw	x
 485  00ac ae0000        	ldw	x,#0
 486  00af 89            	pushw	x
 487  00b0 ae0008        	ldw	x,#L561
 488  00b3 cd0000        	call	_assert_failed
 490  00b6 5b04          	addw	sp,#4
 491  00b8               L63:
 492                     ; 94     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 494  00b8 7b17          	ld	a,(OFST+11,sp)
 495  00ba a108          	cp	a,#8
 496  00bc 2730          	jreq	L24
 497  00be 7b17          	ld	a,(OFST+11,sp)
 498  00c0 a140          	cp	a,#64
 499  00c2 272a          	jreq	L24
 500  00c4 7b17          	ld	a,(OFST+11,sp)
 501  00c6 a104          	cp	a,#4
 502  00c8 2724          	jreq	L24
 503  00ca 7b17          	ld	a,(OFST+11,sp)
 504  00cc a180          	cp	a,#128
 505  00ce 271e          	jreq	L24
 506  00d0 7b17          	ld	a,(OFST+11,sp)
 507  00d2 a10c          	cp	a,#12
 508  00d4 2718          	jreq	L24
 509  00d6 7b17          	ld	a,(OFST+11,sp)
 510  00d8 a10c          	cp	a,#12
 511  00da 2712          	jreq	L24
 512  00dc 7b17          	ld	a,(OFST+11,sp)
 513  00de a144          	cp	a,#68
 514  00e0 270c          	jreq	L24
 515  00e2 7b17          	ld	a,(OFST+11,sp)
 516  00e4 a1c0          	cp	a,#192
 517  00e6 2706          	jreq	L24
 518  00e8 7b17          	ld	a,(OFST+11,sp)
 519  00ea a188          	cp	a,#136
 520  00ec 2603          	jrne	L04
 521  00ee               L24:
 522  00ee 4f            	clr	a
 523  00ef 2010          	jra	L44
 524  00f1               L04:
 525  00f1 ae005e        	ldw	x,#94
 526  00f4 89            	pushw	x
 527  00f5 ae0000        	ldw	x,#0
 528  00f8 89            	pushw	x
 529  00f9 ae0008        	ldw	x,#L561
 530  00fc cd0000        	call	_assert_failed
 532  00ff 5b04          	addw	sp,#4
 533  0101               L44:
 534                     ; 95     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 536  0101 7b16          	ld	a,(OFST+10,sp)
 537  0103 a488          	and	a,#136
 538  0105 a188          	cp	a,#136
 539  0107 271b          	jreq	L64
 540  0109 7b16          	ld	a,(OFST+10,sp)
 541  010b a444          	and	a,#68
 542  010d a144          	cp	a,#68
 543  010f 2713          	jreq	L64
 544  0111 7b16          	ld	a,(OFST+10,sp)
 545  0113 a422          	and	a,#34
 546  0115 a122          	cp	a,#34
 547  0117 270b          	jreq	L64
 548  0119 7b16          	ld	a,(OFST+10,sp)
 549  011b a411          	and	a,#17
 550  011d a111          	cp	a,#17
 551  011f 2703          	jreq	L64
 552  0121 4f            	clr	a
 553  0122 2010          	jra	L05
 554  0124               L64:
 555  0124 ae005f        	ldw	x,#95
 556  0127 89            	pushw	x
 557  0128 ae0000        	ldw	x,#0
 558  012b 89            	pushw	x
 559  012c ae0008        	ldw	x,#L561
 560  012f cd0000        	call	_assert_failed
 562  0132 5b04          	addw	sp,#4
 563  0134               L05:
 564                     ; 98     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 566  0134 72195234      	bres	21044,#4
 567                     ; 101     UART1->CR1 |= (uint8_t)WordLength;
 569  0138 c65234        	ld	a,21044
 570  013b 1a13          	or	a,(OFST+7,sp)
 571  013d c75234        	ld	21044,a
 572                     ; 104     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 574  0140 c65236        	ld	a,21046
 575  0143 a4cf          	and	a,#207
 576  0145 c75236        	ld	21046,a
 577                     ; 106     UART1->CR3 |= (uint8_t)StopBits;  
 579  0148 c65236        	ld	a,21046
 580  014b 1a14          	or	a,(OFST+8,sp)
 581  014d c75236        	ld	21046,a
 582                     ; 109     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 584  0150 c65234        	ld	a,21044
 585  0153 a4f9          	and	a,#249
 586  0155 c75234        	ld	21044,a
 587                     ; 111     UART1->CR1 |= (uint8_t)Parity;  
 589  0158 c65234        	ld	a,21044
 590  015b 1a15          	or	a,(OFST+9,sp)
 591  015d c75234        	ld	21044,a
 592                     ; 114     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 594  0160 725f5232      	clr	21042
 595                     ; 116     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 597  0164 c65233        	ld	a,21043
 598  0167 a40f          	and	a,#15
 599  0169 c75233        	ld	21043,a
 600                     ; 118     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 602  016c c65233        	ld	a,21043
 603  016f a4f0          	and	a,#240
 604  0171 c75233        	ld	21043,a
 605                     ; 121     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 607  0174 96            	ldw	x,sp
 608  0175 1c000f        	addw	x,#OFST+3
 609  0178 cd0000        	call	c_ltor
 611  017b a604          	ld	a,#4
 612  017d cd0000        	call	c_llsh
 614  0180 96            	ldw	x,sp
 615  0181 1c0001        	addw	x,#OFST-11
 616  0184 cd0000        	call	c_rtol
 618  0187 cd0000        	call	_CLK_GetClockFreq
 620  018a 96            	ldw	x,sp
 621  018b 1c0001        	addw	x,#OFST-11
 622  018e cd0000        	call	c_ludv
 624  0191 96            	ldw	x,sp
 625  0192 1c0009        	addw	x,#OFST-3
 626  0195 cd0000        	call	c_rtol
 628                     ; 122     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 630  0198 96            	ldw	x,sp
 631  0199 1c000f        	addw	x,#OFST+3
 632  019c cd0000        	call	c_ltor
 634  019f a604          	ld	a,#4
 635  01a1 cd0000        	call	c_llsh
 637  01a4 96            	ldw	x,sp
 638  01a5 1c0001        	addw	x,#OFST-11
 639  01a8 cd0000        	call	c_rtol
 641  01ab cd0000        	call	_CLK_GetClockFreq
 643  01ae a664          	ld	a,#100
 644  01b0 cd0000        	call	c_smul
 646  01b3 96            	ldw	x,sp
 647  01b4 1c0001        	addw	x,#OFST-11
 648  01b7 cd0000        	call	c_ludv
 650  01ba 96            	ldw	x,sp
 651  01bb 1c0005        	addw	x,#OFST-7
 652  01be cd0000        	call	c_rtol
 654                     ; 124     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 656  01c1 96            	ldw	x,sp
 657  01c2 1c0009        	addw	x,#OFST-3
 658  01c5 cd0000        	call	c_ltor
 660  01c8 a664          	ld	a,#100
 661  01ca cd0000        	call	c_smul
 663  01cd 96            	ldw	x,sp
 664  01ce 1c0001        	addw	x,#OFST-11
 665  01d1 cd0000        	call	c_rtol
 667  01d4 96            	ldw	x,sp
 668  01d5 1c0005        	addw	x,#OFST-7
 669  01d8 cd0000        	call	c_ltor
 671  01db 96            	ldw	x,sp
 672  01dc 1c0001        	addw	x,#OFST-11
 673  01df cd0000        	call	c_lsub
 675  01e2 a604          	ld	a,#4
 676  01e4 cd0000        	call	c_llsh
 678  01e7 ae0004        	ldw	x,#L25
 679  01ea cd0000        	call	c_ludv
 681  01ed b603          	ld	a,c_lreg+3
 682  01ef a40f          	and	a,#15
 683  01f1 ca5233        	or	a,21043
 684  01f4 c75233        	ld	21043,a
 685                     ; 126     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 687  01f7 96            	ldw	x,sp
 688  01f8 1c0009        	addw	x,#OFST-3
 689  01fb cd0000        	call	c_ltor
 691  01fe a604          	ld	a,#4
 692  0200 cd0000        	call	c_lursh
 694  0203 b603          	ld	a,c_lreg+3
 695  0205 a4f0          	and	a,#240
 696  0207 b703          	ld	c_lreg+3,a
 697  0209 3f02          	clr	c_lreg+2
 698  020b 3f01          	clr	c_lreg+1
 699  020d 3f00          	clr	c_lreg
 700  020f b603          	ld	a,c_lreg+3
 701  0211 ca5233        	or	a,21043
 702  0214 c75233        	ld	21043,a
 703                     ; 128     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 705  0217 c65232        	ld	a,21042
 706  021a 1a0c          	or	a,(OFST+0,sp)
 707  021c c75232        	ld	21042,a
 708                     ; 131     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 710  021f c65235        	ld	a,21045
 711  0222 a4f3          	and	a,#243
 712  0224 c75235        	ld	21045,a
 713                     ; 133     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 715  0227 c65236        	ld	a,21046
 716  022a a4f8          	and	a,#248
 717  022c c75236        	ld	21046,a
 718                     ; 135     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 718                     ; 136                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
 720  022f 7b16          	ld	a,(OFST+10,sp)
 721  0231 a407          	and	a,#7
 722  0233 ca5236        	or	a,21046
 723  0236 c75236        	ld	21046,a
 724                     ; 138     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 726  0239 7b17          	ld	a,(OFST+11,sp)
 727  023b a504          	bcp	a,#4
 728  023d 2706          	jreq	L761
 729                     ; 141         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 731  023f 72165235      	bset	21045,#3
 733  0243 2004          	jra	L171
 734  0245               L761:
 735                     ; 146         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 737  0245 72175235      	bres	21045,#3
 738  0249               L171:
 739                     ; 148     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 741  0249 7b17          	ld	a,(OFST+11,sp)
 742  024b a508          	bcp	a,#8
 743  024d 2706          	jreq	L371
 744                     ; 151         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 746  024f 72145235      	bset	21045,#2
 748  0253 2004          	jra	L571
 749  0255               L371:
 750                     ; 156         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 752  0255 72155235      	bres	21045,#2
 753  0259               L571:
 754                     ; 160     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 756  0259 7b16          	ld	a,(OFST+10,sp)
 757  025b a580          	bcp	a,#128
 758  025d 2706          	jreq	L771
 759                     ; 163         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 761  025f 72175236      	bres	21046,#3
 763  0263 200a          	jra	L102
 764  0265               L771:
 765                     ; 167         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 767  0265 7b16          	ld	a,(OFST+10,sp)
 768  0267 a408          	and	a,#8
 769  0269 ca5236        	or	a,21046
 770  026c c75236        	ld	21046,a
 771  026f               L102:
 772                     ; 169 }
 775  026f 5b0c          	addw	sp,#12
 776  0271 81            	ret
 831                     ; 177 void UART1_Cmd(FunctionalState NewState)
 831                     ; 178 {
 832                     	switch	.text
 833  0272               _UART1_Cmd:
 837                     ; 179     if (NewState != DISABLE)
 839  0272 4d            	tnz	a
 840  0273 2706          	jreq	L132
 841                     ; 182         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 843  0275 721b5234      	bres	21044,#5
 845  0279 2004          	jra	L332
 846  027b               L132:
 847                     ; 187         UART1->CR1 |= UART1_CR1_UARTD;  
 849  027b 721a5234      	bset	21044,#5
 850  027f               L332:
 851                     ; 189 }
 854  027f 81            	ret
 976                     ; 205 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 976                     ; 206 {
 977                     	switch	.text
 978  0280               _UART1_ITConfig:
 980  0280 89            	pushw	x
 981  0281 89            	pushw	x
 982       00000002      OFST:	set	2
 985                     ; 207     uint8_t uartreg = 0, itpos = 0x00;
 989                     ; 210     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 991  0282 a30100        	cpw	x,#256
 992  0285 2719          	jreq	L26
 993  0287 a30277        	cpw	x,#631
 994  028a 2714          	jreq	L26
 995  028c a30266        	cpw	x,#614
 996  028f 270f          	jreq	L26
 997  0291 a30205        	cpw	x,#517
 998  0294 270a          	jreq	L26
 999  0296 a30244        	cpw	x,#580
1000  0299 2705          	jreq	L26
1001  029b a30346        	cpw	x,#838
1002  029e 2603          	jrne	L06
1003  02a0               L26:
1004  02a0 4f            	clr	a
1005  02a1 2010          	jra	L46
1006  02a3               L06:
1007  02a3 ae00d2        	ldw	x,#210
1008  02a6 89            	pushw	x
1009  02a7 ae0000        	ldw	x,#0
1010  02aa 89            	pushw	x
1011  02ab ae0008        	ldw	x,#L561
1012  02ae cd0000        	call	_assert_failed
1014  02b1 5b04          	addw	sp,#4
1015  02b3               L46:
1016                     ; 211     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1018  02b3 0d07          	tnz	(OFST+5,sp)
1019  02b5 2706          	jreq	L07
1020  02b7 7b07          	ld	a,(OFST+5,sp)
1021  02b9 a101          	cp	a,#1
1022  02bb 2603          	jrne	L66
1023  02bd               L07:
1024  02bd 4f            	clr	a
1025  02be 2010          	jra	L27
1026  02c0               L66:
1027  02c0 ae00d3        	ldw	x,#211
1028  02c3 89            	pushw	x
1029  02c4 ae0000        	ldw	x,#0
1030  02c7 89            	pushw	x
1031  02c8 ae0008        	ldw	x,#L561
1032  02cb cd0000        	call	_assert_failed
1034  02ce 5b04          	addw	sp,#4
1035  02d0               L27:
1036                     ; 214     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1038  02d0 7b03          	ld	a,(OFST+1,sp)
1039  02d2 6b01          	ld	(OFST-1,sp),a
1040                     ; 216     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1042  02d4 7b04          	ld	a,(OFST+2,sp)
1043  02d6 a40f          	and	a,#15
1044  02d8 5f            	clrw	x
1045  02d9 97            	ld	xl,a
1046  02da a601          	ld	a,#1
1047  02dc 5d            	tnzw	x
1048  02dd 2704          	jreq	L47
1049  02df               L67:
1050  02df 48            	sll	a
1051  02e0 5a            	decw	x
1052  02e1 26fc          	jrne	L67
1053  02e3               L47:
1054  02e3 6b02          	ld	(OFST+0,sp),a
1055                     ; 218     if (NewState != DISABLE)
1057  02e5 0d07          	tnz	(OFST+5,sp)
1058  02e7 272a          	jreq	L703
1059                     ; 221         if (uartreg == 0x01)
1061  02e9 7b01          	ld	a,(OFST-1,sp)
1062  02eb a101          	cp	a,#1
1063  02ed 260a          	jrne	L113
1064                     ; 223             UART1->CR1 |= itpos;
1066  02ef c65234        	ld	a,21044
1067  02f2 1a02          	or	a,(OFST+0,sp)
1068  02f4 c75234        	ld	21044,a
1070  02f7 2045          	jra	L123
1071  02f9               L113:
1072                     ; 225         else if (uartreg == 0x02)
1074  02f9 7b01          	ld	a,(OFST-1,sp)
1075  02fb a102          	cp	a,#2
1076  02fd 260a          	jrne	L513
1077                     ; 227             UART1->CR2 |= itpos;
1079  02ff c65235        	ld	a,21045
1080  0302 1a02          	or	a,(OFST+0,sp)
1081  0304 c75235        	ld	21045,a
1083  0307 2035          	jra	L123
1084  0309               L513:
1085                     ; 231             UART1->CR4 |= itpos;
1087  0309 c65237        	ld	a,21047
1088  030c 1a02          	or	a,(OFST+0,sp)
1089  030e c75237        	ld	21047,a
1090  0311 202b          	jra	L123
1091  0313               L703:
1092                     ; 237         if (uartreg == 0x01)
1094  0313 7b01          	ld	a,(OFST-1,sp)
1095  0315 a101          	cp	a,#1
1096  0317 260b          	jrne	L323
1097                     ; 239             UART1->CR1 &= (uint8_t)(~itpos);
1099  0319 7b02          	ld	a,(OFST+0,sp)
1100  031b 43            	cpl	a
1101  031c c45234        	and	a,21044
1102  031f c75234        	ld	21044,a
1104  0322 201a          	jra	L123
1105  0324               L323:
1106                     ; 241         else if (uartreg == 0x02)
1108  0324 7b01          	ld	a,(OFST-1,sp)
1109  0326 a102          	cp	a,#2
1110  0328 260b          	jrne	L723
1111                     ; 243             UART1->CR2 &= (uint8_t)(~itpos);
1113  032a 7b02          	ld	a,(OFST+0,sp)
1114  032c 43            	cpl	a
1115  032d c45235        	and	a,21045
1116  0330 c75235        	ld	21045,a
1118  0333 2009          	jra	L123
1119  0335               L723:
1120                     ; 247             UART1->CR4 &= (uint8_t)(~itpos);
1122  0335 7b02          	ld	a,(OFST+0,sp)
1123  0337 43            	cpl	a
1124  0338 c45237        	and	a,21047
1125  033b c75237        	ld	21047,a
1126  033e               L123:
1127                     ; 251 }
1130  033e 5b04          	addw	sp,#4
1131  0340 81            	ret
1168                     ; 258 void UART1_HalfDuplexCmd(FunctionalState NewState)
1168                     ; 259 {
1169                     	switch	.text
1170  0341               _UART1_HalfDuplexCmd:
1172  0341 88            	push	a
1173       00000000      OFST:	set	0
1176                     ; 260     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1178  0342 4d            	tnz	a
1179  0343 2704          	jreq	L401
1180  0345 a101          	cp	a,#1
1181  0347 2603          	jrne	L201
1182  0349               L401:
1183  0349 4f            	clr	a
1184  034a 2010          	jra	L601
1185  034c               L201:
1186  034c ae0104        	ldw	x,#260
1187  034f 89            	pushw	x
1188  0350 ae0000        	ldw	x,#0
1189  0353 89            	pushw	x
1190  0354 ae0008        	ldw	x,#L561
1191  0357 cd0000        	call	_assert_failed
1193  035a 5b04          	addw	sp,#4
1194  035c               L601:
1195                     ; 262     if (NewState != DISABLE)
1197  035c 0d01          	tnz	(OFST+1,sp)
1198  035e 2706          	jreq	L153
1199                     ; 264         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1201  0360 72165238      	bset	21048,#3
1203  0364 2004          	jra	L353
1204  0366               L153:
1205                     ; 268         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1207  0366 72175238      	bres	21048,#3
1208  036a               L353:
1209                     ; 270 }
1212  036a 84            	pop	a
1213  036b 81            	ret
1271                     ; 278 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1271                     ; 279 {
1272                     	switch	.text
1273  036c               _UART1_IrDAConfig:
1275  036c 88            	push	a
1276       00000000      OFST:	set	0
1279                     ; 280     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1281  036d a101          	cp	a,#1
1282  036f 2703          	jreq	L411
1283  0371 4d            	tnz	a
1284  0372 2603          	jrne	L211
1285  0374               L411:
1286  0374 4f            	clr	a
1287  0375 2010          	jra	L611
1288  0377               L211:
1289  0377 ae0118        	ldw	x,#280
1290  037a 89            	pushw	x
1291  037b ae0000        	ldw	x,#0
1292  037e 89            	pushw	x
1293  037f ae0008        	ldw	x,#L561
1294  0382 cd0000        	call	_assert_failed
1296  0385 5b04          	addw	sp,#4
1297  0387               L611:
1298                     ; 282     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1300  0387 0d01          	tnz	(OFST+1,sp)
1301  0389 2706          	jreq	L304
1302                     ; 284         UART1->CR5 |= UART1_CR5_IRLP;
1304  038b 72145238      	bset	21048,#2
1306  038f 2004          	jra	L504
1307  0391               L304:
1308                     ; 288         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1310  0391 72155238      	bres	21048,#2
1311  0395               L504:
1312                     ; 290 }
1315  0395 84            	pop	a
1316  0396 81            	ret
1352                     ; 298 void UART1_IrDACmd(FunctionalState NewState)
1352                     ; 299 {
1353                     	switch	.text
1354  0397               _UART1_IrDACmd:
1356  0397 88            	push	a
1357       00000000      OFST:	set	0
1360                     ; 302     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1362  0398 4d            	tnz	a
1363  0399 2704          	jreq	L421
1364  039b a101          	cp	a,#1
1365  039d 2603          	jrne	L221
1366  039f               L421:
1367  039f 4f            	clr	a
1368  03a0 2010          	jra	L621
1369  03a2               L221:
1370  03a2 ae012e        	ldw	x,#302
1371  03a5 89            	pushw	x
1372  03a6 ae0000        	ldw	x,#0
1373  03a9 89            	pushw	x
1374  03aa ae0008        	ldw	x,#L561
1375  03ad cd0000        	call	_assert_failed
1377  03b0 5b04          	addw	sp,#4
1378  03b2               L621:
1379                     ; 304     if (NewState != DISABLE)
1381  03b2 0d01          	tnz	(OFST+1,sp)
1382  03b4 2706          	jreq	L524
1383                     ; 307         UART1->CR5 |= UART1_CR5_IREN;
1385  03b6 72125238      	bset	21048,#1
1387  03ba 2004          	jra	L724
1388  03bc               L524:
1389                     ; 312         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1391  03bc 72135238      	bres	21048,#1
1392  03c0               L724:
1393                     ; 314 }
1396  03c0 84            	pop	a
1397  03c1 81            	ret
1457                     ; 323 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1457                     ; 324 {
1458                     	switch	.text
1459  03c2               _UART1_LINBreakDetectionConfig:
1461  03c2 88            	push	a
1462       00000000      OFST:	set	0
1465                     ; 325     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1467  03c3 4d            	tnz	a
1468  03c4 2704          	jreq	L431
1469  03c6 a101          	cp	a,#1
1470  03c8 2603          	jrne	L231
1471  03ca               L431:
1472  03ca 4f            	clr	a
1473  03cb 2010          	jra	L631
1474  03cd               L231:
1475  03cd ae0145        	ldw	x,#325
1476  03d0 89            	pushw	x
1477  03d1 ae0000        	ldw	x,#0
1478  03d4 89            	pushw	x
1479  03d5 ae0008        	ldw	x,#L561
1480  03d8 cd0000        	call	_assert_failed
1482  03db 5b04          	addw	sp,#4
1483  03dd               L631:
1484                     ; 327     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1486  03dd 0d01          	tnz	(OFST+1,sp)
1487  03df 2706          	jreq	L754
1488                     ; 329         UART1->CR4 |= UART1_CR4_LBDL;
1490  03e1 721a5237      	bset	21047,#5
1492  03e5 2004          	jra	L164
1493  03e7               L754:
1494                     ; 333         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1496  03e7 721b5237      	bres	21047,#5
1497  03eb               L164:
1498                     ; 335 }
1501  03eb 84            	pop	a
1502  03ec 81            	ret
1538                     ; 343 void UART1_LINCmd(FunctionalState NewState)
1538                     ; 344 {
1539                     	switch	.text
1540  03ed               _UART1_LINCmd:
1542  03ed 88            	push	a
1543       00000000      OFST:	set	0
1546                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1548  03ee 4d            	tnz	a
1549  03ef 2704          	jreq	L441
1550  03f1 a101          	cp	a,#1
1551  03f3 2603          	jrne	L241
1552  03f5               L441:
1553  03f5 4f            	clr	a
1554  03f6 2010          	jra	L641
1555  03f8               L241:
1556  03f8 ae0159        	ldw	x,#345
1557  03fb 89            	pushw	x
1558  03fc ae0000        	ldw	x,#0
1559  03ff 89            	pushw	x
1560  0400 ae0008        	ldw	x,#L561
1561  0403 cd0000        	call	_assert_failed
1563  0406 5b04          	addw	sp,#4
1564  0408               L641:
1565                     ; 347     if (NewState != DISABLE)
1567  0408 0d01          	tnz	(OFST+1,sp)
1568  040a 2706          	jreq	L105
1569                     ; 350         UART1->CR3 |= UART1_CR3_LINEN;
1571  040c 721c5236      	bset	21046,#6
1573  0410 2004          	jra	L305
1574  0412               L105:
1575                     ; 355         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1577  0412 721d5236      	bres	21046,#6
1578  0416               L305:
1579                     ; 357 }
1582  0416 84            	pop	a
1583  0417 81            	ret
1619                     ; 364 void UART1_SmartCardCmd(FunctionalState NewState)
1619                     ; 365 {
1620                     	switch	.text
1621  0418               _UART1_SmartCardCmd:
1623  0418 88            	push	a
1624       00000000      OFST:	set	0
1627                     ; 366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1629  0419 4d            	tnz	a
1630  041a 2704          	jreq	L451
1631  041c a101          	cp	a,#1
1632  041e 2603          	jrne	L251
1633  0420               L451:
1634  0420 4f            	clr	a
1635  0421 2010          	jra	L651
1636  0423               L251:
1637  0423 ae016e        	ldw	x,#366
1638  0426 89            	pushw	x
1639  0427 ae0000        	ldw	x,#0
1640  042a 89            	pushw	x
1641  042b ae0008        	ldw	x,#L561
1642  042e cd0000        	call	_assert_failed
1644  0431 5b04          	addw	sp,#4
1645  0433               L651:
1646                     ; 368     if (NewState != DISABLE)
1648  0433 0d01          	tnz	(OFST+1,sp)
1649  0435 2706          	jreq	L325
1650                     ; 371         UART1->CR5 |= UART1_CR5_SCEN;
1652  0437 721a5238      	bset	21048,#5
1654  043b 2004          	jra	L525
1655  043d               L325:
1656                     ; 376         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1658  043d 721b5238      	bres	21048,#5
1659  0441               L525:
1660                     ; 378 }
1663  0441 84            	pop	a
1664  0442 81            	ret
1701                     ; 387 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1701                     ; 388 {
1702                     	switch	.text
1703  0443               _UART1_SmartCardNACKCmd:
1705  0443 88            	push	a
1706       00000000      OFST:	set	0
1709                     ; 389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1711  0444 4d            	tnz	a
1712  0445 2704          	jreq	L461
1713  0447 a101          	cp	a,#1
1714  0449 2603          	jrne	L261
1715  044b               L461:
1716  044b 4f            	clr	a
1717  044c 2010          	jra	L661
1718  044e               L261:
1719  044e ae0185        	ldw	x,#389
1720  0451 89            	pushw	x
1721  0452 ae0000        	ldw	x,#0
1722  0455 89            	pushw	x
1723  0456 ae0008        	ldw	x,#L561
1724  0459 cd0000        	call	_assert_failed
1726  045c 5b04          	addw	sp,#4
1727  045e               L661:
1728                     ; 391     if (NewState != DISABLE)
1730  045e 0d01          	tnz	(OFST+1,sp)
1731  0460 2706          	jreq	L545
1732                     ; 394         UART1->CR5 |= UART1_CR5_NACK;
1734  0462 72185238      	bset	21048,#4
1736  0466 2004          	jra	L745
1737  0468               L545:
1738                     ; 399         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1740  0468 72195238      	bres	21048,#4
1741  046c               L745:
1742                     ; 401 }
1745  046c 84            	pop	a
1746  046d 81            	ret
1804                     ; 409 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1804                     ; 410 {
1805                     	switch	.text
1806  046e               _UART1_WakeUpConfig:
1808  046e 88            	push	a
1809       00000000      OFST:	set	0
1812                     ; 411     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1814  046f 4d            	tnz	a
1815  0470 2704          	jreq	L471
1816  0472 a108          	cp	a,#8
1817  0474 2603          	jrne	L271
1818  0476               L471:
1819  0476 4f            	clr	a
1820  0477 2010          	jra	L671
1821  0479               L271:
1822  0479 ae019b        	ldw	x,#411
1823  047c 89            	pushw	x
1824  047d ae0000        	ldw	x,#0
1825  0480 89            	pushw	x
1826  0481 ae0008        	ldw	x,#L561
1827  0484 cd0000        	call	_assert_failed
1829  0487 5b04          	addw	sp,#4
1830  0489               L671:
1831                     ; 413     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1833  0489 72175234      	bres	21044,#3
1834                     ; 414     UART1->CR1 |= (uint8_t)UART1_WakeUp;
1836  048d c65234        	ld	a,21044
1837  0490 1a01          	or	a,(OFST+1,sp)
1838  0492 c75234        	ld	21044,a
1839                     ; 415 }
1842  0495 84            	pop	a
1843  0496 81            	ret
1880                     ; 422 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1880                     ; 423 {
1881                     	switch	.text
1882  0497               _UART1_ReceiverWakeUpCmd:
1884  0497 88            	push	a
1885       00000000      OFST:	set	0
1888                     ; 424     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1890  0498 4d            	tnz	a
1891  0499 2704          	jreq	L402
1892  049b a101          	cp	a,#1
1893  049d 2603          	jrne	L202
1894  049f               L402:
1895  049f 4f            	clr	a
1896  04a0 2010          	jra	L602
1897  04a2               L202:
1898  04a2 ae01a8        	ldw	x,#424
1899  04a5 89            	pushw	x
1900  04a6 ae0000        	ldw	x,#0
1901  04a9 89            	pushw	x
1902  04aa ae0008        	ldw	x,#L561
1903  04ad cd0000        	call	_assert_failed
1905  04b0 5b04          	addw	sp,#4
1906  04b2               L602:
1907                     ; 426     if (NewState != DISABLE)
1909  04b2 0d01          	tnz	(OFST+1,sp)
1910  04b4 2706          	jreq	L516
1911                     ; 429         UART1->CR2 |= UART1_CR2_RWU;
1913  04b6 72125235      	bset	21045,#1
1915  04ba 2004          	jra	L716
1916  04bc               L516:
1917                     ; 434         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1919  04bc 72135235      	bres	21045,#1
1920  04c0               L716:
1921                     ; 436 }
1924  04c0 84            	pop	a
1925  04c1 81            	ret
1948                     ; 443 uint8_t UART1_ReceiveData8(void)
1948                     ; 444 {
1949                     	switch	.text
1950  04c2               _UART1_ReceiveData8:
1954                     ; 445     return ((uint8_t)UART1->DR);
1956  04c2 c65231        	ld	a,21041
1959  04c5 81            	ret
1991                     ; 453 uint16_t UART1_ReceiveData9(void)
1991                     ; 454 {
1992                     	switch	.text
1993  04c6               _UART1_ReceiveData9:
1995  04c6 89            	pushw	x
1996       00000002      OFST:	set	2
1999                     ; 455   uint16_t temp = 0;
2001                     ; 457   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2003  04c7 c65234        	ld	a,21044
2004  04ca 5f            	clrw	x
2005  04cb a480          	and	a,#128
2006  04cd 5f            	clrw	x
2007  04ce 02            	rlwa	x,a
2008  04cf 58            	sllw	x
2009  04d0 1f01          	ldw	(OFST-1,sp),x
2010                     ; 458   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2012  04d2 c65231        	ld	a,21041
2013  04d5 5f            	clrw	x
2014  04d6 97            	ld	xl,a
2015  04d7 01            	rrwa	x,a
2016  04d8 1a02          	or	a,(OFST+0,sp)
2017  04da 01            	rrwa	x,a
2018  04db 1a01          	or	a,(OFST-1,sp)
2019  04dd 01            	rrwa	x,a
2020  04de 01            	rrwa	x,a
2021  04df a4ff          	and	a,#255
2022  04e1 01            	rrwa	x,a
2023  04e2 a401          	and	a,#1
2024  04e4 01            	rrwa	x,a
2027  04e5 5b02          	addw	sp,#2
2028  04e7 81            	ret
2060                     ; 466 void UART1_SendData8(uint8_t Data)
2060                     ; 467 {
2061                     	switch	.text
2062  04e8               _UART1_SendData8:
2066                     ; 469     UART1->DR = Data;
2068  04e8 c75231        	ld	21041,a
2069                     ; 470 }
2072  04eb 81            	ret
2104                     ; 478 void UART1_SendData9(uint16_t Data)
2104                     ; 479 {
2105                     	switch	.text
2106  04ec               _UART1_SendData9:
2108  04ec 89            	pushw	x
2109       00000000      OFST:	set	0
2112                     ; 481     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2114  04ed 721d5234      	bres	21044,#6
2115                     ; 483     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2117  04f1 54            	srlw	x
2118  04f2 54            	srlw	x
2119  04f3 9f            	ld	a,xl
2120  04f4 a440          	and	a,#64
2121  04f6 ca5234        	or	a,21044
2122  04f9 c75234        	ld	21044,a
2123                     ; 485     UART1->DR   = (uint8_t)(Data);
2125  04fc 7b02          	ld	a,(OFST+2,sp)
2126  04fe c75231        	ld	21041,a
2127                     ; 486 }
2130  0501 85            	popw	x
2131  0502 81            	ret
2154                     ; 493 void UART1_SendBreak(void)
2154                     ; 494 {
2155                     	switch	.text
2156  0503               _UART1_SendBreak:
2160                     ; 495     UART1->CR2 |= UART1_CR2_SBK;
2162  0503 72105235      	bset	21045,#0
2163                     ; 496 }
2166  0507 81            	ret
2199                     ; 503 void UART1_SetAddress(uint8_t UART1_Address)
2199                     ; 504 {
2200                     	switch	.text
2201  0508               _UART1_SetAddress:
2203  0508 88            	push	a
2204       00000000      OFST:	set	0
2207                     ; 506     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2209  0509 a110          	cp	a,#16
2210  050b 2403          	jruge	L422
2211  050d 4f            	clr	a
2212  050e 2010          	jra	L622
2213  0510               L422:
2214  0510 ae01fa        	ldw	x,#506
2215  0513 89            	pushw	x
2216  0514 ae0000        	ldw	x,#0
2217  0517 89            	pushw	x
2218  0518 ae0008        	ldw	x,#L561
2219  051b cd0000        	call	_assert_failed
2221  051e 5b04          	addw	sp,#4
2222  0520               L622:
2223                     ; 509     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2225  0520 c65237        	ld	a,21047
2226  0523 a4f0          	and	a,#240
2227  0525 c75237        	ld	21047,a
2228                     ; 511     UART1->CR4 |= UART1_Address;
2230  0528 c65237        	ld	a,21047
2231  052b 1a01          	or	a,(OFST+1,sp)
2232  052d c75237        	ld	21047,a
2233                     ; 512 }
2236  0530 84            	pop	a
2237  0531 81            	ret
2269                     ; 520 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2269                     ; 521 {
2270                     	switch	.text
2271  0532               _UART1_SetGuardTime:
2275                     ; 523     UART1->GTR = UART1_GuardTime;
2277  0532 c75239        	ld	21049,a
2278                     ; 524 }
2281  0535 81            	ret
2313                     ; 548 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2313                     ; 549 {
2314                     	switch	.text
2315  0536               _UART1_SetPrescaler:
2319                     ; 551     UART1->PSCR = UART1_Prescaler;
2321  0536 c7523a        	ld	21050,a
2322                     ; 552 }
2325  0539 81            	ret
2469                     ; 560 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2469                     ; 561 {
2470                     	switch	.text
2471  053a               _UART1_GetFlagStatus:
2473  053a 89            	pushw	x
2474  053b 88            	push	a
2475       00000001      OFST:	set	1
2478                     ; 562     FlagStatus status = RESET;
2480                     ; 565     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2482  053c a30080        	cpw	x,#128
2483  053f 272d          	jreq	L042
2484  0541 a30040        	cpw	x,#64
2485  0544 2728          	jreq	L042
2486  0546 a30020        	cpw	x,#32
2487  0549 2723          	jreq	L042
2488  054b a30010        	cpw	x,#16
2489  054e 271e          	jreq	L042
2490  0550 a30008        	cpw	x,#8
2491  0553 2719          	jreq	L042
2492  0555 a30004        	cpw	x,#4
2493  0558 2714          	jreq	L042
2494  055a a30002        	cpw	x,#2
2495  055d 270f          	jreq	L042
2496  055f a30001        	cpw	x,#1
2497  0562 270a          	jreq	L042
2498  0564 a30101        	cpw	x,#257
2499  0567 2705          	jreq	L042
2500  0569 a30210        	cpw	x,#528
2501  056c 2603          	jrne	L632
2502  056e               L042:
2503  056e 4f            	clr	a
2504  056f 2010          	jra	L242
2505  0571               L632:
2506  0571 ae0235        	ldw	x,#565
2507  0574 89            	pushw	x
2508  0575 ae0000        	ldw	x,#0
2509  0578 89            	pushw	x
2510  0579 ae0008        	ldw	x,#L561
2511  057c cd0000        	call	_assert_failed
2513  057f 5b04          	addw	sp,#4
2514  0581               L242:
2515                     ; 569     if (UART1_FLAG == UART1_FLAG_LBDF)
2517  0581 1e02          	ldw	x,(OFST+1,sp)
2518  0583 a30210        	cpw	x,#528
2519  0586 2611          	jrne	L3301
2520                     ; 571         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2522  0588 c65237        	ld	a,21047
2523  058b 1503          	bcp	a,(OFST+2,sp)
2524  058d 2706          	jreq	L5301
2525                     ; 574             status = SET;
2527  058f a601          	ld	a,#1
2528  0591 6b01          	ld	(OFST+0,sp),a
2530  0593 202b          	jra	L1401
2531  0595               L5301:
2532                     ; 579             status = RESET;
2534  0595 0f01          	clr	(OFST+0,sp)
2535  0597 2027          	jra	L1401
2536  0599               L3301:
2537                     ; 582     else if (UART1_FLAG == UART1_FLAG_SBK)
2539  0599 1e02          	ldw	x,(OFST+1,sp)
2540  059b a30101        	cpw	x,#257
2541  059e 2611          	jrne	L3401
2542                     ; 584         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2544  05a0 c65235        	ld	a,21045
2545  05a3 1503          	bcp	a,(OFST+2,sp)
2546  05a5 2706          	jreq	L5401
2547                     ; 587             status = SET;
2549  05a7 a601          	ld	a,#1
2550  05a9 6b01          	ld	(OFST+0,sp),a
2552  05ab 2013          	jra	L1401
2553  05ad               L5401:
2554                     ; 592             status = RESET;
2556  05ad 0f01          	clr	(OFST+0,sp)
2557  05af 200f          	jra	L1401
2558  05b1               L3401:
2559                     ; 597         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2561  05b1 c65230        	ld	a,21040
2562  05b4 1503          	bcp	a,(OFST+2,sp)
2563  05b6 2706          	jreq	L3501
2564                     ; 600             status = SET;
2566  05b8 a601          	ld	a,#1
2567  05ba 6b01          	ld	(OFST+0,sp),a
2569  05bc 2002          	jra	L1401
2570  05be               L3501:
2571                     ; 605             status = RESET;
2573  05be 0f01          	clr	(OFST+0,sp)
2574  05c0               L1401:
2575                     ; 609     return status;
2577  05c0 7b01          	ld	a,(OFST+0,sp)
2580  05c2 5b03          	addw	sp,#3
2581  05c4 81            	ret
2617                     ; 639 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2617                     ; 640 {
2618                     	switch	.text
2619  05c5               _UART1_ClearFlag:
2621  05c5 89            	pushw	x
2622       00000000      OFST:	set	0
2625                     ; 641     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2627  05c6 a30020        	cpw	x,#32
2628  05c9 2705          	jreq	L052
2629  05cb a30210        	cpw	x,#528
2630  05ce 2603          	jrne	L642
2631  05d0               L052:
2632  05d0 4f            	clr	a
2633  05d1 2010          	jra	L252
2634  05d3               L642:
2635  05d3 ae0281        	ldw	x,#641
2636  05d6 89            	pushw	x
2637  05d7 ae0000        	ldw	x,#0
2638  05da 89            	pushw	x
2639  05db ae0008        	ldw	x,#L561
2640  05de cd0000        	call	_assert_failed
2642  05e1 5b04          	addw	sp,#4
2643  05e3               L252:
2644                     ; 644     if (UART1_FLAG == UART1_FLAG_RXNE)
2646  05e3 1e01          	ldw	x,(OFST+1,sp)
2647  05e5 a30020        	cpw	x,#32
2648  05e8 2606          	jrne	L5701
2649                     ; 646         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2651  05ea 35df5230      	mov	21040,#223
2653  05ee 2004          	jra	L7701
2654  05f0               L5701:
2655                     ; 651         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2657  05f0 72195237      	bres	21047,#4
2658  05f4               L7701:
2659                     ; 653 }
2662  05f4 85            	popw	x
2663  05f5 81            	ret
2738                     ; 668 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2738                     ; 669 {
2739                     	switch	.text
2740  05f6               _UART1_GetITStatus:
2742  05f6 89            	pushw	x
2743  05f7 89            	pushw	x
2744       00000002      OFST:	set	2
2747                     ; 670     ITStatus pendingbitstatus = RESET;
2749                     ; 671     uint8_t itpos = 0;
2751                     ; 672     uint8_t itmask1 = 0;
2753                     ; 673     uint8_t itmask2 = 0;
2755                     ; 674     uint8_t enablestatus = 0;
2757                     ; 677     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2759  05f8 a30277        	cpw	x,#631
2760  05fb 271e          	jreq	L062
2761  05fd a30266        	cpw	x,#614
2762  0600 2719          	jreq	L062
2763  0602 a30255        	cpw	x,#597
2764  0605 2714          	jreq	L062
2765  0607 a30244        	cpw	x,#580
2766  060a 270f          	jreq	L062
2767  060c a30235        	cpw	x,#565
2768  060f 270a          	jreq	L062
2769  0611 a30346        	cpw	x,#838
2770  0614 2705          	jreq	L062
2771  0616 a30100        	cpw	x,#256
2772  0619 2603          	jrne	L652
2773  061b               L062:
2774  061b 4f            	clr	a
2775  061c 2010          	jra	L262
2776  061e               L652:
2777  061e ae02a5        	ldw	x,#677
2778  0621 89            	pushw	x
2779  0622 ae0000        	ldw	x,#0
2780  0625 89            	pushw	x
2781  0626 ae0008        	ldw	x,#L561
2782  0629 cd0000        	call	_assert_failed
2784  062c 5b04          	addw	sp,#4
2785  062e               L262:
2786                     ; 680     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2788  062e 7b04          	ld	a,(OFST+2,sp)
2789  0630 a40f          	and	a,#15
2790  0632 5f            	clrw	x
2791  0633 97            	ld	xl,a
2792  0634 a601          	ld	a,#1
2793  0636 5d            	tnzw	x
2794  0637 2704          	jreq	L462
2795  0639               L662:
2796  0639 48            	sll	a
2797  063a 5a            	decw	x
2798  063b 26fc          	jrne	L662
2799  063d               L462:
2800  063d 6b01          	ld	(OFST-1,sp),a
2801                     ; 682     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2803  063f 7b04          	ld	a,(OFST+2,sp)
2804  0641 4e            	swap	a
2805  0642 a40f          	and	a,#15
2806  0644 6b02          	ld	(OFST+0,sp),a
2807                     ; 684     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2809  0646 7b02          	ld	a,(OFST+0,sp)
2810  0648 5f            	clrw	x
2811  0649 97            	ld	xl,a
2812  064a a601          	ld	a,#1
2813  064c 5d            	tnzw	x
2814  064d 2704          	jreq	L072
2815  064f               L272:
2816  064f 48            	sll	a
2817  0650 5a            	decw	x
2818  0651 26fc          	jrne	L272
2819  0653               L072:
2820  0653 6b02          	ld	(OFST+0,sp),a
2821                     ; 688     if (UART1_IT == UART1_IT_PE)
2823  0655 1e03          	ldw	x,(OFST+1,sp)
2824  0657 a30100        	cpw	x,#256
2825  065a 261c          	jrne	L3311
2826                     ; 691         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2828  065c c65234        	ld	a,21044
2829  065f 1402          	and	a,(OFST+0,sp)
2830  0661 6b02          	ld	(OFST+0,sp),a
2831                     ; 694         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2833  0663 c65230        	ld	a,21040
2834  0666 1501          	bcp	a,(OFST-1,sp)
2835  0668 270a          	jreq	L5311
2837  066a 0d02          	tnz	(OFST+0,sp)
2838  066c 2706          	jreq	L5311
2839                     ; 697             pendingbitstatus = SET;
2841  066e a601          	ld	a,#1
2842  0670 6b02          	ld	(OFST+0,sp),a
2844  0672 2041          	jra	L1411
2845  0674               L5311:
2846                     ; 702             pendingbitstatus = RESET;
2848  0674 0f02          	clr	(OFST+0,sp)
2849  0676 203d          	jra	L1411
2850  0678               L3311:
2851                     ; 706     else if (UART1_IT == UART1_IT_LBDF)
2853  0678 1e03          	ldw	x,(OFST+1,sp)
2854  067a a30346        	cpw	x,#838
2855  067d 261c          	jrne	L3411
2856                     ; 709         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2858  067f c65237        	ld	a,21047
2859  0682 1402          	and	a,(OFST+0,sp)
2860  0684 6b02          	ld	(OFST+0,sp),a
2861                     ; 711         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2863  0686 c65237        	ld	a,21047
2864  0689 1501          	bcp	a,(OFST-1,sp)
2865  068b 270a          	jreq	L5411
2867  068d 0d02          	tnz	(OFST+0,sp)
2868  068f 2706          	jreq	L5411
2869                     ; 714             pendingbitstatus = SET;
2871  0691 a601          	ld	a,#1
2872  0693 6b02          	ld	(OFST+0,sp),a
2874  0695 201e          	jra	L1411
2875  0697               L5411:
2876                     ; 719             pendingbitstatus = RESET;
2878  0697 0f02          	clr	(OFST+0,sp)
2879  0699 201a          	jra	L1411
2880  069b               L3411:
2881                     ; 725         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2883  069b c65235        	ld	a,21045
2884  069e 1402          	and	a,(OFST+0,sp)
2885  06a0 6b02          	ld	(OFST+0,sp),a
2886                     ; 727         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2888  06a2 c65230        	ld	a,21040
2889  06a5 1501          	bcp	a,(OFST-1,sp)
2890  06a7 270a          	jreq	L3511
2892  06a9 0d02          	tnz	(OFST+0,sp)
2893  06ab 2706          	jreq	L3511
2894                     ; 730             pendingbitstatus = SET;
2896  06ad a601          	ld	a,#1
2897  06af 6b02          	ld	(OFST+0,sp),a
2899  06b1 2002          	jra	L1411
2900  06b3               L3511:
2901                     ; 735             pendingbitstatus = RESET;
2903  06b3 0f02          	clr	(OFST+0,sp)
2904  06b5               L1411:
2905                     ; 740     return  pendingbitstatus;
2907  06b5 7b02          	ld	a,(OFST+0,sp)
2910  06b7 5b04          	addw	sp,#4
2911  06b9 81            	ret
2948                     ; 768 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2948                     ; 769 {
2949                     	switch	.text
2950  06ba               _UART1_ClearITPendingBit:
2952  06ba 89            	pushw	x
2953       00000000      OFST:	set	0
2956                     ; 770     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2958  06bb a30255        	cpw	x,#597
2959  06be 2705          	jreq	L003
2960  06c0 a30346        	cpw	x,#838
2961  06c3 2603          	jrne	L672
2962  06c5               L003:
2963  06c5 4f            	clr	a
2964  06c6 2010          	jra	L203
2965  06c8               L672:
2966  06c8 ae0302        	ldw	x,#770
2967  06cb 89            	pushw	x
2968  06cc ae0000        	ldw	x,#0
2969  06cf 89            	pushw	x
2970  06d0 ae0008        	ldw	x,#L561
2971  06d3 cd0000        	call	_assert_failed
2973  06d6 5b04          	addw	sp,#4
2974  06d8               L203:
2975                     ; 773     if (UART1_IT == UART1_IT_RXNE)
2977  06d8 1e01          	ldw	x,(OFST+1,sp)
2978  06da a30255        	cpw	x,#597
2979  06dd 2606          	jrne	L5711
2980                     ; 775         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2982  06df 35df5230      	mov	21040,#223
2984  06e3 2004          	jra	L7711
2985  06e5               L5711:
2986                     ; 780         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2988  06e5 72195237      	bres	21047,#4
2989  06e9               L7711:
2990                     ; 782 }
2993  06e9 85            	popw	x
2994  06ea 81            	ret
3007                     	xdef	_UART1_ClearITPendingBit
3008                     	xdef	_UART1_GetITStatus
3009                     	xdef	_UART1_ClearFlag
3010                     	xdef	_UART1_GetFlagStatus
3011                     	xdef	_UART1_SetPrescaler
3012                     	xdef	_UART1_SetGuardTime
3013                     	xdef	_UART1_SetAddress
3014                     	xdef	_UART1_SendBreak
3015                     	xdef	_UART1_SendData9
3016                     	xdef	_UART1_SendData8
3017                     	xdef	_UART1_ReceiveData9
3018                     	xdef	_UART1_ReceiveData8
3019                     	xdef	_UART1_ReceiverWakeUpCmd
3020                     	xdef	_UART1_WakeUpConfig
3021                     	xdef	_UART1_SmartCardNACKCmd
3022                     	xdef	_UART1_SmartCardCmd
3023                     	xdef	_UART1_LINCmd
3024                     	xdef	_UART1_LINBreakDetectionConfig
3025                     	xdef	_UART1_IrDACmd
3026                     	xdef	_UART1_IrDAConfig
3027                     	xdef	_UART1_HalfDuplexCmd
3028                     	xdef	_UART1_ITConfig
3029                     	xdef	_UART1_Cmd
3030                     	xdef	_UART1_Init
3031                     	xdef	_UART1_DeInit
3032                     	xref	_assert_failed
3033                     	xref	_CLK_GetClockFreq
3034                     	switch	.const
3035  0008               L561:
3036  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_u"
3037  001a 617274312e63  	dc.b	"art1.c",0
3038                     	xref.b	c_lreg
3039                     	xref.b	c_x
3059                     	xref	c_lursh
3060                     	xref	c_lsub
3061                     	xref	c_smul
3062                     	xref	c_ludv
3063                     	xref	c_rtol
3064                     	xref	c_llsh
3065                     	xref	c_lcmp
3066                     	xref	c_ltor
3067                     	end

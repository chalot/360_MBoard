   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 46 void UART1_DeInit(void)
  44                     ; 47 {
  46                     	switch	.text
  47  0000               _UART1_DeInit:
  51                     ; 50     (void)UART1->SR;
  53  0000 c65230        	ld	a,21040
  54                     ; 51     (void)UART1->DR;
  56  0003 c65231        	ld	a,21041
  57                     ; 53     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  59  0006 725f5233      	clr	21043
  60                     ; 54     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  62  000a 725f5232      	clr	21042
  63                     ; 56     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  65  000e 725f5234      	clr	21044
  66                     ; 57     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  68  0012 725f5235      	clr	21045
  69                     ; 58     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  71  0016 725f5236      	clr	21046
  72                     ; 59     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  74  001a 725f5237      	clr	21047
  75                     ; 60     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  77  001e 725f5238      	clr	21048
  78                     ; 62     UART1->GTR = UART1_GTR_RESET_VALUE;
  80  0022 725f5239      	clr	21049
  81                     ; 63     UART1->PSCR = UART1_PSCR_RESET_VALUE;
  83  0026 725f523a      	clr	21050
  84                     ; 64 }
  87  002a 81            	ret
 391                     .const:	section	.text
 392  0000               L21:
 393  0000 00098969      	dc.l	625001
 394  0004               L25:
 395  0004 00000064      	dc.l	100
 396                     ; 83 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 396                     ; 84                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 396                     ; 85                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 396                     ; 86 {
 397                     	switch	.text
 398  002b               _UART1_Init:
 400  002b 520c          	subw	sp,#12
 401       0000000c      OFST:	set	12
 404                     ; 87     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 408                     ; 90     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 410  002d 96            	ldw	x,sp
 411  002e 1c000f        	addw	x,#OFST+3
 412  0031 cd0000        	call	c_ltor
 414  0034 ae0000        	ldw	x,#L21
 415  0037 cd0000        	call	c_lcmp
 417  003a 2403          	jruge	L01
 418  003c 4f            	clr	a
 419  003d 2010          	jra	L41
 420  003f               L01:
 421  003f ae005a        	ldw	x,#90
 422  0042 89            	pushw	x
 423  0043 ae0000        	ldw	x,#0
 424  0046 89            	pushw	x
 425  0047 ae0008        	ldw	x,#L371
 426  004a cd0000        	call	_assert_failed
 428  004d 5b04          	addw	sp,#4
 429  004f               L41:
 430                     ; 91     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 432  004f 0d13          	tnz	(OFST+7,sp)
 433  0051 2706          	jreq	L02
 434  0053 7b13          	ld	a,(OFST+7,sp)
 435  0055 a110          	cp	a,#16
 436  0057 2603          	jrne	L61
 437  0059               L02:
 438  0059 4f            	clr	a
 439  005a 2010          	jra	L22
 440  005c               L61:
 441  005c ae005b        	ldw	x,#91
 442  005f 89            	pushw	x
 443  0060 ae0000        	ldw	x,#0
 444  0063 89            	pushw	x
 445  0064 ae0008        	ldw	x,#L371
 446  0067 cd0000        	call	_assert_failed
 448  006a 5b04          	addw	sp,#4
 449  006c               L22:
 450                     ; 92     assert_param(IS_UART1_STOPBITS_OK(StopBits));
 452  006c 0d14          	tnz	(OFST+8,sp)
 453  006e 2712          	jreq	L62
 454  0070 7b14          	ld	a,(OFST+8,sp)
 455  0072 a110          	cp	a,#16
 456  0074 270c          	jreq	L62
 457  0076 7b14          	ld	a,(OFST+8,sp)
 458  0078 a120          	cp	a,#32
 459  007a 2706          	jreq	L62
 460  007c 7b14          	ld	a,(OFST+8,sp)
 461  007e a130          	cp	a,#48
 462  0080 2603          	jrne	L42
 463  0082               L62:
 464  0082 4f            	clr	a
 465  0083 2010          	jra	L03
 466  0085               L42:
 467  0085 ae005c        	ldw	x,#92
 468  0088 89            	pushw	x
 469  0089 ae0000        	ldw	x,#0
 470  008c 89            	pushw	x
 471  008d ae0008        	ldw	x,#L371
 472  0090 cd0000        	call	_assert_failed
 474  0093 5b04          	addw	sp,#4
 475  0095               L03:
 476                     ; 93     assert_param(IS_UART1_PARITY_OK(Parity));
 478  0095 0d15          	tnz	(OFST+9,sp)
 479  0097 270c          	jreq	L43
 480  0099 7b15          	ld	a,(OFST+9,sp)
 481  009b a104          	cp	a,#4
 482  009d 2706          	jreq	L43
 483  009f 7b15          	ld	a,(OFST+9,sp)
 484  00a1 a106          	cp	a,#6
 485  00a3 2603          	jrne	L23
 486  00a5               L43:
 487  00a5 4f            	clr	a
 488  00a6 2010          	jra	L63
 489  00a8               L23:
 490  00a8 ae005d        	ldw	x,#93
 491  00ab 89            	pushw	x
 492  00ac ae0000        	ldw	x,#0
 493  00af 89            	pushw	x
 494  00b0 ae0008        	ldw	x,#L371
 495  00b3 cd0000        	call	_assert_failed
 497  00b6 5b04          	addw	sp,#4
 498  00b8               L63:
 499                     ; 94     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 501  00b8 7b17          	ld	a,(OFST+11,sp)
 502  00ba a108          	cp	a,#8
 503  00bc 2730          	jreq	L24
 504  00be 7b17          	ld	a,(OFST+11,sp)
 505  00c0 a140          	cp	a,#64
 506  00c2 272a          	jreq	L24
 507  00c4 7b17          	ld	a,(OFST+11,sp)
 508  00c6 a104          	cp	a,#4
 509  00c8 2724          	jreq	L24
 510  00ca 7b17          	ld	a,(OFST+11,sp)
 511  00cc a180          	cp	a,#128
 512  00ce 271e          	jreq	L24
 513  00d0 7b17          	ld	a,(OFST+11,sp)
 514  00d2 a10c          	cp	a,#12
 515  00d4 2718          	jreq	L24
 516  00d6 7b17          	ld	a,(OFST+11,sp)
 517  00d8 a10c          	cp	a,#12
 518  00da 2712          	jreq	L24
 519  00dc 7b17          	ld	a,(OFST+11,sp)
 520  00de a144          	cp	a,#68
 521  00e0 270c          	jreq	L24
 522  00e2 7b17          	ld	a,(OFST+11,sp)
 523  00e4 a1c0          	cp	a,#192
 524  00e6 2706          	jreq	L24
 525  00e8 7b17          	ld	a,(OFST+11,sp)
 526  00ea a188          	cp	a,#136
 527  00ec 2603          	jrne	L04
 528  00ee               L24:
 529  00ee 4f            	clr	a
 530  00ef 2010          	jra	L44
 531  00f1               L04:
 532  00f1 ae005e        	ldw	x,#94
 533  00f4 89            	pushw	x
 534  00f5 ae0000        	ldw	x,#0
 535  00f8 89            	pushw	x
 536  00f9 ae0008        	ldw	x,#L371
 537  00fc cd0000        	call	_assert_failed
 539  00ff 5b04          	addw	sp,#4
 540  0101               L44:
 541                     ; 95     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 543  0101 7b16          	ld	a,(OFST+10,sp)
 544  0103 a488          	and	a,#136
 545  0105 a188          	cp	a,#136
 546  0107 271b          	jreq	L64
 547  0109 7b16          	ld	a,(OFST+10,sp)
 548  010b a444          	and	a,#68
 549  010d a144          	cp	a,#68
 550  010f 2713          	jreq	L64
 551  0111 7b16          	ld	a,(OFST+10,sp)
 552  0113 a422          	and	a,#34
 553  0115 a122          	cp	a,#34
 554  0117 270b          	jreq	L64
 555  0119 7b16          	ld	a,(OFST+10,sp)
 556  011b a411          	and	a,#17
 557  011d a111          	cp	a,#17
 558  011f 2703          	jreq	L64
 559  0121 4f            	clr	a
 560  0122 2010          	jra	L05
 561  0124               L64:
 562  0124 ae005f        	ldw	x,#95
 563  0127 89            	pushw	x
 564  0128 ae0000        	ldw	x,#0
 565  012b 89            	pushw	x
 566  012c ae0008        	ldw	x,#L371
 567  012f cd0000        	call	_assert_failed
 569  0132 5b04          	addw	sp,#4
 570  0134               L05:
 571                     ; 98     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 573  0134 72195234      	bres	21044,#4
 574                     ; 101     UART1->CR1 |= (uint8_t)WordLength;
 576  0138 c65234        	ld	a,21044
 577  013b 1a13          	or	a,(OFST+7,sp)
 578  013d c75234        	ld	21044,a
 579                     ; 104     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 581  0140 c65236        	ld	a,21046
 582  0143 a4cf          	and	a,#207
 583  0145 c75236        	ld	21046,a
 584                     ; 106     UART1->CR3 |= (uint8_t)StopBits;  
 586  0148 c65236        	ld	a,21046
 587  014b 1a14          	or	a,(OFST+8,sp)
 588  014d c75236        	ld	21046,a
 589                     ; 109     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 591  0150 c65234        	ld	a,21044
 592  0153 a4f9          	and	a,#249
 593  0155 c75234        	ld	21044,a
 594                     ; 111     UART1->CR1 |= (uint8_t)Parity;  
 596  0158 c65234        	ld	a,21044
 597  015b 1a15          	or	a,(OFST+9,sp)
 598  015d c75234        	ld	21044,a
 599                     ; 114     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 601  0160 725f5232      	clr	21042
 602                     ; 116     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 604  0164 c65233        	ld	a,21043
 605  0167 a40f          	and	a,#15
 606  0169 c75233        	ld	21043,a
 607                     ; 118     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 609  016c c65233        	ld	a,21043
 610  016f a4f0          	and	a,#240
 611  0171 c75233        	ld	21043,a
 612                     ; 121     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 614  0174 96            	ldw	x,sp
 615  0175 1c000f        	addw	x,#OFST+3
 616  0178 cd0000        	call	c_ltor
 618  017b a604          	ld	a,#4
 619  017d cd0000        	call	c_llsh
 621  0180 96            	ldw	x,sp
 622  0181 1c0001        	addw	x,#OFST-11
 623  0184 cd0000        	call	c_rtol
 625  0187 cd0000        	call	_CLK_GetClockFreq
 627  018a 96            	ldw	x,sp
 628  018b 1c0001        	addw	x,#OFST-11
 629  018e cd0000        	call	c_ludv
 631  0191 96            	ldw	x,sp
 632  0192 1c0009        	addw	x,#OFST-3
 633  0195 cd0000        	call	c_rtol
 635                     ; 122     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 637  0198 96            	ldw	x,sp
 638  0199 1c000f        	addw	x,#OFST+3
 639  019c cd0000        	call	c_ltor
 641  019f a604          	ld	a,#4
 642  01a1 cd0000        	call	c_llsh
 644  01a4 96            	ldw	x,sp
 645  01a5 1c0001        	addw	x,#OFST-11
 646  01a8 cd0000        	call	c_rtol
 648  01ab cd0000        	call	_CLK_GetClockFreq
 650  01ae a664          	ld	a,#100
 651  01b0 cd0000        	call	c_smul
 653  01b3 96            	ldw	x,sp
 654  01b4 1c0001        	addw	x,#OFST-11
 655  01b7 cd0000        	call	c_ludv
 657  01ba 96            	ldw	x,sp
 658  01bb 1c0005        	addw	x,#OFST-7
 659  01be cd0000        	call	c_rtol
 661                     ; 124     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 663  01c1 96            	ldw	x,sp
 664  01c2 1c0009        	addw	x,#OFST-3
 665  01c5 cd0000        	call	c_ltor
 667  01c8 a664          	ld	a,#100
 668  01ca cd0000        	call	c_smul
 670  01cd 96            	ldw	x,sp
 671  01ce 1c0001        	addw	x,#OFST-11
 672  01d1 cd0000        	call	c_rtol
 674  01d4 96            	ldw	x,sp
 675  01d5 1c0005        	addw	x,#OFST-7
 676  01d8 cd0000        	call	c_ltor
 678  01db 96            	ldw	x,sp
 679  01dc 1c0001        	addw	x,#OFST-11
 680  01df cd0000        	call	c_lsub
 682  01e2 a604          	ld	a,#4
 683  01e4 cd0000        	call	c_llsh
 685  01e7 ae0004        	ldw	x,#L25
 686  01ea cd0000        	call	c_ludv
 688  01ed b603          	ld	a,c_lreg+3
 689  01ef a40f          	and	a,#15
 690  01f1 ca5233        	or	a,21043
 691  01f4 c75233        	ld	21043,a
 692                     ; 126     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 694  01f7 96            	ldw	x,sp
 695  01f8 1c0009        	addw	x,#OFST-3
 696  01fb cd0000        	call	c_ltor
 698  01fe a604          	ld	a,#4
 699  0200 cd0000        	call	c_lursh
 701  0203 b603          	ld	a,c_lreg+3
 702  0205 a4f0          	and	a,#240
 703  0207 b703          	ld	c_lreg+3,a
 704  0209 3f02          	clr	c_lreg+2
 705  020b 3f01          	clr	c_lreg+1
 706  020d 3f00          	clr	c_lreg
 707  020f b603          	ld	a,c_lreg+3
 708  0211 ca5233        	or	a,21043
 709  0214 c75233        	ld	21043,a
 710                     ; 128     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 712  0217 c65232        	ld	a,21042
 713  021a 1a0c          	or	a,(OFST+0,sp)
 714  021c c75232        	ld	21042,a
 715                     ; 131     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 717  021f c65235        	ld	a,21045
 718  0222 a4f3          	and	a,#243
 719  0224 c75235        	ld	21045,a
 720                     ; 133     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 722  0227 c65236        	ld	a,21046
 723  022a a4f8          	and	a,#248
 724  022c c75236        	ld	21046,a
 725                     ; 135     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 725                     ; 136                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
 727  022f 7b16          	ld	a,(OFST+10,sp)
 728  0231 a407          	and	a,#7
 729  0233 ca5236        	or	a,21046
 730  0236 c75236        	ld	21046,a
 731                     ; 138     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 733  0239 7b17          	ld	a,(OFST+11,sp)
 734  023b a504          	bcp	a,#4
 735  023d 2706          	jreq	L571
 736                     ; 141         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 738  023f 72165235      	bset	21045,#3
 740  0243 2004          	jra	L771
 741  0245               L571:
 742                     ; 146         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 744  0245 72175235      	bres	21045,#3
 745  0249               L771:
 746                     ; 148     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 748  0249 7b17          	ld	a,(OFST+11,sp)
 749  024b a508          	bcp	a,#8
 750  024d 2706          	jreq	L102
 751                     ; 151         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 753  024f 72145235      	bset	21045,#2
 755  0253 2004          	jra	L302
 756  0255               L102:
 757                     ; 156         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 759  0255 72155235      	bres	21045,#2
 760  0259               L302:
 761                     ; 160     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 763  0259 7b16          	ld	a,(OFST+10,sp)
 764  025b a580          	bcp	a,#128
 765  025d 2706          	jreq	L502
 766                     ; 163         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 768  025f 72175236      	bres	21046,#3
 770  0263 200a          	jra	L702
 771  0265               L502:
 772                     ; 167         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 774  0265 7b16          	ld	a,(OFST+10,sp)
 775  0267 a408          	and	a,#8
 776  0269 ca5236        	or	a,21046
 777  026c c75236        	ld	21046,a
 778  026f               L702:
 779                     ; 169 }
 782  026f 5b0c          	addw	sp,#12
 783  0271 81            	ret
 838                     ; 177 void UART1_Cmd(FunctionalState NewState)
 838                     ; 178 {
 839                     	switch	.text
 840  0272               _UART1_Cmd:
 844                     ; 179     if (NewState != DISABLE)
 846  0272 4d            	tnz	a
 847  0273 2706          	jreq	L732
 848                     ; 182         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 850  0275 721b5234      	bres	21044,#5
 852  0279 2004          	jra	L142
 853  027b               L732:
 854                     ; 187         UART1->CR1 |= UART1_CR1_UARTD;  
 856  027b 721a5234      	bset	21044,#5
 857  027f               L142:
 858                     ; 189 }
 861  027f 81            	ret
 987                     ; 205 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 987                     ; 206 {
 988                     	switch	.text
 989  0280               _UART1_ITConfig:
 991  0280 89            	pushw	x
 992  0281 89            	pushw	x
 993       00000002      OFST:	set	2
 996                     ; 207     uint8_t uartreg = 0, itpos = 0x00;
1000                     ; 210     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
1002  0282 a30100        	cpw	x,#256
1003  0285 2719          	jreq	L26
1004  0287 a30277        	cpw	x,#631
1005  028a 2714          	jreq	L26
1006  028c a30266        	cpw	x,#614
1007  028f 270f          	jreq	L26
1008  0291 a30205        	cpw	x,#517
1009  0294 270a          	jreq	L26
1010  0296 a30244        	cpw	x,#580
1011  0299 2705          	jreq	L26
1012  029b a30346        	cpw	x,#838
1013  029e 2603          	jrne	L06
1014  02a0               L26:
1015  02a0 4f            	clr	a
1016  02a1 2010          	jra	L46
1017  02a3               L06:
1018  02a3 ae00d2        	ldw	x,#210
1019  02a6 89            	pushw	x
1020  02a7 ae0000        	ldw	x,#0
1021  02aa 89            	pushw	x
1022  02ab ae0008        	ldw	x,#L371
1023  02ae cd0000        	call	_assert_failed
1025  02b1 5b04          	addw	sp,#4
1026  02b3               L46:
1027                     ; 211     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1029  02b3 0d07          	tnz	(OFST+5,sp)
1030  02b5 2706          	jreq	L07
1031  02b7 7b07          	ld	a,(OFST+5,sp)
1032  02b9 a101          	cp	a,#1
1033  02bb 2603          	jrne	L66
1034  02bd               L07:
1035  02bd 4f            	clr	a
1036  02be 2010          	jra	L27
1037  02c0               L66:
1038  02c0 ae00d3        	ldw	x,#211
1039  02c3 89            	pushw	x
1040  02c4 ae0000        	ldw	x,#0
1041  02c7 89            	pushw	x
1042  02c8 ae0008        	ldw	x,#L371
1043  02cb cd0000        	call	_assert_failed
1045  02ce 5b04          	addw	sp,#4
1046  02d0               L27:
1047                     ; 214     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
1049  02d0 7b03          	ld	a,(OFST+1,sp)
1050  02d2 6b01          	ld	(OFST-1,sp),a
1051                     ; 216     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
1053  02d4 7b04          	ld	a,(OFST+2,sp)
1054  02d6 a40f          	and	a,#15
1055  02d8 5f            	clrw	x
1056  02d9 97            	ld	xl,a
1057  02da a601          	ld	a,#1
1058  02dc 5d            	tnzw	x
1059  02dd 2704          	jreq	L47
1060  02df               L67:
1061  02df 48            	sll	a
1062  02e0 5a            	decw	x
1063  02e1 26fc          	jrne	L67
1064  02e3               L47:
1065  02e3 6b02          	ld	(OFST+0,sp),a
1066                     ; 218     if (NewState != DISABLE)
1068  02e5 0d07          	tnz	(OFST+5,sp)
1069  02e7 272a          	jreq	L123
1070                     ; 221         if (uartreg == 0x01)
1072  02e9 7b01          	ld	a,(OFST-1,sp)
1073  02eb a101          	cp	a,#1
1074  02ed 260a          	jrne	L323
1075                     ; 223             UART1->CR1 |= itpos;
1077  02ef c65234        	ld	a,21044
1078  02f2 1a02          	or	a,(OFST+0,sp)
1079  02f4 c75234        	ld	21044,a
1081  02f7 2045          	jra	L333
1082  02f9               L323:
1083                     ; 225         else if (uartreg == 0x02)
1085  02f9 7b01          	ld	a,(OFST-1,sp)
1086  02fb a102          	cp	a,#2
1087  02fd 260a          	jrne	L723
1088                     ; 227             UART1->CR2 |= itpos;
1090  02ff c65235        	ld	a,21045
1091  0302 1a02          	or	a,(OFST+0,sp)
1092  0304 c75235        	ld	21045,a
1094  0307 2035          	jra	L333
1095  0309               L723:
1096                     ; 231             UART1->CR4 |= itpos;
1098  0309 c65237        	ld	a,21047
1099  030c 1a02          	or	a,(OFST+0,sp)
1100  030e c75237        	ld	21047,a
1101  0311 202b          	jra	L333
1102  0313               L123:
1103                     ; 237         if (uartreg == 0x01)
1105  0313 7b01          	ld	a,(OFST-1,sp)
1106  0315 a101          	cp	a,#1
1107  0317 260b          	jrne	L533
1108                     ; 239             UART1->CR1 &= (uint8_t)(~itpos);
1110  0319 7b02          	ld	a,(OFST+0,sp)
1111  031b 43            	cpl	a
1112  031c c45234        	and	a,21044
1113  031f c75234        	ld	21044,a
1115  0322 201a          	jra	L333
1116  0324               L533:
1117                     ; 241         else if (uartreg == 0x02)
1119  0324 7b01          	ld	a,(OFST-1,sp)
1120  0326 a102          	cp	a,#2
1121  0328 260b          	jrne	L143
1122                     ; 243             UART1->CR2 &= (uint8_t)(~itpos);
1124  032a 7b02          	ld	a,(OFST+0,sp)
1125  032c 43            	cpl	a
1126  032d c45235        	and	a,21045
1127  0330 c75235        	ld	21045,a
1129  0333 2009          	jra	L333
1130  0335               L143:
1131                     ; 247             UART1->CR4 &= (uint8_t)(~itpos);
1133  0335 7b02          	ld	a,(OFST+0,sp)
1134  0337 43            	cpl	a
1135  0338 c45237        	and	a,21047
1136  033b c75237        	ld	21047,a
1137  033e               L333:
1138                     ; 251 }
1141  033e 5b04          	addw	sp,#4
1142  0340 81            	ret
1179                     ; 258 void UART1_HalfDuplexCmd(FunctionalState NewState)
1179                     ; 259 {
1180                     	switch	.text
1181  0341               _UART1_HalfDuplexCmd:
1183  0341 88            	push	a
1184       00000000      OFST:	set	0
1187                     ; 260     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1189  0342 4d            	tnz	a
1190  0343 2704          	jreq	L401
1191  0345 a101          	cp	a,#1
1192  0347 2603          	jrne	L201
1193  0349               L401:
1194  0349 4f            	clr	a
1195  034a 2010          	jra	L601
1196  034c               L201:
1197  034c ae0104        	ldw	x,#260
1198  034f 89            	pushw	x
1199  0350 ae0000        	ldw	x,#0
1200  0353 89            	pushw	x
1201  0354 ae0008        	ldw	x,#L371
1202  0357 cd0000        	call	_assert_failed
1204  035a 5b04          	addw	sp,#4
1205  035c               L601:
1206                     ; 262     if (NewState != DISABLE)
1208  035c 0d01          	tnz	(OFST+1,sp)
1209  035e 2706          	jreq	L363
1210                     ; 264         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1212  0360 72165238      	bset	21048,#3
1214  0364 2004          	jra	L563
1215  0366               L363:
1216                     ; 268         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1218  0366 72175238      	bres	21048,#3
1219  036a               L563:
1220                     ; 270 }
1223  036a 84            	pop	a
1224  036b 81            	ret
1282                     ; 278 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1282                     ; 279 {
1283                     	switch	.text
1284  036c               _UART1_IrDAConfig:
1286  036c 88            	push	a
1287       00000000      OFST:	set	0
1290                     ; 280     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1292  036d a101          	cp	a,#1
1293  036f 2703          	jreq	L411
1294  0371 4d            	tnz	a
1295  0372 2603          	jrne	L211
1296  0374               L411:
1297  0374 4f            	clr	a
1298  0375 2010          	jra	L611
1299  0377               L211:
1300  0377 ae0118        	ldw	x,#280
1301  037a 89            	pushw	x
1302  037b ae0000        	ldw	x,#0
1303  037e 89            	pushw	x
1304  037f ae0008        	ldw	x,#L371
1305  0382 cd0000        	call	_assert_failed
1307  0385 5b04          	addw	sp,#4
1308  0387               L611:
1309                     ; 282     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1311  0387 0d01          	tnz	(OFST+1,sp)
1312  0389 2706          	jreq	L514
1313                     ; 284         UART1->CR5 |= UART1_CR5_IRLP;
1315  038b 72145238      	bset	21048,#2
1317  038f 2004          	jra	L714
1318  0391               L514:
1319                     ; 288         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1321  0391 72155238      	bres	21048,#2
1322  0395               L714:
1323                     ; 290 }
1326  0395 84            	pop	a
1327  0396 81            	ret
1363                     ; 298 void UART1_IrDACmd(FunctionalState NewState)
1363                     ; 299 {
1364                     	switch	.text
1365  0397               _UART1_IrDACmd:
1367  0397 88            	push	a
1368       00000000      OFST:	set	0
1371                     ; 302     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1373  0398 4d            	tnz	a
1374  0399 2704          	jreq	L421
1375  039b a101          	cp	a,#1
1376  039d 2603          	jrne	L221
1377  039f               L421:
1378  039f 4f            	clr	a
1379  03a0 2010          	jra	L621
1380  03a2               L221:
1381  03a2 ae012e        	ldw	x,#302
1382  03a5 89            	pushw	x
1383  03a6 ae0000        	ldw	x,#0
1384  03a9 89            	pushw	x
1385  03aa ae0008        	ldw	x,#L371
1386  03ad cd0000        	call	_assert_failed
1388  03b0 5b04          	addw	sp,#4
1389  03b2               L621:
1390                     ; 304     if (NewState != DISABLE)
1392  03b2 0d01          	tnz	(OFST+1,sp)
1393  03b4 2706          	jreq	L734
1394                     ; 307         UART1->CR5 |= UART1_CR5_IREN;
1396  03b6 72125238      	bset	21048,#1
1398  03ba 2004          	jra	L144
1399  03bc               L734:
1400                     ; 312         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1402  03bc 72135238      	bres	21048,#1
1403  03c0               L144:
1404                     ; 314 }
1407  03c0 84            	pop	a
1408  03c1 81            	ret
1468                     ; 323 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1468                     ; 324 {
1469                     	switch	.text
1470  03c2               _UART1_LINBreakDetectionConfig:
1472  03c2 88            	push	a
1473       00000000      OFST:	set	0
1476                     ; 325     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1478  03c3 4d            	tnz	a
1479  03c4 2704          	jreq	L431
1480  03c6 a101          	cp	a,#1
1481  03c8 2603          	jrne	L231
1482  03ca               L431:
1483  03ca 4f            	clr	a
1484  03cb 2010          	jra	L631
1485  03cd               L231:
1486  03cd ae0145        	ldw	x,#325
1487  03d0 89            	pushw	x
1488  03d1 ae0000        	ldw	x,#0
1489  03d4 89            	pushw	x
1490  03d5 ae0008        	ldw	x,#L371
1491  03d8 cd0000        	call	_assert_failed
1493  03db 5b04          	addw	sp,#4
1494  03dd               L631:
1495                     ; 327     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1497  03dd 0d01          	tnz	(OFST+1,sp)
1498  03df 2706          	jreq	L174
1499                     ; 329         UART1->CR4 |= UART1_CR4_LBDL;
1501  03e1 721a5237      	bset	21047,#5
1503  03e5 2004          	jra	L374
1504  03e7               L174:
1505                     ; 333         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1507  03e7 721b5237      	bres	21047,#5
1508  03eb               L374:
1509                     ; 335 }
1512  03eb 84            	pop	a
1513  03ec 81            	ret
1549                     ; 343 void UART1_LINCmd(FunctionalState NewState)
1549                     ; 344 {
1550                     	switch	.text
1551  03ed               _UART1_LINCmd:
1553  03ed 88            	push	a
1554       00000000      OFST:	set	0
1557                     ; 345     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1559  03ee 4d            	tnz	a
1560  03ef 2704          	jreq	L441
1561  03f1 a101          	cp	a,#1
1562  03f3 2603          	jrne	L241
1563  03f5               L441:
1564  03f5 4f            	clr	a
1565  03f6 2010          	jra	L641
1566  03f8               L241:
1567  03f8 ae0159        	ldw	x,#345
1568  03fb 89            	pushw	x
1569  03fc ae0000        	ldw	x,#0
1570  03ff 89            	pushw	x
1571  0400 ae0008        	ldw	x,#L371
1572  0403 cd0000        	call	_assert_failed
1574  0406 5b04          	addw	sp,#4
1575  0408               L641:
1576                     ; 347     if (NewState != DISABLE)
1578  0408 0d01          	tnz	(OFST+1,sp)
1579  040a 2706          	jreq	L315
1580                     ; 350         UART1->CR3 |= UART1_CR3_LINEN;
1582  040c 721c5236      	bset	21046,#6
1584  0410 2004          	jra	L515
1585  0412               L315:
1586                     ; 355         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1588  0412 721d5236      	bres	21046,#6
1589  0416               L515:
1590                     ; 357 }
1593  0416 84            	pop	a
1594  0417 81            	ret
1630                     ; 364 void UART1_SmartCardCmd(FunctionalState NewState)
1630                     ; 365 {
1631                     	switch	.text
1632  0418               _UART1_SmartCardCmd:
1634  0418 88            	push	a
1635       00000000      OFST:	set	0
1638                     ; 366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1640  0419 4d            	tnz	a
1641  041a 2704          	jreq	L451
1642  041c a101          	cp	a,#1
1643  041e 2603          	jrne	L251
1644  0420               L451:
1645  0420 4f            	clr	a
1646  0421 2010          	jra	L651
1647  0423               L251:
1648  0423 ae016e        	ldw	x,#366
1649  0426 89            	pushw	x
1650  0427 ae0000        	ldw	x,#0
1651  042a 89            	pushw	x
1652  042b ae0008        	ldw	x,#L371
1653  042e cd0000        	call	_assert_failed
1655  0431 5b04          	addw	sp,#4
1656  0433               L651:
1657                     ; 368     if (NewState != DISABLE)
1659  0433 0d01          	tnz	(OFST+1,sp)
1660  0435 2706          	jreq	L535
1661                     ; 371         UART1->CR5 |= UART1_CR5_SCEN;
1663  0437 721a5238      	bset	21048,#5
1665  043b 2004          	jra	L735
1666  043d               L535:
1667                     ; 376         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1669  043d 721b5238      	bres	21048,#5
1670  0441               L735:
1671                     ; 378 }
1674  0441 84            	pop	a
1675  0442 81            	ret
1712                     ; 387 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1712                     ; 388 {
1713                     	switch	.text
1714  0443               _UART1_SmartCardNACKCmd:
1716  0443 88            	push	a
1717       00000000      OFST:	set	0
1720                     ; 389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1722  0444 4d            	tnz	a
1723  0445 2704          	jreq	L461
1724  0447 a101          	cp	a,#1
1725  0449 2603          	jrne	L261
1726  044b               L461:
1727  044b 4f            	clr	a
1728  044c 2010          	jra	L661
1729  044e               L261:
1730  044e ae0185        	ldw	x,#389
1731  0451 89            	pushw	x
1732  0452 ae0000        	ldw	x,#0
1733  0455 89            	pushw	x
1734  0456 ae0008        	ldw	x,#L371
1735  0459 cd0000        	call	_assert_failed
1737  045c 5b04          	addw	sp,#4
1738  045e               L661:
1739                     ; 391     if (NewState != DISABLE)
1741  045e 0d01          	tnz	(OFST+1,sp)
1742  0460 2706          	jreq	L755
1743                     ; 394         UART1->CR5 |= UART1_CR5_NACK;
1745  0462 72185238      	bset	21048,#4
1747  0466 2004          	jra	L165
1748  0468               L755:
1749                     ; 399         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1751  0468 72195238      	bres	21048,#4
1752  046c               L165:
1753                     ; 401 }
1756  046c 84            	pop	a
1757  046d 81            	ret
1815                     ; 409 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1815                     ; 410 {
1816                     	switch	.text
1817  046e               _UART1_WakeUpConfig:
1819  046e 88            	push	a
1820       00000000      OFST:	set	0
1823                     ; 411     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1825  046f 4d            	tnz	a
1826  0470 2704          	jreq	L471
1827  0472 a108          	cp	a,#8
1828  0474 2603          	jrne	L271
1829  0476               L471:
1830  0476 4f            	clr	a
1831  0477 2010          	jra	L671
1832  0479               L271:
1833  0479 ae019b        	ldw	x,#411
1834  047c 89            	pushw	x
1835  047d ae0000        	ldw	x,#0
1836  0480 89            	pushw	x
1837  0481 ae0008        	ldw	x,#L371
1838  0484 cd0000        	call	_assert_failed
1840  0487 5b04          	addw	sp,#4
1841  0489               L671:
1842                     ; 413     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1844  0489 72175234      	bres	21044,#3
1845                     ; 414     UART1->CR1 |= (uint8_t)UART1_WakeUp;
1847  048d c65234        	ld	a,21044
1848  0490 1a01          	or	a,(OFST+1,sp)
1849  0492 c75234        	ld	21044,a
1850                     ; 415 }
1853  0495 84            	pop	a
1854  0496 81            	ret
1891                     ; 422 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1891                     ; 423 {
1892                     	switch	.text
1893  0497               _UART1_ReceiverWakeUpCmd:
1895  0497 88            	push	a
1896       00000000      OFST:	set	0
1899                     ; 424     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1901  0498 4d            	tnz	a
1902  0499 2704          	jreq	L402
1903  049b a101          	cp	a,#1
1904  049d 2603          	jrne	L202
1905  049f               L402:
1906  049f 4f            	clr	a
1907  04a0 2010          	jra	L602
1908  04a2               L202:
1909  04a2 ae01a8        	ldw	x,#424
1910  04a5 89            	pushw	x
1911  04a6 ae0000        	ldw	x,#0
1912  04a9 89            	pushw	x
1913  04aa ae0008        	ldw	x,#L371
1914  04ad cd0000        	call	_assert_failed
1916  04b0 5b04          	addw	sp,#4
1917  04b2               L602:
1918                     ; 426     if (NewState != DISABLE)
1920  04b2 0d01          	tnz	(OFST+1,sp)
1921  04b4 2706          	jreq	L726
1922                     ; 429         UART1->CR2 |= UART1_CR2_RWU;
1924  04b6 72125235      	bset	21045,#1
1926  04ba 2004          	jra	L136
1927  04bc               L726:
1928                     ; 434         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1930  04bc 72135235      	bres	21045,#1
1931  04c0               L136:
1932                     ; 436 }
1935  04c0 84            	pop	a
1936  04c1 81            	ret
1959                     ; 443 uint8_t UART1_ReceiveData8(void)
1959                     ; 444 {
1960                     	switch	.text
1961  04c2               _UART1_ReceiveData8:
1965                     ; 445     return ((uint8_t)UART1->DR);
1967  04c2 c65231        	ld	a,21041
1970  04c5 81            	ret
2004                     ; 453 uint16_t UART1_ReceiveData9(void)
2004                     ; 454 {
2005                     	switch	.text
2006  04c6               _UART1_ReceiveData9:
2008  04c6 89            	pushw	x
2009       00000002      OFST:	set	2
2012                     ; 455   uint16_t temp = 0;
2014                     ; 457   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
2016  04c7 c65234        	ld	a,21044
2017  04ca 5f            	clrw	x
2018  04cb a480          	and	a,#128
2019  04cd 5f            	clrw	x
2020  04ce 02            	rlwa	x,a
2021  04cf 58            	sllw	x
2022  04d0 1f01          	ldw	(OFST-1,sp),x
2023                     ; 458   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
2025  04d2 c65231        	ld	a,21041
2026  04d5 5f            	clrw	x
2027  04d6 97            	ld	xl,a
2028  04d7 01            	rrwa	x,a
2029  04d8 1a02          	or	a,(OFST+0,sp)
2030  04da 01            	rrwa	x,a
2031  04db 1a01          	or	a,(OFST-1,sp)
2032  04dd 01            	rrwa	x,a
2033  04de 01            	rrwa	x,a
2034  04df a4ff          	and	a,#255
2035  04e1 01            	rrwa	x,a
2036  04e2 a401          	and	a,#1
2037  04e4 01            	rrwa	x,a
2040  04e5 5b02          	addw	sp,#2
2041  04e7 81            	ret
2075                     ; 466 void UART1_SendData8(uint8_t Data)
2075                     ; 467 {
2076                     	switch	.text
2077  04e8               _UART1_SendData8:
2081                     ; 469     UART1->DR = Data;
2083  04e8 c75231        	ld	21041,a
2084                     ; 470 }
2087  04eb 81            	ret
2121                     ; 478 void UART1_SendData9(uint16_t Data)
2121                     ; 479 {
2122                     	switch	.text
2123  04ec               _UART1_SendData9:
2125  04ec 89            	pushw	x
2126       00000000      OFST:	set	0
2129                     ; 481     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2131  04ed 721d5234      	bres	21044,#6
2132                     ; 483     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2134  04f1 54            	srlw	x
2135  04f2 54            	srlw	x
2136  04f3 9f            	ld	a,xl
2137  04f4 a440          	and	a,#64
2138  04f6 ca5234        	or	a,21044
2139  04f9 c75234        	ld	21044,a
2140                     ; 485     UART1->DR   = (uint8_t)(Data);
2142  04fc 7b02          	ld	a,(OFST+2,sp)
2143  04fe c75231        	ld	21041,a
2144                     ; 486 }
2147  0501 85            	popw	x
2148  0502 81            	ret
2171                     ; 493 void UART1_SendBreak(void)
2171                     ; 494 {
2172                     	switch	.text
2173  0503               _UART1_SendBreak:
2177                     ; 495     UART1->CR2 |= UART1_CR2_SBK;
2179  0503 72105235      	bset	21045,#0
2180                     ; 496 }
2183  0507 81            	ret
2218                     ; 503 void UART1_SetAddress(uint8_t UART1_Address)
2218                     ; 504 {
2219                     	switch	.text
2220  0508               _UART1_SetAddress:
2222  0508 88            	push	a
2223       00000000      OFST:	set	0
2226                     ; 506     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2228  0509 a110          	cp	a,#16
2229  050b 2403          	jruge	L422
2230  050d 4f            	clr	a
2231  050e 2010          	jra	L622
2232  0510               L422:
2233  0510 ae01fa        	ldw	x,#506
2234  0513 89            	pushw	x
2235  0514 ae0000        	ldw	x,#0
2236  0517 89            	pushw	x
2237  0518 ae0008        	ldw	x,#L371
2238  051b cd0000        	call	_assert_failed
2240  051e 5b04          	addw	sp,#4
2241  0520               L622:
2242                     ; 509     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2244  0520 c65237        	ld	a,21047
2245  0523 a4f0          	and	a,#240
2246  0525 c75237        	ld	21047,a
2247                     ; 511     UART1->CR4 |= UART1_Address;
2249  0528 c65237        	ld	a,21047
2250  052b 1a01          	or	a,(OFST+1,sp)
2251  052d c75237        	ld	21047,a
2252                     ; 512 }
2255  0530 84            	pop	a
2256  0531 81            	ret
2290                     ; 520 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2290                     ; 521 {
2291                     	switch	.text
2292  0532               _UART1_SetGuardTime:
2296                     ; 523     UART1->GTR = UART1_GuardTime;
2298  0532 c75239        	ld	21049,a
2299                     ; 524 }
2302  0535 81            	ret
2336                     ; 548 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2336                     ; 549 {
2337                     	switch	.text
2338  0536               _UART1_SetPrescaler:
2342                     ; 551     UART1->PSCR = UART1_Prescaler;
2344  0536 c7523a        	ld	21050,a
2345                     ; 552 }
2348  0539 81            	ret
2492                     ; 560 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2492                     ; 561 {
2493                     	switch	.text
2494  053a               _UART1_GetFlagStatus:
2496  053a 89            	pushw	x
2497  053b 88            	push	a
2498       00000001      OFST:	set	1
2501                     ; 562     FlagStatus status = RESET;
2503                     ; 565     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2505  053c a30080        	cpw	x,#128
2506  053f 272d          	jreq	L042
2507  0541 a30040        	cpw	x,#64
2508  0544 2728          	jreq	L042
2509  0546 a30020        	cpw	x,#32
2510  0549 2723          	jreq	L042
2511  054b a30010        	cpw	x,#16
2512  054e 271e          	jreq	L042
2513  0550 a30008        	cpw	x,#8
2514  0553 2719          	jreq	L042
2515  0555 a30004        	cpw	x,#4
2516  0558 2714          	jreq	L042
2517  055a a30002        	cpw	x,#2
2518  055d 270f          	jreq	L042
2519  055f a30001        	cpw	x,#1
2520  0562 270a          	jreq	L042
2521  0564 a30101        	cpw	x,#257
2522  0567 2705          	jreq	L042
2523  0569 a30210        	cpw	x,#528
2524  056c 2603          	jrne	L632
2525  056e               L042:
2526  056e 4f            	clr	a
2527  056f 2010          	jra	L242
2528  0571               L632:
2529  0571 ae0235        	ldw	x,#565
2530  0574 89            	pushw	x
2531  0575 ae0000        	ldw	x,#0
2532  0578 89            	pushw	x
2533  0579 ae0008        	ldw	x,#L371
2534  057c cd0000        	call	_assert_failed
2536  057f 5b04          	addw	sp,#4
2537  0581               L242:
2538                     ; 569     if (UART1_FLAG == UART1_FLAG_LBDF)
2540  0581 1e02          	ldw	x,(OFST+1,sp)
2541  0583 a30210        	cpw	x,#528
2542  0586 2611          	jrne	L1601
2543                     ; 571         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2545  0588 c65237        	ld	a,21047
2546  058b 1503          	bcp	a,(OFST+2,sp)
2547  058d 2706          	jreq	L3601
2548                     ; 574             status = SET;
2550  058f a601          	ld	a,#1
2551  0591 6b01          	ld	(OFST+0,sp),a
2553  0593 202b          	jra	L7601
2554  0595               L3601:
2555                     ; 579             status = RESET;
2557  0595 0f01          	clr	(OFST+0,sp)
2558  0597 2027          	jra	L7601
2559  0599               L1601:
2560                     ; 582     else if (UART1_FLAG == UART1_FLAG_SBK)
2562  0599 1e02          	ldw	x,(OFST+1,sp)
2563  059b a30101        	cpw	x,#257
2564  059e 2611          	jrne	L1701
2565                     ; 584         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2567  05a0 c65235        	ld	a,21045
2568  05a3 1503          	bcp	a,(OFST+2,sp)
2569  05a5 2706          	jreq	L3701
2570                     ; 587             status = SET;
2572  05a7 a601          	ld	a,#1
2573  05a9 6b01          	ld	(OFST+0,sp),a
2575  05ab 2013          	jra	L7601
2576  05ad               L3701:
2577                     ; 592             status = RESET;
2579  05ad 0f01          	clr	(OFST+0,sp)
2580  05af 200f          	jra	L7601
2581  05b1               L1701:
2582                     ; 597         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2584  05b1 c65230        	ld	a,21040
2585  05b4 1503          	bcp	a,(OFST+2,sp)
2586  05b6 2706          	jreq	L1011
2587                     ; 600             status = SET;
2589  05b8 a601          	ld	a,#1
2590  05ba 6b01          	ld	(OFST+0,sp),a
2592  05bc 2002          	jra	L7601
2593  05be               L1011:
2594                     ; 605             status = RESET;
2596  05be 0f01          	clr	(OFST+0,sp)
2597  05c0               L7601:
2598                     ; 609     return status;
2600  05c0 7b01          	ld	a,(OFST+0,sp)
2603  05c2 5b03          	addw	sp,#3
2604  05c4 81            	ret
2640                     ; 639 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2640                     ; 640 {
2641                     	switch	.text
2642  05c5               _UART1_ClearFlag:
2644  05c5 89            	pushw	x
2645       00000000      OFST:	set	0
2648                     ; 641     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2650  05c6 a30020        	cpw	x,#32
2651  05c9 2705          	jreq	L052
2652  05cb a30210        	cpw	x,#528
2653  05ce 2603          	jrne	L642
2654  05d0               L052:
2655  05d0 4f            	clr	a
2656  05d1 2010          	jra	L252
2657  05d3               L642:
2658  05d3 ae0281        	ldw	x,#641
2659  05d6 89            	pushw	x
2660  05d7 ae0000        	ldw	x,#0
2661  05da 89            	pushw	x
2662  05db ae0008        	ldw	x,#L371
2663  05de cd0000        	call	_assert_failed
2665  05e1 5b04          	addw	sp,#4
2666  05e3               L252:
2667                     ; 644     if (UART1_FLAG == UART1_FLAG_RXNE)
2669  05e3 1e01          	ldw	x,(OFST+1,sp)
2670  05e5 a30020        	cpw	x,#32
2671  05e8 2606          	jrne	L3211
2672                     ; 646         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2674  05ea 35df5230      	mov	21040,#223
2676  05ee 2004          	jra	L5211
2677  05f0               L3211:
2678                     ; 651         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2680  05f0 72195237      	bres	21047,#4
2681  05f4               L5211:
2682                     ; 653 }
2685  05f4 85            	popw	x
2686  05f5 81            	ret
2769                     ; 668 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2769                     ; 669 {
2770                     	switch	.text
2771  05f6               _UART1_GetITStatus:
2773  05f6 89            	pushw	x
2774  05f7 89            	pushw	x
2775       00000002      OFST:	set	2
2778                     ; 670     ITStatus pendingbitstatus = RESET;
2780                     ; 671     uint8_t itpos = 0;
2782                     ; 672     uint8_t itmask1 = 0;
2784                     ; 673     uint8_t itmask2 = 0;
2786                     ; 674     uint8_t enablestatus = 0;
2788                     ; 677     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2790  05f8 a30277        	cpw	x,#631
2791  05fb 271e          	jreq	L062
2792  05fd a30266        	cpw	x,#614
2793  0600 2719          	jreq	L062
2794  0602 a30255        	cpw	x,#597
2795  0605 2714          	jreq	L062
2796  0607 a30244        	cpw	x,#580
2797  060a 270f          	jreq	L062
2798  060c a30235        	cpw	x,#565
2799  060f 270a          	jreq	L062
2800  0611 a30346        	cpw	x,#838
2801  0614 2705          	jreq	L062
2802  0616 a30100        	cpw	x,#256
2803  0619 2603          	jrne	L652
2804  061b               L062:
2805  061b 4f            	clr	a
2806  061c 2010          	jra	L262
2807  061e               L652:
2808  061e ae02a5        	ldw	x,#677
2809  0621 89            	pushw	x
2810  0622 ae0000        	ldw	x,#0
2811  0625 89            	pushw	x
2812  0626 ae0008        	ldw	x,#L371
2813  0629 cd0000        	call	_assert_failed
2815  062c 5b04          	addw	sp,#4
2816  062e               L262:
2817                     ; 680     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2819  062e 7b04          	ld	a,(OFST+2,sp)
2820  0630 a40f          	and	a,#15
2821  0632 5f            	clrw	x
2822  0633 97            	ld	xl,a
2823  0634 a601          	ld	a,#1
2824  0636 5d            	tnzw	x
2825  0637 2704          	jreq	L462
2826  0639               L662:
2827  0639 48            	sll	a
2828  063a 5a            	decw	x
2829  063b 26fc          	jrne	L662
2830  063d               L462:
2831  063d 6b01          	ld	(OFST-1,sp),a
2832                     ; 682     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2834  063f 7b04          	ld	a,(OFST+2,sp)
2835  0641 4e            	swap	a
2836  0642 a40f          	and	a,#15
2837  0644 6b02          	ld	(OFST+0,sp),a
2838                     ; 684     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2840  0646 7b02          	ld	a,(OFST+0,sp)
2841  0648 5f            	clrw	x
2842  0649 97            	ld	xl,a
2843  064a a601          	ld	a,#1
2844  064c 5d            	tnzw	x
2845  064d 2704          	jreq	L072
2846  064f               L272:
2847  064f 48            	sll	a
2848  0650 5a            	decw	x
2849  0651 26fc          	jrne	L272
2850  0653               L072:
2851  0653 6b02          	ld	(OFST+0,sp),a
2852                     ; 688     if (UART1_IT == UART1_IT_PE)
2854  0655 1e03          	ldw	x,(OFST+1,sp)
2855  0657 a30100        	cpw	x,#256
2856  065a 261c          	jrne	L1711
2857                     ; 691         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2859  065c c65234        	ld	a,21044
2860  065f 1402          	and	a,(OFST+0,sp)
2861  0661 6b02          	ld	(OFST+0,sp),a
2862                     ; 694         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2864  0663 c65230        	ld	a,21040
2865  0666 1501          	bcp	a,(OFST-1,sp)
2866  0668 270a          	jreq	L3711
2868  066a 0d02          	tnz	(OFST+0,sp)
2869  066c 2706          	jreq	L3711
2870                     ; 697             pendingbitstatus = SET;
2872  066e a601          	ld	a,#1
2873  0670 6b02          	ld	(OFST+0,sp),a
2875  0672 2041          	jra	L7711
2876  0674               L3711:
2877                     ; 702             pendingbitstatus = RESET;
2879  0674 0f02          	clr	(OFST+0,sp)
2880  0676 203d          	jra	L7711
2881  0678               L1711:
2882                     ; 706     else if (UART1_IT == UART1_IT_LBDF)
2884  0678 1e03          	ldw	x,(OFST+1,sp)
2885  067a a30346        	cpw	x,#838
2886  067d 261c          	jrne	L1021
2887                     ; 709         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2889  067f c65237        	ld	a,21047
2890  0682 1402          	and	a,(OFST+0,sp)
2891  0684 6b02          	ld	(OFST+0,sp),a
2892                     ; 711         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2894  0686 c65237        	ld	a,21047
2895  0689 1501          	bcp	a,(OFST-1,sp)
2896  068b 270a          	jreq	L3021
2898  068d 0d02          	tnz	(OFST+0,sp)
2899  068f 2706          	jreq	L3021
2900                     ; 714             pendingbitstatus = SET;
2902  0691 a601          	ld	a,#1
2903  0693 6b02          	ld	(OFST+0,sp),a
2905  0695 201e          	jra	L7711
2906  0697               L3021:
2907                     ; 719             pendingbitstatus = RESET;
2909  0697 0f02          	clr	(OFST+0,sp)
2910  0699 201a          	jra	L7711
2911  069b               L1021:
2912                     ; 725         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2914  069b c65235        	ld	a,21045
2915  069e 1402          	and	a,(OFST+0,sp)
2916  06a0 6b02          	ld	(OFST+0,sp),a
2917                     ; 727         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2919  06a2 c65230        	ld	a,21040
2920  06a5 1501          	bcp	a,(OFST-1,sp)
2921  06a7 270a          	jreq	L1121
2923  06a9 0d02          	tnz	(OFST+0,sp)
2924  06ab 2706          	jreq	L1121
2925                     ; 730             pendingbitstatus = SET;
2927  06ad a601          	ld	a,#1
2928  06af 6b02          	ld	(OFST+0,sp),a
2930  06b1 2002          	jra	L7711
2931  06b3               L1121:
2932                     ; 735             pendingbitstatus = RESET;
2934  06b3 0f02          	clr	(OFST+0,sp)
2935  06b5               L7711:
2936                     ; 740     return  pendingbitstatus;
2938  06b5 7b02          	ld	a,(OFST+0,sp)
2941  06b7 5b04          	addw	sp,#4
2942  06b9 81            	ret
2979                     ; 768 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2979                     ; 769 {
2980                     	switch	.text
2981  06ba               _UART1_ClearITPendingBit:
2983  06ba 89            	pushw	x
2984       00000000      OFST:	set	0
2987                     ; 770     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2989  06bb a30255        	cpw	x,#597
2990  06be 2705          	jreq	L003
2991  06c0 a30346        	cpw	x,#838
2992  06c3 2603          	jrne	L672
2993  06c5               L003:
2994  06c5 4f            	clr	a
2995  06c6 2010          	jra	L203
2996  06c8               L672:
2997  06c8 ae0302        	ldw	x,#770
2998  06cb 89            	pushw	x
2999  06cc ae0000        	ldw	x,#0
3000  06cf 89            	pushw	x
3001  06d0 ae0008        	ldw	x,#L371
3002  06d3 cd0000        	call	_assert_failed
3004  06d6 5b04          	addw	sp,#4
3005  06d8               L203:
3006                     ; 773     if (UART1_IT == UART1_IT_RXNE)
3008  06d8 1e01          	ldw	x,(OFST+1,sp)
3009  06da a30255        	cpw	x,#597
3010  06dd 2606          	jrne	L3321
3011                     ; 775         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
3013  06df 35df5230      	mov	21040,#223
3015  06e3 2004          	jra	L5321
3016  06e5               L3321:
3017                     ; 780         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
3019  06e5 72195237      	bres	21047,#4
3020  06e9               L5321:
3021                     ; 782 }
3024  06e9 85            	popw	x
3025  06ea 81            	ret
3038                     	xdef	_UART1_ClearITPendingBit
3039                     	xdef	_UART1_GetITStatus
3040                     	xdef	_UART1_ClearFlag
3041                     	xdef	_UART1_GetFlagStatus
3042                     	xdef	_UART1_SetPrescaler
3043                     	xdef	_UART1_SetGuardTime
3044                     	xdef	_UART1_SetAddress
3045                     	xdef	_UART1_SendBreak
3046                     	xdef	_UART1_SendData9
3047                     	xdef	_UART1_SendData8
3048                     	xdef	_UART1_ReceiveData9
3049                     	xdef	_UART1_ReceiveData8
3050                     	xdef	_UART1_ReceiverWakeUpCmd
3051                     	xdef	_UART1_WakeUpConfig
3052                     	xdef	_UART1_SmartCardNACKCmd
3053                     	xdef	_UART1_SmartCardCmd
3054                     	xdef	_UART1_LINCmd
3055                     	xdef	_UART1_LINBreakDetectionConfig
3056                     	xdef	_UART1_IrDACmd
3057                     	xdef	_UART1_IrDAConfig
3058                     	xdef	_UART1_HalfDuplexCmd
3059                     	xdef	_UART1_ITConfig
3060                     	xdef	_UART1_Cmd
3061                     	xdef	_UART1_Init
3062                     	xdef	_UART1_DeInit
3063                     	xref	_assert_failed
3064                     	xref	_CLK_GetClockFreq
3065                     	switch	.const
3066  0008               L371:
3067  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_u"
3068  001a 617274312e63  	dc.b	"art1.c",0
3069                     	xref.b	c_lreg
3070                     	xref.b	c_x
3090                     	xref	c_lursh
3091                     	xref	c_lsub
3092                     	xref	c_smul
3093                     	xref	c_ludv
3094                     	xref	c_rtol
3095                     	xref	c_llsh
3096                     	xref	c_lcmp
3097                     	xref	c_ltor
3098                     	end

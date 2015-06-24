   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 48 void UART3_DeInit(void)
  44                     ; 49 {
  46                     	switch	.text
  47  0000               _UART3_DeInit:
  51                     ; 52     (void) UART3->SR;
  53  0000 c65240        	ld	a,21056
  54                     ; 53     (void) UART3->DR;
  56  0003 c65241        	ld	a,21057
  57                     ; 55     UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  59  0006 725f5243      	clr	21059
  60                     ; 56     UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  62  000a 725f5242      	clr	21058
  63                     ; 58     UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  65  000e 725f5244      	clr	21060
  66                     ; 59     UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  68  0012 725f5245      	clr	21061
  69                     ; 60     UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  71  0016 725f5246      	clr	21062
  72                     ; 61     UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  74  001a 725f5247      	clr	21063
  75                     ; 62     UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  77  001e 725f5249      	clr	21065
  78                     ; 64 }
  81  0022 81            	ret
 309                     .const:	section	.text
 310  0000               L43:
 311  0000 00098969      	dc.l	625001
 312  0004               L64:
 313  0004 00000064      	dc.l	100
 314                     ; 78 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 314                     ; 79                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 314                     ; 80                 UART3_Mode_TypeDef Mode)
 314                     ; 81 {
 315                     	switch	.text
 316  0023               _UART3_Init:
 318  0023 520e          	subw	sp,#14
 319       0000000e      OFST:	set	14
 322                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 326                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 330                     ; 86     assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 332  0025 0d15          	tnz	(OFST+7,sp)
 333  0027 2706          	jreq	L21
 334  0029 7b15          	ld	a,(OFST+7,sp)
 335  002b a110          	cp	a,#16
 336  002d 2603          	jrne	L01
 337  002f               L21:
 338  002f 4f            	clr	a
 339  0030 2010          	jra	L41
 340  0032               L01:
 341  0032 ae0056        	ldw	x,#86
 342  0035 89            	pushw	x
 343  0036 ae0000        	ldw	x,#0
 344  0039 89            	pushw	x
 345  003a ae0008        	ldw	x,#L741
 346  003d cd0000        	call	_assert_failed
 348  0040 5b04          	addw	sp,#4
 349  0042               L41:
 350                     ; 87     assert_param(IS_UART3_STOPBITS_OK(StopBits));
 352  0042 0d16          	tnz	(OFST+8,sp)
 353  0044 2706          	jreq	L02
 354  0046 7b16          	ld	a,(OFST+8,sp)
 355  0048 a120          	cp	a,#32
 356  004a 2603          	jrne	L61
 357  004c               L02:
 358  004c 4f            	clr	a
 359  004d 2010          	jra	L22
 360  004f               L61:
 361  004f ae0057        	ldw	x,#87
 362  0052 89            	pushw	x
 363  0053 ae0000        	ldw	x,#0
 364  0056 89            	pushw	x
 365  0057 ae0008        	ldw	x,#L741
 366  005a cd0000        	call	_assert_failed
 368  005d 5b04          	addw	sp,#4
 369  005f               L22:
 370                     ; 88     assert_param(IS_UART3_PARITY_OK(Parity));
 372  005f 0d17          	tnz	(OFST+9,sp)
 373  0061 270c          	jreq	L62
 374  0063 7b17          	ld	a,(OFST+9,sp)
 375  0065 a104          	cp	a,#4
 376  0067 2706          	jreq	L62
 377  0069 7b17          	ld	a,(OFST+9,sp)
 378  006b a106          	cp	a,#6
 379  006d 2603          	jrne	L42
 380  006f               L62:
 381  006f 4f            	clr	a
 382  0070 2010          	jra	L03
 383  0072               L42:
 384  0072 ae0058        	ldw	x,#88
 385  0075 89            	pushw	x
 386  0076 ae0000        	ldw	x,#0
 387  0079 89            	pushw	x
 388  007a ae0008        	ldw	x,#L741
 389  007d cd0000        	call	_assert_failed
 391  0080 5b04          	addw	sp,#4
 392  0082               L03:
 393                     ; 89     assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 395  0082 96            	ldw	x,sp
 396  0083 1c0011        	addw	x,#OFST+3
 397  0086 cd0000        	call	c_ltor
 399  0089 ae0000        	ldw	x,#L43
 400  008c cd0000        	call	c_lcmp
 402  008f 2403          	jruge	L23
 403  0091 4f            	clr	a
 404  0092 2010          	jra	L63
 405  0094               L23:
 406  0094 ae0059        	ldw	x,#89
 407  0097 89            	pushw	x
 408  0098 ae0000        	ldw	x,#0
 409  009b 89            	pushw	x
 410  009c ae0008        	ldw	x,#L741
 411  009f cd0000        	call	_assert_failed
 413  00a2 5b04          	addw	sp,#4
 414  00a4               L63:
 415                     ; 90     assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 417  00a4 7b18          	ld	a,(OFST+10,sp)
 418  00a6 a108          	cp	a,#8
 419  00a8 2730          	jreq	L24
 420  00aa 7b18          	ld	a,(OFST+10,sp)
 421  00ac a140          	cp	a,#64
 422  00ae 272a          	jreq	L24
 423  00b0 7b18          	ld	a,(OFST+10,sp)
 424  00b2 a104          	cp	a,#4
 425  00b4 2724          	jreq	L24
 426  00b6 7b18          	ld	a,(OFST+10,sp)
 427  00b8 a180          	cp	a,#128
 428  00ba 271e          	jreq	L24
 429  00bc 7b18          	ld	a,(OFST+10,sp)
 430  00be a10c          	cp	a,#12
 431  00c0 2718          	jreq	L24
 432  00c2 7b18          	ld	a,(OFST+10,sp)
 433  00c4 a10c          	cp	a,#12
 434  00c6 2712          	jreq	L24
 435  00c8 7b18          	ld	a,(OFST+10,sp)
 436  00ca a144          	cp	a,#68
 437  00cc 270c          	jreq	L24
 438  00ce 7b18          	ld	a,(OFST+10,sp)
 439  00d0 a1c0          	cp	a,#192
 440  00d2 2706          	jreq	L24
 441  00d4 7b18          	ld	a,(OFST+10,sp)
 442  00d6 a188          	cp	a,#136
 443  00d8 2603          	jrne	L04
 444  00da               L24:
 445  00da 4f            	clr	a
 446  00db 2010          	jra	L44
 447  00dd               L04:
 448  00dd ae005a        	ldw	x,#90
 449  00e0 89            	pushw	x
 450  00e1 ae0000        	ldw	x,#0
 451  00e4 89            	pushw	x
 452  00e5 ae0008        	ldw	x,#L741
 453  00e8 cd0000        	call	_assert_failed
 455  00eb 5b04          	addw	sp,#4
 456  00ed               L44:
 457                     ; 93     UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 459  00ed 72195244      	bres	21060,#4
 460                     ; 95     UART3->CR1 |= (uint8_t)WordLength; 
 462  00f1 c65244        	ld	a,21060
 463  00f4 1a15          	or	a,(OFST+7,sp)
 464  00f6 c75244        	ld	21060,a
 465                     ; 98     UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 467  00f9 c65246        	ld	a,21062
 468  00fc a4cf          	and	a,#207
 469  00fe c75246        	ld	21062,a
 470                     ; 100     UART3->CR3 |= (uint8_t)StopBits;  
 472  0101 c65246        	ld	a,21062
 473  0104 1a16          	or	a,(OFST+8,sp)
 474  0106 c75246        	ld	21062,a
 475                     ; 103     UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 477  0109 c65244        	ld	a,21060
 478  010c a4f9          	and	a,#249
 479  010e c75244        	ld	21060,a
 480                     ; 105     UART3->CR1 |= (uint8_t)Parity;     
 482  0111 c65244        	ld	a,21060
 483  0114 1a17          	or	a,(OFST+9,sp)
 484  0116 c75244        	ld	21060,a
 485                     ; 108     UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 487  0119 725f5242      	clr	21058
 488                     ; 110     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 490  011d c65243        	ld	a,21059
 491  0120 a40f          	and	a,#15
 492  0122 c75243        	ld	21059,a
 493                     ; 112     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 495  0125 c65243        	ld	a,21059
 496  0128 a4f0          	and	a,#240
 497  012a c75243        	ld	21059,a
 498                     ; 115     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 500  012d 96            	ldw	x,sp
 501  012e 1c0011        	addw	x,#OFST+3
 502  0131 cd0000        	call	c_ltor
 504  0134 a604          	ld	a,#4
 505  0136 cd0000        	call	c_llsh
 507  0139 96            	ldw	x,sp
 508  013a 1c0001        	addw	x,#OFST-13
 509  013d cd0000        	call	c_rtol
 511  0140 cd0000        	call	_CLK_GetClockFreq
 513  0143 96            	ldw	x,sp
 514  0144 1c0001        	addw	x,#OFST-13
 515  0147 cd0000        	call	c_ludv
 517  014a 96            	ldw	x,sp
 518  014b 1c000b        	addw	x,#OFST-3
 519  014e cd0000        	call	c_rtol
 521                     ; 116     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 523  0151 96            	ldw	x,sp
 524  0152 1c0011        	addw	x,#OFST+3
 525  0155 cd0000        	call	c_ltor
 527  0158 a604          	ld	a,#4
 528  015a cd0000        	call	c_llsh
 530  015d 96            	ldw	x,sp
 531  015e 1c0001        	addw	x,#OFST-13
 532  0161 cd0000        	call	c_rtol
 534  0164 cd0000        	call	_CLK_GetClockFreq
 536  0167 a664          	ld	a,#100
 537  0169 cd0000        	call	c_smul
 539  016c 96            	ldw	x,sp
 540  016d 1c0001        	addw	x,#OFST-13
 541  0170 cd0000        	call	c_ludv
 543  0173 96            	ldw	x,sp
 544  0174 1c0007        	addw	x,#OFST-7
 545  0177 cd0000        	call	c_rtol
 547                     ; 119     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 547                     ; 120                         << 4) / 100) & (uint8_t)0x0F); 
 549  017a 96            	ldw	x,sp
 550  017b 1c000b        	addw	x,#OFST-3
 551  017e cd0000        	call	c_ltor
 553  0181 a664          	ld	a,#100
 554  0183 cd0000        	call	c_smul
 556  0186 96            	ldw	x,sp
 557  0187 1c0001        	addw	x,#OFST-13
 558  018a cd0000        	call	c_rtol
 560  018d 96            	ldw	x,sp
 561  018e 1c0007        	addw	x,#OFST-7
 562  0191 cd0000        	call	c_ltor
 564  0194 96            	ldw	x,sp
 565  0195 1c0001        	addw	x,#OFST-13
 566  0198 cd0000        	call	c_lsub
 568  019b a604          	ld	a,#4
 569  019d cd0000        	call	c_llsh
 571  01a0 ae0004        	ldw	x,#L64
 572  01a3 cd0000        	call	c_ludv
 574  01a6 b603          	ld	a,c_lreg+3
 575  01a8 a40f          	and	a,#15
 576  01aa 6b05          	ld	(OFST-9,sp),a
 577                     ; 121     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 579  01ac 96            	ldw	x,sp
 580  01ad 1c000b        	addw	x,#OFST-3
 581  01b0 cd0000        	call	c_ltor
 583  01b3 a604          	ld	a,#4
 584  01b5 cd0000        	call	c_lursh
 586  01b8 b603          	ld	a,c_lreg+3
 587  01ba a4f0          	and	a,#240
 588  01bc b703          	ld	c_lreg+3,a
 589  01be 3f02          	clr	c_lreg+2
 590  01c0 3f01          	clr	c_lreg+1
 591  01c2 3f00          	clr	c_lreg
 592  01c4 b603          	ld	a,c_lreg+3
 593  01c6 6b06          	ld	(OFST-8,sp),a
 594                     ; 123     UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 596  01c8 7b05          	ld	a,(OFST-9,sp)
 597  01ca 1a06          	or	a,(OFST-8,sp)
 598  01cc c75243        	ld	21059,a
 599                     ; 125     UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 601  01cf 7b0e          	ld	a,(OFST+0,sp)
 602  01d1 c75242        	ld	21058,a
 603                     ; 127     if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 605  01d4 7b18          	ld	a,(OFST+10,sp)
 606  01d6 a504          	bcp	a,#4
 607  01d8 2706          	jreq	L151
 608                     ; 130         UART3->CR2 |= UART3_CR2_TEN;  
 610  01da 72165245      	bset	21061,#3
 612  01de 2004          	jra	L351
 613  01e0               L151:
 614                     ; 135         UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 616  01e0 72175245      	bres	21061,#3
 617  01e4               L351:
 618                     ; 137     if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 620  01e4 7b18          	ld	a,(OFST+10,sp)
 621  01e6 a508          	bcp	a,#8
 622  01e8 2706          	jreq	L551
 623                     ; 140         UART3->CR2 |= UART3_CR2_REN;  
 625  01ea 72145245      	bset	21061,#2
 627  01ee 2004          	jra	L751
 628  01f0               L551:
 629                     ; 145         UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 631  01f0 72155245      	bres	21061,#2
 632  01f4               L751:
 633                     ; 147 }
 636  01f4 5b0e          	addw	sp,#14
 637  01f6 81            	ret
 692                     ; 155 void UART3_Cmd(FunctionalState NewState)
 692                     ; 156 {
 693                     	switch	.text
 694  01f7               _UART3_Cmd:
 698                     ; 158     if (NewState != DISABLE)
 700  01f7 4d            	tnz	a
 701  01f8 2706          	jreq	L702
 702                     ; 161         UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 704  01fa 721b5244      	bres	21060,#5
 706  01fe 2004          	jra	L112
 707  0200               L702:
 708                     ; 166         UART3->CR1 |= UART3_CR1_UARTD;  
 710  0200 721a5244      	bset	21060,#5
 711  0204               L112:
 712                     ; 168 }
 715  0204 81            	ret
 848                     ; 185 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 848                     ; 186 {
 849                     	switch	.text
 850  0205               _UART3_ITConfig:
 852  0205 89            	pushw	x
 853  0206 89            	pushw	x
 854       00000002      OFST:	set	2
 857                     ; 187     uint8_t uartreg = 0, itpos = 0x00;
 861                     ; 190     assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 863  0207 a30100        	cpw	x,#256
 864  020a 271e          	jreq	L65
 865  020c a30277        	cpw	x,#631
 866  020f 2719          	jreq	L65
 867  0211 a30266        	cpw	x,#614
 868  0214 2714          	jreq	L65
 869  0216 a30205        	cpw	x,#517
 870  0219 270f          	jreq	L65
 871  021b a30244        	cpw	x,#580
 872  021e 270a          	jreq	L65
 873  0220 a30412        	cpw	x,#1042
 874  0223 2705          	jreq	L65
 875  0225 a30346        	cpw	x,#838
 876  0228 2603          	jrne	L45
 877  022a               L65:
 878  022a 4f            	clr	a
 879  022b 2010          	jra	L06
 880  022d               L45:
 881  022d ae00be        	ldw	x,#190
 882  0230 89            	pushw	x
 883  0231 ae0000        	ldw	x,#0
 884  0234 89            	pushw	x
 885  0235 ae0008        	ldw	x,#L741
 886  0238 cd0000        	call	_assert_failed
 888  023b 5b04          	addw	sp,#4
 889  023d               L06:
 890                     ; 191     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 892  023d 0d07          	tnz	(OFST+5,sp)
 893  023f 2706          	jreq	L46
 894  0241 7b07          	ld	a,(OFST+5,sp)
 895  0243 a101          	cp	a,#1
 896  0245 2603          	jrne	L26
 897  0247               L46:
 898  0247 4f            	clr	a
 899  0248 2010          	jra	L66
 900  024a               L26:
 901  024a ae00bf        	ldw	x,#191
 902  024d 89            	pushw	x
 903  024e ae0000        	ldw	x,#0
 904  0251 89            	pushw	x
 905  0252 ae0008        	ldw	x,#L741
 906  0255 cd0000        	call	_assert_failed
 908  0258 5b04          	addw	sp,#4
 909  025a               L66:
 910                     ; 194     uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 912  025a 7b03          	ld	a,(OFST+1,sp)
 913  025c 6b01          	ld	(OFST-1,sp),a
 914                     ; 197     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 916  025e 7b04          	ld	a,(OFST+2,sp)
 917  0260 a40f          	and	a,#15
 918  0262 5f            	clrw	x
 919  0263 97            	ld	xl,a
 920  0264 a601          	ld	a,#1
 921  0266 5d            	tnzw	x
 922  0267 2704          	jreq	L07
 923  0269               L27:
 924  0269 48            	sll	a
 925  026a 5a            	decw	x
 926  026b 26fc          	jrne	L27
 927  026d               L07:
 928  026d 6b02          	ld	(OFST+0,sp),a
 929                     ; 199     if (NewState != DISABLE)
 931  026f 0d07          	tnz	(OFST+5,sp)
 932  0271 273a          	jreq	L372
 933                     ; 202         if (uartreg == 0x01)
 935  0273 7b01          	ld	a,(OFST-1,sp)
 936  0275 a101          	cp	a,#1
 937  0277 260a          	jrne	L572
 938                     ; 204             UART3->CR1 |= itpos;
 940  0279 c65244        	ld	a,21060
 941  027c 1a02          	or	a,(OFST+0,sp)
 942  027e c75244        	ld	21060,a
 944  0281 2066          	jra	L113
 945  0283               L572:
 946                     ; 206         else if (uartreg == 0x02)
 948  0283 7b01          	ld	a,(OFST-1,sp)
 949  0285 a102          	cp	a,#2
 950  0287 260a          	jrne	L103
 951                     ; 208             UART3->CR2 |= itpos;
 953  0289 c65245        	ld	a,21061
 954  028c 1a02          	or	a,(OFST+0,sp)
 955  028e c75245        	ld	21061,a
 957  0291 2056          	jra	L113
 958  0293               L103:
 959                     ; 210         else if (uartreg == 0x03)
 961  0293 7b01          	ld	a,(OFST-1,sp)
 962  0295 a103          	cp	a,#3
 963  0297 260a          	jrne	L503
 964                     ; 212             UART3->CR4 |= itpos;
 966  0299 c65247        	ld	a,21063
 967  029c 1a02          	or	a,(OFST+0,sp)
 968  029e c75247        	ld	21063,a
 970  02a1 2046          	jra	L113
 971  02a3               L503:
 972                     ; 216             UART3->CR6 |= itpos;
 974  02a3 c65249        	ld	a,21065
 975  02a6 1a02          	or	a,(OFST+0,sp)
 976  02a8 c75249        	ld	21065,a
 977  02ab 203c          	jra	L113
 978  02ad               L372:
 979                     ; 222         if (uartreg == 0x01)
 981  02ad 7b01          	ld	a,(OFST-1,sp)
 982  02af a101          	cp	a,#1
 983  02b1 260b          	jrne	L313
 984                     ; 224             UART3->CR1 &= (uint8_t)(~itpos);
 986  02b3 7b02          	ld	a,(OFST+0,sp)
 987  02b5 43            	cpl	a
 988  02b6 c45244        	and	a,21060
 989  02b9 c75244        	ld	21060,a
 991  02bc 202b          	jra	L113
 992  02be               L313:
 993                     ; 226         else if (uartreg == 0x02)
 995  02be 7b01          	ld	a,(OFST-1,sp)
 996  02c0 a102          	cp	a,#2
 997  02c2 260b          	jrne	L713
 998                     ; 228             UART3->CR2 &= (uint8_t)(~itpos);
1000  02c4 7b02          	ld	a,(OFST+0,sp)
1001  02c6 43            	cpl	a
1002  02c7 c45245        	and	a,21061
1003  02ca c75245        	ld	21061,a
1005  02cd 201a          	jra	L113
1006  02cf               L713:
1007                     ; 230         else if (uartreg == 0x03)
1009  02cf 7b01          	ld	a,(OFST-1,sp)
1010  02d1 a103          	cp	a,#3
1011  02d3 260b          	jrne	L323
1012                     ; 232             UART3->CR4 &= (uint8_t)(~itpos);
1014  02d5 7b02          	ld	a,(OFST+0,sp)
1015  02d7 43            	cpl	a
1016  02d8 c45247        	and	a,21063
1017  02db c75247        	ld	21063,a
1019  02de 2009          	jra	L113
1020  02e0               L323:
1021                     ; 236             UART3->CR6 &= (uint8_t)(~itpos);
1023  02e0 7b02          	ld	a,(OFST+0,sp)
1024  02e2 43            	cpl	a
1025  02e3 c45249        	and	a,21065
1026  02e6 c75249        	ld	21065,a
1027  02e9               L113:
1028                     ; 239 }
1031  02e9 5b04          	addw	sp,#4
1032  02eb 81            	ret
1092                     ; 248 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1092                     ; 249 {
1093                     	switch	.text
1094  02ec               _UART3_LINBreakDetectionConfig:
1096  02ec 88            	push	a
1097       00000000      OFST:	set	0
1100                     ; 251     assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1102  02ed 4d            	tnz	a
1103  02ee 2704          	jreq	L001
1104  02f0 a101          	cp	a,#1
1105  02f2 2603          	jrne	L67
1106  02f4               L001:
1107  02f4 4f            	clr	a
1108  02f5 2010          	jra	L201
1109  02f7               L67:
1110  02f7 ae00fb        	ldw	x,#251
1111  02fa 89            	pushw	x
1112  02fb ae0000        	ldw	x,#0
1113  02fe 89            	pushw	x
1114  02ff ae0008        	ldw	x,#L741
1115  0302 cd0000        	call	_assert_failed
1117  0305 5b04          	addw	sp,#4
1118  0307               L201:
1119                     ; 253     if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1121  0307 0d01          	tnz	(OFST+1,sp)
1122  0309 2706          	jreq	L553
1123                     ; 255         UART3->CR4 |= UART3_CR4_LBDL;
1125  030b 721a5247      	bset	21063,#5
1127  030f 2004          	jra	L753
1128  0311               L553:
1129                     ; 259         UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1131  0311 721b5247      	bres	21063,#5
1132  0315               L753:
1133                     ; 261 }
1136  0315 84            	pop	a
1137  0316 81            	ret
1259                     ; 273 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1259                     ; 274                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1259                     ; 275                      UART3_LinDivUp_TypeDef UART3_DivUp)
1259                     ; 276 {
1260                     	switch	.text
1261  0317               _UART3_LINConfig:
1263  0317 89            	pushw	x
1264       00000000      OFST:	set	0
1267                     ; 278     assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1269  0318 9e            	ld	a,xh
1270  0319 4d            	tnz	a
1271  031a 2705          	jreq	L011
1272  031c 9e            	ld	a,xh
1273  031d a101          	cp	a,#1
1274  031f 2603          	jrne	L601
1275  0321               L011:
1276  0321 4f            	clr	a
1277  0322 2010          	jra	L211
1278  0324               L601:
1279  0324 ae0116        	ldw	x,#278
1280  0327 89            	pushw	x
1281  0328 ae0000        	ldw	x,#0
1282  032b 89            	pushw	x
1283  032c ae0008        	ldw	x,#L741
1284  032f cd0000        	call	_assert_failed
1286  0332 5b04          	addw	sp,#4
1287  0334               L211:
1288                     ; 279     assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1290  0334 7b02          	ld	a,(OFST+2,sp)
1291  0336 a101          	cp	a,#1
1292  0338 2704          	jreq	L611
1293  033a 0d02          	tnz	(OFST+2,sp)
1294  033c 2603          	jrne	L411
1295  033e               L611:
1296  033e 4f            	clr	a
1297  033f 2010          	jra	L021
1298  0341               L411:
1299  0341 ae0117        	ldw	x,#279
1300  0344 89            	pushw	x
1301  0345 ae0000        	ldw	x,#0
1302  0348 89            	pushw	x
1303  0349 ae0008        	ldw	x,#L741
1304  034c cd0000        	call	_assert_failed
1306  034f 5b04          	addw	sp,#4
1307  0351               L021:
1308                     ; 280     assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1310  0351 0d05          	tnz	(OFST+5,sp)
1311  0353 2706          	jreq	L421
1312  0355 7b05          	ld	a,(OFST+5,sp)
1313  0357 a101          	cp	a,#1
1314  0359 2603          	jrne	L221
1315  035b               L421:
1316  035b 4f            	clr	a
1317  035c 2010          	jra	L621
1318  035e               L221:
1319  035e ae0118        	ldw	x,#280
1320  0361 89            	pushw	x
1321  0362 ae0000        	ldw	x,#0
1322  0365 89            	pushw	x
1323  0366 ae0008        	ldw	x,#L741
1324  0369 cd0000        	call	_assert_failed
1326  036c 5b04          	addw	sp,#4
1327  036e               L621:
1328                     ; 282     if (UART3_Mode != UART3_LIN_MODE_MASTER)
1330  036e 0d01          	tnz	(OFST+1,sp)
1331  0370 2706          	jreq	L734
1332                     ; 284         UART3->CR6 |=  UART3_CR6_LSLV;
1334  0372 721a5249      	bset	21065,#5
1336  0376 2004          	jra	L144
1337  0378               L734:
1338                     ; 288         UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1340  0378 721b5249      	bres	21065,#5
1341  037c               L144:
1342                     ; 291     if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1344  037c 0d02          	tnz	(OFST+2,sp)
1345  037e 2706          	jreq	L344
1346                     ; 293         UART3->CR6 |=  UART3_CR6_LASE ;
1348  0380 72185249      	bset	21065,#4
1350  0384 2004          	jra	L544
1351  0386               L344:
1352                     ; 297         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1354  0386 72195249      	bres	21065,#4
1355  038a               L544:
1356                     ; 300     if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1358  038a 0d05          	tnz	(OFST+5,sp)
1359  038c 2706          	jreq	L744
1360                     ; 302         UART3->CR6 |=  UART3_CR6_LDUM;
1362  038e 721e5249      	bset	21065,#7
1364  0392 2004          	jra	L154
1365  0394               L744:
1366                     ; 306         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1368  0394 721f5249      	bres	21065,#7
1369  0398               L154:
1370                     ; 308 }
1373  0398 85            	popw	x
1374  0399 81            	ret
1410                     ; 316 void UART3_LINCmd(FunctionalState NewState)
1410                     ; 317 {
1411                     	switch	.text
1412  039a               _UART3_LINCmd:
1414  039a 88            	push	a
1415       00000000      OFST:	set	0
1418                     ; 319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1420  039b 4d            	tnz	a
1421  039c 2704          	jreq	L431
1422  039e a101          	cp	a,#1
1423  03a0 2603          	jrne	L231
1424  03a2               L431:
1425  03a2 4f            	clr	a
1426  03a3 2010          	jra	L631
1427  03a5               L231:
1428  03a5 ae013f        	ldw	x,#319
1429  03a8 89            	pushw	x
1430  03a9 ae0000        	ldw	x,#0
1431  03ac 89            	pushw	x
1432  03ad ae0008        	ldw	x,#L741
1433  03b0 cd0000        	call	_assert_failed
1435  03b3 5b04          	addw	sp,#4
1436  03b5               L631:
1437                     ; 321     if (NewState != DISABLE)
1439  03b5 0d01          	tnz	(OFST+1,sp)
1440  03b7 2706          	jreq	L174
1441                     ; 324         UART3->CR3 |= UART3_CR3_LINEN;
1443  03b9 721c5246      	bset	21062,#6
1445  03bd 2004          	jra	L374
1446  03bf               L174:
1447                     ; 329         UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1449  03bf 721d5246      	bres	21062,#6
1450  03c3               L374:
1451                     ; 331 }
1454  03c3 84            	pop	a
1455  03c4 81            	ret
1513                     ; 339 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1513                     ; 340 {
1514                     	switch	.text
1515  03c5               _UART3_WakeUpConfig:
1517  03c5 88            	push	a
1518       00000000      OFST:	set	0
1521                     ; 342     assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1523  03c6 4d            	tnz	a
1524  03c7 2704          	jreq	L441
1525  03c9 a108          	cp	a,#8
1526  03cb 2603          	jrne	L241
1527  03cd               L441:
1528  03cd 4f            	clr	a
1529  03ce 2010          	jra	L641
1530  03d0               L241:
1531  03d0 ae0156        	ldw	x,#342
1532  03d3 89            	pushw	x
1533  03d4 ae0000        	ldw	x,#0
1534  03d7 89            	pushw	x
1535  03d8 ae0008        	ldw	x,#L741
1536  03db cd0000        	call	_assert_failed
1538  03de 5b04          	addw	sp,#4
1539  03e0               L641:
1540                     ; 344     UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1542  03e0 72175244      	bres	21060,#3
1543                     ; 345     UART3->CR1 |= (uint8_t)UART3_WakeUp;
1545  03e4 c65244        	ld	a,21060
1546  03e7 1a01          	or	a,(OFST+1,sp)
1547  03e9 c75244        	ld	21060,a
1548                     ; 346 }
1551  03ec 84            	pop	a
1552  03ed 81            	ret
1589                     ; 354 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1589                     ; 355 {
1590                     	switch	.text
1591  03ee               _UART3_ReceiverWakeUpCmd:
1593  03ee 88            	push	a
1594       00000000      OFST:	set	0
1597                     ; 357     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1599  03ef 4d            	tnz	a
1600  03f0 2704          	jreq	L451
1601  03f2 a101          	cp	a,#1
1602  03f4 2603          	jrne	L251
1603  03f6               L451:
1604  03f6 4f            	clr	a
1605  03f7 2010          	jra	L651
1606  03f9               L251:
1607  03f9 ae0165        	ldw	x,#357
1608  03fc 89            	pushw	x
1609  03fd ae0000        	ldw	x,#0
1610  0400 89            	pushw	x
1611  0401 ae0008        	ldw	x,#L741
1612  0404 cd0000        	call	_assert_failed
1614  0407 5b04          	addw	sp,#4
1615  0409               L651:
1616                     ; 359     if (NewState != DISABLE)
1618  0409 0d01          	tnz	(OFST+1,sp)
1619  040b 2706          	jreq	L145
1620                     ; 362         UART3->CR2 |= UART3_CR2_RWU;
1622  040d 72125245      	bset	21061,#1
1624  0411 2004          	jra	L345
1625  0413               L145:
1626                     ; 367         UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1628  0413 72135245      	bres	21061,#1
1629  0417               L345:
1630                     ; 369 }
1633  0417 84            	pop	a
1634  0418 81            	ret
1657                     ; 376 uint8_t UART3_ReceiveData8(void)
1657                     ; 377 {
1658                     	switch	.text
1659  0419               _UART3_ReceiveData8:
1663                     ; 378     return ((uint8_t)UART3->DR);
1665  0419 c65241        	ld	a,21057
1668  041c 81            	ret
1702                     ; 386 uint16_t UART3_ReceiveData9(void)
1702                     ; 387 {
1703                     	switch	.text
1704  041d               _UART3_ReceiveData9:
1706  041d 89            	pushw	x
1707       00000002      OFST:	set	2
1710                     ; 388   uint16_t temp = 0;
1712                     ; 390  temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1714  041e c65244        	ld	a,21060
1715  0421 5f            	clrw	x
1716  0422 a480          	and	a,#128
1717  0424 5f            	clrw	x
1718  0425 02            	rlwa	x,a
1719  0426 58            	sllw	x
1720  0427 1f01          	ldw	(OFST-1,sp),x
1721                     ; 391   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1723  0429 c65241        	ld	a,21057
1724  042c 5f            	clrw	x
1725  042d 97            	ld	xl,a
1726  042e 01            	rrwa	x,a
1727  042f 1a02          	or	a,(OFST+0,sp)
1728  0431 01            	rrwa	x,a
1729  0432 1a01          	or	a,(OFST-1,sp)
1730  0434 01            	rrwa	x,a
1731  0435 01            	rrwa	x,a
1732  0436 a4ff          	and	a,#255
1733  0438 01            	rrwa	x,a
1734  0439 a401          	and	a,#1
1735  043b 01            	rrwa	x,a
1738  043c 5b02          	addw	sp,#2
1739  043e 81            	ret
1773                     ; 399 void UART3_SendData8(uint8_t Data)
1773                     ; 400 {
1774                     	switch	.text
1775  043f               _UART3_SendData8:
1779                     ; 402     UART3->DR = Data;
1781  043f c75241        	ld	21057,a
1782                     ; 403 }
1785  0442 81            	ret
1819                     ; 410 void UART3_SendData9(uint16_t Data)
1819                     ; 411 {
1820                     	switch	.text
1821  0443               _UART3_SendData9:
1823  0443 89            	pushw	x
1824       00000000      OFST:	set	0
1827                     ; 413     UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1829  0444 721d5244      	bres	21060,#6
1830                     ; 416     UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1832  0448 54            	srlw	x
1833  0449 54            	srlw	x
1834  044a 9f            	ld	a,xl
1835  044b a440          	and	a,#64
1836  044d ca5244        	or	a,21060
1837  0450 c75244        	ld	21060,a
1838                     ; 419     UART3->DR   = (uint8_t)(Data);                    
1840  0453 7b02          	ld	a,(OFST+2,sp)
1841  0455 c75241        	ld	21057,a
1842                     ; 420 }
1845  0458 85            	popw	x
1846  0459 81            	ret
1869                     ; 427 void UART3_SendBreak(void)
1869                     ; 428 {
1870                     	switch	.text
1871  045a               _UART3_SendBreak:
1875                     ; 429     UART3->CR2 |= UART3_CR2_SBK;
1877  045a 72105245      	bset	21061,#0
1878                     ; 430 }
1881  045e 81            	ret
1916                     ; 437 void UART3_SetAddress(uint8_t UART3_Address)
1916                     ; 438 {
1917                     	switch	.text
1918  045f               _UART3_SetAddress:
1920  045f 88            	push	a
1921       00000000      OFST:	set	0
1924                     ; 440     assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1926  0460 a110          	cp	a,#16
1927  0462 2403          	jruge	L471
1928  0464 4f            	clr	a
1929  0465 2010          	jra	L671
1930  0467               L471:
1931  0467 ae01b8        	ldw	x,#440
1932  046a 89            	pushw	x
1933  046b ae0000        	ldw	x,#0
1934  046e 89            	pushw	x
1935  046f ae0008        	ldw	x,#L741
1936  0472 cd0000        	call	_assert_failed
1938  0475 5b04          	addw	sp,#4
1939  0477               L671:
1940                     ; 443     UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1942  0477 c65247        	ld	a,21063
1943  047a a4f0          	and	a,#240
1944  047c c75247        	ld	21063,a
1945                     ; 445     UART3->CR4 |= UART3_Address;
1947  047f c65247        	ld	a,21063
1948  0482 1a01          	or	a,(OFST+1,sp)
1949  0484 c75247        	ld	21063,a
1950                     ; 446 }
1953  0487 84            	pop	a
1954  0488 81            	ret
2112                     ; 454 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2112                     ; 455 {
2113                     	switch	.text
2114  0489               _UART3_GetFlagStatus:
2116  0489 89            	pushw	x
2117  048a 88            	push	a
2118       00000001      OFST:	set	1
2121                     ; 456     FlagStatus status = RESET;
2123                     ; 459     assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2125  048b a30080        	cpw	x,#128
2126  048e 2737          	jreq	L402
2127  0490 a30040        	cpw	x,#64
2128  0493 2732          	jreq	L402
2129  0495 a30020        	cpw	x,#32
2130  0498 272d          	jreq	L402
2131  049a a30010        	cpw	x,#16
2132  049d 2728          	jreq	L402
2133  049f a30008        	cpw	x,#8
2134  04a2 2723          	jreq	L402
2135  04a4 a30004        	cpw	x,#4
2136  04a7 271e          	jreq	L402
2137  04a9 a30002        	cpw	x,#2
2138  04ac 2719          	jreq	L402
2139  04ae a30001        	cpw	x,#1
2140  04b1 2714          	jreq	L402
2141  04b3 a30101        	cpw	x,#257
2142  04b6 270f          	jreq	L402
2143  04b8 a30301        	cpw	x,#769
2144  04bb 270a          	jreq	L402
2145  04bd a30302        	cpw	x,#770
2146  04c0 2705          	jreq	L402
2147  04c2 a30210        	cpw	x,#528
2148  04c5 2603          	jrne	L202
2149  04c7               L402:
2150  04c7 4f            	clr	a
2151  04c8 2010          	jra	L602
2152  04ca               L202:
2153  04ca ae01cb        	ldw	x,#459
2154  04cd 89            	pushw	x
2155  04ce ae0000        	ldw	x,#0
2156  04d1 89            	pushw	x
2157  04d2 ae0008        	ldw	x,#L741
2158  04d5 cd0000        	call	_assert_failed
2160  04d8 5b04          	addw	sp,#4
2161  04da               L602:
2162                     ; 462     if (UART3_FLAG == UART3_FLAG_LBDF)
2164  04da 1e02          	ldw	x,(OFST+1,sp)
2165  04dc a30210        	cpw	x,#528
2166  04df 2611          	jrne	L347
2167                     ; 464         if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2169  04e1 c65247        	ld	a,21063
2170  04e4 1503          	bcp	a,(OFST+2,sp)
2171  04e6 2706          	jreq	L547
2172                     ; 467             status = SET;
2174  04e8 a601          	ld	a,#1
2175  04ea 6b01          	ld	(OFST+0,sp),a
2177  04ec 2039          	jra	L157
2178  04ee               L547:
2179                     ; 472             status = RESET;
2181  04ee 0f01          	clr	(OFST+0,sp)
2182  04f0 2035          	jra	L157
2183  04f2               L347:
2184                     ; 475     else if (UART3_FLAG == UART3_FLAG_SBK)
2186  04f2 1e02          	ldw	x,(OFST+1,sp)
2187  04f4 a30101        	cpw	x,#257
2188  04f7 2611          	jrne	L357
2189                     ; 477         if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2191  04f9 c65245        	ld	a,21061
2192  04fc 1503          	bcp	a,(OFST+2,sp)
2193  04fe 2706          	jreq	L557
2194                     ; 480             status = SET;
2196  0500 a601          	ld	a,#1
2197  0502 6b01          	ld	(OFST+0,sp),a
2199  0504 2021          	jra	L157
2200  0506               L557:
2201                     ; 485             status = RESET;
2203  0506 0f01          	clr	(OFST+0,sp)
2204  0508 201d          	jra	L157
2205  050a               L357:
2206                     ; 488     else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2208  050a 1e02          	ldw	x,(OFST+1,sp)
2209  050c a30302        	cpw	x,#770
2210  050f 2707          	jreq	L567
2212  0511 1e02          	ldw	x,(OFST+1,sp)
2213  0513 a30301        	cpw	x,#769
2214  0516 2614          	jrne	L367
2215  0518               L567:
2216                     ; 490         if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2218  0518 c65249        	ld	a,21065
2219  051b 1503          	bcp	a,(OFST+2,sp)
2220  051d 2706          	jreq	L767
2221                     ; 493             status = SET;
2223  051f a601          	ld	a,#1
2224  0521 6b01          	ld	(OFST+0,sp),a
2226  0523 2002          	jra	L157
2227  0525               L767:
2228                     ; 498             status = RESET;
2230  0525 0f01          	clr	(OFST+0,sp)
2231  0527               L157:
2232                     ; 516     return  status;
2234  0527 7b01          	ld	a,(OFST+0,sp)
2237  0529 5b03          	addw	sp,#3
2238  052b 81            	ret
2239  052c               L367:
2240                     ; 503         if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2242  052c c65240        	ld	a,21056
2243  052f 1503          	bcp	a,(OFST+2,sp)
2244  0531 2706          	jreq	L577
2245                     ; 506             status = SET;
2247  0533 a601          	ld	a,#1
2248  0535 6b01          	ld	(OFST+0,sp),a
2250  0537 20ee          	jra	L157
2251  0539               L577:
2252                     ; 511             status = RESET;
2254  0539 0f01          	clr	(OFST+0,sp)
2255  053b 20ea          	jra	L157
2291                     ; 546 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2291                     ; 547 {
2292                     	switch	.text
2293  053d               _UART3_ClearFlag:
2295  053d 89            	pushw	x
2296       00000000      OFST:	set	0
2299                     ; 549     assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2301  053e a30020        	cpw	x,#32
2302  0541 270f          	jreq	L412
2303  0543 a30302        	cpw	x,#770
2304  0546 270a          	jreq	L412
2305  0548 a30301        	cpw	x,#769
2306  054b 2705          	jreq	L412
2307  054d a30210        	cpw	x,#528
2308  0550 2603          	jrne	L212
2309  0552               L412:
2310  0552 4f            	clr	a
2311  0553 2010          	jra	L612
2312  0555               L212:
2313  0555 ae0225        	ldw	x,#549
2314  0558 89            	pushw	x
2315  0559 ae0000        	ldw	x,#0
2316  055c 89            	pushw	x
2317  055d ae0008        	ldw	x,#L741
2318  0560 cd0000        	call	_assert_failed
2320  0563 5b04          	addw	sp,#4
2321  0565               L612:
2322                     ; 552     if (UART3_FLAG == UART3_FLAG_RXNE)
2324  0565 1e01          	ldw	x,(OFST+1,sp)
2325  0567 a30020        	cpw	x,#32
2326  056a 2606          	jrne	L7101
2327                     ; 554         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2329  056c 35df5240      	mov	21056,#223
2331  0570 201e          	jra	L1201
2332  0572               L7101:
2333                     ; 557     else if (UART3_FLAG == UART3_FLAG_LBDF)
2335  0572 1e01          	ldw	x,(OFST+1,sp)
2336  0574 a30210        	cpw	x,#528
2337  0577 2606          	jrne	L3201
2338                     ; 559         UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2340  0579 72195247      	bres	21063,#4
2342  057d 2011          	jra	L1201
2343  057f               L3201:
2344                     ; 562     else if (UART3_FLAG == UART3_FLAG_LHDF)
2346  057f 1e01          	ldw	x,(OFST+1,sp)
2347  0581 a30302        	cpw	x,#770
2348  0584 2606          	jrne	L7201
2349                     ; 564         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2351  0586 72135249      	bres	21065,#1
2353  058a 2004          	jra	L1201
2354  058c               L7201:
2355                     ; 569         UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2357  058c 72115249      	bres	21065,#0
2358  0590               L1201:
2359                     ; 571 }
2362  0590 85            	popw	x
2363  0591 81            	ret
2446                     ; 586 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2446                     ; 587 {
2447                     	switch	.text
2448  0592               _UART3_GetITStatus:
2450  0592 89            	pushw	x
2451  0593 89            	pushw	x
2452       00000002      OFST:	set	2
2455                     ; 588     ITStatus pendingbitstatus = RESET;
2457                     ; 589     uint8_t itpos = 0;
2459                     ; 590     uint8_t itmask1 = 0;
2461                     ; 591     uint8_t itmask2 = 0;
2463                     ; 592     uint8_t enablestatus = 0;
2465                     ; 595     assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2467  0594 a30277        	cpw	x,#631
2468  0597 2723          	jreq	L422
2469  0599 a30266        	cpw	x,#614
2470  059c 271e          	jreq	L422
2471  059e a30255        	cpw	x,#597
2472  05a1 2719          	jreq	L422
2473  05a3 a30244        	cpw	x,#580
2474  05a6 2714          	jreq	L422
2475  05a8 a30235        	cpw	x,#565
2476  05ab 270f          	jreq	L422
2477  05ad a30346        	cpw	x,#838
2478  05b0 270a          	jreq	L422
2479  05b2 a30412        	cpw	x,#1042
2480  05b5 2705          	jreq	L422
2481  05b7 a30100        	cpw	x,#256
2482  05ba 2603          	jrne	L222
2483  05bc               L422:
2484  05bc 4f            	clr	a
2485  05bd 2010          	jra	L622
2486  05bf               L222:
2487  05bf ae0253        	ldw	x,#595
2488  05c2 89            	pushw	x
2489  05c3 ae0000        	ldw	x,#0
2490  05c6 89            	pushw	x
2491  05c7 ae0008        	ldw	x,#L741
2492  05ca cd0000        	call	_assert_failed
2494  05cd 5b04          	addw	sp,#4
2495  05cf               L622:
2496                     ; 598     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2498  05cf 7b04          	ld	a,(OFST+2,sp)
2499  05d1 a40f          	and	a,#15
2500  05d3 5f            	clrw	x
2501  05d4 97            	ld	xl,a
2502  05d5 a601          	ld	a,#1
2503  05d7 5d            	tnzw	x
2504  05d8 2704          	jreq	L032
2505  05da               L232:
2506  05da 48            	sll	a
2507  05db 5a            	decw	x
2508  05dc 26fc          	jrne	L232
2509  05de               L032:
2510  05de 6b01          	ld	(OFST-1,sp),a
2511                     ; 600     itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2513  05e0 7b04          	ld	a,(OFST+2,sp)
2514  05e2 4e            	swap	a
2515  05e3 a40f          	and	a,#15
2516  05e5 6b02          	ld	(OFST+0,sp),a
2517                     ; 602     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2519  05e7 7b02          	ld	a,(OFST+0,sp)
2520  05e9 5f            	clrw	x
2521  05ea 97            	ld	xl,a
2522  05eb a601          	ld	a,#1
2523  05ed 5d            	tnzw	x
2524  05ee 2704          	jreq	L432
2525  05f0               L632:
2526  05f0 48            	sll	a
2527  05f1 5a            	decw	x
2528  05f2 26fc          	jrne	L632
2529  05f4               L432:
2530  05f4 6b02          	ld	(OFST+0,sp),a
2531                     ; 605     if (UART3_IT == UART3_IT_PE)
2533  05f6 1e03          	ldw	x,(OFST+1,sp)
2534  05f8 a30100        	cpw	x,#256
2535  05fb 261c          	jrne	L5701
2536                     ; 608         enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2538  05fd c65244        	ld	a,21060
2539  0600 1402          	and	a,(OFST+0,sp)
2540  0602 6b02          	ld	(OFST+0,sp),a
2541                     ; 611         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2543  0604 c65240        	ld	a,21056
2544  0607 1501          	bcp	a,(OFST-1,sp)
2545  0609 270a          	jreq	L7701
2547  060b 0d02          	tnz	(OFST+0,sp)
2548  060d 2706          	jreq	L7701
2549                     ; 614             pendingbitstatus = SET;
2551  060f a601          	ld	a,#1
2552  0611 6b02          	ld	(OFST+0,sp),a
2554  0613 2064          	jra	L3011
2555  0615               L7701:
2556                     ; 619             pendingbitstatus = RESET;
2558  0615 0f02          	clr	(OFST+0,sp)
2559  0617 2060          	jra	L3011
2560  0619               L5701:
2561                     ; 622     else if (UART3_IT == UART3_IT_LBDF)
2563  0619 1e03          	ldw	x,(OFST+1,sp)
2564  061b a30346        	cpw	x,#838
2565  061e 261c          	jrne	L5011
2566                     ; 625         enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2568  0620 c65247        	ld	a,21063
2569  0623 1402          	and	a,(OFST+0,sp)
2570  0625 6b02          	ld	(OFST+0,sp),a
2571                     ; 627         if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2573  0627 c65247        	ld	a,21063
2574  062a 1501          	bcp	a,(OFST-1,sp)
2575  062c 270a          	jreq	L7011
2577  062e 0d02          	tnz	(OFST+0,sp)
2578  0630 2706          	jreq	L7011
2579                     ; 630             pendingbitstatus = SET;
2581  0632 a601          	ld	a,#1
2582  0634 6b02          	ld	(OFST+0,sp),a
2584  0636 2041          	jra	L3011
2585  0638               L7011:
2586                     ; 635             pendingbitstatus = RESET;
2588  0638 0f02          	clr	(OFST+0,sp)
2589  063a 203d          	jra	L3011
2590  063c               L5011:
2591                     ; 638     else if (UART3_IT == UART3_IT_LHDF)
2593  063c 1e03          	ldw	x,(OFST+1,sp)
2594  063e a30412        	cpw	x,#1042
2595  0641 261c          	jrne	L5111
2596                     ; 641         enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2598  0643 c65249        	ld	a,21065
2599  0646 1402          	and	a,(OFST+0,sp)
2600  0648 6b02          	ld	(OFST+0,sp),a
2601                     ; 643         if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2603  064a c65249        	ld	a,21065
2604  064d 1501          	bcp	a,(OFST-1,sp)
2605  064f 270a          	jreq	L7111
2607  0651 0d02          	tnz	(OFST+0,sp)
2608  0653 2706          	jreq	L7111
2609                     ; 646             pendingbitstatus = SET;
2611  0655 a601          	ld	a,#1
2612  0657 6b02          	ld	(OFST+0,sp),a
2614  0659 201e          	jra	L3011
2615  065b               L7111:
2616                     ; 651             pendingbitstatus = RESET;
2618  065b 0f02          	clr	(OFST+0,sp)
2619  065d 201a          	jra	L3011
2620  065f               L5111:
2621                     ; 657         enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2623  065f c65245        	ld	a,21061
2624  0662 1402          	and	a,(OFST+0,sp)
2625  0664 6b02          	ld	(OFST+0,sp),a
2626                     ; 659         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2628  0666 c65240        	ld	a,21056
2629  0669 1501          	bcp	a,(OFST-1,sp)
2630  066b 270a          	jreq	L5211
2632  066d 0d02          	tnz	(OFST+0,sp)
2633  066f 2706          	jreq	L5211
2634                     ; 662             pendingbitstatus = SET;
2636  0671 a601          	ld	a,#1
2637  0673 6b02          	ld	(OFST+0,sp),a
2639  0675 2002          	jra	L3011
2640  0677               L5211:
2641                     ; 667             pendingbitstatus = RESET;
2643  0677 0f02          	clr	(OFST+0,sp)
2644  0679               L3011:
2645                     ; 671     return  pendingbitstatus;
2647  0679 7b02          	ld	a,(OFST+0,sp)
2650  067b 5b04          	addw	sp,#4
2651  067d 81            	ret
2688                     ; 701 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2688                     ; 702 {
2689                     	switch	.text
2690  067e               _UART3_ClearITPendingBit:
2692  067e 89            	pushw	x
2693       00000000      OFST:	set	0
2696                     ; 704     assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2698  067f a30255        	cpw	x,#597
2699  0682 270a          	jreq	L442
2700  0684 a30412        	cpw	x,#1042
2701  0687 2705          	jreq	L442
2702  0689 a30346        	cpw	x,#838
2703  068c 2603          	jrne	L242
2704  068e               L442:
2705  068e 4f            	clr	a
2706  068f 2010          	jra	L642
2707  0691               L242:
2708  0691 ae02c0        	ldw	x,#704
2709  0694 89            	pushw	x
2710  0695 ae0000        	ldw	x,#0
2711  0698 89            	pushw	x
2712  0699 ae0008        	ldw	x,#L741
2713  069c cd0000        	call	_assert_failed
2715  069f 5b04          	addw	sp,#4
2716  06a1               L642:
2717                     ; 707     if (UART3_IT == UART3_IT_RXNE)
2719  06a1 1e01          	ldw	x,(OFST+1,sp)
2720  06a3 a30255        	cpw	x,#597
2721  06a6 2606          	jrne	L7411
2722                     ; 709         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2724  06a8 35df5240      	mov	21056,#223
2726  06ac 2011          	jra	L1511
2727  06ae               L7411:
2728                     ; 712     else if (UART3_IT == UART3_IT_LBDF)
2730  06ae 1e01          	ldw	x,(OFST+1,sp)
2731  06b0 a30346        	cpw	x,#838
2732  06b3 2606          	jrne	L3511
2733                     ; 714         UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2735  06b5 72195247      	bres	21063,#4
2737  06b9 2004          	jra	L1511
2738  06bb               L3511:
2739                     ; 719         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2741  06bb 72135249      	bres	21065,#1
2742  06bf               L1511:
2743                     ; 721 }
2746  06bf 85            	popw	x
2747  06c0 81            	ret
2760                     	xdef	_UART3_ClearITPendingBit
2761                     	xdef	_UART3_GetITStatus
2762                     	xdef	_UART3_ClearFlag
2763                     	xdef	_UART3_GetFlagStatus
2764                     	xdef	_UART3_SetAddress
2765                     	xdef	_UART3_SendBreak
2766                     	xdef	_UART3_SendData9
2767                     	xdef	_UART3_SendData8
2768                     	xdef	_UART3_ReceiveData9
2769                     	xdef	_UART3_ReceiveData8
2770                     	xdef	_UART3_WakeUpConfig
2771                     	xdef	_UART3_ReceiverWakeUpCmd
2772                     	xdef	_UART3_LINCmd
2773                     	xdef	_UART3_LINConfig
2774                     	xdef	_UART3_LINBreakDetectionConfig
2775                     	xdef	_UART3_ITConfig
2776                     	xdef	_UART3_Cmd
2777                     	xdef	_UART3_Init
2778                     	xdef	_UART3_DeInit
2779                     	xref	_assert_failed
2780                     	xref	_CLK_GetClockFreq
2781                     	switch	.const
2782  0008               L741:
2783  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_u"
2784  001a 617274332e63  	dc.b	"art3.c",0
2785                     	xref.b	c_lreg
2786                     	xref.b	c_x
2806                     	xref	c_lursh
2807                     	xref	c_lsub
2808                     	xref	c_smul
2809                     	xref	c_ludv
2810                     	xref	c_rtol
2811                     	xref	c_llsh
2812                     	xref	c_lcmp
2813                     	xref	c_ltor
2814                     	end

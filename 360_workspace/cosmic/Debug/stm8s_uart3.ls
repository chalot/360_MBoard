   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 48 void UART3_DeInit(void)
  43                     ; 49 {
  45                     	switch	.text
  46  0000               _UART3_DeInit:
  50                     ; 52     (void) UART3->SR;
  52  0000 c65240        	ld	a,21056
  53                     ; 53     (void) UART3->DR;
  55  0003 c65241        	ld	a,21057
  56                     ; 55     UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  58  0006 725f5243      	clr	21059
  59                     ; 56     UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  61  000a 725f5242      	clr	21058
  62                     ; 58     UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  64  000e 725f5244      	clr	21060
  65                     ; 59     UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  67  0012 725f5245      	clr	21061
  68                     ; 60     UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  70  0016 725f5246      	clr	21062
  71                     ; 61     UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  73  001a 725f5247      	clr	21063
  74                     ; 62     UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  76  001e 725f5249      	clr	21065
  77                     ; 64 }
  80  0022 81            	ret
 298                     .const:	section	.text
 299  0000               L43:
 300  0000 00098969      	dc.l	625001
 301  0004               L64:
 302  0004 00000064      	dc.l	100
 303                     ; 78 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 303                     ; 79                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 303                     ; 80                 UART3_Mode_TypeDef Mode)
 303                     ; 81 {
 304                     	switch	.text
 305  0023               _UART3_Init:
 307  0023 520e          	subw	sp,#14
 308       0000000e      OFST:	set	14
 311                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 315                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 319                     ; 86     assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 321  0025 0d15          	tnz	(OFST+7,sp)
 322  0027 2706          	jreq	L21
 323  0029 7b15          	ld	a,(OFST+7,sp)
 324  002b a110          	cp	a,#16
 325  002d 2603          	jrne	L01
 326  002f               L21:
 327  002f 4f            	clr	a
 328  0030 2010          	jra	L41
 329  0032               L01:
 330  0032 ae0056        	ldw	x,#86
 331  0035 89            	pushw	x
 332  0036 ae0000        	ldw	x,#0
 333  0039 89            	pushw	x
 334  003a ae0008        	ldw	x,#L531
 335  003d cd0000        	call	_assert_failed
 337  0040 5b04          	addw	sp,#4
 338  0042               L41:
 339                     ; 87     assert_param(IS_UART3_STOPBITS_OK(StopBits));
 341  0042 0d16          	tnz	(OFST+8,sp)
 342  0044 2706          	jreq	L02
 343  0046 7b16          	ld	a,(OFST+8,sp)
 344  0048 a120          	cp	a,#32
 345  004a 2603          	jrne	L61
 346  004c               L02:
 347  004c 4f            	clr	a
 348  004d 2010          	jra	L22
 349  004f               L61:
 350  004f ae0057        	ldw	x,#87
 351  0052 89            	pushw	x
 352  0053 ae0000        	ldw	x,#0
 353  0056 89            	pushw	x
 354  0057 ae0008        	ldw	x,#L531
 355  005a cd0000        	call	_assert_failed
 357  005d 5b04          	addw	sp,#4
 358  005f               L22:
 359                     ; 88     assert_param(IS_UART3_PARITY_OK(Parity));
 361  005f 0d17          	tnz	(OFST+9,sp)
 362  0061 270c          	jreq	L62
 363  0063 7b17          	ld	a,(OFST+9,sp)
 364  0065 a104          	cp	a,#4
 365  0067 2706          	jreq	L62
 366  0069 7b17          	ld	a,(OFST+9,sp)
 367  006b a106          	cp	a,#6
 368  006d 2603          	jrne	L42
 369  006f               L62:
 370  006f 4f            	clr	a
 371  0070 2010          	jra	L03
 372  0072               L42:
 373  0072 ae0058        	ldw	x,#88
 374  0075 89            	pushw	x
 375  0076 ae0000        	ldw	x,#0
 376  0079 89            	pushw	x
 377  007a ae0008        	ldw	x,#L531
 378  007d cd0000        	call	_assert_failed
 380  0080 5b04          	addw	sp,#4
 381  0082               L03:
 382                     ; 89     assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 384  0082 96            	ldw	x,sp
 385  0083 1c0011        	addw	x,#OFST+3
 386  0086 cd0000        	call	c_ltor
 388  0089 ae0000        	ldw	x,#L43
 389  008c cd0000        	call	c_lcmp
 391  008f 2403          	jruge	L23
 392  0091 4f            	clr	a
 393  0092 2010          	jra	L63
 394  0094               L23:
 395  0094 ae0059        	ldw	x,#89
 396  0097 89            	pushw	x
 397  0098 ae0000        	ldw	x,#0
 398  009b 89            	pushw	x
 399  009c ae0008        	ldw	x,#L531
 400  009f cd0000        	call	_assert_failed
 402  00a2 5b04          	addw	sp,#4
 403  00a4               L63:
 404                     ; 90     assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 406  00a4 7b18          	ld	a,(OFST+10,sp)
 407  00a6 a108          	cp	a,#8
 408  00a8 2730          	jreq	L24
 409  00aa 7b18          	ld	a,(OFST+10,sp)
 410  00ac a140          	cp	a,#64
 411  00ae 272a          	jreq	L24
 412  00b0 7b18          	ld	a,(OFST+10,sp)
 413  00b2 a104          	cp	a,#4
 414  00b4 2724          	jreq	L24
 415  00b6 7b18          	ld	a,(OFST+10,sp)
 416  00b8 a180          	cp	a,#128
 417  00ba 271e          	jreq	L24
 418  00bc 7b18          	ld	a,(OFST+10,sp)
 419  00be a10c          	cp	a,#12
 420  00c0 2718          	jreq	L24
 421  00c2 7b18          	ld	a,(OFST+10,sp)
 422  00c4 a10c          	cp	a,#12
 423  00c6 2712          	jreq	L24
 424  00c8 7b18          	ld	a,(OFST+10,sp)
 425  00ca a144          	cp	a,#68
 426  00cc 270c          	jreq	L24
 427  00ce 7b18          	ld	a,(OFST+10,sp)
 428  00d0 a1c0          	cp	a,#192
 429  00d2 2706          	jreq	L24
 430  00d4 7b18          	ld	a,(OFST+10,sp)
 431  00d6 a188          	cp	a,#136
 432  00d8 2603          	jrne	L04
 433  00da               L24:
 434  00da 4f            	clr	a
 435  00db 2010          	jra	L44
 436  00dd               L04:
 437  00dd ae005a        	ldw	x,#90
 438  00e0 89            	pushw	x
 439  00e1 ae0000        	ldw	x,#0
 440  00e4 89            	pushw	x
 441  00e5 ae0008        	ldw	x,#L531
 442  00e8 cd0000        	call	_assert_failed
 444  00eb 5b04          	addw	sp,#4
 445  00ed               L44:
 446                     ; 93     UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 448  00ed 72195244      	bres	21060,#4
 449                     ; 95     UART3->CR1 |= (uint8_t)WordLength; 
 451  00f1 c65244        	ld	a,21060
 452  00f4 1a15          	or	a,(OFST+7,sp)
 453  00f6 c75244        	ld	21060,a
 454                     ; 98     UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 456  00f9 c65246        	ld	a,21062
 457  00fc a4cf          	and	a,#207
 458  00fe c75246        	ld	21062,a
 459                     ; 100     UART3->CR3 |= (uint8_t)StopBits;  
 461  0101 c65246        	ld	a,21062
 462  0104 1a16          	or	a,(OFST+8,sp)
 463  0106 c75246        	ld	21062,a
 464                     ; 103     UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 466  0109 c65244        	ld	a,21060
 467  010c a4f9          	and	a,#249
 468  010e c75244        	ld	21060,a
 469                     ; 105     UART3->CR1 |= (uint8_t)Parity;     
 471  0111 c65244        	ld	a,21060
 472  0114 1a17          	or	a,(OFST+9,sp)
 473  0116 c75244        	ld	21060,a
 474                     ; 108     UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 476  0119 725f5242      	clr	21058
 477                     ; 110     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 479  011d c65243        	ld	a,21059
 480  0120 a40f          	and	a,#15
 481  0122 c75243        	ld	21059,a
 482                     ; 112     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 484  0125 c65243        	ld	a,21059
 485  0128 a4f0          	and	a,#240
 486  012a c75243        	ld	21059,a
 487                     ; 115     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 489  012d 96            	ldw	x,sp
 490  012e 1c0011        	addw	x,#OFST+3
 491  0131 cd0000        	call	c_ltor
 493  0134 a604          	ld	a,#4
 494  0136 cd0000        	call	c_llsh
 496  0139 96            	ldw	x,sp
 497  013a 1c0001        	addw	x,#OFST-13
 498  013d cd0000        	call	c_rtol
 500  0140 cd0000        	call	_CLK_GetClockFreq
 502  0143 96            	ldw	x,sp
 503  0144 1c0001        	addw	x,#OFST-13
 504  0147 cd0000        	call	c_ludv
 506  014a 96            	ldw	x,sp
 507  014b 1c000b        	addw	x,#OFST-3
 508  014e cd0000        	call	c_rtol
 510                     ; 116     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 512  0151 96            	ldw	x,sp
 513  0152 1c0011        	addw	x,#OFST+3
 514  0155 cd0000        	call	c_ltor
 516  0158 a604          	ld	a,#4
 517  015a cd0000        	call	c_llsh
 519  015d 96            	ldw	x,sp
 520  015e 1c0001        	addw	x,#OFST-13
 521  0161 cd0000        	call	c_rtol
 523  0164 cd0000        	call	_CLK_GetClockFreq
 525  0167 a664          	ld	a,#100
 526  0169 cd0000        	call	c_smul
 528  016c 96            	ldw	x,sp
 529  016d 1c0001        	addw	x,#OFST-13
 530  0170 cd0000        	call	c_ludv
 532  0173 96            	ldw	x,sp
 533  0174 1c0007        	addw	x,#OFST-7
 534  0177 cd0000        	call	c_rtol
 536                     ; 119     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 536                     ; 120                         << 4) / 100) & (uint8_t)0x0F); 
 538  017a 96            	ldw	x,sp
 539  017b 1c000b        	addw	x,#OFST-3
 540  017e cd0000        	call	c_ltor
 542  0181 a664          	ld	a,#100
 543  0183 cd0000        	call	c_smul
 545  0186 96            	ldw	x,sp
 546  0187 1c0001        	addw	x,#OFST-13
 547  018a cd0000        	call	c_rtol
 549  018d 96            	ldw	x,sp
 550  018e 1c0007        	addw	x,#OFST-7
 551  0191 cd0000        	call	c_ltor
 553  0194 96            	ldw	x,sp
 554  0195 1c0001        	addw	x,#OFST-13
 555  0198 cd0000        	call	c_lsub
 557  019b a604          	ld	a,#4
 558  019d cd0000        	call	c_llsh
 560  01a0 ae0004        	ldw	x,#L64
 561  01a3 cd0000        	call	c_ludv
 563  01a6 b603          	ld	a,c_lreg+3
 564  01a8 a40f          	and	a,#15
 565  01aa 6b05          	ld	(OFST-9,sp),a
 566                     ; 121     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 568  01ac 96            	ldw	x,sp
 569  01ad 1c000b        	addw	x,#OFST-3
 570  01b0 cd0000        	call	c_ltor
 572  01b3 a604          	ld	a,#4
 573  01b5 cd0000        	call	c_lursh
 575  01b8 b603          	ld	a,c_lreg+3
 576  01ba a4f0          	and	a,#240
 577  01bc b703          	ld	c_lreg+3,a
 578  01be 3f02          	clr	c_lreg+2
 579  01c0 3f01          	clr	c_lreg+1
 580  01c2 3f00          	clr	c_lreg
 581  01c4 b603          	ld	a,c_lreg+3
 582  01c6 6b06          	ld	(OFST-8,sp),a
 583                     ; 123     UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 585  01c8 7b05          	ld	a,(OFST-9,sp)
 586  01ca 1a06          	or	a,(OFST-8,sp)
 587  01cc c75243        	ld	21059,a
 588                     ; 125     UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 590  01cf 7b0e          	ld	a,(OFST+0,sp)
 591  01d1 c75242        	ld	21058,a
 592                     ; 127     if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 594  01d4 7b18          	ld	a,(OFST+10,sp)
 595  01d6 a504          	bcp	a,#4
 596  01d8 2706          	jreq	L731
 597                     ; 130         UART3->CR2 |= UART3_CR2_TEN;  
 599  01da 72165245      	bset	21061,#3
 601  01de 2004          	jra	L141
 602  01e0               L731:
 603                     ; 135         UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 605  01e0 72175245      	bres	21061,#3
 606  01e4               L141:
 607                     ; 137     if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 609  01e4 7b18          	ld	a,(OFST+10,sp)
 610  01e6 a508          	bcp	a,#8
 611  01e8 2706          	jreq	L341
 612                     ; 140         UART3->CR2 |= UART3_CR2_REN;  
 614  01ea 72145245      	bset	21061,#2
 616  01ee 2004          	jra	L541
 617  01f0               L341:
 618                     ; 145         UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 620  01f0 72155245      	bres	21061,#2
 621  01f4               L541:
 622                     ; 147 }
 625  01f4 5b0e          	addw	sp,#14
 626  01f6 81            	ret
 681                     ; 155 void UART3_Cmd(FunctionalState NewState)
 681                     ; 156 {
 682                     	switch	.text
 683  01f7               _UART3_Cmd:
 687                     ; 158     if (NewState != DISABLE)
 689  01f7 4d            	tnz	a
 690  01f8 2706          	jreq	L571
 691                     ; 161         UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 693  01fa 721b5244      	bres	21060,#5
 695  01fe 2004          	jra	L771
 696  0200               L571:
 697                     ; 166         UART3->CR1 |= UART3_CR1_UARTD;  
 699  0200 721a5244      	bset	21060,#5
 700  0204               L771:
 701                     ; 168 }
 704  0204 81            	ret
 833                     ; 185 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 833                     ; 186 {
 834                     	switch	.text
 835  0205               _UART3_ITConfig:
 837  0205 89            	pushw	x
 838  0206 89            	pushw	x
 839       00000002      OFST:	set	2
 842                     ; 187     uint8_t uartreg = 0, itpos = 0x00;
 846                     ; 190     assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 848  0207 a30100        	cpw	x,#256
 849  020a 271e          	jreq	L65
 850  020c a30277        	cpw	x,#631
 851  020f 2719          	jreq	L65
 852  0211 a30266        	cpw	x,#614
 853  0214 2714          	jreq	L65
 854  0216 a30205        	cpw	x,#517
 855  0219 270f          	jreq	L65
 856  021b a30244        	cpw	x,#580
 857  021e 270a          	jreq	L65
 858  0220 a30412        	cpw	x,#1042
 859  0223 2705          	jreq	L65
 860  0225 a30346        	cpw	x,#838
 861  0228 2603          	jrne	L45
 862  022a               L65:
 863  022a 4f            	clr	a
 864  022b 2010          	jra	L06
 865  022d               L45:
 866  022d ae00be        	ldw	x,#190
 867  0230 89            	pushw	x
 868  0231 ae0000        	ldw	x,#0
 869  0234 89            	pushw	x
 870  0235 ae0008        	ldw	x,#L531
 871  0238 cd0000        	call	_assert_failed
 873  023b 5b04          	addw	sp,#4
 874  023d               L06:
 875                     ; 191     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 877  023d 0d07          	tnz	(OFST+5,sp)
 878  023f 2706          	jreq	L46
 879  0241 7b07          	ld	a,(OFST+5,sp)
 880  0243 a101          	cp	a,#1
 881  0245 2603          	jrne	L26
 882  0247               L46:
 883  0247 4f            	clr	a
 884  0248 2010          	jra	L66
 885  024a               L26:
 886  024a ae00bf        	ldw	x,#191
 887  024d 89            	pushw	x
 888  024e ae0000        	ldw	x,#0
 889  0251 89            	pushw	x
 890  0252 ae0008        	ldw	x,#L531
 891  0255 cd0000        	call	_assert_failed
 893  0258 5b04          	addw	sp,#4
 894  025a               L66:
 895                     ; 194     uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 897  025a 7b03          	ld	a,(OFST+1,sp)
 898  025c 6b01          	ld	(OFST-1,sp),a
 899                     ; 197     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 901  025e 7b04          	ld	a,(OFST+2,sp)
 902  0260 a40f          	and	a,#15
 903  0262 5f            	clrw	x
 904  0263 97            	ld	xl,a
 905  0264 a601          	ld	a,#1
 906  0266 5d            	tnzw	x
 907  0267 2704          	jreq	L07
 908  0269               L27:
 909  0269 48            	sll	a
 910  026a 5a            	decw	x
 911  026b 26fc          	jrne	L27
 912  026d               L07:
 913  026d 6b02          	ld	(OFST+0,sp),a
 914                     ; 199     if (NewState != DISABLE)
 916  026f 0d07          	tnz	(OFST+5,sp)
 917  0271 273a          	jreq	L552
 918                     ; 202         if (uartreg == 0x01)
 920  0273 7b01          	ld	a,(OFST-1,sp)
 921  0275 a101          	cp	a,#1
 922  0277 260a          	jrne	L752
 923                     ; 204             UART3->CR1 |= itpos;
 925  0279 c65244        	ld	a,21060
 926  027c 1a02          	or	a,(OFST+0,sp)
 927  027e c75244        	ld	21060,a
 929  0281 2066          	jra	L372
 930  0283               L752:
 931                     ; 206         else if (uartreg == 0x02)
 933  0283 7b01          	ld	a,(OFST-1,sp)
 934  0285 a102          	cp	a,#2
 935  0287 260a          	jrne	L362
 936                     ; 208             UART3->CR2 |= itpos;
 938  0289 c65245        	ld	a,21061
 939  028c 1a02          	or	a,(OFST+0,sp)
 940  028e c75245        	ld	21061,a
 942  0291 2056          	jra	L372
 943  0293               L362:
 944                     ; 210         else if (uartreg == 0x03)
 946  0293 7b01          	ld	a,(OFST-1,sp)
 947  0295 a103          	cp	a,#3
 948  0297 260a          	jrne	L762
 949                     ; 212             UART3->CR4 |= itpos;
 951  0299 c65247        	ld	a,21063
 952  029c 1a02          	or	a,(OFST+0,sp)
 953  029e c75247        	ld	21063,a
 955  02a1 2046          	jra	L372
 956  02a3               L762:
 957                     ; 216             UART3->CR6 |= itpos;
 959  02a3 c65249        	ld	a,21065
 960  02a6 1a02          	or	a,(OFST+0,sp)
 961  02a8 c75249        	ld	21065,a
 962  02ab 203c          	jra	L372
 963  02ad               L552:
 964                     ; 222         if (uartreg == 0x01)
 966  02ad 7b01          	ld	a,(OFST-1,sp)
 967  02af a101          	cp	a,#1
 968  02b1 260b          	jrne	L572
 969                     ; 224             UART3->CR1 &= (uint8_t)(~itpos);
 971  02b3 7b02          	ld	a,(OFST+0,sp)
 972  02b5 43            	cpl	a
 973  02b6 c45244        	and	a,21060
 974  02b9 c75244        	ld	21060,a
 976  02bc 202b          	jra	L372
 977  02be               L572:
 978                     ; 226         else if (uartreg == 0x02)
 980  02be 7b01          	ld	a,(OFST-1,sp)
 981  02c0 a102          	cp	a,#2
 982  02c2 260b          	jrne	L103
 983                     ; 228             UART3->CR2 &= (uint8_t)(~itpos);
 985  02c4 7b02          	ld	a,(OFST+0,sp)
 986  02c6 43            	cpl	a
 987  02c7 c45245        	and	a,21061
 988  02ca c75245        	ld	21061,a
 990  02cd 201a          	jra	L372
 991  02cf               L103:
 992                     ; 230         else if (uartreg == 0x03)
 994  02cf 7b01          	ld	a,(OFST-1,sp)
 995  02d1 a103          	cp	a,#3
 996  02d3 260b          	jrne	L503
 997                     ; 232             UART3->CR4 &= (uint8_t)(~itpos);
 999  02d5 7b02          	ld	a,(OFST+0,sp)
1000  02d7 43            	cpl	a
1001  02d8 c45247        	and	a,21063
1002  02db c75247        	ld	21063,a
1004  02de 2009          	jra	L372
1005  02e0               L503:
1006                     ; 236             UART3->CR6 &= (uint8_t)(~itpos);
1008  02e0 7b02          	ld	a,(OFST+0,sp)
1009  02e2 43            	cpl	a
1010  02e3 c45249        	and	a,21065
1011  02e6 c75249        	ld	21065,a
1012  02e9               L372:
1013                     ; 239 }
1016  02e9 5b04          	addw	sp,#4
1017  02eb 81            	ret
1077                     ; 248 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1077                     ; 249 {
1078                     	switch	.text
1079  02ec               _UART3_LINBreakDetectionConfig:
1081  02ec 88            	push	a
1082       00000000      OFST:	set	0
1085                     ; 251     assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1087  02ed 4d            	tnz	a
1088  02ee 2704          	jreq	L001
1089  02f0 a101          	cp	a,#1
1090  02f2 2603          	jrne	L67
1091  02f4               L001:
1092  02f4 4f            	clr	a
1093  02f5 2010          	jra	L201
1094  02f7               L67:
1095  02f7 ae00fb        	ldw	x,#251
1096  02fa 89            	pushw	x
1097  02fb ae0000        	ldw	x,#0
1098  02fe 89            	pushw	x
1099  02ff ae0008        	ldw	x,#L531
1100  0302 cd0000        	call	_assert_failed
1102  0305 5b04          	addw	sp,#4
1103  0307               L201:
1104                     ; 253     if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1106  0307 0d01          	tnz	(OFST+1,sp)
1107  0309 2706          	jreq	L733
1108                     ; 255         UART3->CR4 |= UART3_CR4_LBDL;
1110  030b 721a5247      	bset	21063,#5
1112  030f 2004          	jra	L143
1113  0311               L733:
1114                     ; 259         UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1116  0311 721b5247      	bres	21063,#5
1117  0315               L143:
1118                     ; 261 }
1121  0315 84            	pop	a
1122  0316 81            	ret
1244                     ; 273 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1244                     ; 274                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1244                     ; 275                      UART3_LinDivUp_TypeDef UART3_DivUp)
1244                     ; 276 {
1245                     	switch	.text
1246  0317               _UART3_LINConfig:
1248  0317 89            	pushw	x
1249       00000000      OFST:	set	0
1252                     ; 278     assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1254  0318 9e            	ld	a,xh
1255  0319 4d            	tnz	a
1256  031a 2705          	jreq	L011
1257  031c 9e            	ld	a,xh
1258  031d a101          	cp	a,#1
1259  031f 2603          	jrne	L601
1260  0321               L011:
1261  0321 4f            	clr	a
1262  0322 2010          	jra	L211
1263  0324               L601:
1264  0324 ae0116        	ldw	x,#278
1265  0327 89            	pushw	x
1266  0328 ae0000        	ldw	x,#0
1267  032b 89            	pushw	x
1268  032c ae0008        	ldw	x,#L531
1269  032f cd0000        	call	_assert_failed
1271  0332 5b04          	addw	sp,#4
1272  0334               L211:
1273                     ; 279     assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1275  0334 7b02          	ld	a,(OFST+2,sp)
1276  0336 a101          	cp	a,#1
1277  0338 2704          	jreq	L611
1278  033a 0d02          	tnz	(OFST+2,sp)
1279  033c 2603          	jrne	L411
1280  033e               L611:
1281  033e 4f            	clr	a
1282  033f 2010          	jra	L021
1283  0341               L411:
1284  0341 ae0117        	ldw	x,#279
1285  0344 89            	pushw	x
1286  0345 ae0000        	ldw	x,#0
1287  0348 89            	pushw	x
1288  0349 ae0008        	ldw	x,#L531
1289  034c cd0000        	call	_assert_failed
1291  034f 5b04          	addw	sp,#4
1292  0351               L021:
1293                     ; 280     assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1295  0351 0d05          	tnz	(OFST+5,sp)
1296  0353 2706          	jreq	L421
1297  0355 7b05          	ld	a,(OFST+5,sp)
1298  0357 a101          	cp	a,#1
1299  0359 2603          	jrne	L221
1300  035b               L421:
1301  035b 4f            	clr	a
1302  035c 2010          	jra	L621
1303  035e               L221:
1304  035e ae0118        	ldw	x,#280
1305  0361 89            	pushw	x
1306  0362 ae0000        	ldw	x,#0
1307  0365 89            	pushw	x
1308  0366 ae0008        	ldw	x,#L531
1309  0369 cd0000        	call	_assert_failed
1311  036c 5b04          	addw	sp,#4
1312  036e               L621:
1313                     ; 282     if (UART3_Mode != UART3_LIN_MODE_MASTER)
1315  036e 0d01          	tnz	(OFST+1,sp)
1316  0370 2706          	jreq	L124
1317                     ; 284         UART3->CR6 |=  UART3_CR6_LSLV;
1319  0372 721a5249      	bset	21065,#5
1321  0376 2004          	jra	L324
1322  0378               L124:
1323                     ; 288         UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1325  0378 721b5249      	bres	21065,#5
1326  037c               L324:
1327                     ; 291     if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1329  037c 0d02          	tnz	(OFST+2,sp)
1330  037e 2706          	jreq	L524
1331                     ; 293         UART3->CR6 |=  UART3_CR6_LASE ;
1333  0380 72185249      	bset	21065,#4
1335  0384 2004          	jra	L724
1336  0386               L524:
1337                     ; 297         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1339  0386 72195249      	bres	21065,#4
1340  038a               L724:
1341                     ; 300     if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1343  038a 0d05          	tnz	(OFST+5,sp)
1344  038c 2706          	jreq	L134
1345                     ; 302         UART3->CR6 |=  UART3_CR6_LDUM;
1347  038e 721e5249      	bset	21065,#7
1349  0392 2004          	jra	L334
1350  0394               L134:
1351                     ; 306         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1353  0394 721f5249      	bres	21065,#7
1354  0398               L334:
1355                     ; 308 }
1358  0398 85            	popw	x
1359  0399 81            	ret
1395                     ; 316 void UART3_LINCmd(FunctionalState NewState)
1395                     ; 317 {
1396                     	switch	.text
1397  039a               _UART3_LINCmd:
1399  039a 88            	push	a
1400       00000000      OFST:	set	0
1403                     ; 319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1405  039b 4d            	tnz	a
1406  039c 2704          	jreq	L431
1407  039e a101          	cp	a,#1
1408  03a0 2603          	jrne	L231
1409  03a2               L431:
1410  03a2 4f            	clr	a
1411  03a3 2010          	jra	L631
1412  03a5               L231:
1413  03a5 ae013f        	ldw	x,#319
1414  03a8 89            	pushw	x
1415  03a9 ae0000        	ldw	x,#0
1416  03ac 89            	pushw	x
1417  03ad ae0008        	ldw	x,#L531
1418  03b0 cd0000        	call	_assert_failed
1420  03b3 5b04          	addw	sp,#4
1421  03b5               L631:
1422                     ; 321     if (NewState != DISABLE)
1424  03b5 0d01          	tnz	(OFST+1,sp)
1425  03b7 2706          	jreq	L354
1426                     ; 324         UART3->CR3 |= UART3_CR3_LINEN;
1428  03b9 721c5246      	bset	21062,#6
1430  03bd 2004          	jra	L554
1431  03bf               L354:
1432                     ; 329         UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1434  03bf 721d5246      	bres	21062,#6
1435  03c3               L554:
1436                     ; 331 }
1439  03c3 84            	pop	a
1440  03c4 81            	ret
1498                     ; 339 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1498                     ; 340 {
1499                     	switch	.text
1500  03c5               _UART3_WakeUpConfig:
1502  03c5 88            	push	a
1503       00000000      OFST:	set	0
1506                     ; 342     assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1508  03c6 4d            	tnz	a
1509  03c7 2704          	jreq	L441
1510  03c9 a108          	cp	a,#8
1511  03cb 2603          	jrne	L241
1512  03cd               L441:
1513  03cd 4f            	clr	a
1514  03ce 2010          	jra	L641
1515  03d0               L241:
1516  03d0 ae0156        	ldw	x,#342
1517  03d3 89            	pushw	x
1518  03d4 ae0000        	ldw	x,#0
1519  03d7 89            	pushw	x
1520  03d8 ae0008        	ldw	x,#L531
1521  03db cd0000        	call	_assert_failed
1523  03de 5b04          	addw	sp,#4
1524  03e0               L641:
1525                     ; 344     UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1527  03e0 72175244      	bres	21060,#3
1528                     ; 345     UART3->CR1 |= (uint8_t)UART3_WakeUp;
1530  03e4 c65244        	ld	a,21060
1531  03e7 1a01          	or	a,(OFST+1,sp)
1532  03e9 c75244        	ld	21060,a
1533                     ; 346 }
1536  03ec 84            	pop	a
1537  03ed 81            	ret
1574                     ; 354 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1574                     ; 355 {
1575                     	switch	.text
1576  03ee               _UART3_ReceiverWakeUpCmd:
1578  03ee 88            	push	a
1579       00000000      OFST:	set	0
1582                     ; 357     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1584  03ef 4d            	tnz	a
1585  03f0 2704          	jreq	L451
1586  03f2 a101          	cp	a,#1
1587  03f4 2603          	jrne	L251
1588  03f6               L451:
1589  03f6 4f            	clr	a
1590  03f7 2010          	jra	L651
1591  03f9               L251:
1592  03f9 ae0165        	ldw	x,#357
1593  03fc 89            	pushw	x
1594  03fd ae0000        	ldw	x,#0
1595  0400 89            	pushw	x
1596  0401 ae0008        	ldw	x,#L531
1597  0404 cd0000        	call	_assert_failed
1599  0407 5b04          	addw	sp,#4
1600  0409               L651:
1601                     ; 359     if (NewState != DISABLE)
1603  0409 0d01          	tnz	(OFST+1,sp)
1604  040b 2706          	jreq	L325
1605                     ; 362         UART3->CR2 |= UART3_CR2_RWU;
1607  040d 72125245      	bset	21061,#1
1609  0411 2004          	jra	L525
1610  0413               L325:
1611                     ; 367         UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1613  0413 72135245      	bres	21061,#1
1614  0417               L525:
1615                     ; 369 }
1618  0417 84            	pop	a
1619  0418 81            	ret
1642                     ; 376 uint8_t UART3_ReceiveData8(void)
1642                     ; 377 {
1643                     	switch	.text
1644  0419               _UART3_ReceiveData8:
1648                     ; 378     return ((uint8_t)UART3->DR);
1650  0419 c65241        	ld	a,21057
1653  041c 81            	ret
1685                     ; 386 uint16_t UART3_ReceiveData9(void)
1685                     ; 387 {
1686                     	switch	.text
1687  041d               _UART3_ReceiveData9:
1689  041d 89            	pushw	x
1690       00000002      OFST:	set	2
1693                     ; 388   uint16_t temp = 0;
1695                     ; 390  temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1697  041e c65244        	ld	a,21060
1698  0421 5f            	clrw	x
1699  0422 a480          	and	a,#128
1700  0424 5f            	clrw	x
1701  0425 02            	rlwa	x,a
1702  0426 58            	sllw	x
1703  0427 1f01          	ldw	(OFST-1,sp),x
1704                     ; 391   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1706  0429 c65241        	ld	a,21057
1707  042c 5f            	clrw	x
1708  042d 97            	ld	xl,a
1709  042e 01            	rrwa	x,a
1710  042f 1a02          	or	a,(OFST+0,sp)
1711  0431 01            	rrwa	x,a
1712  0432 1a01          	or	a,(OFST-1,sp)
1713  0434 01            	rrwa	x,a
1714  0435 01            	rrwa	x,a
1715  0436 a4ff          	and	a,#255
1716  0438 01            	rrwa	x,a
1717  0439 a401          	and	a,#1
1718  043b 01            	rrwa	x,a
1721  043c 5b02          	addw	sp,#2
1722  043e 81            	ret
1754                     ; 399 void UART3_SendData8(uint8_t Data)
1754                     ; 400 {
1755                     	switch	.text
1756  043f               _UART3_SendData8:
1760                     ; 402     UART3->DR = Data;
1762  043f c75241        	ld	21057,a
1763                     ; 403 }
1766  0442 81            	ret
1798                     ; 410 void UART3_SendData9(uint16_t Data)
1798                     ; 411 {
1799                     	switch	.text
1800  0443               _UART3_SendData9:
1802  0443 89            	pushw	x
1803       00000000      OFST:	set	0
1806                     ; 413     UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1808  0444 721d5244      	bres	21060,#6
1809                     ; 416     UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1811  0448 54            	srlw	x
1812  0449 54            	srlw	x
1813  044a 9f            	ld	a,xl
1814  044b a440          	and	a,#64
1815  044d ca5244        	or	a,21060
1816  0450 c75244        	ld	21060,a
1817                     ; 419     UART3->DR   = (uint8_t)(Data);                    
1819  0453 7b02          	ld	a,(OFST+2,sp)
1820  0455 c75241        	ld	21057,a
1821                     ; 420 }
1824  0458 85            	popw	x
1825  0459 81            	ret
1848                     ; 427 void UART3_SendBreak(void)
1848                     ; 428 {
1849                     	switch	.text
1850  045a               _UART3_SendBreak:
1854                     ; 429     UART3->CR2 |= UART3_CR2_SBK;
1856  045a 72105245      	bset	21061,#0
1857                     ; 430 }
1860  045e 81            	ret
1893                     ; 437 void UART3_SetAddress(uint8_t UART3_Address)
1893                     ; 438 {
1894                     	switch	.text
1895  045f               _UART3_SetAddress:
1897  045f 88            	push	a
1898       00000000      OFST:	set	0
1901                     ; 440     assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1903  0460 a110          	cp	a,#16
1904  0462 2403          	jruge	L471
1905  0464 4f            	clr	a
1906  0465 2010          	jra	L671
1907  0467               L471:
1908  0467 ae01b8        	ldw	x,#440
1909  046a 89            	pushw	x
1910  046b ae0000        	ldw	x,#0
1911  046e 89            	pushw	x
1912  046f ae0008        	ldw	x,#L531
1913  0472 cd0000        	call	_assert_failed
1915  0475 5b04          	addw	sp,#4
1916  0477               L671:
1917                     ; 443     UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1919  0477 c65247        	ld	a,21063
1920  047a a4f0          	and	a,#240
1921  047c c75247        	ld	21063,a
1922                     ; 445     UART3->CR4 |= UART3_Address;
1924  047f c65247        	ld	a,21063
1925  0482 1a01          	or	a,(OFST+1,sp)
1926  0484 c75247        	ld	21063,a
1927                     ; 446 }
1930  0487 84            	pop	a
1931  0488 81            	ret
2089                     ; 454 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2089                     ; 455 {
2090                     	switch	.text
2091  0489               _UART3_GetFlagStatus:
2093  0489 89            	pushw	x
2094  048a 88            	push	a
2095       00000001      OFST:	set	1
2098                     ; 456     FlagStatus status = RESET;
2100                     ; 459     assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2102  048b a30080        	cpw	x,#128
2103  048e 2737          	jreq	L402
2104  0490 a30040        	cpw	x,#64
2105  0493 2732          	jreq	L402
2106  0495 a30020        	cpw	x,#32
2107  0498 272d          	jreq	L402
2108  049a a30010        	cpw	x,#16
2109  049d 2728          	jreq	L402
2110  049f a30008        	cpw	x,#8
2111  04a2 2723          	jreq	L402
2112  04a4 a30004        	cpw	x,#4
2113  04a7 271e          	jreq	L402
2114  04a9 a30002        	cpw	x,#2
2115  04ac 2719          	jreq	L402
2116  04ae a30001        	cpw	x,#1
2117  04b1 2714          	jreq	L402
2118  04b3 a30101        	cpw	x,#257
2119  04b6 270f          	jreq	L402
2120  04b8 a30301        	cpw	x,#769
2121  04bb 270a          	jreq	L402
2122  04bd a30302        	cpw	x,#770
2123  04c0 2705          	jreq	L402
2124  04c2 a30210        	cpw	x,#528
2125  04c5 2603          	jrne	L202
2126  04c7               L402:
2127  04c7 4f            	clr	a
2128  04c8 2010          	jra	L602
2129  04ca               L202:
2130  04ca ae01cb        	ldw	x,#459
2131  04cd 89            	pushw	x
2132  04ce ae0000        	ldw	x,#0
2133  04d1 89            	pushw	x
2134  04d2 ae0008        	ldw	x,#L531
2135  04d5 cd0000        	call	_assert_failed
2137  04d8 5b04          	addw	sp,#4
2138  04da               L602:
2139                     ; 462     if (UART3_FLAG == UART3_FLAG_LBDF)
2141  04da 1e02          	ldw	x,(OFST+1,sp)
2142  04dc a30210        	cpw	x,#528
2143  04df 2611          	jrne	L517
2144                     ; 464         if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2146  04e1 c65247        	ld	a,21063
2147  04e4 1503          	bcp	a,(OFST+2,sp)
2148  04e6 2706          	jreq	L717
2149                     ; 467             status = SET;
2151  04e8 a601          	ld	a,#1
2152  04ea 6b01          	ld	(OFST+0,sp),a
2154  04ec 2039          	jra	L327
2155  04ee               L717:
2156                     ; 472             status = RESET;
2158  04ee 0f01          	clr	(OFST+0,sp)
2159  04f0 2035          	jra	L327
2160  04f2               L517:
2161                     ; 475     else if (UART3_FLAG == UART3_FLAG_SBK)
2163  04f2 1e02          	ldw	x,(OFST+1,sp)
2164  04f4 a30101        	cpw	x,#257
2165  04f7 2611          	jrne	L527
2166                     ; 477         if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2168  04f9 c65245        	ld	a,21061
2169  04fc 1503          	bcp	a,(OFST+2,sp)
2170  04fe 2706          	jreq	L727
2171                     ; 480             status = SET;
2173  0500 a601          	ld	a,#1
2174  0502 6b01          	ld	(OFST+0,sp),a
2176  0504 2021          	jra	L327
2177  0506               L727:
2178                     ; 485             status = RESET;
2180  0506 0f01          	clr	(OFST+0,sp)
2181  0508 201d          	jra	L327
2182  050a               L527:
2183                     ; 488     else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2185  050a 1e02          	ldw	x,(OFST+1,sp)
2186  050c a30302        	cpw	x,#770
2187  050f 2707          	jreq	L737
2189  0511 1e02          	ldw	x,(OFST+1,sp)
2190  0513 a30301        	cpw	x,#769
2191  0516 2614          	jrne	L537
2192  0518               L737:
2193                     ; 490         if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2195  0518 c65249        	ld	a,21065
2196  051b 1503          	bcp	a,(OFST+2,sp)
2197  051d 2706          	jreq	L147
2198                     ; 493             status = SET;
2200  051f a601          	ld	a,#1
2201  0521 6b01          	ld	(OFST+0,sp),a
2203  0523 2002          	jra	L327
2204  0525               L147:
2205                     ; 498             status = RESET;
2207  0525 0f01          	clr	(OFST+0,sp)
2208  0527               L327:
2209                     ; 516     return  status;
2211  0527 7b01          	ld	a,(OFST+0,sp)
2214  0529 5b03          	addw	sp,#3
2215  052b 81            	ret
2216  052c               L537:
2217                     ; 503         if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2219  052c c65240        	ld	a,21056
2220  052f 1503          	bcp	a,(OFST+2,sp)
2221  0531 2706          	jreq	L747
2222                     ; 506             status = SET;
2224  0533 a601          	ld	a,#1
2225  0535 6b01          	ld	(OFST+0,sp),a
2227  0537 20ee          	jra	L327
2228  0539               L747:
2229                     ; 511             status = RESET;
2231  0539 0f01          	clr	(OFST+0,sp)
2232  053b 20ea          	jra	L327
2268                     ; 546 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2268                     ; 547 {
2269                     	switch	.text
2270  053d               _UART3_ClearFlag:
2272  053d 89            	pushw	x
2273       00000000      OFST:	set	0
2276                     ; 549     assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2278  053e a30020        	cpw	x,#32
2279  0541 270f          	jreq	L412
2280  0543 a30302        	cpw	x,#770
2281  0546 270a          	jreq	L412
2282  0548 a30301        	cpw	x,#769
2283  054b 2705          	jreq	L412
2284  054d a30210        	cpw	x,#528
2285  0550 2603          	jrne	L212
2286  0552               L412:
2287  0552 4f            	clr	a
2288  0553 2010          	jra	L612
2289  0555               L212:
2290  0555 ae0225        	ldw	x,#549
2291  0558 89            	pushw	x
2292  0559 ae0000        	ldw	x,#0
2293  055c 89            	pushw	x
2294  055d ae0008        	ldw	x,#L531
2295  0560 cd0000        	call	_assert_failed
2297  0563 5b04          	addw	sp,#4
2298  0565               L612:
2299                     ; 552     if (UART3_FLAG == UART3_FLAG_RXNE)
2301  0565 1e01          	ldw	x,(OFST+1,sp)
2302  0567 a30020        	cpw	x,#32
2303  056a 2606          	jrne	L177
2304                     ; 554         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2306  056c 35df5240      	mov	21056,#223
2308  0570 201e          	jra	L377
2309  0572               L177:
2310                     ; 557     else if (UART3_FLAG == UART3_FLAG_LBDF)
2312  0572 1e01          	ldw	x,(OFST+1,sp)
2313  0574 a30210        	cpw	x,#528
2314  0577 2606          	jrne	L577
2315                     ; 559         UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2317  0579 72195247      	bres	21063,#4
2319  057d 2011          	jra	L377
2320  057f               L577:
2321                     ; 562     else if (UART3_FLAG == UART3_FLAG_LHDF)
2323  057f 1e01          	ldw	x,(OFST+1,sp)
2324  0581 a30302        	cpw	x,#770
2325  0584 2606          	jrne	L1001
2326                     ; 564         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2328  0586 72135249      	bres	21065,#1
2330  058a 2004          	jra	L377
2331  058c               L1001:
2332                     ; 569         UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2334  058c 72115249      	bres	21065,#0
2335  0590               L377:
2336                     ; 571 }
2339  0590 85            	popw	x
2340  0591 81            	ret
2415                     ; 586 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2415                     ; 587 {
2416                     	switch	.text
2417  0592               _UART3_GetITStatus:
2419  0592 89            	pushw	x
2420  0593 89            	pushw	x
2421       00000002      OFST:	set	2
2424                     ; 588     ITStatus pendingbitstatus = RESET;
2426                     ; 589     uint8_t itpos = 0;
2428                     ; 590     uint8_t itmask1 = 0;
2430                     ; 591     uint8_t itmask2 = 0;
2432                     ; 592     uint8_t enablestatus = 0;
2434                     ; 595     assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2436  0594 a30277        	cpw	x,#631
2437  0597 2723          	jreq	L422
2438  0599 a30266        	cpw	x,#614
2439  059c 271e          	jreq	L422
2440  059e a30255        	cpw	x,#597
2441  05a1 2719          	jreq	L422
2442  05a3 a30244        	cpw	x,#580
2443  05a6 2714          	jreq	L422
2444  05a8 a30235        	cpw	x,#565
2445  05ab 270f          	jreq	L422
2446  05ad a30346        	cpw	x,#838
2447  05b0 270a          	jreq	L422
2448  05b2 a30412        	cpw	x,#1042
2449  05b5 2705          	jreq	L422
2450  05b7 a30100        	cpw	x,#256
2451  05ba 2603          	jrne	L222
2452  05bc               L422:
2453  05bc 4f            	clr	a
2454  05bd 2010          	jra	L622
2455  05bf               L222:
2456  05bf ae0253        	ldw	x,#595
2457  05c2 89            	pushw	x
2458  05c3 ae0000        	ldw	x,#0
2459  05c6 89            	pushw	x
2460  05c7 ae0008        	ldw	x,#L531
2461  05ca cd0000        	call	_assert_failed
2463  05cd 5b04          	addw	sp,#4
2464  05cf               L622:
2465                     ; 598     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2467  05cf 7b04          	ld	a,(OFST+2,sp)
2468  05d1 a40f          	and	a,#15
2469  05d3 5f            	clrw	x
2470  05d4 97            	ld	xl,a
2471  05d5 a601          	ld	a,#1
2472  05d7 5d            	tnzw	x
2473  05d8 2704          	jreq	L032
2474  05da               L232:
2475  05da 48            	sll	a
2476  05db 5a            	decw	x
2477  05dc 26fc          	jrne	L232
2478  05de               L032:
2479  05de 6b01          	ld	(OFST-1,sp),a
2480                     ; 600     itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2482  05e0 7b04          	ld	a,(OFST+2,sp)
2483  05e2 4e            	swap	a
2484  05e3 a40f          	and	a,#15
2485  05e5 6b02          	ld	(OFST+0,sp),a
2486                     ; 602     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2488  05e7 7b02          	ld	a,(OFST+0,sp)
2489  05e9 5f            	clrw	x
2490  05ea 97            	ld	xl,a
2491  05eb a601          	ld	a,#1
2492  05ed 5d            	tnzw	x
2493  05ee 2704          	jreq	L432
2494  05f0               L632:
2495  05f0 48            	sll	a
2496  05f1 5a            	decw	x
2497  05f2 26fc          	jrne	L632
2498  05f4               L432:
2499  05f4 6b02          	ld	(OFST+0,sp),a
2500                     ; 605     if (UART3_IT == UART3_IT_PE)
2502  05f6 1e03          	ldw	x,(OFST+1,sp)
2503  05f8 a30100        	cpw	x,#256
2504  05fb 261c          	jrne	L7301
2505                     ; 608         enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2507  05fd c65244        	ld	a,21060
2508  0600 1402          	and	a,(OFST+0,sp)
2509  0602 6b02          	ld	(OFST+0,sp),a
2510                     ; 611         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2512  0604 c65240        	ld	a,21056
2513  0607 1501          	bcp	a,(OFST-1,sp)
2514  0609 270a          	jreq	L1401
2516  060b 0d02          	tnz	(OFST+0,sp)
2517  060d 2706          	jreq	L1401
2518                     ; 614             pendingbitstatus = SET;
2520  060f a601          	ld	a,#1
2521  0611 6b02          	ld	(OFST+0,sp),a
2523  0613 2064          	jra	L5401
2524  0615               L1401:
2525                     ; 619             pendingbitstatus = RESET;
2527  0615 0f02          	clr	(OFST+0,sp)
2528  0617 2060          	jra	L5401
2529  0619               L7301:
2530                     ; 622     else if (UART3_IT == UART3_IT_LBDF)
2532  0619 1e03          	ldw	x,(OFST+1,sp)
2533  061b a30346        	cpw	x,#838
2534  061e 261c          	jrne	L7401
2535                     ; 625         enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2537  0620 c65247        	ld	a,21063
2538  0623 1402          	and	a,(OFST+0,sp)
2539  0625 6b02          	ld	(OFST+0,sp),a
2540                     ; 627         if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2542  0627 c65247        	ld	a,21063
2543  062a 1501          	bcp	a,(OFST-1,sp)
2544  062c 270a          	jreq	L1501
2546  062e 0d02          	tnz	(OFST+0,sp)
2547  0630 2706          	jreq	L1501
2548                     ; 630             pendingbitstatus = SET;
2550  0632 a601          	ld	a,#1
2551  0634 6b02          	ld	(OFST+0,sp),a
2553  0636 2041          	jra	L5401
2554  0638               L1501:
2555                     ; 635             pendingbitstatus = RESET;
2557  0638 0f02          	clr	(OFST+0,sp)
2558  063a 203d          	jra	L5401
2559  063c               L7401:
2560                     ; 638     else if (UART3_IT == UART3_IT_LHDF)
2562  063c 1e03          	ldw	x,(OFST+1,sp)
2563  063e a30412        	cpw	x,#1042
2564  0641 261c          	jrne	L7501
2565                     ; 641         enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2567  0643 c65249        	ld	a,21065
2568  0646 1402          	and	a,(OFST+0,sp)
2569  0648 6b02          	ld	(OFST+0,sp),a
2570                     ; 643         if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2572  064a c65249        	ld	a,21065
2573  064d 1501          	bcp	a,(OFST-1,sp)
2574  064f 270a          	jreq	L1601
2576  0651 0d02          	tnz	(OFST+0,sp)
2577  0653 2706          	jreq	L1601
2578                     ; 646             pendingbitstatus = SET;
2580  0655 a601          	ld	a,#1
2581  0657 6b02          	ld	(OFST+0,sp),a
2583  0659 201e          	jra	L5401
2584  065b               L1601:
2585                     ; 651             pendingbitstatus = RESET;
2587  065b 0f02          	clr	(OFST+0,sp)
2588  065d 201a          	jra	L5401
2589  065f               L7501:
2590                     ; 657         enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2592  065f c65245        	ld	a,21061
2593  0662 1402          	and	a,(OFST+0,sp)
2594  0664 6b02          	ld	(OFST+0,sp),a
2595                     ; 659         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2597  0666 c65240        	ld	a,21056
2598  0669 1501          	bcp	a,(OFST-1,sp)
2599  066b 270a          	jreq	L7601
2601  066d 0d02          	tnz	(OFST+0,sp)
2602  066f 2706          	jreq	L7601
2603                     ; 662             pendingbitstatus = SET;
2605  0671 a601          	ld	a,#1
2606  0673 6b02          	ld	(OFST+0,sp),a
2608  0675 2002          	jra	L5401
2609  0677               L7601:
2610                     ; 667             pendingbitstatus = RESET;
2612  0677 0f02          	clr	(OFST+0,sp)
2613  0679               L5401:
2614                     ; 671     return  pendingbitstatus;
2616  0679 7b02          	ld	a,(OFST+0,sp)
2619  067b 5b04          	addw	sp,#4
2620  067d 81            	ret
2657                     ; 701 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2657                     ; 702 {
2658                     	switch	.text
2659  067e               _UART3_ClearITPendingBit:
2661  067e 89            	pushw	x
2662       00000000      OFST:	set	0
2665                     ; 704     assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2667  067f a30255        	cpw	x,#597
2668  0682 270a          	jreq	L442
2669  0684 a30412        	cpw	x,#1042
2670  0687 2705          	jreq	L442
2671  0689 a30346        	cpw	x,#838
2672  068c 2603          	jrne	L242
2673  068e               L442:
2674  068e 4f            	clr	a
2675  068f 2010          	jra	L642
2676  0691               L242:
2677  0691 ae02c0        	ldw	x,#704
2678  0694 89            	pushw	x
2679  0695 ae0000        	ldw	x,#0
2680  0698 89            	pushw	x
2681  0699 ae0008        	ldw	x,#L531
2682  069c cd0000        	call	_assert_failed
2684  069f 5b04          	addw	sp,#4
2685  06a1               L642:
2686                     ; 707     if (UART3_IT == UART3_IT_RXNE)
2688  06a1 1e01          	ldw	x,(OFST+1,sp)
2689  06a3 a30255        	cpw	x,#597
2690  06a6 2606          	jrne	L1111
2691                     ; 709         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2693  06a8 35df5240      	mov	21056,#223
2695  06ac 2011          	jra	L3111
2696  06ae               L1111:
2697                     ; 712     else if (UART3_IT == UART3_IT_LBDF)
2699  06ae 1e01          	ldw	x,(OFST+1,sp)
2700  06b0 a30346        	cpw	x,#838
2701  06b3 2606          	jrne	L5111
2702                     ; 714         UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2704  06b5 72195247      	bres	21063,#4
2706  06b9 2004          	jra	L3111
2707  06bb               L5111:
2708                     ; 719         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2710  06bb 72135249      	bres	21065,#1
2711  06bf               L3111:
2712                     ; 721 }
2715  06bf 85            	popw	x
2716  06c0 81            	ret
2729                     	xdef	_UART3_ClearITPendingBit
2730                     	xdef	_UART3_GetITStatus
2731                     	xdef	_UART3_ClearFlag
2732                     	xdef	_UART3_GetFlagStatus
2733                     	xdef	_UART3_SetAddress
2734                     	xdef	_UART3_SendBreak
2735                     	xdef	_UART3_SendData9
2736                     	xdef	_UART3_SendData8
2737                     	xdef	_UART3_ReceiveData9
2738                     	xdef	_UART3_ReceiveData8
2739                     	xdef	_UART3_WakeUpConfig
2740                     	xdef	_UART3_ReceiverWakeUpCmd
2741                     	xdef	_UART3_LINCmd
2742                     	xdef	_UART3_LINConfig
2743                     	xdef	_UART3_LINBreakDetectionConfig
2744                     	xdef	_UART3_ITConfig
2745                     	xdef	_UART3_Cmd
2746                     	xdef	_UART3_Init
2747                     	xdef	_UART3_DeInit
2748                     	xref	_assert_failed
2749                     	xref	_CLK_GetClockFreq
2750                     	switch	.const
2751  0008               L531:
2752  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_u"
2753  001a 617274332e63  	dc.b	"art3.c",0
2754                     	xref.b	c_lreg
2755                     	xref.b	c_x
2775                     	xref	c_lursh
2776                     	xref	c_lsub
2777                     	xref	c_smul
2778                     	xref	c_ludv
2779                     	xref	c_rtol
2780                     	xref	c_llsh
2781                     	xref	c_lcmp
2782                     	xref	c_ltor
2783                     	end

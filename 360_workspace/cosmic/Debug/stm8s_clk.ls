   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _HSIDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004               _CLKPrescTable:
  22  0004 01            	dc.b	1
  23  0005 02            	dc.b	2
  24  0006 04            	dc.b	4
  25  0007 08            	dc.b	8
  26  0008 0a            	dc.b	10
  27  0009 10            	dc.b	16
  28  000a 14            	dc.b	20
  29  000b 28            	dc.b	40
  58                     ; 66 void CLK_DeInit(void)
  58                     ; 67 {
  60                     	switch	.text
  61  0000               _CLK_DeInit:
  65                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  67  0000 350150c0      	mov	20672,#1
  68                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  70  0004 725f50c1      	clr	20673
  71                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0008 35e150c4      	mov	20676,#225
  74                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  000c 725f50c5      	clr	20677
  77                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0010 351850c6      	mov	20678,#24
  80                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  0014 35ff50c7      	mov	20679,#255
  83                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0018 35ff50ca      	mov	20682,#255
  86                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  88  001c 725f50c8      	clr	20680
  89                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  91  0020 725f50c9      	clr	20681
  93  0024               L52:
  94                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  96  0024 c650c9        	ld	a,20681
  97  0027 a501          	bcp	a,#1
  98  0029 26f9          	jrne	L52
  99                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 101  002b 725f50c9      	clr	20681
 102                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 104  002f 725f50cc      	clr	20684
 105                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 107  0033 725f50cd      	clr	20685
 108                     ; 84 }
 111  0037 81            	ret
 168                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 96 {
 169                     	switch	.text
 170  0038               _CLK_FastHaltWakeUpCmd:
 172  0038 88            	push	a
 173       00000000      OFST:	set	0
 176                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 178  0039 4d            	tnz	a
 179  003a 2704          	jreq	L21
 180  003c a101          	cp	a,#1
 181  003e 2603          	jrne	L01
 182  0040               L21:
 183  0040 4f            	clr	a
 184  0041 2010          	jra	L41
 185  0043               L01:
 186  0043 ae0063        	ldw	x,#99
 187  0046 89            	pushw	x
 188  0047 ae0000        	ldw	x,#0
 189  004a 89            	pushw	x
 190  004b ae000c        	ldw	x,#L75
 191  004e cd0000        	call	_assert_failed
 193  0051 5b04          	addw	sp,#4
 194  0053               L41:
 195                     ; 101     if (NewState != DISABLE)
 197  0053 0d01          	tnz	(OFST+1,sp)
 198  0055 2706          	jreq	L16
 199                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 201  0057 721450c0      	bset	20672,#2
 203  005b 2004          	jra	L36
 204  005d               L16:
 205                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 207  005d 721550c0      	bres	20672,#2
 208  0061               L36:
 209                     ; 112 }
 212  0061 84            	pop	a
 213  0062 81            	ret
 249                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 249                     ; 120 {
 250                     	switch	.text
 251  0063               _CLK_HSECmd:
 253  0063 88            	push	a
 254       00000000      OFST:	set	0
 257                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 259  0064 4d            	tnz	a
 260  0065 2704          	jreq	L22
 261  0067 a101          	cp	a,#1
 262  0069 2603          	jrne	L02
 263  006b               L22:
 264  006b 4f            	clr	a
 265  006c 2010          	jra	L42
 266  006e               L02:
 267  006e ae007b        	ldw	x,#123
 268  0071 89            	pushw	x
 269  0072 ae0000        	ldw	x,#0
 270  0075 89            	pushw	x
 271  0076 ae000c        	ldw	x,#L75
 272  0079 cd0000        	call	_assert_failed
 274  007c 5b04          	addw	sp,#4
 275  007e               L42:
 276                     ; 125     if (NewState != DISABLE)
 278  007e 0d01          	tnz	(OFST+1,sp)
 279  0080 2706          	jreq	L301
 280                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 282  0082 721050c1      	bset	20673,#0
 284  0086 2004          	jra	L501
 285  0088               L301:
 286                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 288  0088 721150c1      	bres	20673,#0
 289  008c               L501:
 290                     ; 136 }
 293  008c 84            	pop	a
 294  008d 81            	ret
 330                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 330                     ; 144 {
 331                     	switch	.text
 332  008e               _CLK_HSICmd:
 334  008e 88            	push	a
 335       00000000      OFST:	set	0
 338                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 340  008f 4d            	tnz	a
 341  0090 2704          	jreq	L23
 342  0092 a101          	cp	a,#1
 343  0094 2603          	jrne	L03
 344  0096               L23:
 345  0096 4f            	clr	a
 346  0097 2010          	jra	L43
 347  0099               L03:
 348  0099 ae0093        	ldw	x,#147
 349  009c 89            	pushw	x
 350  009d ae0000        	ldw	x,#0
 351  00a0 89            	pushw	x
 352  00a1 ae000c        	ldw	x,#L75
 353  00a4 cd0000        	call	_assert_failed
 355  00a7 5b04          	addw	sp,#4
 356  00a9               L43:
 357                     ; 149     if (NewState != DISABLE)
 359  00a9 0d01          	tnz	(OFST+1,sp)
 360  00ab 2706          	jreq	L521
 361                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 363  00ad 721050c0      	bset	20672,#0
 365  00b1 2004          	jra	L721
 366  00b3               L521:
 367                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 369  00b3 721150c0      	bres	20672,#0
 370  00b7               L721:
 371                     ; 160 }
 374  00b7 84            	pop	a
 375  00b8 81            	ret
 411                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 411                     ; 168 {
 412                     	switch	.text
 413  00b9               _CLK_LSICmd:
 415  00b9 88            	push	a
 416       00000000      OFST:	set	0
 419                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 421  00ba 4d            	tnz	a
 422  00bb 2704          	jreq	L24
 423  00bd a101          	cp	a,#1
 424  00bf 2603          	jrne	L04
 425  00c1               L24:
 426  00c1 4f            	clr	a
 427  00c2 2010          	jra	L44
 428  00c4               L04:
 429  00c4 ae00ab        	ldw	x,#171
 430  00c7 89            	pushw	x
 431  00c8 ae0000        	ldw	x,#0
 432  00cb 89            	pushw	x
 433  00cc ae000c        	ldw	x,#L75
 434  00cf cd0000        	call	_assert_failed
 436  00d2 5b04          	addw	sp,#4
 437  00d4               L44:
 438                     ; 173     if (NewState != DISABLE)
 440  00d4 0d01          	tnz	(OFST+1,sp)
 441  00d6 2706          	jreq	L741
 442                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 444  00d8 721650c0      	bset	20672,#3
 446  00dc 2004          	jra	L151
 447  00de               L741:
 448                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 450  00de 721750c0      	bres	20672,#3
 451  00e2               L151:
 452                     ; 184 }
 455  00e2 84            	pop	a
 456  00e3 81            	ret
 492                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 492                     ; 193 {
 493                     	switch	.text
 494  00e4               _CLK_CCOCmd:
 496  00e4 88            	push	a
 497       00000000      OFST:	set	0
 500                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 502  00e5 4d            	tnz	a
 503  00e6 2704          	jreq	L25
 504  00e8 a101          	cp	a,#1
 505  00ea 2603          	jrne	L05
 506  00ec               L25:
 507  00ec 4f            	clr	a
 508  00ed 2010          	jra	L45
 509  00ef               L05:
 510  00ef ae00c4        	ldw	x,#196
 511  00f2 89            	pushw	x
 512  00f3 ae0000        	ldw	x,#0
 513  00f6 89            	pushw	x
 514  00f7 ae000c        	ldw	x,#L75
 515  00fa cd0000        	call	_assert_failed
 517  00fd 5b04          	addw	sp,#4
 518  00ff               L45:
 519                     ; 198     if (NewState != DISABLE)
 521  00ff 0d01          	tnz	(OFST+1,sp)
 522  0101 2706          	jreq	L171
 523                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 525  0103 721050c9      	bset	20681,#0
 527  0107 2004          	jra	L371
 528  0109               L171:
 529                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 531  0109 721150c9      	bres	20681,#0
 532  010d               L371:
 533                     ; 209 }
 536  010d 84            	pop	a
 537  010e 81            	ret
 573                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 573                     ; 219 {
 574                     	switch	.text
 575  010f               _CLK_ClockSwitchCmd:
 577  010f 88            	push	a
 578       00000000      OFST:	set	0
 581                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 583  0110 4d            	tnz	a
 584  0111 2704          	jreq	L26
 585  0113 a101          	cp	a,#1
 586  0115 2603          	jrne	L06
 587  0117               L26:
 588  0117 4f            	clr	a
 589  0118 2010          	jra	L46
 590  011a               L06:
 591  011a ae00de        	ldw	x,#222
 592  011d 89            	pushw	x
 593  011e ae0000        	ldw	x,#0
 594  0121 89            	pushw	x
 595  0122 ae000c        	ldw	x,#L75
 596  0125 cd0000        	call	_assert_failed
 598  0128 5b04          	addw	sp,#4
 599  012a               L46:
 600                     ; 224     if (NewState != DISABLE )
 602  012a 0d01          	tnz	(OFST+1,sp)
 603  012c 2706          	jreq	L312
 604                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 606  012e 721250c5      	bset	20677,#1
 608  0132 2004          	jra	L512
 609  0134               L312:
 610                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 612  0134 721350c5      	bres	20677,#1
 613  0138               L512:
 614                     ; 235 }
 617  0138 84            	pop	a
 618  0139 81            	ret
 655                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 655                     ; 246 {
 656                     	switch	.text
 657  013a               _CLK_SlowActiveHaltWakeUpCmd:
 659  013a 88            	push	a
 660       00000000      OFST:	set	0
 663                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 665  013b 4d            	tnz	a
 666  013c 2704          	jreq	L27
 667  013e a101          	cp	a,#1
 668  0140 2603          	jrne	L07
 669  0142               L27:
 670  0142 4f            	clr	a
 671  0143 2010          	jra	L47
 672  0145               L07:
 673  0145 ae00f9        	ldw	x,#249
 674  0148 89            	pushw	x
 675  0149 ae0000        	ldw	x,#0
 676  014c 89            	pushw	x
 677  014d ae000c        	ldw	x,#L75
 678  0150 cd0000        	call	_assert_failed
 680  0153 5b04          	addw	sp,#4
 681  0155               L47:
 682                     ; 251     if (NewState != DISABLE)
 684  0155 0d01          	tnz	(OFST+1,sp)
 685  0157 2706          	jreq	L532
 686                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 688  0159 721a50c0      	bset	20672,#5
 690  015d 2004          	jra	L732
 691  015f               L532:
 692                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 694  015f 721b50c0      	bres	20672,#5
 695  0163               L732:
 696                     ; 262 }
 699  0163 84            	pop	a
 700  0164 81            	ret
 860                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 860                     ; 273 {
 861                     	switch	.text
 862  0165               _CLK_PeripheralClockConfig:
 864  0165 89            	pushw	x
 865       00000000      OFST:	set	0
 868                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 870  0166 9f            	ld	a,xl
 871  0167 4d            	tnz	a
 872  0168 2705          	jreq	L201
 873  016a 9f            	ld	a,xl
 874  016b a101          	cp	a,#1
 875  016d 2603          	jrne	L001
 876  016f               L201:
 877  016f 4f            	clr	a
 878  0170 2010          	jra	L401
 879  0172               L001:
 880  0172 ae0114        	ldw	x,#276
 881  0175 89            	pushw	x
 882  0176 ae0000        	ldw	x,#0
 883  0179 89            	pushw	x
 884  017a ae000c        	ldw	x,#L75
 885  017d cd0000        	call	_assert_failed
 887  0180 5b04          	addw	sp,#4
 888  0182               L401:
 889                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 891  0182 0d01          	tnz	(OFST+1,sp)
 892  0184 274e          	jreq	L011
 893  0186 7b01          	ld	a,(OFST+1,sp)
 894  0188 a101          	cp	a,#1
 895  018a 2748          	jreq	L011
 896  018c 7b01          	ld	a,(OFST+1,sp)
 897  018e a103          	cp	a,#3
 898  0190 2742          	jreq	L011
 899  0192 7b01          	ld	a,(OFST+1,sp)
 900  0194 a103          	cp	a,#3
 901  0196 273c          	jreq	L011
 902  0198 7b01          	ld	a,(OFST+1,sp)
 903  019a a102          	cp	a,#2
 904  019c 2736          	jreq	L011
 905  019e 7b01          	ld	a,(OFST+1,sp)
 906  01a0 a104          	cp	a,#4
 907  01a2 2730          	jreq	L011
 908  01a4 7b01          	ld	a,(OFST+1,sp)
 909  01a6 a105          	cp	a,#5
 910  01a8 272a          	jreq	L011
 911  01aa 7b01          	ld	a,(OFST+1,sp)
 912  01ac a105          	cp	a,#5
 913  01ae 2724          	jreq	L011
 914  01b0 7b01          	ld	a,(OFST+1,sp)
 915  01b2 a104          	cp	a,#4
 916  01b4 271e          	jreq	L011
 917  01b6 7b01          	ld	a,(OFST+1,sp)
 918  01b8 a106          	cp	a,#6
 919  01ba 2718          	jreq	L011
 920  01bc 7b01          	ld	a,(OFST+1,sp)
 921  01be a107          	cp	a,#7
 922  01c0 2712          	jreq	L011
 923  01c2 7b01          	ld	a,(OFST+1,sp)
 924  01c4 a117          	cp	a,#23
 925  01c6 270c          	jreq	L011
 926  01c8 7b01          	ld	a,(OFST+1,sp)
 927  01ca a113          	cp	a,#19
 928  01cc 2706          	jreq	L011
 929  01ce 7b01          	ld	a,(OFST+1,sp)
 930  01d0 a112          	cp	a,#18
 931  01d2 2603          	jrne	L601
 932  01d4               L011:
 933  01d4 4f            	clr	a
 934  01d5 2010          	jra	L211
 935  01d7               L601:
 936  01d7 ae0115        	ldw	x,#277
 937  01da 89            	pushw	x
 938  01db ae0000        	ldw	x,#0
 939  01de 89            	pushw	x
 940  01df ae000c        	ldw	x,#L75
 941  01e2 cd0000        	call	_assert_failed
 943  01e5 5b04          	addw	sp,#4
 944  01e7               L211:
 945                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 947  01e7 7b01          	ld	a,(OFST+1,sp)
 948  01e9 a510          	bcp	a,#16
 949  01eb 2633          	jrne	L323
 950                     ; 281         if (NewState != DISABLE)
 952  01ed 0d02          	tnz	(OFST+2,sp)
 953  01ef 2717          	jreq	L523
 954                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 956  01f1 7b01          	ld	a,(OFST+1,sp)
 957  01f3 a40f          	and	a,#15
 958  01f5 5f            	clrw	x
 959  01f6 97            	ld	xl,a
 960  01f7 a601          	ld	a,#1
 961  01f9 5d            	tnzw	x
 962  01fa 2704          	jreq	L411
 963  01fc               L611:
 964  01fc 48            	sll	a
 965  01fd 5a            	decw	x
 966  01fe 26fc          	jrne	L611
 967  0200               L411:
 968  0200 ca50c7        	or	a,20679
 969  0203 c750c7        	ld	20679,a
 971  0206 2049          	jra	L133
 972  0208               L523:
 973                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 975  0208 7b01          	ld	a,(OFST+1,sp)
 976  020a a40f          	and	a,#15
 977  020c 5f            	clrw	x
 978  020d 97            	ld	xl,a
 979  020e a601          	ld	a,#1
 980  0210 5d            	tnzw	x
 981  0211 2704          	jreq	L021
 982  0213               L221:
 983  0213 48            	sll	a
 984  0214 5a            	decw	x
 985  0215 26fc          	jrne	L221
 986  0217               L021:
 987  0217 43            	cpl	a
 988  0218 c450c7        	and	a,20679
 989  021b c750c7        	ld	20679,a
 990  021e 2031          	jra	L133
 991  0220               L323:
 992                     ; 294         if (NewState != DISABLE)
 994  0220 0d02          	tnz	(OFST+2,sp)
 995  0222 2717          	jreq	L333
 996                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 998  0224 7b01          	ld	a,(OFST+1,sp)
 999  0226 a40f          	and	a,#15
1000  0228 5f            	clrw	x
1001  0229 97            	ld	xl,a
1002  022a a601          	ld	a,#1
1003  022c 5d            	tnzw	x
1004  022d 2704          	jreq	L421
1005  022f               L621:
1006  022f 48            	sll	a
1007  0230 5a            	decw	x
1008  0231 26fc          	jrne	L621
1009  0233               L421:
1010  0233 ca50ca        	or	a,20682
1011  0236 c750ca        	ld	20682,a
1013  0239 2016          	jra	L133
1014  023b               L333:
1015                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1017  023b 7b01          	ld	a,(OFST+1,sp)
1018  023d a40f          	and	a,#15
1019  023f 5f            	clrw	x
1020  0240 97            	ld	xl,a
1021  0241 a601          	ld	a,#1
1022  0243 5d            	tnzw	x
1023  0244 2704          	jreq	L031
1024  0246               L231:
1025  0246 48            	sll	a
1026  0247 5a            	decw	x
1027  0248 26fc          	jrne	L231
1028  024a               L031:
1029  024a 43            	cpl	a
1030  024b c450ca        	and	a,20682
1031  024e c750ca        	ld	20682,a
1032  0251               L133:
1033                     ; 306 }
1036  0251 85            	popw	x
1037  0252 81            	ret
1224                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1224                     ; 320 {
1225                     	switch	.text
1226  0253               _CLK_ClockSwitchConfig:
1228  0253 89            	pushw	x
1229  0254 5204          	subw	sp,#4
1230       00000004      OFST:	set	4
1233                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1235  0256 ae0491        	ldw	x,#1169
1236  0259 1f03          	ldw	(OFST-1,sp),x
1237                     ; 324     ErrorStatus Swif = ERROR;
1239                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1241  025b 7b06          	ld	a,(OFST+2,sp)
1242  025d a1e1          	cp	a,#225
1243  025f 270c          	jreq	L041
1244  0261 7b06          	ld	a,(OFST+2,sp)
1245  0263 a1d2          	cp	a,#210
1246  0265 2706          	jreq	L041
1247  0267 7b06          	ld	a,(OFST+2,sp)
1248  0269 a1b4          	cp	a,#180
1249  026b 2603          	jrne	L631
1250  026d               L041:
1251  026d 4f            	clr	a
1252  026e 2010          	jra	L241
1253  0270               L631:
1254  0270 ae0147        	ldw	x,#327
1255  0273 89            	pushw	x
1256  0274 ae0000        	ldw	x,#0
1257  0277 89            	pushw	x
1258  0278 ae000c        	ldw	x,#L75
1259  027b cd0000        	call	_assert_failed
1261  027e 5b04          	addw	sp,#4
1262  0280               L241:
1263                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1265  0280 0d05          	tnz	(OFST+1,sp)
1266  0282 2706          	jreq	L641
1267  0284 7b05          	ld	a,(OFST+1,sp)
1268  0286 a101          	cp	a,#1
1269  0288 2603          	jrne	L441
1270  028a               L641:
1271  028a 4f            	clr	a
1272  028b 2010          	jra	L051
1273  028d               L441:
1274  028d ae0148        	ldw	x,#328
1275  0290 89            	pushw	x
1276  0291 ae0000        	ldw	x,#0
1277  0294 89            	pushw	x
1278  0295 ae000c        	ldw	x,#L75
1279  0298 cd0000        	call	_assert_failed
1281  029b 5b04          	addw	sp,#4
1282  029d               L051:
1283                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1285  029d 0d09          	tnz	(OFST+5,sp)
1286  029f 2706          	jreq	L451
1287  02a1 7b09          	ld	a,(OFST+5,sp)
1288  02a3 a101          	cp	a,#1
1289  02a5 2603          	jrne	L251
1290  02a7               L451:
1291  02a7 4f            	clr	a
1292  02a8 2010          	jra	L651
1293  02aa               L251:
1294  02aa ae0149        	ldw	x,#329
1295  02ad 89            	pushw	x
1296  02ae ae0000        	ldw	x,#0
1297  02b1 89            	pushw	x
1298  02b2 ae000c        	ldw	x,#L75
1299  02b5 cd0000        	call	_assert_failed
1301  02b8 5b04          	addw	sp,#4
1302  02ba               L651:
1303                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1305  02ba 0d0a          	tnz	(OFST+6,sp)
1306  02bc 2706          	jreq	L261
1307  02be 7b0a          	ld	a,(OFST+6,sp)
1308  02c0 a101          	cp	a,#1
1309  02c2 2603          	jrne	L061
1310  02c4               L261:
1311  02c4 4f            	clr	a
1312  02c5 2010          	jra	L461
1313  02c7               L061:
1314  02c7 ae014a        	ldw	x,#330
1315  02ca 89            	pushw	x
1316  02cb ae0000        	ldw	x,#0
1317  02ce 89            	pushw	x
1318  02cf ae000c        	ldw	x,#L75
1319  02d2 cd0000        	call	_assert_failed
1321  02d5 5b04          	addw	sp,#4
1322  02d7               L461:
1323                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1325  02d7 c650c3        	ld	a,20675
1326  02da 6b01          	ld	(OFST-3,sp),a
1327                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1329  02dc 7b05          	ld	a,(OFST+1,sp)
1330  02de a101          	cp	a,#1
1331  02e0 2639          	jrne	L544
1332                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1334  02e2 721250c5      	bset	20677,#1
1335                     ; 343         if (ITState != DISABLE)
1337  02e6 0d09          	tnz	(OFST+5,sp)
1338  02e8 2706          	jreq	L744
1339                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1341  02ea 721450c5      	bset	20677,#2
1343  02ee 2004          	jra	L154
1344  02f0               L744:
1345                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1347  02f0 721550c5      	bres	20677,#2
1348  02f4               L154:
1349                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1351  02f4 7b06          	ld	a,(OFST+2,sp)
1352  02f6 c750c4        	ld	20676,a
1354  02f9 2007          	jra	L754
1355  02fb               L354:
1356                     ; 357             DownCounter--;
1358  02fb 1e03          	ldw	x,(OFST-1,sp)
1359  02fd 1d0001        	subw	x,#1
1360  0300 1f03          	ldw	(OFST-1,sp),x
1361  0302               L754:
1362                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1364  0302 c650c5        	ld	a,20677
1365  0305 a501          	bcp	a,#1
1366  0307 2704          	jreq	L364
1368  0309 1e03          	ldw	x,(OFST-1,sp)
1369  030b 26ee          	jrne	L354
1370  030d               L364:
1371                     ; 360         if (DownCounter != 0)
1373  030d 1e03          	ldw	x,(OFST-1,sp)
1374  030f 2706          	jreq	L564
1375                     ; 362             Swif = SUCCESS;
1377  0311 a601          	ld	a,#1
1378  0313 6b02          	ld	(OFST-2,sp),a
1380  0315 201b          	jra	L174
1381  0317               L564:
1382                     ; 366             Swif = ERROR;
1384  0317 0f02          	clr	(OFST-2,sp)
1385  0319 2017          	jra	L174
1386  031b               L544:
1387                     ; 374         if (ITState != DISABLE)
1389  031b 0d09          	tnz	(OFST+5,sp)
1390  031d 2706          	jreq	L374
1391                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1393  031f 721450c5      	bset	20677,#2
1395  0323 2004          	jra	L574
1396  0325               L374:
1397                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1399  0325 721550c5      	bres	20677,#2
1400  0329               L574:
1401                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1403  0329 7b06          	ld	a,(OFST+2,sp)
1404  032b c750c4        	ld	20676,a
1405                     ; 388         Swif = SUCCESS;
1407  032e a601          	ld	a,#1
1408  0330 6b02          	ld	(OFST-2,sp),a
1409  0332               L174:
1410                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1412  0332 0d0a          	tnz	(OFST+6,sp)
1413  0334 260c          	jrne	L774
1415  0336 7b01          	ld	a,(OFST-3,sp)
1416  0338 a1e1          	cp	a,#225
1417  033a 2606          	jrne	L774
1418                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1420  033c 721150c0      	bres	20672,#0
1422  0340 201e          	jra	L105
1423  0342               L774:
1424                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1426  0342 0d0a          	tnz	(OFST+6,sp)
1427  0344 260c          	jrne	L305
1429  0346 7b01          	ld	a,(OFST-3,sp)
1430  0348 a1d2          	cp	a,#210
1431  034a 2606          	jrne	L305
1432                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1434  034c 721750c0      	bres	20672,#3
1436  0350 200e          	jra	L105
1437  0352               L305:
1438                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1440  0352 0d0a          	tnz	(OFST+6,sp)
1441  0354 260a          	jrne	L105
1443  0356 7b01          	ld	a,(OFST-3,sp)
1444  0358 a1b4          	cp	a,#180
1445  035a 2604          	jrne	L105
1446                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1448  035c 721150c1      	bres	20673,#0
1449  0360               L105:
1450                     ; 406     return(Swif);
1452  0360 7b02          	ld	a,(OFST-2,sp)
1455  0362 5b06          	addw	sp,#6
1456  0364 81            	ret
1595                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1595                     ; 417 {
1596                     	switch	.text
1597  0365               _CLK_HSIPrescalerConfig:
1599  0365 88            	push	a
1600       00000000      OFST:	set	0
1603                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1605  0366 4d            	tnz	a
1606  0367 270c          	jreq	L271
1607  0369 a108          	cp	a,#8
1608  036b 2708          	jreq	L271
1609  036d a110          	cp	a,#16
1610  036f 2704          	jreq	L271
1611  0371 a118          	cp	a,#24
1612  0373 2603          	jrne	L071
1613  0375               L271:
1614  0375 4f            	clr	a
1615  0376 2010          	jra	L471
1616  0378               L071:
1617  0378 ae01a4        	ldw	x,#420
1618  037b 89            	pushw	x
1619  037c ae0000        	ldw	x,#0
1620  037f 89            	pushw	x
1621  0380 ae000c        	ldw	x,#L75
1622  0383 cd0000        	call	_assert_failed
1624  0386 5b04          	addw	sp,#4
1625  0388               L471:
1626                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1628  0388 c650c6        	ld	a,20678
1629  038b a4e7          	and	a,#231
1630  038d c750c6        	ld	20678,a
1631                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1633  0390 c650c6        	ld	a,20678
1634  0393 1a01          	or	a,(OFST+1,sp)
1635  0395 c750c6        	ld	20678,a
1636                     ; 428 }
1639  0398 84            	pop	a
1640  0399 81            	ret
1776                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1776                     ; 440 {
1777                     	switch	.text
1778  039a               _CLK_CCOConfig:
1780  039a 88            	push	a
1781       00000000      OFST:	set	0
1784                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1786  039b 4d            	tnz	a
1787  039c 2730          	jreq	L202
1788  039e a104          	cp	a,#4
1789  03a0 272c          	jreq	L202
1790  03a2 a102          	cp	a,#2
1791  03a4 2728          	jreq	L202
1792  03a6 a108          	cp	a,#8
1793  03a8 2724          	jreq	L202
1794  03aa a10a          	cp	a,#10
1795  03ac 2720          	jreq	L202
1796  03ae a10c          	cp	a,#12
1797  03b0 271c          	jreq	L202
1798  03b2 a10e          	cp	a,#14
1799  03b4 2718          	jreq	L202
1800  03b6 a110          	cp	a,#16
1801  03b8 2714          	jreq	L202
1802  03ba a112          	cp	a,#18
1803  03bc 2710          	jreq	L202
1804  03be a114          	cp	a,#20
1805  03c0 270c          	jreq	L202
1806  03c2 a116          	cp	a,#22
1807  03c4 2708          	jreq	L202
1808  03c6 a118          	cp	a,#24
1809  03c8 2704          	jreq	L202
1810  03ca a11a          	cp	a,#26
1811  03cc 2603          	jrne	L002
1812  03ce               L202:
1813  03ce 4f            	clr	a
1814  03cf 2010          	jra	L402
1815  03d1               L002:
1816  03d1 ae01bb        	ldw	x,#443
1817  03d4 89            	pushw	x
1818  03d5 ae0000        	ldw	x,#0
1819  03d8 89            	pushw	x
1820  03d9 ae000c        	ldw	x,#L75
1821  03dc cd0000        	call	_assert_failed
1823  03df 5b04          	addw	sp,#4
1824  03e1               L402:
1825                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1827  03e1 c650c9        	ld	a,20681
1828  03e4 a4e1          	and	a,#225
1829  03e6 c750c9        	ld	20681,a
1830                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1832  03e9 c650c9        	ld	a,20681
1833  03ec 1a01          	or	a,(OFST+1,sp)
1834  03ee c750c9        	ld	20681,a
1835                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1837  03f1 721050c9      	bset	20681,#0
1838                     ; 454 }
1841  03f5 84            	pop	a
1842  03f6 81            	ret
1908                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1908                     ; 465 {
1909                     	switch	.text
1910  03f7               _CLK_ITConfig:
1912  03f7 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1918  03f8 9f            	ld	a,xl
1919  03f9 4d            	tnz	a
1920  03fa 2705          	jreq	L212
1921  03fc 9f            	ld	a,xl
1922  03fd a101          	cp	a,#1
1923  03ff 2603          	jrne	L012
1924  0401               L212:
1925  0401 4f            	clr	a
1926  0402 2010          	jra	L412
1927  0404               L012:
1928  0404 ae01d4        	ldw	x,#468
1929  0407 89            	pushw	x
1930  0408 ae0000        	ldw	x,#0
1931  040b 89            	pushw	x
1932  040c ae000c        	ldw	x,#L75
1933  040f cd0000        	call	_assert_failed
1935  0412 5b04          	addw	sp,#4
1936  0414               L412:
1937                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1939  0414 7b01          	ld	a,(OFST+1,sp)
1940  0416 a10c          	cp	a,#12
1941  0418 2706          	jreq	L022
1942  041a 7b01          	ld	a,(OFST+1,sp)
1943  041c a11c          	cp	a,#28
1944  041e 2603          	jrne	L612
1945  0420               L022:
1946  0420 4f            	clr	a
1947  0421 2010          	jra	L222
1948  0423               L612:
1949  0423 ae01d5        	ldw	x,#469
1950  0426 89            	pushw	x
1951  0427 ae0000        	ldw	x,#0
1952  042a 89            	pushw	x
1953  042b ae000c        	ldw	x,#L75
1954  042e cd0000        	call	_assert_failed
1956  0431 5b04          	addw	sp,#4
1957  0433               L222:
1958                     ; 471     if (NewState != DISABLE)
1960  0433 0d02          	tnz	(OFST+2,sp)
1961  0435 271a          	jreq	L507
1962                     ; 473         switch (CLK_IT)
1964  0437 7b01          	ld	a,(OFST+1,sp)
1966                     ; 481         default:
1966                     ; 482             break;
1967  0439 a00c          	sub	a,#12
1968  043b 270a          	jreq	L146
1969  043d a010          	sub	a,#16
1970  043f 2624          	jrne	L317
1971                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1971                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1973  0441 721450c5      	bset	20677,#2
1974                     ; 477             break;
1976  0445 201e          	jra	L317
1977  0447               L146:
1978                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1978                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1980  0447 721450c8      	bset	20680,#2
1981                     ; 480             break;
1983  044b 2018          	jra	L317
1984  044d               L346:
1985                     ; 481         default:
1985                     ; 482             break;
1987  044d 2016          	jra	L317
1988  044f               L117:
1990  044f 2014          	jra	L317
1991  0451               L507:
1992                     ; 487         switch (CLK_IT)
1994  0451 7b01          	ld	a,(OFST+1,sp)
1996                     ; 495         default:
1996                     ; 496             break;
1997  0453 a00c          	sub	a,#12
1998  0455 270a          	jreq	L746
1999  0457 a010          	sub	a,#16
2000  0459 260a          	jrne	L317
2001                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
2001                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2003  045b 721550c5      	bres	20677,#2
2004                     ; 491             break;
2006  045f 2004          	jra	L317
2007  0461               L746:
2008                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
2008                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2010  0461 721550c8      	bres	20680,#2
2011                     ; 494             break;
2012  0465               L317:
2013                     ; 500 }
2016  0465 85            	popw	x
2017  0466 81            	ret
2018  0467               L156:
2019                     ; 495         default:
2019                     ; 496             break;
2021  0467 20fc          	jra	L317
2022  0469               L717:
2023  0469 20fa          	jra	L317
2059                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
2059                     ; 508 {
2060                     	switch	.text
2061  046b               _CLK_SYSCLKConfig:
2063  046b 88            	push	a
2064       00000000      OFST:	set	0
2067                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
2069  046c 4d            	tnz	a
2070  046d 272c          	jreq	L032
2071  046f a108          	cp	a,#8
2072  0471 2728          	jreq	L032
2073  0473 a110          	cp	a,#16
2074  0475 2724          	jreq	L032
2075  0477 a118          	cp	a,#24
2076  0479 2720          	jreq	L032
2077  047b a180          	cp	a,#128
2078  047d 271c          	jreq	L032
2079  047f a181          	cp	a,#129
2080  0481 2718          	jreq	L032
2081  0483 a182          	cp	a,#130
2082  0485 2714          	jreq	L032
2083  0487 a183          	cp	a,#131
2084  0489 2710          	jreq	L032
2085  048b a184          	cp	a,#132
2086  048d 270c          	jreq	L032
2087  048f a185          	cp	a,#133
2088  0491 2708          	jreq	L032
2089  0493 a186          	cp	a,#134
2090  0495 2704          	jreq	L032
2091  0497 a187          	cp	a,#135
2092  0499 2603          	jrne	L622
2093  049b               L032:
2094  049b 4f            	clr	a
2095  049c 2010          	jra	L232
2096  049e               L622:
2097  049e ae01ff        	ldw	x,#511
2098  04a1 89            	pushw	x
2099  04a2 ae0000        	ldw	x,#0
2100  04a5 89            	pushw	x
2101  04a6 ae000c        	ldw	x,#L75
2102  04a9 cd0000        	call	_assert_failed
2104  04ac 5b04          	addw	sp,#4
2105  04ae               L232:
2106                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
2108  04ae 7b01          	ld	a,(OFST+1,sp)
2109  04b0 a580          	bcp	a,#128
2110  04b2 2614          	jrne	L737
2111                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
2113  04b4 c650c6        	ld	a,20678
2114  04b7 a4e7          	and	a,#231
2115  04b9 c750c6        	ld	20678,a
2116                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
2118  04bc 7b01          	ld	a,(OFST+1,sp)
2119  04be a418          	and	a,#24
2120  04c0 ca50c6        	or	a,20678
2121  04c3 c750c6        	ld	20678,a
2123  04c6 2012          	jra	L147
2124  04c8               L737:
2125                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
2127  04c8 c650c6        	ld	a,20678
2128  04cb a4f8          	and	a,#248
2129  04cd c750c6        	ld	20678,a
2130                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
2132  04d0 7b01          	ld	a,(OFST+1,sp)
2133  04d2 a407          	and	a,#7
2134  04d4 ca50c6        	or	a,20678
2135  04d7 c750c6        	ld	20678,a
2136  04da               L147:
2137                     ; 524 }
2140  04da 84            	pop	a
2141  04db 81            	ret
2198                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
2198                     ; 532 {
2199                     	switch	.text
2200  04dc               _CLK_SWIMConfig:
2202  04dc 88            	push	a
2203       00000000      OFST:	set	0
2206                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
2208  04dd 4d            	tnz	a
2209  04de 2704          	jreq	L042
2210  04e0 a101          	cp	a,#1
2211  04e2 2603          	jrne	L632
2212  04e4               L042:
2213  04e4 4f            	clr	a
2214  04e5 2010          	jra	L242
2215  04e7               L632:
2216  04e7 ae0217        	ldw	x,#535
2217  04ea 89            	pushw	x
2218  04eb ae0000        	ldw	x,#0
2219  04ee 89            	pushw	x
2220  04ef ae000c        	ldw	x,#L75
2221  04f2 cd0000        	call	_assert_failed
2223  04f5 5b04          	addw	sp,#4
2224  04f7               L242:
2225                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
2227  04f7 0d01          	tnz	(OFST+1,sp)
2228  04f9 2706          	jreq	L177
2229                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
2231  04fb 721050cd      	bset	20685,#0
2233  04ff 2004          	jra	L377
2234  0501               L177:
2235                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
2237  0501 721150cd      	bres	20685,#0
2238  0505               L377:
2239                     ; 548 }
2242  0505 84            	pop	a
2243  0506 81            	ret
2267                     ; 557 void CLK_ClockSecuritySystemEnable(void)
2267                     ; 558 {
2268                     	switch	.text
2269  0507               _CLK_ClockSecuritySystemEnable:
2273                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
2275  0507 721050c8      	bset	20680,#0
2276                     ; 561 }
2279  050b 81            	ret
2304                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
2304                     ; 570 {
2305                     	switch	.text
2306  050c               _CLK_GetSYSCLKSource:
2310                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
2312  050c c650c3        	ld	a,20675
2315  050f 81            	ret
2372                     ; 579 uint32_t CLK_GetClockFreq(void)
2372                     ; 580 {
2373                     	switch	.text
2374  0510               _CLK_GetClockFreq:
2376  0510 5209          	subw	sp,#9
2377       00000009      OFST:	set	9
2380                     ; 582     uint32_t clockfrequency = 0;
2382                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
2384                     ; 584     uint8_t tmp = 0, presc = 0;
2388                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
2390  0512 c650c3        	ld	a,20675
2391  0515 6b09          	ld	(OFST+0,sp),a
2392                     ; 589     if (clocksource == CLK_SOURCE_HSI)
2394  0517 7b09          	ld	a,(OFST+0,sp)
2395  0519 a1e1          	cp	a,#225
2396  051b 2641          	jrne	L1401
2397                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
2399  051d c650c6        	ld	a,20678
2400  0520 a418          	and	a,#24
2401  0522 6b09          	ld	(OFST+0,sp),a
2402                     ; 592         tmp = (uint8_t)(tmp >> 3);
2404  0524 0409          	srl	(OFST+0,sp)
2405  0526 0409          	srl	(OFST+0,sp)
2406  0528 0409          	srl	(OFST+0,sp)
2407                     ; 593         presc = HSIDivFactor[tmp];
2409  052a 7b09          	ld	a,(OFST+0,sp)
2410  052c 5f            	clrw	x
2411  052d 97            	ld	xl,a
2412  052e d60000        	ld	a,(_HSIDivFactor,x)
2413  0531 6b09          	ld	(OFST+0,sp),a
2414                     ; 594         clockfrequency = HSI_VALUE / presc;
2416  0533 7b09          	ld	a,(OFST+0,sp)
2417  0535 b703          	ld	c_lreg+3,a
2418  0537 3f02          	clr	c_lreg+2
2419  0539 3f01          	clr	c_lreg+1
2420  053b 3f00          	clr	c_lreg
2421  053d 96            	ldw	x,sp
2422  053e 1c0001        	addw	x,#OFST-8
2423  0541 cd0000        	call	c_rtol
2425  0544 ae2400        	ldw	x,#9216
2426  0547 bf02          	ldw	c_lreg+2,x
2427  0549 ae00f4        	ldw	x,#244
2428  054c bf00          	ldw	c_lreg,x
2429  054e 96            	ldw	x,sp
2430  054f 1c0001        	addw	x,#OFST-8
2431  0552 cd0000        	call	c_ludv
2433  0555 96            	ldw	x,sp
2434  0556 1c0005        	addw	x,#OFST-4
2435  0559 cd0000        	call	c_rtol
2438  055c 201c          	jra	L3401
2439  055e               L1401:
2440                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2442  055e 7b09          	ld	a,(OFST+0,sp)
2443  0560 a1d2          	cp	a,#210
2444  0562 260c          	jrne	L5401
2445                     ; 598         clockfrequency = LSI_VALUE;
2447  0564 aef400        	ldw	x,#62464
2448  0567 1f07          	ldw	(OFST-2,sp),x
2449  0569 ae0001        	ldw	x,#1
2450  056c 1f05          	ldw	(OFST-4,sp),x
2452  056e 200a          	jra	L3401
2453  0570               L5401:
2454                     ; 602         clockfrequency = HSE_VALUE;
2456  0570 ae3600        	ldw	x,#13824
2457  0573 1f07          	ldw	(OFST-2,sp),x
2458  0575 ae016e        	ldw	x,#366
2459  0578 1f05          	ldw	(OFST-4,sp),x
2460  057a               L3401:
2461                     ; 605     return((uint32_t)clockfrequency);
2463  057a 96            	ldw	x,sp
2464  057b 1c0005        	addw	x,#OFST-4
2465  057e cd0000        	call	c_ltor
2469  0581 5b09          	addw	sp,#9
2470  0583 81            	ret
2570                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2570                     ; 617 {
2571                     	switch	.text
2572  0584               _CLK_AdjustHSICalibrationValue:
2574  0584 88            	push	a
2575       00000000      OFST:	set	0
2578                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2580  0585 4d            	tnz	a
2581  0586 271c          	jreq	L652
2582  0588 a101          	cp	a,#1
2583  058a 2718          	jreq	L652
2584  058c a102          	cp	a,#2
2585  058e 2714          	jreq	L652
2586  0590 a103          	cp	a,#3
2587  0592 2710          	jreq	L652
2588  0594 a104          	cp	a,#4
2589  0596 270c          	jreq	L652
2590  0598 a105          	cp	a,#5
2591  059a 2708          	jreq	L652
2592  059c a106          	cp	a,#6
2593  059e 2704          	jreq	L652
2594  05a0 a107          	cp	a,#7
2595  05a2 2603          	jrne	L452
2596  05a4               L652:
2597  05a4 4f            	clr	a
2598  05a5 2010          	jra	L062
2599  05a7               L452:
2600  05a7 ae026c        	ldw	x,#620
2601  05aa 89            	pushw	x
2602  05ab ae0000        	ldw	x,#0
2603  05ae 89            	pushw	x
2604  05af ae000c        	ldw	x,#L75
2605  05b2 cd0000        	call	_assert_failed
2607  05b5 5b04          	addw	sp,#4
2608  05b7               L062:
2609                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2611  05b7 c650cc        	ld	a,20684
2612  05ba a4f8          	and	a,#248
2613  05bc 1a01          	or	a,(OFST+1,sp)
2614  05be c750cc        	ld	20684,a
2615                     ; 625 }
2618  05c1 84            	pop	a
2619  05c2 81            	ret
2643                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2643                     ; 637 {
2644                     	switch	.text
2645  05c3               _CLK_SYSCLKEmergencyClear:
2649                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2651  05c3 721150c5      	bres	20677,#0
2652                     ; 639 }
2655  05c7 81            	ret
2805                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2805                     ; 649 {
2806                     	switch	.text
2807  05c8               _CLK_GetFlagStatus:
2809  05c8 89            	pushw	x
2810  05c9 5203          	subw	sp,#3
2811       00000003      OFST:	set	3
2814                     ; 651     uint16_t statusreg = 0;
2816                     ; 652     uint8_t tmpreg = 0;
2818                     ; 653     FlagStatus bitstatus = RESET;
2820                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2822  05cb a30110        	cpw	x,#272
2823  05ce 2728          	jreq	L072
2824  05d0 a30102        	cpw	x,#258
2825  05d3 2723          	jreq	L072
2826  05d5 a30202        	cpw	x,#514
2827  05d8 271e          	jreq	L072
2828  05da a30308        	cpw	x,#776
2829  05dd 2719          	jreq	L072
2830  05df a30301        	cpw	x,#769
2831  05e2 2714          	jreq	L072
2832  05e4 a30408        	cpw	x,#1032
2833  05e7 270f          	jreq	L072
2834  05e9 a30402        	cpw	x,#1026
2835  05ec 270a          	jreq	L072
2836  05ee a30504        	cpw	x,#1284
2837  05f1 2705          	jreq	L072
2838  05f3 a30502        	cpw	x,#1282
2839  05f6 2603          	jrne	L662
2840  05f8               L072:
2841  05f8 4f            	clr	a
2842  05f9 2010          	jra	L272
2843  05fb               L662:
2844  05fb ae0290        	ldw	x,#656
2845  05fe 89            	pushw	x
2846  05ff ae0000        	ldw	x,#0
2847  0602 89            	pushw	x
2848  0603 ae000c        	ldw	x,#L75
2849  0606 cd0000        	call	_assert_failed
2851  0609 5b04          	addw	sp,#4
2852  060b               L272:
2853                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2855  060b 7b04          	ld	a,(OFST+1,sp)
2856  060d 97            	ld	xl,a
2857  060e 7b05          	ld	a,(OFST+2,sp)
2858  0610 9f            	ld	a,xl
2859  0611 a4ff          	and	a,#255
2860  0613 97            	ld	xl,a
2861  0614 4f            	clr	a
2862  0615 02            	rlwa	x,a
2863  0616 1f01          	ldw	(OFST-2,sp),x
2864  0618 01            	rrwa	x,a
2865                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2867  0619 1e01          	ldw	x,(OFST-2,sp)
2868  061b a30100        	cpw	x,#256
2869  061e 2607          	jrne	L7021
2870                     ; 664         tmpreg = CLK->ICKR;
2872  0620 c650c0        	ld	a,20672
2873  0623 6b03          	ld	(OFST+0,sp),a
2875  0625 202f          	jra	L1121
2876  0627               L7021:
2877                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2879  0627 1e01          	ldw	x,(OFST-2,sp)
2880  0629 a30200        	cpw	x,#512
2881  062c 2607          	jrne	L3121
2882                     ; 668         tmpreg = CLK->ECKR;
2884  062e c650c1        	ld	a,20673
2885  0631 6b03          	ld	(OFST+0,sp),a
2887  0633 2021          	jra	L1121
2888  0635               L3121:
2889                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2891  0635 1e01          	ldw	x,(OFST-2,sp)
2892  0637 a30300        	cpw	x,#768
2893  063a 2607          	jrne	L7121
2894                     ; 672         tmpreg = CLK->SWCR;
2896  063c c650c5        	ld	a,20677
2897  063f 6b03          	ld	(OFST+0,sp),a
2899  0641 2013          	jra	L1121
2900  0643               L7121:
2901                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2903  0643 1e01          	ldw	x,(OFST-2,sp)
2904  0645 a30400        	cpw	x,#1024
2905  0648 2607          	jrne	L3221
2906                     ; 676         tmpreg = CLK->CSSR;
2908  064a c650c8        	ld	a,20680
2909  064d 6b03          	ld	(OFST+0,sp),a
2911  064f 2005          	jra	L1121
2912  0651               L3221:
2913                     ; 680         tmpreg = CLK->CCOR;
2915  0651 c650c9        	ld	a,20681
2916  0654 6b03          	ld	(OFST+0,sp),a
2917  0656               L1121:
2918                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2920  0656 7b05          	ld	a,(OFST+2,sp)
2921  0658 1503          	bcp	a,(OFST+0,sp)
2922  065a 2706          	jreq	L7221
2923                     ; 685         bitstatus = SET;
2925  065c a601          	ld	a,#1
2926  065e 6b03          	ld	(OFST+0,sp),a
2928  0660 2002          	jra	L1321
2929  0662               L7221:
2930                     ; 689         bitstatus = RESET;
2932  0662 0f03          	clr	(OFST+0,sp)
2933  0664               L1321:
2934                     ; 693     return((FlagStatus)bitstatus);
2936  0664 7b03          	ld	a,(OFST+0,sp)
2939  0666 5b05          	addw	sp,#5
2940  0668 81            	ret
2987                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2987                     ; 704 {
2988                     	switch	.text
2989  0669               _CLK_GetITStatus:
2991  0669 88            	push	a
2992  066a 88            	push	a
2993       00000001      OFST:	set	1
2996                     ; 706     ITStatus bitstatus = RESET;
2998                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
3000  066b a10c          	cp	a,#12
3001  066d 2704          	jreq	L003
3002  066f a11c          	cp	a,#28
3003  0671 2603          	jrne	L672
3004  0673               L003:
3005  0673 4f            	clr	a
3006  0674 2010          	jra	L203
3007  0676               L672:
3008  0676 ae02c5        	ldw	x,#709
3009  0679 89            	pushw	x
3010  067a ae0000        	ldw	x,#0
3011  067d 89            	pushw	x
3012  067e ae000c        	ldw	x,#L75
3013  0681 cd0000        	call	_assert_failed
3015  0684 5b04          	addw	sp,#4
3016  0686               L203:
3017                     ; 711     if (CLK_IT == CLK_IT_SWIF)
3019  0686 7b02          	ld	a,(OFST+1,sp)
3020  0688 a11c          	cp	a,#28
3021  068a 2613          	jrne	L5521
3022                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3024  068c c650c5        	ld	a,20677
3025  068f 1402          	and	a,(OFST+1,sp)
3026  0691 a10c          	cp	a,#12
3027  0693 2606          	jrne	L7521
3028                     ; 716             bitstatus = SET;
3030  0695 a601          	ld	a,#1
3031  0697 6b01          	ld	(OFST+0,sp),a
3033  0699 2015          	jra	L3621
3034  069b               L7521:
3035                     ; 720             bitstatus = RESET;
3037  069b 0f01          	clr	(OFST+0,sp)
3038  069d 2011          	jra	L3621
3039  069f               L5521:
3040                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
3042  069f c650c8        	ld	a,20680
3043  06a2 1402          	and	a,(OFST+1,sp)
3044  06a4 a10c          	cp	a,#12
3045  06a6 2606          	jrne	L5621
3046                     ; 728             bitstatus = SET;
3048  06a8 a601          	ld	a,#1
3049  06aa 6b01          	ld	(OFST+0,sp),a
3051  06ac 2002          	jra	L3621
3052  06ae               L5621:
3053                     ; 732             bitstatus = RESET;
3055  06ae 0f01          	clr	(OFST+0,sp)
3056  06b0               L3621:
3057                     ; 737     return bitstatus;
3059  06b0 7b01          	ld	a,(OFST+0,sp)
3062  06b2 85            	popw	x
3063  06b3 81            	ret
3100                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
3100                     ; 748 {
3101                     	switch	.text
3102  06b4               _CLK_ClearITPendingBit:
3104  06b4 88            	push	a
3105       00000000      OFST:	set	0
3108                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
3110  06b5 a10c          	cp	a,#12
3111  06b7 2704          	jreq	L013
3112  06b9 a11c          	cp	a,#28
3113  06bb 2603          	jrne	L603
3114  06bd               L013:
3115  06bd 4f            	clr	a
3116  06be 2010          	jra	L213
3117  06c0               L603:
3118  06c0 ae02ef        	ldw	x,#751
3119  06c3 89            	pushw	x
3120  06c4 ae0000        	ldw	x,#0
3121  06c7 89            	pushw	x
3122  06c8 ae000c        	ldw	x,#L75
3123  06cb cd0000        	call	_assert_failed
3125  06ce 5b04          	addw	sp,#4
3126  06d0               L213:
3127                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
3129  06d0 7b01          	ld	a,(OFST+1,sp)
3130  06d2 a10c          	cp	a,#12
3131  06d4 2606          	jrne	L7031
3132                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
3134  06d6 721750c8      	bres	20680,#3
3136  06da 2004          	jra	L1131
3137  06dc               L7031:
3138                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
3140  06dc 721750c5      	bres	20677,#3
3141  06e0               L1131:
3142                     ; 764 }
3145  06e0 84            	pop	a
3146  06e1 81            	ret
3181                     	xdef	_CLKPrescTable
3182                     	xdef	_HSIDivFactor
3183                     	xdef	_CLK_ClearITPendingBit
3184                     	xdef	_CLK_GetITStatus
3185                     	xdef	_CLK_GetFlagStatus
3186                     	xdef	_CLK_GetSYSCLKSource
3187                     	xdef	_CLK_GetClockFreq
3188                     	xdef	_CLK_AdjustHSICalibrationValue
3189                     	xdef	_CLK_SYSCLKEmergencyClear
3190                     	xdef	_CLK_ClockSecuritySystemEnable
3191                     	xdef	_CLK_SWIMConfig
3192                     	xdef	_CLK_SYSCLKConfig
3193                     	xdef	_CLK_ITConfig
3194                     	xdef	_CLK_CCOConfig
3195                     	xdef	_CLK_HSIPrescalerConfig
3196                     	xdef	_CLK_ClockSwitchConfig
3197                     	xdef	_CLK_PeripheralClockConfig
3198                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
3199                     	xdef	_CLK_FastHaltWakeUpCmd
3200                     	xdef	_CLK_ClockSwitchCmd
3201                     	xdef	_CLK_CCOCmd
3202                     	xdef	_CLK_LSICmd
3203                     	xdef	_CLK_HSICmd
3204                     	xdef	_CLK_HSECmd
3205                     	xdef	_CLK_DeInit
3206                     	xref	_assert_failed
3207                     	switch	.const
3208  000c               L75:
3209  000c 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_c"
3210  001e 6c6b2e6300    	dc.b	"lk.c",0
3211                     	xref.b	c_lreg
3212                     	xref.b	c_x
3232                     	xref	c_ltor
3233                     	xref	c_ludv
3234                     	xref	c_rtol
3235                     	end

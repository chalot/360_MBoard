   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 44 void SPI_DeInit(void)
  43                     ; 45 {
  45                     	switch	.text
  46  0000               _SPI_DeInit:
  50                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  52  0000 725f5200      	clr	20992
  53                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  55  0004 725f5201      	clr	20993
  56                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  58  0008 725f5202      	clr	20994
  59                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  61  000c 35025203      	mov	20995,#2
  62                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  64  0010 35075205      	mov	20997,#7
  65                     ; 51 }
  68  0014 81            	ret
 383                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 383                     ; 73 {
 384                     	switch	.text
 385  0015               _SPI_Init:
 387  0015 89            	pushw	x
 388  0016 88            	push	a
 389       00000001      OFST:	set	1
 392                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 394  0017 9e            	ld	a,xh
 395  0018 4d            	tnz	a
 396  0019 2705          	jreq	L21
 397  001b 9e            	ld	a,xh
 398  001c a180          	cp	a,#128
 399  001e 2603          	jrne	L01
 400  0020               L21:
 401  0020 4f            	clr	a
 402  0021 2010          	jra	L41
 403  0023               L01:
 404  0023 ae004b        	ldw	x,#75
 405  0026 89            	pushw	x
 406  0027 ae0000        	ldw	x,#0
 407  002a 89            	pushw	x
 408  002b ae0000        	ldw	x,#L102
 409  002e cd0000        	call	_assert_failed
 411  0031 5b04          	addw	sp,#4
 412  0033               L41:
 413                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 415  0033 0d03          	tnz	(OFST+2,sp)
 416  0035 272a          	jreq	L02
 417  0037 7b03          	ld	a,(OFST+2,sp)
 418  0039 a108          	cp	a,#8
 419  003b 2724          	jreq	L02
 420  003d 7b03          	ld	a,(OFST+2,sp)
 421  003f a110          	cp	a,#16
 422  0041 271e          	jreq	L02
 423  0043 7b03          	ld	a,(OFST+2,sp)
 424  0045 a118          	cp	a,#24
 425  0047 2718          	jreq	L02
 426  0049 7b03          	ld	a,(OFST+2,sp)
 427  004b a120          	cp	a,#32
 428  004d 2712          	jreq	L02
 429  004f 7b03          	ld	a,(OFST+2,sp)
 430  0051 a128          	cp	a,#40
 431  0053 270c          	jreq	L02
 432  0055 7b03          	ld	a,(OFST+2,sp)
 433  0057 a130          	cp	a,#48
 434  0059 2706          	jreq	L02
 435  005b 7b03          	ld	a,(OFST+2,sp)
 436  005d a138          	cp	a,#56
 437  005f 2603          	jrne	L61
 438  0061               L02:
 439  0061 4f            	clr	a
 440  0062 2010          	jra	L22
 441  0064               L61:
 442  0064 ae004c        	ldw	x,#76
 443  0067 89            	pushw	x
 444  0068 ae0000        	ldw	x,#0
 445  006b 89            	pushw	x
 446  006c ae0000        	ldw	x,#L102
 447  006f cd0000        	call	_assert_failed
 449  0072 5b04          	addw	sp,#4
 450  0074               L22:
 451                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 453  0074 7b06          	ld	a,(OFST+5,sp)
 454  0076 a104          	cp	a,#4
 455  0078 2704          	jreq	L62
 456  007a 0d06          	tnz	(OFST+5,sp)
 457  007c 2603          	jrne	L42
 458  007e               L62:
 459  007e 4f            	clr	a
 460  007f 2010          	jra	L03
 461  0081               L42:
 462  0081 ae004d        	ldw	x,#77
 463  0084 89            	pushw	x
 464  0085 ae0000        	ldw	x,#0
 465  0088 89            	pushw	x
 466  0089 ae0000        	ldw	x,#L102
 467  008c cd0000        	call	_assert_failed
 469  008f 5b04          	addw	sp,#4
 470  0091               L03:
 471                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 473  0091 0d07          	tnz	(OFST+6,sp)
 474  0093 2706          	jreq	L43
 475  0095 7b07          	ld	a,(OFST+6,sp)
 476  0097 a102          	cp	a,#2
 477  0099 2603          	jrne	L23
 478  009b               L43:
 479  009b 4f            	clr	a
 480  009c 2010          	jra	L63
 481  009e               L23:
 482  009e ae004e        	ldw	x,#78
 483  00a1 89            	pushw	x
 484  00a2 ae0000        	ldw	x,#0
 485  00a5 89            	pushw	x
 486  00a6 ae0000        	ldw	x,#L102
 487  00a9 cd0000        	call	_assert_failed
 489  00ac 5b04          	addw	sp,#4
 490  00ae               L63:
 491                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 493  00ae 0d08          	tnz	(OFST+7,sp)
 494  00b0 2706          	jreq	L24
 495  00b2 7b08          	ld	a,(OFST+7,sp)
 496  00b4 a101          	cp	a,#1
 497  00b6 2603          	jrne	L04
 498  00b8               L24:
 499  00b8 4f            	clr	a
 500  00b9 2010          	jra	L44
 501  00bb               L04:
 502  00bb ae004f        	ldw	x,#79
 503  00be 89            	pushw	x
 504  00bf ae0000        	ldw	x,#0
 505  00c2 89            	pushw	x
 506  00c3 ae0000        	ldw	x,#L102
 507  00c6 cd0000        	call	_assert_failed
 509  00c9 5b04          	addw	sp,#4
 510  00cb               L44:
 511                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 513  00cb 0d09          	tnz	(OFST+8,sp)
 514  00cd 2712          	jreq	L05
 515  00cf 7b09          	ld	a,(OFST+8,sp)
 516  00d1 a104          	cp	a,#4
 517  00d3 270c          	jreq	L05
 518  00d5 7b09          	ld	a,(OFST+8,sp)
 519  00d7 a180          	cp	a,#128
 520  00d9 2706          	jreq	L05
 521  00db 7b09          	ld	a,(OFST+8,sp)
 522  00dd a1c0          	cp	a,#192
 523  00df 2603          	jrne	L64
 524  00e1               L05:
 525  00e1 4f            	clr	a
 526  00e2 2010          	jra	L25
 527  00e4               L64:
 528  00e4 ae0050        	ldw	x,#80
 529  00e7 89            	pushw	x
 530  00e8 ae0000        	ldw	x,#0
 531  00eb 89            	pushw	x
 532  00ec ae0000        	ldw	x,#L102
 533  00ef cd0000        	call	_assert_failed
 535  00f2 5b04          	addw	sp,#4
 536  00f4               L25:
 537                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 539  00f4 7b0a          	ld	a,(OFST+9,sp)
 540  00f6 a102          	cp	a,#2
 541  00f8 2704          	jreq	L65
 542  00fa 0d0a          	tnz	(OFST+9,sp)
 543  00fc 2603          	jrne	L45
 544  00fe               L65:
 545  00fe 4f            	clr	a
 546  00ff 2010          	jra	L06
 547  0101               L45:
 548  0101 ae0051        	ldw	x,#81
 549  0104 89            	pushw	x
 550  0105 ae0000        	ldw	x,#0
 551  0108 89            	pushw	x
 552  0109 ae0000        	ldw	x,#L102
 553  010c cd0000        	call	_assert_failed
 555  010f 5b04          	addw	sp,#4
 556  0111               L06:
 557                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 559  0111 0d0b          	tnz	(OFST+10,sp)
 560  0113 2703          	jreq	L26
 561  0115 4f            	clr	a
 562  0116 2010          	jra	L46
 563  0118               L26:
 564  0118 ae0052        	ldw	x,#82
 565  011b 89            	pushw	x
 566  011c ae0000        	ldw	x,#0
 567  011f 89            	pushw	x
 568  0120 ae0000        	ldw	x,#L102
 569  0123 cd0000        	call	_assert_failed
 571  0126 5b04          	addw	sp,#4
 572  0128               L46:
 573                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 573                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 575  0128 7b07          	ld	a,(OFST+6,sp)
 576  012a 1a08          	or	a,(OFST+7,sp)
 577  012c 6b01          	ld	(OFST+0,sp),a
 578  012e 7b02          	ld	a,(OFST+1,sp)
 579  0130 1a03          	or	a,(OFST+2,sp)
 580  0132 1a01          	or	a,(OFST+0,sp)
 581  0134 c75200        	ld	20992,a
 582                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 584  0137 7b09          	ld	a,(OFST+8,sp)
 585  0139 1a0a          	or	a,(OFST+9,sp)
 586  013b c75201        	ld	20993,a
 587                     ; 91     if (Mode == SPI_MODE_MASTER)
 589  013e 7b06          	ld	a,(OFST+5,sp)
 590  0140 a104          	cp	a,#4
 591  0142 2606          	jrne	L302
 592                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 594  0144 72105201      	bset	20993,#0
 596  0148 2004          	jra	L502
 597  014a               L302:
 598                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 600  014a 72115201      	bres	20993,#0
 601  014e               L502:
 602                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 604  014e c65200        	ld	a,20992
 605  0151 1a06          	or	a,(OFST+5,sp)
 606  0153 c75200        	ld	20992,a
 607                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 609  0156 7b0b          	ld	a,(OFST+10,sp)
 610  0158 c75205        	ld	20997,a
 611                     ; 105 }
 614  015b 5b03          	addw	sp,#3
 615  015d 81            	ret
 671                     ; 113 void SPI_Cmd(FunctionalState NewState)
 671                     ; 114 {
 672                     	switch	.text
 673  015e               _SPI_Cmd:
 675  015e 88            	push	a
 676       00000000      OFST:	set	0
 679                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 681  015f 4d            	tnz	a
 682  0160 2704          	jreq	L27
 683  0162 a101          	cp	a,#1
 684  0164 2603          	jrne	L07
 685  0166               L27:
 686  0166 4f            	clr	a
 687  0167 2010          	jra	L47
 688  0169               L07:
 689  0169 ae0074        	ldw	x,#116
 690  016c 89            	pushw	x
 691  016d ae0000        	ldw	x,#0
 692  0170 89            	pushw	x
 693  0171 ae0000        	ldw	x,#L102
 694  0174 cd0000        	call	_assert_failed
 696  0177 5b04          	addw	sp,#4
 697  0179               L47:
 698                     ; 118     if (NewState != DISABLE)
 700  0179 0d01          	tnz	(OFST+1,sp)
 701  017b 2706          	jreq	L532
 702                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 704  017d 721c5200      	bset	20992,#6
 706  0181 2004          	jra	L732
 707  0183               L532:
 708                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 710  0183 721d5200      	bres	20992,#6
 711  0187               L732:
 712                     ; 126 }
 715  0187 84            	pop	a
 716  0188 81            	ret
 824                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 824                     ; 136 {
 825                     	switch	.text
 826  0189               _SPI_ITConfig:
 828  0189 89            	pushw	x
 829  018a 88            	push	a
 830       00000001      OFST:	set	1
 833                     ; 137     uint8_t itpos = 0;
 835                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 837  018b 9e            	ld	a,xh
 838  018c a117          	cp	a,#23
 839  018e 270f          	jreq	L201
 840  0190 9e            	ld	a,xh
 841  0191 a106          	cp	a,#6
 842  0193 270a          	jreq	L201
 843  0195 9e            	ld	a,xh
 844  0196 a105          	cp	a,#5
 845  0198 2705          	jreq	L201
 846  019a 9e            	ld	a,xh
 847  019b a134          	cp	a,#52
 848  019d 2603          	jrne	L001
 849  019f               L201:
 850  019f 4f            	clr	a
 851  01a0 2010          	jra	L401
 852  01a2               L001:
 853  01a2 ae008b        	ldw	x,#139
 854  01a5 89            	pushw	x
 855  01a6 ae0000        	ldw	x,#0
 856  01a9 89            	pushw	x
 857  01aa ae0000        	ldw	x,#L102
 858  01ad cd0000        	call	_assert_failed
 860  01b0 5b04          	addw	sp,#4
 861  01b2               L401:
 862                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 864  01b2 0d03          	tnz	(OFST+2,sp)
 865  01b4 2706          	jreq	L011
 866  01b6 7b03          	ld	a,(OFST+2,sp)
 867  01b8 a101          	cp	a,#1
 868  01ba 2603          	jrne	L601
 869  01bc               L011:
 870  01bc 4f            	clr	a
 871  01bd 2010          	jra	L211
 872  01bf               L601:
 873  01bf ae008c        	ldw	x,#140
 874  01c2 89            	pushw	x
 875  01c3 ae0000        	ldw	x,#0
 876  01c6 89            	pushw	x
 877  01c7 ae0000        	ldw	x,#L102
 878  01ca cd0000        	call	_assert_failed
 880  01cd 5b04          	addw	sp,#4
 881  01cf               L211:
 882                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 884  01cf 7b02          	ld	a,(OFST+1,sp)
 885  01d1 a40f          	and	a,#15
 886  01d3 5f            	clrw	x
 887  01d4 97            	ld	xl,a
 888  01d5 a601          	ld	a,#1
 889  01d7 5d            	tnzw	x
 890  01d8 2704          	jreq	L411
 891  01da               L611:
 892  01da 48            	sll	a
 893  01db 5a            	decw	x
 894  01dc 26fc          	jrne	L611
 895  01de               L411:
 896  01de 6b01          	ld	(OFST+0,sp),a
 897                     ; 145     if (NewState != DISABLE)
 899  01e0 0d03          	tnz	(OFST+2,sp)
 900  01e2 270a          	jreq	L703
 901                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 903  01e4 c65202        	ld	a,20994
 904  01e7 1a01          	or	a,(OFST+0,sp)
 905  01e9 c75202        	ld	20994,a
 907  01ec 2009          	jra	L113
 908  01ee               L703:
 909                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 911  01ee 7b01          	ld	a,(OFST+0,sp)
 912  01f0 43            	cpl	a
 913  01f1 c45202        	and	a,20994
 914  01f4 c75202        	ld	20994,a
 915  01f7               L113:
 916                     ; 153 }
 919  01f7 5b03          	addw	sp,#3
 920  01f9 81            	ret
 952                     ; 159 void SPI_SendData(uint8_t Data)
 952                     ; 160 {
 953                     	switch	.text
 954  01fa               _SPI_SendData:
 958                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 960  01fa c75204        	ld	20996,a
 961                     ; 162 }
 964  01fd 81            	ret
 987                     ; 169 uint8_t SPI_ReceiveData(void)
 987                     ; 170 {
 988                     	switch	.text
 989  01fe               _SPI_ReceiveData:
 993                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 995  01fe c65204        	ld	a,20996
 998  0201 81            	ret
1035                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
1035                     ; 181 {
1036                     	switch	.text
1037  0202               _SPI_NSSInternalSoftwareCmd:
1039  0202 88            	push	a
1040       00000000      OFST:	set	0
1043                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1045  0203 4d            	tnz	a
1046  0204 2704          	jreq	L031
1047  0206 a101          	cp	a,#1
1048  0208 2603          	jrne	L621
1049  020a               L031:
1050  020a 4f            	clr	a
1051  020b 2010          	jra	L231
1052  020d               L621:
1053  020d ae00b7        	ldw	x,#183
1054  0210 89            	pushw	x
1055  0211 ae0000        	ldw	x,#0
1056  0214 89            	pushw	x
1057  0215 ae0000        	ldw	x,#L102
1058  0218 cd0000        	call	_assert_failed
1060  021b 5b04          	addw	sp,#4
1061  021d               L231:
1062                     ; 185     if (NewState != DISABLE)
1064  021d 0d01          	tnz	(OFST+1,sp)
1065  021f 2706          	jreq	L553
1066                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1068  0221 72105201      	bset	20993,#0
1070  0225 2004          	jra	L753
1071  0227               L553:
1072                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1074  0227 72115201      	bres	20993,#0
1075  022b               L753:
1076                     ; 193 }
1079  022b 84            	pop	a
1080  022c 81            	ret
1103                     ; 200 void SPI_TransmitCRC(void)
1103                     ; 201 {
1104                     	switch	.text
1105  022d               _SPI_TransmitCRC:
1109                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1111  022d 72185201      	bset	20993,#4
1112                     ; 203 }
1115  0231 81            	ret
1152                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
1152                     ; 212 {
1153                     	switch	.text
1154  0232               _SPI_CalculateCRCCmd:
1156  0232 88            	push	a
1157       00000000      OFST:	set	0
1160                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1162  0233 4d            	tnz	a
1163  0234 2704          	jreq	L241
1164  0236 a101          	cp	a,#1
1165  0238 2603          	jrne	L041
1166  023a               L241:
1167  023a 4f            	clr	a
1168  023b 2010          	jra	L441
1169  023d               L041:
1170  023d ae00d6        	ldw	x,#214
1171  0240 89            	pushw	x
1172  0241 ae0000        	ldw	x,#0
1173  0244 89            	pushw	x
1174  0245 ae0000        	ldw	x,#L102
1175  0248 cd0000        	call	_assert_failed
1177  024b 5b04          	addw	sp,#4
1178  024d               L441:
1179                     ; 216     if (NewState != DISABLE)
1181  024d 0d01          	tnz	(OFST+1,sp)
1182  024f 2706          	jreq	L704
1183                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1185  0251 721a5201      	bset	20993,#5
1187  0255 2004          	jra	L114
1188  0257               L704:
1189                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1191  0257 721b5201      	bres	20993,#5
1192  025b               L114:
1193                     ; 224 }
1196  025b 84            	pop	a
1197  025c 81            	ret
1260                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
1260                     ; 232 {
1261                     	switch	.text
1262  025d               _SPI_GetCRC:
1264  025d 88            	push	a
1265  025e 88            	push	a
1266       00000001      OFST:	set	1
1269                     ; 233     uint8_t crcreg = 0;
1271                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1273  025f a101          	cp	a,#1
1274  0261 2703          	jreq	L251
1275  0263 4d            	tnz	a
1276  0264 2603          	jrne	L051
1277  0266               L251:
1278  0266 4f            	clr	a
1279  0267 2010          	jra	L451
1280  0269               L051:
1281  0269 ae00ec        	ldw	x,#236
1282  026c 89            	pushw	x
1283  026d ae0000        	ldw	x,#0
1284  0270 89            	pushw	x
1285  0271 ae0000        	ldw	x,#L102
1286  0274 cd0000        	call	_assert_failed
1288  0277 5b04          	addw	sp,#4
1289  0279               L451:
1290                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1292  0279 0d02          	tnz	(OFST+1,sp)
1293  027b 2707          	jreq	L344
1294                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1296  027d c65207        	ld	a,20999
1297  0280 6b01          	ld	(OFST+0,sp),a
1299  0282 2005          	jra	L544
1300  0284               L344:
1301                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1303  0284 c65206        	ld	a,20998
1304  0287 6b01          	ld	(OFST+0,sp),a
1305  0289               L544:
1306                     ; 248     return crcreg;
1308  0289 7b01          	ld	a,(OFST+0,sp)
1311  028b 85            	popw	x
1312  028c 81            	ret
1337                     ; 256 void SPI_ResetCRC(void)
1337                     ; 257 {
1338                     	switch	.text
1339  028d               _SPI_ResetCRC:
1343                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1345  028d a601          	ld	a,#1
1346  028f ada1          	call	_SPI_CalculateCRCCmd
1348                     ; 263     SPI_Cmd(ENABLE);
1350  0291 a601          	ld	a,#1
1351  0293 cd015e        	call	_SPI_Cmd
1353                     ; 264 }
1356  0296 81            	ret
1380                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1380                     ; 272 {
1381                     	switch	.text
1382  0297               _SPI_GetCRCPolynomial:
1386                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1388  0297 c65205        	ld	a,20997
1391  029a 81            	ret
1448                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1448                     ; 282 {
1449                     	switch	.text
1450  029b               _SPI_BiDirectionalLineConfig:
1452  029b 88            	push	a
1453       00000000      OFST:	set	0
1456                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1458  029c 4d            	tnz	a
1459  029d 2704          	jreq	L661
1460  029f a101          	cp	a,#1
1461  02a1 2603          	jrne	L461
1462  02a3               L661:
1463  02a3 4f            	clr	a
1464  02a4 2010          	jra	L071
1465  02a6               L461:
1466  02a6 ae011c        	ldw	x,#284
1467  02a9 89            	pushw	x
1468  02aa ae0000        	ldw	x,#0
1469  02ad 89            	pushw	x
1470  02ae ae0000        	ldw	x,#L102
1471  02b1 cd0000        	call	_assert_failed
1473  02b4 5b04          	addw	sp,#4
1474  02b6               L071:
1475                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1477  02b6 0d01          	tnz	(OFST+1,sp)
1478  02b8 2706          	jreq	L515
1479                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1481  02ba 721c5201      	bset	20993,#6
1483  02be 2004          	jra	L715
1484  02c0               L515:
1485                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1487  02c0 721d5201      	bres	20993,#6
1488  02c4               L715:
1489                     ; 294 }
1492  02c4 84            	pop	a
1493  02c5 81            	ret
1615                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1615                     ; 305 {
1616                     	switch	.text
1617  02c6               _SPI_GetFlagStatus:
1619  02c6 88            	push	a
1620  02c7 88            	push	a
1621       00000001      OFST:	set	1
1624                     ; 306     FlagStatus status = RESET;
1626                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1628  02c8 a140          	cp	a,#64
1629  02ca 2718          	jreq	L671
1630  02cc a120          	cp	a,#32
1631  02ce 2714          	jreq	L671
1632  02d0 a110          	cp	a,#16
1633  02d2 2710          	jreq	L671
1634  02d4 a108          	cp	a,#8
1635  02d6 270c          	jreq	L671
1636  02d8 a102          	cp	a,#2
1637  02da 2708          	jreq	L671
1638  02dc a101          	cp	a,#1
1639  02de 2704          	jreq	L671
1640  02e0 a180          	cp	a,#128
1641  02e2 2603          	jrne	L471
1642  02e4               L671:
1643  02e4 4f            	clr	a
1644  02e5 2010          	jra	L002
1645  02e7               L471:
1646  02e7 ae0134        	ldw	x,#308
1647  02ea 89            	pushw	x
1648  02eb ae0000        	ldw	x,#0
1649  02ee 89            	pushw	x
1650  02ef ae0000        	ldw	x,#L102
1651  02f2 cd0000        	call	_assert_failed
1653  02f5 5b04          	addw	sp,#4
1654  02f7               L002:
1655                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1657  02f7 c65203        	ld	a,20995
1658  02fa 1502          	bcp	a,(OFST+1,sp)
1659  02fc 2706          	jreq	L575
1660                     ; 313         status = SET; /* SPI_FLAG is set */
1662  02fe a601          	ld	a,#1
1663  0300 6b01          	ld	(OFST+0,sp),a
1665  0302 2002          	jra	L775
1666  0304               L575:
1667                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1669  0304 0f01          	clr	(OFST+0,sp)
1670  0306               L775:
1671                     ; 321     return status;
1673  0306 7b01          	ld	a,(OFST+0,sp)
1676  0308 85            	popw	x
1677  0309 81            	ret
1713                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1713                     ; 340 {
1714                     	switch	.text
1715  030a               _SPI_ClearFlag:
1717  030a 88            	push	a
1718       00000000      OFST:	set	0
1721                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1723  030b a110          	cp	a,#16
1724  030d 2704          	jreq	L602
1725  030f a108          	cp	a,#8
1726  0311 2603          	jrne	L402
1727  0313               L602:
1728  0313 4f            	clr	a
1729  0314 2010          	jra	L012
1730  0316               L402:
1731  0316 ae0155        	ldw	x,#341
1732  0319 89            	pushw	x
1733  031a ae0000        	ldw	x,#0
1734  031d 89            	pushw	x
1735  031e ae0000        	ldw	x,#L102
1736  0321 cd0000        	call	_assert_failed
1738  0324 5b04          	addw	sp,#4
1739  0326               L012:
1740                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1742  0326 7b01          	ld	a,(OFST+1,sp)
1743  0328 43            	cpl	a
1744  0329 c75203        	ld	20995,a
1745                     ; 344 }
1748  032c 84            	pop	a
1749  032d 81            	ret
1824                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1824                     ; 360 {
1825                     	switch	.text
1826  032e               _SPI_GetITStatus:
1828  032e 88            	push	a
1829  032f 89            	pushw	x
1830       00000002      OFST:	set	2
1833                     ; 361     ITStatus pendingbitstatus = RESET;
1835                     ; 362     uint8_t itpos = 0;
1837                     ; 363     uint8_t itmask1 = 0;
1839                     ; 364     uint8_t itmask2 = 0;
1841                     ; 365     uint8_t enablestatus = 0;
1843                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1845  0330 a165          	cp	a,#101
1846  0332 2714          	jreq	L612
1847  0334 a155          	cp	a,#85
1848  0336 2710          	jreq	L612
1849  0338 a145          	cp	a,#69
1850  033a 270c          	jreq	L612
1851  033c a134          	cp	a,#52
1852  033e 2708          	jreq	L612
1853  0340 a117          	cp	a,#23
1854  0342 2704          	jreq	L612
1855  0344 a106          	cp	a,#6
1856  0346 2603          	jrne	L412
1857  0348               L612:
1858  0348 4f            	clr	a
1859  0349 2010          	jra	L022
1860  034b               L412:
1861  034b ae016e        	ldw	x,#366
1862  034e 89            	pushw	x
1863  034f ae0000        	ldw	x,#0
1864  0352 89            	pushw	x
1865  0353 ae0000        	ldw	x,#L102
1866  0356 cd0000        	call	_assert_failed
1868  0359 5b04          	addw	sp,#4
1869  035b               L022:
1870                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1872  035b 7b03          	ld	a,(OFST+1,sp)
1873  035d a40f          	and	a,#15
1874  035f 5f            	clrw	x
1875  0360 97            	ld	xl,a
1876  0361 a601          	ld	a,#1
1877  0363 5d            	tnzw	x
1878  0364 2704          	jreq	L222
1879  0366               L422:
1880  0366 48            	sll	a
1881  0367 5a            	decw	x
1882  0368 26fc          	jrne	L422
1883  036a               L222:
1884  036a 6b01          	ld	(OFST-1,sp),a
1885                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1887  036c 7b03          	ld	a,(OFST+1,sp)
1888  036e 4e            	swap	a
1889  036f a40f          	and	a,#15
1890  0371 6b02          	ld	(OFST+0,sp),a
1891                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1893  0373 7b02          	ld	a,(OFST+0,sp)
1894  0375 5f            	clrw	x
1895  0376 97            	ld	xl,a
1896  0377 a601          	ld	a,#1
1897  0379 5d            	tnzw	x
1898  037a 2704          	jreq	L622
1899  037c               L032:
1900  037c 48            	sll	a
1901  037d 5a            	decw	x
1902  037e 26fc          	jrne	L032
1903  0380               L622:
1904  0380 6b02          	ld	(OFST+0,sp),a
1905                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1907  0382 c65203        	ld	a,20995
1908  0385 1402          	and	a,(OFST+0,sp)
1909  0387 6b02          	ld	(OFST+0,sp),a
1910                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1912  0389 c65202        	ld	a,20994
1913  038c 1501          	bcp	a,(OFST-1,sp)
1914  038e 270a          	jreq	L156
1916  0390 0d02          	tnz	(OFST+0,sp)
1917  0392 2706          	jreq	L156
1918                     ; 380         pendingbitstatus = SET;
1920  0394 a601          	ld	a,#1
1921  0396 6b02          	ld	(OFST+0,sp),a
1923  0398 2002          	jra	L356
1924  039a               L156:
1925                     ; 385         pendingbitstatus = RESET;
1927  039a 0f02          	clr	(OFST+0,sp)
1928  039c               L356:
1929                     ; 388     return  pendingbitstatus;
1931  039c 7b02          	ld	a,(OFST+0,sp)
1934  039e 5b03          	addw	sp,#3
1935  03a0 81            	ret
1979                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1979                     ; 405 {
1980                     	switch	.text
1981  03a1               _SPI_ClearITPendingBit:
1983  03a1 88            	push	a
1984  03a2 88            	push	a
1985       00000001      OFST:	set	1
1988                     ; 406     uint8_t itpos = 0;
1990                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1992  03a3 a145          	cp	a,#69
1993  03a5 2704          	jreq	L632
1994  03a7 a134          	cp	a,#52
1995  03a9 2603          	jrne	L432
1996  03ab               L632:
1997  03ab 4f            	clr	a
1998  03ac 2010          	jra	L042
1999  03ae               L432:
2000  03ae ae0197        	ldw	x,#407
2001  03b1 89            	pushw	x
2002  03b2 ae0000        	ldw	x,#0
2003  03b5 89            	pushw	x
2004  03b6 ae0000        	ldw	x,#L102
2005  03b9 cd0000        	call	_assert_failed
2007  03bc 5b04          	addw	sp,#4
2008  03be               L042:
2009                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2011  03be 7b02          	ld	a,(OFST+1,sp)
2012  03c0 a4f0          	and	a,#240
2013  03c2 4e            	swap	a
2014  03c3 a40f          	and	a,#15
2015  03c5 5f            	clrw	x
2016  03c6 97            	ld	xl,a
2017  03c7 a601          	ld	a,#1
2018  03c9 5d            	tnzw	x
2019  03ca 2704          	jreq	L242
2020  03cc               L442:
2021  03cc 48            	sll	a
2022  03cd 5a            	decw	x
2023  03ce 26fc          	jrne	L442
2024  03d0               L242:
2025  03d0 6b01          	ld	(OFST+0,sp),a
2026                     ; 414     SPI->SR = (uint8_t)(~itpos);
2028  03d2 7b01          	ld	a,(OFST+0,sp)
2029  03d4 43            	cpl	a
2030  03d5 c75203        	ld	20995,a
2031                     ; 416 }
2034  03d8 85            	popw	x
2035  03d9 81            	ret
2048                     	xdef	_SPI_ClearITPendingBit
2049                     	xdef	_SPI_GetITStatus
2050                     	xdef	_SPI_ClearFlag
2051                     	xdef	_SPI_GetFlagStatus
2052                     	xdef	_SPI_BiDirectionalLineConfig
2053                     	xdef	_SPI_GetCRCPolynomial
2054                     	xdef	_SPI_ResetCRC
2055                     	xdef	_SPI_GetCRC
2056                     	xdef	_SPI_CalculateCRCCmd
2057                     	xdef	_SPI_TransmitCRC
2058                     	xdef	_SPI_NSSInternalSoftwareCmd
2059                     	xdef	_SPI_ReceiveData
2060                     	xdef	_SPI_SendData
2061                     	xdef	_SPI_ITConfig
2062                     	xdef	_SPI_Cmd
2063                     	xdef	_SPI_Init
2064                     	xdef	_SPI_DeInit
2065                     	xref	_assert_failed
2066                     .const:	section	.text
2067  0000               L102:
2068  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_s"
2069  0012 70692e6300    	dc.b	"pi.c",0
2089                     	end

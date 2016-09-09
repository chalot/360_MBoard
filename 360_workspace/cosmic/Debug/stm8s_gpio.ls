   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
 109                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 48 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 118  0000 7f            	clr	(x)
 119                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 121  0001 6f02          	clr	(2,x)
 122                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 124  0003 6f03          	clr	(3,x)
 125                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 127  0005 6f04          	clr	(4,x)
 128                     ; 53 }
 131  0007 81            	ret
 372                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 372                     ; 66 {
 373                     	switch	.text
 374  0008               _GPIO_Init:
 376  0008 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 382  0009 0d06          	tnz	(OFST+6,sp)
 383  000b 2742          	jreq	L21
 384  000d 7b06          	ld	a,(OFST+6,sp)
 385  000f a140          	cp	a,#64
 386  0011 273c          	jreq	L21
 387  0013 7b06          	ld	a,(OFST+6,sp)
 388  0015 a120          	cp	a,#32
 389  0017 2736          	jreq	L21
 390  0019 7b06          	ld	a,(OFST+6,sp)
 391  001b a160          	cp	a,#96
 392  001d 2730          	jreq	L21
 393  001f 7b06          	ld	a,(OFST+6,sp)
 394  0021 a1a0          	cp	a,#160
 395  0023 272a          	jreq	L21
 396  0025 7b06          	ld	a,(OFST+6,sp)
 397  0027 a1e0          	cp	a,#224
 398  0029 2724          	jreq	L21
 399  002b 7b06          	ld	a,(OFST+6,sp)
 400  002d a180          	cp	a,#128
 401  002f 271e          	jreq	L21
 402  0031 7b06          	ld	a,(OFST+6,sp)
 403  0033 a1c0          	cp	a,#192
 404  0035 2718          	jreq	L21
 405  0037 7b06          	ld	a,(OFST+6,sp)
 406  0039 a1b0          	cp	a,#176
 407  003b 2712          	jreq	L21
 408  003d 7b06          	ld	a,(OFST+6,sp)
 409  003f a1f0          	cp	a,#240
 410  0041 270c          	jreq	L21
 411  0043 7b06          	ld	a,(OFST+6,sp)
 412  0045 a190          	cp	a,#144
 413  0047 2706          	jreq	L21
 414  0049 7b06          	ld	a,(OFST+6,sp)
 415  004b a1d0          	cp	a,#208
 416  004d 2603          	jrne	L01
 417  004f               L21:
 418  004f 4f            	clr	a
 419  0050 2010          	jra	L41
 420  0052               L01:
 421  0052 ae0047        	ldw	x,#71
 422  0055 89            	pushw	x
 423  0056 ae0000        	ldw	x,#0
 424  0059 89            	pushw	x
 425  005a ae0000        	ldw	x,#L771
 426  005d cd0000        	call	_assert_failed
 428  0060 5b04          	addw	sp,#4
 429  0062               L41:
 430                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 432  0062 0d05          	tnz	(OFST+5,sp)
 433  0064 2703          	jreq	L61
 434  0066 4f            	clr	a
 435  0067 2010          	jra	L02
 436  0069               L61:
 437  0069 ae0048        	ldw	x,#72
 438  006c 89            	pushw	x
 439  006d ae0000        	ldw	x,#0
 440  0070 89            	pushw	x
 441  0071 ae0000        	ldw	x,#L771
 442  0074 cd0000        	call	_assert_failed
 444  0077 5b04          	addw	sp,#4
 445  0079               L02:
 446                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 448  0079 1e01          	ldw	x,(OFST+1,sp)
 449  007b 7b05          	ld	a,(OFST+5,sp)
 450  007d 43            	cpl	a
 451  007e e404          	and	a,(4,x)
 452  0080 e704          	ld	(4,x),a
 453                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 455  0082 7b06          	ld	a,(OFST+6,sp)
 456  0084 a580          	bcp	a,#128
 457  0086 271f          	jreq	L102
 458                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 460  0088 7b06          	ld	a,(OFST+6,sp)
 461  008a a510          	bcp	a,#16
 462  008c 2708          	jreq	L302
 463                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 465  008e 1e01          	ldw	x,(OFST+1,sp)
 466  0090 f6            	ld	a,(x)
 467  0091 1a05          	or	a,(OFST+5,sp)
 468  0093 f7            	ld	(x),a
 470  0094 2007          	jra	L502
 471  0096               L302:
 472                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 474  0096 1e01          	ldw	x,(OFST+1,sp)
 475  0098 7b05          	ld	a,(OFST+5,sp)
 476  009a 43            	cpl	a
 477  009b f4            	and	a,(x)
 478  009c f7            	ld	(x),a
 479  009d               L502:
 480                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 482  009d 1e01          	ldw	x,(OFST+1,sp)
 483  009f e602          	ld	a,(2,x)
 484  00a1 1a05          	or	a,(OFST+5,sp)
 485  00a3 e702          	ld	(2,x),a
 487  00a5 2009          	jra	L702
 488  00a7               L102:
 489                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 491  00a7 1e01          	ldw	x,(OFST+1,sp)
 492  00a9 7b05          	ld	a,(OFST+5,sp)
 493  00ab 43            	cpl	a
 494  00ac e402          	and	a,(2,x)
 495  00ae e702          	ld	(2,x),a
 496  00b0               L702:
 497                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 499  00b0 7b06          	ld	a,(OFST+6,sp)
 500  00b2 a540          	bcp	a,#64
 501  00b4 270a          	jreq	L112
 502                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 504  00b6 1e01          	ldw	x,(OFST+1,sp)
 505  00b8 e603          	ld	a,(3,x)
 506  00ba 1a05          	or	a,(OFST+5,sp)
 507  00bc e703          	ld	(3,x),a
 509  00be 2009          	jra	L312
 510  00c0               L112:
 511                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 513  00c0 1e01          	ldw	x,(OFST+1,sp)
 514  00c2 7b05          	ld	a,(OFST+5,sp)
 515  00c4 43            	cpl	a
 516  00c5 e403          	and	a,(3,x)
 517  00c7 e703          	ld	(3,x),a
 518  00c9               L312:
 519                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 521  00c9 7b06          	ld	a,(OFST+6,sp)
 522  00cb a520          	bcp	a,#32
 523  00cd 270a          	jreq	L512
 524                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 526  00cf 1e01          	ldw	x,(OFST+1,sp)
 527  00d1 e604          	ld	a,(4,x)
 528  00d3 1a05          	or	a,(OFST+5,sp)
 529  00d5 e704          	ld	(4,x),a
 531  00d7 2009          	jra	L712
 532  00d9               L512:
 533                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 535  00d9 1e01          	ldw	x,(OFST+1,sp)
 536  00db 7b05          	ld	a,(OFST+5,sp)
 537  00dd 43            	cpl	a
 538  00de e404          	and	a,(4,x)
 539  00e0 e704          	ld	(4,x),a
 540  00e2               L712:
 541                     ; 125 }
 544  00e2 85            	popw	x
 545  00e3 81            	ret
 589                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 589                     ; 136 {
 590                     	switch	.text
 591  00e4               _GPIO_Write:
 593  00e4 89            	pushw	x
 594       00000000      OFST:	set	0
 597                     ; 137     GPIOx->ODR = PortVal;
 599  00e5 7b05          	ld	a,(OFST+5,sp)
 600  00e7 1e01          	ldw	x,(OFST+1,sp)
 601  00e9 f7            	ld	(x),a
 602                     ; 138 }
 605  00ea 85            	popw	x
 606  00eb 81            	ret
 653                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 653                     ; 149 {
 654                     	switch	.text
 655  00ec               _GPIO_WriteHigh:
 657  00ec 89            	pushw	x
 658       00000000      OFST:	set	0
 661                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 663  00ed f6            	ld	a,(x)
 664  00ee 1a05          	or	a,(OFST+5,sp)
 665  00f0 f7            	ld	(x),a
 666                     ; 151 }
 669  00f1 85            	popw	x
 670  00f2 81            	ret
 717                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 717                     ; 162 {
 718                     	switch	.text
 719  00f3               _GPIO_WriteLow:
 721  00f3 89            	pushw	x
 722       00000000      OFST:	set	0
 725                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 727  00f4 7b05          	ld	a,(OFST+5,sp)
 728  00f6 43            	cpl	a
 729  00f7 f4            	and	a,(x)
 730  00f8 f7            	ld	(x),a
 731                     ; 164 }
 734  00f9 85            	popw	x
 735  00fa 81            	ret
 782                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 782                     ; 175 {
 783                     	switch	.text
 784  00fb               _GPIO_WriteReverse:
 786  00fb 89            	pushw	x
 787       00000000      OFST:	set	0
 790                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 792  00fc f6            	ld	a,(x)
 793  00fd 1805          	xor	a,	(OFST+5,sp)
 794  00ff f7            	ld	(x),a
 795                     ; 177 }
 798  0100 85            	popw	x
 799  0101 81            	ret
 837                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 837                     ; 186 {
 838                     	switch	.text
 839  0102               _GPIO_ReadOutputData:
 843                     ; 187     return ((uint8_t)GPIOx->ODR);
 845  0102 f6            	ld	a,(x)
 848  0103 81            	ret
 885                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 885                     ; 197 {
 886                     	switch	.text
 887  0104               _GPIO_ReadInputData:
 891                     ; 198     return ((uint8_t)GPIOx->IDR);
 893  0104 e601          	ld	a,(1,x)
 896  0106 81            	ret
 964                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 964                     ; 208 {
 965                     	switch	.text
 966  0107               _GPIO_ReadInputPin:
 968  0107 89            	pushw	x
 969       00000000      OFST:	set	0
 972                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 974  0108 e601          	ld	a,(1,x)
 975  010a 1405          	and	a,(OFST+5,sp)
 978  010c 85            	popw	x
 979  010d 81            	ret
1058                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1058                     ; 220 {
1059                     	switch	.text
1060  010e               _GPIO_ExternalPullUpConfig:
1062  010e 89            	pushw	x
1063       00000000      OFST:	set	0
1066                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1068  010f 0d05          	tnz	(OFST+5,sp)
1069  0111 2703          	jreq	L24
1070  0113 4f            	clr	a
1071  0114 2010          	jra	L44
1072  0116               L24:
1073  0116 ae00de        	ldw	x,#222
1074  0119 89            	pushw	x
1075  011a ae0000        	ldw	x,#0
1076  011d 89            	pushw	x
1077  011e ae0000        	ldw	x,#L771
1078  0121 cd0000        	call	_assert_failed
1080  0124 5b04          	addw	sp,#4
1081  0126               L44:
1082                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1084  0126 0d06          	tnz	(OFST+6,sp)
1085  0128 2706          	jreq	L05
1086  012a 7b06          	ld	a,(OFST+6,sp)
1087  012c a101          	cp	a,#1
1088  012e 2603          	jrne	L64
1089  0130               L05:
1090  0130 4f            	clr	a
1091  0131 2010          	jra	L25
1092  0133               L64:
1093  0133 ae00df        	ldw	x,#223
1094  0136 89            	pushw	x
1095  0137 ae0000        	ldw	x,#0
1096  013a 89            	pushw	x
1097  013b ae0000        	ldw	x,#L771
1098  013e cd0000        	call	_assert_failed
1100  0141 5b04          	addw	sp,#4
1101  0143               L25:
1102                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1104  0143 0d06          	tnz	(OFST+6,sp)
1105  0145 270a          	jreq	L374
1106                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1108  0147 1e01          	ldw	x,(OFST+1,sp)
1109  0149 e603          	ld	a,(3,x)
1110  014b 1a05          	or	a,(OFST+5,sp)
1111  014d e703          	ld	(3,x),a
1113  014f 2009          	jra	L574
1114  0151               L374:
1115                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1117  0151 1e01          	ldw	x,(OFST+1,sp)
1118  0153 7b05          	ld	a,(OFST+5,sp)
1119  0155 43            	cpl	a
1120  0156 e403          	and	a,(3,x)
1121  0158 e703          	ld	(3,x),a
1122  015a               L574:
1123                     ; 232 }
1126  015a 85            	popw	x
1127  015b 81            	ret
1140                     	xdef	_GPIO_ExternalPullUpConfig
1141                     	xdef	_GPIO_ReadInputPin
1142                     	xdef	_GPIO_ReadOutputData
1143                     	xdef	_GPIO_ReadInputData
1144                     	xdef	_GPIO_WriteReverse
1145                     	xdef	_GPIO_WriteLow
1146                     	xdef	_GPIO_WriteHigh
1147                     	xdef	_GPIO_Write
1148                     	xdef	_GPIO_Init
1149                     	xdef	_GPIO_DeInit
1150                     	xref	_assert_failed
1151                     .const:	section	.text
1152  0000               L771:
1153  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_g"
1154  0012 70696f2e6300  	dc.b	"pio.c",0
1174                     	end

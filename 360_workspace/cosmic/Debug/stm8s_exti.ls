   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 47 void EXTI_DeInit(void)
  43                     ; 48 {
  45                     	switch	.text
  46  0000               _EXTI_DeInit:
  50                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 51 }
  59  0008 81            	ret
 185                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 185                     ; 65 {
 186                     	switch	.text
 187  0009               _EXTI_SetExtIntSensitivity:
 189  0009 89            	pushw	x
 190       00000000      OFST:	set	0
 193                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 195  000a 9e            	ld	a,xh
 196  000b 4d            	tnz	a
 197  000c 2714          	jreq	L21
 198  000e 9e            	ld	a,xh
 199  000f a101          	cp	a,#1
 200  0011 270f          	jreq	L21
 201  0013 9e            	ld	a,xh
 202  0014 a102          	cp	a,#2
 203  0016 270a          	jreq	L21
 204  0018 9e            	ld	a,xh
 205  0019 a103          	cp	a,#3
 206  001b 2705          	jreq	L21
 207  001d 9e            	ld	a,xh
 208  001e a104          	cp	a,#4
 209  0020 2603          	jrne	L01
 210  0022               L21:
 211  0022 4f            	clr	a
 212  0023 2010          	jra	L41
 213  0025               L01:
 214  0025 ae0044        	ldw	x,#68
 215  0028 89            	pushw	x
 216  0029 ae0000        	ldw	x,#0
 217  002c 89            	pushw	x
 218  002d ae0000        	ldw	x,#L111
 219  0030 cd0000        	call	_assert_failed
 221  0033 5b04          	addw	sp,#4
 222  0035               L41:
 223                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 225  0035 0d02          	tnz	(OFST+2,sp)
 226  0037 2712          	jreq	L02
 227  0039 7b02          	ld	a,(OFST+2,sp)
 228  003b a101          	cp	a,#1
 229  003d 270c          	jreq	L02
 230  003f 7b02          	ld	a,(OFST+2,sp)
 231  0041 a102          	cp	a,#2
 232  0043 2706          	jreq	L02
 233  0045 7b02          	ld	a,(OFST+2,sp)
 234  0047 a103          	cp	a,#3
 235  0049 2603          	jrne	L61
 236  004b               L02:
 237  004b 4f            	clr	a
 238  004c 2010          	jra	L22
 239  004e               L61:
 240  004e ae0045        	ldw	x,#69
 241  0051 89            	pushw	x
 242  0052 ae0000        	ldw	x,#0
 243  0055 89            	pushw	x
 244  0056 ae0000        	ldw	x,#L111
 245  0059 cd0000        	call	_assert_failed
 247  005c 5b04          	addw	sp,#4
 248  005e               L22:
 249                     ; 72     switch (Port)
 251  005e 7b01          	ld	a,(OFST+1,sp)
 253                     ; 94     default:
 253                     ; 95         break;
 254  0060 4d            	tnz	a
 255  0061 270e          	jreq	L12
 256  0063 4a            	dec	a
 257  0064 271d          	jreq	L32
 258  0066 4a            	dec	a
 259  0067 272e          	jreq	L52
 260  0069 4a            	dec	a
 261  006a 2742          	jreq	L72
 262  006c 4a            	dec	a
 263  006d 2756          	jreq	L13
 264  006f 2064          	jra	L511
 265  0071               L12:
 266                     ; 74     case EXTI_PORT_GPIOA:
 266                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 268  0071 c650a0        	ld	a,20640
 269  0074 a4fc          	and	a,#252
 270  0076 c750a0        	ld	20640,a
 271                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 273  0079 c650a0        	ld	a,20640
 274  007c 1a02          	or	a,(OFST+2,sp)
 275  007e c750a0        	ld	20640,a
 276                     ; 77         break;
 278  0081 2052          	jra	L511
 279  0083               L32:
 280                     ; 78     case EXTI_PORT_GPIOB:
 280                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 282  0083 c650a0        	ld	a,20640
 283  0086 a4f3          	and	a,#243
 284  0088 c750a0        	ld	20640,a
 285                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 287  008b 7b02          	ld	a,(OFST+2,sp)
 288  008d 48            	sll	a
 289  008e 48            	sll	a
 290  008f ca50a0        	or	a,20640
 291  0092 c750a0        	ld	20640,a
 292                     ; 81         break;
 294  0095 203e          	jra	L511
 295  0097               L52:
 296                     ; 82     case EXTI_PORT_GPIOC:
 296                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 298  0097 c650a0        	ld	a,20640
 299  009a a4cf          	and	a,#207
 300  009c c750a0        	ld	20640,a
 301                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 303  009f 7b02          	ld	a,(OFST+2,sp)
 304  00a1 97            	ld	xl,a
 305  00a2 a610          	ld	a,#16
 306  00a4 42            	mul	x,a
 307  00a5 9f            	ld	a,xl
 308  00a6 ca50a0        	or	a,20640
 309  00a9 c750a0        	ld	20640,a
 310                     ; 85         break;
 312  00ac 2027          	jra	L511
 313  00ae               L72:
 314                     ; 86     case EXTI_PORT_GPIOD:
 314                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 316  00ae c650a0        	ld	a,20640
 317  00b1 a43f          	and	a,#63
 318  00b3 c750a0        	ld	20640,a
 319                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 321  00b6 7b02          	ld	a,(OFST+2,sp)
 322  00b8 97            	ld	xl,a
 323  00b9 a640          	ld	a,#64
 324  00bb 42            	mul	x,a
 325  00bc 9f            	ld	a,xl
 326  00bd ca50a0        	or	a,20640
 327  00c0 c750a0        	ld	20640,a
 328                     ; 89         break;
 330  00c3 2010          	jra	L511
 331  00c5               L13:
 332                     ; 90     case EXTI_PORT_GPIOE:
 332                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 334  00c5 c650a1        	ld	a,20641
 335  00c8 a4fc          	and	a,#252
 336  00ca c750a1        	ld	20641,a
 337                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 339  00cd c650a1        	ld	a,20641
 340  00d0 1a02          	or	a,(OFST+2,sp)
 341  00d2 c750a1        	ld	20641,a
 342                     ; 93         break;
 344  00d5               L33:
 345                     ; 94     default:
 345                     ; 95         break;
 347  00d5               L511:
 348                     ; 97 }
 351  00d5 85            	popw	x
 352  00d6 81            	ret
 411                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 411                     ; 107 {
 412                     	switch	.text
 413  00d7               _EXTI_SetTLISensitivity:
 415  00d7 88            	push	a
 416       00000000      OFST:	set	0
 419                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 421  00d8 4d            	tnz	a
 422  00d9 2704          	jreq	L03
 423  00db a104          	cp	a,#4
 424  00dd 2603          	jrne	L62
 425  00df               L03:
 426  00df 4f            	clr	a
 427  00e0 2010          	jra	L23
 428  00e2               L62:
 429  00e2 ae006d        	ldw	x,#109
 430  00e5 89            	pushw	x
 431  00e6 ae0000        	ldw	x,#0
 432  00e9 89            	pushw	x
 433  00ea ae0000        	ldw	x,#L111
 434  00ed cd0000        	call	_assert_failed
 436  00f0 5b04          	addw	sp,#4
 437  00f2               L23:
 438                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 440  00f2 721550a1      	bres	20641,#2
 441                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 443  00f6 c650a1        	ld	a,20641
 444  00f9 1a01          	or	a,(OFST+1,sp)
 445  00fb c750a1        	ld	20641,a
 446                     ; 114 }
 449  00fe 84            	pop	a
 450  00ff 81            	ret
 495                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 495                     ; 122 {
 496                     	switch	.text
 497  0100               _EXTI_GetExtIntSensitivity:
 499  0100 88            	push	a
 500  0101 88            	push	a
 501       00000001      OFST:	set	1
 504                     ; 123     uint8_t value = 0;
 506  0102 0f01          	clr	(OFST+0,sp)
 507                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 509  0104 4d            	tnz	a
 510  0105 2710          	jreq	L04
 511  0107 a101          	cp	a,#1
 512  0109 270c          	jreq	L04
 513  010b a102          	cp	a,#2
 514  010d 2708          	jreq	L04
 515  010f a103          	cp	a,#3
 516  0111 2704          	jreq	L04
 517  0113 a104          	cp	a,#4
 518  0115 2603          	jrne	L63
 519  0117               L04:
 520  0117 4f            	clr	a
 521  0118 2010          	jra	L24
 522  011a               L63:
 523  011a ae007e        	ldw	x,#126
 524  011d 89            	pushw	x
 525  011e ae0000        	ldw	x,#0
 526  0121 89            	pushw	x
 527  0122 ae0000        	ldw	x,#L111
 528  0125 cd0000        	call	_assert_failed
 530  0128 5b04          	addw	sp,#4
 531  012a               L24:
 532                     ; 128     switch (Port)
 534  012a 7b02          	ld	a,(OFST+1,sp)
 536                     ; 145     default:
 536                     ; 146         break;
 537  012c 4d            	tnz	a
 538  012d 270e          	jreq	L541
 539  012f 4a            	dec	a
 540  0130 2714          	jreq	L741
 541  0132 4a            	dec	a
 542  0133 271c          	jreq	L151
 543  0135 4a            	dec	a
 544  0136 2725          	jreq	L351
 545  0138 4a            	dec	a
 546  0139 2730          	jreq	L551
 547  013b 2035          	jra	L302
 548  013d               L541:
 549                     ; 130     case EXTI_PORT_GPIOA:
 549                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 551  013d c650a0        	ld	a,20640
 552  0140 a403          	and	a,#3
 553  0142 6b01          	ld	(OFST+0,sp),a
 554                     ; 132         break;
 556  0144 202c          	jra	L302
 557  0146               L741:
 558                     ; 133     case EXTI_PORT_GPIOB:
 558                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 560  0146 c650a0        	ld	a,20640
 561  0149 a40c          	and	a,#12
 562  014b 44            	srl	a
 563  014c 44            	srl	a
 564  014d 6b01          	ld	(OFST+0,sp),a
 565                     ; 135         break;
 567  014f 2021          	jra	L302
 568  0151               L151:
 569                     ; 136     case EXTI_PORT_GPIOC:
 569                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 571  0151 c650a0        	ld	a,20640
 572  0154 a430          	and	a,#48
 573  0156 4e            	swap	a
 574  0157 a40f          	and	a,#15
 575  0159 6b01          	ld	(OFST+0,sp),a
 576                     ; 138         break;
 578  015b 2015          	jra	L302
 579  015d               L351:
 580                     ; 139     case EXTI_PORT_GPIOD:
 580                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 582  015d c650a0        	ld	a,20640
 583  0160 a4c0          	and	a,#192
 584  0162 4e            	swap	a
 585  0163 44            	srl	a
 586  0164 44            	srl	a
 587  0165 a403          	and	a,#3
 588  0167 6b01          	ld	(OFST+0,sp),a
 589                     ; 141         break;
 591  0169 2007          	jra	L302
 592  016b               L551:
 593                     ; 142     case EXTI_PORT_GPIOE:
 593                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 595  016b c650a1        	ld	a,20641
 596  016e a403          	and	a,#3
 597  0170 6b01          	ld	(OFST+0,sp),a
 598                     ; 144         break;
 600  0172               L751:
 601                     ; 145     default:
 601                     ; 146         break;
 603  0172               L302:
 604                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 606  0172 7b01          	ld	a,(OFST+0,sp)
 609  0174 85            	popw	x
 610  0175 81            	ret
 644                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 644                     ; 158 {
 645                     	switch	.text
 646  0176               _EXTI_GetTLISensitivity:
 648  0176 88            	push	a
 649       00000001      OFST:	set	1
 652                     ; 160     uint8_t value = 0;
 654                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 656  0177 c650a1        	ld	a,20641
 657  017a a404          	and	a,#4
 658  017c 6b01          	ld	(OFST+0,sp),a
 659                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 661  017e 7b01          	ld	a,(OFST+0,sp)
 664  0180 5b01          	addw	sp,#1
 665  0182 81            	ret
 678                     	xdef	_EXTI_GetTLISensitivity
 679                     	xdef	_EXTI_GetExtIntSensitivity
 680                     	xdef	_EXTI_SetTLISensitivity
 681                     	xdef	_EXTI_SetExtIntSensitivity
 682                     	xdef	_EXTI_DeInit
 683                     	xref	_assert_failed
 684                     .const:	section	.text
 685  0000               L111:
 686  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_e"
 687  0012 7874692e6300  	dc.b	"xti.c",0
 707                     	end

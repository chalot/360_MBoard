   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     .const:	section	.text
  17  0000               _APR_Array:
  18  0000 00            	dc.b	0
  19  0001 1e            	dc.b	30
  20  0002 1e            	dc.b	30
  21  0003 1e            	dc.b	30
  22  0004 1e            	dc.b	30
  23  0005 1e            	dc.b	30
  24  0006 1e            	dc.b	30
  25  0007 1e            	dc.b	30
  26  0008 1e            	dc.b	30
  27  0009 1e            	dc.b	30
  28  000a 1e            	dc.b	30
  29  000b 1e            	dc.b	30
  30  000c 1e            	dc.b	30
  31  000d 3d            	dc.b	61
  32  000e 17            	dc.b	23
  33  000f 17            	dc.b	23
  34  0010 3e            	dc.b	62
  35  0011               _TBR_Array:
  36  0011 00            	dc.b	0
  37  0012 01            	dc.b	1
  38  0013 02            	dc.b	2
  39  0014 03            	dc.b	3
  40  0015 04            	dc.b	4
  41  0016 05            	dc.b	5
  42  0017 06            	dc.b	6
  43  0018 07            	dc.b	7
  44  0019 08            	dc.b	8
  45  001a 09            	dc.b	9
  46  001b 0a            	dc.b	10
  47  001c 0b            	dc.b	11
  48  001d 0c            	dc.b	12
  49  001e 0c            	dc.b	12
  50  001f 0e            	dc.b	14
  51  0020 0f            	dc.b	15
  52  0021 0f            	dc.b	15
  81                     ; 67 void AWU_DeInit(void)
  81                     ; 68 {
  83                     	switch	.text
  84  0000               _AWU_DeInit:
  88                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  90  0000 725f50f0      	clr	20720
  91                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  93  0004 353f50f1      	mov	20721,#63
  94                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  96  0008 725f50f2      	clr	20722
  97                     ; 72 }
 100  000c 81            	ret
 263                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 263                     ; 83 {
 264                     	switch	.text
 265  000d               _AWU_Init:
 267  000d 88            	push	a
 268       00000000      OFST:	set	0
 271                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 273  000e 4d            	tnz	a
 274  000f 2740          	jreq	L21
 275  0011 a101          	cp	a,#1
 276  0013 273c          	jreq	L21
 277  0015 a102          	cp	a,#2
 278  0017 2738          	jreq	L21
 279  0019 a103          	cp	a,#3
 280  001b 2734          	jreq	L21
 281  001d a104          	cp	a,#4
 282  001f 2730          	jreq	L21
 283  0021 a105          	cp	a,#5
 284  0023 272c          	jreq	L21
 285  0025 a106          	cp	a,#6
 286  0027 2728          	jreq	L21
 287  0029 a107          	cp	a,#7
 288  002b 2724          	jreq	L21
 289  002d a108          	cp	a,#8
 290  002f 2720          	jreq	L21
 291  0031 a109          	cp	a,#9
 292  0033 271c          	jreq	L21
 293  0035 a10a          	cp	a,#10
 294  0037 2718          	jreq	L21
 295  0039 a10b          	cp	a,#11
 296  003b 2714          	jreq	L21
 297  003d a10c          	cp	a,#12
 298  003f 2710          	jreq	L21
 299  0041 a10d          	cp	a,#13
 300  0043 270c          	jreq	L21
 301  0045 a10e          	cp	a,#14
 302  0047 2708          	jreq	L21
 303  0049 a10f          	cp	a,#15
 304  004b 2704          	jreq	L21
 305  004d a110          	cp	a,#16
 306  004f 2603          	jrne	L01
 307  0051               L21:
 308  0051 4f            	clr	a
 309  0052 2010          	jra	L41
 310  0054               L01:
 311  0054 ae0056        	ldw	x,#86
 312  0057 89            	pushw	x
 313  0058 ae0000        	ldw	x,#0
 314  005b 89            	pushw	x
 315  005c ae002e        	ldw	x,#L501
 316  005f cd0000        	call	_assert_failed
 318  0062 5b04          	addw	sp,#4
 319  0064               L41:
 320                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 322  0064 721850f0      	bset	20720,#4
 323                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 325  0068 c650f2        	ld	a,20722
 326  006b a4f0          	and	a,#240
 327  006d c750f2        	ld	20722,a
 328                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 330  0070 7b01          	ld	a,(OFST+1,sp)
 331  0072 5f            	clrw	x
 332  0073 97            	ld	xl,a
 333  0074 c650f2        	ld	a,20722
 334  0077 da0011        	or	a,(_TBR_Array,x)
 335  007a c750f2        	ld	20722,a
 336                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 338  007d c650f1        	ld	a,20721
 339  0080 a4c0          	and	a,#192
 340  0082 c750f1        	ld	20721,a
 341                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 343  0085 7b01          	ld	a,(OFST+1,sp)
 344  0087 5f            	clrw	x
 345  0088 97            	ld	xl,a
 346  0089 c650f1        	ld	a,20721
 347  008c da0000        	or	a,(_APR_Array,x)
 348  008f c750f1        	ld	20721,a
 349                     ; 99 }
 352  0092 84            	pop	a
 353  0093 81            	ret
 408                     ; 108 void AWU_Cmd(FunctionalState NewState)
 408                     ; 109 {
 409                     	switch	.text
 410  0094               _AWU_Cmd:
 414                     ; 110     if (NewState != DISABLE)
 416  0094 4d            	tnz	a
 417  0095 2706          	jreq	L531
 418                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 420  0097 721850f0      	bset	20720,#4
 422  009b 2004          	jra	L731
 423  009d               L531:
 424                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 426  009d 721950f0      	bres	20720,#4
 427  00a1               L731:
 428                     ; 120 }
 431  00a1 81            	ret
 485                     	switch	.const
 486  0022               L42:
 487  0022 0001adb0      	dc.l	110000
 488  0026               L62:
 489  0026 000249f1      	dc.l	150001
 490  002a               L23:
 491  002a 000003e8      	dc.l	1000
 492                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 492                     ; 136 {
 493                     	switch	.text
 494  00a2               _AWU_LSICalibrationConfig:
 496  00a2 5206          	subw	sp,#6
 497       00000006      OFST:	set	6
 500                     ; 138     uint16_t lsifreqkhz = 0x0;
 502                     ; 139     uint16_t A = 0x0;
 504                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 506  00a4 96            	ldw	x,sp
 507  00a5 1c0009        	addw	x,#OFST+3
 508  00a8 cd0000        	call	c_ltor
 510  00ab ae0022        	ldw	x,#L42
 511  00ae cd0000        	call	c_lcmp
 513  00b1 2512          	jrult	L22
 514  00b3 96            	ldw	x,sp
 515  00b4 1c0009        	addw	x,#OFST+3
 516  00b7 cd0000        	call	c_ltor
 518  00ba ae0026        	ldw	x,#L62
 519  00bd cd0000        	call	c_lcmp
 521  00c0 2403          	jruge	L22
 522  00c2 4f            	clr	a
 523  00c3 2010          	jra	L03
 524  00c5               L22:
 525  00c5 ae008e        	ldw	x,#142
 526  00c8 89            	pushw	x
 527  00c9 ae0000        	ldw	x,#0
 528  00cc 89            	pushw	x
 529  00cd ae002e        	ldw	x,#L501
 530  00d0 cd0000        	call	_assert_failed
 532  00d3 5b04          	addw	sp,#4
 533  00d5               L03:
 534                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 536  00d5 96            	ldw	x,sp
 537  00d6 1c0009        	addw	x,#OFST+3
 538  00d9 cd0000        	call	c_ltor
 540  00dc ae002a        	ldw	x,#L23
 541  00df cd0000        	call	c_ludv
 543  00e2 be02          	ldw	x,c_lreg+2
 544  00e4 1f03          	ldw	(OFST-3,sp),x
 545                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 547  00e6 1e03          	ldw	x,(OFST-3,sp)
 548  00e8 54            	srlw	x
 549  00e9 54            	srlw	x
 550  00ea 1f05          	ldw	(OFST-1,sp),x
 551                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 553  00ec 1e05          	ldw	x,(OFST-1,sp)
 554  00ee 58            	sllw	x
 555  00ef 58            	sllw	x
 556  00f0 1f01          	ldw	(OFST-5,sp),x
 557  00f2 1e03          	ldw	x,(OFST-3,sp)
 558  00f4 72f001        	subw	x,(OFST-5,sp)
 559  00f7 1605          	ldw	y,(OFST-1,sp)
 560  00f9 9058          	sllw	y
 561  00fb 905c          	incw	y
 562  00fd cd0000        	call	c_imul
 564  0100 1605          	ldw	y,(OFST-1,sp)
 565  0102 9058          	sllw	y
 566  0104 9058          	sllw	y
 567  0106 bf00          	ldw	c_x,x
 568  0108 90b300        	cpw	y,c_x
 569  010b 2509          	jrult	L761
 570                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 572  010d 7b06          	ld	a,(OFST+0,sp)
 573  010f a002          	sub	a,#2
 574  0111 c750f1        	ld	20721,a
 576  0114 2006          	jra	L171
 577  0116               L761:
 578                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 580  0116 7b06          	ld	a,(OFST+0,sp)
 581  0118 4a            	dec	a
 582  0119 c750f1        	ld	20721,a
 583  011c               L171:
 584                     ; 158 }
 587  011c 5b06          	addw	sp,#6
 588  011e 81            	ret
 611                     ; 165 void AWU_IdleModeEnable(void)
 611                     ; 166 {
 612                     	switch	.text
 613  011f               _AWU_IdleModeEnable:
 617                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 619  011f 721950f0      	bres	20720,#4
 620                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 622  0123 35f050f2      	mov	20722,#240
 623                     ; 172 }
 626  0127 81            	ret
 670                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 670                     ; 181 {
 671                     	switch	.text
 672  0128               _AWU_GetFlagStatus:
 676                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 678  0128 c650f0        	ld	a,20720
 679  012b a520          	bcp	a,#32
 680  012d 2603          	jrne	L04
 681  012f 4f            	clr	a
 682  0130 2002          	jra	L24
 683  0132               L04:
 684  0132 a601          	ld	a,#1
 685  0134               L24:
 688  0134 81            	ret
 723                     	xdef	_TBR_Array
 724                     	xdef	_APR_Array
 725                     	xdef	_AWU_GetFlagStatus
 726                     	xdef	_AWU_IdleModeEnable
 727                     	xdef	_AWU_LSICalibrationConfig
 728                     	xdef	_AWU_Cmd
 729                     	xdef	_AWU_Init
 730                     	xdef	_AWU_DeInit
 731                     	xref	_assert_failed
 732                     	switch	.const
 733  002e               L501:
 734  002e 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_a"
 735  0040 77752e6300    	dc.b	"wu.c",0
 736                     	xref.b	c_lreg
 737                     	xref.b	c_x
 757                     	xref	c_imul
 758                     	xref	c_ludv
 759                     	xref	c_lcmp
 760                     	xref	c_ltor
 761                     	end

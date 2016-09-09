   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               _APR_Array:
  17  0000 00            	dc.b	0
  18  0001 1e            	dc.b	30
  19  0002 1e            	dc.b	30
  20  0003 1e            	dc.b	30
  21  0004 1e            	dc.b	30
  22  0005 1e            	dc.b	30
  23  0006 1e            	dc.b	30
  24  0007 1e            	dc.b	30
  25  0008 1e            	dc.b	30
  26  0009 1e            	dc.b	30
  27  000a 1e            	dc.b	30
  28  000b 1e            	dc.b	30
  29  000c 1e            	dc.b	30
  30  000d 3d            	dc.b	61
  31  000e 17            	dc.b	23
  32  000f 17            	dc.b	23
  33  0010 3e            	dc.b	62
  34  0011               _TBR_Array:
  35  0011 00            	dc.b	0
  36  0012 01            	dc.b	1
  37  0013 02            	dc.b	2
  38  0014 03            	dc.b	3
  39  0015 04            	dc.b	4
  40  0016 05            	dc.b	5
  41  0017 06            	dc.b	6
  42  0018 07            	dc.b	7
  43  0019 08            	dc.b	8
  44  001a 09            	dc.b	9
  45  001b 0a            	dc.b	10
  46  001c 0b            	dc.b	11
  47  001d 0c            	dc.b	12
  48  001e 0c            	dc.b	12
  49  001f 0e            	dc.b	14
  50  0020 0f            	dc.b	15
  51  0021 0f            	dc.b	15
  80                     ; 67 void AWU_DeInit(void)
  80                     ; 68 {
  82                     	switch	.text
  83  0000               _AWU_DeInit:
  87                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  89  0000 725f50f0      	clr	20720
  90                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  92  0004 353f50f1      	mov	20721,#63
  93                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  95  0008 725f50f2      	clr	20722
  96                     ; 72 }
  99  000c 81            	ret
 262                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 262                     ; 83 {
 263                     	switch	.text
 264  000d               _AWU_Init:
 266  000d 88            	push	a
 267       00000000      OFST:	set	0
 270                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 272  000e 4d            	tnz	a
 273  000f 2740          	jreq	L21
 274  0011 a101          	cp	a,#1
 275  0013 273c          	jreq	L21
 276  0015 a102          	cp	a,#2
 277  0017 2738          	jreq	L21
 278  0019 a103          	cp	a,#3
 279  001b 2734          	jreq	L21
 280  001d a104          	cp	a,#4
 281  001f 2730          	jreq	L21
 282  0021 a105          	cp	a,#5
 283  0023 272c          	jreq	L21
 284  0025 a106          	cp	a,#6
 285  0027 2728          	jreq	L21
 286  0029 a107          	cp	a,#7
 287  002b 2724          	jreq	L21
 288  002d a108          	cp	a,#8
 289  002f 2720          	jreq	L21
 290  0031 a109          	cp	a,#9
 291  0033 271c          	jreq	L21
 292  0035 a10a          	cp	a,#10
 293  0037 2718          	jreq	L21
 294  0039 a10b          	cp	a,#11
 295  003b 2714          	jreq	L21
 296  003d a10c          	cp	a,#12
 297  003f 2710          	jreq	L21
 298  0041 a10d          	cp	a,#13
 299  0043 270c          	jreq	L21
 300  0045 a10e          	cp	a,#14
 301  0047 2708          	jreq	L21
 302  0049 a10f          	cp	a,#15
 303  004b 2704          	jreq	L21
 304  004d a110          	cp	a,#16
 305  004f 2603          	jrne	L01
 306  0051               L21:
 307  0051 4f            	clr	a
 308  0052 2010          	jra	L41
 309  0054               L01:
 310  0054 ae0056        	ldw	x,#86
 311  0057 89            	pushw	x
 312  0058 ae0000        	ldw	x,#0
 313  005b 89            	pushw	x
 314  005c ae002e        	ldw	x,#L501
 315  005f cd0000        	call	_assert_failed
 317  0062 5b04          	addw	sp,#4
 318  0064               L41:
 319                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 321  0064 721850f0      	bset	20720,#4
 322                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 324  0068 c650f2        	ld	a,20722
 325  006b a4f0          	and	a,#240
 326  006d c750f2        	ld	20722,a
 327                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 329  0070 7b01          	ld	a,(OFST+1,sp)
 330  0072 5f            	clrw	x
 331  0073 97            	ld	xl,a
 332  0074 c650f2        	ld	a,20722
 333  0077 da0011        	or	a,(_TBR_Array,x)
 334  007a c750f2        	ld	20722,a
 335                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 337  007d c650f1        	ld	a,20721
 338  0080 a4c0          	and	a,#192
 339  0082 c750f1        	ld	20721,a
 340                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 342  0085 7b01          	ld	a,(OFST+1,sp)
 343  0087 5f            	clrw	x
 344  0088 97            	ld	xl,a
 345  0089 c650f1        	ld	a,20721
 346  008c da0000        	or	a,(_APR_Array,x)
 347  008f c750f1        	ld	20721,a
 348                     ; 99 }
 351  0092 84            	pop	a
 352  0093 81            	ret
 407                     ; 108 void AWU_Cmd(FunctionalState NewState)
 407                     ; 109 {
 408                     	switch	.text
 409  0094               _AWU_Cmd:
 413                     ; 110     if (NewState != DISABLE)
 415  0094 4d            	tnz	a
 416  0095 2706          	jreq	L531
 417                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 419  0097 721850f0      	bset	20720,#4
 421  009b 2004          	jra	L731
 422  009d               L531:
 423                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 425  009d 721950f0      	bres	20720,#4
 426  00a1               L731:
 427                     ; 120 }
 430  00a1 81            	ret
 478                     	switch	.const
 479  0022               L42:
 480  0022 0001adb0      	dc.l	110000
 481  0026               L62:
 482  0026 000249f1      	dc.l	150001
 483  002a               L23:
 484  002a 000003e8      	dc.l	1000
 485                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 485                     ; 136 {
 486                     	switch	.text
 487  00a2               _AWU_LSICalibrationConfig:
 489  00a2 5206          	subw	sp,#6
 490       00000006      OFST:	set	6
 493                     ; 138     uint16_t lsifreqkhz = 0x0;
 495                     ; 139     uint16_t A = 0x0;
 497                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 499  00a4 96            	ldw	x,sp
 500  00a5 1c0009        	addw	x,#OFST+3
 501  00a8 cd0000        	call	c_ltor
 503  00ab ae0022        	ldw	x,#L42
 504  00ae cd0000        	call	c_lcmp
 506  00b1 2512          	jrult	L22
 507  00b3 96            	ldw	x,sp
 508  00b4 1c0009        	addw	x,#OFST+3
 509  00b7 cd0000        	call	c_ltor
 511  00ba ae0026        	ldw	x,#L62
 512  00bd cd0000        	call	c_lcmp
 514  00c0 2403          	jruge	L22
 515  00c2 4f            	clr	a
 516  00c3 2010          	jra	L03
 517  00c5               L22:
 518  00c5 ae008e        	ldw	x,#142
 519  00c8 89            	pushw	x
 520  00c9 ae0000        	ldw	x,#0
 521  00cc 89            	pushw	x
 522  00cd ae002e        	ldw	x,#L501
 523  00d0 cd0000        	call	_assert_failed
 525  00d3 5b04          	addw	sp,#4
 526  00d5               L03:
 527                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 529  00d5 96            	ldw	x,sp
 530  00d6 1c0009        	addw	x,#OFST+3
 531  00d9 cd0000        	call	c_ltor
 533  00dc ae002a        	ldw	x,#L23
 534  00df cd0000        	call	c_ludv
 536  00e2 be02          	ldw	x,c_lreg+2
 537  00e4 1f03          	ldw	(OFST-3,sp),x
 538                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 540  00e6 1e03          	ldw	x,(OFST-3,sp)
 541  00e8 54            	srlw	x
 542  00e9 54            	srlw	x
 543  00ea 1f05          	ldw	(OFST-1,sp),x
 544                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 546  00ec 1e05          	ldw	x,(OFST-1,sp)
 547  00ee 58            	sllw	x
 548  00ef 58            	sllw	x
 549  00f0 1f01          	ldw	(OFST-5,sp),x
 550  00f2 1e03          	ldw	x,(OFST-3,sp)
 551  00f4 72f001        	subw	x,(OFST-5,sp)
 552  00f7 1605          	ldw	y,(OFST-1,sp)
 553  00f9 9058          	sllw	y
 554  00fb 905c          	incw	y
 555  00fd cd0000        	call	c_imul
 557  0100 1605          	ldw	y,(OFST-1,sp)
 558  0102 9058          	sllw	y
 559  0104 9058          	sllw	y
 560  0106 bf00          	ldw	c_x,x
 561  0108 90b300        	cpw	y,c_x
 562  010b 2509          	jrult	L161
 563                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 565  010d 7b06          	ld	a,(OFST+0,sp)
 566  010f a002          	sub	a,#2
 567  0111 c750f1        	ld	20721,a
 569  0114 2006          	jra	L361
 570  0116               L161:
 571                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 573  0116 7b06          	ld	a,(OFST+0,sp)
 574  0118 4a            	dec	a
 575  0119 c750f1        	ld	20721,a
 576  011c               L361:
 577                     ; 158 }
 580  011c 5b06          	addw	sp,#6
 581  011e 81            	ret
 604                     ; 165 void AWU_IdleModeEnable(void)
 604                     ; 166 {
 605                     	switch	.text
 606  011f               _AWU_IdleModeEnable:
 610                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 612  011f 721950f0      	bres	20720,#4
 613                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 615  0123 35f050f2      	mov	20722,#240
 616                     ; 172 }
 619  0127 81            	ret
 663                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 663                     ; 181 {
 664                     	switch	.text
 665  0128               _AWU_GetFlagStatus:
 669                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 671  0128 c650f0        	ld	a,20720
 672  012b a520          	bcp	a,#32
 673  012d 2603          	jrne	L04
 674  012f 4f            	clr	a
 675  0130 2002          	jra	L24
 676  0132               L04:
 677  0132 a601          	ld	a,#1
 678  0134               L24:
 681  0134 81            	ret
 716                     	xdef	_TBR_Array
 717                     	xdef	_APR_Array
 718                     	xdef	_AWU_GetFlagStatus
 719                     	xdef	_AWU_IdleModeEnable
 720                     	xdef	_AWU_LSICalibrationConfig
 721                     	xdef	_AWU_Cmd
 722                     	xdef	_AWU_Init
 723                     	xdef	_AWU_DeInit
 724                     	xref	_assert_failed
 725                     	switch	.const
 726  002e               L501:
 727  002e 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_a"
 728  0040 77752e6300    	dc.b	"wu.c",0
 729                     	xref.b	c_lreg
 730                     	xref.b	c_x
 750                     	xref	c_imul
 751                     	xref	c_ludv
 752                     	xref	c_lcmp
 753                     	xref	c_ltor
 754                     	end

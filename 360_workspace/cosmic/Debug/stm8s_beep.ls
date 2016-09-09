   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 48 void BEEP_DeInit(void)
  43                     ; 49 {
  45                     	switch	.text
  46  0000               _BEEP_DeInit:
  50                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  52  0000 351f50f3      	mov	20723,#31
  53                     ; 51 }
  56  0004 81            	ret
 122                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 122                     ; 62 {
 123                     	switch	.text
 124  0005               _BEEP_Init:
 126  0005 88            	push	a
 127       00000000      OFST:	set	0
 130                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 132  0006 4d            	tnz	a
 133  0007 2708          	jreq	L21
 134  0009 a140          	cp	a,#64
 135  000b 2704          	jreq	L21
 136  000d a180          	cp	a,#128
 137  000f 2603          	jrne	L01
 138  0011               L21:
 139  0011 4f            	clr	a
 140  0012 2010          	jra	L41
 141  0014               L01:
 142  0014 ae0041        	ldw	x,#65
 143  0017 89            	pushw	x
 144  0018 ae0000        	ldw	x,#0
 145  001b 89            	pushw	x
 146  001c ae000c        	ldw	x,#L15
 147  001f cd0000        	call	_assert_failed
 149  0022 5b04          	addw	sp,#4
 150  0024               L41:
 151                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 153  0024 c650f3        	ld	a,20723
 154  0027 a41f          	and	a,#31
 155  0029 a11f          	cp	a,#31
 156  002b 2610          	jrne	L35
 157                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 159  002d c650f3        	ld	a,20723
 160  0030 a4e0          	and	a,#224
 161  0032 c750f3        	ld	20723,a
 162                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 164  0035 c650f3        	ld	a,20723
 165  0038 aa0b          	or	a,#11
 166  003a c750f3        	ld	20723,a
 167  003d               L35:
 168                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 170  003d c650f3        	ld	a,20723
 171  0040 a43f          	and	a,#63
 172  0042 c750f3        	ld	20723,a
 173                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 175  0045 c650f3        	ld	a,20723
 176  0048 1a01          	or	a,(OFST+1,sp)
 177  004a c750f3        	ld	20723,a
 178                     ; 78 }
 181  004d 84            	pop	a
 182  004e 81            	ret
 237                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 237                     ; 88 {
 238                     	switch	.text
 239  004f               _BEEP_Cmd:
 243                     ; 89     if (NewState != DISABLE)
 245  004f 4d            	tnz	a
 246  0050 2706          	jreq	L301
 247                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 249  0052 721a50f3      	bset	20723,#5
 251  0056 2004          	jra	L501
 252  0058               L301:
 253                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 255  0058 721b50f3      	bres	20723,#5
 256  005c               L501:
 257                     ; 99 }
 260  005c 81            	ret
 308                     .const:	section	.text
 309  0000               L42:
 310  0000 0001adb0      	dc.l	110000
 311  0004               L62:
 312  0004 000249f1      	dc.l	150001
 313  0008               L23:
 314  0008 000003e8      	dc.l	1000
 315                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 315                     ; 115 {
 316                     	switch	.text
 317  005d               _BEEP_LSICalibrationConfig:
 319  005d 5206          	subw	sp,#6
 320       00000006      OFST:	set	6
 323                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 325  005f 96            	ldw	x,sp
 326  0060 1c0009        	addw	x,#OFST+3
 327  0063 cd0000        	call	c_ltor
 329  0066 ae0000        	ldw	x,#L42
 330  0069 cd0000        	call	c_lcmp
 332  006c 2512          	jrult	L22
 333  006e 96            	ldw	x,sp
 334  006f 1c0009        	addw	x,#OFST+3
 335  0072 cd0000        	call	c_ltor
 337  0075 ae0004        	ldw	x,#L62
 338  0078 cd0000        	call	c_lcmp
 340  007b 2403          	jruge	L22
 341  007d 4f            	clr	a
 342  007e 2010          	jra	L03
 343  0080               L22:
 344  0080 ae0079        	ldw	x,#121
 345  0083 89            	pushw	x
 346  0084 ae0000        	ldw	x,#0
 347  0087 89            	pushw	x
 348  0088 ae000c        	ldw	x,#L15
 349  008b cd0000        	call	_assert_failed
 351  008e 5b04          	addw	sp,#4
 352  0090               L03:
 353                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 355  0090 96            	ldw	x,sp
 356  0091 1c0009        	addw	x,#OFST+3
 357  0094 cd0000        	call	c_ltor
 359  0097 ae0008        	ldw	x,#L23
 360  009a cd0000        	call	c_ludv
 362  009d be02          	ldw	x,c_lreg+2
 363  009f 1f03          	ldw	(OFST-3,sp),x
 364                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 366  00a1 c650f3        	ld	a,20723
 367  00a4 a4e0          	and	a,#224
 368  00a6 c750f3        	ld	20723,a
 369                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 371  00a9 1e03          	ldw	x,(OFST-3,sp)
 372  00ab 54            	srlw	x
 373  00ac 54            	srlw	x
 374  00ad 54            	srlw	x
 375  00ae 1f05          	ldw	(OFST-1,sp),x
 376                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 378  00b0 1e05          	ldw	x,(OFST-1,sp)
 379  00b2 58            	sllw	x
 380  00b3 58            	sllw	x
 381  00b4 58            	sllw	x
 382  00b5 1f01          	ldw	(OFST-5,sp),x
 383  00b7 1e03          	ldw	x,(OFST-3,sp)
 384  00b9 72f001        	subw	x,(OFST-5,sp)
 385  00bc 1605          	ldw	y,(OFST-1,sp)
 386  00be 9058          	sllw	y
 387  00c0 905c          	incw	y
 388  00c2 cd0000        	call	c_imul
 390  00c5 1605          	ldw	y,(OFST-1,sp)
 391  00c7 9058          	sllw	y
 392  00c9 9058          	sllw	y
 393  00cb 9058          	sllw	y
 394  00cd bf00          	ldw	c_x,x
 395  00cf 90b300        	cpw	y,c_x
 396  00d2 250c          	jrult	L721
 397                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 399  00d4 7b06          	ld	a,(OFST+0,sp)
 400  00d6 a002          	sub	a,#2
 401  00d8 ca50f3        	or	a,20723
 402  00db c750f3        	ld	20723,a
 404  00de 2009          	jra	L131
 405  00e0               L721:
 406                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 408  00e0 7b06          	ld	a,(OFST+0,sp)
 409  00e2 4a            	dec	a
 410  00e3 ca50f3        	or	a,20723
 411  00e6 c750f3        	ld	20723,a
 412  00e9               L131:
 413                     ; 139 }
 416  00e9 5b06          	addw	sp,#6
 417  00eb 81            	ret
 430                     	xdef	_BEEP_LSICalibrationConfig
 431                     	xdef	_BEEP_Cmd
 432                     	xdef	_BEEP_Init
 433                     	xdef	_BEEP_DeInit
 434                     	xref	_assert_failed
 435                     	switch	.const
 436  000c               L15:
 437  000c 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_b"
 438  001e 6565702e6300  	dc.b	"eep.c",0
 439                     	xref.b	c_lreg
 440                     	xref.b	c_x
 460                     	xref	c_imul
 461                     	xref	c_ludv
 462                     	xref	c_lcmp
 463                     	xref	c_ltor
 464                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 48 void BEEP_DeInit(void)
  44                     ; 49 {
  46                     	switch	.text
  47  0000               _BEEP_DeInit:
  51                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  53  0000 351f50f3      	mov	20723,#31
  54                     ; 51 }
  57  0004 81            	ret
 123                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 123                     ; 62 {
 124                     	switch	.text
 125  0005               _BEEP_Init:
 127  0005 88            	push	a
 128       00000000      OFST:	set	0
 131                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 133  0006 4d            	tnz	a
 134  0007 2708          	jreq	L21
 135  0009 a140          	cp	a,#64
 136  000b 2704          	jreq	L21
 137  000d a180          	cp	a,#128
 138  000f 2603          	jrne	L01
 139  0011               L21:
 140  0011 4f            	clr	a
 141  0012 2010          	jra	L41
 142  0014               L01:
 143  0014 ae0041        	ldw	x,#65
 144  0017 89            	pushw	x
 145  0018 ae0000        	ldw	x,#0
 146  001b 89            	pushw	x
 147  001c ae000c        	ldw	x,#L15
 148  001f cd0000        	call	_assert_failed
 150  0022 5b04          	addw	sp,#4
 151  0024               L41:
 152                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 154  0024 c650f3        	ld	a,20723
 155  0027 a41f          	and	a,#31
 156  0029 a11f          	cp	a,#31
 157  002b 2610          	jrne	L35
 158                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 160  002d c650f3        	ld	a,20723
 161  0030 a4e0          	and	a,#224
 162  0032 c750f3        	ld	20723,a
 163                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 165  0035 c650f3        	ld	a,20723
 166  0038 aa0b          	or	a,#11
 167  003a c750f3        	ld	20723,a
 168  003d               L35:
 169                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 171  003d c650f3        	ld	a,20723
 172  0040 a43f          	and	a,#63
 173  0042 c750f3        	ld	20723,a
 174                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 176  0045 c650f3        	ld	a,20723
 177  0048 1a01          	or	a,(OFST+1,sp)
 178  004a c750f3        	ld	20723,a
 179                     ; 78 }
 182  004d 84            	pop	a
 183  004e 81            	ret
 238                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 238                     ; 88 {
 239                     	switch	.text
 240  004f               _BEEP_Cmd:
 244                     ; 89     if (NewState != DISABLE)
 246  004f 4d            	tnz	a
 247  0050 2706          	jreq	L301
 248                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 250  0052 721a50f3      	bset	20723,#5
 252  0056 2004          	jra	L501
 253  0058               L301:
 254                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 256  0058 721b50f3      	bres	20723,#5
 257  005c               L501:
 258                     ; 99 }
 261  005c 81            	ret
 315                     .const:	section	.text
 316  0000               L42:
 317  0000 0001adb0      	dc.l	110000
 318  0004               L62:
 319  0004 000249f1      	dc.l	150001
 320  0008               L23:
 321  0008 000003e8      	dc.l	1000
 322                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 322                     ; 115 {
 323                     	switch	.text
 324  005d               _BEEP_LSICalibrationConfig:
 326  005d 5206          	subw	sp,#6
 327       00000006      OFST:	set	6
 330                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 332  005f 96            	ldw	x,sp
 333  0060 1c0009        	addw	x,#OFST+3
 334  0063 cd0000        	call	c_ltor
 336  0066 ae0000        	ldw	x,#L42
 337  0069 cd0000        	call	c_lcmp
 339  006c 2512          	jrult	L22
 340  006e 96            	ldw	x,sp
 341  006f 1c0009        	addw	x,#OFST+3
 342  0072 cd0000        	call	c_ltor
 344  0075 ae0004        	ldw	x,#L62
 345  0078 cd0000        	call	c_lcmp
 347  007b 2403          	jruge	L22
 348  007d 4f            	clr	a
 349  007e 2010          	jra	L03
 350  0080               L22:
 351  0080 ae0079        	ldw	x,#121
 352  0083 89            	pushw	x
 353  0084 ae0000        	ldw	x,#0
 354  0087 89            	pushw	x
 355  0088 ae000c        	ldw	x,#L15
 356  008b cd0000        	call	_assert_failed
 358  008e 5b04          	addw	sp,#4
 359  0090               L03:
 360                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 362  0090 96            	ldw	x,sp
 363  0091 1c0009        	addw	x,#OFST+3
 364  0094 cd0000        	call	c_ltor
 366  0097 ae0008        	ldw	x,#L23
 367  009a cd0000        	call	c_ludv
 369  009d be02          	ldw	x,c_lreg+2
 370  009f 1f03          	ldw	(OFST-3,sp),x
 371                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 373  00a1 c650f3        	ld	a,20723
 374  00a4 a4e0          	and	a,#224
 375  00a6 c750f3        	ld	20723,a
 376                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 378  00a9 1e03          	ldw	x,(OFST-3,sp)
 379  00ab 54            	srlw	x
 380  00ac 54            	srlw	x
 381  00ad 54            	srlw	x
 382  00ae 1f05          	ldw	(OFST-1,sp),x
 383                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 385  00b0 1e05          	ldw	x,(OFST-1,sp)
 386  00b2 58            	sllw	x
 387  00b3 58            	sllw	x
 388  00b4 58            	sllw	x
 389  00b5 1f01          	ldw	(OFST-5,sp),x
 390  00b7 1e03          	ldw	x,(OFST-3,sp)
 391  00b9 72f001        	subw	x,(OFST-5,sp)
 392  00bc 1605          	ldw	y,(OFST-1,sp)
 393  00be 9058          	sllw	y
 394  00c0 905c          	incw	y
 395  00c2 cd0000        	call	c_imul
 397  00c5 1605          	ldw	y,(OFST-1,sp)
 398  00c7 9058          	sllw	y
 399  00c9 9058          	sllw	y
 400  00cb 9058          	sllw	y
 401  00cd bf00          	ldw	c_x,x
 402  00cf 90b300        	cpw	y,c_x
 403  00d2 250c          	jrult	L531
 404                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 406  00d4 7b06          	ld	a,(OFST+0,sp)
 407  00d6 a002          	sub	a,#2
 408  00d8 ca50f3        	or	a,20723
 409  00db c750f3        	ld	20723,a
 411  00de 2009          	jra	L731
 412  00e0               L531:
 413                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 415  00e0 7b06          	ld	a,(OFST+0,sp)
 416  00e2 4a            	dec	a
 417  00e3 ca50f3        	or	a,20723
 418  00e6 c750f3        	ld	20723,a
 419  00e9               L731:
 420                     ; 139 }
 423  00e9 5b06          	addw	sp,#6
 424  00eb 81            	ret
 437                     	xdef	_BEEP_LSICalibrationConfig
 438                     	xdef	_BEEP_Cmd
 439                     	xdef	_BEEP_Init
 440                     	xdef	_BEEP_DeInit
 441                     	xref	_assert_failed
 442                     	switch	.const
 443  000c               L15:
 444  000c 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_b"
 445  001e 6565702e6300  	dc.b	"eep.c",0
 446                     	xref.b	c_lreg
 447                     	xref.b	c_x
 467                     	xref	c_imul
 468                     	xref	c_ludv
 469                     	xref	c_lcmp
 470                     	xref	c_ltor
 471                     	end

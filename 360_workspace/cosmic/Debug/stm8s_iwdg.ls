   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  79                     ; 42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  79                     ; 43 {
  81                     	switch	.text
  82  0000               _IWDG_WriteAccessCmd:
  84  0000 88            	push	a
  85       00000000      OFST:	set	0
  88                     ; 45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  90  0001 a155          	cp	a,#85
  91  0003 2703          	jreq	L01
  92  0005 4d            	tnz	a
  93  0006 2603          	jrne	L6
  94  0008               L01:
  95  0008 4f            	clr	a
  96  0009 2010          	jra	L21
  97  000b               L6:
  98  000b ae002d        	ldw	x,#45
  99  000e 89            	pushw	x
 100  000f ae0000        	ldw	x,#0
 101  0012 89            	pushw	x
 102  0013 ae0000        	ldw	x,#L73
 103  0016 cd0000        	call	_assert_failed
 105  0019 5b04          	addw	sp,#4
 106  001b               L21:
 107                     ; 47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
 109  001b 7b01          	ld	a,(OFST+1,sp)
 110  001d c750e0        	ld	20704,a
 111                     ; 48 }
 114  0020 84            	pop	a
 115  0021 81            	ret
 206                     ; 57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 206                     ; 58 {
 207                     	switch	.text
 208  0022               _IWDG_SetPrescaler:
 210  0022 88            	push	a
 211       00000000      OFST:	set	0
 214                     ; 60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 216  0023 4d            	tnz	a
 217  0024 2718          	jreq	L02
 218  0026 a101          	cp	a,#1
 219  0028 2714          	jreq	L02
 220  002a a102          	cp	a,#2
 221  002c 2710          	jreq	L02
 222  002e a103          	cp	a,#3
 223  0030 270c          	jreq	L02
 224  0032 a104          	cp	a,#4
 225  0034 2708          	jreq	L02
 226  0036 a105          	cp	a,#5
 227  0038 2704          	jreq	L02
 228  003a a106          	cp	a,#6
 229  003c 2603          	jrne	L61
 230  003e               L02:
 231  003e 4f            	clr	a
 232  003f 2010          	jra	L22
 233  0041               L61:
 234  0041 ae003c        	ldw	x,#60
 235  0044 89            	pushw	x
 236  0045 ae0000        	ldw	x,#0
 237  0048 89            	pushw	x
 238  0049 ae0000        	ldw	x,#L73
 239  004c cd0000        	call	_assert_failed
 241  004f 5b04          	addw	sp,#4
 242  0051               L22:
 243                     ; 62     IWDG->PR = (uint8_t)IWDG_Prescaler;
 245  0051 7b01          	ld	a,(OFST+1,sp)
 246  0053 c750e1        	ld	20705,a
 247                     ; 63 }
 250  0056 84            	pop	a
 251  0057 81            	ret
 283                     ; 72 void IWDG_SetReload(uint8_t IWDG_Reload)
 283                     ; 73 {
 284                     	switch	.text
 285  0058               _IWDG_SetReload:
 289                     ; 74     IWDG->RLR = IWDG_Reload;
 291  0058 c750e2        	ld	20706,a
 292                     ; 75 }
 295  005b 81            	ret
 318                     ; 83 void IWDG_ReloadCounter(void)
 318                     ; 84 {
 319                     	switch	.text
 320  005c               _IWDG_ReloadCounter:
 324                     ; 85     IWDG->KR = IWDG_KEY_REFRESH;
 326  005c 35aa50e0      	mov	20704,#170
 327                     ; 86 }
 330  0060 81            	ret
 353                     ; 93 void IWDG_Enable(void)
 353                     ; 94 {
 354                     	switch	.text
 355  0061               _IWDG_Enable:
 359                     ; 95     IWDG->KR = IWDG_KEY_ENABLE;
 361  0061 35cc50e0      	mov	20704,#204
 362                     ; 96 }
 365  0065 81            	ret
 378                     	xdef	_IWDG_Enable
 379                     	xdef	_IWDG_ReloadCounter
 380                     	xdef	_IWDG_SetReload
 381                     	xdef	_IWDG_SetPrescaler
 382                     	xdef	_IWDG_WriteAccessCmd
 383                     	xref	_assert_failed
 384                     .const:	section	.text
 385  0000               L73:
 386  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_i"
 387  0012 7764672e6300  	dc.b	"wdg.c",0
 407                     	end

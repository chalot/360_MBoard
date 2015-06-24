   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  65                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  65                     ; 48 {
  67                     	switch	.text
  68  0000               _WWDG_Init:
  70  0000 89            	pushw	x
  71       00000000      OFST:	set	0
  74                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  76  0001 9f            	ld	a,xl
  77  0002 a180          	cp	a,#128
  78  0004 2403          	jruge	L6
  79  0006 4f            	clr	a
  80  0007 2010          	jra	L01
  81  0009               L6:
  82  0009 ae0032        	ldw	x,#50
  83  000c 89            	pushw	x
  84  000d ae0000        	ldw	x,#0
  85  0010 89            	pushw	x
  86  0011 ae0000        	ldw	x,#L33
  87  0014 cd0000        	call	_assert_failed
  89  0017 5b04          	addw	sp,#4
  90  0019               L01:
  91                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  93  0019 357f50d2      	mov	20690,#127
  94                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  96  001d 7b01          	ld	a,(OFST+1,sp)
  97  001f aac0          	or	a,#192
  98  0021 c750d1        	ld	20689,a
  99                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 101  0024 7b02          	ld	a,(OFST+2,sp)
 102  0026 aa40          	or	a,#64
 103  0028 a47f          	and	a,#127
 104  002a c750d2        	ld	20690,a
 105                     ; 55 }
 108  002d 85            	popw	x
 109  002e 81            	ret
 144                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 144                     ; 64 {
 145                     	switch	.text
 146  002f               _WWDG_SetCounter:
 148  002f 88            	push	a
 149       00000000      OFST:	set	0
 152                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 154  0030 a180          	cp	a,#128
 155  0032 2403          	jruge	L41
 156  0034 4f            	clr	a
 157  0035 2010          	jra	L61
 158  0037               L41:
 159  0037 ae0043        	ldw	x,#67
 160  003a 89            	pushw	x
 161  003b ae0000        	ldw	x,#0
 162  003e 89            	pushw	x
 163  003f ae0000        	ldw	x,#L33
 164  0042 cd0000        	call	_assert_failed
 166  0045 5b04          	addw	sp,#4
 167  0047               L61:
 168                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 170  0047 7b01          	ld	a,(OFST+1,sp)
 171  0049 a47f          	and	a,#127
 172  004b c750d1        	ld	20689,a
 173                     ; 73 }
 176  004e 84            	pop	a
 177  004f 81            	ret
 200                     ; 82 uint8_t WWDG_GetCounter(void)
 200                     ; 83 {
 201                     	switch	.text
 202  0050               _WWDG_GetCounter:
 206                     ; 84     return(WWDG->CR);
 208  0050 c650d1        	ld	a,20689
 211  0053 81            	ret
 234                     ; 92 void WWDG_SWReset(void)
 234                     ; 93 {
 235                     	switch	.text
 236  0054               _WWDG_SWReset:
 240                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 242  0054 358050d1      	mov	20689,#128
 243                     ; 95 }
 246  0058 81            	ret
 282                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 282                     ; 105 {
 283                     	switch	.text
 284  0059               _WWDG_SetWindowValue:
 286  0059 88            	push	a
 287       00000000      OFST:	set	0
 290                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 292  005a a180          	cp	a,#128
 293  005c 2403          	jruge	L62
 294  005e 4f            	clr	a
 295  005f 2010          	jra	L03
 296  0061               L62:
 297  0061 ae006b        	ldw	x,#107
 298  0064 89            	pushw	x
 299  0065 ae0000        	ldw	x,#0
 300  0068 89            	pushw	x
 301  0069 ae0000        	ldw	x,#L33
 302  006c cd0000        	call	_assert_failed
 304  006f 5b04          	addw	sp,#4
 305  0071               L03:
 306                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 308  0071 7b01          	ld	a,(OFST+1,sp)
 309  0073 aa40          	or	a,#64
 310  0075 a47f          	and	a,#127
 311  0077 c750d2        	ld	20690,a
 312                     ; 110 }
 315  007a 84            	pop	a
 316  007b 81            	ret
 329                     	xdef	_WWDG_SetWindowValue
 330                     	xdef	_WWDG_SWReset
 331                     	xdef	_WWDG_GetCounter
 332                     	xdef	_WWDG_SetCounter
 333                     	xdef	_WWDG_Init
 334                     	xref	_assert_failed
 335                     .const:	section	.text
 336  0000               L33:
 337  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_w"
 338  0012 7764672e6300  	dc.b	"wdg.c",0
 358                     	end

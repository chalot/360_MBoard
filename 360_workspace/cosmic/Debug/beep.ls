   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  46                     ; 7 void BEEP_Enable()
  46                     ; 8 {
  48                     	switch	.text
  49  0000               _BEEP_Enable:
  53                     ; 9 		BEEP_Cmd(DISABLE);
  55  0000 4f            	clr	a
  56  0001 cd0000        	call	_BEEP_Cmd
  58                     ; 10 		Delay(0xFFF);
  60  0004 ae0fff        	ldw	x,#4095
  61  0007 89            	pushw	x
  62  0008 ae0000        	ldw	x,#0
  63  000b 89            	pushw	x
  64  000c cd0000        	call	_Delay
  66  000f 5b04          	addw	sp,#4
  67                     ; 11 		BEEP_Init(BEEP_FREQUENCY_4KHZ);
  69  0011 a680          	ld	a,#128
  70  0013 cd0000        	call	_BEEP_Init
  72                     ; 12 		BEEP_Cmd(ENABLE);
  74  0016 a601          	ld	a,#1
  75  0018 cd0000        	call	_BEEP_Cmd
  77                     ; 13 }
  80  001b 81            	ret
  93                     	xdef	_BEEP_Enable
  94                     	xref	_Delay
  95                     	xref	_BEEP_Cmd
  96                     	xref	_BEEP_Init
 115                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  95                     ; 12 TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength)
  95                     ; 13 {
  97                     	switch	.text
  98  0000               _Buffercmp:
 100  0000 89            	pushw	x
 101       00000000      OFST:	set	0
 104  0001 2019          	jra	L15
 105  0003               L74:
 106                     ; 16         if (*pBuffer1 != *pBuffer2)
 108  0003 1e01          	ldw	x,(OFST+1,sp)
 109  0005 f6            	ld	a,(x)
 110  0006 1e05          	ldw	x,(OFST+5,sp)
 111  0008 f1            	cp	a,(x)
 112  0009 2703          	jreq	L55
 113                     ; 18             return FAILED;
 115  000b 4f            	clr	a
 117  000c 201f          	jra	L6
 118  000e               L55:
 119                     ; 21         pBuffer1++;
 121  000e 1e01          	ldw	x,(OFST+1,sp)
 122  0010 1c0001        	addw	x,#1
 123  0013 1f01          	ldw	(OFST+1,sp),x
 124                     ; 22         pBuffer2++;
 126  0015 1e05          	ldw	x,(OFST+5,sp)
 127  0017 1c0001        	addw	x,#1
 128  001a 1f05          	ldw	(OFST+5,sp),x
 129  001c               L15:
 130                     ; 14     while (BufferLength--)
 132  001c 1e07          	ldw	x,(OFST+7,sp)
 133  001e 1d0001        	subw	x,#1
 134  0021 1f07          	ldw	(OFST+7,sp),x
 135  0023 1c0001        	addw	x,#1
 136  0026 a30000        	cpw	x,#0
 137  0029 26d8          	jrne	L74
 138                     ; 25     return PASSED;
 140  002b a601          	ld	a,#1
 142  002d               L6:
 144  002d 85            	popw	x
 145  002e 81            	ret
 189                     ; 33 void	ZeroMem(u8* pu8Mem, u32 u32Size)
 189                     ; 34 {
 190                     	switch	.text
 191  002f               _ZeroMem:
 193  002f 89            	pushw	x
 194       00000000      OFST:	set	0
 197  0030 2014          	jra	L501
 198  0032               L101:
 199                     ; 38 		*pu8Mem++ = 0;
 201  0032 1e01          	ldw	x,(OFST+1,sp)
 202  0034 1c0001        	addw	x,#1
 203  0037 1f01          	ldw	(OFST+1,sp),x
 204  0039 1d0001        	subw	x,#1
 205  003c 7f            	clr	(x)
 206                     ; 36 	for (; u32Size>0; u32Size--)
 208  003d 96            	ldw	x,sp
 209  003e 1c0005        	addw	x,#OFST+5
 210  0041 a601          	ld	a,#1
 211  0043 cd0000        	call	c_lgsbc
 213  0046               L501:
 216  0046 96            	ldw	x,sp
 217  0047 1c0005        	addw	x,#OFST+5
 218  004a cd0000        	call	c_lzmp
 220  004d 26e3          	jrne	L101
 221                     ; 41 }
 224  004f 85            	popw	x
 225  0050 81            	ret
 249                     ; 44 void Delay_1ms()
 249                     ; 45 {
 250                     	switch	.text
 251  0051               _Delay_1ms:
 255                     ; 46 	Delay(0x100);
 257  0051 ae0100        	ldw	x,#256
 258  0054 89            	pushw	x
 259  0055 ae0000        	ldw	x,#0
 260  0058 89            	pushw	x
 261  0059 ad03          	call	_Delay
 263  005b 5b04          	addw	sp,#4
 264                     ; 47 }
 267  005d 81            	ret
 301                     ; 50 void Delay(uint32_t nCount)
 301                     ; 51 {
 302                     	switch	.text
 303  005e               _Delay:
 305       00000000      OFST:	set	0
 308  005e 2009          	jra	L141
 309  0060               L731:
 310                     ; 55         nCount--;
 312  0060 96            	ldw	x,sp
 313  0061 1c0003        	addw	x,#OFST+3
 314  0064 a601          	ld	a,#1
 315  0066 cd0000        	call	c_lgsbc
 317  0069               L141:
 318                     ; 53     while (nCount != 0)
 320  0069 96            	ldw	x,sp
 321  006a 1c0003        	addw	x,#OFST+3
 322  006d cd0000        	call	c_lzmp
 324  0070 26ee          	jrne	L731
 325                     ; 57 }
 328  0072 81            	ret
 341                     	xdef	_Delay
 342                     	xdef	_Delay_1ms
 343                     	xdef	_ZeroMem
 344                     	xdef	_Buffercmp
 363                     	xref	c_lzmp
 364                     	xref	c_lgsbc
 365                     	end

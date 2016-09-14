   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  93                     ; 12 TestStatus Buffercmp(uint8_t* pBuffer1, uint8_t* pBuffer2, uint16_t BufferLength)
  93                     ; 13 {
  95                     	switch	.text
  96  0000               _Buffercmp:
  98  0000 89            	pushw	x
  99       00000000      OFST:	set	0
 102  0001 2019          	jra	L74
 103  0003               L54:
 104                     ; 16         if (*pBuffer1 != *pBuffer2)
 106  0003 1e01          	ldw	x,(OFST+1,sp)
 107  0005 f6            	ld	a,(x)
 108  0006 1e05          	ldw	x,(OFST+5,sp)
 109  0008 f1            	cp	a,(x)
 110  0009 2703          	jreq	L35
 111                     ; 18             return FAILED;
 113  000b 4f            	clr	a
 115  000c 201f          	jra	L6
 116  000e               L35:
 117                     ; 21         pBuffer1++;
 119  000e 1e01          	ldw	x,(OFST+1,sp)
 120  0010 1c0001        	addw	x,#1
 121  0013 1f01          	ldw	(OFST+1,sp),x
 122                     ; 22         pBuffer2++;
 124  0015 1e05          	ldw	x,(OFST+5,sp)
 125  0017 1c0001        	addw	x,#1
 126  001a 1f05          	ldw	(OFST+5,sp),x
 127  001c               L74:
 128                     ; 14     while (BufferLength--)
 130  001c 1e07          	ldw	x,(OFST+7,sp)
 131  001e 1d0001        	subw	x,#1
 132  0021 1f07          	ldw	(OFST+7,sp),x
 133  0023 1c0001        	addw	x,#1
 134  0026 a30000        	cpw	x,#0
 135  0029 26d8          	jrne	L54
 136                     ; 25     return PASSED;
 138  002b a601          	ld	a,#1
 140  002d               L6:
 142  002d 85            	popw	x
 143  002e 81            	ret
 185                     ; 33 void	ZeroMem(u8* pu8Mem, u32 u32Size)
 185                     ; 34 {
 186                     	switch	.text
 187  002f               _ZeroMem:
 189  002f 89            	pushw	x
 190       00000000      OFST:	set	0
 193  0030 2014          	jra	L101
 194  0032               L57:
 195                     ; 38 		*pu8Mem++ = 0;
 197  0032 1e01          	ldw	x,(OFST+1,sp)
 198  0034 1c0001        	addw	x,#1
 199  0037 1f01          	ldw	(OFST+1,sp),x
 200  0039 1d0001        	subw	x,#1
 201  003c 7f            	clr	(x)
 202                     ; 36 	for (; u32Size>0; u32Size--)
 204  003d 96            	ldw	x,sp
 205  003e 1c0005        	addw	x,#OFST+5
 206  0041 a601          	ld	a,#1
 207  0043 cd0000        	call	c_lgsbc
 209  0046               L101:
 212  0046 96            	ldw	x,sp
 213  0047 1c0005        	addw	x,#OFST+5
 214  004a cd0000        	call	c_lzmp
 216  004d 26e3          	jrne	L57
 217                     ; 41 }
 220  004f 85            	popw	x
 221  0050 81            	ret
 245                     ; 44 void Delay_1ms()
 245                     ; 45 {
 246                     	switch	.text
 247  0051               _Delay_1ms:
 251                     ; 46 	Delay(0x120);
 253  0051 ae0120        	ldw	x,#288
 254  0054 89            	pushw	x
 255  0055 ae0000        	ldw	x,#0
 256  0058 89            	pushw	x
 257  0059 ad1d          	call	_Delay
 259  005b 5b04          	addw	sp,#4
 260                     ; 47 }
 263  005d 81            	ret
 303                     ; 49 void Delay_nms(u16 u16Num)
 303                     ; 50 {
 304                     	switch	.text
 305  005e               _Delay_nms:
 307  005e 89            	pushw	x
 308  005f 89            	pushw	x
 309       00000002      OFST:	set	2
 312                     ; 51 	u16 i = 0;
 314  0060 5f            	clrw	x
 315  0061 1f01          	ldw	(OFST-1,sp),x
 317  0063 2002          	jra	L731
 318  0065               L331:
 319                     ; 55 		Delay_1ms();
 321  0065 adea          	call	_Delay_1ms
 323  0067               L731:
 324                     ; 53 	while(i++ < u16Num)
 326  0067 1e01          	ldw	x,(OFST-1,sp)
 327  0069 1c0001        	addw	x,#1
 328  006c 1f01          	ldw	(OFST-1,sp),x
 329  006e 1d0001        	subw	x,#1
 330  0071 1303          	cpw	x,(OFST+1,sp)
 331  0073 25f0          	jrult	L331
 332                     ; 57 }
 335  0075 5b04          	addw	sp,#4
 336  0077 81            	ret
 368                     ; 59 void Delay(uint32_t nCount)
 368                     ; 60 {
 369                     	switch	.text
 370  0078               _Delay:
 372       00000000      OFST:	set	0
 375  0078 2009          	jra	L161
 376  007a               L751:
 377                     ; 64         nCount--;
 379  007a 96            	ldw	x,sp
 380  007b 1c0003        	addw	x,#OFST+3
 381  007e a601          	ld	a,#1
 382  0080 cd0000        	call	c_lgsbc
 384  0083               L161:
 385                     ; 62     while (nCount != 0)
 387  0083 96            	ldw	x,sp
 388  0084 1c0003        	addw	x,#OFST+3
 389  0087 cd0000        	call	c_lzmp
 391  008a 26ee          	jrne	L751
 392                     ; 66 }
 395  008c 81            	ret
 408                     	xdef	_Delay
 409                     	xdef	_Delay_nms
 410                     	xdef	_Delay_1ms
 411                     	xdef	_ZeroMem
 412                     	xdef	_Buffercmp
 431                     	xref	c_lzmp
 432                     	xref	c_lgsbc
 433                     	end

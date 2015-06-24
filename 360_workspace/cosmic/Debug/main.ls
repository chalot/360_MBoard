   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     	bsct
  17  0000               _NbrOfDataToTransfer1:
  18  0000 64            	dc.b	100
  19  0001               _NbrOfDataToTransfer2:
  20  0001 64            	dc.b	100
  21  0002               _NbrOfDataToRead1:
  22  0002 64            	dc.b	100
  23  0003               _TxCounter1:
  24  0003 00            	dc.b	0
  25  0004               _TxCounter2:
  26  0004 00            	dc.b	0
  27  0005               _RxCounter1:
  28  0005 00            	dc.b	0
  29  0006               _TransferStatus1:
  30  0006 00            	dc.b	0
  31  0007               _TransferStatus2:
  32  0007 00            	dc.b	0
  65                     ; 55 void main()
  65                     ; 56 {
  67                     	switch	.text
  68  0000               _main:
  72                     ; 58   CLK_Config();
  74  0000 ad16          	call	L3_CLK_Config
  76                     ; 61   UART_Config();  
  78  0002 ad19          	call	L5_UART_Config
  80                     ; 64 	UART1_ITConfig(UART3_IT_TXE | UART1_IT_RXNE | UART1_IT_RXNE_OR, ENABLE);
  82  0004 4b01          	push	#1
  83  0006 ae0277        	ldw	x,#631
  84  0009 cd0000        	call	_UART1_ITConfig
  86  000c 84            	pop	a
  87                     ; 65 	UART3_ITConfig(UART3_IT_TXE, ENABLE);
  89  000d 4b01          	push	#1
  90  000f ae0277        	ldw	x,#631
  91  0012 cd0000        	call	_UART3_ITConfig
  93  0015 84            	pop	a
  94  0016               L52:
  96  0016 20fe          	jra	L52
 120                     ; 79 static void CLK_Config(void)
 120                     ; 80 {
 121                     	switch	.text
 122  0018               L3_CLK_Config:
 126                     ; 83     CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 128  0018 4f            	clr	a
 129  0019 cd0000        	call	_CLK_HSIPrescalerConfig
 131                     ; 84 }
 134  001c 81            	ret
 164                     ; 91 static void UART_Config(void)
 164                     ; 92 {
 165                     	switch	.text
 166  001d               L5_UART_Config:
 170                     ; 94     UART1_DeInit();
 172  001d cd0000        	call	_UART1_DeInit
 174                     ; 95     UART3_DeInit();
 176  0020 cd0000        	call	_UART3_DeInit
 178                     ; 106     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 178                     ; 107                 UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 180  0023 4b0c          	push	#12
 181  0025 4b80          	push	#128
 182  0027 4b00          	push	#0
 183  0029 4b00          	push	#0
 184  002b 4b00          	push	#0
 185  002d aec200        	ldw	x,#49664
 186  0030 89            	pushw	x
 187  0031 ae0001        	ldw	x,#1
 188  0034 89            	pushw	x
 189  0035 cd0000        	call	_UART1_Init
 191  0038 5b09          	addw	sp,#9
 192                     ; 110     UART1_ITConfig(UART1_IT_TXE | UART1_IT_RXNE, ENABLE);
 194  003a 4b01          	push	#1
 195  003c ae0277        	ldw	x,#631
 196  003f cd0000        	call	_UART1_ITConfig
 198  0042 84            	pop	a
 199                     ; 113  		UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 199                     ; 114                 UART3_MODE_TXRX_ENABLE);
 201  0043 4b0c          	push	#12
 202  0045 4b00          	push	#0
 203  0047 4b00          	push	#0
 204  0049 4b00          	push	#0
 205  004b aec200        	ldw	x,#49664
 206  004e 89            	pushw	x
 207  004f ae0001        	ldw	x,#1
 208  0052 89            	pushw	x
 209  0053 cd0000        	call	_UART3_Init
 211  0056 5b08          	addw	sp,#8
 212                     ; 117     UART3_ITConfig(UART3_IT_TXE, ENABLE);
 214  0058 4b01          	push	#1
 215  005a ae0277        	ldw	x,#631
 216  005d cd0000        	call	_UART3_ITConfig
 218  0060 84            	pop	a
 219                     ; 120     enableInterrupts();    
 222  0061 9a            rim
 224                     ; 121 }
 228  0062 81            	ret
 252                     ; 132 uint8_t GetVar_TxCounter1(void)
 252                     ; 133 {
 253                     	switch	.text
 254  0063               _GetVar_TxCounter1:
 258                     ; 134 return TxCounter1;
 260  0063 b603          	ld	a,_TxCounter1
 263  0065 81            	ret
 287                     ; 144 uint8_t GetVar_TxCounter2(void)
 287                     ; 145 {
 288                     	switch	.text
 289  0066               _GetVar_TxCounter2:
 293                     ; 146 return TxCounter2;
 295  0066 b604          	ld	a,_TxCounter2
 298  0068 81            	ret
 322                     ; 156 uint8_t GetVar_RxCounter1(void)
 322                     ; 157 {
 323                     	switch	.text
 324  0069               _GetVar_RxCounter1:
 328                     ; 158 return RxCounter1;
 330  0069 b605          	ld	a,_RxCounter1
 333  006b 81            	ret
 358                     ; 169 uint8_t IncrementVar_TxCounter1(void)
 358                     ; 170 {
 359                     	switch	.text
 360  006c               _IncrementVar_TxCounter1:
 364                     ; 171 	return TxCounter1++;
 366  006c b603          	ld	a,_TxCounter1
 367  006e 3c03          	inc	_TxCounter1
 370  0070 81            	ret
 395                     ; 181 uint8_t IncrementVar_TxCounter2(void)
 395                     ; 182 {
 396                     	switch	.text
 397  0071               _IncrementVar_TxCounter2:
 401                     ; 183 	return TxCounter2++;
 403  0071 b604          	ld	a,_TxCounter2
 404  0073 3c04          	inc	_TxCounter2
 407  0075 81            	ret
 432                     ; 193 uint8_t IncrementVar_RxCounter1(void)
 432                     ; 194 {
 433                     	switch	.text
 434  0076               _IncrementVar_RxCounter1:
 438                     ; 195 	return RxCounter1++;
 440  0076 b605          	ld	a,_RxCounter1
 441  0078 3c05          	inc	_RxCounter1
 444  007a 81            	ret
 469                     ; 206 uint8_t GetVar_NbrOfDataToTransfer1(void)
 469                     ; 207 {
 470                     	switch	.text
 471  007b               _GetVar_NbrOfDataToTransfer1:
 475                     ; 208 	return NbrOfDataToTransfer1;
 477  007b b600          	ld	a,_NbrOfDataToTransfer1
 480  007d 81            	ret
 505                     ; 218 uint8_t GetVar_NbrOfDataToTransfer2(void)
 505                     ; 219 {
 506                     	switch	.text
 507  007e               _GetVar_NbrOfDataToTransfer2:
 511                     ; 220 	return NbrOfDataToTransfer2;
 513  007e b601          	ld	a,_NbrOfDataToTransfer2
 516  0080 81            	ret
 541                     ; 230 uint8_t GetVar_NbrOfDataToRead1(void)
 541                     ; 231 {
 542                     	switch	.text
 543  0081               _GetVar_NbrOfDataToRead1:
 547                     ; 232 	return NbrOfDataToRead1;
 549  0081 b602          	ld	a,_NbrOfDataToRead1
 552  0083 81            	ret
 587                     ; 242 void assert_failed(uint8_t* file, uint32_t line)
 587                     ; 243 { 
 588                     	switch	.text
 589  0084               _assert_failed:
 593  0084               L771:
 594  0084 20fe          	jra	L771
 735                     	xdef	_main
 736                     	xdef	_GetVar_NbrOfDataToRead1
 737                     	xdef	_GetVar_NbrOfDataToTransfer2
 738                     	xdef	_GetVar_NbrOfDataToTransfer1
 739                     	xdef	_IncrementVar_RxCounter1
 740                     	xdef	_IncrementVar_TxCounter2
 741                     	xdef	_IncrementVar_TxCounter1
 742                     	xdef	_GetVar_RxCounter1
 743                     	xdef	_GetVar_TxCounter2
 744                     	xdef	_GetVar_TxCounter1
 745                     	xdef	_TransferStatus2
 746                     	xdef	_TransferStatus1
 747                     	xdef	_RxCounter1
 748                     	xdef	_TxCounter2
 749                     	xdef	_TxCounter1
 750                     	xdef	_NbrOfDataToRead1
 751                     	xdef	_NbrOfDataToTransfer2
 752                     	xdef	_NbrOfDataToTransfer1
 753                     	switch	.ubsct
 754  0000               _TxBuffer2:
 755  0000 000000000000  	ds.b	100
 756                     	xdef	_TxBuffer2
 757  0064               _RxBuffer1:
 758  0064 000000000000  	ds.b	100
 759                     	xdef	_RxBuffer1
 760  00c8               _TxBuffer1:
 761  00c8 000000000000  	ds.b	100
 762                     	xdef	_TxBuffer1
 763                     	xdef	_assert_failed
 764                     	xref	_UART3_ITConfig
 765                     	xref	_UART3_Init
 766                     	xref	_UART3_DeInit
 767                     	xref	_UART1_ITConfig
 768                     	xref	_UART1_Init
 769                     	xref	_UART1_DeInit
 770                     	xref	_CLK_HSIPrescalerConfig
 790                     	end

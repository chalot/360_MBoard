   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  76                     ; 23 u8 CalChecksum(u8 *data, u8 u8Len)
  76                     ; 24 {
  78                     	switch	.text
  79  0000               _CalChecksum:
  81  0000 89            	pushw	x
  82  0001 89            	pushw	x
  83       00000002      OFST:	set	2
  86                     ; 25 	u8 i = 0;
  88  0002 0f02          	clr	(OFST+0,sp)
  89                     ; 26 	u8 checksum = 0;
  91  0004 0f01          	clr	(OFST-1,sp)
  93  0006 2012          	jra	L14
  94  0008               L53:
  95                     ; 29 		checksum ^= data[i];
  97  0008 7b03          	ld	a,(OFST+1,sp)
  98  000a 97            	ld	xl,a
  99  000b 7b04          	ld	a,(OFST+2,sp)
 100  000d 1b02          	add	a,(OFST+0,sp)
 101  000f 2401          	jrnc	L6
 102  0011 5c            	incw	x
 103  0012               L6:
 104  0012 02            	rlwa	x,a
 105  0013 7b01          	ld	a,(OFST-1,sp)
 106  0015 f8            	xor	a,	(x)
 107  0016 6b01          	ld	(OFST-1,sp),a
 108                     ; 30 		i++;
 110  0018 0c02          	inc	(OFST+0,sp)
 111  001a               L14:
 112                     ; 28 	while(i < u8Len) {
 114  001a 7b02          	ld	a,(OFST+0,sp)
 115  001c 1107          	cp	a,(OFST+5,sp)
 116  001e 25e8          	jrult	L53
 117                     ; 33 	return checksum;
 119  0020 7b01          	ld	a,(OFST-1,sp)
 122  0022 5b04          	addw	sp,#4
 123  0024 81            	ret
 379                     ; 39 int COMM_FormFrame(eKEYTYPE eKey, eKEYSTATE eState, tMSG_CMD *ptCmd)
 379                     ; 40 {
 380                     	switch	.text
 381  0025               _COMM_FormFrame:
 383  0025 89            	pushw	x
 384       00000000      OFST:	set	0
 387                     ; 41 	assert_param(eKey < KEY_END);
 389  0026 9e            	ld	a,xh
 390  0027 a111          	cp	a,#17
 391  0029 2403          	jruge	L21
 392  002b 4f            	clr	a
 393  002c 2010          	jra	L41
 394  002e               L21:
 395  002e ae0029        	ldw	x,#41
 396  0031 89            	pushw	x
 397  0032 ae0000        	ldw	x,#0
 398  0035 89            	pushw	x
 399  0036 ae0000        	ldw	x,#L502
 400  0039 cd0000        	call	_assert_failed
 402  003c 5b04          	addw	sp,#4
 403  003e               L41:
 404                     ; 42 	assert_param(ptCmd != (void*)0);
 406  003e 1e05          	ldw	x,(OFST+5,sp)
 407  0040 2703          	jreq	L61
 408  0042 4f            	clr	a
 409  0043 2010          	jra	L02
 410  0045               L61:
 411  0045 ae002a        	ldw	x,#42
 412  0048 89            	pushw	x
 413  0049 ae0000        	ldw	x,#0
 414  004c 89            	pushw	x
 415  004d ae0000        	ldw	x,#L502
 416  0050 cd0000        	call	_assert_failed
 418  0053 5b04          	addw	sp,#4
 419  0055               L02:
 420                     ; 44 	ptCmd->head = CMD_HEAD; /*ÏûÏ¢Í·£¬0x55*/
 422  0055 1e05          	ldw	x,(OFST+5,sp)
 423  0057 a655          	ld	a,#85
 424  0059 f7            	ld	(x),a
 425                     ; 45 	ptCmd->cmd = eKey;
 427  005a 7b01          	ld	a,(OFST+1,sp)
 428  005c 1e05          	ldw	x,(OFST+5,sp)
 429  005e e701          	ld	(1,x),a
 430                     ; 48 	switch(eKey) 
 432  0060 7b01          	ld	a,(OFST+1,sp)
 434                     ; 71 		default:
 434                     ; 72 			break;
 435  0062 a002          	sub	a,#2
 436  0064 2708          	jreq	L54
 437  0066 4a            	dec	a
 438  0067 271b          	jreq	L74
 439  0069 4a            	dec	a
 440  006a 272e          	jreq	L15
 441  006c 2040          	jra	L112
 442  006e               L54:
 443                     ; 50 		case KEY_LEFT:
 443                     ; 51 			if(eState == KEY_ACTIVED)		
 445  006e 7b02          	ld	a,(OFST+2,sp)
 446  0070 a101          	cp	a,#1
 447  0072 2608          	jrne	L312
 448                     ; 52 				ptCmd->cmd = KEY_LEFT;
 450  0074 1e05          	ldw	x,(OFST+5,sp)
 451  0076 a602          	ld	a,#2
 452  0078 e701          	ld	(1,x),a
 454  007a 2032          	jra	L112
 455  007c               L312:
 456                     ; 54 				ptCmd->cmd = KEY_FRONT;
 458  007c 1e05          	ldw	x,(OFST+5,sp)
 459  007e a601          	ld	a,#1
 460  0080 e701          	ld	(1,x),a
 461  0082 202a          	jra	L112
 462  0084               L74:
 463                     ; 57 		case KEY_RIGHT:
 463                     ; 58 			if(eState == KEY_ACTIVED)		
 465  0084 7b02          	ld	a,(OFST+2,sp)
 466  0086 a101          	cp	a,#1
 467  0088 2608          	jrne	L712
 468                     ; 59 				ptCmd->cmd = KEY_RIGHT;
 470  008a 1e05          	ldw	x,(OFST+5,sp)
 471  008c a603          	ld	a,#3
 472  008e e701          	ld	(1,x),a
 474  0090 201c          	jra	L112
 475  0092               L712:
 476                     ; 61 				ptCmd->cmd = KEY_FRONT;
 478  0092 1e05          	ldw	x,(OFST+5,sp)
 479  0094 a601          	ld	a,#1
 480  0096 e701          	ld	(1,x),a
 481  0098 2014          	jra	L112
 482  009a               L15:
 483                     ; 64 		case KEY_REAR:
 483                     ; 65 			if(eState == KEY_ACTIVED)		
 485  009a 7b02          	ld	a,(OFST+2,sp)
 486  009c a101          	cp	a,#1
 487  009e 2608          	jrne	L322
 488                     ; 66 				ptCmd->cmd = KEY_REAR;
 490  00a0 1e05          	ldw	x,(OFST+5,sp)
 491  00a2 a604          	ld	a,#4
 492  00a4 e701          	ld	(1,x),a
 494  00a6 2006          	jra	L112
 495  00a8               L322:
 496                     ; 68 				ptCmd->cmd = KEY_FRONT;
 498  00a8 1e05          	ldw	x,(OFST+5,sp)
 499  00aa a601          	ld	a,#1
 500  00ac e701          	ld	(1,x),a
 501  00ae               L35:
 502                     ; 71 		default:
 502                     ; 72 			break;
 504  00ae               L112:
 505                     ; 76 	ptCmd->param[0] = 0;
 507  00ae 1e05          	ldw	x,(OFST+5,sp)
 508  00b0 6f02          	clr	(2,x)
 509                     ; 77 	ptCmd->param[1] = 0;
 511  00b2 1e05          	ldw	x,(OFST+5,sp)
 512  00b4 6f03          	clr	(3,x)
 513                     ; 78 	ptCmd->param[2] = 0;
 515  00b6 1e05          	ldw	x,(OFST+5,sp)
 516  00b8 6f04          	clr	(4,x)
 517                     ; 79 	ptCmd->param[3] = 0;
 519  00ba 1e05          	ldw	x,(OFST+5,sp)
 520  00bc 6f05          	clr	(5,x)
 521                     ; 81 	ptCmd->checksum = CalChecksum((u8*)ptCmd, sizeof(tMSG_CMD) - 1);
 523  00be 4b06          	push	#6
 524  00c0 1e06          	ldw	x,(OFST+6,sp)
 525  00c2 cd0000        	call	_CalChecksum
 527  00c5 5b01          	addw	sp,#1
 528  00c7 1e05          	ldw	x,(OFST+5,sp)
 529  00c9 e706          	ld	(6,x),a
 530                     ; 83 	return 0;
 532  00cb 5f            	clrw	x
 535  00cc 5b02          	addw	sp,#2
 536  00ce 81            	ret
 619                     ; 90 void COMM_RequestSendCommand(eKEYTYPE eKey, eKEYSTATE eState)
 619                     ; 91 {
 620                     	switch	.text
 621  00cf               _COMM_RequestSendCommand:
 623  00cf 89            	pushw	x
 624  00d0 520a          	subw	sp,#10
 625       0000000a      OFST:	set	10
 628                     ; 92 	int ret = 0;
 630                     ; 94 	u8 i = 0;
 632  00d2 0f08          	clr	(OFST-2,sp)
 633                     ; 97 	ret = COMM_FormFrame(eKey, eState, &tCmdMsg);
 635  00d4 96            	ldw	x,sp
 636  00d5 1c0001        	addw	x,#OFST-9
 637  00d8 89            	pushw	x
 638  00d9 7b0e          	ld	a,(OFST+4,sp)
 639  00db 97            	ld	xl,a
 640  00dc 7b0d          	ld	a,(OFST+3,sp)
 641  00de 95            	ld	xh,a
 642  00df cd0025        	call	_COMM_FormFrame
 644  00e2 5b02          	addw	sp,#2
 645  00e4 1f09          	ldw	(OFST-1,sp),x
 646                     ; 98 	if(ret == 0)
 648  00e6 1e09          	ldw	x,(OFST-1,sp)
 649  00e8 2649          	jrne	L562
 650                     ; 100 		pMsg = (u8*)&tCmdMsg;
 652  00ea 96            	ldw	x,sp
 653  00eb 1c0001        	addw	x,#OFST-9
 654  00ee 1f09          	ldw	(OFST-1,sp),x
 655                     ; 109 	UART1_ITConfig(UART1_IT_TXE, DISABLE);
 657  00f0 4b00          	push	#0
 658  00f2 ae0277        	ldw	x,#631
 659  00f5 cd0000        	call	_UART1_ITConfig
 661  00f8 84            	pop	a
 663  00f9 2029          	jra	L172
 664  00fb               L762:
 665                     ; 128 			l_TxRBuf.buf[l_TxRBuf.write++] = *pMsg++;
 667  00fb c602d5        	ld	a,_l_TxRBuf+241
 668  00fe 97            	ld	xl,a
 669  00ff 725c02d5      	inc	_l_TxRBuf+241
 670  0103 9f            	ld	a,xl
 671  0104 5f            	clrw	x
 672  0105 97            	ld	xl,a
 673  0106 1609          	ldw	y,(OFST-1,sp)
 674  0108 72a90001      	addw	y,#1
 675  010c 1709          	ldw	(OFST-1,sp),y
 676  010e 72a20001      	subw	y,#1
 677  0112 90f6          	ld	a,(y)
 678  0114 d701e4        	ld	(_l_TxRBuf,x),a
 679                     ; 129 			if(l_TxRBuf.write >= BUF_SIZE)
 681  0117 c602d5        	ld	a,_l_TxRBuf+241
 682  011a a1f0          	cp	a,#240
 683  011c 2504          	jrult	L572
 684                     ; 130 				l_TxRBuf.write = 0;
 686  011e 725f02d5      	clr	_l_TxRBuf+241
 687  0122               L572:
 688                     ; 132 			i ++;
 690  0122 0c08          	inc	(OFST-2,sp)
 691  0124               L172:
 692                     ; 126 		while(i < sizeof(tMSG_CMD))
 694  0124 7b08          	ld	a,(OFST-2,sp)
 695  0126 a107          	cp	a,#7
 696  0128 25d1          	jrult	L762
 697                     ; 138 		UART1_ITConfig(UART1_IT_TXE, ENABLE);
 699  012a 4b01          	push	#1
 700  012c ae0277        	ldw	x,#631
 701  012f cd0000        	call	_UART1_ITConfig
 703  0132 84            	pop	a
 704  0133               L562:
 705                     ; 145 }
 708  0133 5b0c          	addw	sp,#12
 709  0135 81            	ret
 774                     ; 150 void COMM_RequestSendCommand_CAN(tMSG_CMD *ptCmdMsg)
 774                     ; 151 {
 775                     	switch	.text
 776  0136               _COMM_RequestSendCommand_CAN:
 778  0136 89            	pushw	x
 779  0137 5205          	subw	sp,#5
 780       00000005      OFST:	set	5
 783                     ; 152 	int ret = 0;
 785  0139 5f            	clrw	x
 786  013a 1f01          	ldw	(OFST-4,sp),x
 787                     ; 153 	u8 i = 0;
 789  013c 0f05          	clr	(OFST+0,sp)
 790                     ; 156 	assert_param((void*)ptCmdMsg != (void*)0);
 792  013e 1e06          	ldw	x,(OFST+1,sp)
 793  0140 2703          	jreq	L62
 794  0142 4f            	clr	a
 795  0143 2010          	jra	L03
 796  0145               L62:
 797  0145 ae009c        	ldw	x,#156
 798  0148 89            	pushw	x
 799  0149 ae0000        	ldw	x,#0
 800  014c 89            	pushw	x
 801  014d ae0000        	ldw	x,#L502
 802  0150 cd0000        	call	_assert_failed
 804  0153 5b04          	addw	sp,#4
 805  0155               L03:
 806                     ; 157 	if(ptCmdMsg == (void*)0) {
 808  0155 1e06          	ldw	x,(OFST+1,sp)
 809  0157 2745          	jreq	L23
 810                     ; 158 		return;
 812                     ; 161 	pMsg = (u8*)ptCmdMsg;
 814  0159 1e06          	ldw	x,(OFST+1,sp)
 815  015b 1f03          	ldw	(OFST-2,sp),x
 816                     ; 165 	UART1_ITConfig(UART1_IT_TXE, DISABLE);
 818  015d 4b00          	push	#0
 819  015f ae0277        	ldw	x,#631
 820  0162 cd0000        	call	_UART1_ITConfig
 822  0165 84            	pop	a
 824  0166 2027          	jra	L333
 825  0168               L133:
 826                     ; 184 			l_TxRBuf.buf[l_TxRBuf.write] = *pMsg++;
 828  0168 c602d5        	ld	a,_l_TxRBuf+241
 829  016b 5f            	clrw	x
 830  016c 97            	ld	xl,a
 831  016d 1603          	ldw	y,(OFST-2,sp)
 832  016f 72a90001      	addw	y,#1
 833  0173 1703          	ldw	(OFST-2,sp),y
 834  0175 72a20001      	subw	y,#1
 835  0179 90f6          	ld	a,(y)
 836  017b d701e4        	ld	(_l_TxRBuf,x),a
 837                     ; 185 			l_TxRBuf.write++;
 839  017e 725c02d5      	inc	_l_TxRBuf+241
 840                     ; 186 			if(l_TxRBuf.write >= BUF_SIZE)
 842  0182 c602d5        	ld	a,_l_TxRBuf+241
 843  0185 a1f0          	cp	a,#240
 844  0187 2504          	jrult	L733
 845                     ; 187 				l_TxRBuf.write = 0;
 847  0189 725f02d5      	clr	_l_TxRBuf+241
 848  018d               L733:
 849                     ; 189 			i ++;
 851  018d 0c05          	inc	(OFST+0,sp)
 852  018f               L333:
 853                     ; 182 		while(i < sizeof(tMSG_CMD))
 855  018f 7b05          	ld	a,(OFST+0,sp)
 856  0191 a107          	cp	a,#7
 857  0193 25d3          	jrult	L133
 858                     ; 193 		UART1_ITConfig(UART1_IT_TXE, ENABLE);
 860  0195 4b01          	push	#1
 861  0197 ae0277        	ldw	x,#631
 862  019a cd0000        	call	_UART1_ITConfig
 864  019d 84            	pop	a
 865                     ; 199 }
 866  019e               L23:
 869  019e 5b07          	addw	sp,#7
 870  01a0 81            	ret
 901                     ; 207 void COMM_Lowlevel_Config()
 901                     ; 208 {
 902                     	switch	.text
 903  01a1               _COMM_Lowlevel_Config:
 907                     ; 209 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 909  01a1 ae0001        	ldw	x,#1
 910  01a4 a602          	ld	a,#2
 911  01a6 95            	ld	xh,a
 912  01a7 cd0000        	call	_CLK_PeripheralClockConfig
 914                     ; 210 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
 916  01aa ae0001        	ldw	x,#1
 917  01ad a603          	ld	a,#3
 918  01af 95            	ld	xh,a
 919  01b0 cd0000        	call	_CLK_PeripheralClockConfig
 921                     ; 241     UART1_DeInit();
 923  01b3 cd0000        	call	_UART1_DeInit
 925                     ; 252     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 925                     ; 253                 UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 927  01b6 4b0c          	push	#12
 928  01b8 4b80          	push	#128
 929  01ba 4b00          	push	#0
 930  01bc 4b00          	push	#0
 931  01be 4b00          	push	#0
 932  01c0 aec200        	ldw	x,#49664
 933  01c3 89            	pushw	x
 934  01c4 ae0001        	ldw	x,#1
 935  01c7 89            	pushw	x
 936  01c8 cd0000        	call	_UART1_Init
 938  01cb 5b09          	addw	sp,#9
 939                     ; 257     UART1_ITConfig(UART1_IT_TXE | UART1_IT_RXNE, ENABLE);
 941  01cd 4b01          	push	#1
 942  01cf ae0277        	ldw	x,#631
 943  01d2 cd0000        	call	_UART1_ITConfig
 945  01d5 84            	pop	a
 946                     ; 263 	UART3_DeInit();
 948  01d6 cd0000        	call	_UART3_DeInit
 950                     ; 265 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 950                     ; 266 		UART3_MODE_TX_ENABLE);
 952  01d9 4b04          	push	#4
 953  01db 4b00          	push	#0
 954  01dd 4b00          	push	#0
 955  01df 4b00          	push	#0
 956  01e1 aec200        	ldw	x,#49664
 957  01e4 89            	pushw	x
 958  01e5 ae0001        	ldw	x,#1
 959  01e8 89            	pushw	x
 960  01e9 cd0000        	call	_UART3_Init
 962  01ec 5b08          	addw	sp,#8
 963                     ; 269 	UART3_ITConfig(UART3_IT_TXE, ENABLE);
 965  01ee 4b01          	push	#1
 966  01f0 ae0277        	ldw	x,#631
 967  01f3 cd0000        	call	_UART3_ITConfig
 969  01f6 84            	pop	a
 970                     ; 272 }
 973  01f7 81            	ret
 999                     ; 275 void COMM_Init()
 999                     ; 276 {
1000                     	switch	.text
1001  01f8               _COMM_Init:
1005                     ; 278 	l_TxRBuf.read = 0;
1007  01f8 725f02d4      	clr	_l_TxRBuf+240
1008                     ; 279 	l_TxRBuf.write = 0;
1010  01fc 725f02d5      	clr	_l_TxRBuf+241
1011                     ; 280 	l_RxRBuf.read = 0;
1013  0200 725f01e2      	clr	_l_RxRBuf+240
1014                     ; 281 	l_RxRBuf.write = 0;
1016  0204 725f01e3      	clr	_l_RxRBuf+241
1017                     ; 283 	COMM_Lowlevel_Config();
1019  0208 ad97          	call	_COMM_Lowlevel_Config
1021                     ; 284 }
1024  020a 81            	ret
1100                     	xdef	_COMM_FormFrame
1101                     	switch	.bss
1102  0000               _l_TxRBuf_Dbg:
1103  0000 000000000000  	ds.b	242
1104                     	xdef	_l_TxRBuf_Dbg
1105  00f2               _l_RxRBuf:
1106  00f2 000000000000  	ds.b	242
1107                     	xdef	_l_RxRBuf
1108  01e4               _l_TxRBuf:
1109  01e4 000000000000  	ds.b	242
1110                     	xdef	_l_TxRBuf
1111                     	xdef	_COMM_RequestSendCommand_CAN
1112                     	xdef	_COMM_RequestSendCommand
1113                     	xdef	_COMM_Lowlevel_Config
1114                     	xdef	_COMM_Init
1115                     	xdef	_CalChecksum
1116                     	xref	_assert_failed
1117                     	xref	_UART3_ITConfig
1118                     	xref	_UART3_Init
1119                     	xref	_UART3_DeInit
1120                     	xref	_UART1_ITConfig
1121                     	xref	_UART1_Init
1122                     	xref	_UART1_DeInit
1123                     	xref	_CLK_PeripheralClockConfig
1124                     .const:	section	.text
1125  0000               L502:
1126  0000 2e2e5c617070  	dc.b	"..\app\comm.c",0
1146                     	end

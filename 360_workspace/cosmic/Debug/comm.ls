   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  82                     ; 23 u8 CalChecksum(u8 *data, u8 u8Len)
  82                     ; 24 {
  84                     	switch	.text
  85  0000               _CalChecksum:
  87  0000 89            	pushw	x
  88  0001 89            	pushw	x
  89       00000002      OFST:	set	2
  92                     ; 25 	u8 i = 0;
  94  0002 0f02          	clr	(OFST+0,sp)
  95                     ; 26 	u8 checksum = 0;
  97  0004 0f01          	clr	(OFST-1,sp)
  99  0006 2012          	jra	L74
 100  0008               L34:
 101                     ; 29 		checksum ^= data[i];
 103  0008 7b03          	ld	a,(OFST+1,sp)
 104  000a 97            	ld	xl,a
 105  000b 7b04          	ld	a,(OFST+2,sp)
 106  000d 1b02          	add	a,(OFST+0,sp)
 107  000f 2401          	jrnc	L6
 108  0011 5c            	incw	x
 109  0012               L6:
 110  0012 02            	rlwa	x,a
 111  0013 7b01          	ld	a,(OFST-1,sp)
 112  0015 f8            	xor	a,	(x)
 113  0016 6b01          	ld	(OFST-1,sp),a
 114                     ; 30 		i++;
 116  0018 0c02          	inc	(OFST+0,sp)
 117  001a               L74:
 118                     ; 28 	while(i < u8Len) {
 120  001a 7b02          	ld	a,(OFST+0,sp)
 121  001c 1107          	cp	a,(OFST+5,sp)
 122  001e 25e8          	jrult	L34
 123                     ; 33 	return checksum;
 125  0020 7b01          	ld	a,(OFST-1,sp)
 128  0022 5b04          	addw	sp,#4
 129  0024 81            	ret
 350                     ; 39 int COMM_FormFrame(eKEYTYPE eKey, eKEYSTATE eState, tMSG_CMD *ptCmd)
 350                     ; 40 {
 351                     	switch	.text
 352  0025               _COMM_FormFrame:
 354  0025 89            	pushw	x
 355       00000000      OFST:	set	0
 358                     ; 41 	assert_param(eKey < KEY_END);
 360  0026 9e            	ld	a,xh
 361  0027 a10c          	cp	a,#12
 362  0029 2403          	jruge	L21
 363  002b 4f            	clr	a
 364  002c 2010          	jra	L41
 365  002e               L21:
 366  002e ae0029        	ldw	x,#41
 367  0031 89            	pushw	x
 368  0032 ae0000        	ldw	x,#0
 369  0035 89            	pushw	x
 370  0036 ae0000        	ldw	x,#L102
 371  0039 cd0000        	call	_assert_failed
 373  003c 5b04          	addw	sp,#4
 374  003e               L41:
 375                     ; 42 	assert_param(ptCmd != (void*)0);
 377  003e 1e05          	ldw	x,(OFST+5,sp)
 378  0040 2703          	jreq	L61
 379  0042 4f            	clr	a
 380  0043 2010          	jra	L02
 381  0045               L61:
 382  0045 ae002a        	ldw	x,#42
 383  0048 89            	pushw	x
 384  0049 ae0000        	ldw	x,#0
 385  004c 89            	pushw	x
 386  004d ae0000        	ldw	x,#L102
 387  0050 cd0000        	call	_assert_failed
 389  0053 5b04          	addw	sp,#4
 390  0055               L02:
 391                     ; 44 	ptCmd->head = CMD_HEAD; /*ÏûÏ¢Í·£¬0x55*/
 393  0055 1e05          	ldw	x,(OFST+5,sp)
 394  0057 a655          	ld	a,#85
 395  0059 f7            	ld	(x),a
 396                     ; 45 	ptCmd->cmd = eKey;
 398  005a 7b01          	ld	a,(OFST+1,sp)
 399  005c 1e05          	ldw	x,(OFST+5,sp)
 400  005e e701          	ld	(1,x),a
 401                     ; 48 	switch(eKey) 
 403  0060 7b01          	ld	a,(OFST+1,sp)
 405                     ; 71 		default:
 405                     ; 72 			break;
 406  0062 a002          	sub	a,#2
 407  0064 2708          	jreq	L35
 408  0066 4a            	dec	a
 409  0067 271b          	jreq	L55
 410  0069 4a            	dec	a
 411  006a 272e          	jreq	L75
 412  006c 2040          	jra	L502
 413  006e               L35:
 414                     ; 50 		case KEY_LEFT:
 414                     ; 51 			if(eState == KEY_ACTIVED)		
 416  006e 7b02          	ld	a,(OFST+2,sp)
 417  0070 a101          	cp	a,#1
 418  0072 2608          	jrne	L702
 419                     ; 52 				ptCmd->cmd = KEY_LEFT;
 421  0074 1e05          	ldw	x,(OFST+5,sp)
 422  0076 a602          	ld	a,#2
 423  0078 e701          	ld	(1,x),a
 425  007a 2032          	jra	L502
 426  007c               L702:
 427                     ; 54 				ptCmd->cmd = KEY_FRONT;
 429  007c 1e05          	ldw	x,(OFST+5,sp)
 430  007e a601          	ld	a,#1
 431  0080 e701          	ld	(1,x),a
 432  0082 202a          	jra	L502
 433  0084               L55:
 434                     ; 57 		case KEY_RIGHT:
 434                     ; 58 			if(eState == KEY_ACTIVED)		
 436  0084 7b02          	ld	a,(OFST+2,sp)
 437  0086 a101          	cp	a,#1
 438  0088 2608          	jrne	L312
 439                     ; 59 				ptCmd->cmd = KEY_RIGHT;
 441  008a 1e05          	ldw	x,(OFST+5,sp)
 442  008c a603          	ld	a,#3
 443  008e e701          	ld	(1,x),a
 445  0090 201c          	jra	L502
 446  0092               L312:
 447                     ; 61 				ptCmd->cmd = KEY_FRONT;
 449  0092 1e05          	ldw	x,(OFST+5,sp)
 450  0094 a601          	ld	a,#1
 451  0096 e701          	ld	(1,x),a
 452  0098 2014          	jra	L502
 453  009a               L75:
 454                     ; 64 		case KEY_REAR:
 454                     ; 65 			if(eState == KEY_ACTIVED)		
 456  009a 7b02          	ld	a,(OFST+2,sp)
 457  009c a101          	cp	a,#1
 458  009e 2608          	jrne	L712
 459                     ; 66 				ptCmd->cmd = KEY_REAR;
 461  00a0 1e05          	ldw	x,(OFST+5,sp)
 462  00a2 a604          	ld	a,#4
 463  00a4 e701          	ld	(1,x),a
 465  00a6 2006          	jra	L502
 466  00a8               L712:
 467                     ; 68 				ptCmd->cmd = KEY_FRONT;
 469  00a8 1e05          	ldw	x,(OFST+5,sp)
 470  00aa a601          	ld	a,#1
 471  00ac e701          	ld	(1,x),a
 472  00ae               L16:
 473                     ; 71 		default:
 473                     ; 72 			break;
 475  00ae               L502:
 476                     ; 76 	ptCmd->param[0] = 0;
 478  00ae 1e05          	ldw	x,(OFST+5,sp)
 479  00b0 6f02          	clr	(2,x)
 480                     ; 77 	ptCmd->param[1] = 0;
 482  00b2 1e05          	ldw	x,(OFST+5,sp)
 483  00b4 6f03          	clr	(3,x)
 484                     ; 78 	ptCmd->param[2] = 0;
 486  00b6 1e05          	ldw	x,(OFST+5,sp)
 487  00b8 6f04          	clr	(4,x)
 488                     ; 79 	ptCmd->param[3] = 0;
 490  00ba 1e05          	ldw	x,(OFST+5,sp)
 491  00bc 6f05          	clr	(5,x)
 492                     ; 81 	ptCmd->checksum = CalChecksum((u8*)ptCmd, sizeof(tMSG_CMD) - 1);
 494  00be 4b06          	push	#6
 495  00c0 1e06          	ldw	x,(OFST+6,sp)
 496  00c2 cd0000        	call	_CalChecksum
 498  00c5 5b01          	addw	sp,#1
 499  00c7 1e05          	ldw	x,(OFST+5,sp)
 500  00c9 e706          	ld	(6,x),a
 501                     ; 83 	return 0;
 503  00cb 5f            	clrw	x
 506  00cc 5b02          	addw	sp,#2
 507  00ce 81            	ret
 594                     ; 90 void COMM_RequestSendCommand(eKEYTYPE eKey, eKEYSTATE eState)
 594                     ; 91 {
 595                     	switch	.text
 596  00cf               _COMM_RequestSendCommand:
 598  00cf 89            	pushw	x
 599  00d0 520a          	subw	sp,#10
 600       0000000a      OFST:	set	10
 603                     ; 92 	int ret = 0;
 605                     ; 94 	u8 i = 0;
 607  00d2 0f08          	clr	(OFST-2,sp)
 608                     ; 97 	ret = COMM_FormFrame(eKey, eState, &tCmdMsg);
 610  00d4 96            	ldw	x,sp
 611  00d5 1c0001        	addw	x,#OFST-9
 612  00d8 89            	pushw	x
 613  00d9 7b0e          	ld	a,(OFST+4,sp)
 614  00db 97            	ld	xl,a
 615  00dc 7b0d          	ld	a,(OFST+3,sp)
 616  00de 95            	ld	xh,a
 617  00df cd0025        	call	_COMM_FormFrame
 619  00e2 5b02          	addw	sp,#2
 620  00e4 1f09          	ldw	(OFST-1,sp),x
 621                     ; 98 	if(ret == 0)
 623  00e6 1e09          	ldw	x,(OFST-1,sp)
 624  00e8 2642          	jrne	L562
 625                     ; 100 		pMsg = (u8*)&tCmdMsg;
 627  00ea 96            	ldw	x,sp
 628  00eb 1c0001        	addw	x,#OFST-9
 629  00ee 1f09          	ldw	(OFST-1,sp),x
 630                     ; 106 		UART1_ITConfig(UART1_IT_TXE, DISABLE);
 632  00f0 4b00          	push	#0
 633  00f2 ae0277        	ldw	x,#631
 634  00f5 cd0000        	call	_UART1_ITConfig
 636  00f8 84            	pop	a
 638  00f9 2022          	jra	L172
 639  00fb               L762:
 640                     ; 113 			l_TxRBuf.buf[l_TxRBuf.write++] = *pMsg++;
 642  00fb b69b          	ld	a,_l_TxRBuf+51
 643  00fd 97            	ld	xl,a
 644  00fe 3c9b          	inc	_l_TxRBuf+51
 645  0100 9f            	ld	a,xl
 646  0101 5f            	clrw	x
 647  0102 97            	ld	xl,a
 648  0103 1609          	ldw	y,(OFST-1,sp)
 649  0105 72a90001      	addw	y,#1
 650  0109 1709          	ldw	(OFST-1,sp),y
 651  010b 72a20001      	subw	y,#1
 652  010f 90f6          	ld	a,(y)
 653  0111 e768          	ld	(_l_TxRBuf,x),a
 654                     ; 114 			if(l_TxRBuf.write >= BUF_SIZE)
 656  0113 b69b          	ld	a,_l_TxRBuf+51
 657  0115 a132          	cp	a,#50
 658  0117 2502          	jrult	L572
 659                     ; 115 				l_TxRBuf.write = 0;
 661  0119 3f9b          	clr	_l_TxRBuf+51
 662  011b               L572:
 663                     ; 117 			i ++;
 665  011b 0c08          	inc	(OFST-2,sp)
 666  011d               L172:
 667                     ; 111 		while(i < sizeof(tMSG_CMD))
 669  011d 7b08          	ld	a,(OFST-2,sp)
 670  011f a107          	cp	a,#7
 671  0121 25d8          	jrult	L762
 672                     ; 123 		UART1_ITConfig(UART1_IT_TXE, ENABLE);
 674  0123 4b01          	push	#1
 675  0125 ae0277        	ldw	x,#631
 676  0128 cd0000        	call	_UART1_ITConfig
 678  012b 84            	pop	a
 679  012c               L562:
 680                     ; 129 }
 683  012c 5b0c          	addw	sp,#12
 684  012e 81            	ret
 715                     ; 137 void COMM_Lowlevel_Config()
 715                     ; 138 {
 716                     	switch	.text
 717  012f               _COMM_Lowlevel_Config:
 721                     ; 139 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 723  012f ae0001        	ldw	x,#1
 724  0132 a602          	ld	a,#2
 725  0134 95            	ld	xh,a
 726  0135 cd0000        	call	_CLK_PeripheralClockConfig
 728                     ; 140 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
 730  0138 ae0001        	ldw	x,#1
 731  013b a603          	ld	a,#3
 732  013d 95            	ld	xh,a
 733  013e cd0000        	call	_CLK_PeripheralClockConfig
 735                     ; 171     UART1_DeInit();
 737  0141 cd0000        	call	_UART1_DeInit
 739                     ; 182     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 739                     ; 183                 UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 741  0144 4b0c          	push	#12
 742  0146 4b80          	push	#128
 743  0148 4b00          	push	#0
 744  014a 4b00          	push	#0
 745  014c 4b00          	push	#0
 746  014e aec200        	ldw	x,#49664
 747  0151 89            	pushw	x
 748  0152 ae0001        	ldw	x,#1
 749  0155 89            	pushw	x
 750  0156 cd0000        	call	_UART1_Init
 752  0159 5b09          	addw	sp,#9
 753                     ; 186     UART1_ITConfig(UART1_IT_TXE | UART1_IT_RXNE, ENABLE);
 755  015b 4b01          	push	#1
 756  015d ae0277        	ldw	x,#631
 757  0160 cd0000        	call	_UART1_ITConfig
 759  0163 84            	pop	a
 760                     ; 191 	UART3_DeInit();
 762  0164 cd0000        	call	_UART3_DeInit
 764                     ; 193 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 764                     ; 194 		UART3_MODE_TX_ENABLE);
 766  0167 4b04          	push	#4
 767  0169 4b00          	push	#0
 768  016b 4b00          	push	#0
 769  016d 4b00          	push	#0
 770  016f aec200        	ldw	x,#49664
 771  0172 89            	pushw	x
 772  0173 ae0001        	ldw	x,#1
 773  0176 89            	pushw	x
 774  0177 cd0000        	call	_UART3_Init
 776  017a 5b08          	addw	sp,#8
 777                     ; 197 	UART3_ITConfig(UART3_IT_TXE, ENABLE);
 779  017c 4b01          	push	#1
 780  017e ae0277        	ldw	x,#631
 781  0181 cd0000        	call	_UART3_ITConfig
 783  0184 84            	pop	a
 784                     ; 200 }
 787  0185 81            	ret
 813                     ; 203 void COMM_Init()
 813                     ; 204 {
 814                     	switch	.text
 815  0186               _COMM_Init:
 819                     ; 206 	l_TxRBuf.read = 0;
 821  0186 3f9a          	clr	_l_TxRBuf+50
 822                     ; 207 	l_TxRBuf.write = 0;
 824  0188 3f9b          	clr	_l_TxRBuf+51
 825                     ; 208 	l_RxRBuf.read = 0;
 827  018a 3f66          	clr	_l_RxRBuf+50
 828                     ; 209 	l_RxRBuf.write = 0;
 830  018c 3f67          	clr	_l_RxRBuf+51
 831                     ; 211 	COMM_Lowlevel_Config();
 833  018e ad9f          	call	_COMM_Lowlevel_Config
 835                     ; 212 }
 838  0190 81            	ret
 914                     	xdef	_COMM_FormFrame
 915                     	switch	.ubsct
 916  0000               _l_TxRBuf_Dbg:
 917  0000 000000000000  	ds.b	52
 918                     	xdef	_l_TxRBuf_Dbg
 919  0034               _l_RxRBuf:
 920  0034 000000000000  	ds.b	52
 921                     	xdef	_l_RxRBuf
 922  0068               _l_TxRBuf:
 923  0068 000000000000  	ds.b	52
 924                     	xdef	_l_TxRBuf
 925                     	xdef	_COMM_RequestSendCommand
 926                     	xdef	_COMM_Lowlevel_Config
 927                     	xdef	_COMM_Init
 928                     	xdef	_CalChecksum
 929                     	xref	_assert_failed
 930                     	xref	_UART3_ITConfig
 931                     	xref	_UART3_Init
 932                     	xref	_UART3_DeInit
 933                     	xref	_UART1_ITConfig
 934                     	xref	_UART1_Init
 935                     	xref	_UART1_DeInit
 936                     	xref	_CLK_PeripheralClockConfig
 937                     .const:	section	.text
 938  0000               L102:
 939  0000 2e2e5c617070  	dc.b	"..\app\comm.c",0
 959                     	end

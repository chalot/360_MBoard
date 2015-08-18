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
 343                     .const:	section	.text
 344  0000               L42:
 345  0000 006b          	dc.w	L35
 346  0002 006f          	dc.w	L55
 347  0004 0083          	dc.w	L75
 348  0006 0097          	dc.w	L16
 349  0008 00ab          	dc.w	L36
 350  000a 00bf          	dc.w	L56
 351  000c 00c7          	dc.w	L76
 352  000e 00cf          	dc.w	L17
 353  0010 00d7          	dc.w	L37
 354  0012 00df          	dc.w	L57
 355  0014 00e7          	dc.w	L77
 356  0016 00ef          	dc.w	L101
 357                     ; 39 int COMM_FormFrame(eKEYTYPE eKey, eKEYSTATE eState, tMSG_CMD *ptCmd)
 357                     ; 40 {
 358                     	switch	.text
 359  0025               _COMM_FormFrame:
 361  0025 89            	pushw	x
 362       00000000      OFST:	set	0
 365                     ; 41 	assert_param(eKey < KEY_END);
 367  0026 9e            	ld	a,xh
 368  0027 a10c          	cp	a,#12
 369  0029 2403          	jruge	L21
 370  002b 4f            	clr	a
 371  002c 2010          	jra	L41
 372  002e               L21:
 373  002e ae0029        	ldw	x,#41
 374  0031 89            	pushw	x
 375  0032 ae0000        	ldw	x,#0
 376  0035 89            	pushw	x
 377  0036 ae0018        	ldw	x,#L122
 378  0039 cd0000        	call	_assert_failed
 380  003c 5b04          	addw	sp,#4
 381  003e               L41:
 382                     ; 42 	assert_param(ptCmd != (void*)0);
 384  003e 1e05          	ldw	x,(OFST+5,sp)
 385  0040 2703          	jreq	L61
 386  0042 4f            	clr	a
 387  0043 2010          	jra	L02
 388  0045               L61:
 389  0045 ae002a        	ldw	x,#42
 390  0048 89            	pushw	x
 391  0049 ae0000        	ldw	x,#0
 392  004c 89            	pushw	x
 393  004d ae0018        	ldw	x,#L122
 394  0050 cd0000        	call	_assert_failed
 396  0053 5b04          	addw	sp,#4
 397  0055               L02:
 398                     ; 44 	ptCmd->head = CMD_HEAD; /*消息头，0x55*/
 400  0055 1e05          	ldw	x,(OFST+5,sp)
 401  0057 a655          	ld	a,#85
 402  0059 f7            	ld	(x),a
 403                     ; 46 	switch(eKey) 
 405  005a 7b01          	ld	a,(OFST+1,sp)
 407                     ; 107 			break;
 409  005c a10c          	cp	a,#12
 410  005e 2407          	jruge	L22
 411  0060 5f            	clrw	x
 412  0061 97            	ld	xl,a
 413  0062 58            	sllw	x
 414  0063 de0000        	ldw	x,(L42,x)
 415  0066 fc            	jp	(x)
 416  0067               L22:
 417  0067 acf700f7      	jpf	L301
 418  006b               L35:
 419                     ; 48 		case KEY_ACC:
 419                     ; 49 			break;
 421  006b acfc00fc      	jpf	L522
 422  006f               L55:
 423                     ; 51 		case KEY_FRONT:
 423                     ; 52 			if(eState == KEY_ACTIVED)		
 425  006f 7b02          	ld	a,(OFST+2,sp)
 426  0071 a101          	cp	a,#1
 427  0073 2608          	jrne	L722
 428                     ; 53 				ptCmd->cmd = MSG_FRONT;
 430  0075 1e05          	ldw	x,(OFST+5,sp)
 431  0077 6f01          	clr	(1,x)
 433  0079 acfc00fc      	jpf	L522
 434  007d               L722:
 435                     ; 55 				ptCmd->cmd = MSG_FRONT;
 437  007d 1e05          	ldw	x,(OFST+5,sp)
 438  007f 6f01          	clr	(1,x)
 439  0081 2079          	jra	L522
 440  0083               L75:
 441                     ; 58 		case KEY_LEFT:
 441                     ; 59 			if(eState == KEY_ACTIVED)		
 443  0083 7b02          	ld	a,(OFST+2,sp)
 444  0085 a101          	cp	a,#1
 445  0087 2608          	jrne	L332
 446                     ; 60 				ptCmd->cmd = MSG_LEFT;
 448  0089 1e05          	ldw	x,(OFST+5,sp)
 449  008b a602          	ld	a,#2
 450  008d e701          	ld	(1,x),a
 452  008f 206b          	jra	L522
 453  0091               L332:
 454                     ; 62 				ptCmd->cmd = MSG_FRONT;
 456  0091 1e05          	ldw	x,(OFST+5,sp)
 457  0093 6f01          	clr	(1,x)
 458  0095 2065          	jra	L522
 459  0097               L16:
 460                     ; 65 		case KEY_RIGHT:
 460                     ; 66 			if(eState == KEY_ACTIVED)		
 462  0097 7b02          	ld	a,(OFST+2,sp)
 463  0099 a101          	cp	a,#1
 464  009b 2608          	jrne	L732
 465                     ; 67 				ptCmd->cmd = MSG_RIGHT;
 467  009d 1e05          	ldw	x,(OFST+5,sp)
 468  009f a604          	ld	a,#4
 469  00a1 e701          	ld	(1,x),a
 471  00a3 2057          	jra	L522
 472  00a5               L732:
 473                     ; 69 				ptCmd->cmd = MSG_FRONT;
 475  00a5 1e05          	ldw	x,(OFST+5,sp)
 476  00a7 6f01          	clr	(1,x)
 477  00a9 2051          	jra	L522
 478  00ab               L36:
 479                     ; 72 		case KEY_REAR:
 479                     ; 73 			if(eState == KEY_ACTIVED)		
 481  00ab 7b02          	ld	a,(OFST+2,sp)
 482  00ad a101          	cp	a,#1
 483  00af 2608          	jrne	L342
 484                     ; 74 				ptCmd->cmd = MSG_REAR;
 486  00b1 1e05          	ldw	x,(OFST+5,sp)
 487  00b3 a606          	ld	a,#6
 488  00b5 e701          	ld	(1,x),a
 490  00b7 2043          	jra	L522
 491  00b9               L342:
 492                     ; 76 				ptCmd->cmd = MSG_FRONT;
 494  00b9 1e05          	ldw	x,(OFST+5,sp)
 495  00bb 6f01          	clr	(1,x)
 496  00bd 203d          	jra	L522
 497  00bf               L56:
 498                     ; 79 		case MENU_BACK:		/*遥控器消息：返回*/
 498                     ; 80 			ptCmd->cmd = MSG_MENU_BACK;
 500  00bf 1e05          	ldw	x,(OFST+5,sp)
 501  00c1 a60b          	ld	a,#11
 502  00c3 e701          	ld	(1,x),a
 503                     ; 81 			break;
 505  00c5 2035          	jra	L522
 506  00c7               L76:
 507                     ; 83 		case MENU_LEFT:	/*遥控器消息：左*/
 507                     ; 84 			ptCmd->cmd = MSG_MENU_LEFT;
 509  00c7 1e05          	ldw	x,(OFST+5,sp)
 510  00c9 a60c          	ld	a,#12
 511  00cb e701          	ld	(1,x),a
 512                     ; 85 			break;
 514  00cd 202d          	jra	L522
 515  00cf               L17:
 516                     ; 87 		case MENU_RIGHT:	/*遥控器消息：右*/
 516                     ; 88 			ptCmd->cmd = MSG_MENU_RIGHT;
 518  00cf 1e05          	ldw	x,(OFST+5,sp)
 519  00d1 a60d          	ld	a,#13
 520  00d3 e701          	ld	(1,x),a
 521                     ; 89 			break;
 523  00d5 2025          	jra	L522
 524  00d7               L37:
 525                     ; 91 		case MENU_UP:	/*遥控器消息：上*/
 525                     ; 92 			ptCmd->cmd = MSG_MENU_UP;
 527  00d7 1e05          	ldw	x,(OFST+5,sp)
 528  00d9 a60e          	ld	a,#14
 529  00db e701          	ld	(1,x),a
 530                     ; 93 			break;
 532  00dd 201d          	jra	L522
 533  00df               L57:
 534                     ; 95 		case MENU_DOWN:	/*遥控器消息：下*/			
 534                     ; 96 			ptCmd->cmd = MSG_MENU_DOWN;
 536  00df 1e05          	ldw	x,(OFST+5,sp)
 537  00e1 a60f          	ld	a,#15
 538  00e3 e701          	ld	(1,x),a
 539                     ; 97 			break;
 541  00e5 2015          	jra	L522
 542  00e7               L77:
 543                     ; 98 		case MENU_OK:	/*遥控器消息：确定*/
 543                     ; 99 			ptCmd->cmd = MSG_MENU_OK;
 545  00e7 1e05          	ldw	x,(OFST+5,sp)
 546  00e9 a610          	ld	a,#16
 547  00eb e701          	ld	(1,x),a
 548                     ; 100 			break;
 550  00ed 200d          	jra	L522
 551  00ef               L101:
 552                     ; 101 		case MENU_POWER:
 552                     ; 102 			ptCmd->cmd = MSG_MENU_POWER;
 554  00ef 1e05          	ldw	x,(OFST+5,sp)
 555  00f1 a611          	ld	a,#17
 556  00f3 e701          	ld	(1,x),a
 557                     ; 103 			break;
 559  00f5 2005          	jra	L522
 560  00f7               L301:
 561                     ; 105 		default:
 561                     ; 106 			return -1;
 563  00f7 aeffff        	ldw	x,#65535
 565  00fa 201e          	jra	L62
 566  00fc               L522:
 567                     ; 110 	ptCmd->param[0] = 0;
 569  00fc 1e05          	ldw	x,(OFST+5,sp)
 570  00fe 6f02          	clr	(2,x)
 571                     ; 111 	ptCmd->param[1] = 0;
 573  0100 1e05          	ldw	x,(OFST+5,sp)
 574  0102 6f03          	clr	(3,x)
 575                     ; 112 	ptCmd->param[2] = 0;
 577  0104 1e05          	ldw	x,(OFST+5,sp)
 578  0106 6f04          	clr	(4,x)
 579                     ; 113 	ptCmd->param[3] = 0;
 581  0108 1e05          	ldw	x,(OFST+5,sp)
 582  010a 6f05          	clr	(5,x)
 583                     ; 115 	ptCmd->checksum = CalChecksum((u8*)ptCmd, sizeof(tMSG_CMD) - 1);
 585  010c 4b06          	push	#6
 586  010e 1e06          	ldw	x,(OFST+6,sp)
 587  0110 cd0000        	call	_CalChecksum
 589  0113 5b01          	addw	sp,#1
 590  0115 1e05          	ldw	x,(OFST+5,sp)
 591  0117 e706          	ld	(6,x),a
 592                     ; 117 	return 0;
 594  0119 5f            	clrw	x
 596  011a               L62:
 598  011a 5b02          	addw	sp,#2
 599  011c 81            	ret
 686                     ; 124 void COMM_RequestSendCommand(eKEYTYPE eKey, eKEYSTATE eState)
 686                     ; 125 {
 687                     	switch	.text
 688  011d               _COMM_RequestSendCommand:
 690  011d 89            	pushw	x
 691  011e 520a          	subw	sp,#10
 692       0000000a      OFST:	set	10
 695                     ; 126 	int ret = 0;
 697                     ; 128 	u8 i = 0;
 699  0120 0f08          	clr	(OFST-2,sp)
 700                     ; 131 	ret = COMM_FormFrame(eKey, eState, &tCmdMsg);
 702  0122 96            	ldw	x,sp
 703  0123 1c0001        	addw	x,#OFST-9
 704  0126 89            	pushw	x
 705  0127 7b0e          	ld	a,(OFST+4,sp)
 706  0129 97            	ld	xl,a
 707  012a 7b0d          	ld	a,(OFST+3,sp)
 708  012c 95            	ld	xh,a
 709  012d cd0025        	call	_COMM_FormFrame
 711  0130 5b02          	addw	sp,#2
 712  0132 1f09          	ldw	(OFST-1,sp),x
 713                     ; 132 	if(ret == 0)
 715  0134 1e09          	ldw	x,(OFST-1,sp)
 716  0136 2642          	jrne	L113
 717                     ; 134 		pMsg = (u8*)&tCmdMsg;
 719  0138 96            	ldw	x,sp
 720  0139 1c0001        	addw	x,#OFST-9
 721  013c 1f09          	ldw	(OFST-1,sp),x
 722                     ; 139 		UART1_ITConfig(UART1_IT_TXE, DISABLE);
 724  013e 4b00          	push	#0
 725  0140 ae0277        	ldw	x,#631
 726  0143 cd0000        	call	_UART1_ITConfig
 728  0146 84            	pop	a
 730  0147 2022          	jra	L513
 731  0149               L313:
 732                     ; 143 			l_TxRBuf.buf[l_TxRBuf.write++] = *pMsg++;
 734  0149 b69b          	ld	a,_l_TxRBuf+51
 735  014b 97            	ld	xl,a
 736  014c 3c9b          	inc	_l_TxRBuf+51
 737  014e 9f            	ld	a,xl
 738  014f 5f            	clrw	x
 739  0150 97            	ld	xl,a
 740  0151 1609          	ldw	y,(OFST-1,sp)
 741  0153 72a90001      	addw	y,#1
 742  0157 1709          	ldw	(OFST-1,sp),y
 743  0159 72a20001      	subw	y,#1
 744  015d 90f6          	ld	a,(y)
 745  015f e768          	ld	(_l_TxRBuf,x),a
 746                     ; 144 			if(l_TxRBuf.write >= BUF_SIZE)
 748  0161 b69b          	ld	a,_l_TxRBuf+51
 749  0163 a132          	cp	a,#50
 750  0165 2502          	jrult	L123
 751                     ; 145 				l_TxRBuf.write = 0;
 753  0167 3f9b          	clr	_l_TxRBuf+51
 754  0169               L123:
 755                     ; 147 			i ++;
 757  0169 0c08          	inc	(OFST-2,sp)
 758  016b               L513:
 759                     ; 141 		while(i < sizeof(tMSG_CMD))
 761  016b 7b08          	ld	a,(OFST-2,sp)
 762  016d a107          	cp	a,#7
 763  016f 25d8          	jrult	L313
 764                     ; 152 		UART1_ITConfig(UART1_IT_TXE, ENABLE);
 766  0171 4b01          	push	#1
 767  0173 ae0277        	ldw	x,#631
 768  0176 cd0000        	call	_UART1_ITConfig
 770  0179 84            	pop	a
 771  017a               L113:
 772                     ; 155 }
 775  017a 5b0c          	addw	sp,#12
 776  017c 81            	ret
 807                     ; 163 void COMM_Lowlevel_Config()
 807                     ; 164 {
 808                     	switch	.text
 809  017d               _COMM_Lowlevel_Config:
 813                     ; 165 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE);
 815  017d ae0001        	ldw	x,#1
 816  0180 a602          	ld	a,#2
 817  0182 95            	ld	xh,a
 818  0183 cd0000        	call	_CLK_PeripheralClockConfig
 820                     ; 166 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART3, ENABLE);
 822  0186 ae0001        	ldw	x,#1
 823  0189 a603          	ld	a,#3
 824  018b 95            	ld	xh,a
 825  018c cd0000        	call	_CLK_PeripheralClockConfig
 827                     ; 177     UART1_DeInit();
 829  018f cd0000        	call	_UART1_DeInit
 831                     ; 188     UART1_Init((uint32_t)115200, UART1_WORDLENGTH_8D, UART1_STOPBITS_1, UART1_PARITY_NO,
 831                     ; 189                 UART1_SYNCMODE_CLOCK_DISABLE, UART1_MODE_TXRX_ENABLE);
 833  0192 4b0c          	push	#12
 834  0194 4b80          	push	#128
 835  0196 4b00          	push	#0
 836  0198 4b00          	push	#0
 837  019a 4b00          	push	#0
 838  019c aec200        	ldw	x,#49664
 839  019f 89            	pushw	x
 840  01a0 ae0001        	ldw	x,#1
 841  01a3 89            	pushw	x
 842  01a4 cd0000        	call	_UART1_Init
 844  01a7 5b09          	addw	sp,#9
 845                     ; 192     UART1_ITConfig(UART1_IT_TXE | UART1_IT_RXNE, ENABLE);
 847  01a9 4b01          	push	#1
 848  01ab ae0277        	ldw	x,#631
 849  01ae cd0000        	call	_UART1_ITConfig
 851  01b1 84            	pop	a
 852                     ; 197 	UART3_DeInit();
 854  01b2 cd0000        	call	_UART3_DeInit
 856                     ; 199 	UART3_Init((uint32_t)115200, UART3_WORDLENGTH_8D, UART3_STOPBITS_1, UART3_PARITY_NO,
 856                     ; 200 		UART3_MODE_TX_ENABLE);
 858  01b5 4b04          	push	#4
 859  01b7 4b00          	push	#0
 860  01b9 4b00          	push	#0
 861  01bb 4b00          	push	#0
 862  01bd aec200        	ldw	x,#49664
 863  01c0 89            	pushw	x
 864  01c1 ae0001        	ldw	x,#1
 865  01c4 89            	pushw	x
 866  01c5 cd0000        	call	_UART3_Init
 868  01c8 5b08          	addw	sp,#8
 869                     ; 203 	UART3_ITConfig(UART3_IT_TXE, ENABLE);
 871  01ca 4b01          	push	#1
 872  01cc ae0277        	ldw	x,#631
 873  01cf cd0000        	call	_UART3_ITConfig
 875  01d2 84            	pop	a
 876                     ; 206 }
 879  01d3 81            	ret
 905                     ; 209 void COMM_Init()
 905                     ; 210 {
 906                     	switch	.text
 907  01d4               _COMM_Init:
 911                     ; 212 	l_TxRBuf.read = 0;
 913  01d4 3f9a          	clr	_l_TxRBuf+50
 914                     ; 213 	l_TxRBuf.write = 0;
 916  01d6 3f9b          	clr	_l_TxRBuf+51
 917                     ; 214 	l_RxRBuf.read = 0;
 919  01d8 3f66          	clr	_l_RxRBuf+50
 920                     ; 215 	l_RxRBuf.write = 0;
 922  01da 3f67          	clr	_l_RxRBuf+51
 923                     ; 217 	COMM_Lowlevel_Config();
 925  01dc ad9f          	call	_COMM_Lowlevel_Config
 927                     ; 218 }
 930  01de 81            	ret
1006                     	xdef	_COMM_FormFrame
1007                     	switch	.ubsct
1008  0000               _l_TxRBuf_Dbg:
1009  0000 000000000000  	ds.b	52
1010                     	xdef	_l_TxRBuf_Dbg
1011  0034               _l_RxRBuf:
1012  0034 000000000000  	ds.b	52
1013                     	xdef	_l_RxRBuf
1014  0068               _l_TxRBuf:
1015  0068 000000000000  	ds.b	52
1016                     	xdef	_l_TxRBuf
1017                     	xdef	_COMM_RequestSendCommand
1018                     	xdef	_COMM_Lowlevel_Config
1019                     	xdef	_COMM_Init
1020                     	xdef	_CalChecksum
1021                     	xref	_assert_failed
1022                     	xref	_UART3_ITConfig
1023                     	xref	_UART3_Init
1024                     	xref	_UART3_DeInit
1025                     	xref	_UART1_ITConfig
1026                     	xref	_UART1_Init
1027                     	xref	_UART1_DeInit
1028                     	xref	_CLK_PeripheralClockConfig
1029                     	switch	.const
1030  0018               L122:
1031  0018 2e2e5c617070  	dc.b	"..\app\comm.c",0
1051                     	end

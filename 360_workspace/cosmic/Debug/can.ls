   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	switch	.bss
  16  0000               L12_msg:
  17  0000 000000000000  	ds.b	13
  98                     ; 51 void CAN_Process(void)
  98                     ; 52 {
 100                     	switch	.text
 101  0000               _CAN_Process:
 103  0000 89            	pushw	x
 104       00000002      OFST:	set	2
 107                     ; 54 	int ret = 0;
 109                     ; 57 	if(-1 == CAN_GetMsg(&msg))	{
 111  0001 ae0000        	ldw	x,#L12_msg
 112  0004 cd025c        	call	_CAN_GetMsg
 114  0007 a3ffff        	cpw	x,#65535
 115  000a 270c          	jreq	L6
 116                     ; 58 		return;
 118                     ; 62 	ret = CAN_HandleMsg(&msg);
 120  000c ae0000        	ldw	x,#L12_msg
 121  000f ad10          	call	L51_CAN_HandleMsg
 123  0011 1f01          	ldw	(OFST-1,sp),x
 124                     ; 63 	if(-1 == ret) {
 126  0013 1e01          	ldw	x,(OFST-1,sp)
 127  0015 a3ffff        	cpw	x,#65535
 128                     ; 69 }
 129  0018               L6:
 132  0018 85            	popw	x
 133  0019 81            	ret
 158                     ; 75 void CAN_Initialize(void)
 158                     ; 76 {
 159                     	switch	.text
 160  001a               _CAN_Initialize:
 164                     ; 78 	CAN_InitMsgQueue();
 166  001a cd014f        	call	L5_CAN_InitMsgQueue
 168                     ; 81 	CAN_LowConfig();
 170  001d cd0368        	call	L7_CAN_LowConfig
 172                     ; 82 }
 175  0020 81            	ret
 287                     .const:	section	.text
 288  0000               L02:
 289  0000 00000112      	dc.l	274
 290  0004               L22:
 291  0004 00000113      	dc.l	275
 292                     ; 90 int CAN_HandleMsg(tCAN_MSG *ptMsg)
 292                     ; 91 {
 293                     	switch	.text
 294  0021               L51_CAN_HandleMsg:
 296  0021 89            	pushw	x
 297  0022 520d          	subw	sp,#13
 298       0000000d      OFST:	set	13
 301                     ; 92 	assert_param(ptMsg != (void*)0);
 303  0024 a30000        	cpw	x,#0
 304  0027 2703          	jreq	L41
 305  0029 4f            	clr	a
 306  002a 2010          	jra	L61
 307  002c               L41:
 308  002c ae005c        	ldw	x,#92
 309  002f 89            	pushw	x
 310  0030 ae0000        	ldw	x,#0
 311  0033 89            	pushw	x
 312  0034 ae0014        	ldw	x,#L351
 313  0037 cd0000        	call	_assert_failed
 315  003a 5b04          	addw	sp,#4
 316  003c               L61:
 317                     ; 93 	if(ptMsg == (void*)0)
 319  003c 1e0e          	ldw	x,(OFST+1,sp)
 320  003e 2605          	jrne	L551
 321                     ; 95 		return -1;
 323  0040 aeffff        	ldw	x,#65535
 325  0043 201d          	jra	L42
 326  0045               L551:
 327                     ; 99 	if((ptMsg->u32ID != ID_DIST) && (ptMsg->u32ID != ID_WARN))
 329  0045 1e0e          	ldw	x,(OFST+1,sp)
 330  0047 cd0000        	call	c_ltor
 332  004a ae0000        	ldw	x,#L02
 333  004d cd0000        	call	c_lcmp
 335  0050 2713          	jreq	L751
 337  0052 1e0e          	ldw	x,(OFST+1,sp)
 338  0054 cd0000        	call	c_ltor
 340  0057 ae0004        	ldw	x,#L22
 341  005a cd0000        	call	c_lcmp
 343  005d 2706          	jreq	L751
 344                     ; 101 		return -1;
 346  005f aeffff        	ldw	x,#65535
 348  0062               L42:
 350  0062 5b0f          	addw	sp,#15
 351  0064 81            	ret
 352  0065               L751:
 353                     ; 110 	if(ptMsg->u32ID == ID_DIST)
 355  0065 1e0e          	ldw	x,(OFST+1,sp)
 356  0067 cd0000        	call	c_ltor
 358  006a ae0000        	ldw	x,#L02
 359  006d cd0000        	call	c_lcmp
 361  0070 2648          	jrne	L161
 362                     ; 119 		u16 u16Distance = 0; 
 364                     ; 120 		float fRealDistance = 0;
 366                     ; 122 		u16Distance = ((u16)(ptMsg->Data[0]) << 8) | ptMsg->Data[1];
 368  0072 1e0e          	ldw	x,(OFST+1,sp)
 369  0074 e605          	ld	a,(5,x)
 370  0076 5f            	clrw	x
 371  0077 97            	ld	xl,a
 372  0078 160e          	ldw	y,(OFST+1,sp)
 373  007a 90e606        	ld	a,(6,y)
 374  007d 02            	rlwa	x,a
 375  007e 1f05          	ldw	(OFST-8,sp),x
 376                     ; 123 		fRealDistance = K_SCALE * u16Distance + D_OFFSET;
 378  0080 1e05          	ldw	x,(OFST-8,sp)
 379  0082 cd0000        	call	c_uitof
 381  0085 ae0010        	ldw	x,#L761
 382  0088 cd0000        	call	c_fmul
 384                     ; 126 		tCmd.head = CMD_HEAD; /*消息头，0x55*/
 386  008b a655          	ld	a,#85
 387  008d 6b07          	ld	(OFST-6,sp),a
 388                     ; 127 		tCmd.cmd = FCW_DISTANCE;	/*距离信息*/
 390  008f a60f          	ld	a,#15
 391  0091 6b08          	ld	(OFST-5,sp),a
 392                     ; 128 		tCmd.param[0] = ptMsg->Data[0];	/*高8位*/
 394  0093 1e0e          	ldw	x,(OFST+1,sp)
 395  0095 e605          	ld	a,(5,x)
 396  0097 6b09          	ld	(OFST-4,sp),a
 397                     ; 129 		tCmd.param[1] = ptMsg->Data[1]; /*低8位*/
 399  0099 1e0e          	ldw	x,(OFST+1,sp)
 400  009b e606          	ld	a,(6,x)
 401  009d 6b0a          	ld	(OFST-3,sp),a
 402                     ; 130 		tCmd.param[2] = 0;
 404  009f 0f0b          	clr	(OFST-2,sp)
 405                     ; 131 		tCmd.param[3] = 0;
 407  00a1 0f0c          	clr	(OFST-1,sp)
 408                     ; 132 		tCmd.checksum = CalChecksum((u8*)&tCmd, sizeof(tMSG_CMD) - 1);
 410  00a3 4b06          	push	#6
 411  00a5 96            	ldw	x,sp
 412  00a6 1c0008        	addw	x,#OFST-5
 413  00a9 cd0000        	call	_CalChecksum
 415  00ac 5b01          	addw	sp,#1
 416  00ae 6b0d          	ld	(OFST+0,sp),a
 417                     ; 135 		COMM_RequestSendCommand_CAN(&tCmd);
 419  00b0 96            	ldw	x,sp
 420  00b1 1c0007        	addw	x,#OFST-6
 421  00b4 cd0000        	call	_COMM_RequestSendCommand_CAN
 423                     ; 142 		return 0;
 425  00b7 5f            	clrw	x
 427  00b8 20a8          	jra	L42
 428  00ba               L161:
 429                     ; 146 	if(ptMsg->u32ID == ID_WARN)
 431  00ba 1e0e          	ldw	x,(OFST+1,sp)
 432  00bc cd0000        	call	c_ltor
 434  00bf ae0004        	ldw	x,#L22
 435  00c2 cd0000        	call	c_lcmp
 437  00c5 262d          	jrne	L371
 438                     ; 152 		tCmd.head = CMD_HEAD; /*消息头，0x55*/
 440  00c7 a655          	ld	a,#85
 441  00c9 6b07          	ld	(OFST-6,sp),a
 442                     ; 153 		tCmd.cmd = FCW_WARNING;	/*报警等级*/
 444  00cb a610          	ld	a,#16
 445  00cd 6b08          	ld	(OFST-5,sp),a
 446                     ; 154 		tCmd.param[0] = ptMsg->Data[1]; 
 448  00cf 1e0e          	ldw	x,(OFST+1,sp)
 449  00d1 e606          	ld	a,(6,x)
 450  00d3 6b09          	ld	(OFST-4,sp),a
 451                     ; 155 		tCmd.param[1] = 0; 
 453  00d5 0f0a          	clr	(OFST-3,sp)
 454                     ; 156 		tCmd.param[2] = 0;
 456  00d7 0f0b          	clr	(OFST-2,sp)
 457                     ; 157 		tCmd.param[3] = 0;
 459  00d9 0f0c          	clr	(OFST-1,sp)
 460                     ; 158 		tCmd.checksum = CalChecksum((u8*)&tCmd, sizeof(tMSG_CMD) - 1);
 462  00db 4b06          	push	#6
 463  00dd 96            	ldw	x,sp
 464  00de 1c0008        	addw	x,#OFST-5
 465  00e1 cd0000        	call	_CalChecksum
 467  00e4 5b01          	addw	sp,#1
 468  00e6 6b0d          	ld	(OFST+0,sp),a
 469                     ; 161 		COMM_RequestSendCommand_CAN(&tCmd);
 471  00e8 96            	ldw	x,sp
 472  00e9 1c0007        	addw	x,#OFST-6
 473  00ec cd0000        	call	_COMM_RequestSendCommand_CAN
 475                     ; 167 		return 0;
 477  00ef 5f            	clrw	x
 479  00f0 ac620062      	jpf	L42
 480  00f4               L371:
 481                     ; 170 	return -1;
 483  00f4 aeffff        	ldw	x,#65535
 485  00f7 ac620062      	jpf	L42
 523                     ; 180 static void CAN_ClearMsg(tCAN_MSG *ptCAN_Msg)
 523                     ; 181 {		
 524                     	switch	.text
 525  00fb               L571_CAN_ClearMsg:
 527  00fb 89            	pushw	x
 528       00000000      OFST:	set	0
 531                     ; 182 	assert_param(ptCAN_Msg != (void*)0);
 533  00fc a30000        	cpw	x,#0
 534  00ff 2703          	jreq	L03
 535  0101 4f            	clr	a
 536  0102 2010          	jra	L23
 537  0104               L03:
 538  0104 ae00b6        	ldw	x,#182
 539  0107 89            	pushw	x
 540  0108 ae0000        	ldw	x,#0
 541  010b 89            	pushw	x
 542  010c ae0014        	ldw	x,#L351
 543  010f cd0000        	call	_assert_failed
 545  0112 5b04          	addw	sp,#4
 546  0114               L23:
 547                     ; 184 	if(ptCAN_Msg == (void*)0)
 549  0114 1e01          	ldw	x,(OFST+1,sp)
 550  0116 2735          	jreq	L43
 551                     ; 186 		return;
 553                     ; 189 	ptCAN_Msg->Data[0] = 0;	
 555  0118 1e01          	ldw	x,(OFST+1,sp)
 556  011a 6f05          	clr	(5,x)
 557                     ; 190 	ptCAN_Msg->Data[1] = 0;	
 559  011c 1e01          	ldw	x,(OFST+1,sp)
 560  011e 6f06          	clr	(6,x)
 561                     ; 191 	ptCAN_Msg->Data[2] = 0;	
 563  0120 1e01          	ldw	x,(OFST+1,sp)
 564  0122 6f07          	clr	(7,x)
 565                     ; 192 	ptCAN_Msg->Data[3] = 0;	
 567  0124 1e01          	ldw	x,(OFST+1,sp)
 568  0126 6f08          	clr	(8,x)
 569                     ; 193 	ptCAN_Msg->Data[4] = 0;	
 571  0128 1e01          	ldw	x,(OFST+1,sp)
 572  012a 6f09          	clr	(9,x)
 573                     ; 194 	ptCAN_Msg->Data[5] = 0;	
 575  012c 1e01          	ldw	x,(OFST+1,sp)
 576  012e 6f0a          	clr	(10,x)
 577                     ; 195 	ptCAN_Msg->Data[6] = 0;	
 579  0130 1e01          	ldw	x,(OFST+1,sp)
 580  0132 6f0b          	clr	(11,x)
 581                     ; 196 	ptCAN_Msg->Data[7] = 0;	
 583  0134 1e01          	ldw	x,(OFST+1,sp)
 584  0136 6f0c          	clr	(12,x)
 585                     ; 198 	ptCAN_Msg->u32ID = 0;		
 587  0138 1e01          	ldw	x,(OFST+1,sp)
 588  013a a600          	ld	a,#0
 589  013c e703          	ld	(3,x),a
 590  013e a600          	ld	a,#0
 591  0140 e702          	ld	(2,x),a
 592  0142 a600          	ld	a,#0
 593  0144 e701          	ld	(1,x),a
 594  0146 a600          	ld	a,#0
 595  0148 f7            	ld	(x),a
 596                     ; 199 	ptCAN_Msg->u8DLC = 0;	
 598  0149 1e01          	ldw	x,(OFST+1,sp)
 599  014b 6f04          	clr	(4,x)
 600                     ; 200 }
 601  014d               L43:
 604  014d 85            	popw	x
 605  014e 81            	ret
 639                     ; 205 void CAN_InitMsgQueue(void)
 639                     ; 206 {
 640                     	switch	.text
 641  014f               L5_CAN_InitMsgQueue:
 643  014f 89            	pushw	x
 644       00000002      OFST:	set	2
 647                     ; 207 	u16 i = 0;
 649                     ; 209 	for(i = 0; i < CAN_MSG_QUEUE_LEN; i++)
 651  0150 5f            	clrw	x
 652  0151 1f01          	ldw	(OFST-1,sp),x
 653  0153               L532:
 654                     ; 211 		CAN_ClearMsg(&l_tMsgQ.m_Queue[i]);	/*清空数据内容*/
 656  0153 1e01          	ldw	x,(OFST-1,sp)
 657  0155 90ae000d      	ldw	y,#13
 658  0159 cd0000        	call	c_imul
 660  015c 1c000d        	addw	x,#L3_l_tMsgQ
 661  015f ad9a          	call	L571_CAN_ClearMsg
 663                     ; 212 		l_tMsgQ.m_Valid[i] = MSG_INVALID;	/*清空数据有效标志*/
 665  0161 1e01          	ldw	x,(OFST-1,sp)
 666  0163 724f0297      	clr	(L3_l_tMsgQ+650,x)
 667                     ; 209 	for(i = 0; i < CAN_MSG_QUEUE_LEN; i++)
 669  0167 1e01          	ldw	x,(OFST-1,sp)
 670  0169 1c0001        	addw	x,#1
 671  016c 1f01          	ldw	(OFST-1,sp),x
 674  016e 1e01          	ldw	x,(OFST-1,sp)
 675  0170 a30032        	cpw	x,#50
 676  0173 25de          	jrult	L532
 677                     ; 215 	l_tMsgQ.m_u16Read = 0;
 679  0175 5f            	clrw	x
 680  0176 cf02cb        	ldw	L3_l_tMsgQ+702,x
 681                     ; 216 	l_tMsgQ.m_u16Write = 0;
 683  0179 5f            	clrw	x
 684  017a cf02c9        	ldw	L3_l_tMsgQ+700,x
 685                     ; 217 }
 688  017d 85            	popw	x
 689  017e 81            	ret
 741                     ; 225 int CAN_AddMsg(tCAN_MSG *ptCAN_MSG)
 741                     ; 226 {
 742                     	switch	.text
 743  017f               _CAN_AddMsg:
 745  017f 89            	pushw	x
 746  0180 89            	pushw	x
 747       00000002      OFST:	set	2
 750                     ; 229 	assert_param(ptCAN_MSG != (void*)0);
 752  0181 a30000        	cpw	x,#0
 753  0184 2703          	jreq	L24
 754  0186 4f            	clr	a
 755  0187 2010          	jra	L44
 756  0189               L24:
 757  0189 ae00e5        	ldw	x,#229
 758  018c 89            	pushw	x
 759  018d ae0000        	ldw	x,#0
 760  0190 89            	pushw	x
 761  0191 ae0014        	ldw	x,#L351
 762  0194 cd0000        	call	_assert_failed
 764  0197 5b04          	addw	sp,#4
 765  0199               L44:
 766                     ; 231 	if(ptCAN_MSG == (void*)0)
 768  0199 1e03          	ldw	x,(OFST+1,sp)
 769  019b 2605          	jrne	L372
 770                     ; 233 		return -1;
 772  019d aeffff        	ldw	x,#65535
 774  01a0 201f          	jra	L64
 775  01a2               L372:
 776                     ; 236 	CAN_RX_DISABLE
 778  01a2 4b00          	push	#0
 779  01a4 ae0002        	ldw	x,#2
 780  01a7 cd0000        	call	_CAN_ITConfig
 782  01aa 84            	pop	a
 783                     ; 238 	if(l_tMsgQ.m_Valid[l_tMsgQ.m_u16Write] == MSG_VALID)
 785  01ab ce02c9        	ldw	x,L3_l_tMsgQ+700
 786  01ae d60297        	ld	a,(L3_l_tMsgQ+650,x)
 787  01b1 a101          	cp	a,#1
 788  01b3 260f          	jrne	L772
 789                     ; 240 			CAN_RX_ENABLE
 791  01b5 4b01          	push	#1
 792  01b7 ae0002        	ldw	x,#2
 793  01ba cd0000        	call	_CAN_ITConfig
 795  01bd 84            	pop	a
 796                     ; 241 			return -1;
 798  01be aeffff        	ldw	x,#65535
 800  01c1               L64:
 802  01c1 5b04          	addw	sp,#4
 803  01c3 81            	ret
 804  01c4               L772:
 805                     ; 244 	ptMsg =	&l_tMsgQ.m_Queue[l_tMsgQ.m_u16Write];
 807  01c4 ce02c9        	ldw	x,L3_l_tMsgQ+700
 808  01c7 90ae000d      	ldw	y,#13
 809  01cb cd0000        	call	c_imul
 811  01ce 1c000d        	addw	x,#L3_l_tMsgQ
 812  01d1 1f01          	ldw	(OFST-1,sp),x
 813                     ; 246 	ptMsg->u32ID = ptCAN_MSG->u32ID;
 815  01d3 1e03          	ldw	x,(OFST+1,sp)
 816  01d5 1601          	ldw	y,(OFST-1,sp)
 817  01d7 e603          	ld	a,(3,x)
 818  01d9 90e703        	ld	(3,y),a
 819  01dc e602          	ld	a,(2,x)
 820  01de 90e702        	ld	(2,y),a
 821  01e1 e601          	ld	a,(1,x)
 822  01e3 90e701        	ld	(1,y),a
 823  01e6 f6            	ld	a,(x)
 824  01e7 90f7          	ld	(y),a
 825                     ; 247 	ptMsg->u8DLC = ptCAN_MSG->u8DLC;
 827  01e9 1e03          	ldw	x,(OFST+1,sp)
 828  01eb e604          	ld	a,(4,x)
 829  01ed 1e01          	ldw	x,(OFST-1,sp)
 830  01ef e704          	ld	(4,x),a
 831                     ; 249 	ptMsg->Data[0] = ptCAN_MSG->Data[0];
 833  01f1 1e03          	ldw	x,(OFST+1,sp)
 834  01f3 e605          	ld	a,(5,x)
 835  01f5 1e01          	ldw	x,(OFST-1,sp)
 836  01f7 e705          	ld	(5,x),a
 837                     ; 250 	ptMsg->Data[1] = ptCAN_MSG->Data[1];
 839  01f9 1e03          	ldw	x,(OFST+1,sp)
 840  01fb e606          	ld	a,(6,x)
 841  01fd 1e01          	ldw	x,(OFST-1,sp)
 842  01ff e706          	ld	(6,x),a
 843                     ; 251 	ptMsg->Data[2] = ptCAN_MSG->Data[2];
 845  0201 1e03          	ldw	x,(OFST+1,sp)
 846  0203 e607          	ld	a,(7,x)
 847  0205 1e01          	ldw	x,(OFST-1,sp)
 848  0207 e707          	ld	(7,x),a
 849                     ; 252 	ptMsg->Data[3] = ptCAN_MSG->Data[3];
 851  0209 1e03          	ldw	x,(OFST+1,sp)
 852  020b e608          	ld	a,(8,x)
 853  020d 1e01          	ldw	x,(OFST-1,sp)
 854  020f e708          	ld	(8,x),a
 855                     ; 253 	ptMsg->Data[4] = ptCAN_MSG->Data[4];
 857  0211 1e03          	ldw	x,(OFST+1,sp)
 858  0213 e609          	ld	a,(9,x)
 859  0215 1e01          	ldw	x,(OFST-1,sp)
 860  0217 e709          	ld	(9,x),a
 861                     ; 254 	ptMsg->Data[5] = ptCAN_MSG->Data[5];
 863  0219 1e03          	ldw	x,(OFST+1,sp)
 864  021b e60a          	ld	a,(10,x)
 865  021d 1e01          	ldw	x,(OFST-1,sp)
 866  021f e70a          	ld	(10,x),a
 867                     ; 255 	ptMsg->Data[6] = ptCAN_MSG->Data[6];
 869  0221 1e03          	ldw	x,(OFST+1,sp)
 870  0223 e60b          	ld	a,(11,x)
 871  0225 1e01          	ldw	x,(OFST-1,sp)
 872  0227 e70b          	ld	(11,x),a
 873                     ; 256 	ptMsg->Data[7] = ptCAN_MSG->Data[7];
 875  0229 1e03          	ldw	x,(OFST+1,sp)
 876  022b e60c          	ld	a,(12,x)
 877  022d 1e01          	ldw	x,(OFST-1,sp)
 878  022f e70c          	ld	(12,x),a
 879                     ; 258 	l_tMsgQ.m_Valid[l_tMsgQ.m_u16Write] = MSG_VALID;
 881  0231 ce02c9        	ldw	x,L3_l_tMsgQ+700
 882  0234 a601          	ld	a,#1
 883  0236 d70297        	ld	(L3_l_tMsgQ+650,x),a
 884                     ; 260 	l_tMsgQ.m_u16Write++;
 886  0239 ce02c9        	ldw	x,L3_l_tMsgQ+700
 887  023c 1c0001        	addw	x,#1
 888  023f cf02c9        	ldw	L3_l_tMsgQ+700,x
 889                     ; 261 	if(l_tMsgQ.m_u16Write >= CAN_MSG_QUEUE_LEN)
 891  0242 ce02c9        	ldw	x,L3_l_tMsgQ+700
 892  0245 a30032        	cpw	x,#50
 893  0248 2504          	jrult	L703
 894                     ; 263 		l_tMsgQ.m_u16Write = 0;
 896  024a 5f            	clrw	x
 897  024b cf02c9        	ldw	L3_l_tMsgQ+700,x
 898  024e               L703:
 899                     ; 266 	CAN_RX_ENABLE
 901  024e 4b01          	push	#1
 902  0250 ae0002        	ldw	x,#2
 903  0253 cd0000        	call	_CAN_ITConfig
 905  0256 84            	pop	a
 906                     ; 268 	return 0;
 908  0257 5f            	clrw	x
 910  0258 acc101c1      	jpf	L64
 962                     ; 278 int CAN_GetMsg(tCAN_MSG *ptCAN_MSG)
 962                     ; 279 {
 963                     	switch	.text
 964  025c               _CAN_GetMsg:
 966  025c 89            	pushw	x
 967  025d 89            	pushw	x
 968       00000002      OFST:	set	2
 971                     ; 282 	assert_param(ptCAN_MSG != (void*)0);
 973  025e a30000        	cpw	x,#0
 974  0261 2703          	jreq	L25
 975  0263 4f            	clr	a
 976  0264 2010          	jra	L45
 977  0266               L25:
 978  0266 ae011a        	ldw	x,#282
 979  0269 89            	pushw	x
 980  026a ae0000        	ldw	x,#0
 981  026d 89            	pushw	x
 982  026e ae0014        	ldw	x,#L351
 983  0271 cd0000        	call	_assert_failed
 985  0274 5b04          	addw	sp,#4
 986  0276               L45:
 987                     ; 284 	if(ptCAN_MSG == (void*)0)
 989  0276 1e03          	ldw	x,(OFST+1,sp)
 990  0278 2605          	jrne	L343
 991                     ; 286 		return -1;
 993  027a aeffff        	ldw	x,#65535
 995  027d 201e          	jra	L65
 996  027f               L343:
 997                     ; 289 	CAN_RX_DISABLE	
 999  027f 4b00          	push	#0
1000  0281 ae0002        	ldw	x,#2
1001  0284 cd0000        	call	_CAN_ITConfig
1003  0287 84            	pop	a
1004                     ; 291 	if(l_tMsgQ.m_Valid[l_tMsgQ.m_u16Read] == MSG_INVALID)
1006  0288 ce02cb        	ldw	x,L3_l_tMsgQ+702
1007  028b 724d0297      	tnz	(L3_l_tMsgQ+650,x)
1008  028f 260f          	jrne	L743
1009                     ; 293 			CAN_RX_ENABLE
1011  0291 4b01          	push	#1
1012  0293 ae0002        	ldw	x,#2
1013  0296 cd0000        	call	_CAN_ITConfig
1015  0299 84            	pop	a
1016                     ; 294 			return -1;
1018  029a aeffff        	ldw	x,#65535
1020  029d               L65:
1022  029d 5b04          	addw	sp,#4
1023  029f 81            	ret
1024  02a0               L743:
1025                     ; 297 	ptMsg = &l_tMsgQ.m_Queue[l_tMsgQ.m_u16Read];
1027  02a0 ce02cb        	ldw	x,L3_l_tMsgQ+702
1028  02a3 90ae000d      	ldw	y,#13
1029  02a7 cd0000        	call	c_imul
1031  02aa 1c000d        	addw	x,#L3_l_tMsgQ
1032  02ad 1f01          	ldw	(OFST-1,sp),x
1033                     ; 299 	ptCAN_MSG->u32ID = ptMsg->u32ID;
1035  02af 1e01          	ldw	x,(OFST-1,sp)
1036  02b1 1603          	ldw	y,(OFST+1,sp)
1037  02b3 e603          	ld	a,(3,x)
1038  02b5 90e703        	ld	(3,y),a
1039  02b8 e602          	ld	a,(2,x)
1040  02ba 90e702        	ld	(2,y),a
1041  02bd e601          	ld	a,(1,x)
1042  02bf 90e701        	ld	(1,y),a
1043  02c2 f6            	ld	a,(x)
1044  02c3 90f7          	ld	(y),a
1045                     ; 300 	ptCAN_MSG->u8DLC = ptMsg->u8DLC;
1047  02c5 1e01          	ldw	x,(OFST-1,sp)
1048  02c7 e604          	ld	a,(4,x)
1049  02c9 1e03          	ldw	x,(OFST+1,sp)
1050  02cb e704          	ld	(4,x),a
1051                     ; 302 	ptCAN_MSG->Data[0] = ptMsg->Data[0] ;
1053  02cd 1e01          	ldw	x,(OFST-1,sp)
1054  02cf e605          	ld	a,(5,x)
1055  02d1 1e03          	ldw	x,(OFST+1,sp)
1056  02d3 e705          	ld	(5,x),a
1057                     ; 303 	ptCAN_MSG->Data[1] = ptMsg->Data[1];
1059  02d5 1e01          	ldw	x,(OFST-1,sp)
1060  02d7 e606          	ld	a,(6,x)
1061  02d9 1e03          	ldw	x,(OFST+1,sp)
1062  02db e706          	ld	(6,x),a
1063                     ; 304 	ptCAN_MSG->Data[2] = ptMsg->Data[2];
1065  02dd 1e01          	ldw	x,(OFST-1,sp)
1066  02df e607          	ld	a,(7,x)
1067  02e1 1e03          	ldw	x,(OFST+1,sp)
1068  02e3 e707          	ld	(7,x),a
1069                     ; 305 	ptCAN_MSG->Data[3] = ptMsg->Data[3];
1071  02e5 1e01          	ldw	x,(OFST-1,sp)
1072  02e7 e608          	ld	a,(8,x)
1073  02e9 1e03          	ldw	x,(OFST+1,sp)
1074  02eb e708          	ld	(8,x),a
1075                     ; 306 	ptCAN_MSG->Data[4] = ptMsg->Data[4];
1077  02ed 1e01          	ldw	x,(OFST-1,sp)
1078  02ef e609          	ld	a,(9,x)
1079  02f1 1e03          	ldw	x,(OFST+1,sp)
1080  02f3 e709          	ld	(9,x),a
1081                     ; 307 	ptCAN_MSG->Data[5] = ptMsg->Data[5];
1083  02f5 1e01          	ldw	x,(OFST-1,sp)
1084  02f7 e60a          	ld	a,(10,x)
1085  02f9 1e03          	ldw	x,(OFST+1,sp)
1086  02fb e70a          	ld	(10,x),a
1087                     ; 308 	ptCAN_MSG->Data[6] = ptMsg->Data[6];
1089  02fd 1e01          	ldw	x,(OFST-1,sp)
1090  02ff e60b          	ld	a,(11,x)
1091  0301 1e03          	ldw	x,(OFST+1,sp)
1092  0303 e70b          	ld	(11,x),a
1093                     ; 309 	ptCAN_MSG->Data[7] = ptMsg->Data[7];
1095  0305 1e01          	ldw	x,(OFST-1,sp)
1096  0307 e60c          	ld	a,(12,x)
1097  0309 1e03          	ldw	x,(OFST+1,sp)
1098  030b e70c          	ld	(12,x),a
1099                     ; 311 	l_tMsgQ.m_Valid[l_tMsgQ.m_u16Read] = MSG_INVALID;
1101  030d ce02cb        	ldw	x,L3_l_tMsgQ+702
1102  0310 724f0297      	clr	(L3_l_tMsgQ+650,x)
1103                     ; 313 	l_tMsgQ.m_u16Read++;
1105  0314 ce02cb        	ldw	x,L3_l_tMsgQ+702
1106  0317 1c0001        	addw	x,#1
1107  031a cf02cb        	ldw	L3_l_tMsgQ+702,x
1108                     ; 314 	if(l_tMsgQ.m_u16Read >= CAN_MSG_QUEUE_LEN)
1110  031d ce02cb        	ldw	x,L3_l_tMsgQ+702
1111  0320 a30032        	cpw	x,#50
1112  0323 2504          	jrult	L753
1113                     ; 316 		l_tMsgQ.m_u16Read = 0;
1115  0325 5f            	clrw	x
1116  0326 cf02cb        	ldw	L3_l_tMsgQ+702,x
1117  0329               L753:
1118                     ; 319 	CAN_RX_ENABLE
1120  0329 4b01          	push	#1
1121  032b ae0002        	ldw	x,#2
1122  032e cd0000        	call	_CAN_ITConfig
1124  0331 84            	pop	a
1125                     ; 321 	return 0;
1127  0332 5f            	clrw	x
1129  0333 ac9d029d      	jpf	L65
1153                     ; 331 int CAN_IsMsgQEmpty(void)
1153                     ; 332 {	
1154                     	switch	.text
1155  0337               L11_CAN_IsMsgQEmpty:
1159                     ; 333 	if(l_tMsgQ.m_u16Read == l_tMsgQ.m_u16Write) {
1161  0337 ce02cb        	ldw	x,L3_l_tMsgQ+702
1162  033a c302c9        	cpw	x,L3_l_tMsgQ+700
1163  033d 2604          	jrne	L373
1164                     ; 334 		return 1;
1166  033f ae0001        	ldw	x,#1
1169  0342 81            	ret
1170  0343               L373:
1171                     ; 336 		return 0;
1173  0343 5f            	clrw	x
1176  0344 81            	ret
1209                     ; 346 int CAN_IsMsgQFull(void)
1209                     ; 347 {
1210                     	switch	.text
1211  0345               L31_CAN_IsMsgQFull:
1213  0345 89            	pushw	x
1214       00000002      OFST:	set	2
1217                     ; 348 	u16 i = 0;
1219                     ; 350 	for(i = 0; i < CAN_MSG_QUEUE_LEN; i++)
1221  0346 5f            	clrw	x
1222  0347 1f01          	ldw	(OFST-1,sp),x
1223  0349               L314:
1224                     ; 352 		if(l_tMsgQ.m_Valid[i] == MSG_INVALID) {
1226  0349 1e01          	ldw	x,(OFST-1,sp)
1227  034b 724d0297      	tnz	(L3_l_tMsgQ+650,x)
1228  034f 2603          	jrne	L124
1229                     ; 353 			return 0;
1231  0351 5f            	clrw	x
1233  0352 2011          	jra	L46
1234  0354               L124:
1235                     ; 350 	for(i = 0; i < CAN_MSG_QUEUE_LEN; i++)
1237  0354 1e01          	ldw	x,(OFST-1,sp)
1238  0356 1c0001        	addw	x,#1
1239  0359 1f01          	ldw	(OFST-1,sp),x
1242  035b 1e01          	ldw	x,(OFST-1,sp)
1243  035d a30032        	cpw	x,#50
1244  0360 25e7          	jrult	L314
1245                     ; 357 	return 1;
1247  0362 ae0001        	ldw	x,#1
1249  0365               L46:
1251  0365 5b02          	addw	sp,#2
1252  0367 81            	ret
1961                     ; 371 void CAN_LowConfig(void)
1961                     ; 372 {
1962                     	switch	.text
1963  0368               L7_CAN_LowConfig:
1965  0368 5213          	subw	sp,#19
1966       00000013      OFST:	set	19
1969                     ; 373 	CAN_InitStatus_TypeDef status = CAN_InitStatus_Failed;
1971                     ; 395 	u8 CAN_Prescaler = 0; 
1973                     ; 398 	CAN_DeInit();
1975  036a cd0000        	call	_CAN_DeInit
1977                     ; 401 	CAN_MasterCtrl=CAN_MasterCtrl_AllDisabled;
1979                     ; 402 	CAN_Mode = CAN_Mode_Normal;
1981                     ; 403 	CAN_SynJumpWidth = CAN_SynJumpWidth_1TimeQuantum;
1983                     ; 404 	CAN_BitSeg1 = CAN_BitSeg1_8TimeQuantum;
1985                     ; 405 	CAN_BitSeg2 = CAN_BitSeg2_7TimeQuantum;
1987                     ; 407 	CAN_Prescaler = 2; //500 bps，苏州清华协议波特率
1989                     ; 410 	status = CAN_Init(CAN_MasterCtrl,CAN_Mode,CAN_SynJumpWidth,
1989                     ; 411 						CAN_BitSeg1,CAN_BitSeg2,CAN_Prescaler);
1991  036d 4b02          	push	#2
1992  036f 4b60          	push	#96
1993  0371 4b07          	push	#7
1994  0373 4b00          	push	#0
1995  0375 5f            	clrw	x
1996  0376 4f            	clr	a
1997  0377 95            	ld	xh,a
1998  0378 cd0000        	call	_CAN_Init
2000  037b 5b04          	addw	sp,#4
2001  037d 6b01          	ld	(OFST-18,sp),a
2002                     ; 412 	assert_param(status == CAN_InitStatus_Success);
2004  037f 7b01          	ld	a,(OFST-18,sp)
2005  0381 a101          	cp	a,#1
2006  0383 2603          	jrne	L07
2007  0385 4f            	clr	a
2008  0386 2010          	jra	L27
2009  0388               L07:
2010  0388 ae019c        	ldw	x,#412
2011  038b 89            	pushw	x
2012  038c ae0000        	ldw	x,#0
2013  038f 89            	pushw	x
2014  0390 ae0014        	ldw	x,#L351
2015  0393 cd0000        	call	_assert_failed
2017  0396 5b04          	addw	sp,#4
2018  0398               L27:
2019                     ; 415 	CAN_FilterNumber = 0;
2021                     ; 416 	CAN_FilterActivation = ENABLE;
2023                     ; 417 	CAN_FilterMode = CAN_FilterMode_IdMask;
2025                     ; 418 	CAN_FilterScale = CAN_FilterScale_32Bit;
2027                     ; 419 	CAN_FilterID1=0;  
2029                     ; 420 	CAN_FilterID2=0;
2031                     ; 421 	CAN_FilterID3=0;
2033                     ; 422 	CAN_FilterID4=0;
2035                     ; 423 	CAN_FilterIDMask1=0;
2037                     ; 424 	CAN_FilterIDMask2=0;
2039                     ; 425 	CAN_FilterIDMask3=0;
2041                     ; 426 	CAN_FilterIDMask4=0;  
2043                     ; 427 	CAN_FilterInit(CAN_FilterNumber, CAN_FilterActivation, CAN_FilterMode, 
2043                     ; 428 					CAN_FilterScale,CAN_FilterID1, CAN_FilterID2, CAN_FilterID3, 
2043                     ; 429 					CAN_FilterID4,CAN_FilterIDMask1, CAN_FilterIDMask2, 
2043                     ; 430 					CAN_FilterIDMask3, CAN_FilterIDMask4
2043                     ; 431 					);
2045  0398 4b00          	push	#0
2046  039a 4b00          	push	#0
2047  039c 4b00          	push	#0
2048  039e 4b00          	push	#0
2049  03a0 4b00          	push	#0
2050  03a2 4b00          	push	#0
2051  03a4 4b00          	push	#0
2052  03a6 4b00          	push	#0
2053  03a8 4b06          	push	#6
2054  03aa 4b00          	push	#0
2055  03ac ae0001        	ldw	x,#1
2056  03af 4f            	clr	a
2057  03b0 95            	ld	xh,a
2058  03b1 cd0000        	call	_CAN_FilterInit
2060  03b4 5b0a          	addw	sp,#10
2061                     ; 434 	GPIO_Init(GPIO_CANSTB_PORT, (GPIO_Pin_TypeDef)GPIO_CANSTB_PIN, 
2061                     ; 435 		GPIO_MODE_OUT_PP_HIGH_FAST);
2063  03b6 4bf0          	push	#240
2064  03b8 4b10          	push	#16
2065  03ba ae500a        	ldw	x,#20490
2066  03bd cd0000        	call	_GPIO_Init
2068  03c0 85            	popw	x
2069                     ; 437 	GPIO_WriteLow(GPIO_CANSTB_PORT, GPIO_CANSTB_PIN);	
2071  03c1 4b10          	push	#16
2072  03c3 ae500a        	ldw	x,#20490
2073  03c6 cd0000        	call	_GPIO_WriteLow
2075  03c9 84            	pop	a
2076                     ; 441 	CAN_ITConfig(CAN_IT_FMP, ENABLE);
2078  03ca 4b01          	push	#1
2079  03cc ae0002        	ldw	x,#2
2080  03cf cd0000        	call	_CAN_ITConfig
2082  03d2 84            	pop	a
2083                     ; 443 }
2086  03d3 5b13          	addw	sp,#19
2087  03d5 81            	ret
2090                     	switch	.const
2091  0008               L367_Tx_Data:
2092  0008 00            	dc.b	0
2093  0009 000000000000  	ds.b	7
2094                     	switch	.data
2095  0000               L567_index:
2096  0000 00            	dc.b	0
2097  0001               L767_errCnt:
2098  0001 0000          	dc.w	0
2099  0003               L177_okCnt:
2100  0003 0000          	dc.w	0
2308                     ; 488 void CAN_TestSend(void)
2308                     ; 489 {
2309                     	switch	.text
2310  03d6               _CAN_TestSend:
2312  03d6 5210          	subw	sp,#16
2313       00000010      OFST:	set	16
2316                     ; 491 CAN_TxStatus_TypeDef status = CAN_TxStatus_Failed;
2318                     ; 494 CAN_Id_TypeDef Tx_IDE = CAN_Id_Standard;
2320                     ; 495 CAN_RTR_TypeDef Tx_RTR = CAN_RTR_Data;
2322                     ; 496 uint8_t Tx_DLC = 0;
2324                     ; 497 uint8_t Tx_Data[8] = {0};
2326  03d8 96            	ldw	x,sp
2327  03d9 1c0009        	addw	x,#OFST-7
2328  03dc 90ae0008      	ldw	y,#L367_Tx_Data
2329  03e0 a608          	ld	a,#8
2330  03e2 cd0000        	call	c_xymvx
2332                     ; 498 uint32_t Tx_Id = 0;
2334                     ; 506 	 Tx_Id = 0x31;
2336                     ; 507 	 Tx_IDE = CAN_Id_Standard;
2338                     ; 508 	 Tx_RTR = CAN_RTR_Data;
2340                     ; 509 	 Tx_DLC = 8;
2342                     ; 510 	 Tx_Data[0] = index++;
2344  03e5 c60000        	ld	a,L567_index
2345  03e8 725c0000      	inc	L567_index
2346  03ec 6b09          	ld	(OFST-7,sp),a
2347                     ; 511 	 Tx_Data[1] = index++;
2349  03ee c60000        	ld	a,L567_index
2350  03f1 725c0000      	inc	L567_index
2351  03f5 6b0a          	ld	(OFST-6,sp),a
2352                     ; 512 	 Tx_Data[2] = index++;
2354  03f7 c60000        	ld	a,L567_index
2355  03fa 725c0000      	inc	L567_index
2356  03fe 6b0b          	ld	(OFST-5,sp),a
2357                     ; 513 	 Tx_Data[3] = index++;
2359  0400 c60000        	ld	a,L567_index
2360  0403 725c0000      	inc	L567_index
2361  0407 6b0c          	ld	(OFST-4,sp),a
2362                     ; 514 	 Tx_Data[4] = index++;
2364  0409 c60000        	ld	a,L567_index
2365  040c 725c0000      	inc	L567_index
2366  0410 6b0d          	ld	(OFST-3,sp),a
2367                     ; 515 	 Tx_Data[5] = index++;
2369  0412 c60000        	ld	a,L567_index
2370  0415 725c0000      	inc	L567_index
2371  0419 6b0e          	ld	(OFST-2,sp),a
2372                     ; 516 	 Tx_Data[6] = index++;
2374  041b c60000        	ld	a,L567_index
2375  041e 725c0000      	inc	L567_index
2376  0422 6b0f          	ld	(OFST-1,sp),a
2377                     ; 517 	 Tx_Data[7] = index++;
2379  0424 c60000        	ld	a,L567_index
2380  0427 725c0000      	inc	L567_index
2381  042b 6b10          	ld	(OFST+0,sp),a
2382                     ; 520 	 status = CAN_Transmit(Tx_Id,Tx_IDE,Tx_RTR,Tx_DLC,Tx_Data);
2384  042d 96            	ldw	x,sp
2385  042e 1c0009        	addw	x,#OFST-7
2386  0431 89            	pushw	x
2387  0432 4b08          	push	#8
2388  0434 4b00          	push	#0
2389  0436 4b00          	push	#0
2390  0438 ae0031        	ldw	x,#49
2391  043b 89            	pushw	x
2392  043c ae0000        	ldw	x,#0
2393  043f 89            	pushw	x
2394  0440 cd0000        	call	_CAN_Transmit
2396  0443 5b09          	addw	sp,#9
2397  0445 6b08          	ld	(OFST-8,sp),a
2398                     ; 521 	if(status == CAN_TxStatus_Failed) {
2400  0447 7b08          	ld	a,(OFST-8,sp)
2401  0449 a1f0          	cp	a,#240
2402  044b 260b          	jrne	L3011
2403                     ; 522 		errCnt ++;
2405  044d ce0001        	ldw	x,L767_errCnt
2406  0450 1c0001        	addw	x,#1
2407  0453 cf0001        	ldw	L767_errCnt,x
2409  0456 200f          	jra	L5011
2410  0458               L3011:
2411                     ; 524 	else if(status == CAN_TxStatus_Ok) {
2413  0458 7b08          	ld	a,(OFST-8,sp)
2414  045a a1f1          	cp	a,#241
2415  045c 2609          	jrne	L5011
2416                     ; 525 		okCnt ++;
2418  045e ce0003        	ldw	x,L177_okCnt
2419  0461 1c0001        	addw	x,#1
2420  0464 cf0003        	ldw	L177_okCnt,x
2421  0467               L5011:
2422                     ; 528 }
2425  0467 5b10          	addw	sp,#16
2426  0469 81            	ret
2463                     ; 531 void CAN_TestRecieve(void)
2463                     ; 532 {
2464                     	switch	.text
2465  046a               _CAN_TestRecieve:
2467  046a 520d          	subw	sp,#13
2468       0000000d      OFST:	set	13
2471                     ; 537 	tMsg.u32ID = ID_WARN;
2473  046c ae0113        	ldw	x,#275
2474  046f 1f03          	ldw	(OFST-10,sp),x
2475  0471 ae0000        	ldw	x,#0
2476  0474 1f01          	ldw	(OFST-12,sp),x
2477                     ; 538 	tMsg.u8DLC = 8;
2479  0476 a608          	ld	a,#8
2480  0478 6b05          	ld	(OFST-8,sp),a
2481                     ; 539 	tMsg.Data[0] = 0;	
2483  047a 0f06          	clr	(OFST-7,sp)
2484                     ; 540 	tMsg.Data[1] = 3;	//报警等级
2486  047c a603          	ld	a,#3
2487  047e 6b07          	ld	(OFST-6,sp),a
2488                     ; 541 	tMsg.Data[2] = 0;
2490  0480 0f08          	clr	(OFST-5,sp)
2491                     ; 542 	tMsg.Data[3] = 0;	
2493  0482 0f09          	clr	(OFST-4,sp)
2494                     ; 543 	tMsg.Data[4] = 0;
2496  0484 0f0a          	clr	(OFST-3,sp)
2497                     ; 544 	tMsg.Data[5] = 0;
2499  0486 0f0b          	clr	(OFST-2,sp)
2500                     ; 545 	tMsg.Data[6] = 0;
2502  0488 0f0c          	clr	(OFST-1,sp)
2503                     ; 546 	tMsg.Data[7] = 0;
2505  048a 0f0d          	clr	(OFST+0,sp)
2506                     ; 548 	CAN_AddMsg(&tMsg);
2508  048c 96            	ldw	x,sp
2509  048d 1c0001        	addw	x,#OFST-12
2510  0490 cd017f        	call	_CAN_AddMsg
2512                     ; 551 	tMsg.u32ID = ID_DIST;
2514  0493 ae0112        	ldw	x,#274
2515  0496 1f03          	ldw	(OFST-10,sp),x
2516  0498 ae0000        	ldw	x,#0
2517  049b 1f01          	ldw	(OFST-12,sp),x
2518                     ; 552 	tMsg.u8DLC = 8;
2520  049d a608          	ld	a,#8
2521  049f 6b05          	ld	(OFST-8,sp),a
2522                     ; 553 	tMsg.Data[0] = 0x06;	//距离
2524  04a1 a606          	ld	a,#6
2525  04a3 6b06          	ld	(OFST-7,sp),a
2526                     ; 554 	tMsg.Data[1] = 0xb0;
2528  04a5 a6b0          	ld	a,#176
2529  04a7 6b07          	ld	(OFST-6,sp),a
2530                     ; 555 	tMsg.Data[2] = 0x0;
2532  04a9 0f08          	clr	(OFST-5,sp)
2533                     ; 556 	tMsg.Data[3] = 0x0;
2535  04ab 0f09          	clr	(OFST-4,sp)
2536                     ; 557 	tMsg.Data[4] = 0;
2538  04ad 0f0a          	clr	(OFST-3,sp)
2539                     ; 558 	tMsg.Data[5] = 0;
2541  04af 0f0b          	clr	(OFST-2,sp)
2542                     ; 559 	tMsg.Data[6] = 0;
2544  04b1 0f0c          	clr	(OFST-1,sp)
2545                     ; 560 	tMsg.Data[7] = 0;
2547  04b3 0f0d          	clr	(OFST+0,sp)
2548                     ; 562 	CAN_AddMsg(&tMsg);	
2550  04b5 96            	ldw	x,sp
2551  04b6 1c0001        	addw	x,#OFST-12
2552  04b9 cd017f        	call	_CAN_AddMsg
2554                     ; 564 	Delay_nms(1000);
2556  04bc ae03e8        	ldw	x,#1000
2557  04bf cd0000        	call	_Delay_nms
2559                     ; 567 }
2562  04c2 5b0d          	addw	sp,#13
2563  04c4 81            	ret
2631                     	switch	.bss
2632  000d               L3_l_tMsgQ:
2633  000d 000000000000  	ds.b	704
2634                     	xref	_COMM_RequestSendCommand_CAN
2635                     	xref	_CalChecksum
2636                     	xref	_Delay_nms
2637                     	xdef	_CAN_TestRecieve
2638                     	xdef	_CAN_TestSend
2639                     	xdef	_CAN_GetMsg
2640                     	xdef	_CAN_AddMsg
2641                     	xdef	_CAN_Initialize
2642                     	xdef	_CAN_Process
2643                     	xref	_assert_failed
2644                     	xref	_GPIO_WriteLow
2645                     	xref	_GPIO_Init
2646                     	xref	_CAN_Transmit
2647                     	xref	_CAN_ITConfig
2648                     	xref	_CAN_FilterInit
2649                     	xref	_CAN_Init
2650                     	xref	_CAN_DeInit
2651                     	switch	.const
2652  0010               L761:
2653  0010 3dcccccc      	dc.w	15820,-13108
2654  0014               L351:
2655  0014 2e2e5c617070  	dc.b	"..\app\can.c",0
2656                     	xref.b	c_x
2676                     	xref	c_xymvx
2677                     	xref	c_imul
2678                     	xref	c_fmul
2679                     	xref	c_uitof
2680                     	xref	c_lcmp
2681                     	xref	c_ltor
2682                     	end

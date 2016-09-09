   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 98 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 99 {
  44                     	switch	.text
  45  0000               f_TRAP_IRQHandler:
  49                     ; 103 }
  52  0000 80            	iret
  74                     ; 110 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  74                     ; 111 
  74                     ; 112 {
  75                     	switch	.text
  76  0001               f_TLI_IRQHandler:
  80                     ; 116 }
  83  0001 80            	iret
 105                     ; 123 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 105                     ; 124 {
 106                     	switch	.text
 107  0002               f_AWU_IRQHandler:
 111                     ; 128 }
 114  0002 80            	iret
 136                     ; 135 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 136                     ; 136 {
 137                     	switch	.text
 138  0003               f_CLK_IRQHandler:
 142                     ; 140 }
 145  0003 80            	iret
 168                     ; 147 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 168                     ; 148 {
 169                     	switch	.text
 170  0004               f_EXTI_PORTA_IRQHandler:
 174                     ; 151 }
 177  0004 80            	iret
 179                     	switch	.data
 180  0000               L16_s_u8KeyLRLine:
 181  0000 05            	dc.b	5
 182  0001               L36_s_KeyDetCunt:
 183  0001 00            	dc.b	0
 212                     ; 167 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 212                     ; 168 {
 213                     	switch	.text
 214  0005               f_EXTI_PORTB_IRQHandler:
 216  0005 3b0002        	push	c_x+2
 217  0008 be00          	ldw	x,c_x
 218  000a 89            	pushw	x
 219  000b 3b0002        	push	c_y+2
 220  000e be00          	ldw	x,c_y
 221  0010 89            	pushw	x
 224                     ; 170 	if ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == 0x00)
 226  0011 ae5005        	ldw	x,#20485
 227  0014 cd0000        	call	_GPIO_ReadInputData
 229  0017 a501          	bcp	a,#1
 230  0019 262e          	jrne	L57
 231                     ; 173 		if((s_u8KeyLRLine == KEY_DET_IDLE) ||
 231                     ; 174 		    ((s_u8KeyLRLine != KEY_DET_IDLE) && (s_u8KeyLRLine == KEY_DET_RIGHT))) {
 233  001b c60000        	ld	a,L16_s_u8KeyLRLine
 234  001e a105          	cp	a,#5
 235  0020 270e          	jreq	L101
 237  0022 c60000        	ld	a,L16_s_u8KeyLRLine
 238  0025 a105          	cp	a,#5
 239  0027 271c          	jreq	L77
 241  0029 c60000        	ld	a,L16_s_u8KeyLRLine
 242  002c a104          	cp	a,#4
 243  002e 2615          	jrne	L77
 244  0030               L101:
 245                     ; 175 				s_u8KeyLRLine = KEY_DET_LEFT;
 247  0030 35030000      	mov	L16_s_u8KeyLRLine,#3
 248                     ; 176 				TIM2_Cmd(ENABLE);
 250  0034 a601          	ld	a,#1
 251  0036 cd0000        	call	_TIM2_Cmd
 253                     ; 178 				g_KeyTrigFlag = TRIG_VALID;
 255  0039 35010000      	mov	_g_KeyTrigFlag,#1
 256                     ; 179 				g_KeyStat = KEY_ACTIVED;
 258  003d 35010000      	mov	_g_KeyStat,#1
 259                     ; 180 				g_KeyId = KEY_LEFT;
 261  0041 35020000      	mov	_g_KeyId,#2
 262  0045               L77:
 263                     ; 183 		s_KeyDetCunt = 0;
 265  0045 725f0001      	clr	L36_s_KeyDetCunt
 266  0049               L57:
 267                     ; 187 	if ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == 0x00)
 269  0049 ae5005        	ldw	x,#20485
 270  004c cd0000        	call	_GPIO_ReadInputData
 272  004f a508          	bcp	a,#8
 273  0051 262e          	jrne	L301
 274                     ; 189 		if((s_u8KeyLRLine == KEY_DET_IDLE) || 
 274                     ; 190 		    ((s_u8KeyLRLine != KEY_DET_IDLE) && (s_u8KeyLRLine == KEY_DET_LEFT))) {
 276  0053 c60000        	ld	a,L16_s_u8KeyLRLine
 277  0056 a105          	cp	a,#5
 278  0058 270e          	jreq	L701
 280  005a c60000        	ld	a,L16_s_u8KeyLRLine
 281  005d a105          	cp	a,#5
 282  005f 271c          	jreq	L501
 284  0061 c60000        	ld	a,L16_s_u8KeyLRLine
 285  0064 a103          	cp	a,#3
 286  0066 2615          	jrne	L501
 287  0068               L701:
 288                     ; 191 				s_u8KeyLRLine = KEY_DET_RIGHT;
 290  0068 35040000      	mov	L16_s_u8KeyLRLine,#4
 291                     ; 192 				TIM2_Cmd(ENABLE);
 293  006c a601          	ld	a,#1
 294  006e cd0000        	call	_TIM2_Cmd
 296                     ; 194 				g_KeyTrigFlag = TRIG_VALID;
 298  0071 35010000      	mov	_g_KeyTrigFlag,#1
 299                     ; 195 				g_KeyStat = KEY_ACTIVED;
 301  0075 35010000      	mov	_g_KeyStat,#1
 302                     ; 196 				g_KeyId = KEY_RIGHT;
 304  0079 35030000      	mov	_g_KeyId,#3
 305  007d               L501:
 306                     ; 199 		s_KeyDetCunt = 0;
 308  007d 725f0001      	clr	L36_s_KeyDetCunt
 309  0081               L301:
 310                     ; 202 }
 313  0081 85            	popw	x
 314  0082 bf00          	ldw	c_y,x
 315  0084 320002        	pop	c_y+2
 316  0087 85            	popw	x
 317  0088 bf00          	ldw	c_x,x
 318  008a 320002        	pop	c_x+2
 319  008d 80            	iret
 342                     ; 209 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 342                     ; 210 {
 343                     	switch	.text
 344  008e               f_EXTI_PORTC_IRQHandler:
 348                     ; 214 }
 351  008e 80            	iret
 374                     ; 221 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 374                     ; 222 {
 375                     	switch	.text
 376  008f               f_EXTI_PORTD_IRQHandler:
 380                     ; 232 }
 383  008f 80            	iret
 408                     ; 239 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 408                     ; 240 {
 409                     	switch	.text
 410  0090               f_EXTI_PORTE_IRQHandler:
 412  0090 3b0002        	push	c_x+2
 413  0093 be00          	ldw	x,c_x
 414  0095 89            	pushw	x
 415  0096 3b0002        	push	c_y+2
 416  0099 be00          	ldw	x,c_y
 417  009b 89            	pushw	x
 420                     ; 245 	if ((GPIO_ReadInputData(GPIO_IR_PORT) & GPIO_IR_PIN) == 0x00)
 422  009c ae5014        	ldw	x,#20500
 423  009f cd0000        	call	_GPIO_ReadInputData
 425  00a2 a520          	bcp	a,#32
 426  00a4 2603          	jrne	L141
 427                     ; 247 		ISR_IRReceive();
 429  00a6 cd0000        	call	_ISR_IRReceive
 431  00a9               L141:
 432                     ; 250 }
 435  00a9 85            	popw	x
 436  00aa bf00          	ldw	c_y,x
 437  00ac 320002        	pop	c_y+2
 438  00af 85            	popw	x
 439  00b0 bf00          	ldw	c_x,x
 440  00b2 320002        	pop	c_x+2
 441  00b5 80            	iret
 443                     	switch	.data
 444  0002               L541_cnt:
 445  0002 0000          	dc.w	0
 446                     	switch	.bss
 447  0000               L341_can_msg:
 448  0000 000000000000  	ds.b	13
 524                     ; 272  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 524                     ; 273  {
 525                     	switch	.text
 526  00b6               f_CAN_RX_IRQHandler:
 528  00b6 3b0002        	push	c_x+2
 529  00b9 be00          	ldw	x,c_x
 530  00bb 89            	pushw	x
 531  00bc 3b0002        	push	c_y+2
 532  00bf be00          	ldw	x,c_y
 533  00c1 89            	pushw	x
 536                     ; 281 	CAN_Receive();
 538  00c2 cd0000        	call	_CAN_Receive
 540                     ; 282 	cnt++;
 542  00c5 ce0002        	ldw	x,L541_cnt
 543  00c8 1c0001        	addw	x,#1
 544  00cb cf0002        	ldw	L541_cnt,x
 545                     ; 284 	can_msg.u32ID = CAN_GetReceivedId();
 547  00ce cd0000        	call	_CAN_GetReceivedId
 549  00d1 ae0000        	ldw	x,#L341_can_msg
 550  00d4 cd0000        	call	c_rtol
 552                     ; 285 	can_msg.u8DLC = CAN_GetReceivedDLC();
 554  00d7 cd0000        	call	_CAN_GetReceivedDLC
 556  00da c70004        	ld	L341_can_msg+4,a
 557                     ; 287 	can_msg.Data[0] = CAN_GetReceivedData(0);
 559  00dd 4f            	clr	a
 560  00de cd0000        	call	_CAN_GetReceivedData
 562  00e1 c70005        	ld	L341_can_msg+5,a
 563                     ; 288 	can_msg.Data[1] = CAN_GetReceivedData(1);
 565  00e4 a601          	ld	a,#1
 566  00e6 cd0000        	call	_CAN_GetReceivedData
 568  00e9 c70006        	ld	L341_can_msg+6,a
 569                     ; 289 	can_msg.Data[2] = CAN_GetReceivedData(2);
 571  00ec a602          	ld	a,#2
 572  00ee cd0000        	call	_CAN_GetReceivedData
 574  00f1 c70007        	ld	L341_can_msg+7,a
 575                     ; 290 	can_msg.Data[3] = CAN_GetReceivedData(3);
 577  00f4 a603          	ld	a,#3
 578  00f6 cd0000        	call	_CAN_GetReceivedData
 580  00f9 c70008        	ld	L341_can_msg+8,a
 581                     ; 291 	can_msg.Data[4] = CAN_GetReceivedData(4);
 583  00fc a604          	ld	a,#4
 584  00fe cd0000        	call	_CAN_GetReceivedData
 586  0101 c70009        	ld	L341_can_msg+9,a
 587                     ; 292 	can_msg.Data[5] = CAN_GetReceivedData(5);
 589  0104 a605          	ld	a,#5
 590  0106 cd0000        	call	_CAN_GetReceivedData
 592  0109 c7000a        	ld	L341_can_msg+10,a
 593                     ; 293 	can_msg.Data[6] = CAN_GetReceivedData(6);
 595  010c a606          	ld	a,#6
 596  010e cd0000        	call	_CAN_GetReceivedData
 598  0111 c7000b        	ld	L341_can_msg+11,a
 599                     ; 294 	can_msg.Data[7] = CAN_GetReceivedData(7);
 601  0114 a607          	ld	a,#7
 602  0116 cd0000        	call	_CAN_GetReceivedData
 604  0119 c7000c        	ld	L341_can_msg+12,a
 605                     ; 296 	CAN_AddMsg(&can_msg);
 607  011c ae0000        	ldw	x,#L341_can_msg
 608  011f cd0000        	call	_CAN_AddMsg
 610                     ; 298  }
 613  0122 85            	popw	x
 614  0123 bf00          	ldw	c_y,x
 615  0125 320002        	pop	c_y+2
 616  0128 85            	popw	x
 617  0129 bf00          	ldw	c_x,x
 618  012b 320002        	pop	c_x+2
 619  012e 80            	iret
 641                     ; 305  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 641                     ; 306  {
 642                     	switch	.text
 643  012f               f_CAN_TX_IRQHandler:
 647                     ; 310  }
 650  012f 80            	iret
 672                     ; 318 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 672                     ; 319 {
 673                     	switch	.text
 674  0130               f_SPI_IRQHandler:
 678                     ; 323 }
 681  0130 80            	iret
 704                     ; 330 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 704                     ; 331 {
 705                     	switch	.text
 706  0131               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 710                     ; 335 }
 713  0131 80            	iret
 736                     ; 342 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 736                     ; 343 {
 737                     	switch	.text
 738  0132               f_TIM1_CAP_COM_IRQHandler:
 742                     ; 347 }
 745  0132 80            	iret
 775                     ; 380  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 775                     ; 381  {
 776                     	switch	.text
 777  0133               f_TIM2_UPD_OVF_BRK_IRQHandler:
 779  0133 3b0002        	push	c_x+2
 780  0136 be00          	ldw	x,c_x
 781  0138 89            	pushw	x
 782  0139 3b0002        	push	c_y+2
 783  013c be00          	ldw	x,c_y
 784  013e 89            	pushw	x
 787                     ; 395  if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
 789  013f a601          	ld	a,#1
 790  0141 cd0000        	call	_TIM2_GetITStatus
 792  0144 4d            	tnz	a
 793  0145 2724          	jreq	L352
 794                     ; 397 	  TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 796  0147 a601          	ld	a,#1
 797  0149 cd0000        	call	_TIM2_ClearITPendingBit
 799                     ; 400 		s_KeyDetCunt ++;
 801  014c 725c0001      	inc	L36_s_KeyDetCunt
 802                     ; 402 		if(s_KeyDetCunt > 3) {
 804  0150 c60001        	ld	a,L36_s_KeyDetCunt
 805  0153 a104          	cp	a,#4
 806  0155 2514          	jrult	L352
 807                     ; 403 			s_KeyDetCunt = 0;
 809  0157 725f0001      	clr	L36_s_KeyDetCunt
 810                     ; 404 			TIM2_Cmd(DISABLE);		
 812  015b 4f            	clr	a
 813  015c cd0000        	call	_TIM2_Cmd
 815                     ; 407 			g_KeyTrigFlag = TRIG_VALID;
 817  015f 35010000      	mov	_g_KeyTrigFlag,#1
 818                     ; 408 			g_KeyStat = KEY_NORMAL;
 820  0163 725f0000      	clr	_g_KeyStat
 821                     ; 411 			s_u8KeyLRLine = KEY_DET_IDLE;
 823  0167 35050000      	mov	L16_s_u8KeyLRLine,#5
 824  016b               L352:
 825                     ; 414  }
 828  016b 85            	popw	x
 829  016c bf00          	ldw	c_y,x
 830  016e 320002        	pop	c_y+2
 831  0171 85            	popw	x
 832  0172 bf00          	ldw	c_x,x
 833  0174 320002        	pop	c_x+2
 834  0177 80            	iret
 859                     ; 421  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 859                     ; 422  {
 860                     	switch	.text
 861  0178               f_TIM2_CAP_COM_IRQHandler:
 863  0178 3b0002        	push	c_x+2
 864  017b be00          	ldw	x,c_x
 865  017d 89            	pushw	x
 866  017e 3b0002        	push	c_y+2
 867  0181 be00          	ldw	x,c_y
 868  0183 89            	pushw	x
 871                     ; 426 	if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
 873  0184 a601          	ld	a,#1
 874  0186 cd0000        	call	_TIM2_GetITStatus
 876  0189 4d            	tnz	a
 877  018a 2705          	jreq	L762
 878                     ; 428 		TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 880  018c a601          	ld	a,#1
 881  018e cd0000        	call	_TIM2_ClearITPendingBit
 883  0191               L762:
 884                     ; 433  }
 887  0191 85            	popw	x
 888  0192 bf00          	ldw	c_y,x
 889  0194 320002        	pop	c_y+2
 890  0197 85            	popw	x
 891  0198 bf00          	ldw	c_x,x
 892  019a 320002        	pop	c_x+2
 893  019d 80            	iret
 919                     ; 443  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 919                     ; 444  {
 920                     	switch	.text
 921  019e               f_TIM3_UPD_OVF_BRK_IRQHandler:
 923  019e 3b0002        	push	c_x+2
 924  01a1 be00          	ldw	x,c_x
 925  01a3 89            	pushw	x
 926  01a4 3b0002        	push	c_y+2
 927  01a7 be00          	ldw	x,c_y
 928  01a9 89            	pushw	x
 931                     ; 448 	  if (TIM3_GetITStatus(TIM3_IT_UPDATE) != RESET)
 933  01aa a601          	ld	a,#1
 934  01ac cd0000        	call	_TIM3_GetITStatus
 936  01af 4d            	tnz	a
 937  01b0 2708          	jreq	L103
 938                     ; 450 		  TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 940  01b2 a601          	ld	a,#1
 941  01b4 cd0000        	call	_TIM3_ClearITPendingBit
 943                     ; 452 		  Isr_IR_Timeout10ms();
 945  01b7 cd0000        	call	_Isr_IR_Timeout10ms
 947  01ba               L103:
 948                     ; 454  }
 951  01ba 85            	popw	x
 952  01bb bf00          	ldw	c_y,x
 953  01bd 320002        	pop	c_y+2
 954  01c0 85            	popw	x
 955  01c1 bf00          	ldw	c_x,x
 956  01c3 320002        	pop	c_x+2
 957  01c6 80            	iret
 980                     ; 461  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 980                     ; 462  {
 981                     	switch	.text
 982  01c7               f_TIM3_CAP_COM_IRQHandler:
 986                     ; 466  }
 989  01c7 80            	iret
1015                     ; 476  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
1015                     ; 477  {
1016                     	switch	.text
1017  01c8               f_UART1_TX_IRQHandler:
1019  01c8 3b0002        	push	c_x+2
1020  01cb be00          	ldw	x,c_x
1021  01cd 89            	pushw	x
1022  01ce 3b0002        	push	c_y+2
1023  01d1 be00          	ldw	x,c_y
1024  01d3 89            	pushw	x
1027                     ; 483 		UART1_SendData8(l_TxRBuf.buf[l_TxRBuf.read]);
1029  01d4 c600f0        	ld	a,_l_TxRBuf+240
1030  01d7 5f            	clrw	x
1031  01d8 97            	ld	xl,a
1032  01d9 d60000        	ld	a,(_l_TxRBuf,x)
1033  01dc cd0000        	call	_UART1_SendData8
1035                     ; 484 		l_TxRBuf.read++;
1037  01df 725c00f0      	inc	_l_TxRBuf+240
1038                     ; 485 		if(l_TxRBuf.read >= BUF_SIZE)
1040  01e3 c600f0        	ld	a,_l_TxRBuf+240
1041  01e6 a1f0          	cp	a,#240
1042  01e8 2504          	jrult	L323
1043                     ; 486 			l_TxRBuf.read = 0;
1045  01ea 725f00f0      	clr	_l_TxRBuf+240
1046  01ee               L323:
1047                     ; 488 			if (l_TxRBuf.read == l_TxRBuf.write)
1049  01ee c600f0        	ld	a,_l_TxRBuf+240
1050  01f1 c100f1        	cp	a,_l_TxRBuf+241
1051  01f4 2609          	jrne	L523
1052                     ; 491 					UART1_ITConfig(UART1_IT_TXE, DISABLE);
1054  01f6 4b00          	push	#0
1055  01f8 ae0277        	ldw	x,#631
1056  01fb cd0000        	call	_UART1_ITConfig
1058  01fe 84            	pop	a
1059  01ff               L523:
1060                     ; 494  }
1063  01ff 85            	popw	x
1064  0200 bf00          	ldw	c_y,x
1065  0202 320002        	pop	c_y+2
1066  0205 85            	popw	x
1067  0206 bf00          	ldw	c_x,x
1068  0208 320002        	pop	c_x+2
1069  020b 80            	iret
1092                     ; 501  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
1092                     ; 502  {
1093                     	switch	.text
1094  020c               f_UART1_RX_IRQHandler:
1098                     ; 518  }
1101  020c 80            	iret
1123                     ; 526 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
1123                     ; 527 {
1124                     	switch	.text
1125  020d               f_I2C_IRQHandler:
1129                     ; 531 }
1132  020d 80            	iret
1156                     ; 579  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
1156                     ; 580  {
1157                     	switch	.text
1158  020e               f_UART3_TX_IRQHandler:
1160  020e 3b0002        	push	c_x+2
1161  0211 be00          	ldw	x,c_x
1162  0213 89            	pushw	x
1163  0214 3b0002        	push	c_y+2
1164  0217 be00          	ldw	x,c_y
1165  0219 89            	pushw	x
1168                     ; 598 UART3_ITConfig(UART3_IT_TXE, DISABLE);
1170  021a 4b00          	push	#0
1171  021c ae0277        	ldw	x,#631
1172  021f cd0000        	call	_UART3_ITConfig
1174  0222 84            	pop	a
1175                     ; 599  }
1178  0223 85            	popw	x
1179  0224 bf00          	ldw	c_y,x
1180  0226 320002        	pop	c_y+2
1181  0229 85            	popw	x
1182  022a bf00          	ldw	c_x,x
1183  022c 320002        	pop	c_x+2
1184  022f 80            	iret
1207                     ; 606  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
1207                     ; 607  {
1208                     	switch	.text
1209  0230               f_UART3_RX_IRQHandler:
1213                     ; 611  }
1216  0230 80            	iret
1238                     ; 620  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
1238                     ; 621  {
1239                     	switch	.text
1240  0231               f_ADC2_IRQHandler:
1244                     ; 625  }
1247  0231 80            	iret
1273                     ; 660  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1273                     ; 661  {
1274                     	switch	.text
1275  0232               f_TIM4_UPD_OVF_IRQHandler:
1277  0232 3b0002        	push	c_x+2
1278  0235 be00          	ldw	x,c_x
1279  0237 89            	pushw	x
1280  0238 3b0002        	push	c_y+2
1281  023b be00          	ldw	x,c_y
1282  023d 89            	pushw	x
1285                     ; 666 	if (TIM4_GetITStatus(TIM4_IT_UPDATE) != RESET)
1287  023e a601          	ld	a,#1
1288  0240 cd0000        	call	_TIM4_GetITStatus
1290  0243 4d            	tnz	a
1291  0244 2708          	jreq	L704
1292                     ; 668 	  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1294  0246 a601          	ld	a,#1
1295  0248 cd0000        	call	_TIM4_ClearITPendingBit
1297                     ; 670 	  Isr_IR_Timeout100us();
1299  024b cd0000        	call	_Isr_IR_Timeout100us
1301  024e               L704:
1302                     ; 672  }
1305  024e 85            	popw	x
1306  024f bf00          	ldw	c_y,x
1307  0251 320002        	pop	c_y+2
1308  0254 85            	popw	x
1309  0255 bf00          	ldw	c_x,x
1310  0257 320002        	pop	c_x+2
1311  025a 80            	iret
1334                     ; 680 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1334                     ; 681 {
1335                     	switch	.text
1336  025b               f_EEPROM_EEC_IRQHandler:
1340                     ; 685 }
1343  025b 80            	iret
1371                     	xref	_g_KeyId
1372                     	xref	_g_KeyStat
1373                     	xref	_g_KeyTrigFlag
1374                     	xref	_l_TxRBuf
1375                     	xref	_CAN_AddMsg
1376                     	xref	_ISR_IRReceive
1377                     	xref	_Isr_IR_Timeout100us
1378                     	xref	_Isr_IR_Timeout10ms
1379                     	xdef	f_EEPROM_EEC_IRQHandler
1380                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1381                     	xdef	f_ADC2_IRQHandler
1382                     	xdef	f_UART3_TX_IRQHandler
1383                     	xdef	f_UART3_RX_IRQHandler
1384                     	xdef	f_I2C_IRQHandler
1385                     	xdef	f_UART1_RX_IRQHandler
1386                     	xdef	f_UART1_TX_IRQHandler
1387                     	xdef	f_TIM3_CAP_COM_IRQHandler
1388                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1389                     	xdef	f_TIM2_CAP_COM_IRQHandler
1390                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1391                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1392                     	xdef	f_TIM1_CAP_COM_IRQHandler
1393                     	xdef	f_SPI_IRQHandler
1394                     	xdef	f_CAN_TX_IRQHandler
1395                     	xdef	f_CAN_RX_IRQHandler
1396                     	xdef	f_EXTI_PORTE_IRQHandler
1397                     	xdef	f_EXTI_PORTD_IRQHandler
1398                     	xdef	f_EXTI_PORTC_IRQHandler
1399                     	xdef	f_EXTI_PORTB_IRQHandler
1400                     	xdef	f_EXTI_PORTA_IRQHandler
1401                     	xdef	f_CLK_IRQHandler
1402                     	xdef	f_AWU_IRQHandler
1403                     	xdef	f_TLI_IRQHandler
1404                     	xdef	f_TRAP_IRQHandler
1405                     	xref	_UART3_ITConfig
1406                     	xref	_UART1_SendData8
1407                     	xref	_UART1_ITConfig
1408                     	xref	_TIM4_ClearITPendingBit
1409                     	xref	_TIM4_GetITStatus
1410                     	xref	_TIM3_ClearITPendingBit
1411                     	xref	_TIM3_GetITStatus
1412                     	xref	_TIM2_ClearITPendingBit
1413                     	xref	_TIM2_GetITStatus
1414                     	xref	_TIM2_Cmd
1415                     	xref	_GPIO_ReadInputData
1416                     	xref	_CAN_GetReceivedData
1417                     	xref	_CAN_GetReceivedDLC
1418                     	xref	_CAN_GetReceivedId
1419                     	xref	_CAN_Receive
1420                     	xref.b	c_x
1421                     	xref.b	c_y
1440                     	xref	c_rtol
1441                     	end

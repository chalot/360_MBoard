   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 97 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 98 {
  44                     	switch	.text
  45  0000               f_TRAP_IRQHandler:
  49                     ; 102 }
  52  0000 80            	iret
  74                     ; 109 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  74                     ; 110 
  74                     ; 111 {
  75                     	switch	.text
  76  0001               f_TLI_IRQHandler:
  80                     ; 115 }
  83  0001 80            	iret
 105                     ; 122 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 105                     ; 123 {
 106                     	switch	.text
 107  0002               f_AWU_IRQHandler:
 111                     ; 127 }
 114  0002 80            	iret
 136                     ; 134 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 136                     ; 135 {
 137                     	switch	.text
 138  0003               f_CLK_IRQHandler:
 142                     ; 139 }
 145  0003 80            	iret
 168                     ; 146 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 168                     ; 147 {
 169                     	switch	.text
 170  0004               f_EXTI_PORTA_IRQHandler:
 174                     ; 150 }
 177  0004 80            	iret
 179                     	bsct
 180  0000               L16_s_u8KeyLRLine:
 181  0000 05            	dc.b	5
 182  0001               L36_s_KeyDetCunt:
 183  0001 00            	dc.b	0
 212                     ; 166 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 212                     ; 167 {
 213                     	switch	.text
 214  0005               f_EXTI_PORTB_IRQHandler:
 216  0005 3b0002        	push	c_x+2
 217  0008 be00          	ldw	x,c_x
 218  000a 89            	pushw	x
 219  000b 3b0002        	push	c_y+2
 220  000e be00          	ldw	x,c_y
 221  0010 89            	pushw	x
 224                     ; 169 	if ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == 0x00)
 226  0011 ae5005        	ldw	x,#20485
 227  0014 cd0000        	call	_GPIO_ReadInputData
 229  0017 a501          	bcp	a,#1
 230  0019 261d          	jrne	L57
 231                     ; 172 		if(s_u8KeyLRLine == KEY_DET_IDLE) {
 233  001b b600          	ld	a,L16_s_u8KeyLRLine
 234  001d a105          	cp	a,#5
 235  001f 2615          	jrne	L77
 236                     ; 173 				s_u8KeyLRLine = KEY_DET_LEFT;
 238  0021 35030000      	mov	L16_s_u8KeyLRLine,#3
 239                     ; 174 				TIM2_Cmd(ENABLE);
 241  0025 a601          	ld	a,#1
 242  0027 cd0000        	call	_TIM2_Cmd
 244                     ; 176 				g_KeyTrigFlag = TRIG_VALID;
 246  002a 35010000      	mov	_g_KeyTrigFlag,#1
 247                     ; 177 				g_KeyStat = KEY_ACTIVED;
 249  002e 35010000      	mov	_g_KeyStat,#1
 250                     ; 178 				g_KeyId = KEY_LEFT;
 252  0032 35020000      	mov	_g_KeyId,#2
 253  0036               L77:
 254                     ; 181 		s_KeyDetCunt = 0;
 256  0036 3f01          	clr	L36_s_KeyDetCunt
 257  0038               L57:
 258                     ; 185 	if ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == 0x00)
 260  0038 ae5005        	ldw	x,#20485
 261  003b cd0000        	call	_GPIO_ReadInputData
 263  003e a508          	bcp	a,#8
 264  0040 261d          	jrne	L101
 265                     ; 187 		if(s_u8KeyLRLine == KEY_DET_IDLE) {
 267  0042 b600          	ld	a,L16_s_u8KeyLRLine
 268  0044 a105          	cp	a,#5
 269  0046 2615          	jrne	L301
 270                     ; 188 				s_u8KeyLRLine = KEY_DET_RIGHT;
 272  0048 35040000      	mov	L16_s_u8KeyLRLine,#4
 273                     ; 189 				TIM2_Cmd(ENABLE);
 275  004c a601          	ld	a,#1
 276  004e cd0000        	call	_TIM2_Cmd
 278                     ; 191 				g_KeyTrigFlag = TRIG_VALID;
 280  0051 35010000      	mov	_g_KeyTrigFlag,#1
 281                     ; 192 				g_KeyStat = KEY_ACTIVED;
 283  0055 35010000      	mov	_g_KeyStat,#1
 284                     ; 193 				g_KeyId = KEY_RIGHT;
 286  0059 35030000      	mov	_g_KeyId,#3
 287  005d               L301:
 288                     ; 196 		s_KeyDetCunt = 0;
 290  005d 3f01          	clr	L36_s_KeyDetCunt
 291  005f               L101:
 292                     ; 199 }
 295  005f 85            	popw	x
 296  0060 bf00          	ldw	c_y,x
 297  0062 320002        	pop	c_y+2
 298  0065 85            	popw	x
 299  0066 bf00          	ldw	c_x,x
 300  0068 320002        	pop	c_x+2
 301  006b 80            	iret
 324                     ; 206 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 324                     ; 207 {
 325                     	switch	.text
 326  006c               f_EXTI_PORTC_IRQHandler:
 330                     ; 211 }
 333  006c 80            	iret
 356                     ; 218 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 356                     ; 219 {
 357                     	switch	.text
 358  006d               f_EXTI_PORTD_IRQHandler:
 362                     ; 229 }
 365  006d 80            	iret
 390                     ; 236 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 390                     ; 237 {
 391                     	switch	.text
 392  006e               f_EXTI_PORTE_IRQHandler:
 394  006e 3b0002        	push	c_x+2
 395  0071 be00          	ldw	x,c_x
 396  0073 89            	pushw	x
 397  0074 3b0002        	push	c_y+2
 398  0077 be00          	ldw	x,c_y
 399  0079 89            	pushw	x
 402                     ; 242 	if ((GPIO_ReadInputData(GPIO_IR_PORT) & GPIO_IR_PIN) == 0x00)
 404  007a ae5014        	ldw	x,#20500
 405  007d cd0000        	call	_GPIO_ReadInputData
 407  0080 a520          	bcp	a,#32
 408  0082 2603          	jrne	L531
 409                     ; 244 		ISR_IRReceive();
 411  0084 cd0000        	call	_ISR_IRReceive
 413  0087               L531:
 414                     ; 247 }
 417  0087 85            	popw	x
 418  0088 bf00          	ldw	c_y,x
 419  008a 320002        	pop	c_y+2
 420  008d 85            	popw	x
 421  008e bf00          	ldw	c_x,x
 422  0090 320002        	pop	c_x+2
 423  0093 80            	iret
 445                     ; 269  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 445                     ; 270  {
 446                     	switch	.text
 447  0094               f_CAN_RX_IRQHandler:
 451                     ; 274  }
 454  0094 80            	iret
 476                     ; 281  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 476                     ; 282  {
 477                     	switch	.text
 478  0095               f_CAN_TX_IRQHandler:
 482                     ; 286  }
 485  0095 80            	iret
 507                     ; 294 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 507                     ; 295 {
 508                     	switch	.text
 509  0096               f_SPI_IRQHandler:
 513                     ; 299 }
 516  0096 80            	iret
 539                     ; 306 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 539                     ; 307 {
 540                     	switch	.text
 541  0097               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 545                     ; 311 }
 548  0097 80            	iret
 571                     ; 318 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 571                     ; 319 {
 572                     	switch	.text
 573  0098               f_TIM1_CAP_COM_IRQHandler:
 577                     ; 323 }
 580  0098 80            	iret
 610                     ; 356  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 610                     ; 357  {
 611                     	switch	.text
 612  0099               f_TIM2_UPD_OVF_BRK_IRQHandler:
 614  0099 3b0002        	push	c_x+2
 615  009c be00          	ldw	x,c_x
 616  009e 89            	pushw	x
 617  009f 3b0002        	push	c_y+2
 618  00a2 be00          	ldw	x,c_y
 619  00a4 89            	pushw	x
 622                     ; 371  if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
 624  00a5 a601          	ld	a,#1
 625  00a7 cd0000        	call	_TIM2_GetITStatus
 627  00aa 4d            	tnz	a
 628  00ab 271d          	jreq	L712
 629                     ; 373 	  TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 631  00ad a601          	ld	a,#1
 632  00af cd0000        	call	_TIM2_ClearITPendingBit
 634                     ; 376 		s_KeyDetCunt ++;
 636  00b2 3c01          	inc	L36_s_KeyDetCunt
 637                     ; 378 		if(s_KeyDetCunt > 5) {
 639  00b4 b601          	ld	a,L36_s_KeyDetCunt
 640  00b6 a106          	cp	a,#6
 641  00b8 2510          	jrult	L712
 642                     ; 379 			s_KeyDetCunt = 0;
 644  00ba 3f01          	clr	L36_s_KeyDetCunt
 645                     ; 380 			TIM2_Cmd(DISABLE);		
 647  00bc 4f            	clr	a
 648  00bd cd0000        	call	_TIM2_Cmd
 650                     ; 383 			g_KeyTrigFlag = TRIG_VALID;
 652  00c0 35010000      	mov	_g_KeyTrigFlag,#1
 653                     ; 384 			g_KeyStat = KEY_NORMAL;
 655  00c4 3f00          	clr	_g_KeyStat
 656                     ; 387 			s_u8KeyLRLine = KEY_DET_IDLE;
 658  00c6 35050000      	mov	L16_s_u8KeyLRLine,#5
 659  00ca               L712:
 660                     ; 390  }
 663  00ca 85            	popw	x
 664  00cb bf00          	ldw	c_y,x
 665  00cd 320002        	pop	c_y+2
 666  00d0 85            	popw	x
 667  00d1 bf00          	ldw	c_x,x
 668  00d3 320002        	pop	c_x+2
 669  00d6 80            	iret
 694                     ; 397  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 694                     ; 398  {
 695                     	switch	.text
 696  00d7               f_TIM2_CAP_COM_IRQHandler:
 698  00d7 3b0002        	push	c_x+2
 699  00da be00          	ldw	x,c_x
 700  00dc 89            	pushw	x
 701  00dd 3b0002        	push	c_y+2
 702  00e0 be00          	ldw	x,c_y
 703  00e2 89            	pushw	x
 706                     ; 402 	if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
 708  00e3 a601          	ld	a,#1
 709  00e5 cd0000        	call	_TIM2_GetITStatus
 711  00e8 4d            	tnz	a
 712  00e9 2705          	jreq	L332
 713                     ; 404 		TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 715  00eb a601          	ld	a,#1
 716  00ed cd0000        	call	_TIM2_ClearITPendingBit
 718  00f0               L332:
 719                     ; 409  }
 722  00f0 85            	popw	x
 723  00f1 bf00          	ldw	c_y,x
 724  00f3 320002        	pop	c_y+2
 725  00f6 85            	popw	x
 726  00f7 bf00          	ldw	c_x,x
 727  00f9 320002        	pop	c_x+2
 728  00fc 80            	iret
 754                     ; 419  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 754                     ; 420  {
 755                     	switch	.text
 756  00fd               f_TIM3_UPD_OVF_BRK_IRQHandler:
 758  00fd 3b0002        	push	c_x+2
 759  0100 be00          	ldw	x,c_x
 760  0102 89            	pushw	x
 761  0103 3b0002        	push	c_y+2
 762  0106 be00          	ldw	x,c_y
 763  0108 89            	pushw	x
 766                     ; 424 	  if (TIM3_GetITStatus(TIM3_IT_UPDATE) != RESET)
 768  0109 a601          	ld	a,#1
 769  010b cd0000        	call	_TIM3_GetITStatus
 771  010e 4d            	tnz	a
 772  010f 2708          	jreq	L542
 773                     ; 426 		  TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 775  0111 a601          	ld	a,#1
 776  0113 cd0000        	call	_TIM3_ClearITPendingBit
 778                     ; 428 		  Isr_IR_Timeout10ms();
 780  0116 cd0000        	call	_Isr_IR_Timeout10ms
 782  0119               L542:
 783                     ; 430  }
 786  0119 85            	popw	x
 787  011a bf00          	ldw	c_y,x
 788  011c 320002        	pop	c_y+2
 789  011f 85            	popw	x
 790  0120 bf00          	ldw	c_x,x
 791  0122 320002        	pop	c_x+2
 792  0125 80            	iret
 815                     ; 437  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 815                     ; 438  {
 816                     	switch	.text
 817  0126               f_TIM3_CAP_COM_IRQHandler:
 821                     ; 442  }
 824  0126 80            	iret
 850                     ; 452  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 850                     ; 453  {
 851                     	switch	.text
 852  0127               f_UART1_TX_IRQHandler:
 854  0127 3b0002        	push	c_x+2
 855  012a be00          	ldw	x,c_x
 856  012c 89            	pushw	x
 857  012d 3b0002        	push	c_y+2
 858  0130 be00          	ldw	x,c_y
 859  0132 89            	pushw	x
 862                     ; 459 		UART1_SendData8(l_TxRBuf.buf[l_TxRBuf.read]);
 864  0133 b632          	ld	a,_l_TxRBuf+50
 865  0135 5f            	clrw	x
 866  0136 97            	ld	xl,a
 867  0137 e600          	ld	a,(_l_TxRBuf,x)
 868  0139 cd0000        	call	_UART1_SendData8
 870                     ; 460 		l_TxRBuf.read++;
 872  013c 3c32          	inc	_l_TxRBuf+50
 873                     ; 461 		if(l_TxRBuf.read >= BUF_SIZE)
 875  013e b632          	ld	a,_l_TxRBuf+50
 876  0140 a132          	cp	a,#50
 877  0142 2502          	jrult	L762
 878                     ; 462 			l_TxRBuf.read = 0;
 880  0144 3f32          	clr	_l_TxRBuf+50
 881  0146               L762:
 882                     ; 464 			if (l_TxRBuf.read == l_TxRBuf.write)
 884  0146 b632          	ld	a,_l_TxRBuf+50
 885  0148 b133          	cp	a,_l_TxRBuf+51
 886  014a 2609          	jrne	L172
 887                     ; 467 					UART1_ITConfig(UART1_IT_TXE, DISABLE);
 889  014c 4b00          	push	#0
 890  014e ae0277        	ldw	x,#631
 891  0151 cd0000        	call	_UART1_ITConfig
 893  0154 84            	pop	a
 894  0155               L172:
 895                     ; 470  }
 898  0155 85            	popw	x
 899  0156 bf00          	ldw	c_y,x
 900  0158 320002        	pop	c_y+2
 901  015b 85            	popw	x
 902  015c bf00          	ldw	c_x,x
 903  015e 320002        	pop	c_x+2
 904  0161 80            	iret
 927                     ; 477  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 927                     ; 478  {
 928                     	switch	.text
 929  0162               f_UART1_RX_IRQHandler:
 933                     ; 494  }
 936  0162 80            	iret
 958                     ; 502 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 958                     ; 503 {
 959                     	switch	.text
 960  0163               f_I2C_IRQHandler:
 964                     ; 507 }
 967  0163 80            	iret
 991                     ; 555  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 991                     ; 556  {
 992                     	switch	.text
 993  0164               f_UART3_TX_IRQHandler:
 995  0164 3b0002        	push	c_x+2
 996  0167 be00          	ldw	x,c_x
 997  0169 89            	pushw	x
 998  016a 3b0002        	push	c_y+2
 999  016d be00          	ldw	x,c_y
1000  016f 89            	pushw	x
1003                     ; 574 UART3_ITConfig(UART3_IT_TXE, DISABLE);
1005  0170 4b00          	push	#0
1006  0172 ae0277        	ldw	x,#631
1007  0175 cd0000        	call	_UART3_ITConfig
1009  0178 84            	pop	a
1010                     ; 575  }
1013  0179 85            	popw	x
1014  017a bf00          	ldw	c_y,x
1015  017c 320002        	pop	c_y+2
1016  017f 85            	popw	x
1017  0180 bf00          	ldw	c_x,x
1018  0182 320002        	pop	c_x+2
1019  0185 80            	iret
1042                     ; 582  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
1042                     ; 583  {
1043                     	switch	.text
1044  0186               f_UART3_RX_IRQHandler:
1048                     ; 587  }
1051  0186 80            	iret
1073                     ; 596  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
1073                     ; 597  {
1074                     	switch	.text
1075  0187               f_ADC2_IRQHandler:
1079                     ; 601  }
1082  0187 80            	iret
1108                     ; 636  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1108                     ; 637  {
1109                     	switch	.text
1110  0188               f_TIM4_UPD_OVF_IRQHandler:
1112  0188 3b0002        	push	c_x+2
1113  018b be00          	ldw	x,c_x
1114  018d 89            	pushw	x
1115  018e 3b0002        	push	c_y+2
1116  0191 be00          	ldw	x,c_y
1117  0193 89            	pushw	x
1120                     ; 642 	if (TIM4_GetITStatus(TIM4_IT_UPDATE) != RESET)
1122  0194 a601          	ld	a,#1
1123  0196 cd0000        	call	_TIM4_GetITStatus
1125  0199 4d            	tnz	a
1126  019a 2708          	jreq	L353
1127                     ; 644 	  TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1129  019c a601          	ld	a,#1
1130  019e cd0000        	call	_TIM4_ClearITPendingBit
1132                     ; 646 	  Isr_IR_Timeout100us();
1134  01a1 cd0000        	call	_Isr_IR_Timeout100us
1136  01a4               L353:
1137                     ; 648  }
1140  01a4 85            	popw	x
1141  01a5 bf00          	ldw	c_y,x
1142  01a7 320002        	pop	c_y+2
1143  01aa 85            	popw	x
1144  01ab bf00          	ldw	c_x,x
1145  01ad 320002        	pop	c_x+2
1146  01b0 80            	iret
1169                     ; 656 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1169                     ; 657 {
1170                     	switch	.text
1171  01b1               f_EEPROM_EEC_IRQHandler:
1175                     ; 661 }
1178  01b1 80            	iret
1210                     	xref.b	_g_KeyId
1211                     	xref.b	_g_KeyStat
1212                     	xref.b	_g_KeyTrigFlag
1213                     	xref.b	_l_TxRBuf
1214                     	xref	_ISR_IRReceive
1215                     	xref	_Isr_IR_Timeout100us
1216                     	xref	_Isr_IR_Timeout10ms
1217                     	xdef	f_EEPROM_EEC_IRQHandler
1218                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1219                     	xdef	f_ADC2_IRQHandler
1220                     	xdef	f_UART3_TX_IRQHandler
1221                     	xdef	f_UART3_RX_IRQHandler
1222                     	xdef	f_I2C_IRQHandler
1223                     	xdef	f_UART1_RX_IRQHandler
1224                     	xdef	f_UART1_TX_IRQHandler
1225                     	xdef	f_TIM3_CAP_COM_IRQHandler
1226                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1227                     	xdef	f_TIM2_CAP_COM_IRQHandler
1228                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1229                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1230                     	xdef	f_TIM1_CAP_COM_IRQHandler
1231                     	xdef	f_SPI_IRQHandler
1232                     	xdef	f_CAN_TX_IRQHandler
1233                     	xdef	f_CAN_RX_IRQHandler
1234                     	xdef	f_EXTI_PORTE_IRQHandler
1235                     	xdef	f_EXTI_PORTD_IRQHandler
1236                     	xdef	f_EXTI_PORTC_IRQHandler
1237                     	xdef	f_EXTI_PORTB_IRQHandler
1238                     	xdef	f_EXTI_PORTA_IRQHandler
1239                     	xdef	f_CLK_IRQHandler
1240                     	xdef	f_AWU_IRQHandler
1241                     	xdef	f_TLI_IRQHandler
1242                     	xdef	f_TRAP_IRQHandler
1243                     	xref	_UART3_ITConfig
1244                     	xref	_UART1_SendData8
1245                     	xref	_UART1_ITConfig
1246                     	xref	_TIM4_ClearITPendingBit
1247                     	xref	_TIM4_GetITStatus
1248                     	xref	_TIM3_ClearITPendingBit
1249                     	xref	_TIM3_GetITStatus
1250                     	xref	_TIM2_ClearITPendingBit
1251                     	xref	_TIM2_GetITStatus
1252                     	xref	_TIM2_Cmd
1253                     	xref	_GPIO_ReadInputData
1254                     	xref.b	c_x
1255                     	xref.b	c_y
1274                     	end

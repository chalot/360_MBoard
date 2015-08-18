   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 94 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 95 {
  44                     	switch	.text
  45  0000               f_TRAP_IRQHandler:
  49                     ; 99 }
  52  0000 80            	iret
  74                     ; 106 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  74                     ; 107 
  74                     ; 108 {
  75                     	switch	.text
  76  0001               f_TLI_IRQHandler:
  80                     ; 112 }
  83  0001 80            	iret
 105                     ; 119 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 105                     ; 120 {
 106                     	switch	.text
 107  0002               f_AWU_IRQHandler:
 111                     ; 124 }
 114  0002 80            	iret
 136                     ; 131 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 136                     ; 132 {
 137                     	switch	.text
 138  0003               f_CLK_IRQHandler:
 142                     ; 136 }
 145  0003 80            	iret
 170                     ; 143 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 170                     ; 144 {
 171                     	switch	.text
 172  0004               f_EXTI_PORTA_IRQHandler:
 174  0004 3b0002        	push	c_x+2
 175  0007 be00          	ldw	x,c_x
 176  0009 89            	pushw	x
 177  000a 3b0002        	push	c_y+2
 178  000d be00          	ldw	x,c_y
 179  000f 89            	pushw	x
 182                     ; 158 	if ((GPIO_ReadInputData(GPIO_IR_PORT) & GPIO_IR_PIN) == 0x00)
 184  0010 ae5000        	ldw	x,#20480
 185  0013 cd0000        	call	_GPIO_ReadInputData
 187  0016 a508          	bcp	a,#8
 188  0018 2603          	jrne	L16
 189                     ; 160 		ISR_IRReceive();
 191  001a cd0000        	call	_ISR_IRReceive
 193  001d               L16:
 194                     ; 164 }
 197  001d 85            	popw	x
 198  001e bf00          	ldw	c_y,x
 199  0020 320002        	pop	c_y+2
 200  0023 85            	popw	x
 201  0024 bf00          	ldw	c_x,x
 202  0026 320002        	pop	c_x+2
 203  0029 80            	iret
 226                     ; 174 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 226                     ; 175 {
 227                     	switch	.text
 228  002a               f_EXTI_PORTB_IRQHandler:
 232                     ; 176 }
 235  002a 80            	iret
 258                     ; 183 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 258                     ; 184 {
 259                     	switch	.text
 260  002b               f_EXTI_PORTC_IRQHandler:
 264                     ; 188 }
 267  002b 80            	iret
 290                     ; 195 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 290                     ; 196 {
 291                     	switch	.text
 292  002c               f_EXTI_PORTD_IRQHandler:
 296                     ; 202 }
 299  002c 80            	iret
 322                     ; 209 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 322                     ; 210 {
 323                     	switch	.text
 324  002d               f_EXTI_PORTE_IRQHandler:
 328                     ; 214 }
 331  002d 80            	iret
 353                     ; 236  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 353                     ; 237  {
 354                     	switch	.text
 355  002e               f_CAN_RX_IRQHandler:
 359                     ; 241  }
 362  002e 80            	iret
 384                     ; 248  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 384                     ; 249  {
 385                     	switch	.text
 386  002f               f_CAN_TX_IRQHandler:
 390                     ; 253  }
 393  002f 80            	iret
 415                     ; 261 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 415                     ; 262 {
 416                     	switch	.text
 417  0030               f_SPI_IRQHandler:
 421                     ; 266 }
 424  0030 80            	iret
 447                     ; 273 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 447                     ; 274 {
 448                     	switch	.text
 449  0031               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 453                     ; 278 }
 456  0031 80            	iret
 479                     ; 285 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 479                     ; 286 {
 480                     	switch	.text
 481  0032               f_TIM1_CAP_COM_IRQHandler:
 485                     ; 290 }
 488  0032 80            	iret
 514                     ; 323  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 514                     ; 324  {
 515                     	switch	.text
 516  0033               f_TIM2_UPD_OVF_BRK_IRQHandler:
 518  0033 3b0002        	push	c_x+2
 519  0036 be00          	ldw	x,c_x
 520  0038 89            	pushw	x
 521  0039 3b0002        	push	c_y+2
 522  003c be00          	ldw	x,c_y
 523  003e 89            	pushw	x
 526                     ; 329  if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
 528  003f a601          	ld	a,#1
 529  0041 cd0000        	call	_TIM2_GetITStatus
 531  0044 4d            	tnz	a
 532  0045 2708          	jreq	L502
 533                     ; 331 	  TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 535  0047 a601          	ld	a,#1
 536  0049 cd0000        	call	_TIM2_ClearITPendingBit
 538                     ; 333 	  Isr_IR_Timeout100us();
 540  004c cd0000        	call	_Isr_IR_Timeout100us
 542  004f               L502:
 543                     ; 336  }
 546  004f 85            	popw	x
 547  0050 bf00          	ldw	c_y,x
 548  0052 320002        	pop	c_y+2
 549  0055 85            	popw	x
 550  0056 bf00          	ldw	c_x,x
 551  0058 320002        	pop	c_x+2
 552  005b 80            	iret
 577                     ; 343  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 577                     ; 344  {
 578                     	switch	.text
 579  005c               f_TIM2_CAP_COM_IRQHandler:
 581  005c 3b0002        	push	c_x+2
 582  005f be00          	ldw	x,c_x
 583  0061 89            	pushw	x
 584  0062 3b0002        	push	c_y+2
 585  0065 be00          	ldw	x,c_y
 586  0067 89            	pushw	x
 589                     ; 348 	if (TIM2_GetITStatus(TIM2_IT_UPDATE) != RESET)
 591  0068 a601          	ld	a,#1
 592  006a cd0000        	call	_TIM2_GetITStatus
 594  006d 4d            	tnz	a
 595  006e 2705          	jreq	L712
 596                     ; 350 		TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 598  0070 a601          	ld	a,#1
 599  0072 cd0000        	call	_TIM2_ClearITPendingBit
 601  0075               L712:
 602                     ; 355  }
 605  0075 85            	popw	x
 606  0076 bf00          	ldw	c_y,x
 607  0078 320002        	pop	c_y+2
 608  007b 85            	popw	x
 609  007c bf00          	ldw	c_x,x
 610  007e 320002        	pop	c_x+2
 611  0081 80            	iret
 637                     ; 365  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 637                     ; 366  {
 638                     	switch	.text
 639  0082               f_TIM3_UPD_OVF_BRK_IRQHandler:
 641  0082 3b0002        	push	c_x+2
 642  0085 be00          	ldw	x,c_x
 643  0087 89            	pushw	x
 644  0088 3b0002        	push	c_y+2
 645  008b be00          	ldw	x,c_y
 646  008d 89            	pushw	x
 649                     ; 370 	  if (TIM3_GetITStatus(TIM3_IT_UPDATE) != RESET)
 651  008e a601          	ld	a,#1
 652  0090 cd0000        	call	_TIM3_GetITStatus
 654  0093 4d            	tnz	a
 655  0094 2708          	jreq	L132
 656                     ; 372 		  TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 658  0096 a601          	ld	a,#1
 659  0098 cd0000        	call	_TIM3_ClearITPendingBit
 661                     ; 374 		  Isr_IR_Timeout10ms();
 663  009b cd0000        	call	_Isr_IR_Timeout10ms
 665  009e               L132:
 666                     ; 376  }
 669  009e 85            	popw	x
 670  009f bf00          	ldw	c_y,x
 671  00a1 320002        	pop	c_y+2
 672  00a4 85            	popw	x
 673  00a5 bf00          	ldw	c_x,x
 674  00a7 320002        	pop	c_x+2
 675  00aa 80            	iret
 698                     ; 383  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 698                     ; 384  {
 699                     	switch	.text
 700  00ab               f_TIM3_CAP_COM_IRQHandler:
 704                     ; 388  }
 707  00ab 80            	iret
 733                     ; 398  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 733                     ; 399  {
 734                     	switch	.text
 735  00ac               f_UART1_TX_IRQHandler:
 737  00ac 3b0002        	push	c_x+2
 738  00af be00          	ldw	x,c_x
 739  00b1 89            	pushw	x
 740  00b2 3b0002        	push	c_y+2
 741  00b5 be00          	ldw	x,c_y
 742  00b7 89            	pushw	x
 745                     ; 405 		UART1_SendData8(l_TxRBuf.buf[l_TxRBuf.read]);
 747  00b8 b632          	ld	a,_l_TxRBuf+50
 748  00ba 5f            	clrw	x
 749  00bb 97            	ld	xl,a
 750  00bc e600          	ld	a,(_l_TxRBuf,x)
 751  00be cd0000        	call	_UART1_SendData8
 753                     ; 406 		l_TxRBuf.read++;
 755  00c1 3c32          	inc	_l_TxRBuf+50
 756                     ; 407 		if(l_TxRBuf.read >= BUF_SIZE)
 758  00c3 b632          	ld	a,_l_TxRBuf+50
 759  00c5 a132          	cp	a,#50
 760  00c7 2502          	jrult	L352
 761                     ; 408 			l_TxRBuf.read = 0;
 763  00c9 3f32          	clr	_l_TxRBuf+50
 764  00cb               L352:
 765                     ; 410 			if (l_TxRBuf.read == l_TxRBuf.write)
 767  00cb b632          	ld	a,_l_TxRBuf+50
 768  00cd b133          	cp	a,_l_TxRBuf+51
 769  00cf 2609          	jrne	L552
 770                     ; 413 					UART1_ITConfig(UART1_IT_TXE, DISABLE);
 772  00d1 4b00          	push	#0
 773  00d3 ae0277        	ldw	x,#631
 774  00d6 cd0000        	call	_UART1_ITConfig
 776  00d9 84            	pop	a
 777  00da               L552:
 778                     ; 416  }
 781  00da 85            	popw	x
 782  00db bf00          	ldw	c_y,x
 783  00dd 320002        	pop	c_y+2
 784  00e0 85            	popw	x
 785  00e1 bf00          	ldw	c_x,x
 786  00e3 320002        	pop	c_x+2
 787  00e6 80            	iret
 810                     ; 423  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 810                     ; 424  {
 811                     	switch	.text
 812  00e7               f_UART1_RX_IRQHandler:
 816                     ; 440  }
 819  00e7 80            	iret
 841                     ; 448 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 841                     ; 449 {
 842                     	switch	.text
 843  00e8               f_I2C_IRQHandler:
 847                     ; 453 }
 850  00e8 80            	iret
 876                     ; 501  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 876                     ; 502  {
 877                     	switch	.text
 878  00e9               f_UART3_TX_IRQHandler:
 880  00e9 3b0002        	push	c_x+2
 881  00ec be00          	ldw	x,c_x
 882  00ee 89            	pushw	x
 883  00ef 3b0002        	push	c_y+2
 884  00f2 be00          	ldw	x,c_y
 885  00f4 89            	pushw	x
 888                     ; 508 	UART3_SendData8(l_TxRBuf_Dbg.buf[l_TxRBuf_Dbg.read]);
 890  00f5 b632          	ld	a,_l_TxRBuf_Dbg+50
 891  00f7 5f            	clrw	x
 892  00f8 97            	ld	xl,a
 893  00f9 e600          	ld	a,(_l_TxRBuf_Dbg,x)
 894  00fb cd0000        	call	_UART3_SendData8
 896                     ; 509 	l_TxRBuf_Dbg.read++;
 898  00fe 3c32          	inc	_l_TxRBuf_Dbg+50
 899                     ; 510 	if(l_TxRBuf_Dbg.read >= BUF_SIZE)
 901  0100 b632          	ld	a,_l_TxRBuf_Dbg+50
 902  0102 a132          	cp	a,#50
 903  0104 2502          	jrult	L703
 904                     ; 511 		l_TxRBuf_Dbg.read = 0;
 906  0106 3f32          	clr	_l_TxRBuf_Dbg+50
 907  0108               L703:
 908                     ; 513 		if (l_TxRBuf_Dbg.read == l_TxRBuf_Dbg.write)
 910  0108 b632          	ld	a,_l_TxRBuf_Dbg+50
 911  010a b133          	cp	a,_l_TxRBuf_Dbg+51
 912  010c 2609          	jrne	L113
 913                     ; 516 				UART3_ITConfig(UART3_IT_TXE, DISABLE);
 915  010e 4b00          	push	#0
 916  0110 ae0277        	ldw	x,#631
 917  0113 cd0000        	call	_UART3_ITConfig
 919  0116 84            	pop	a
 920  0117               L113:
 921                     ; 520  }
 924  0117 85            	popw	x
 925  0118 bf00          	ldw	c_y,x
 926  011a 320002        	pop	c_y+2
 927  011d 85            	popw	x
 928  011e bf00          	ldw	c_x,x
 929  0120 320002        	pop	c_x+2
 930  0123 80            	iret
 953                     ; 527  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 953                     ; 528  {
 954                     	switch	.text
 955  0124               f_UART3_RX_IRQHandler:
 959                     ; 532  }
 962  0124 80            	iret
 984                     ; 541  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 984                     ; 542  {
 985                     	switch	.text
 986  0125               f_ADC2_IRQHandler:
 990                     ; 546  }
 993  0125 80            	iret
1016                     ; 581  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1016                     ; 582  {
1017                     	switch	.text
1018  0126               f_TIM4_UPD_OVF_IRQHandler:
1022                     ; 586  }
1025  0126 80            	iret
1048                     ; 594 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1048                     ; 595 {
1049                     	switch	.text
1050  0127               f_EEPROM_EEC_IRQHandler:
1054                     ; 599 }
1057  0127 80            	iret
1071                     	xref.b	_l_TxRBuf_Dbg
1072                     	xref.b	_l_TxRBuf
1073                     	xref	_ISR_IRReceive
1074                     	xref	_Isr_IR_Timeout100us
1075                     	xref	_Isr_IR_Timeout10ms
1076                     	xdef	f_EEPROM_EEC_IRQHandler
1077                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1078                     	xdef	f_ADC2_IRQHandler
1079                     	xdef	f_UART3_TX_IRQHandler
1080                     	xdef	f_UART3_RX_IRQHandler
1081                     	xdef	f_I2C_IRQHandler
1082                     	xdef	f_UART1_RX_IRQHandler
1083                     	xdef	f_UART1_TX_IRQHandler
1084                     	xdef	f_TIM3_CAP_COM_IRQHandler
1085                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1086                     	xdef	f_TIM2_CAP_COM_IRQHandler
1087                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1088                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1089                     	xdef	f_TIM1_CAP_COM_IRQHandler
1090                     	xdef	f_SPI_IRQHandler
1091                     	xdef	f_CAN_TX_IRQHandler
1092                     	xdef	f_CAN_RX_IRQHandler
1093                     	xdef	f_EXTI_PORTE_IRQHandler
1094                     	xdef	f_EXTI_PORTD_IRQHandler
1095                     	xdef	f_EXTI_PORTC_IRQHandler
1096                     	xdef	f_EXTI_PORTB_IRQHandler
1097                     	xdef	f_EXTI_PORTA_IRQHandler
1098                     	xdef	f_CLK_IRQHandler
1099                     	xdef	f_AWU_IRQHandler
1100                     	xdef	f_TLI_IRQHandler
1101                     	xdef	f_TRAP_IRQHandler
1102                     	xref	_UART3_SendData8
1103                     	xref	_UART3_ITConfig
1104                     	xref	_UART1_SendData8
1105                     	xref	_UART1_ITConfig
1106                     	xref	_TIM3_ClearITPendingBit
1107                     	xref	_TIM3_GetITStatus
1108                     	xref	_TIM2_ClearITPendingBit
1109                     	xref	_TIM2_GetITStatus
1110                     	xref	_GPIO_ReadInputData
1111                     	xref.b	c_x
1112                     	xref.b	c_y
1131                     	end

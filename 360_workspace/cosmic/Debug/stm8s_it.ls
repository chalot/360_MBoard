   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 81 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  44                     ; 82 {
  45                     	switch	.text
  46  0000               f_TRAP_IRQHandler:
  50                     ; 86 }
  53  0000 80            	iret
  75                     ; 93 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  75                     ; 94 
  75                     ; 95 {
  76                     	switch	.text
  77  0001               f_TLI_IRQHandler:
  81                     ; 99 }
  84  0001 80            	iret
 106                     ; 106 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 106                     ; 107 {
 107                     	switch	.text
 108  0002               f_AWU_IRQHandler:
 112                     ; 111 }
 115  0002 80            	iret
 137                     ; 118 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 137                     ; 119 {
 138                     	switch	.text
 139  0003               f_CLK_IRQHandler:
 143                     ; 123 }
 146  0003 80            	iret
 169                     ; 130 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 169                     ; 131 {
 170                     	switch	.text
 171  0004               f_EXTI_PORTA_IRQHandler:
 175                     ; 135 }
 178  0004 80            	iret
 201                     ; 142 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 201                     ; 143 {
 202                     	switch	.text
 203  0005               f_EXTI_PORTB_IRQHandler:
 207                     ; 147 }
 210  0005 80            	iret
 233                     ; 154 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 233                     ; 155 {
 234                     	switch	.text
 235  0006               f_EXTI_PORTC_IRQHandler:
 239                     ; 159 }
 242  0006 80            	iret
 265                     ; 166 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 265                     ; 167 {
 266                     	switch	.text
 267  0007               f_EXTI_PORTD_IRQHandler:
 271                     ; 171 }
 274  0007 80            	iret
 297                     ; 178 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 297                     ; 179 {
 298                     	switch	.text
 299  0008               f_EXTI_PORTE_IRQHandler:
 303                     ; 183 }
 306  0008 80            	iret
 328                     ; 205  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 328                     ; 206  {
 329                     	switch	.text
 330  0009               f_CAN_RX_IRQHandler:
 334                     ; 210  }
 337  0009 80            	iret
 359                     ; 217  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 359                     ; 218  {
 360                     	switch	.text
 361  000a               f_CAN_TX_IRQHandler:
 365                     ; 222  }
 368  000a 80            	iret
 390                     ; 230 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 390                     ; 231 {
 391                     	switch	.text
 392  000b               f_SPI_IRQHandler:
 396                     ; 235 }
 399  000b 80            	iret
 422                     ; 242 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 422                     ; 243 {
 423                     	switch	.text
 424  000c               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 428                     ; 247 }
 431  000c 80            	iret
 454                     ; 254 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 454                     ; 255 {
 455                     	switch	.text
 456  000d               f_TIM1_CAP_COM_IRQHandler:
 460                     ; 259 }
 463  000d 80            	iret
 486                     ; 292  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 486                     ; 293  {
 487                     	switch	.text
 488  000e               f_TIM2_UPD_OVF_BRK_IRQHandler:
 492                     ; 297  }
 495  000e 80            	iret
 518                     ; 304  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 518                     ; 305  {
 519                     	switch	.text
 520  000f               f_TIM2_CAP_COM_IRQHandler:
 524                     ; 309  }
 527  000f 80            	iret
 550                     ; 319  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 550                     ; 320  {
 551                     	switch	.text
 552  0010               f_TIM3_UPD_OVF_BRK_IRQHandler:
 556                     ; 324  }
 559  0010 80            	iret
 582                     ; 331  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 582                     ; 332  {
 583                     	switch	.text
 584  0011               f_TIM3_CAP_COM_IRQHandler:
 588                     ; 336  }
 591  0011 80            	iret
 620                     ; 346  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 620                     ; 347  {
 621                     	switch	.text
 622  0012               f_UART1_TX_IRQHandler:
 624       00000001      OFST:	set	1
 625  0012 3b0002        	push	c_x+2
 626  0015 be00          	ldw	x,c_x
 627  0017 89            	pushw	x
 628  0018 3b0002        	push	c_y+2
 629  001b be00          	ldw	x,c_y
 630  001d 89            	pushw	x
 631  001e 88            	push	a
 634                     ; 352     UART1_SendData8(TxBuffer1[IncrementVar_TxCounter1()]);
 636  001f cd0000        	call	_IncrementVar_TxCounter1
 638  0022 5f            	clrw	x
 639  0023 97            	ld	xl,a
 640  0024 e600          	ld	a,(_TxBuffer1,x)
 641  0026 cd0000        	call	_UART1_SendData8
 643                     ; 354     if (GetVar_TxCounter1() == GetVar_NbrOfDataToTransfer1())
 645  0029 cd0000        	call	_GetVar_NbrOfDataToTransfer1
 647  002c 6b01          	ld	(OFST+0,sp),a
 648  002e cd0000        	call	_GetVar_TxCounter1
 650  0031 1101          	cp	a,(OFST+0,sp)
 651  0033 2609          	jrne	L142
 652                     ; 357         UART1_ITConfig(UART1_IT_TXE, DISABLE);
 654  0035 4b00          	push	#0
 655  0037 ae0277        	ldw	x,#631
 656  003a cd0000        	call	_UART1_ITConfig
 658  003d 84            	pop	a
 659  003e               L142:
 660                     ; 360  }
 663  003e 84            	pop	a
 664  003f 85            	popw	x
 665  0040 bf00          	ldw	c_y,x
 666  0042 320002        	pop	c_y+2
 667  0045 85            	popw	x
 668  0046 bf00          	ldw	c_x,x
 669  0048 320002        	pop	c_x+2
 670  004b 80            	iret
 699                     ; 367  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 699                     ; 368  {
 700                     	switch	.text
 701  004c               f_UART1_RX_IRQHandler:
 703       00000001      OFST:	set	1
 704  004c 3b0002        	push	c_x+2
 705  004f be00          	ldw	x,c_x
 706  0051 89            	pushw	x
 707  0052 3b0002        	push	c_y+2
 708  0055 be00          	ldw	x,c_y
 709  0057 89            	pushw	x
 710  0058 88            	push	a
 713                     ; 373 	RxBuffer1[IncrementVar_RxCounter1()] = UART1_ReceiveData8();
 715  0059 cd0000        	call	_IncrementVar_RxCounter1
 717  005c 5f            	clrw	x
 718  005d 97            	ld	xl,a
 719  005e 89            	pushw	x
 720  005f cd0000        	call	_UART1_ReceiveData8
 722  0062 85            	popw	x
 723  0063 e700          	ld	(_RxBuffer1,x),a
 724                     ; 375 	if (GetVar_RxCounter1() == GetVar_NbrOfDataToRead1())
 726  0065 cd0000        	call	_GetVar_NbrOfDataToRead1
 728  0068 6b01          	ld	(OFST+0,sp),a
 729  006a cd0000        	call	_GetVar_RxCounter1
 731  006d 1101          	cp	a,(OFST+0,sp)
 732  006f 2609          	jrne	L352
 733                     ; 378 		UART1_ITConfig(UART1_IT_RXNE_OR, DISABLE);
 735  0071 4b00          	push	#0
 736  0073 ae0205        	ldw	x,#517
 737  0076 cd0000        	call	_UART1_ITConfig
 739  0079 84            	pop	a
 740  007a               L352:
 741                     ; 383  }
 744  007a 84            	pop	a
 745  007b 85            	popw	x
 746  007c bf00          	ldw	c_y,x
 747  007e 320002        	pop	c_y+2
 748  0081 85            	popw	x
 749  0082 bf00          	ldw	c_x,x
 750  0084 320002        	pop	c_x+2
 751  0087 80            	iret
 773                     ; 391 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 773                     ; 392 {
 774                     	switch	.text
 775  0088               f_I2C_IRQHandler:
 779                     ; 396 }
 782  0088 80            	iret
 811                     ; 430  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
 811                     ; 431  {
 812                     	switch	.text
 813  0089               f_UART3_TX_IRQHandler:
 815       00000001      OFST:	set	1
 816  0089 3b0002        	push	c_x+2
 817  008c be00          	ldw	x,c_x
 818  008e 89            	pushw	x
 819  008f 3b0002        	push	c_y+2
 820  0092 be00          	ldw	x,c_y
 821  0094 89            	pushw	x
 822  0095 88            	push	a
 825                     ; 437     UART3_SendData8(TxBuffer2[IncrementVar_TxCounter2()]);
 827  0096 cd0000        	call	_IncrementVar_TxCounter2
 829  0099 5f            	clrw	x
 830  009a 97            	ld	xl,a
 831  009b e600          	ld	a,(_TxBuffer2,x)
 832  009d cd0000        	call	_UART3_SendData8
 834                     ; 439 	 if (GetVar_TxCounter2() == GetVar_NbrOfDataToTransfer2())
 836  00a0 cd0000        	call	_GetVar_NbrOfDataToTransfer2
 838  00a3 6b01          	ld	(OFST+0,sp),a
 839  00a5 cd0000        	call	_GetVar_TxCounter2
 841  00a8 1101          	cp	a,(OFST+0,sp)
 842  00aa 2609          	jrne	L572
 843                     ; 442         UART3_ITConfig(UART3_IT_TXE, DISABLE);
 845  00ac 4b00          	push	#0
 846  00ae ae0277        	ldw	x,#631
 847  00b1 cd0000        	call	_UART3_ITConfig
 849  00b4 84            	pop	a
 850  00b5               L572:
 851                     ; 444  }
 854  00b5 84            	pop	a
 855  00b6 85            	popw	x
 856  00b7 bf00          	ldw	c_y,x
 857  00b9 320002        	pop	c_y+2
 858  00bc 85            	popw	x
 859  00bd bf00          	ldw	c_x,x
 860  00bf 320002        	pop	c_x+2
 861  00c2 80            	iret
 884                     ; 451  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
 884                     ; 452  {
 885                     	switch	.text
 886  00c3               f_UART3_RX_IRQHandler:
 890                     ; 456  }
 893  00c3 80            	iret
 915                     ; 465  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
 915                     ; 466  {
 916                     	switch	.text
 917  00c4               f_ADC2_IRQHandler:
 921                     ; 470  }
 924  00c4 80            	iret
 947                     ; 505  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 947                     ; 506  {
 948                     	switch	.text
 949  00c5               f_TIM4_UPD_OVF_IRQHandler:
 953                     ; 510  }
 956  00c5 80            	iret
 979                     ; 518 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 979                     ; 519 {
 980                     	switch	.text
 981  00c6               f_EEPROM_EEC_IRQHandler:
 985                     ; 523 }
 988  00c6 80            	iret
1000                     	xref.b	_RxBuffer1
1001                     	xref.b	_TxBuffer2
1002                     	xref.b	_TxBuffer1
1003                     	xref	_GetVar_NbrOfDataToRead1
1004                     	xref	_GetVar_NbrOfDataToTransfer2
1005                     	xref	_GetVar_NbrOfDataToTransfer1
1006                     	xref	_IncrementVar_RxCounter1
1007                     	xref	_IncrementVar_TxCounter2
1008                     	xref	_IncrementVar_TxCounter1
1009                     	xref	_GetVar_RxCounter1
1010                     	xref	_GetVar_TxCounter2
1011                     	xref	_GetVar_TxCounter1
1012                     	xdef	f_EEPROM_EEC_IRQHandler
1013                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1014                     	xdef	f_ADC2_IRQHandler
1015                     	xdef	f_UART3_TX_IRQHandler
1016                     	xdef	f_UART3_RX_IRQHandler
1017                     	xdef	f_I2C_IRQHandler
1018                     	xdef	f_UART1_RX_IRQHandler
1019                     	xdef	f_UART1_TX_IRQHandler
1020                     	xdef	f_TIM3_CAP_COM_IRQHandler
1021                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1022                     	xdef	f_TIM2_CAP_COM_IRQHandler
1023                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1024                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1025                     	xdef	f_TIM1_CAP_COM_IRQHandler
1026                     	xdef	f_SPI_IRQHandler
1027                     	xdef	f_CAN_TX_IRQHandler
1028                     	xdef	f_CAN_RX_IRQHandler
1029                     	xdef	f_EXTI_PORTE_IRQHandler
1030                     	xdef	f_EXTI_PORTD_IRQHandler
1031                     	xdef	f_EXTI_PORTC_IRQHandler
1032                     	xdef	f_EXTI_PORTB_IRQHandler
1033                     	xdef	f_EXTI_PORTA_IRQHandler
1034                     	xdef	f_CLK_IRQHandler
1035                     	xdef	f_AWU_IRQHandler
1036                     	xdef	f_TLI_IRQHandler
1037                     	xdef	f_TRAP_IRQHandler
1038                     	xref	_UART3_SendData8
1039                     	xref	_UART3_ITConfig
1040                     	xref	_UART1_SendData8
1041                     	xref	_UART1_ReceiveData8
1042                     	xref	_UART1_ITConfig
1043                     	xref.b	c_x
1044                     	xref.b	c_y
1063                     	end

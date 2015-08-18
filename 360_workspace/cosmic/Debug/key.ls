   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	bsct
  16  0000               L5_l_KeyCurDet:
  17  0000 00            	dc.b	0
 161                     ; 31 void KEY_Process()
 161                     ; 32 {
 163                     	switch	.text
 164  0000               _KEY_Process:
 166  0000 89            	pushw	x
 167       00000002      OFST:	set	2
 170                     ; 33 	eKEYTYPE i = 0;
 172  0001 0f02          	clr	(OFST+0,sp)
 173                     ; 36 	if(g_KeyState[l_KeyCurDet] == KEY_GetCurrentState(l_KeyCurDet))
 175  0003 b600          	ld	a,L5_l_KeyCurDet
 176  0005 cd0135        	call	L7_KEY_GetCurrentState
 178  0008 6b01          	ld	(OFST-1,sp),a
 179  000a b600          	ld	a,L5_l_KeyCurDet
 180  000c 5f            	clrw	x
 181  000d 97            	ld	xl,a
 182  000e e614          	ld	a,(_g_KeyState,x)
 183  0010 1101          	cp	a,(OFST-1,sp)
 184  0012 260c          	jrne	L701
 185                     ; 38 		l_KeyCurDet ++;
 187  0014 3c00          	inc	L5_l_KeyCurDet
 188                     ; 39 		if(l_KeyCurDet == KEY_DET_END)
 190  0016 b600          	ld	a,L5_l_KeyCurDet
 191  0018 a104          	cp	a,#4
 192  001a 2602          	jrne	L111
 193                     ; 41 			l_KeyCurDet = KEY_DET_ACC;
 195  001c 3f00          	clr	L5_l_KeyCurDet
 196  001e               L111:
 197                     ; 44 		return;
 199  001e 201e          	jra	L6
 200  0020               L701:
 201                     ; 48 	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_IDLE)
 203  0020 b600          	ld	a,L5_l_KeyCurDet
 204  0022 97            	ld	xl,a
 205  0023 a605          	ld	a,#5
 206  0025 42            	mul	x,a
 207  0026 6d00          	tnz	(L3_l_KeyDetStat,x)
 208  0028 2616          	jrne	L311
 209                     ; 50 		l_KeyDetStat[l_KeyCurDet].u16Counts = 0;
 211  002a b600          	ld	a,L5_l_KeyCurDet
 212  002c 97            	ld	xl,a
 213  002d a605          	ld	a,#5
 214  002f 42            	mul	x,a
 215  0030 905f          	clrw	y
 216  0032 ef03          	ldw	(L3_l_KeyDetStat+3,x),y
 217                     ; 51 		l_KeyDetStat[l_KeyCurDet].eDetState = DET_DETECTING;
 219  0034 b600          	ld	a,L5_l_KeyCurDet
 220  0036 97            	ld	xl,a
 221  0037 a605          	ld	a,#5
 222  0039 42            	mul	x,a
 223  003a a601          	ld	a,#1
 224  003c e700          	ld	(L3_l_KeyDetStat,x),a
 225                     ; 52 		return;
 226  003e               L6:
 229  003e 85            	popw	x
 230  003f 81            	ret
 231  0040               L311:
 232                     ; 56 	if(l_KeyDetStat[l_KeyCurDet].eDetState == DET_DETECTING)
 234  0040 b600          	ld	a,L5_l_KeyCurDet
 235  0042 97            	ld	xl,a
 236  0043 a605          	ld	a,#5
 237  0045 42            	mul	x,a
 238  0046 e600          	ld	a,(L3_l_KeyDetStat,x)
 239  0048 a101          	cp	a,#1
 240  004a 2674          	jrne	L511
 241                     ; 58 		l_KeyDetStat[l_KeyCurDet].u16Counts ++;
 243  004c b600          	ld	a,L5_l_KeyCurDet
 244  004e 97            	ld	xl,a
 245  004f a605          	ld	a,#5
 246  0051 42            	mul	x,a
 247  0052 9093          	ldw	y,x
 248  0054 ee03          	ldw	x,(L3_l_KeyDetStat+3,x)
 249  0056 1c0001        	addw	x,#1
 250  0059 90ef03        	ldw	(L3_l_KeyDetStat+3,y),x
 251                     ; 59 		if(l_KeyDetStat[l_KeyCurDet].u16Counts < DET_JITERY)
 253  005c b600          	ld	a,L5_l_KeyCurDet
 254  005e 97            	ld	xl,a
 255  005f a605          	ld	a,#5
 256  0061 42            	mul	x,a
 257  0062 9093          	ldw	y,x
 258  0064 90ee03        	ldw	y,(L3_l_KeyDetStat+3,y)
 259  0067 90a30064      	cpw	y,#100
 260  006b 2405          	jruge	L711
 261                     ; 61 			Delay_1ms();
 263  006d cd0000        	call	_Delay_1ms
 265                     ; 62 			return;
 267  0070 20cc          	jra	L6
 268  0072               L711:
 269                     ; 66 			l_KeyDetStat[l_KeyCurDet].eDetState = DET_IDLE;
 271  0072 b600          	ld	a,L5_l_KeyCurDet
 272  0074 97            	ld	xl,a
 273  0075 a605          	ld	a,#5
 274  0077 42            	mul	x,a
 275  0078 6f00          	clr	(L3_l_KeyDetStat,x)
 276                     ; 67 			g_KeyState[l_KeyCurDet] = KEY_GetCurrentState(l_KeyCurDet);
 278  007a b600          	ld	a,L5_l_KeyCurDet
 279  007c 5f            	clrw	x
 280  007d 97            	ld	xl,a
 281  007e 89            	pushw	x
 282  007f b600          	ld	a,L5_l_KeyCurDet
 283  0081 cd0135        	call	L7_KEY_GetCurrentState
 285  0084 85            	popw	x
 286  0085 e714          	ld	(_g_KeyState,x),a
 287                     ; 70 			switch(l_KeyCurDet) 
 289  0087 b600          	ld	a,L5_l_KeyCurDet
 291                     ; 84 			default:
 291                     ; 85 				break;
 292  0089 4d            	tnz	a
 293  008a 270b          	jreq	L31
 294  008c 4a            	dec	a
 295  008d 2712          	jreq	L51
 296  008f 4a            	dec	a
 297  0090 271a          	jreq	L71
 298  0092 4a            	dec	a
 299  0093 2722          	jreq	L12
 300  0095 2029          	jra	L521
 301  0097               L31:
 302                     ; 72 			case	KEY_DET_ACC:	
 302                     ; 73 				COMM_RequestSendCommand(KEY_ACC, g_KeyState[KEY_DET_ACC]);
 304  0097 b614          	ld	a,_g_KeyState
 305  0099 97            	ld	xl,a
 306  009a 4f            	clr	a
 307  009b 95            	ld	xh,a
 308  009c cd0000        	call	_COMM_RequestSendCommand
 310                     ; 74 				break;
 312  009f 201f          	jra	L521
 313  00a1               L51:
 314                     ; 75 			case	KEY_DET_LEFT:	
 314                     ; 76 				COMM_RequestSendCommand(KEY_LEFT, g_KeyState[KEY_DET_LEFT]);
 316  00a1 b615          	ld	a,_g_KeyState+1
 317  00a3 97            	ld	xl,a
 318  00a4 a602          	ld	a,#2
 319  00a6 95            	ld	xh,a
 320  00a7 cd0000        	call	_COMM_RequestSendCommand
 322                     ; 77 				break;
 324  00aa 2014          	jra	L521
 325  00ac               L71:
 326                     ; 78 			case	KEY_DET_RIGHT:	
 326                     ; 79 				COMM_RequestSendCommand(KEY_RIGHT, g_KeyState[KEY_DET_RIGHT]);
 328  00ac b616          	ld	a,_g_KeyState+2
 329  00ae 97            	ld	xl,a
 330  00af a603          	ld	a,#3
 331  00b1 95            	ld	xh,a
 332  00b2 cd0000        	call	_COMM_RequestSendCommand
 334                     ; 80 				break;
 336  00b5 2009          	jra	L521
 337  00b7               L12:
 338                     ; 81 			case	KEY_DET_REAR:	
 338                     ; 82 				COMM_RequestSendCommand(KEY_REAR, g_KeyState[KEY_DET_REAR]);
 340  00b7 b617          	ld	a,_g_KeyState+3
 341  00b9 97            	ld	xl,a
 342  00ba a604          	ld	a,#4
 343  00bc 95            	ld	xh,a
 344  00bd cd0000        	call	_COMM_RequestSendCommand
 346                     ; 83 				break;
 348  00c0               L32:
 349                     ; 84 			default:
 349                     ; 85 				break;
 351  00c0               L521:
 352                     ; 87 			return;			
 354  00c0               L511:
 355                     ; 91 }
 356  00c0               L01:
 359  00c0 85            	popw	x
 360  00c1 81            	ret
 384                     ; 94 void KEY_Lowlevel_Init()
 384                     ; 95 {
 385                     	switch	.text
 386  00c2               L11_KEY_Lowlevel_Init:
 390                     ; 96 	GPIO_Init(GPIO_ACC_PORT, (GPIO_Pin_TypeDef)GPIO_ACC_PIN, GPIO_MODE_IN_FL_NO_IT);
 392  00c2 4b00          	push	#0
 393  00c4 4b40          	push	#64
 394  00c6 ae5005        	ldw	x,#20485
 395  00c9 cd0000        	call	_GPIO_Init
 397  00cc 85            	popw	x
 398                     ; 97 	GPIO_Init(GPIO_LEFT_PORT, (GPIO_Pin_TypeDef)GPIO_LEFT_PIN, GPIO_MODE_IN_FL_NO_IT);
 400  00cd 4b00          	push	#0
 401  00cf 4b10          	push	#16
 402  00d1 ae5005        	ldw	x,#20485
 403  00d4 cd0000        	call	_GPIO_Init
 405  00d7 85            	popw	x
 406                     ; 98 	GPIO_Init(GPIO_RIGHT_PORT, (GPIO_Pin_TypeDef)GPIO_RIGHT_PIN, GPIO_MODE_IN_FL_NO_IT);
 408  00d8 4b00          	push	#0
 409  00da 4b20          	push	#32
 410  00dc ae5005        	ldw	x,#20485
 411  00df cd0000        	call	_GPIO_Init
 413  00e2 85            	popw	x
 414                     ; 99 	GPIO_Init(GPIO_REAR_PORT, (GPIO_Pin_TypeDef)GPIO_REAR_PIN, GPIO_MODE_IN_FL_NO_IT);
 416  00e3 4b00          	push	#0
 417  00e5 4b02          	push	#2
 418  00e7 ae5005        	ldw	x,#20485
 419  00ea cd0000        	call	_GPIO_Init
 421  00ed 85            	popw	x
 422                     ; 107 }
 425  00ee 81            	ret
 463                     ; 109 void KEY_Init()
 463                     ; 110 {
 464                     	switch	.text
 465  00ef               _KEY_Init:
 467  00ef 88            	push	a
 468       00000001      OFST:	set	1
 471                     ; 111 	u8 i = 0;
 473  00f0 0f01          	clr	(OFST+0,sp)
 474                     ; 114 	KEY_Lowlevel_Init();
 476  00f2 adce          	call	L11_KEY_Lowlevel_Init
 479  00f4 2020          	jra	L751
 480  00f6               L551:
 481                     ; 119 	  l_KeyDetStat[i].eDetState = DET_IDLE;
 483  00f6 7b01          	ld	a,(OFST+0,sp)
 484  00f8 97            	ld	xl,a
 485  00f9 a605          	ld	a,#5
 486  00fb 42            	mul	x,a
 487  00fc 6f00          	clr	(L3_l_KeyDetStat,x)
 488                     ; 120 	  l_KeyDetStat[i].u16Delay = DET_JITERY;
 490  00fe 7b01          	ld	a,(OFST+0,sp)
 491  0100 97            	ld	xl,a
 492  0101 a605          	ld	a,#5
 493  0103 42            	mul	x,a
 494  0104 90ae0064      	ldw	y,#100
 495  0108 ef01          	ldw	(L3_l_KeyDetStat+1,x),y
 496                     ; 121 	  l_KeyDetStat[i].u16Counts = 0;
 498  010a 7b01          	ld	a,(OFST+0,sp)
 499  010c 97            	ld	xl,a
 500  010d a605          	ld	a,#5
 501  010f 42            	mul	x,a
 502  0110 905f          	clrw	y
 503  0112 ef03          	ldw	(L3_l_KeyDetStat+3,x),y
 504                     ; 123 	  i++;
 506  0114 0c01          	inc	(OFST+0,sp)
 507  0116               L751:
 508                     ; 117 	while(i < KEY_DET_END) 
 510  0116 7b01          	ld	a,(OFST+0,sp)
 511  0118 a104          	cp	a,#4
 512  011a 25da          	jrult	L551
 513                     ; 127 	g_KeyState[KEY_DET_ACC] = KEY_GetCurrentState(KEY_DET_ACC);
 515  011c 4f            	clr	a
 516  011d ad16          	call	L7_KEY_GetCurrentState
 518  011f b714          	ld	_g_KeyState,a
 519                     ; 128 	g_KeyState[KEY_DET_LEFT] = KEY_GetCurrentState(KEY_DET_LEFT);
 521  0121 a601          	ld	a,#1
 522  0123 ad10          	call	L7_KEY_GetCurrentState
 524  0125 b715          	ld	_g_KeyState+1,a
 525                     ; 129 	g_KeyState[KEY_DET_RIGHT] = KEY_GetCurrentState(KEY_DET_RIGHT);
 527  0127 a602          	ld	a,#2
 528  0129 ad0a          	call	L7_KEY_GetCurrentState
 530  012b b716          	ld	_g_KeyState+2,a
 531                     ; 130 	g_KeyState[KEY_DET_REAR] = KEY_GetCurrentState(KEY_DET_REAR);
 533  012d a603          	ld	a,#3
 534  012f ad04          	call	L7_KEY_GetCurrentState
 536  0131 b717          	ld	_g_KeyState+3,a
 537                     ; 131 }
 540  0133 84            	pop	a
 541  0134 81            	ret
 610                     ; 133 eKEYSTATE KEY_GetCurrentState(eKEYTYPE eType)
 610                     ; 134 {
 611                     	switch	.text
 612  0135               L7_KEY_GetCurrentState:
 614  0135 88            	push	a
 615  0136 88            	push	a
 616       00000001      OFST:	set	1
 619                     ; 137 	assert_param(eStat < KEY_DET_END);
 621  0137 7b01          	ld	a,(OFST+0,sp)
 622  0139 a104          	cp	a,#4
 623  013b 2403          	jruge	L02
 624  013d 4f            	clr	a
 625  013e 2010          	jra	L22
 626  0140               L02:
 627  0140 ae0089        	ldw	x,#137
 628  0143 89            	pushw	x
 629  0144 ae0000        	ldw	x,#0
 630  0147 89            	pushw	x
 631  0148 ae0000        	ldw	x,#L722
 632  014b cd0000        	call	_assert_failed
 634  014e 5b04          	addw	sp,#4
 635  0150               L22:
 636                     ; 139 	switch(eType)
 638  0150 7b02          	ld	a,(OFST+1,sp)
 640                     ; 153 	default:
 640                     ; 154 		break;
 641  0152 4d            	tnz	a
 642  0153 270b          	jreq	L361
 643  0155 4a            	dec	a
 644  0156 271b          	jreq	L561
 645  0158 4a            	dec	a
 646  0159 272b          	jreq	L761
 647  015b 4a            	dec	a
 648  015c 273b          	jreq	L171
 649  015e 204a          	jra	L332
 650  0160               L361:
 651                     ; 141 	case KEY_DET_ACC: 
 651                     ; 142 		eStat = ((GPIO_ReadInputData(GPIO_ACC_PORT) & GPIO_ACC_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 653  0160 ae5005        	ldw	x,#20485
 654  0163 cd0000        	call	_GPIO_ReadInputData
 656  0166 a540          	bcp	a,#64
 657  0168 2604          	jrne	L42
 658  016a a601          	ld	a,#1
 659  016c 2001          	jra	L62
 660  016e               L42:
 661  016e 4f            	clr	a
 662  016f               L62:
 663  016f 6b01          	ld	(OFST+0,sp),a
 664                     ; 143 		break;		
 666  0171 2037          	jra	L332
 667  0173               L561:
 668                     ; 144 	case KEY_DET_LEFT: 
 668                     ; 145 		eStat = ((GPIO_ReadInputData(GPIO_LEFT_PORT) & GPIO_LEFT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 670  0173 ae5005        	ldw	x,#20485
 671  0176 cd0000        	call	_GPIO_ReadInputData
 673  0179 a510          	bcp	a,#16
 674  017b 2604          	jrne	L03
 675  017d a601          	ld	a,#1
 676  017f 2001          	jra	L23
 677  0181               L03:
 678  0181 4f            	clr	a
 679  0182               L23:
 680  0182 6b01          	ld	(OFST+0,sp),a
 681                     ; 146 		break;		
 683  0184 2024          	jra	L332
 684  0186               L761:
 685                     ; 147 	case KEY_DET_RIGHT: 
 685                     ; 148 		eStat = ((GPIO_ReadInputData(GPIO_RIGHT_PORT) & GPIO_RIGHT_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 687  0186 ae5005        	ldw	x,#20485
 688  0189 cd0000        	call	_GPIO_ReadInputData
 690  018c a520          	bcp	a,#32
 691  018e 2604          	jrne	L43
 692  0190 a601          	ld	a,#1
 693  0192 2001          	jra	L63
 694  0194               L43:
 695  0194 4f            	clr	a
 696  0195               L63:
 697  0195 6b01          	ld	(OFST+0,sp),a
 698                     ; 149 		break;		
 700  0197 2011          	jra	L332
 701  0199               L171:
 702                     ; 150 	case KEY_DET_REAR: 
 702                     ; 151 		eStat = ((GPIO_ReadInputData(GPIO_REAR_PORT) & GPIO_REAR_PIN) == KEY_LOW) ? KEY_ACTIVED : KEY_NORMAL;
 704  0199 ae5005        	ldw	x,#20485
 705  019c cd0000        	call	_GPIO_ReadInputData
 707  019f a502          	bcp	a,#2
 708  01a1 2604          	jrne	L04
 709  01a3 a601          	ld	a,#1
 710  01a5 2001          	jra	L24
 711  01a7               L04:
 712  01a7 4f            	clr	a
 713  01a8               L24:
 714  01a8 6b01          	ld	(OFST+0,sp),a
 715                     ; 152 		break;		
 717  01aa               L371:
 718                     ; 153 	default:
 718                     ; 154 		break;
 720  01aa               L332:
 721                     ; 157 	return eStat;
 723  01aa 7b01          	ld	a,(OFST+0,sp)
 726  01ac 85            	popw	x
 727  01ad 81            	ret
 868                     	switch	.ubsct
 869  0000               L3_l_KeyDetStat:
 870  0000 000000000000  	ds.b	20
 871  0014               _g_KeyState:
 872  0014 00000000      	ds.b	4
 873                     	xdef	_g_KeyState
 874                     	xref	_COMM_RequestSendCommand
 875                     	xref	_Delay_1ms
 876                     	xdef	_KEY_Init
 877                     	xdef	_KEY_Process
 878                     	xref	_assert_failed
 879                     	xref	_GPIO_ReadInputData
 880                     	xref	_GPIO_Init
 881                     .const:	section	.text
 882  0000               L722:
 883  0000 2e2e5c617070  	dc.b	"..\app\key.c",0
 903                     	end

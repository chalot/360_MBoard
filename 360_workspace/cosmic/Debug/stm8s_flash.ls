   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  76                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  76                     ; 82 {
  78                     	switch	.text
  79  0000               _FLASH_Unlock:
  81  0000 88            	push	a
  82       00000000      OFST:	set	0
  85                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  87  0001 a1fd          	cp	a,#253
  88  0003 2704          	jreq	L01
  89  0005 a1f7          	cp	a,#247
  90  0007 2603          	jrne	L6
  91  0009               L01:
  92  0009 4f            	clr	a
  93  000a 2010          	jra	L21
  94  000c               L6:
  95  000c ae0054        	ldw	x,#84
  96  000f 89            	pushw	x
  97  0010 ae0000        	ldw	x,#0
  98  0013 89            	pushw	x
  99  0014 ae0010        	ldw	x,#L73
 100  0017 cd0000        	call	_assert_failed
 102  001a 5b04          	addw	sp,#4
 103  001c               L21:
 104                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
 106  001c 7b01          	ld	a,(OFST+1,sp)
 107  001e a1fd          	cp	a,#253
 108  0020 260a          	jrne	L14
 109                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
 111  0022 35565062      	mov	20578,#86
 112                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 114  0026 35ae5062      	mov	20578,#174
 116  002a 2008          	jra	L34
 117  002c               L14:
 118                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 120  002c 35ae5064      	mov	20580,#174
 121                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 123  0030 35565064      	mov	20580,#86
 124  0034               L34:
 125                     ; 98 }
 128  0034 84            	pop	a
 129  0035 81            	ret
 165                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 165                     ; 107 {
 166                     	switch	.text
 167  0036               _FLASH_Lock:
 169  0036 88            	push	a
 170       00000000      OFST:	set	0
 173                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 175  0037 a1fd          	cp	a,#253
 176  0039 2704          	jreq	L02
 177  003b a1f7          	cp	a,#247
 178  003d 2603          	jrne	L61
 179  003f               L02:
 180  003f 4f            	clr	a
 181  0040 2010          	jra	L22
 182  0042               L61:
 183  0042 ae006d        	ldw	x,#109
 184  0045 89            	pushw	x
 185  0046 ae0000        	ldw	x,#0
 186  0049 89            	pushw	x
 187  004a ae0010        	ldw	x,#L73
 188  004d cd0000        	call	_assert_failed
 190  0050 5b04          	addw	sp,#4
 191  0052               L22:
 192                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 194  0052 c6505f        	ld	a,20575
 195  0055 1401          	and	a,(OFST+1,sp)
 196  0057 c7505f        	ld	20575,a
 197                     ; 113 }
 200  005a 84            	pop	a
 201  005b 81            	ret
 224                     ; 120 void FLASH_DeInit(void)
 224                     ; 121 {
 225                     	switch	.text
 226  005c               _FLASH_DeInit:
 230                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 232  005c 725f505a      	clr	20570
 233                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 235  0060 725f505b      	clr	20571
 236                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 238  0064 35ff505c      	mov	20572,#255
 239                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 241  0068 7217505f      	bres	20575,#3
 242                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 244  006c 7213505f      	bres	20575,#1
 245                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 247  0070 c6505f        	ld	a,20575
 248                     ; 128 }
 251  0073 81            	ret
 307                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 307                     ; 137 {
 308                     	switch	.text
 309  0074               _FLASH_ITConfig:
 311  0074 88            	push	a
 312       00000000      OFST:	set	0
 315                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 317  0075 4d            	tnz	a
 318  0076 2704          	jreq	L23
 319  0078 a101          	cp	a,#1
 320  007a 2603          	jrne	L03
 321  007c               L23:
 322  007c 4f            	clr	a
 323  007d 2010          	jra	L43
 324  007f               L03:
 325  007f ae008b        	ldw	x,#139
 326  0082 89            	pushw	x
 327  0083 ae0000        	ldw	x,#0
 328  0086 89            	pushw	x
 329  0087 ae0010        	ldw	x,#L73
 330  008a cd0000        	call	_assert_failed
 332  008d 5b04          	addw	sp,#4
 333  008f               L43:
 334                     ; 141     if (NewState != DISABLE)
 336  008f 0d01          	tnz	(OFST+1,sp)
 337  0091 2706          	jreq	L121
 338                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 340  0093 7212505a      	bset	20570,#1
 342  0097 2004          	jra	L321
 343  0099               L121:
 344                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 346  0099 7213505a      	bres	20570,#1
 347  009d               L321:
 348                     ; 149 }
 351  009d 84            	pop	a
 352  009e 81            	ret
 385                     .const:	section	.text
 386  0000               L64:
 387  0000 00008000      	dc.l	32768
 388  0004               L05:
 389  0004 00028000      	dc.l	163840
 390  0008               L25:
 391  0008 00004000      	dc.l	16384
 392  000c               L45:
 393  000c 00004800      	dc.l	18432
 394                     ; 158 void FLASH_EraseByte(uint32_t Address)
 394                     ; 159 {
 395                     	switch	.text
 396  009f               _FLASH_EraseByte:
 398       00000000      OFST:	set	0
 401                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 403  009f 96            	ldw	x,sp
 404  00a0 1c0003        	addw	x,#OFST+3
 405  00a3 cd0000        	call	c_ltor
 407  00a6 ae0000        	ldw	x,#L64
 408  00a9 cd0000        	call	c_lcmp
 410  00ac 250f          	jrult	L44
 411  00ae 96            	ldw	x,sp
 412  00af 1c0003        	addw	x,#OFST+3
 413  00b2 cd0000        	call	c_ltor
 415  00b5 ae0004        	ldw	x,#L05
 416  00b8 cd0000        	call	c_lcmp
 418  00bb 251e          	jrult	L24
 419  00bd               L44:
 420  00bd 96            	ldw	x,sp
 421  00be 1c0003        	addw	x,#OFST+3
 422  00c1 cd0000        	call	c_ltor
 424  00c4 ae0008        	ldw	x,#L25
 425  00c7 cd0000        	call	c_lcmp
 427  00ca 2512          	jrult	L04
 428  00cc 96            	ldw	x,sp
 429  00cd 1c0003        	addw	x,#OFST+3
 430  00d0 cd0000        	call	c_ltor
 432  00d3 ae000c        	ldw	x,#L45
 433  00d6 cd0000        	call	c_lcmp
 435  00d9 2403          	jruge	L04
 436  00db               L24:
 437  00db 4f            	clr	a
 438  00dc 2010          	jra	L65
 439  00de               L04:
 440  00de ae00a1        	ldw	x,#161
 441  00e1 89            	pushw	x
 442  00e2 ae0000        	ldw	x,#0
 443  00e5 89            	pushw	x
 444  00e6 ae0010        	ldw	x,#L73
 445  00e9 cd0000        	call	_assert_failed
 447  00ec 5b04          	addw	sp,#4
 448  00ee               L65:
 449                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 451  00ee 7b05          	ld	a,(OFST+5,sp)
 452  00f0 97            	ld	xl,a
 453  00f1 7b06          	ld	a,(OFST+6,sp)
 454  00f3 3f00          	clr	c_x
 455  00f5 02            	rlwa	x,a
 456  00f6 9093          	ldw	y,x
 457  00f8 bf01          	ldw	c_x+1,x
 458  00fa 4f            	clr	a
 459  00fb 92bd0000      	ldf	[c_x.e],a
 460                     ; 166 }
 463  00ff 81            	ret
 503                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 503                     ; 177 {
 504                     	switch	.text
 505  0100               _FLASH_ProgramByte:
 507       00000000      OFST:	set	0
 510                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 512  0100 96            	ldw	x,sp
 513  0101 1c0003        	addw	x,#OFST+3
 514  0104 cd0000        	call	c_ltor
 516  0107 ae0000        	ldw	x,#L64
 517  010a cd0000        	call	c_lcmp
 519  010d 250f          	jrult	L66
 520  010f 96            	ldw	x,sp
 521  0110 1c0003        	addw	x,#OFST+3
 522  0113 cd0000        	call	c_ltor
 524  0116 ae0004        	ldw	x,#L05
 525  0119 cd0000        	call	c_lcmp
 527  011c 251e          	jrult	L46
 528  011e               L66:
 529  011e 96            	ldw	x,sp
 530  011f 1c0003        	addw	x,#OFST+3
 531  0122 cd0000        	call	c_ltor
 533  0125 ae0008        	ldw	x,#L25
 534  0128 cd0000        	call	c_lcmp
 536  012b 2512          	jrult	L26
 537  012d 96            	ldw	x,sp
 538  012e 1c0003        	addw	x,#OFST+3
 539  0131 cd0000        	call	c_ltor
 541  0134 ae000c        	ldw	x,#L45
 542  0137 cd0000        	call	c_lcmp
 544  013a 2403          	jruge	L26
 545  013c               L46:
 546  013c 4f            	clr	a
 547  013d 2010          	jra	L07
 548  013f               L26:
 549  013f ae00b3        	ldw	x,#179
 550  0142 89            	pushw	x
 551  0143 ae0000        	ldw	x,#0
 552  0146 89            	pushw	x
 553  0147 ae0010        	ldw	x,#L73
 554  014a cd0000        	call	_assert_failed
 556  014d 5b04          	addw	sp,#4
 557  014f               L07:
 558                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 560  014f 7b05          	ld	a,(OFST+5,sp)
 561  0151 97            	ld	xl,a
 562  0152 7b06          	ld	a,(OFST+6,sp)
 563  0154 3f00          	clr	c_x
 564  0156 02            	rlwa	x,a
 565  0157 9093          	ldw	y,x
 566  0159 7b07          	ld	a,(OFST+7,sp)
 567  015b bf01          	ldw	c_x+1,x
 568  015d 92bd0000      	ldf	[c_x.e],a
 569                     ; 181 }
 572  0161 81            	ret
 605                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 605                     ; 191 {
 606                     	switch	.text
 607  0162               _FLASH_ReadByte:
 609       00000000      OFST:	set	0
 612                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 614  0162 96            	ldw	x,sp
 615  0163 1c0003        	addw	x,#OFST+3
 616  0166 cd0000        	call	c_ltor
 618  0169 ae0000        	ldw	x,#L64
 619  016c cd0000        	call	c_lcmp
 621  016f 250f          	jrult	L001
 622  0171 96            	ldw	x,sp
 623  0172 1c0003        	addw	x,#OFST+3
 624  0175 cd0000        	call	c_ltor
 626  0178 ae0004        	ldw	x,#L05
 627  017b cd0000        	call	c_lcmp
 629  017e 251e          	jrult	L67
 630  0180               L001:
 631  0180 96            	ldw	x,sp
 632  0181 1c0003        	addw	x,#OFST+3
 633  0184 cd0000        	call	c_ltor
 635  0187 ae0008        	ldw	x,#L25
 636  018a cd0000        	call	c_lcmp
 638  018d 2512          	jrult	L47
 639  018f 96            	ldw	x,sp
 640  0190 1c0003        	addw	x,#OFST+3
 641  0193 cd0000        	call	c_ltor
 643  0196 ae000c        	ldw	x,#L45
 644  0199 cd0000        	call	c_lcmp
 646  019c 2403          	jruge	L47
 647  019e               L67:
 648  019e 4f            	clr	a
 649  019f 2010          	jra	L201
 650  01a1               L47:
 651  01a1 ae00c1        	ldw	x,#193
 652  01a4 89            	pushw	x
 653  01a5 ae0000        	ldw	x,#0
 654  01a8 89            	pushw	x
 655  01a9 ae0010        	ldw	x,#L73
 656  01ac cd0000        	call	_assert_failed
 658  01af 5b04          	addw	sp,#4
 659  01b1               L201:
 660                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 662  01b1 7b05          	ld	a,(OFST+5,sp)
 663  01b3 97            	ld	xl,a
 664  01b4 7b06          	ld	a,(OFST+6,sp)
 665  01b6 3f00          	clr	c_x
 666  01b8 02            	rlwa	x,a
 667  01b9 9093          	ldw	y,x
 668  01bb bf01          	ldw	c_x+1,x
 669  01bd 92bc0000      	ldf	a,[c_x.e]
 672  01c1 81            	ret
 712                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 712                     ; 208 {
 713                     	switch	.text
 714  01c2               _FLASH_ProgramWord:
 716       00000000      OFST:	set	0
 719                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 721  01c2 96            	ldw	x,sp
 722  01c3 1c0003        	addw	x,#OFST+3
 723  01c6 cd0000        	call	c_ltor
 725  01c9 ae0000        	ldw	x,#L64
 726  01cc cd0000        	call	c_lcmp
 728  01cf 250f          	jrult	L211
 729  01d1 96            	ldw	x,sp
 730  01d2 1c0003        	addw	x,#OFST+3
 731  01d5 cd0000        	call	c_ltor
 733  01d8 ae0004        	ldw	x,#L05
 734  01db cd0000        	call	c_lcmp
 736  01de 251e          	jrult	L011
 737  01e0               L211:
 738  01e0 96            	ldw	x,sp
 739  01e1 1c0003        	addw	x,#OFST+3
 740  01e4 cd0000        	call	c_ltor
 742  01e7 ae0008        	ldw	x,#L25
 743  01ea cd0000        	call	c_lcmp
 745  01ed 2512          	jrult	L601
 746  01ef 96            	ldw	x,sp
 747  01f0 1c0003        	addw	x,#OFST+3
 748  01f3 cd0000        	call	c_ltor
 750  01f6 ae000c        	ldw	x,#L45
 751  01f9 cd0000        	call	c_lcmp
 753  01fc 2403          	jruge	L601
 754  01fe               L011:
 755  01fe 4f            	clr	a
 756  01ff 2010          	jra	L411
 757  0201               L601:
 758  0201 ae00d2        	ldw	x,#210
 759  0204 89            	pushw	x
 760  0205 ae0000        	ldw	x,#0
 761  0208 89            	pushw	x
 762  0209 ae0010        	ldw	x,#L73
 763  020c cd0000        	call	_assert_failed
 765  020f 5b04          	addw	sp,#4
 766  0211               L411:
 767                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 769  0211 721c505b      	bset	20571,#6
 770                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 772  0215 721d505c      	bres	20572,#6
 773                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 775  0219 7b05          	ld	a,(OFST+5,sp)
 776  021b 97            	ld	xl,a
 777  021c 7b06          	ld	a,(OFST+6,sp)
 778  021e 3f00          	clr	c_x
 779  0220 02            	rlwa	x,a
 780  0221 9093          	ldw	y,x
 781  0223 7b07          	ld	a,(OFST+7,sp)
 782  0225 bf01          	ldw	c_x+1,x
 783  0227 92bd0000      	ldf	[c_x.e],a
 784                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 786  022b 7b05          	ld	a,(OFST+5,sp)
 787  022d 97            	ld	xl,a
 788  022e 7b06          	ld	a,(OFST+6,sp)
 789  0230 3f00          	clr	c_x
 790  0232 02            	rlwa	x,a
 791  0233 9093          	ldw	y,x
 792  0235 90ae0001      	ldw	y,#1
 793  0239 bf01          	ldw	c_x+1,x
 794  023b 93            	ldw	x,y
 795  023c 7b08          	ld	a,(OFST+8,sp)
 796  023e 92a70000      	ldf	([c_x.e],x),a
 797                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 799  0242 7b05          	ld	a,(OFST+5,sp)
 800  0244 97            	ld	xl,a
 801  0245 7b06          	ld	a,(OFST+6,sp)
 802  0247 3f00          	clr	c_x
 803  0249 02            	rlwa	x,a
 804  024a 9093          	ldw	y,x
 805  024c 90ae0002      	ldw	y,#2
 806  0250 bf01          	ldw	c_x+1,x
 807  0252 93            	ldw	x,y
 808  0253 7b09          	ld	a,(OFST+9,sp)
 809  0255 92a70000      	ldf	([c_x.e],x),a
 810                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 812  0259 7b05          	ld	a,(OFST+5,sp)
 813  025b 97            	ld	xl,a
 814  025c 7b06          	ld	a,(OFST+6,sp)
 815  025e 3f00          	clr	c_x
 816  0260 02            	rlwa	x,a
 817  0261 9093          	ldw	y,x
 818  0263 90ae0003      	ldw	y,#3
 819  0267 bf01          	ldw	c_x+1,x
 820  0269 93            	ldw	x,y
 821  026a 7b0a          	ld	a,(OFST+10,sp)
 822  026c 92a70000      	ldf	([c_x.e],x),a
 823                     ; 224 }
 826  0270 81            	ret
 868                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 868                     ; 233 {
 869                     	switch	.text
 870  0271               _FLASH_ProgramOptionByte:
 872  0271 89            	pushw	x
 873       00000000      OFST:	set	0
 876                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 878  0272 a34800        	cpw	x,#18432
 879  0275 2508          	jrult	L021
 880  0277 a34880        	cpw	x,#18560
 881  027a 2403          	jruge	L021
 882  027c 4f            	clr	a
 883  027d 2010          	jra	L221
 884  027f               L021:
 885  027f ae00eb        	ldw	x,#235
 886  0282 89            	pushw	x
 887  0283 ae0000        	ldw	x,#0
 888  0286 89            	pushw	x
 889  0287 ae0010        	ldw	x,#L73
 890  028a cd0000        	call	_assert_failed
 892  028d 5b04          	addw	sp,#4
 893  028f               L221:
 894                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 896  028f 721e505b      	bset	20571,#7
 897                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 899  0293 721f505c      	bres	20572,#7
 900                     ; 242     if (Address == 0x4800)
 902  0297 1e01          	ldw	x,(OFST+1,sp)
 903  0299 a34800        	cpw	x,#18432
 904  029c 2607          	jrne	L722
 905                     ; 245        *((NEAR uint8_t*)Address) = Data;
 907  029e 7b05          	ld	a,(OFST+5,sp)
 908  02a0 1e01          	ldw	x,(OFST+1,sp)
 909  02a2 f7            	ld	(x),a
 911  02a3 200c          	jra	L132
 912  02a5               L722:
 913                     ; 250        *((NEAR uint8_t*)Address) = Data;
 915  02a5 7b05          	ld	a,(OFST+5,sp)
 916  02a7 1e01          	ldw	x,(OFST+1,sp)
 917  02a9 f7            	ld	(x),a
 918                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 920  02aa 7b05          	ld	a,(OFST+5,sp)
 921  02ac 43            	cpl	a
 922  02ad 1e01          	ldw	x,(OFST+1,sp)
 923  02af e701          	ld	(1,x),a
 924  02b1               L132:
 925                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 927  02b1 a6fd          	ld	a,#253
 928  02b3 cd0449        	call	_FLASH_WaitForLastOperation
 930                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 932  02b6 721f505b      	bres	20571,#7
 933                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 935  02ba 721e505c      	bset	20572,#7
 936                     ; 258 }
 939  02be 85            	popw	x
 940  02bf 81            	ret
 975                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 975                     ; 266 {
 976                     	switch	.text
 977  02c0               _FLASH_EraseOptionByte:
 979  02c0 89            	pushw	x
 980       00000000      OFST:	set	0
 983                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 985  02c1 a34800        	cpw	x,#18432
 986  02c4 2508          	jrult	L621
 987  02c6 a34880        	cpw	x,#18560
 988  02c9 2403          	jruge	L621
 989  02cb 4f            	clr	a
 990  02cc 2010          	jra	L031
 991  02ce               L621:
 992  02ce ae010c        	ldw	x,#268
 993  02d1 89            	pushw	x
 994  02d2 ae0000        	ldw	x,#0
 995  02d5 89            	pushw	x
 996  02d6 ae0010        	ldw	x,#L73
 997  02d9 cd0000        	call	_assert_failed
 999  02dc 5b04          	addw	sp,#4
1000  02de               L031:
1001                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
1003  02de 721e505b      	bset	20571,#7
1004                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
1006  02e2 721f505c      	bres	20572,#7
1007                     ; 275      if (Address == 0x4800)
1009  02e6 1e01          	ldw	x,(OFST+1,sp)
1010  02e8 a34800        	cpw	x,#18432
1011  02eb 2605          	jrne	L742
1012                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1014  02ed 1e01          	ldw	x,(OFST+1,sp)
1015  02ef 7f            	clr	(x)
1017  02f0 2009          	jra	L152
1018  02f2               L742:
1019                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1021  02f2 1e01          	ldw	x,(OFST+1,sp)
1022  02f4 7f            	clr	(x)
1023                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1025  02f5 1e01          	ldw	x,(OFST+1,sp)
1026  02f7 a6ff          	ld	a,#255
1027  02f9 e701          	ld	(1,x),a
1028  02fb               L152:
1029                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1031  02fb a6fd          	ld	a,#253
1032  02fd cd0449        	call	_FLASH_WaitForLastOperation
1034                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1036  0300 721f505b      	bres	20571,#7
1037                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
1039  0304 721e505c      	bset	20572,#7
1040                     ; 291 }
1043  0308 85            	popw	x
1044  0309 81            	ret
1100                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1100                     ; 298 {
1101                     	switch	.text
1102  030a               _FLASH_ReadOptionByte:
1104  030a 89            	pushw	x
1105  030b 5204          	subw	sp,#4
1106       00000004      OFST:	set	4
1109                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1111                     ; 300     uint16_t res_value = 0;
1113                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1115  030d a34800        	cpw	x,#18432
1116  0310 2508          	jrult	L431
1117  0312 a34880        	cpw	x,#18560
1118  0315 2403          	jruge	L431
1119  0317 4f            	clr	a
1120  0318 2010          	jra	L631
1121  031a               L431:
1122  031a ae012f        	ldw	x,#303
1123  031d 89            	pushw	x
1124  031e ae0000        	ldw	x,#0
1125  0321 89            	pushw	x
1126  0322 ae0010        	ldw	x,#L73
1127  0325 cd0000        	call	_assert_failed
1129  0328 5b04          	addw	sp,#4
1130  032a               L631:
1131                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1133  032a 1e05          	ldw	x,(OFST+1,sp)
1134  032c f6            	ld	a,(x)
1135  032d 6b02          	ld	(OFST-2,sp),a
1136                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1138  032f 1e05          	ldw	x,(OFST+1,sp)
1139  0331 e601          	ld	a,(1,x)
1140  0333 6b01          	ld	(OFST-3,sp),a
1141                     ; 310     if (Address == 0x4800)	 
1143  0335 1e05          	ldw	x,(OFST+1,sp)
1144  0337 a34800        	cpw	x,#18432
1145  033a 2608          	jrne	L572
1146                     ; 312         res_value =	 value_optbyte;
1148  033c 7b02          	ld	a,(OFST-2,sp)
1149  033e 5f            	clrw	x
1150  033f 97            	ld	xl,a
1151  0340 1f03          	ldw	(OFST-1,sp),x
1153  0342 2023          	jra	L772
1154  0344               L572:
1155                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1157  0344 7b01          	ld	a,(OFST-3,sp)
1158  0346 43            	cpl	a
1159  0347 1102          	cp	a,(OFST-2,sp)
1160  0349 2617          	jrne	L103
1161                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1163  034b 7b02          	ld	a,(OFST-2,sp)
1164  034d 5f            	clrw	x
1165  034e 97            	ld	xl,a
1166  034f 4f            	clr	a
1167  0350 02            	rlwa	x,a
1168  0351 1f03          	ldw	(OFST-1,sp),x
1169                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1171  0353 7b01          	ld	a,(OFST-3,sp)
1172  0355 5f            	clrw	x
1173  0356 97            	ld	xl,a
1174  0357 01            	rrwa	x,a
1175  0358 1a04          	or	a,(OFST+0,sp)
1176  035a 01            	rrwa	x,a
1177  035b 1a03          	or	a,(OFST-1,sp)
1178  035d 01            	rrwa	x,a
1179  035e 1f03          	ldw	(OFST-1,sp),x
1181  0360 2005          	jra	L772
1182  0362               L103:
1183                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1185  0362 ae5555        	ldw	x,#21845
1186  0365 1f03          	ldw	(OFST-1,sp),x
1187  0367               L772:
1188                     ; 326     return(res_value);
1190  0367 1e03          	ldw	x,(OFST-1,sp)
1193  0369 5b06          	addw	sp,#6
1194  036b 81            	ret
1269                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1269                     ; 336 {
1270                     	switch	.text
1271  036c               _FLASH_SetLowPowerMode:
1273  036c 88            	push	a
1274       00000000      OFST:	set	0
1277                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1279  036d a104          	cp	a,#4
1280  036f 270b          	jreq	L441
1281  0371 a108          	cp	a,#8
1282  0373 2707          	jreq	L441
1283  0375 4d            	tnz	a
1284  0376 2704          	jreq	L441
1285  0378 a10c          	cp	a,#12
1286  037a 2603          	jrne	L241
1287  037c               L441:
1288  037c 4f            	clr	a
1289  037d 2010          	jra	L641
1290  037f               L241:
1291  037f ae0152        	ldw	x,#338
1292  0382 89            	pushw	x
1293  0383 ae0000        	ldw	x,#0
1294  0386 89            	pushw	x
1295  0387 ae0010        	ldw	x,#L73
1296  038a cd0000        	call	_assert_failed
1298  038d 5b04          	addw	sp,#4
1299  038f               L641:
1300                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1302  038f c6505a        	ld	a,20570
1303  0392 a4f3          	and	a,#243
1304  0394 c7505a        	ld	20570,a
1305                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1307  0397 c6505a        	ld	a,20570
1308  039a 1a01          	or	a,(OFST+1,sp)
1309  039c c7505a        	ld	20570,a
1310                     ; 345 }
1313  039f 84            	pop	a
1314  03a0 81            	ret
1373                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1373                     ; 354 {
1374                     	switch	.text
1375  03a1               _FLASH_SetProgrammingTime:
1377  03a1 88            	push	a
1378       00000000      OFST:	set	0
1381                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1383  03a2 4d            	tnz	a
1384  03a3 2704          	jreq	L451
1385  03a5 a101          	cp	a,#1
1386  03a7 2603          	jrne	L251
1387  03a9               L451:
1388  03a9 4f            	clr	a
1389  03aa 2010          	jra	L651
1390  03ac               L251:
1391  03ac ae0164        	ldw	x,#356
1392  03af 89            	pushw	x
1393  03b0 ae0000        	ldw	x,#0
1394  03b3 89            	pushw	x
1395  03b4 ae0010        	ldw	x,#L73
1396  03b7 cd0000        	call	_assert_failed
1398  03ba 5b04          	addw	sp,#4
1399  03bc               L651:
1400                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1402  03bc 7211505a      	bres	20570,#0
1403                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1405  03c0 c6505a        	ld	a,20570
1406  03c3 1a01          	or	a,(OFST+1,sp)
1407  03c5 c7505a        	ld	20570,a
1408                     ; 360 }
1411  03c8 84            	pop	a
1412  03c9 81            	ret
1437                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1437                     ; 368 {
1438                     	switch	.text
1439  03ca               _FLASH_GetLowPowerMode:
1443                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1445  03ca c6505a        	ld	a,20570
1446  03cd a40c          	and	a,#12
1449  03cf 81            	ret
1474                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1474                     ; 378 {
1475                     	switch	.text
1476  03d0               _FLASH_GetProgrammingTime:
1480                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1482  03d0 c6505a        	ld	a,20570
1483  03d3 a401          	and	a,#1
1486  03d5 81            	ret
1518                     ; 387 uint32_t FLASH_GetBootSize(void)
1518                     ; 388 {
1519                     	switch	.text
1520  03d6               _FLASH_GetBootSize:
1522  03d6 5204          	subw	sp,#4
1523       00000004      OFST:	set	4
1526                     ; 389     uint32_t temp = 0;
1528                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1530  03d8 c6505d        	ld	a,20573
1531  03db 5f            	clrw	x
1532  03dc 97            	ld	xl,a
1533  03dd 90ae0200      	ldw	y,#512
1534  03e1 cd0000        	call	c_umul
1536  03e4 96            	ldw	x,sp
1537  03e5 1c0001        	addw	x,#OFST-3
1538  03e8 cd0000        	call	c_rtol
1540                     ; 395     if (FLASH->FPR == 0xFF)
1542  03eb c6505d        	ld	a,20573
1543  03ee a1ff          	cp	a,#255
1544  03f0 2611          	jrne	L124
1545                     ; 397         temp += 512;
1547  03f2 ae0200        	ldw	x,#512
1548  03f5 bf02          	ldw	c_lreg+2,x
1549  03f7 ae0000        	ldw	x,#0
1550  03fa bf00          	ldw	c_lreg,x
1551  03fc 96            	ldw	x,sp
1552  03fd 1c0001        	addw	x,#OFST-3
1553  0400 cd0000        	call	c_lgadd
1555  0403               L124:
1556                     ; 401     return(temp);
1558  0403 96            	ldw	x,sp
1559  0404 1c0001        	addw	x,#OFST-3
1560  0407 cd0000        	call	c_ltor
1564  040a 5b04          	addw	sp,#4
1565  040c 81            	ret
1675                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1675                     ; 413 {
1676                     	switch	.text
1677  040d               _FLASH_GetFlagStatus:
1679  040d 88            	push	a
1680  040e 88            	push	a
1681       00000001      OFST:	set	1
1684                     ; 414     FlagStatus status = RESET;
1686                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1688  040f a140          	cp	a,#64
1689  0411 2710          	jreq	L271
1690  0413 a108          	cp	a,#8
1691  0415 270c          	jreq	L271
1692  0417 a104          	cp	a,#4
1693  0419 2708          	jreq	L271
1694  041b a102          	cp	a,#2
1695  041d 2704          	jreq	L271
1696  041f a101          	cp	a,#1
1697  0421 2603          	jrne	L071
1698  0423               L271:
1699  0423 4f            	clr	a
1700  0424 2010          	jra	L471
1701  0426               L071:
1702  0426 ae01a0        	ldw	x,#416
1703  0429 89            	pushw	x
1704  042a ae0000        	ldw	x,#0
1705  042d 89            	pushw	x
1706  042e ae0010        	ldw	x,#L73
1707  0431 cd0000        	call	_assert_failed
1709  0434 5b04          	addw	sp,#4
1710  0436               L471:
1711                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1713  0436 c6505f        	ld	a,20575
1714  0439 1502          	bcp	a,(OFST+1,sp)
1715  043b 2706          	jreq	L374
1716                     ; 421         status = SET; /* FLASH_FLAG is set */
1718  043d a601          	ld	a,#1
1719  043f 6b01          	ld	(OFST+0,sp),a
1721  0441 2002          	jra	L574
1722  0443               L374:
1723                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1725  0443 0f01          	clr	(OFST+0,sp)
1726  0445               L574:
1727                     ; 429     return status;
1729  0445 7b01          	ld	a,(OFST+0,sp)
1732  0447 85            	popw	x
1733  0448 81            	ret
1822                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1822                     ; 532 {
1823                     	switch	.text
1824  0449               _FLASH_WaitForLastOperation:
1826  0449 5205          	subw	sp,#5
1827       00000005      OFST:	set	5
1830                     ; 533     uint8_t flagstatus = 0x00;
1832  044b 0f05          	clr	(OFST+0,sp)
1833                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1835  044d aeffff        	ldw	x,#65535
1836  0450 1f03          	ldw	(OFST-2,sp),x
1837  0452 ae000f        	ldw	x,#15
1838  0455 1f01          	ldw	(OFST-4,sp),x
1839                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1841  0457 a1fd          	cp	a,#253
1842  0459 2631          	jrne	L355
1844  045b 2010          	jra	L145
1845  045d               L735:
1846                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1846                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1848  045d c6505f        	ld	a,20575
1849  0460 a405          	and	a,#5
1850  0462 6b05          	ld	(OFST+0,sp),a
1851                     ; 545             timeout--;
1853  0464 96            	ldw	x,sp
1854  0465 1c0001        	addw	x,#OFST-4
1855  0468 a601          	ld	a,#1
1856  046a cd0000        	call	c_lgsbc
1858  046d               L145:
1859                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1861  046d 0d05          	tnz	(OFST+0,sp)
1862  046f 2628          	jrne	L745
1864  0471 96            	ldw	x,sp
1865  0472 1c0001        	addw	x,#OFST-4
1866  0475 cd0000        	call	c_lzmp
1868  0478 26e3          	jrne	L735
1869  047a 201d          	jra	L745
1870  047c               L155:
1871                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1871                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1873  047c c6505f        	ld	a,20575
1874  047f a441          	and	a,#65
1875  0481 6b05          	ld	(OFST+0,sp),a
1876                     ; 554             timeout--;
1878  0483 96            	ldw	x,sp
1879  0484 1c0001        	addw	x,#OFST-4
1880  0487 a601          	ld	a,#1
1881  0489 cd0000        	call	c_lgsbc
1883  048c               L355:
1884                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1886  048c 0d05          	tnz	(OFST+0,sp)
1887  048e 2609          	jrne	L745
1889  0490 96            	ldw	x,sp
1890  0491 1c0001        	addw	x,#OFST-4
1891  0494 cd0000        	call	c_lzmp
1893  0497 26e3          	jrne	L155
1894  0499               L745:
1895                     ; 566     if (timeout == 0x00 )
1897  0499 96            	ldw	x,sp
1898  049a 1c0001        	addw	x,#OFST-4
1899  049d cd0000        	call	c_lzmp
1901  04a0 2604          	jrne	L165
1902                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1904  04a2 a602          	ld	a,#2
1905  04a4 6b05          	ld	(OFST+0,sp),a
1906  04a6               L165:
1907                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1909  04a6 7b05          	ld	a,(OFST+0,sp)
1912  04a8 5b05          	addw	sp,#5
1913  04aa 81            	ret
1973                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1973                     ; 582 {
1974                     	switch	.text
1975  04ab               _FLASH_EraseBlock:
1977  04ab 89            	pushw	x
1978  04ac 5207          	subw	sp,#7
1979       00000007      OFST:	set	7
1982                     ; 583   uint32_t startaddress = 0;
1984                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1986  04ae 7b0c          	ld	a,(OFST+5,sp)
1987  04b0 a1fd          	cp	a,#253
1988  04b2 2706          	jreq	L402
1989  04b4 7b0c          	ld	a,(OFST+5,sp)
1990  04b6 a1f7          	cp	a,#247
1991  04b8 2603          	jrne	L202
1992  04ba               L402:
1993  04ba 4f            	clr	a
1994  04bb 2010          	jra	L602
1995  04bd               L202:
1996  04bd ae0251        	ldw	x,#593
1997  04c0 89            	pushw	x
1998  04c1 ae0000        	ldw	x,#0
1999  04c4 89            	pushw	x
2000  04c5 ae0010        	ldw	x,#L73
2001  04c8 cd0000        	call	_assert_failed
2003  04cb 5b04          	addw	sp,#4
2004  04cd               L602:
2005                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2007  04cd 7b0c          	ld	a,(OFST+5,sp)
2008  04cf a1fd          	cp	a,#253
2009  04d1 2626          	jrne	L116
2010                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2012  04d3 1e08          	ldw	x,(OFST+1,sp)
2013  04d5 a30400        	cpw	x,#1024
2014  04d8 2403          	jruge	L012
2015  04da 4f            	clr	a
2016  04db 2010          	jra	L212
2017  04dd               L012:
2018  04dd ae0254        	ldw	x,#596
2019  04e0 89            	pushw	x
2020  04e1 ae0000        	ldw	x,#0
2021  04e4 89            	pushw	x
2022  04e5 ae0010        	ldw	x,#L73
2023  04e8 cd0000        	call	_assert_failed
2025  04eb 5b04          	addw	sp,#4
2026  04ed               L212:
2027                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2029  04ed ae8000        	ldw	x,#32768
2030  04f0 1f03          	ldw	(OFST-4,sp),x
2031  04f2 ae0000        	ldw	x,#0
2032  04f5 1f01          	ldw	(OFST-6,sp),x
2034  04f7 2024          	jra	L316
2035  04f9               L116:
2036                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2038  04f9 1e08          	ldw	x,(OFST+1,sp)
2039  04fb a30010        	cpw	x,#16
2040  04fe 2403          	jruge	L412
2041  0500 4f            	clr	a
2042  0501 2010          	jra	L612
2043  0503               L412:
2044  0503 ae0259        	ldw	x,#601
2045  0506 89            	pushw	x
2046  0507 ae0000        	ldw	x,#0
2047  050a 89            	pushw	x
2048  050b ae0010        	ldw	x,#L73
2049  050e cd0000        	call	_assert_failed
2051  0511 5b04          	addw	sp,#4
2052  0513               L612:
2053                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2055  0513 ae4000        	ldw	x,#16384
2056  0516 1f03          	ldw	(OFST-4,sp),x
2057  0518 ae0000        	ldw	x,#0
2058  051b 1f01          	ldw	(OFST-6,sp),x
2059  051d               L316:
2060                     ; 607     pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2062  051d 1e08          	ldw	x,(OFST+1,sp)
2063  051f a680          	ld	a,#128
2064  0521 cd0000        	call	c_cmulx
2066  0524 96            	ldw	x,sp
2067  0525 1c0001        	addw	x,#OFST-6
2068  0528 cd0000        	call	c_ladd
2070  052b 450100        	mov	c_x,c_lreg+1
2071  052e be02          	ldw	x,c_lreg+2
2072  0530 b600          	ld	a,c_x
2073  0532 6b05          	ld	(OFST-2,sp),a
2074  0534 1f06          	ldw	(OFST-1,sp),x
2075                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
2077  0536 721a505b      	bset	20571,#5
2078                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2080  053a 721b505c      	bres	20572,#5
2081                     ; 622   *pwFlash = (uint8_t)0;
2083  053e 7b05          	ld	a,(OFST-2,sp)
2084  0540 b700          	ld	c_x,a
2085  0542 1e06          	ldw	x,(OFST-1,sp)
2086  0544 bf01          	ldw	c_x+1,x
2087  0546 4f            	clr	a
2088  0547 92bd0000      	ldf	[c_x.e],a
2089                     ; 623   *(pwFlash + 1) = (uint8_t)0;
2091  054b 7b05          	ld	a,(OFST-2,sp)
2092  054d b700          	ld	c_x,a
2093  054f 1e06          	ldw	x,(OFST-1,sp)
2094  0551 90ae0001      	ldw	y,#1
2095  0555 bf01          	ldw	c_x+1,x
2096  0557 93            	ldw	x,y
2097  0558 4f            	clr	a
2098  0559 92a70000      	ldf	([c_x.e],x),a
2099                     ; 624   *(pwFlash + 2) = (uint8_t)0;
2101  055d 7b05          	ld	a,(OFST-2,sp)
2102  055f b700          	ld	c_x,a
2103  0561 1e06          	ldw	x,(OFST-1,sp)
2104  0563 90ae0002      	ldw	y,#2
2105  0567 bf01          	ldw	c_x+1,x
2106  0569 93            	ldw	x,y
2107  056a 4f            	clr	a
2108  056b 92a70000      	ldf	([c_x.e],x),a
2109                     ; 625   *(pwFlash + 3) = (uint8_t)0;    
2111  056f 7b05          	ld	a,(OFST-2,sp)
2112  0571 b700          	ld	c_x,a
2113  0573 1e06          	ldw	x,(OFST-1,sp)
2114  0575 90ae0003      	ldw	y,#3
2115  0579 bf01          	ldw	c_x+1,x
2116  057b 93            	ldw	x,y
2117  057c 4f            	clr	a
2118  057d 92a70000      	ldf	([c_x.e],x),a
2119                     ; 627 }
2122  0581 5b09          	addw	sp,#9
2123  0583 81            	ret
2222                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2222                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2222                     ; 640 {
2223                     	switch	.text
2224  0584               _FLASH_ProgramBlock:
2226  0584 89            	pushw	x
2227  0585 5206          	subw	sp,#6
2228       00000006      OFST:	set	6
2231                     ; 641     uint16_t Count = 0;
2233                     ; 642     uint32_t startaddress = 0;
2235                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2237  0587 7b0b          	ld	a,(OFST+5,sp)
2238  0589 a1fd          	cp	a,#253
2239  058b 2706          	jreq	L422
2240  058d 7b0b          	ld	a,(OFST+5,sp)
2241  058f a1f7          	cp	a,#247
2242  0591 2603          	jrne	L222
2243  0593               L422:
2244  0593 4f            	clr	a
2245  0594 2010          	jra	L622
2246  0596               L222:
2247  0596 ae0285        	ldw	x,#645
2248  0599 89            	pushw	x
2249  059a ae0000        	ldw	x,#0
2250  059d 89            	pushw	x
2251  059e ae0010        	ldw	x,#L73
2252  05a1 cd0000        	call	_assert_failed
2254  05a4 5b04          	addw	sp,#4
2255  05a6               L622:
2256                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2258  05a6 0d0c          	tnz	(OFST+6,sp)
2259  05a8 2706          	jreq	L232
2260  05aa 7b0c          	ld	a,(OFST+6,sp)
2261  05ac a110          	cp	a,#16
2262  05ae 2603          	jrne	L032
2263  05b0               L232:
2264  05b0 4f            	clr	a
2265  05b1 2010          	jra	L432
2266  05b3               L032:
2267  05b3 ae0286        	ldw	x,#646
2268  05b6 89            	pushw	x
2269  05b7 ae0000        	ldw	x,#0
2270  05ba 89            	pushw	x
2271  05bb ae0010        	ldw	x,#L73
2272  05be cd0000        	call	_assert_failed
2274  05c1 5b04          	addw	sp,#4
2275  05c3               L432:
2276                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2278  05c3 7b0b          	ld	a,(OFST+5,sp)
2279  05c5 a1fd          	cp	a,#253
2280  05c7 2626          	jrne	L166
2281                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2283  05c9 1e07          	ldw	x,(OFST+1,sp)
2284  05cb a30400        	cpw	x,#1024
2285  05ce 2403          	jruge	L632
2286  05d0 4f            	clr	a
2287  05d1 2010          	jra	L042
2288  05d3               L632:
2289  05d3 ae0289        	ldw	x,#649
2290  05d6 89            	pushw	x
2291  05d7 ae0000        	ldw	x,#0
2292  05da 89            	pushw	x
2293  05db ae0010        	ldw	x,#L73
2294  05de cd0000        	call	_assert_failed
2296  05e1 5b04          	addw	sp,#4
2297  05e3               L042:
2298                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2300  05e3 ae8000        	ldw	x,#32768
2301  05e6 1f03          	ldw	(OFST-3,sp),x
2302  05e8 ae0000        	ldw	x,#0
2303  05eb 1f01          	ldw	(OFST-5,sp),x
2305  05ed 2024          	jra	L366
2306  05ef               L166:
2307                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2309  05ef 1e07          	ldw	x,(OFST+1,sp)
2310  05f1 a30010        	cpw	x,#16
2311  05f4 2403          	jruge	L242
2312  05f6 4f            	clr	a
2313  05f7 2010          	jra	L442
2314  05f9               L242:
2315  05f9 ae028e        	ldw	x,#654
2316  05fc 89            	pushw	x
2317  05fd ae0000        	ldw	x,#0
2318  0600 89            	pushw	x
2319  0601 ae0010        	ldw	x,#L73
2320  0604 cd0000        	call	_assert_failed
2322  0607 5b04          	addw	sp,#4
2323  0609               L442:
2324                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2326  0609 ae4000        	ldw	x,#16384
2327  060c 1f03          	ldw	(OFST-3,sp),x
2328  060e ae0000        	ldw	x,#0
2329  0611 1f01          	ldw	(OFST-5,sp),x
2330  0613               L366:
2331                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2333  0613 1e07          	ldw	x,(OFST+1,sp)
2334  0615 a680          	ld	a,#128
2335  0617 cd0000        	call	c_cmulx
2337  061a 96            	ldw	x,sp
2338  061b 1c0001        	addw	x,#OFST-5
2339  061e cd0000        	call	c_lgadd
2341                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2343  0621 0d0c          	tnz	(OFST+6,sp)
2344  0623 260a          	jrne	L566
2345                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2347  0625 7210505b      	bset	20571,#0
2348                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2350  0629 7211505c      	bres	20572,#0
2352  062d 2008          	jra	L766
2353  062f               L566:
2354                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2356  062f 7218505b      	bset	20571,#4
2357                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2359  0633 7219505c      	bres	20572,#4
2360  0637               L766:
2361                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2363  0637 5f            	clrw	x
2364  0638 1f05          	ldw	(OFST-1,sp),x
2365  063a               L176:
2366                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2368  063a 7b03          	ld	a,(OFST-3,sp)
2369  063c 97            	ld	xl,a
2370  063d 7b04          	ld	a,(OFST-2,sp)
2371  063f 3f00          	clr	c_x
2372  0641 02            	rlwa	x,a
2373  0642 9093          	ldw	y,x
2374  0644 1605          	ldw	y,(OFST-1,sp)
2375  0646 bf01          	ldw	c_x+1,x
2376  0648 93            	ldw	x,y
2377  0649 160d          	ldw	y,(OFST+7,sp)
2378  064b 72f905        	addw	y,(OFST-1,sp)
2379  064e 90f6          	ld	a,(y)
2380  0650 92a70000      	ldf	([c_x.e],x),a
2381                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2383  0654 1e05          	ldw	x,(OFST-1,sp)
2384  0656 1c0001        	addw	x,#1
2385  0659 1f05          	ldw	(OFST-1,sp),x
2388  065b 1e05          	ldw	x,(OFST-1,sp)
2389  065d a30080        	cpw	x,#128
2390  0660 25d8          	jrult	L176
2391                     ; 685 }
2394  0662 5b08          	addw	sp,#8
2395  0664 81            	ret
2408                     	xdef	_FLASH_WaitForLastOperation
2409                     	xdef	_FLASH_ProgramBlock
2410                     	xdef	_FLASH_EraseBlock
2411                     	xdef	_FLASH_GetFlagStatus
2412                     	xdef	_FLASH_GetBootSize
2413                     	xdef	_FLASH_GetProgrammingTime
2414                     	xdef	_FLASH_GetLowPowerMode
2415                     	xdef	_FLASH_SetProgrammingTime
2416                     	xdef	_FLASH_SetLowPowerMode
2417                     	xdef	_FLASH_EraseOptionByte
2418                     	xdef	_FLASH_ProgramOptionByte
2419                     	xdef	_FLASH_ReadOptionByte
2420                     	xdef	_FLASH_ProgramWord
2421                     	xdef	_FLASH_ReadByte
2422                     	xdef	_FLASH_ProgramByte
2423                     	xdef	_FLASH_EraseByte
2424                     	xdef	_FLASH_ITConfig
2425                     	xdef	_FLASH_DeInit
2426                     	xdef	_FLASH_Lock
2427                     	xdef	_FLASH_Unlock
2428                     	xref	_assert_failed
2429                     	switch	.const
2430  0010               L73:
2431  0010 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_f"
2432  0022 6c6173682e63  	dc.b	"lash.c",0
2433                     	xref.b	c_lreg
2434                     	xref.b	c_x
2435                     	xref.b	c_y
2455                     	xref	c_ladd
2456                     	xref	c_cmulx
2457                     	xref	c_lzmp
2458                     	xref	c_lgsbc
2459                     	xref	c_lgadd
2460                     	xref	c_rtol
2461                     	xref	c_umul
2462                     	xref	c_lcmp
2463                     	xref	c_ltor
2464                     	end

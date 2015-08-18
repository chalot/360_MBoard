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
 387                     .const:	section	.text
 388  0000               L64:
 389  0000 00008000      	dc.l	32768
 390  0004               L05:
 391  0004 00028000      	dc.l	163840
 392  0008               L25:
 393  0008 00004000      	dc.l	16384
 394  000c               L45:
 395  000c 00004800      	dc.l	18432
 396                     ; 158 void FLASH_EraseByte(uint32_t Address)
 396                     ; 159 {
 397                     	switch	.text
 398  009f               _FLASH_EraseByte:
 400       00000000      OFST:	set	0
 403                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 405  009f 96            	ldw	x,sp
 406  00a0 1c0003        	addw	x,#OFST+3
 407  00a3 cd0000        	call	c_ltor
 409  00a6 ae0000        	ldw	x,#L64
 410  00a9 cd0000        	call	c_lcmp
 412  00ac 250f          	jrult	L44
 413  00ae 96            	ldw	x,sp
 414  00af 1c0003        	addw	x,#OFST+3
 415  00b2 cd0000        	call	c_ltor
 417  00b5 ae0004        	ldw	x,#L05
 418  00b8 cd0000        	call	c_lcmp
 420  00bb 251e          	jrult	L24
 421  00bd               L44:
 422  00bd 96            	ldw	x,sp
 423  00be 1c0003        	addw	x,#OFST+3
 424  00c1 cd0000        	call	c_ltor
 426  00c4 ae0008        	ldw	x,#L25
 427  00c7 cd0000        	call	c_lcmp
 429  00ca 2512          	jrult	L04
 430  00cc 96            	ldw	x,sp
 431  00cd 1c0003        	addw	x,#OFST+3
 432  00d0 cd0000        	call	c_ltor
 434  00d3 ae000c        	ldw	x,#L45
 435  00d6 cd0000        	call	c_lcmp
 437  00d9 2403          	jruge	L04
 438  00db               L24:
 439  00db 4f            	clr	a
 440  00dc 2010          	jra	L65
 441  00de               L04:
 442  00de ae00a1        	ldw	x,#161
 443  00e1 89            	pushw	x
 444  00e2 ae0000        	ldw	x,#0
 445  00e5 89            	pushw	x
 446  00e6 ae0010        	ldw	x,#L73
 447  00e9 cd0000        	call	_assert_failed
 449  00ec 5b04          	addw	sp,#4
 450  00ee               L65:
 451                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 453  00ee 7b05          	ld	a,(OFST+5,sp)
 454  00f0 97            	ld	xl,a
 455  00f1 7b06          	ld	a,(OFST+6,sp)
 456  00f3 3f00          	clr	c_x
 457  00f5 02            	rlwa	x,a
 458  00f6 9093          	ldw	y,x
 459  00f8 bf01          	ldw	c_x+1,x
 460  00fa 4f            	clr	a
 461  00fb 92bd0000      	ldf	[c_x.e],a
 462                     ; 166 }
 465  00ff 81            	ret
 509                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 509                     ; 177 {
 510                     	switch	.text
 511  0100               _FLASH_ProgramByte:
 513       00000000      OFST:	set	0
 516                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 518  0100 96            	ldw	x,sp
 519  0101 1c0003        	addw	x,#OFST+3
 520  0104 cd0000        	call	c_ltor
 522  0107 ae0000        	ldw	x,#L64
 523  010a cd0000        	call	c_lcmp
 525  010d 250f          	jrult	L66
 526  010f 96            	ldw	x,sp
 527  0110 1c0003        	addw	x,#OFST+3
 528  0113 cd0000        	call	c_ltor
 530  0116 ae0004        	ldw	x,#L05
 531  0119 cd0000        	call	c_lcmp
 533  011c 251e          	jrult	L46
 534  011e               L66:
 535  011e 96            	ldw	x,sp
 536  011f 1c0003        	addw	x,#OFST+3
 537  0122 cd0000        	call	c_ltor
 539  0125 ae0008        	ldw	x,#L25
 540  0128 cd0000        	call	c_lcmp
 542  012b 2512          	jrult	L26
 543  012d 96            	ldw	x,sp
 544  012e 1c0003        	addw	x,#OFST+3
 545  0131 cd0000        	call	c_ltor
 547  0134 ae000c        	ldw	x,#L45
 548  0137 cd0000        	call	c_lcmp
 550  013a 2403          	jruge	L26
 551  013c               L46:
 552  013c 4f            	clr	a
 553  013d 2010          	jra	L07
 554  013f               L26:
 555  013f ae00b3        	ldw	x,#179
 556  0142 89            	pushw	x
 557  0143 ae0000        	ldw	x,#0
 558  0146 89            	pushw	x
 559  0147 ae0010        	ldw	x,#L73
 560  014a cd0000        	call	_assert_failed
 562  014d 5b04          	addw	sp,#4
 563  014f               L07:
 564                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 566  014f 7b05          	ld	a,(OFST+5,sp)
 567  0151 97            	ld	xl,a
 568  0152 7b06          	ld	a,(OFST+6,sp)
 569  0154 3f00          	clr	c_x
 570  0156 02            	rlwa	x,a
 571  0157 9093          	ldw	y,x
 572  0159 7b07          	ld	a,(OFST+7,sp)
 573  015b bf01          	ldw	c_x+1,x
 574  015d 92bd0000      	ldf	[c_x.e],a
 575                     ; 181 }
 578  0161 81            	ret
 613                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 613                     ; 191 {
 614                     	switch	.text
 615  0162               _FLASH_ReadByte:
 617       00000000      OFST:	set	0
 620                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 622  0162 96            	ldw	x,sp
 623  0163 1c0003        	addw	x,#OFST+3
 624  0166 cd0000        	call	c_ltor
 626  0169 ae0000        	ldw	x,#L64
 627  016c cd0000        	call	c_lcmp
 629  016f 250f          	jrult	L001
 630  0171 96            	ldw	x,sp
 631  0172 1c0003        	addw	x,#OFST+3
 632  0175 cd0000        	call	c_ltor
 634  0178 ae0004        	ldw	x,#L05
 635  017b cd0000        	call	c_lcmp
 637  017e 251e          	jrult	L67
 638  0180               L001:
 639  0180 96            	ldw	x,sp
 640  0181 1c0003        	addw	x,#OFST+3
 641  0184 cd0000        	call	c_ltor
 643  0187 ae0008        	ldw	x,#L25
 644  018a cd0000        	call	c_lcmp
 646  018d 2512          	jrult	L47
 647  018f 96            	ldw	x,sp
 648  0190 1c0003        	addw	x,#OFST+3
 649  0193 cd0000        	call	c_ltor
 651  0196 ae000c        	ldw	x,#L45
 652  0199 cd0000        	call	c_lcmp
 654  019c 2403          	jruge	L47
 655  019e               L67:
 656  019e 4f            	clr	a
 657  019f 2010          	jra	L201
 658  01a1               L47:
 659  01a1 ae00c1        	ldw	x,#193
 660  01a4 89            	pushw	x
 661  01a5 ae0000        	ldw	x,#0
 662  01a8 89            	pushw	x
 663  01a9 ae0010        	ldw	x,#L73
 664  01ac cd0000        	call	_assert_failed
 666  01af 5b04          	addw	sp,#4
 667  01b1               L201:
 668                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 670  01b1 7b05          	ld	a,(OFST+5,sp)
 671  01b3 97            	ld	xl,a
 672  01b4 7b06          	ld	a,(OFST+6,sp)
 673  01b6 3f00          	clr	c_x
 674  01b8 02            	rlwa	x,a
 675  01b9 9093          	ldw	y,x
 676  01bb bf01          	ldw	c_x+1,x
 677  01bd 92bc0000      	ldf	a,[c_x.e]
 680  01c1 81            	ret
 724                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 724                     ; 208 {
 725                     	switch	.text
 726  01c2               _FLASH_ProgramWord:
 728       00000000      OFST:	set	0
 731                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 733  01c2 96            	ldw	x,sp
 734  01c3 1c0003        	addw	x,#OFST+3
 735  01c6 cd0000        	call	c_ltor
 737  01c9 ae0000        	ldw	x,#L64
 738  01cc cd0000        	call	c_lcmp
 740  01cf 250f          	jrult	L211
 741  01d1 96            	ldw	x,sp
 742  01d2 1c0003        	addw	x,#OFST+3
 743  01d5 cd0000        	call	c_ltor
 745  01d8 ae0004        	ldw	x,#L05
 746  01db cd0000        	call	c_lcmp
 748  01de 251e          	jrult	L011
 749  01e0               L211:
 750  01e0 96            	ldw	x,sp
 751  01e1 1c0003        	addw	x,#OFST+3
 752  01e4 cd0000        	call	c_ltor
 754  01e7 ae0008        	ldw	x,#L25
 755  01ea cd0000        	call	c_lcmp
 757  01ed 2512          	jrult	L601
 758  01ef 96            	ldw	x,sp
 759  01f0 1c0003        	addw	x,#OFST+3
 760  01f3 cd0000        	call	c_ltor
 762  01f6 ae000c        	ldw	x,#L45
 763  01f9 cd0000        	call	c_lcmp
 765  01fc 2403          	jruge	L601
 766  01fe               L011:
 767  01fe 4f            	clr	a
 768  01ff 2010          	jra	L411
 769  0201               L601:
 770  0201 ae00d2        	ldw	x,#210
 771  0204 89            	pushw	x
 772  0205 ae0000        	ldw	x,#0
 773  0208 89            	pushw	x
 774  0209 ae0010        	ldw	x,#L73
 775  020c cd0000        	call	_assert_failed
 777  020f 5b04          	addw	sp,#4
 778  0211               L411:
 779                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 781  0211 721c505b      	bset	20571,#6
 782                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 784  0215 721d505c      	bres	20572,#6
 785                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 787  0219 7b05          	ld	a,(OFST+5,sp)
 788  021b 97            	ld	xl,a
 789  021c 7b06          	ld	a,(OFST+6,sp)
 790  021e 3f00          	clr	c_x
 791  0220 02            	rlwa	x,a
 792  0221 9093          	ldw	y,x
 793  0223 7b07          	ld	a,(OFST+7,sp)
 794  0225 bf01          	ldw	c_x+1,x
 795  0227 92bd0000      	ldf	[c_x.e],a
 796                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 798  022b 7b05          	ld	a,(OFST+5,sp)
 799  022d 97            	ld	xl,a
 800  022e 7b06          	ld	a,(OFST+6,sp)
 801  0230 3f00          	clr	c_x
 802  0232 02            	rlwa	x,a
 803  0233 9093          	ldw	y,x
 804  0235 90ae0001      	ldw	y,#1
 805  0239 bf01          	ldw	c_x+1,x
 806  023b 93            	ldw	x,y
 807  023c 7b08          	ld	a,(OFST+8,sp)
 808  023e 92a70000      	ldf	([c_x.e],x),a
 809                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 811  0242 7b05          	ld	a,(OFST+5,sp)
 812  0244 97            	ld	xl,a
 813  0245 7b06          	ld	a,(OFST+6,sp)
 814  0247 3f00          	clr	c_x
 815  0249 02            	rlwa	x,a
 816  024a 9093          	ldw	y,x
 817  024c 90ae0002      	ldw	y,#2
 818  0250 bf01          	ldw	c_x+1,x
 819  0252 93            	ldw	x,y
 820  0253 7b09          	ld	a,(OFST+9,sp)
 821  0255 92a70000      	ldf	([c_x.e],x),a
 822                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 824  0259 7b05          	ld	a,(OFST+5,sp)
 825  025b 97            	ld	xl,a
 826  025c 7b06          	ld	a,(OFST+6,sp)
 827  025e 3f00          	clr	c_x
 828  0260 02            	rlwa	x,a
 829  0261 9093          	ldw	y,x
 830  0263 90ae0003      	ldw	y,#3
 831  0267 bf01          	ldw	c_x+1,x
 832  0269 93            	ldw	x,y
 833  026a 7b0a          	ld	a,(OFST+10,sp)
 834  026c 92a70000      	ldf	([c_x.e],x),a
 835                     ; 224 }
 838  0270 81            	ret
 884                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 884                     ; 233 {
 885                     	switch	.text
 886  0271               _FLASH_ProgramOptionByte:
 888  0271 89            	pushw	x
 889       00000000      OFST:	set	0
 892                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 894  0272 a34800        	cpw	x,#18432
 895  0275 2508          	jrult	L021
 896  0277 a34880        	cpw	x,#18560
 897  027a 2403          	jruge	L021
 898  027c 4f            	clr	a
 899  027d 2010          	jra	L221
 900  027f               L021:
 901  027f ae00eb        	ldw	x,#235
 902  0282 89            	pushw	x
 903  0283 ae0000        	ldw	x,#0
 904  0286 89            	pushw	x
 905  0287 ae0010        	ldw	x,#L73
 906  028a cd0000        	call	_assert_failed
 908  028d 5b04          	addw	sp,#4
 909  028f               L221:
 910                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 912  028f 721e505b      	bset	20571,#7
 913                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 915  0293 721f505c      	bres	20572,#7
 916                     ; 242     if (Address == 0x4800)
 918  0297 1e01          	ldw	x,(OFST+1,sp)
 919  0299 a34800        	cpw	x,#18432
 920  029c 2607          	jrne	L742
 921                     ; 245        *((NEAR uint8_t*)Address) = Data;
 923  029e 7b05          	ld	a,(OFST+5,sp)
 924  02a0 1e01          	ldw	x,(OFST+1,sp)
 925  02a2 f7            	ld	(x),a
 927  02a3 200c          	jra	L152
 928  02a5               L742:
 929                     ; 250        *((NEAR uint8_t*)Address) = Data;
 931  02a5 7b05          	ld	a,(OFST+5,sp)
 932  02a7 1e01          	ldw	x,(OFST+1,sp)
 933  02a9 f7            	ld	(x),a
 934                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 936  02aa 7b05          	ld	a,(OFST+5,sp)
 937  02ac 43            	cpl	a
 938  02ad 1e01          	ldw	x,(OFST+1,sp)
 939  02af e701          	ld	(1,x),a
 940  02b1               L152:
 941                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 943  02b1 a6fd          	ld	a,#253
 944  02b3 cd0449        	call	_FLASH_WaitForLastOperation
 946                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 948  02b6 721f505b      	bres	20571,#7
 949                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 951  02ba 721e505c      	bset	20572,#7
 952                     ; 258 }
 955  02be 85            	popw	x
 956  02bf 81            	ret
 993                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 993                     ; 266 {
 994                     	switch	.text
 995  02c0               _FLASH_EraseOptionByte:
 997  02c0 89            	pushw	x
 998       00000000      OFST:	set	0
1001                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1003  02c1 a34800        	cpw	x,#18432
1004  02c4 2508          	jrult	L621
1005  02c6 a34880        	cpw	x,#18560
1006  02c9 2403          	jruge	L621
1007  02cb 4f            	clr	a
1008  02cc 2010          	jra	L031
1009  02ce               L621:
1010  02ce ae010c        	ldw	x,#268
1011  02d1 89            	pushw	x
1012  02d2 ae0000        	ldw	x,#0
1013  02d5 89            	pushw	x
1014  02d6 ae0010        	ldw	x,#L73
1015  02d9 cd0000        	call	_assert_failed
1017  02dc 5b04          	addw	sp,#4
1018  02de               L031:
1019                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
1021  02de 721e505b      	bset	20571,#7
1022                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
1024  02e2 721f505c      	bres	20572,#7
1025                     ; 275      if (Address == 0x4800)
1027  02e6 1e01          	ldw	x,(OFST+1,sp)
1028  02e8 a34800        	cpw	x,#18432
1029  02eb 2605          	jrne	L172
1030                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1032  02ed 1e01          	ldw	x,(OFST+1,sp)
1033  02ef 7f            	clr	(x)
1035  02f0 2009          	jra	L372
1036  02f2               L172:
1037                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1039  02f2 1e01          	ldw	x,(OFST+1,sp)
1040  02f4 7f            	clr	(x)
1041                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1043  02f5 1e01          	ldw	x,(OFST+1,sp)
1044  02f7 a6ff          	ld	a,#255
1045  02f9 e701          	ld	(1,x),a
1046  02fb               L372:
1047                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1049  02fb a6fd          	ld	a,#253
1050  02fd cd0449        	call	_FLASH_WaitForLastOperation
1052                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1054  0300 721f505b      	bres	20571,#7
1055                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
1057  0304 721e505c      	bset	20572,#7
1058                     ; 291 }
1061  0308 85            	popw	x
1062  0309 81            	ret
1126                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1126                     ; 298 {
1127                     	switch	.text
1128  030a               _FLASH_ReadOptionByte:
1130  030a 89            	pushw	x
1131  030b 5204          	subw	sp,#4
1132       00000004      OFST:	set	4
1135                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1137                     ; 300     uint16_t res_value = 0;
1139                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1141  030d a34800        	cpw	x,#18432
1142  0310 2508          	jrult	L431
1143  0312 a34880        	cpw	x,#18560
1144  0315 2403          	jruge	L431
1145  0317 4f            	clr	a
1146  0318 2010          	jra	L631
1147  031a               L431:
1148  031a ae012f        	ldw	x,#303
1149  031d 89            	pushw	x
1150  031e ae0000        	ldw	x,#0
1151  0321 89            	pushw	x
1152  0322 ae0010        	ldw	x,#L73
1153  0325 cd0000        	call	_assert_failed
1155  0328 5b04          	addw	sp,#4
1156  032a               L631:
1157                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1159  032a 1e05          	ldw	x,(OFST+1,sp)
1160  032c f6            	ld	a,(x)
1161  032d 6b02          	ld	(OFST-2,sp),a
1162                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1164  032f 1e05          	ldw	x,(OFST+1,sp)
1165  0331 e601          	ld	a,(1,x)
1166  0333 6b01          	ld	(OFST-3,sp),a
1167                     ; 310     if (Address == 0x4800)	 
1169  0335 1e05          	ldw	x,(OFST+1,sp)
1170  0337 a34800        	cpw	x,#18432
1171  033a 2608          	jrne	L723
1172                     ; 312         res_value =	 value_optbyte;
1174  033c 7b02          	ld	a,(OFST-2,sp)
1175  033e 5f            	clrw	x
1176  033f 97            	ld	xl,a
1177  0340 1f03          	ldw	(OFST-1,sp),x
1179  0342 2023          	jra	L133
1180  0344               L723:
1181                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1183  0344 7b01          	ld	a,(OFST-3,sp)
1184  0346 43            	cpl	a
1185  0347 1102          	cp	a,(OFST-2,sp)
1186  0349 2617          	jrne	L333
1187                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1189  034b 7b02          	ld	a,(OFST-2,sp)
1190  034d 5f            	clrw	x
1191  034e 97            	ld	xl,a
1192  034f 4f            	clr	a
1193  0350 02            	rlwa	x,a
1194  0351 1f03          	ldw	(OFST-1,sp),x
1195                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1197  0353 7b01          	ld	a,(OFST-3,sp)
1198  0355 5f            	clrw	x
1199  0356 97            	ld	xl,a
1200  0357 01            	rrwa	x,a
1201  0358 1a04          	or	a,(OFST+0,sp)
1202  035a 01            	rrwa	x,a
1203  035b 1a03          	or	a,(OFST-1,sp)
1204  035d 01            	rrwa	x,a
1205  035e 1f03          	ldw	(OFST-1,sp),x
1207  0360 2005          	jra	L133
1208  0362               L333:
1209                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1211  0362 ae5555        	ldw	x,#21845
1212  0365 1f03          	ldw	(OFST-1,sp),x
1213  0367               L133:
1214                     ; 326     return(res_value);
1216  0367 1e03          	ldw	x,(OFST-1,sp)
1219  0369 5b06          	addw	sp,#6
1220  036b 81            	ret
1295                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1295                     ; 336 {
1296                     	switch	.text
1297  036c               _FLASH_SetLowPowerMode:
1299  036c 88            	push	a
1300       00000000      OFST:	set	0
1303                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1305  036d a104          	cp	a,#4
1306  036f 270b          	jreq	L441
1307  0371 a108          	cp	a,#8
1308  0373 2707          	jreq	L441
1309  0375 4d            	tnz	a
1310  0376 2704          	jreq	L441
1311  0378 a10c          	cp	a,#12
1312  037a 2603          	jrne	L241
1313  037c               L441:
1314  037c 4f            	clr	a
1315  037d 2010          	jra	L641
1316  037f               L241:
1317  037f ae0152        	ldw	x,#338
1318  0382 89            	pushw	x
1319  0383 ae0000        	ldw	x,#0
1320  0386 89            	pushw	x
1321  0387 ae0010        	ldw	x,#L73
1322  038a cd0000        	call	_assert_failed
1324  038d 5b04          	addw	sp,#4
1325  038f               L641:
1326                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1328  038f c6505a        	ld	a,20570
1329  0392 a4f3          	and	a,#243
1330  0394 c7505a        	ld	20570,a
1331                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1333  0397 c6505a        	ld	a,20570
1334  039a 1a01          	or	a,(OFST+1,sp)
1335  039c c7505a        	ld	20570,a
1336                     ; 345 }
1339  039f 84            	pop	a
1340  03a0 81            	ret
1399                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1399                     ; 354 {
1400                     	switch	.text
1401  03a1               _FLASH_SetProgrammingTime:
1403  03a1 88            	push	a
1404       00000000      OFST:	set	0
1407                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1409  03a2 4d            	tnz	a
1410  03a3 2704          	jreq	L451
1411  03a5 a101          	cp	a,#1
1412  03a7 2603          	jrne	L251
1413  03a9               L451:
1414  03a9 4f            	clr	a
1415  03aa 2010          	jra	L651
1416  03ac               L251:
1417  03ac ae0164        	ldw	x,#356
1418  03af 89            	pushw	x
1419  03b0 ae0000        	ldw	x,#0
1420  03b3 89            	pushw	x
1421  03b4 ae0010        	ldw	x,#L73
1422  03b7 cd0000        	call	_assert_failed
1424  03ba 5b04          	addw	sp,#4
1425  03bc               L651:
1426                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1428  03bc 7211505a      	bres	20570,#0
1429                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1431  03c0 c6505a        	ld	a,20570
1432  03c3 1a01          	or	a,(OFST+1,sp)
1433  03c5 c7505a        	ld	20570,a
1434                     ; 360 }
1437  03c8 84            	pop	a
1438  03c9 81            	ret
1463                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1463                     ; 368 {
1464                     	switch	.text
1465  03ca               _FLASH_GetLowPowerMode:
1469                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1471  03ca c6505a        	ld	a,20570
1472  03cd a40c          	and	a,#12
1475  03cf 81            	ret
1500                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1500                     ; 378 {
1501                     	switch	.text
1502  03d0               _FLASH_GetProgrammingTime:
1506                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1508  03d0 c6505a        	ld	a,20570
1509  03d3 a401          	and	a,#1
1512  03d5 81            	ret
1546                     ; 387 uint32_t FLASH_GetBootSize(void)
1546                     ; 388 {
1547                     	switch	.text
1548  03d6               _FLASH_GetBootSize:
1550  03d6 5204          	subw	sp,#4
1551       00000004      OFST:	set	4
1554                     ; 389     uint32_t temp = 0;
1556                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1558  03d8 c6505d        	ld	a,20573
1559  03db 5f            	clrw	x
1560  03dc 97            	ld	xl,a
1561  03dd 90ae0200      	ldw	y,#512
1562  03e1 cd0000        	call	c_umul
1564  03e4 96            	ldw	x,sp
1565  03e5 1c0001        	addw	x,#OFST-3
1566  03e8 cd0000        	call	c_rtol
1568                     ; 395     if (FLASH->FPR == 0xFF)
1570  03eb c6505d        	ld	a,20573
1571  03ee a1ff          	cp	a,#255
1572  03f0 2611          	jrne	L554
1573                     ; 397         temp += 512;
1575  03f2 ae0200        	ldw	x,#512
1576  03f5 bf02          	ldw	c_lreg+2,x
1577  03f7 ae0000        	ldw	x,#0
1578  03fa bf00          	ldw	c_lreg,x
1579  03fc 96            	ldw	x,sp
1580  03fd 1c0001        	addw	x,#OFST-3
1581  0400 cd0000        	call	c_lgadd
1583  0403               L554:
1584                     ; 401     return(temp);
1586  0403 96            	ldw	x,sp
1587  0404 1c0001        	addw	x,#OFST-3
1588  0407 cd0000        	call	c_ltor
1592  040a 5b04          	addw	sp,#4
1593  040c 81            	ret
1703                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1703                     ; 413 {
1704                     	switch	.text
1705  040d               _FLASH_GetFlagStatus:
1707  040d 88            	push	a
1708  040e 88            	push	a
1709       00000001      OFST:	set	1
1712                     ; 414     FlagStatus status = RESET;
1714                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1716  040f a140          	cp	a,#64
1717  0411 2710          	jreq	L271
1718  0413 a108          	cp	a,#8
1719  0415 270c          	jreq	L271
1720  0417 a104          	cp	a,#4
1721  0419 2708          	jreq	L271
1722  041b a102          	cp	a,#2
1723  041d 2704          	jreq	L271
1724  041f a101          	cp	a,#1
1725  0421 2603          	jrne	L071
1726  0423               L271:
1727  0423 4f            	clr	a
1728  0424 2010          	jra	L471
1729  0426               L071:
1730  0426 ae01a0        	ldw	x,#416
1731  0429 89            	pushw	x
1732  042a ae0000        	ldw	x,#0
1733  042d 89            	pushw	x
1734  042e ae0010        	ldw	x,#L73
1735  0431 cd0000        	call	_assert_failed
1737  0434 5b04          	addw	sp,#4
1738  0436               L471:
1739                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1741  0436 c6505f        	ld	a,20575
1742  0439 1502          	bcp	a,(OFST+1,sp)
1743  043b 2706          	jreq	L725
1744                     ; 421         status = SET; /* FLASH_FLAG is set */
1746  043d a601          	ld	a,#1
1747  043f 6b01          	ld	(OFST+0,sp),a
1749  0441 2002          	jra	L135
1750  0443               L725:
1751                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1753  0443 0f01          	clr	(OFST+0,sp)
1754  0445               L135:
1755                     ; 429     return status;
1757  0445 7b01          	ld	a,(OFST+0,sp)
1760  0447 85            	popw	x
1761  0448 81            	ret
1854                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1854                     ; 532 {
1855                     	switch	.text
1856  0449               _FLASH_WaitForLastOperation:
1858  0449 5205          	subw	sp,#5
1859       00000005      OFST:	set	5
1862                     ; 533     uint8_t flagstatus = 0x00;
1864  044b 0f05          	clr	(OFST+0,sp)
1865                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1867  044d aeffff        	ldw	x,#65535
1868  0450 1f03          	ldw	(OFST-2,sp),x
1869  0452 ae000f        	ldw	x,#15
1870  0455 1f01          	ldw	(OFST-4,sp),x
1871                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1873  0457 a1fd          	cp	a,#253
1874  0459 2631          	jrne	L316
1876  045b 2010          	jra	L106
1877  045d               L775:
1878                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1878                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1880  045d c6505f        	ld	a,20575
1881  0460 a405          	and	a,#5
1882  0462 6b05          	ld	(OFST+0,sp),a
1883                     ; 545             timeout--;
1885  0464 96            	ldw	x,sp
1886  0465 1c0001        	addw	x,#OFST-4
1887  0468 a601          	ld	a,#1
1888  046a cd0000        	call	c_lgsbc
1890  046d               L106:
1891                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1893  046d 0d05          	tnz	(OFST+0,sp)
1894  046f 2628          	jrne	L706
1896  0471 96            	ldw	x,sp
1897  0472 1c0001        	addw	x,#OFST-4
1898  0475 cd0000        	call	c_lzmp
1900  0478 26e3          	jrne	L775
1901  047a 201d          	jra	L706
1902  047c               L116:
1903                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1903                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1905  047c c6505f        	ld	a,20575
1906  047f a441          	and	a,#65
1907  0481 6b05          	ld	(OFST+0,sp),a
1908                     ; 554             timeout--;
1910  0483 96            	ldw	x,sp
1911  0484 1c0001        	addw	x,#OFST-4
1912  0487 a601          	ld	a,#1
1913  0489 cd0000        	call	c_lgsbc
1915  048c               L316:
1916                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1918  048c 0d05          	tnz	(OFST+0,sp)
1919  048e 2609          	jrne	L706
1921  0490 96            	ldw	x,sp
1922  0491 1c0001        	addw	x,#OFST-4
1923  0494 cd0000        	call	c_lzmp
1925  0497 26e3          	jrne	L116
1926  0499               L706:
1927                     ; 566     if (timeout == 0x00 )
1929  0499 96            	ldw	x,sp
1930  049a 1c0001        	addw	x,#OFST-4
1931  049d cd0000        	call	c_lzmp
1933  04a0 2604          	jrne	L126
1934                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1936  04a2 a602          	ld	a,#2
1937  04a4 6b05          	ld	(OFST+0,sp),a
1938  04a6               L126:
1939                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1941  04a6 7b05          	ld	a,(OFST+0,sp)
1944  04a8 5b05          	addw	sp,#5
1945  04aa 81            	ret
2009                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
2009                     ; 582 {
2010                     	switch	.text
2011  04ab               _FLASH_EraseBlock:
2013  04ab 89            	pushw	x
2014  04ac 5207          	subw	sp,#7
2015       00000007      OFST:	set	7
2018                     ; 583   uint32_t startaddress = 0;
2020                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2022  04ae 7b0c          	ld	a,(OFST+5,sp)
2023  04b0 a1fd          	cp	a,#253
2024  04b2 2706          	jreq	L402
2025  04b4 7b0c          	ld	a,(OFST+5,sp)
2026  04b6 a1f7          	cp	a,#247
2027  04b8 2603          	jrne	L202
2028  04ba               L402:
2029  04ba 4f            	clr	a
2030  04bb 2010          	jra	L602
2031  04bd               L202:
2032  04bd ae0251        	ldw	x,#593
2033  04c0 89            	pushw	x
2034  04c1 ae0000        	ldw	x,#0
2035  04c4 89            	pushw	x
2036  04c5 ae0010        	ldw	x,#L73
2037  04c8 cd0000        	call	_assert_failed
2039  04cb 5b04          	addw	sp,#4
2040  04cd               L602:
2041                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2043  04cd 7b0c          	ld	a,(OFST+5,sp)
2044  04cf a1fd          	cp	a,#253
2045  04d1 2626          	jrne	L556
2046                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2048  04d3 1e08          	ldw	x,(OFST+1,sp)
2049  04d5 a30400        	cpw	x,#1024
2050  04d8 2403          	jruge	L012
2051  04da 4f            	clr	a
2052  04db 2010          	jra	L212
2053  04dd               L012:
2054  04dd ae0254        	ldw	x,#596
2055  04e0 89            	pushw	x
2056  04e1 ae0000        	ldw	x,#0
2057  04e4 89            	pushw	x
2058  04e5 ae0010        	ldw	x,#L73
2059  04e8 cd0000        	call	_assert_failed
2061  04eb 5b04          	addw	sp,#4
2062  04ed               L212:
2063                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2065  04ed ae8000        	ldw	x,#32768
2066  04f0 1f03          	ldw	(OFST-4,sp),x
2067  04f2 ae0000        	ldw	x,#0
2068  04f5 1f01          	ldw	(OFST-6,sp),x
2070  04f7 2024          	jra	L756
2071  04f9               L556:
2072                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2074  04f9 1e08          	ldw	x,(OFST+1,sp)
2075  04fb a30010        	cpw	x,#16
2076  04fe 2403          	jruge	L412
2077  0500 4f            	clr	a
2078  0501 2010          	jra	L612
2079  0503               L412:
2080  0503 ae0259        	ldw	x,#601
2081  0506 89            	pushw	x
2082  0507 ae0000        	ldw	x,#0
2083  050a 89            	pushw	x
2084  050b ae0010        	ldw	x,#L73
2085  050e cd0000        	call	_assert_failed
2087  0511 5b04          	addw	sp,#4
2088  0513               L612:
2089                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2091  0513 ae4000        	ldw	x,#16384
2092  0516 1f03          	ldw	(OFST-4,sp),x
2093  0518 ae0000        	ldw	x,#0
2094  051b 1f01          	ldw	(OFST-6,sp),x
2095  051d               L756:
2096                     ; 607     pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2098  051d 1e08          	ldw	x,(OFST+1,sp)
2099  051f a680          	ld	a,#128
2100  0521 cd0000        	call	c_cmulx
2102  0524 96            	ldw	x,sp
2103  0525 1c0001        	addw	x,#OFST-6
2104  0528 cd0000        	call	c_ladd
2106  052b 450100        	mov	c_x,c_lreg+1
2107  052e be02          	ldw	x,c_lreg+2
2108  0530 b600          	ld	a,c_x
2109  0532 6b05          	ld	(OFST-2,sp),a
2110  0534 1f06          	ldw	(OFST-1,sp),x
2111                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
2113  0536 721a505b      	bset	20571,#5
2114                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2116  053a 721b505c      	bres	20572,#5
2117                     ; 622   *pwFlash = (uint8_t)0;
2119  053e 7b05          	ld	a,(OFST-2,sp)
2120  0540 b700          	ld	c_x,a
2121  0542 1e06          	ldw	x,(OFST-1,sp)
2122  0544 bf01          	ldw	c_x+1,x
2123  0546 4f            	clr	a
2124  0547 92bd0000      	ldf	[c_x.e],a
2125                     ; 623   *(pwFlash + 1) = (uint8_t)0;
2127  054b 7b05          	ld	a,(OFST-2,sp)
2128  054d b700          	ld	c_x,a
2129  054f 1e06          	ldw	x,(OFST-1,sp)
2130  0551 90ae0001      	ldw	y,#1
2131  0555 bf01          	ldw	c_x+1,x
2132  0557 93            	ldw	x,y
2133  0558 4f            	clr	a
2134  0559 92a70000      	ldf	([c_x.e],x),a
2135                     ; 624   *(pwFlash + 2) = (uint8_t)0;
2137  055d 7b05          	ld	a,(OFST-2,sp)
2138  055f b700          	ld	c_x,a
2139  0561 1e06          	ldw	x,(OFST-1,sp)
2140  0563 90ae0002      	ldw	y,#2
2141  0567 bf01          	ldw	c_x+1,x
2142  0569 93            	ldw	x,y
2143  056a 4f            	clr	a
2144  056b 92a70000      	ldf	([c_x.e],x),a
2145                     ; 625   *(pwFlash + 3) = (uint8_t)0;    
2147  056f 7b05          	ld	a,(OFST-2,sp)
2148  0571 b700          	ld	c_x,a
2149  0573 1e06          	ldw	x,(OFST-1,sp)
2150  0575 90ae0003      	ldw	y,#3
2151  0579 bf01          	ldw	c_x+1,x
2152  057b 93            	ldw	x,y
2153  057c 4f            	clr	a
2154  057d 92a70000      	ldf	([c_x.e],x),a
2155                     ; 627 }
2158  0581 5b09          	addw	sp,#9
2159  0583 81            	ret
2264                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2264                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2264                     ; 640 {
2265                     	switch	.text
2266  0584               _FLASH_ProgramBlock:
2268  0584 89            	pushw	x
2269  0585 5206          	subw	sp,#6
2270       00000006      OFST:	set	6
2273                     ; 641     uint16_t Count = 0;
2275                     ; 642     uint32_t startaddress = 0;
2277                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2279  0587 7b0b          	ld	a,(OFST+5,sp)
2280  0589 a1fd          	cp	a,#253
2281  058b 2706          	jreq	L422
2282  058d 7b0b          	ld	a,(OFST+5,sp)
2283  058f a1f7          	cp	a,#247
2284  0591 2603          	jrne	L222
2285  0593               L422:
2286  0593 4f            	clr	a
2287  0594 2010          	jra	L622
2288  0596               L222:
2289  0596 ae0285        	ldw	x,#645
2290  0599 89            	pushw	x
2291  059a ae0000        	ldw	x,#0
2292  059d 89            	pushw	x
2293  059e ae0010        	ldw	x,#L73
2294  05a1 cd0000        	call	_assert_failed
2296  05a4 5b04          	addw	sp,#4
2297  05a6               L622:
2298                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2300  05a6 0d0c          	tnz	(OFST+6,sp)
2301  05a8 2706          	jreq	L232
2302  05aa 7b0c          	ld	a,(OFST+6,sp)
2303  05ac a110          	cp	a,#16
2304  05ae 2603          	jrne	L032
2305  05b0               L232:
2306  05b0 4f            	clr	a
2307  05b1 2010          	jra	L432
2308  05b3               L032:
2309  05b3 ae0286        	ldw	x,#646
2310  05b6 89            	pushw	x
2311  05b7 ae0000        	ldw	x,#0
2312  05ba 89            	pushw	x
2313  05bb ae0010        	ldw	x,#L73
2314  05be cd0000        	call	_assert_failed
2316  05c1 5b04          	addw	sp,#4
2317  05c3               L432:
2318                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2320  05c3 7b0b          	ld	a,(OFST+5,sp)
2321  05c5 a1fd          	cp	a,#253
2322  05c7 2626          	jrne	L337
2323                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2325  05c9 1e07          	ldw	x,(OFST+1,sp)
2326  05cb a30400        	cpw	x,#1024
2327  05ce 2403          	jruge	L632
2328  05d0 4f            	clr	a
2329  05d1 2010          	jra	L042
2330  05d3               L632:
2331  05d3 ae0289        	ldw	x,#649
2332  05d6 89            	pushw	x
2333  05d7 ae0000        	ldw	x,#0
2334  05da 89            	pushw	x
2335  05db ae0010        	ldw	x,#L73
2336  05de cd0000        	call	_assert_failed
2338  05e1 5b04          	addw	sp,#4
2339  05e3               L042:
2340                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2342  05e3 ae8000        	ldw	x,#32768
2343  05e6 1f03          	ldw	(OFST-3,sp),x
2344  05e8 ae0000        	ldw	x,#0
2345  05eb 1f01          	ldw	(OFST-5,sp),x
2347  05ed 2024          	jra	L537
2348  05ef               L337:
2349                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2351  05ef 1e07          	ldw	x,(OFST+1,sp)
2352  05f1 a30010        	cpw	x,#16
2353  05f4 2403          	jruge	L242
2354  05f6 4f            	clr	a
2355  05f7 2010          	jra	L442
2356  05f9               L242:
2357  05f9 ae028e        	ldw	x,#654
2358  05fc 89            	pushw	x
2359  05fd ae0000        	ldw	x,#0
2360  0600 89            	pushw	x
2361  0601 ae0010        	ldw	x,#L73
2362  0604 cd0000        	call	_assert_failed
2364  0607 5b04          	addw	sp,#4
2365  0609               L442:
2366                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2368  0609 ae4000        	ldw	x,#16384
2369  060c 1f03          	ldw	(OFST-3,sp),x
2370  060e ae0000        	ldw	x,#0
2371  0611 1f01          	ldw	(OFST-5,sp),x
2372  0613               L537:
2373                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2375  0613 1e07          	ldw	x,(OFST+1,sp)
2376  0615 a680          	ld	a,#128
2377  0617 cd0000        	call	c_cmulx
2379  061a 96            	ldw	x,sp
2380  061b 1c0001        	addw	x,#OFST-5
2381  061e cd0000        	call	c_lgadd
2383                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2385  0621 0d0c          	tnz	(OFST+6,sp)
2386  0623 260a          	jrne	L737
2387                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2389  0625 7210505b      	bset	20571,#0
2390                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2392  0629 7211505c      	bres	20572,#0
2394  062d 2008          	jra	L147
2395  062f               L737:
2396                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2398  062f 7218505b      	bset	20571,#4
2399                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2401  0633 7219505c      	bres	20572,#4
2402  0637               L147:
2403                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2405  0637 5f            	clrw	x
2406  0638 1f05          	ldw	(OFST-1,sp),x
2407  063a               L347:
2408                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2410  063a 7b03          	ld	a,(OFST-3,sp)
2411  063c 97            	ld	xl,a
2412  063d 7b04          	ld	a,(OFST-2,sp)
2413  063f 3f00          	clr	c_x
2414  0641 02            	rlwa	x,a
2415  0642 9093          	ldw	y,x
2416  0644 1605          	ldw	y,(OFST-1,sp)
2417  0646 bf01          	ldw	c_x+1,x
2418  0648 93            	ldw	x,y
2419  0649 160d          	ldw	y,(OFST+7,sp)
2420  064b 72f905        	addw	y,(OFST-1,sp)
2421  064e 90f6          	ld	a,(y)
2422  0650 92a70000      	ldf	([c_x.e],x),a
2423                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2425  0654 1e05          	ldw	x,(OFST-1,sp)
2426  0656 1c0001        	addw	x,#1
2427  0659 1f05          	ldw	(OFST-1,sp),x
2430  065b 1e05          	ldw	x,(OFST-1,sp)
2431  065d a30080        	cpw	x,#128
2432  0660 25d8          	jrult	L347
2433                     ; 685 }
2436  0662 5b08          	addw	sp,#8
2437  0664 81            	ret
2450                     	xdef	_FLASH_WaitForLastOperation
2451                     	xdef	_FLASH_ProgramBlock
2452                     	xdef	_FLASH_EraseBlock
2453                     	xdef	_FLASH_GetFlagStatus
2454                     	xdef	_FLASH_GetBootSize
2455                     	xdef	_FLASH_GetProgrammingTime
2456                     	xdef	_FLASH_GetLowPowerMode
2457                     	xdef	_FLASH_SetProgrammingTime
2458                     	xdef	_FLASH_SetLowPowerMode
2459                     	xdef	_FLASH_EraseOptionByte
2460                     	xdef	_FLASH_ProgramOptionByte
2461                     	xdef	_FLASH_ReadOptionByte
2462                     	xdef	_FLASH_ProgramWord
2463                     	xdef	_FLASH_ReadByte
2464                     	xdef	_FLASH_ProgramByte
2465                     	xdef	_FLASH_EraseByte
2466                     	xdef	_FLASH_ITConfig
2467                     	xdef	_FLASH_DeInit
2468                     	xdef	_FLASH_Lock
2469                     	xdef	_FLASH_Unlock
2470                     	xref	_assert_failed
2471                     	switch	.const
2472  0010               L73:
2473  0010 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_f"
2474  0022 6c6173682e63  	dc.b	"lash.c",0
2475                     	xref.b	c_lreg
2476                     	xref.b	c_x
2477                     	xref.b	c_y
2497                     	xref	c_ladd
2498                     	xref	c_cmulx
2499                     	xref	c_lzmp
2500                     	xref	c_lgsbc
2501                     	xref	c_lgadd
2502                     	xref	c_rtol
2503                     	xref	c_umul
2504                     	xref	c_lcmp
2505                     	xref	c_ltor
2506                     	end

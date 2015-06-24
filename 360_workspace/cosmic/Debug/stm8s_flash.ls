   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  77                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 82 {
  79                     	switch	.text
  80  0000               _FLASH_Unlock:
  82  0000 88            	push	a
  83       00000000      OFST:	set	0
  86                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  88  0001 a1fd          	cp	a,#253
  89  0003 2704          	jreq	L01
  90  0005 a1f7          	cp	a,#247
  91  0007 2603          	jrne	L6
  92  0009               L01:
  93  0009 4f            	clr	a
  94  000a 2010          	jra	L21
  95  000c               L6:
  96  000c ae0054        	ldw	x,#84
  97  000f 89            	pushw	x
  98  0010 ae0000        	ldw	x,#0
  99  0013 89            	pushw	x
 100  0014 ae0010        	ldw	x,#L73
 101  0017 cd0000        	call	_assert_failed
 103  001a 5b04          	addw	sp,#4
 104  001c               L21:
 105                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
 107  001c 7b01          	ld	a,(OFST+1,sp)
 108  001e a1fd          	cp	a,#253
 109  0020 260a          	jrne	L14
 110                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
 112  0022 35565062      	mov	20578,#86
 113                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 115  0026 35ae5062      	mov	20578,#174
 117  002a 2008          	jra	L34
 118  002c               L14:
 119                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 121  002c 35ae5064      	mov	20580,#174
 122                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 124  0030 35565064      	mov	20580,#86
 125  0034               L34:
 126                     ; 98 }
 129  0034 84            	pop	a
 130  0035 81            	ret
 166                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 166                     ; 107 {
 167                     	switch	.text
 168  0036               _FLASH_Lock:
 170  0036 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 176  0037 a1fd          	cp	a,#253
 177  0039 2704          	jreq	L02
 178  003b a1f7          	cp	a,#247
 179  003d 2603          	jrne	L61
 180  003f               L02:
 181  003f 4f            	clr	a
 182  0040 2010          	jra	L22
 183  0042               L61:
 184  0042 ae006d        	ldw	x,#109
 185  0045 89            	pushw	x
 186  0046 ae0000        	ldw	x,#0
 187  0049 89            	pushw	x
 188  004a ae0010        	ldw	x,#L73
 189  004d cd0000        	call	_assert_failed
 191  0050 5b04          	addw	sp,#4
 192  0052               L22:
 193                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 195  0052 c6505f        	ld	a,20575
 196  0055 1401          	and	a,(OFST+1,sp)
 197  0057 c7505f        	ld	20575,a
 198                     ; 113 }
 201  005a 84            	pop	a
 202  005b 81            	ret
 225                     ; 120 void FLASH_DeInit(void)
 225                     ; 121 {
 226                     	switch	.text
 227  005c               _FLASH_DeInit:
 231                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 233  005c 725f505a      	clr	20570
 234                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 236  0060 725f505b      	clr	20571
 237                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 239  0064 35ff505c      	mov	20572,#255
 240                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 242  0068 7217505f      	bres	20575,#3
 243                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 245  006c 7213505f      	bres	20575,#1
 246                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 248  0070 c6505f        	ld	a,20575
 249                     ; 128 }
 252  0073 81            	ret
 308                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 308                     ; 137 {
 309                     	switch	.text
 310  0074               _FLASH_ITConfig:
 312  0074 88            	push	a
 313       00000000      OFST:	set	0
 316                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 318  0075 4d            	tnz	a
 319  0076 2704          	jreq	L23
 320  0078 a101          	cp	a,#1
 321  007a 2603          	jrne	L03
 322  007c               L23:
 323  007c 4f            	clr	a
 324  007d 2010          	jra	L43
 325  007f               L03:
 326  007f ae008b        	ldw	x,#139
 327  0082 89            	pushw	x
 328  0083 ae0000        	ldw	x,#0
 329  0086 89            	pushw	x
 330  0087 ae0010        	ldw	x,#L73
 331  008a cd0000        	call	_assert_failed
 333  008d 5b04          	addw	sp,#4
 334  008f               L43:
 335                     ; 141     if (NewState != DISABLE)
 337  008f 0d01          	tnz	(OFST+1,sp)
 338  0091 2706          	jreq	L121
 339                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 341  0093 7212505a      	bset	20570,#1
 343  0097 2004          	jra	L321
 344  0099               L121:
 345                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 347  0099 7213505a      	bres	20570,#1
 348  009d               L321:
 349                     ; 149 }
 352  009d 84            	pop	a
 353  009e 81            	ret
 388                     .const:	section	.text
 389  0000               L64:
 390  0000 00008000      	dc.l	32768
 391  0004               L05:
 392  0004 00028000      	dc.l	163840
 393  0008               L25:
 394  0008 00004000      	dc.l	16384
 395  000c               L45:
 396  000c 00004800      	dc.l	18432
 397                     ; 158 void FLASH_EraseByte(uint32_t Address)
 397                     ; 159 {
 398                     	switch	.text
 399  009f               _FLASH_EraseByte:
 401       00000000      OFST:	set	0
 404                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 406  009f 96            	ldw	x,sp
 407  00a0 1c0003        	addw	x,#OFST+3
 408  00a3 cd0000        	call	c_ltor
 410  00a6 ae0000        	ldw	x,#L64
 411  00a9 cd0000        	call	c_lcmp
 413  00ac 250f          	jrult	L44
 414  00ae 96            	ldw	x,sp
 415  00af 1c0003        	addw	x,#OFST+3
 416  00b2 cd0000        	call	c_ltor
 418  00b5 ae0004        	ldw	x,#L05
 419  00b8 cd0000        	call	c_lcmp
 421  00bb 251e          	jrult	L24
 422  00bd               L44:
 423  00bd 96            	ldw	x,sp
 424  00be 1c0003        	addw	x,#OFST+3
 425  00c1 cd0000        	call	c_ltor
 427  00c4 ae0008        	ldw	x,#L25
 428  00c7 cd0000        	call	c_lcmp
 430  00ca 2512          	jrult	L04
 431  00cc 96            	ldw	x,sp
 432  00cd 1c0003        	addw	x,#OFST+3
 433  00d0 cd0000        	call	c_ltor
 435  00d3 ae000c        	ldw	x,#L45
 436  00d6 cd0000        	call	c_lcmp
 438  00d9 2403          	jruge	L04
 439  00db               L24:
 440  00db 4f            	clr	a
 441  00dc 2010          	jra	L65
 442  00de               L04:
 443  00de ae00a1        	ldw	x,#161
 444  00e1 89            	pushw	x
 445  00e2 ae0000        	ldw	x,#0
 446  00e5 89            	pushw	x
 447  00e6 ae0010        	ldw	x,#L73
 448  00e9 cd0000        	call	_assert_failed
 450  00ec 5b04          	addw	sp,#4
 451  00ee               L65:
 452                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 454  00ee 7b05          	ld	a,(OFST+5,sp)
 455  00f0 97            	ld	xl,a
 456  00f1 7b06          	ld	a,(OFST+6,sp)
 457  00f3 3f00          	clr	c_x
 458  00f5 02            	rlwa	x,a
 459  00f6 9093          	ldw	y,x
 460  00f8 bf01          	ldw	c_x+1,x
 461  00fa 4f            	clr	a
 462  00fb 92bd0000      	ldf	[c_x.e],a
 463                     ; 166 }
 466  00ff 81            	ret
 510                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 510                     ; 177 {
 511                     	switch	.text
 512  0100               _FLASH_ProgramByte:
 514       00000000      OFST:	set	0
 517                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 519  0100 96            	ldw	x,sp
 520  0101 1c0003        	addw	x,#OFST+3
 521  0104 cd0000        	call	c_ltor
 523  0107 ae0000        	ldw	x,#L64
 524  010a cd0000        	call	c_lcmp
 526  010d 250f          	jrult	L66
 527  010f 96            	ldw	x,sp
 528  0110 1c0003        	addw	x,#OFST+3
 529  0113 cd0000        	call	c_ltor
 531  0116 ae0004        	ldw	x,#L05
 532  0119 cd0000        	call	c_lcmp
 534  011c 251e          	jrult	L46
 535  011e               L66:
 536  011e 96            	ldw	x,sp
 537  011f 1c0003        	addw	x,#OFST+3
 538  0122 cd0000        	call	c_ltor
 540  0125 ae0008        	ldw	x,#L25
 541  0128 cd0000        	call	c_lcmp
 543  012b 2512          	jrult	L26
 544  012d 96            	ldw	x,sp
 545  012e 1c0003        	addw	x,#OFST+3
 546  0131 cd0000        	call	c_ltor
 548  0134 ae000c        	ldw	x,#L45
 549  0137 cd0000        	call	c_lcmp
 551  013a 2403          	jruge	L26
 552  013c               L46:
 553  013c 4f            	clr	a
 554  013d 2010          	jra	L07
 555  013f               L26:
 556  013f ae00b3        	ldw	x,#179
 557  0142 89            	pushw	x
 558  0143 ae0000        	ldw	x,#0
 559  0146 89            	pushw	x
 560  0147 ae0010        	ldw	x,#L73
 561  014a cd0000        	call	_assert_failed
 563  014d 5b04          	addw	sp,#4
 564  014f               L07:
 565                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 567  014f 7b05          	ld	a,(OFST+5,sp)
 568  0151 97            	ld	xl,a
 569  0152 7b06          	ld	a,(OFST+6,sp)
 570  0154 3f00          	clr	c_x
 571  0156 02            	rlwa	x,a
 572  0157 9093          	ldw	y,x
 573  0159 7b07          	ld	a,(OFST+7,sp)
 574  015b bf01          	ldw	c_x+1,x
 575  015d 92bd0000      	ldf	[c_x.e],a
 576                     ; 181 }
 579  0161 81            	ret
 614                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 614                     ; 191 {
 615                     	switch	.text
 616  0162               _FLASH_ReadByte:
 618       00000000      OFST:	set	0
 621                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 623  0162 96            	ldw	x,sp
 624  0163 1c0003        	addw	x,#OFST+3
 625  0166 cd0000        	call	c_ltor
 627  0169 ae0000        	ldw	x,#L64
 628  016c cd0000        	call	c_lcmp
 630  016f 250f          	jrult	L001
 631  0171 96            	ldw	x,sp
 632  0172 1c0003        	addw	x,#OFST+3
 633  0175 cd0000        	call	c_ltor
 635  0178 ae0004        	ldw	x,#L05
 636  017b cd0000        	call	c_lcmp
 638  017e 251e          	jrult	L67
 639  0180               L001:
 640  0180 96            	ldw	x,sp
 641  0181 1c0003        	addw	x,#OFST+3
 642  0184 cd0000        	call	c_ltor
 644  0187 ae0008        	ldw	x,#L25
 645  018a cd0000        	call	c_lcmp
 647  018d 2512          	jrult	L47
 648  018f 96            	ldw	x,sp
 649  0190 1c0003        	addw	x,#OFST+3
 650  0193 cd0000        	call	c_ltor
 652  0196 ae000c        	ldw	x,#L45
 653  0199 cd0000        	call	c_lcmp
 655  019c 2403          	jruge	L47
 656  019e               L67:
 657  019e 4f            	clr	a
 658  019f 2010          	jra	L201
 659  01a1               L47:
 660  01a1 ae00c1        	ldw	x,#193
 661  01a4 89            	pushw	x
 662  01a5 ae0000        	ldw	x,#0
 663  01a8 89            	pushw	x
 664  01a9 ae0010        	ldw	x,#L73
 665  01ac cd0000        	call	_assert_failed
 667  01af 5b04          	addw	sp,#4
 668  01b1               L201:
 669                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 671  01b1 7b05          	ld	a,(OFST+5,sp)
 672  01b3 97            	ld	xl,a
 673  01b4 7b06          	ld	a,(OFST+6,sp)
 674  01b6 3f00          	clr	c_x
 675  01b8 02            	rlwa	x,a
 676  01b9 9093          	ldw	y,x
 677  01bb bf01          	ldw	c_x+1,x
 678  01bd 92bc0000      	ldf	a,[c_x.e]
 681  01c1 81            	ret
 725                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 725                     ; 208 {
 726                     	switch	.text
 727  01c2               _FLASH_ProgramWord:
 729       00000000      OFST:	set	0
 732                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 734  01c2 96            	ldw	x,sp
 735  01c3 1c0003        	addw	x,#OFST+3
 736  01c6 cd0000        	call	c_ltor
 738  01c9 ae0000        	ldw	x,#L64
 739  01cc cd0000        	call	c_lcmp
 741  01cf 250f          	jrult	L211
 742  01d1 96            	ldw	x,sp
 743  01d2 1c0003        	addw	x,#OFST+3
 744  01d5 cd0000        	call	c_ltor
 746  01d8 ae0004        	ldw	x,#L05
 747  01db cd0000        	call	c_lcmp
 749  01de 251e          	jrult	L011
 750  01e0               L211:
 751  01e0 96            	ldw	x,sp
 752  01e1 1c0003        	addw	x,#OFST+3
 753  01e4 cd0000        	call	c_ltor
 755  01e7 ae0008        	ldw	x,#L25
 756  01ea cd0000        	call	c_lcmp
 758  01ed 2512          	jrult	L601
 759  01ef 96            	ldw	x,sp
 760  01f0 1c0003        	addw	x,#OFST+3
 761  01f3 cd0000        	call	c_ltor
 763  01f6 ae000c        	ldw	x,#L45
 764  01f9 cd0000        	call	c_lcmp
 766  01fc 2403          	jruge	L601
 767  01fe               L011:
 768  01fe 4f            	clr	a
 769  01ff 2010          	jra	L411
 770  0201               L601:
 771  0201 ae00d2        	ldw	x,#210
 772  0204 89            	pushw	x
 773  0205 ae0000        	ldw	x,#0
 774  0208 89            	pushw	x
 775  0209 ae0010        	ldw	x,#L73
 776  020c cd0000        	call	_assert_failed
 778  020f 5b04          	addw	sp,#4
 779  0211               L411:
 780                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 782  0211 721c505b      	bset	20571,#6
 783                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 785  0215 721d505c      	bres	20572,#6
 786                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 788  0219 7b05          	ld	a,(OFST+5,sp)
 789  021b 97            	ld	xl,a
 790  021c 7b06          	ld	a,(OFST+6,sp)
 791  021e 3f00          	clr	c_x
 792  0220 02            	rlwa	x,a
 793  0221 9093          	ldw	y,x
 794  0223 7b07          	ld	a,(OFST+7,sp)
 795  0225 bf01          	ldw	c_x+1,x
 796  0227 92bd0000      	ldf	[c_x.e],a
 797                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 799  022b 7b05          	ld	a,(OFST+5,sp)
 800  022d 97            	ld	xl,a
 801  022e 7b06          	ld	a,(OFST+6,sp)
 802  0230 3f00          	clr	c_x
 803  0232 02            	rlwa	x,a
 804  0233 9093          	ldw	y,x
 805  0235 90ae0001      	ldw	y,#1
 806  0239 bf01          	ldw	c_x+1,x
 807  023b 93            	ldw	x,y
 808  023c 7b08          	ld	a,(OFST+8,sp)
 809  023e 92a70000      	ldf	([c_x.e],x),a
 810                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 812  0242 7b05          	ld	a,(OFST+5,sp)
 813  0244 97            	ld	xl,a
 814  0245 7b06          	ld	a,(OFST+6,sp)
 815  0247 3f00          	clr	c_x
 816  0249 02            	rlwa	x,a
 817  024a 9093          	ldw	y,x
 818  024c 90ae0002      	ldw	y,#2
 819  0250 bf01          	ldw	c_x+1,x
 820  0252 93            	ldw	x,y
 821  0253 7b09          	ld	a,(OFST+9,sp)
 822  0255 92a70000      	ldf	([c_x.e],x),a
 823                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 825  0259 7b05          	ld	a,(OFST+5,sp)
 826  025b 97            	ld	xl,a
 827  025c 7b06          	ld	a,(OFST+6,sp)
 828  025e 3f00          	clr	c_x
 829  0260 02            	rlwa	x,a
 830  0261 9093          	ldw	y,x
 831  0263 90ae0003      	ldw	y,#3
 832  0267 bf01          	ldw	c_x+1,x
 833  0269 93            	ldw	x,y
 834  026a 7b0a          	ld	a,(OFST+10,sp)
 835  026c 92a70000      	ldf	([c_x.e],x),a
 836                     ; 224 }
 839  0270 81            	ret
 885                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 885                     ; 233 {
 886                     	switch	.text
 887  0271               _FLASH_ProgramOptionByte:
 889  0271 89            	pushw	x
 890       00000000      OFST:	set	0
 893                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 895  0272 a34800        	cpw	x,#18432
 896  0275 2508          	jrult	L021
 897  0277 a34880        	cpw	x,#18560
 898  027a 2403          	jruge	L021
 899  027c 4f            	clr	a
 900  027d 2010          	jra	L221
 901  027f               L021:
 902  027f ae00eb        	ldw	x,#235
 903  0282 89            	pushw	x
 904  0283 ae0000        	ldw	x,#0
 905  0286 89            	pushw	x
 906  0287 ae0010        	ldw	x,#L73
 907  028a cd0000        	call	_assert_failed
 909  028d 5b04          	addw	sp,#4
 910  028f               L221:
 911                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 913  028f 721e505b      	bset	20571,#7
 914                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 916  0293 721f505c      	bres	20572,#7
 917                     ; 242     if (Address == 0x4800)
 919  0297 1e01          	ldw	x,(OFST+1,sp)
 920  0299 a34800        	cpw	x,#18432
 921  029c 2607          	jrne	L742
 922                     ; 245        *((NEAR uint8_t*)Address) = Data;
 924  029e 7b05          	ld	a,(OFST+5,sp)
 925  02a0 1e01          	ldw	x,(OFST+1,sp)
 926  02a2 f7            	ld	(x),a
 928  02a3 200c          	jra	L152
 929  02a5               L742:
 930                     ; 250        *((NEAR uint8_t*)Address) = Data;
 932  02a5 7b05          	ld	a,(OFST+5,sp)
 933  02a7 1e01          	ldw	x,(OFST+1,sp)
 934  02a9 f7            	ld	(x),a
 935                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 937  02aa 7b05          	ld	a,(OFST+5,sp)
 938  02ac 43            	cpl	a
 939  02ad 1e01          	ldw	x,(OFST+1,sp)
 940  02af e701          	ld	(1,x),a
 941  02b1               L152:
 942                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 944  02b1 a6fd          	ld	a,#253
 945  02b3 cd0449        	call	_FLASH_WaitForLastOperation
 947                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 949  02b6 721f505b      	bres	20571,#7
 950                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 952  02ba 721e505c      	bset	20572,#7
 953                     ; 258 }
 956  02be 85            	popw	x
 957  02bf 81            	ret
 994                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 994                     ; 266 {
 995                     	switch	.text
 996  02c0               _FLASH_EraseOptionByte:
 998  02c0 89            	pushw	x
 999       00000000      OFST:	set	0
1002                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1004  02c1 a34800        	cpw	x,#18432
1005  02c4 2508          	jrult	L621
1006  02c6 a34880        	cpw	x,#18560
1007  02c9 2403          	jruge	L621
1008  02cb 4f            	clr	a
1009  02cc 2010          	jra	L031
1010  02ce               L621:
1011  02ce ae010c        	ldw	x,#268
1012  02d1 89            	pushw	x
1013  02d2 ae0000        	ldw	x,#0
1014  02d5 89            	pushw	x
1015  02d6 ae0010        	ldw	x,#L73
1016  02d9 cd0000        	call	_assert_failed
1018  02dc 5b04          	addw	sp,#4
1019  02de               L031:
1020                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
1022  02de 721e505b      	bset	20571,#7
1023                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
1025  02e2 721f505c      	bres	20572,#7
1026                     ; 275      if (Address == 0x4800)
1028  02e6 1e01          	ldw	x,(OFST+1,sp)
1029  02e8 a34800        	cpw	x,#18432
1030  02eb 2605          	jrne	L172
1031                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1033  02ed 1e01          	ldw	x,(OFST+1,sp)
1034  02ef 7f            	clr	(x)
1036  02f0 2009          	jra	L372
1037  02f2               L172:
1038                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1040  02f2 1e01          	ldw	x,(OFST+1,sp)
1041  02f4 7f            	clr	(x)
1042                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1044  02f5 1e01          	ldw	x,(OFST+1,sp)
1045  02f7 a6ff          	ld	a,#255
1046  02f9 e701          	ld	(1,x),a
1047  02fb               L372:
1048                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1050  02fb a6fd          	ld	a,#253
1051  02fd cd0449        	call	_FLASH_WaitForLastOperation
1053                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1055  0300 721f505b      	bres	20571,#7
1056                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
1058  0304 721e505c      	bset	20572,#7
1059                     ; 291 }
1062  0308 85            	popw	x
1063  0309 81            	ret
1127                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1127                     ; 298 {
1128                     	switch	.text
1129  030a               _FLASH_ReadOptionByte:
1131  030a 89            	pushw	x
1132  030b 5204          	subw	sp,#4
1133       00000004      OFST:	set	4
1136                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1138                     ; 300     uint16_t res_value = 0;
1140                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1142  030d a34800        	cpw	x,#18432
1143  0310 2508          	jrult	L431
1144  0312 a34880        	cpw	x,#18560
1145  0315 2403          	jruge	L431
1146  0317 4f            	clr	a
1147  0318 2010          	jra	L631
1148  031a               L431:
1149  031a ae012f        	ldw	x,#303
1150  031d 89            	pushw	x
1151  031e ae0000        	ldw	x,#0
1152  0321 89            	pushw	x
1153  0322 ae0010        	ldw	x,#L73
1154  0325 cd0000        	call	_assert_failed
1156  0328 5b04          	addw	sp,#4
1157  032a               L631:
1158                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1160  032a 1e05          	ldw	x,(OFST+1,sp)
1161  032c f6            	ld	a,(x)
1162  032d 6b02          	ld	(OFST-2,sp),a
1163                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1165  032f 1e05          	ldw	x,(OFST+1,sp)
1166  0331 e601          	ld	a,(1,x)
1167  0333 6b01          	ld	(OFST-3,sp),a
1168                     ; 310     if (Address == 0x4800)	 
1170  0335 1e05          	ldw	x,(OFST+1,sp)
1171  0337 a34800        	cpw	x,#18432
1172  033a 2608          	jrne	L723
1173                     ; 312         res_value =	 value_optbyte;
1175  033c 7b02          	ld	a,(OFST-2,sp)
1176  033e 5f            	clrw	x
1177  033f 97            	ld	xl,a
1178  0340 1f03          	ldw	(OFST-1,sp),x
1180  0342 2023          	jra	L133
1181  0344               L723:
1182                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1184  0344 7b01          	ld	a,(OFST-3,sp)
1185  0346 43            	cpl	a
1186  0347 1102          	cp	a,(OFST-2,sp)
1187  0349 2617          	jrne	L333
1188                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1190  034b 7b02          	ld	a,(OFST-2,sp)
1191  034d 5f            	clrw	x
1192  034e 97            	ld	xl,a
1193  034f 4f            	clr	a
1194  0350 02            	rlwa	x,a
1195  0351 1f03          	ldw	(OFST-1,sp),x
1196                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1198  0353 7b01          	ld	a,(OFST-3,sp)
1199  0355 5f            	clrw	x
1200  0356 97            	ld	xl,a
1201  0357 01            	rrwa	x,a
1202  0358 1a04          	or	a,(OFST+0,sp)
1203  035a 01            	rrwa	x,a
1204  035b 1a03          	or	a,(OFST-1,sp)
1205  035d 01            	rrwa	x,a
1206  035e 1f03          	ldw	(OFST-1,sp),x
1208  0360 2005          	jra	L133
1209  0362               L333:
1210                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1212  0362 ae5555        	ldw	x,#21845
1213  0365 1f03          	ldw	(OFST-1,sp),x
1214  0367               L133:
1215                     ; 326     return(res_value);
1217  0367 1e03          	ldw	x,(OFST-1,sp)
1220  0369 5b06          	addw	sp,#6
1221  036b 81            	ret
1296                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1296                     ; 336 {
1297                     	switch	.text
1298  036c               _FLASH_SetLowPowerMode:
1300  036c 88            	push	a
1301       00000000      OFST:	set	0
1304                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1306  036d a104          	cp	a,#4
1307  036f 270b          	jreq	L441
1308  0371 a108          	cp	a,#8
1309  0373 2707          	jreq	L441
1310  0375 4d            	tnz	a
1311  0376 2704          	jreq	L441
1312  0378 a10c          	cp	a,#12
1313  037a 2603          	jrne	L241
1314  037c               L441:
1315  037c 4f            	clr	a
1316  037d 2010          	jra	L641
1317  037f               L241:
1318  037f ae0152        	ldw	x,#338
1319  0382 89            	pushw	x
1320  0383 ae0000        	ldw	x,#0
1321  0386 89            	pushw	x
1322  0387 ae0010        	ldw	x,#L73
1323  038a cd0000        	call	_assert_failed
1325  038d 5b04          	addw	sp,#4
1326  038f               L641:
1327                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1329  038f c6505a        	ld	a,20570
1330  0392 a4f3          	and	a,#243
1331  0394 c7505a        	ld	20570,a
1332                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1334  0397 c6505a        	ld	a,20570
1335  039a 1a01          	or	a,(OFST+1,sp)
1336  039c c7505a        	ld	20570,a
1337                     ; 345 }
1340  039f 84            	pop	a
1341  03a0 81            	ret
1400                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1400                     ; 354 {
1401                     	switch	.text
1402  03a1               _FLASH_SetProgrammingTime:
1404  03a1 88            	push	a
1405       00000000      OFST:	set	0
1408                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1410  03a2 4d            	tnz	a
1411  03a3 2704          	jreq	L451
1412  03a5 a101          	cp	a,#1
1413  03a7 2603          	jrne	L251
1414  03a9               L451:
1415  03a9 4f            	clr	a
1416  03aa 2010          	jra	L651
1417  03ac               L251:
1418  03ac ae0164        	ldw	x,#356
1419  03af 89            	pushw	x
1420  03b0 ae0000        	ldw	x,#0
1421  03b3 89            	pushw	x
1422  03b4 ae0010        	ldw	x,#L73
1423  03b7 cd0000        	call	_assert_failed
1425  03ba 5b04          	addw	sp,#4
1426  03bc               L651:
1427                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1429  03bc 7211505a      	bres	20570,#0
1430                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1432  03c0 c6505a        	ld	a,20570
1433  03c3 1a01          	or	a,(OFST+1,sp)
1434  03c5 c7505a        	ld	20570,a
1435                     ; 360 }
1438  03c8 84            	pop	a
1439  03c9 81            	ret
1464                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1464                     ; 368 {
1465                     	switch	.text
1466  03ca               _FLASH_GetLowPowerMode:
1470                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1472  03ca c6505a        	ld	a,20570
1473  03cd a40c          	and	a,#12
1476  03cf 81            	ret
1501                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1501                     ; 378 {
1502                     	switch	.text
1503  03d0               _FLASH_GetProgrammingTime:
1507                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1509  03d0 c6505a        	ld	a,20570
1510  03d3 a401          	and	a,#1
1513  03d5 81            	ret
1547                     ; 387 uint32_t FLASH_GetBootSize(void)
1547                     ; 388 {
1548                     	switch	.text
1549  03d6               _FLASH_GetBootSize:
1551  03d6 5204          	subw	sp,#4
1552       00000004      OFST:	set	4
1555                     ; 389     uint32_t temp = 0;
1557                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1559  03d8 c6505d        	ld	a,20573
1560  03db 5f            	clrw	x
1561  03dc 97            	ld	xl,a
1562  03dd 90ae0200      	ldw	y,#512
1563  03e1 cd0000        	call	c_umul
1565  03e4 96            	ldw	x,sp
1566  03e5 1c0001        	addw	x,#OFST-3
1567  03e8 cd0000        	call	c_rtol
1569                     ; 395     if (FLASH->FPR == 0xFF)
1571  03eb c6505d        	ld	a,20573
1572  03ee a1ff          	cp	a,#255
1573  03f0 2611          	jrne	L554
1574                     ; 397         temp += 512;
1576  03f2 ae0200        	ldw	x,#512
1577  03f5 bf02          	ldw	c_lreg+2,x
1578  03f7 ae0000        	ldw	x,#0
1579  03fa bf00          	ldw	c_lreg,x
1580  03fc 96            	ldw	x,sp
1581  03fd 1c0001        	addw	x,#OFST-3
1582  0400 cd0000        	call	c_lgadd
1584  0403               L554:
1585                     ; 401     return(temp);
1587  0403 96            	ldw	x,sp
1588  0404 1c0001        	addw	x,#OFST-3
1589  0407 cd0000        	call	c_ltor
1593  040a 5b04          	addw	sp,#4
1594  040c 81            	ret
1704                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1704                     ; 413 {
1705                     	switch	.text
1706  040d               _FLASH_GetFlagStatus:
1708  040d 88            	push	a
1709  040e 88            	push	a
1710       00000001      OFST:	set	1
1713                     ; 414     FlagStatus status = RESET;
1715                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1717  040f a140          	cp	a,#64
1718  0411 2710          	jreq	L271
1719  0413 a108          	cp	a,#8
1720  0415 270c          	jreq	L271
1721  0417 a104          	cp	a,#4
1722  0419 2708          	jreq	L271
1723  041b a102          	cp	a,#2
1724  041d 2704          	jreq	L271
1725  041f a101          	cp	a,#1
1726  0421 2603          	jrne	L071
1727  0423               L271:
1728  0423 4f            	clr	a
1729  0424 2010          	jra	L471
1730  0426               L071:
1731  0426 ae01a0        	ldw	x,#416
1732  0429 89            	pushw	x
1733  042a ae0000        	ldw	x,#0
1734  042d 89            	pushw	x
1735  042e ae0010        	ldw	x,#L73
1736  0431 cd0000        	call	_assert_failed
1738  0434 5b04          	addw	sp,#4
1739  0436               L471:
1740                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1742  0436 c6505f        	ld	a,20575
1743  0439 1502          	bcp	a,(OFST+1,sp)
1744  043b 2706          	jreq	L725
1745                     ; 421         status = SET; /* FLASH_FLAG is set */
1747  043d a601          	ld	a,#1
1748  043f 6b01          	ld	(OFST+0,sp),a
1750  0441 2002          	jra	L135
1751  0443               L725:
1752                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1754  0443 0f01          	clr	(OFST+0,sp)
1755  0445               L135:
1756                     ; 429     return status;
1758  0445 7b01          	ld	a,(OFST+0,sp)
1761  0447 85            	popw	x
1762  0448 81            	ret
1855                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1855                     ; 532 {
1856                     	switch	.text
1857  0449               _FLASH_WaitForLastOperation:
1859  0449 5205          	subw	sp,#5
1860       00000005      OFST:	set	5
1863                     ; 533     uint8_t flagstatus = 0x00;
1865  044b 0f05          	clr	(OFST+0,sp)
1866                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1868  044d aeffff        	ldw	x,#65535
1869  0450 1f03          	ldw	(OFST-2,sp),x
1870  0452 ae000f        	ldw	x,#15
1871  0455 1f01          	ldw	(OFST-4,sp),x
1872                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1874  0457 a1fd          	cp	a,#253
1875  0459 2631          	jrne	L316
1877  045b 2010          	jra	L106
1878  045d               L775:
1879                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1879                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1881  045d c6505f        	ld	a,20575
1882  0460 a405          	and	a,#5
1883  0462 6b05          	ld	(OFST+0,sp),a
1884                     ; 545             timeout--;
1886  0464 96            	ldw	x,sp
1887  0465 1c0001        	addw	x,#OFST-4
1888  0468 a601          	ld	a,#1
1889  046a cd0000        	call	c_lgsbc
1891  046d               L106:
1892                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1894  046d 0d05          	tnz	(OFST+0,sp)
1895  046f 2628          	jrne	L706
1897  0471 96            	ldw	x,sp
1898  0472 1c0001        	addw	x,#OFST-4
1899  0475 cd0000        	call	c_lzmp
1901  0478 26e3          	jrne	L775
1902  047a 201d          	jra	L706
1903  047c               L116:
1904                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1904                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1906  047c c6505f        	ld	a,20575
1907  047f a441          	and	a,#65
1908  0481 6b05          	ld	(OFST+0,sp),a
1909                     ; 554             timeout--;
1911  0483 96            	ldw	x,sp
1912  0484 1c0001        	addw	x,#OFST-4
1913  0487 a601          	ld	a,#1
1914  0489 cd0000        	call	c_lgsbc
1916  048c               L316:
1917                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1919  048c 0d05          	tnz	(OFST+0,sp)
1920  048e 2609          	jrne	L706
1922  0490 96            	ldw	x,sp
1923  0491 1c0001        	addw	x,#OFST-4
1924  0494 cd0000        	call	c_lzmp
1926  0497 26e3          	jrne	L116
1927  0499               L706:
1928                     ; 566     if (timeout == 0x00 )
1930  0499 96            	ldw	x,sp
1931  049a 1c0001        	addw	x,#OFST-4
1932  049d cd0000        	call	c_lzmp
1934  04a0 2604          	jrne	L126
1935                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1937  04a2 a602          	ld	a,#2
1938  04a4 6b05          	ld	(OFST+0,sp),a
1939  04a6               L126:
1940                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1942  04a6 7b05          	ld	a,(OFST+0,sp)
1945  04a8 5b05          	addw	sp,#5
1946  04aa 81            	ret
2010                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
2010                     ; 582 {
2011                     	switch	.text
2012  04ab               _FLASH_EraseBlock:
2014  04ab 89            	pushw	x
2015  04ac 5207          	subw	sp,#7
2016       00000007      OFST:	set	7
2019                     ; 583   uint32_t startaddress = 0;
2021                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2023  04ae 7b0c          	ld	a,(OFST+5,sp)
2024  04b0 a1fd          	cp	a,#253
2025  04b2 2706          	jreq	L402
2026  04b4 7b0c          	ld	a,(OFST+5,sp)
2027  04b6 a1f7          	cp	a,#247
2028  04b8 2603          	jrne	L202
2029  04ba               L402:
2030  04ba 4f            	clr	a
2031  04bb 2010          	jra	L602
2032  04bd               L202:
2033  04bd ae0251        	ldw	x,#593
2034  04c0 89            	pushw	x
2035  04c1 ae0000        	ldw	x,#0
2036  04c4 89            	pushw	x
2037  04c5 ae0010        	ldw	x,#L73
2038  04c8 cd0000        	call	_assert_failed
2040  04cb 5b04          	addw	sp,#4
2041  04cd               L602:
2042                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2044  04cd 7b0c          	ld	a,(OFST+5,sp)
2045  04cf a1fd          	cp	a,#253
2046  04d1 2626          	jrne	L556
2047                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2049  04d3 1e08          	ldw	x,(OFST+1,sp)
2050  04d5 a30400        	cpw	x,#1024
2051  04d8 2403          	jruge	L012
2052  04da 4f            	clr	a
2053  04db 2010          	jra	L212
2054  04dd               L012:
2055  04dd ae0254        	ldw	x,#596
2056  04e0 89            	pushw	x
2057  04e1 ae0000        	ldw	x,#0
2058  04e4 89            	pushw	x
2059  04e5 ae0010        	ldw	x,#L73
2060  04e8 cd0000        	call	_assert_failed
2062  04eb 5b04          	addw	sp,#4
2063  04ed               L212:
2064                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2066  04ed ae8000        	ldw	x,#32768
2067  04f0 1f03          	ldw	(OFST-4,sp),x
2068  04f2 ae0000        	ldw	x,#0
2069  04f5 1f01          	ldw	(OFST-6,sp),x
2071  04f7 2024          	jra	L756
2072  04f9               L556:
2073                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2075  04f9 1e08          	ldw	x,(OFST+1,sp)
2076  04fb a30010        	cpw	x,#16
2077  04fe 2403          	jruge	L412
2078  0500 4f            	clr	a
2079  0501 2010          	jra	L612
2080  0503               L412:
2081  0503 ae0259        	ldw	x,#601
2082  0506 89            	pushw	x
2083  0507 ae0000        	ldw	x,#0
2084  050a 89            	pushw	x
2085  050b ae0010        	ldw	x,#L73
2086  050e cd0000        	call	_assert_failed
2088  0511 5b04          	addw	sp,#4
2089  0513               L612:
2090                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2092  0513 ae4000        	ldw	x,#16384
2093  0516 1f03          	ldw	(OFST-4,sp),x
2094  0518 ae0000        	ldw	x,#0
2095  051b 1f01          	ldw	(OFST-6,sp),x
2096  051d               L756:
2097                     ; 607     pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2099  051d 1e08          	ldw	x,(OFST+1,sp)
2100  051f a680          	ld	a,#128
2101  0521 cd0000        	call	c_cmulx
2103  0524 96            	ldw	x,sp
2104  0525 1c0001        	addw	x,#OFST-6
2105  0528 cd0000        	call	c_ladd
2107  052b 450100        	mov	c_x,c_lreg+1
2108  052e be02          	ldw	x,c_lreg+2
2109  0530 b600          	ld	a,c_x
2110  0532 6b05          	ld	(OFST-2,sp),a
2111  0534 1f06          	ldw	(OFST-1,sp),x
2112                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
2114  0536 721a505b      	bset	20571,#5
2115                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2117  053a 721b505c      	bres	20572,#5
2118                     ; 622   *pwFlash = (uint8_t)0;
2120  053e 7b05          	ld	a,(OFST-2,sp)
2121  0540 b700          	ld	c_x,a
2122  0542 1e06          	ldw	x,(OFST-1,sp)
2123  0544 bf01          	ldw	c_x+1,x
2124  0546 4f            	clr	a
2125  0547 92bd0000      	ldf	[c_x.e],a
2126                     ; 623   *(pwFlash + 1) = (uint8_t)0;
2128  054b 7b05          	ld	a,(OFST-2,sp)
2129  054d b700          	ld	c_x,a
2130  054f 1e06          	ldw	x,(OFST-1,sp)
2131  0551 90ae0001      	ldw	y,#1
2132  0555 bf01          	ldw	c_x+1,x
2133  0557 93            	ldw	x,y
2134  0558 4f            	clr	a
2135  0559 92a70000      	ldf	([c_x.e],x),a
2136                     ; 624   *(pwFlash + 2) = (uint8_t)0;
2138  055d 7b05          	ld	a,(OFST-2,sp)
2139  055f b700          	ld	c_x,a
2140  0561 1e06          	ldw	x,(OFST-1,sp)
2141  0563 90ae0002      	ldw	y,#2
2142  0567 bf01          	ldw	c_x+1,x
2143  0569 93            	ldw	x,y
2144  056a 4f            	clr	a
2145  056b 92a70000      	ldf	([c_x.e],x),a
2146                     ; 625   *(pwFlash + 3) = (uint8_t)0;    
2148  056f 7b05          	ld	a,(OFST-2,sp)
2149  0571 b700          	ld	c_x,a
2150  0573 1e06          	ldw	x,(OFST-1,sp)
2151  0575 90ae0003      	ldw	y,#3
2152  0579 bf01          	ldw	c_x+1,x
2153  057b 93            	ldw	x,y
2154  057c 4f            	clr	a
2155  057d 92a70000      	ldf	([c_x.e],x),a
2156                     ; 627 }
2159  0581 5b09          	addw	sp,#9
2160  0583 81            	ret
2265                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2265                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2265                     ; 640 {
2266                     	switch	.text
2267  0584               _FLASH_ProgramBlock:
2269  0584 89            	pushw	x
2270  0585 5206          	subw	sp,#6
2271       00000006      OFST:	set	6
2274                     ; 641     uint16_t Count = 0;
2276                     ; 642     uint32_t startaddress = 0;
2278                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2280  0587 7b0b          	ld	a,(OFST+5,sp)
2281  0589 a1fd          	cp	a,#253
2282  058b 2706          	jreq	L422
2283  058d 7b0b          	ld	a,(OFST+5,sp)
2284  058f a1f7          	cp	a,#247
2285  0591 2603          	jrne	L222
2286  0593               L422:
2287  0593 4f            	clr	a
2288  0594 2010          	jra	L622
2289  0596               L222:
2290  0596 ae0285        	ldw	x,#645
2291  0599 89            	pushw	x
2292  059a ae0000        	ldw	x,#0
2293  059d 89            	pushw	x
2294  059e ae0010        	ldw	x,#L73
2295  05a1 cd0000        	call	_assert_failed
2297  05a4 5b04          	addw	sp,#4
2298  05a6               L622:
2299                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2301  05a6 0d0c          	tnz	(OFST+6,sp)
2302  05a8 2706          	jreq	L232
2303  05aa 7b0c          	ld	a,(OFST+6,sp)
2304  05ac a110          	cp	a,#16
2305  05ae 2603          	jrne	L032
2306  05b0               L232:
2307  05b0 4f            	clr	a
2308  05b1 2010          	jra	L432
2309  05b3               L032:
2310  05b3 ae0286        	ldw	x,#646
2311  05b6 89            	pushw	x
2312  05b7 ae0000        	ldw	x,#0
2313  05ba 89            	pushw	x
2314  05bb ae0010        	ldw	x,#L73
2315  05be cd0000        	call	_assert_failed
2317  05c1 5b04          	addw	sp,#4
2318  05c3               L432:
2319                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2321  05c3 7b0b          	ld	a,(OFST+5,sp)
2322  05c5 a1fd          	cp	a,#253
2323  05c7 2626          	jrne	L337
2324                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2326  05c9 1e07          	ldw	x,(OFST+1,sp)
2327  05cb a30400        	cpw	x,#1024
2328  05ce 2403          	jruge	L632
2329  05d0 4f            	clr	a
2330  05d1 2010          	jra	L042
2331  05d3               L632:
2332  05d3 ae0289        	ldw	x,#649
2333  05d6 89            	pushw	x
2334  05d7 ae0000        	ldw	x,#0
2335  05da 89            	pushw	x
2336  05db ae0010        	ldw	x,#L73
2337  05de cd0000        	call	_assert_failed
2339  05e1 5b04          	addw	sp,#4
2340  05e3               L042:
2341                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2343  05e3 ae8000        	ldw	x,#32768
2344  05e6 1f03          	ldw	(OFST-3,sp),x
2345  05e8 ae0000        	ldw	x,#0
2346  05eb 1f01          	ldw	(OFST-5,sp),x
2348  05ed 2024          	jra	L537
2349  05ef               L337:
2350                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2352  05ef 1e07          	ldw	x,(OFST+1,sp)
2353  05f1 a30010        	cpw	x,#16
2354  05f4 2403          	jruge	L242
2355  05f6 4f            	clr	a
2356  05f7 2010          	jra	L442
2357  05f9               L242:
2358  05f9 ae028e        	ldw	x,#654
2359  05fc 89            	pushw	x
2360  05fd ae0000        	ldw	x,#0
2361  0600 89            	pushw	x
2362  0601 ae0010        	ldw	x,#L73
2363  0604 cd0000        	call	_assert_failed
2365  0607 5b04          	addw	sp,#4
2366  0609               L442:
2367                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2369  0609 ae4000        	ldw	x,#16384
2370  060c 1f03          	ldw	(OFST-3,sp),x
2371  060e ae0000        	ldw	x,#0
2372  0611 1f01          	ldw	(OFST-5,sp),x
2373  0613               L537:
2374                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2376  0613 1e07          	ldw	x,(OFST+1,sp)
2377  0615 a680          	ld	a,#128
2378  0617 cd0000        	call	c_cmulx
2380  061a 96            	ldw	x,sp
2381  061b 1c0001        	addw	x,#OFST-5
2382  061e cd0000        	call	c_lgadd
2384                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2386  0621 0d0c          	tnz	(OFST+6,sp)
2387  0623 260a          	jrne	L737
2388                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2390  0625 7210505b      	bset	20571,#0
2391                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2393  0629 7211505c      	bres	20572,#0
2395  062d 2008          	jra	L147
2396  062f               L737:
2397                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2399  062f 7218505b      	bset	20571,#4
2400                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2402  0633 7219505c      	bres	20572,#4
2403  0637               L147:
2404                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2406  0637 5f            	clrw	x
2407  0638 1f05          	ldw	(OFST-1,sp),x
2408  063a               L347:
2409                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2411  063a 7b03          	ld	a,(OFST-3,sp)
2412  063c 97            	ld	xl,a
2413  063d 7b04          	ld	a,(OFST-2,sp)
2414  063f 3f00          	clr	c_x
2415  0641 02            	rlwa	x,a
2416  0642 9093          	ldw	y,x
2417  0644 1605          	ldw	y,(OFST-1,sp)
2418  0646 bf01          	ldw	c_x+1,x
2419  0648 93            	ldw	x,y
2420  0649 160d          	ldw	y,(OFST+7,sp)
2421  064b 72f905        	addw	y,(OFST-1,sp)
2422  064e 90f6          	ld	a,(y)
2423  0650 92a70000      	ldf	([c_x.e],x),a
2424                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2426  0654 1e05          	ldw	x,(OFST-1,sp)
2427  0656 1c0001        	addw	x,#1
2428  0659 1f05          	ldw	(OFST-1,sp),x
2431  065b 1e05          	ldw	x,(OFST-1,sp)
2432  065d a30080        	cpw	x,#128
2433  0660 25d8          	jrult	L347
2434                     ; 685 }
2437  0662 5b08          	addw	sp,#8
2438  0664 81            	ret
2451                     	xdef	_FLASH_WaitForLastOperation
2452                     	xdef	_FLASH_ProgramBlock
2453                     	xdef	_FLASH_EraseBlock
2454                     	xdef	_FLASH_GetFlagStatus
2455                     	xdef	_FLASH_GetBootSize
2456                     	xdef	_FLASH_GetProgrammingTime
2457                     	xdef	_FLASH_GetLowPowerMode
2458                     	xdef	_FLASH_SetProgrammingTime
2459                     	xdef	_FLASH_SetLowPowerMode
2460                     	xdef	_FLASH_EraseOptionByte
2461                     	xdef	_FLASH_ProgramOptionByte
2462                     	xdef	_FLASH_ReadOptionByte
2463                     	xdef	_FLASH_ProgramWord
2464                     	xdef	_FLASH_ReadByte
2465                     	xdef	_FLASH_ProgramByte
2466                     	xdef	_FLASH_EraseByte
2467                     	xdef	_FLASH_ITConfig
2468                     	xdef	_FLASH_DeInit
2469                     	xdef	_FLASH_Lock
2470                     	xdef	_FLASH_Unlock
2471                     	xref	_assert_failed
2472                     	switch	.const
2473  0010               L73:
2474  0010 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_f"
2475  0022 6c6173682e63  	dc.b	"lash.c",0
2476                     	xref.b	c_lreg
2477                     	xref.b	c_x
2478                     	xref.b	c_y
2498                     	xref	c_ladd
2499                     	xref	c_cmulx
2500                     	xref	c_lzmp
2501                     	xref	c_lgsbc
2502                     	xref	c_lgadd
2503                     	xref	c_rtol
2504                     	xref	c_umul
2505                     	xref	c_lcmp
2506                     	xref	c_ltor
2507                     	end

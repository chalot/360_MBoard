   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  44                     ; 55 void RTC_GPIO_Init(void) 
  44                     ; 56 {
  46                     	switch	.text
  47  0000               L3_RTC_GPIO_Init:
  51                     ; 57 	GPIO_Init(GPIO_RTC_CLK_PORT, GPIO_RTC_CLK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  53  0000 4bf0          	push	#240
  54  0002 4b08          	push	#8
  55  0004 ae5014        	ldw	x,#20500
  56  0007 cd0000        	call	_GPIO_Init
  58  000a 85            	popw	x
  59                     ; 58 	GPIO_Init(GPIO_RTC_DAT_PORT, GPIO_RTC_DAT_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  61  000b 4bf0          	push	#240
  62  000d 4b01          	push	#1
  63  000f ae500f        	ldw	x,#20495
  64  0012 cd0000        	call	_GPIO_Init
  66  0015 85            	popw	x
  67                     ; 59 	GPIO_Init(GPIO_RTC_RST_PORT, GPIO_RTC_RST_PIN, GPIO_MODE_OUT_PP_HIGH_FAST);
  69  0016 4bf0          	push	#240
  70  0018 4b40          	push	#64
  71  001a ae5000        	ldw	x,#20480
  72  001d cd0000        	call	_GPIO_Init
  74  0020 85            	popw	x
  75                     ; 60 }
  78  0021 81            	ret
 122                     ; 71 u8 DS1302Read(u8 cmd)
 122                     ; 72 {
 123                     	switch	.text
 124  0022               L7_DS1302Read:
 126  0022 88            	push	a
 127  0023 88            	push	a
 128       00000001      OFST:	set	1
 131                     ; 73 	u8 dat = 0;
 133                     ; 75 	RST_LOW;//初始 CE线置为0
 135  0024 4b40          	push	#64
 136  0026 ae5000        	ldw	x,#20480
 137  0029 cd0000        	call	_GPIO_WriteLow
 139  002c 84            	pop	a
 140                     ; 76 	Delay(10);
 143  002d ae000a        	ldw	x,#10
 144  0030 89            	pushw	x
 145  0031 ae0000        	ldw	x,#0
 146  0034 89            	pushw	x
 147  0035 cd0000        	call	_Delay
 149  0038 5b04          	addw	sp,#4
 150                     ; 77 	SCLK_LOW;//初始时钟线置为0
 152  003a 4b08          	push	#8
 153  003c ae5014        	ldw	x,#20500
 154  003f cd0000        	call	_GPIO_WriteLow
 156  0042 84            	pop	a
 157                     ; 78 	Delay(10);
 160  0043 ae000a        	ldw	x,#10
 161  0046 89            	pushw	x
 162  0047 ae0000        	ldw	x,#0
 163  004a 89            	pushw	x
 164  004b cd0000        	call	_Delay
 166  004e 5b04          	addw	sp,#4
 167                     ; 79 	RST_HIGH;//初始 CE置为 1，传输开始
 169  0050 4b40          	push	#64
 170  0052 ae5000        	ldw	x,#20480
 171  0055 cd0000        	call	_GPIO_WriteHigh
 173  0058 84            	pop	a
 174                     ; 80 	DS1302WriteByte(cmd);//传输命令字，要读取的时间/日历地址
 177  0059 7b02          	ld	a,(OFST+1,sp)
 178  005b cd00ff        	call	L31_DS1302WriteByte
 180                     ; 81 	dat=DS1302ReadByte();//读取要得到的时间/日期
 182  005e cd0176        	call	L11_DS1302ReadByte
 184  0061 6b01          	ld	(OFST+0,sp),a
 185                     ; 82 	SCLK_HIGH;//时钟线拉高
 187  0063 4b08          	push	#8
 188  0065 ae5014        	ldw	x,#20500
 189  0068 cd0000        	call	_GPIO_WriteHigh
 191  006b 84            	pop	a
 192                     ; 83 	Delay(10);
 195  006c ae000a        	ldw	x,#10
 196  006f 89            	pushw	x
 197  0070 ae0000        	ldw	x,#0
 198  0073 89            	pushw	x
 199  0074 cd0000        	call	_Delay
 201  0077 5b04          	addw	sp,#4
 202                     ; 84 	RST_LOW;//读取结束，CE置为 0，结束数据的传输
 204  0079 4b40          	push	#64
 205  007b ae5000        	ldw	x,#20480
 206  007e cd0000        	call	_GPIO_WriteLow
 208  0081 84            	pop	a
 209                     ; 86 	return dat;//返回得到的时间/日期
 212  0082 7b01          	ld	a,(OFST+0,sp)
 215  0084 85            	popw	x
 216  0085 81            	ret
 259                     ; 97 void DS1302Write(u8 cmd, u8 dat)
 259                     ; 98 {
 260                     	switch	.text
 261  0086               L5_DS1302Write:
 263  0086 89            	pushw	x
 264       00000000      OFST:	set	0
 267                     ; 99 	RST_LOW; //初始 CE线置为 0
 269  0087 4b40          	push	#64
 270  0089 ae5000        	ldw	x,#20480
 271  008c cd0000        	call	_GPIO_WriteLow
 273  008f 84            	pop	a
 274                     ; 100 	Delay(10);
 277  0090 ae000a        	ldw	x,#10
 278  0093 89            	pushw	x
 279  0094 ae0000        	ldw	x,#0
 280  0097 89            	pushw	x
 281  0098 cd0000        	call	_Delay
 283  009b 5b04          	addw	sp,#4
 284                     ; 101 	SCLK_LOW; //初始时钟线置为0
 286  009d 4b08          	push	#8
 287  009f ae5014        	ldw	x,#20500
 288  00a2 cd0000        	call	_GPIO_WriteLow
 290  00a5 84            	pop	a
 291                     ; 102 	Delay(10);
 294  00a6 ae000a        	ldw	x,#10
 295  00a9 89            	pushw	x
 296  00aa ae0000        	ldw	x,#0
 297  00ad 89            	pushw	x
 298  00ae cd0000        	call	_Delay
 300  00b1 5b04          	addw	sp,#4
 301                     ; 103 	RST_HIGH; //初始 CE置为 1，传输开始
 303  00b3 4b40          	push	#64
 304  00b5 ae5000        	ldw	x,#20480
 305  00b8 cd0000        	call	_GPIO_WriteHigh
 307  00bb 84            	pop	a
 308                     ; 104 	Delay(10);
 311  00bc ae000a        	ldw	x,#10
 312  00bf 89            	pushw	x
 313  00c0 ae0000        	ldw	x,#0
 314  00c3 89            	pushw	x
 315  00c4 cd0000        	call	_Delay
 317  00c7 5b04          	addw	sp,#4
 318                     ; 105 	DS1302WriteByte(cmd); //传输命令字，要写入的时间/日历地址
 320  00c9 7b01          	ld	a,(OFST+1,sp)
 321  00cb ad32          	call	L31_DS1302WriteByte
 323                     ; 106 	DS1302WriteByte(dat); //写入要修改的时间/日期
 325  00cd 7b02          	ld	a,(OFST+2,sp)
 326  00cf ad2e          	call	L31_DS1302WriteByte
 328                     ; 107 	SCLK_HIGH; //时钟线拉高
 330  00d1 4b08          	push	#8
 331  00d3 ae5014        	ldw	x,#20500
 332  00d6 cd0000        	call	_GPIO_WriteHigh
 334  00d9 84            	pop	a
 335                     ; 108 	Delay(10);
 338  00da ae000a        	ldw	x,#10
 339  00dd 89            	pushw	x
 340  00de ae0000        	ldw	x,#0
 341  00e1 89            	pushw	x
 342  00e2 cd0000        	call	_Delay
 344  00e5 5b04          	addw	sp,#4
 345                     ; 109 	RST_LOW; //读取结束，CE置为0，结束数据的传输
 347  00e7 4b40          	push	#64
 348  00e9 ae5000        	ldw	x,#20480
 349  00ec cd0000        	call	_GPIO_WriteLow
 351  00ef 84            	pop	a
 352                     ; 110 	Delay(10);
 355  00f0 ae000a        	ldw	x,#10
 356  00f3 89            	pushw	x
 357  00f4 ae0000        	ldw	x,#0
 358  00f7 89            	pushw	x
 359  00f8 cd0000        	call	_Delay
 361  00fb 5b04          	addw	sp,#4
 362                     ; 111 }
 365  00fd 85            	popw	x
 366  00fe 81            	ret
 409                     ; 121 void DS1302WriteByte(u8 dat)
 409                     ; 122 {
 410                     	switch	.text
 411  00ff               L31_DS1302WriteByte:
 413  00ff 88            	push	a
 414  0100 88            	push	a
 415       00000001      OFST:	set	1
 418                     ; 123 	u8 i = 0;
 420                     ; 125 	DAT_OUT;
 422  0101 4bf0          	push	#240
 423  0103 4b01          	push	#1
 424  0105 ae500f        	ldw	x,#20495
 425  0108 cd0000        	call	_GPIO_Init
 427  010b 85            	popw	x
 428                     ; 127 	SCLK_LOW;//初始时钟线置为0
 431  010c 4b08          	push	#8
 432  010e ae5014        	ldw	x,#20500
 433  0111 cd0000        	call	_GPIO_WriteLow
 435  0114 84            	pop	a
 436                     ; 128 	Delay(10);
 439  0115 ae000a        	ldw	x,#10
 440  0118 89            	pushw	x
 441  0119 ae0000        	ldw	x,#0
 442  011c 89            	pushw	x
 443  011d cd0000        	call	_Delay
 445  0120 5b04          	addw	sp,#4
 446                     ; 130 	for(i=0;i<8;i++)//开始传输8个字节的数据
 448  0122 0f01          	clr	(OFST+0,sp)
 449  0124               L111:
 450                     ; 133 		if(dat & 0x01) {
 452  0124 7b02          	ld	a,(OFST+1,sp)
 453  0126 a501          	bcp	a,#1
 454  0128 270b          	jreq	L711
 455                     ; 134 			DAT_HIGH;
 457  012a 4b01          	push	#1
 458  012c ae500f        	ldw	x,#20495
 459  012f cd0000        	call	_GPIO_WriteHigh
 461  0132 84            	pop	a
 464  0133 2009          	jra	L121
 465  0135               L711:
 466                     ; 136 			DAT_LOW;
 468  0135 4b01          	push	#1
 469  0137 ae500f        	ldw	x,#20495
 470  013a cd0000        	call	_GPIO_WriteLow
 472  013d 84            	pop	a
 473  013e               L121:
 474                     ; 138 		Delay(10);
 476  013e ae000a        	ldw	x,#10
 477  0141 89            	pushw	x
 478  0142 ae0000        	ldw	x,#0
 479  0145 89            	pushw	x
 480  0146 cd0000        	call	_Delay
 482  0149 5b04          	addw	sp,#4
 483                     ; 140 		SCLK_HIGH;//时钟线拉高，制造上升沿，SDA的数据被传输
 485  014b 4b08          	push	#8
 486  014d ae5014        	ldw	x,#20500
 487  0150 cd0000        	call	_GPIO_WriteHigh
 489  0153 84            	pop	a
 490                     ; 141 		Delay(10);
 493  0154 ae000a        	ldw	x,#10
 494  0157 89            	pushw	x
 495  0158 ae0000        	ldw	x,#0
 496  015b 89            	pushw	x
 497  015c cd0000        	call	_Delay
 499  015f 5b04          	addw	sp,#4
 500                     ; 143 		SCLK_LOW;//时钟线拉低，为下一个上升沿做准备
 502  0161 4b08          	push	#8
 503  0163 ae5014        	ldw	x,#20500
 504  0166 cd0000        	call	_GPIO_WriteLow
 506  0169 84            	pop	a
 507                     ; 144 		dat >>= 1;//数据右移一位，准备传输下一位数据
 510  016a 0402          	srl	(OFST+1,sp)
 511                     ; 130 	for(i=0;i<8;i++)//开始传输8个字节的数据
 513  016c 0c01          	inc	(OFST+0,sp)
 516  016e 7b01          	ld	a,(OFST+0,sp)
 517  0170 a108          	cp	a,#8
 518  0172 25b0          	jrult	L111
 519                     ; 146 }
 522  0174 85            	popw	x
 523  0175 81            	ret
 567                     ; 155 u8 DS1302ReadByte(void)
 567                     ; 156 {
 568                     	switch	.text
 569  0176               L11_DS1302ReadByte:
 571  0176 89            	pushw	x
 572       00000002      OFST:	set	2
 575                     ; 157 	u8 i = 0, dat = 0;
 579  0177 0f02          	clr	(OFST+0,sp)
 580                     ; 159 	DAT_IN;
 582  0179 4b00          	push	#0
 583  017b 4b01          	push	#1
 584  017d ae500f        	ldw	x,#20495
 585  0180 cd0000        	call	_GPIO_Init
 587  0183 85            	popw	x
 588                     ; 161 	Delay(10);
 591  0184 ae000a        	ldw	x,#10
 592  0187 89            	pushw	x
 593  0188 ae0000        	ldw	x,#0
 594  018b 89            	pushw	x
 595  018c cd0000        	call	_Delay
 597  018f 5b04          	addw	sp,#4
 598                     ; 162 	for(i=0;i<8;i++)
 600  0191 0f01          	clr	(OFST-1,sp)
 601  0193               L141:
 602                     ; 164 		dat >>= 1;//要返回的数据左移一位
 604  0193 0402          	srl	(OFST+0,sp)
 605                     ; 166 		if(DAT_ISHIGH) {
 607  0195 4b01          	push	#1
 608  0197 ae500f        	ldw	x,#20495
 609  019a cd0000        	call	_GPIO_ReadInputPin
 611  019d 5b01          	addw	sp,#1
 612  019f a101          	cp	a,#1
 613  01a1 2606          	jrne	L741
 614                     ; 167 			dat|=0x80;//要传输数据的当前值置为 1,若不是,则为 0
 616  01a3 7b02          	ld	a,(OFST+0,sp)
 617  01a5 aa80          	or	a,#128
 618  01a7 6b02          	ld	(OFST+0,sp),a
 619  01a9               L741:
 620                     ; 169 		SCLK_HIGH;//拉高时钟线
 622  01a9 4b08          	push	#8
 623  01ab ae5014        	ldw	x,#20500
 624  01ae cd0000        	call	_GPIO_WriteHigh
 626  01b1 84            	pop	a
 627                     ; 170 		Delay(10);
 630  01b2 ae000a        	ldw	x,#10
 631  01b5 89            	pushw	x
 632  01b6 ae0000        	ldw	x,#0
 633  01b9 89            	pushw	x
 634  01ba cd0000        	call	_Delay
 636  01bd 5b04          	addw	sp,#4
 637                     ; 171 		SCLK_LOW;//制造下降沿
 639  01bf 4b08          	push	#8
 640  01c1 ae5014        	ldw	x,#20500
 641  01c4 cd0000        	call	_GPIO_WriteLow
 643  01c7 84            	pop	a
 644                     ; 172 		Delay(10);
 647  01c8 ae000a        	ldw	x,#10
 648  01cb 89            	pushw	x
 649  01cc ae0000        	ldw	x,#0
 650  01cf 89            	pushw	x
 651  01d0 cd0000        	call	_Delay
 653  01d3 5b04          	addw	sp,#4
 654                     ; 162 	for(i=0;i<8;i++)
 656  01d5 0c01          	inc	(OFST-1,sp)
 659  01d7 7b01          	ld	a,(OFST-1,sp)
 660  01d9 a108          	cp	a,#8
 661  01db 25b6          	jrult	L141
 662                     ; 175 	return dat;//返回读取出的数据
 664  01dd 7b02          	ld	a,(OFST+0,sp)
 667  01df 85            	popw	x
 668  01e0 81            	ret
 703                     ; 185 void DS1302_burst_Read(unsigned char *rstr)
 703                     ; 186 {
 704                     	switch	.text
 705  01e1               L51_DS1302_burst_Read:
 709                     ; 205 }
 712  01e1 81            	ret
 747                     ; 213 void DS1302_burstWrite(unsigned char *wstr)
 747                     ; 214 {
 748                     	switch	.text
 749  01e2               L71_DS1302_burstWrite:
 753                     ; 234 }
 756  01e2 81            	ret
 780                     ; 236 void RTC_Init(void)
 780                     ; 237 {
 781                     	switch	.text
 782  01e3               _RTC_Init:
 786                     ; 238 	RTC_GPIO_Init();
 788  01e3 cd0000        	call	L3_RTC_GPIO_Init
 790                     ; 239 }
 793  01e6 81            	ret
 861                     ; 249 void RTC_SetDefaultTime(void)
 861                     ; 250 {
 862                     	switch	.text
 863  01e7               _RTC_SetDefaultTime:
 865  01e7 5208          	subw	sp,#8
 866       00000008      OFST:	set	8
 869                     ; 252 	u8 u8Year = 16;
 871  01e9 a610          	ld	a,#16
 872  01eb 6b03          	ld	(OFST-5,sp),a
 873                     ; 253 	u8 u8Month = 9;
 875  01ed a609          	ld	a,#9
 876  01ef 6b04          	ld	(OFST-4,sp),a
 877                     ; 254 	u8 u8Day = 14;
 879  01f1 a60e          	ld	a,#14
 880  01f3 6b05          	ld	(OFST-3,sp),a
 881                     ; 255 	u8 u8Hour = 15;
 883  01f5 a60f          	ld	a,#15
 884  01f7 6b06          	ld	(OFST-2,sp),a
 885                     ; 256 	u8 u8Minute = 49;
 887  01f9 a631          	ld	a,#49
 888  01fb 6b07          	ld	(OFST-1,sp),a
 889                     ; 257 	u8 u8Second = 30;
 891  01fd a61e          	ld	a,#30
 892  01ff 6b08          	ld	(OFST+0,sp),a
 893                     ; 260 	DS1302Write(DS1302_WP_WRITE,0x00);//关闭写保护
 895  0201 5f            	clrw	x
 896  0202 a68e          	ld	a,#142
 897  0204 95            	ld	xh,a
 898  0205 cd0086        	call	L5_DS1302Write
 900                     ; 262 	DS1302Write(DS1302_SECOND_WRITE,(u8Second/10)<<4|(u8Second%10));
 902  0208 7b08          	ld	a,(OFST+0,sp)
 903  020a 5f            	clrw	x
 904  020b 97            	ld	xl,a
 905  020c a60a          	ld	a,#10
 906  020e cd0000        	call	c_smodx
 908  0211 1f01          	ldw	(OFST-7,sp),x
 909  0213 7b08          	ld	a,(OFST+0,sp)
 910  0215 5f            	clrw	x
 911  0216 97            	ld	xl,a
 912  0217 a60a          	ld	a,#10
 913  0219 cd0000        	call	c_sdivx
 915  021c 58            	sllw	x
 916  021d 58            	sllw	x
 917  021e 58            	sllw	x
 918  021f 58            	sllw	x
 919  0220 01            	rrwa	x,a
 920  0221 1a02          	or	a,(OFST-6,sp)
 921  0223 01            	rrwa	x,a
 922  0224 1a01          	or	a,(OFST-7,sp)
 923  0226 01            	rrwa	x,a
 924  0227 9f            	ld	a,xl
 925  0228 97            	ld	xl,a
 926  0229 a680          	ld	a,#128
 927  022b 95            	ld	xh,a
 928  022c cd0086        	call	L5_DS1302Write
 930                     ; 263 	DS1302Write(DS1302_MINUTE_WRITE,(u8Minute/10)<<4|(u8Minute%10));
 932  022f 7b07          	ld	a,(OFST-1,sp)
 933  0231 5f            	clrw	x
 934  0232 97            	ld	xl,a
 935  0233 a60a          	ld	a,#10
 936  0235 cd0000        	call	c_smodx
 938  0238 1f01          	ldw	(OFST-7,sp),x
 939  023a 7b07          	ld	a,(OFST-1,sp)
 940  023c 5f            	clrw	x
 941  023d 97            	ld	xl,a
 942  023e a60a          	ld	a,#10
 943  0240 cd0000        	call	c_sdivx
 945  0243 58            	sllw	x
 946  0244 58            	sllw	x
 947  0245 58            	sllw	x
 948  0246 58            	sllw	x
 949  0247 01            	rrwa	x,a
 950  0248 1a02          	or	a,(OFST-6,sp)
 951  024a 01            	rrwa	x,a
 952  024b 1a01          	or	a,(OFST-7,sp)
 953  024d 01            	rrwa	x,a
 954  024e 9f            	ld	a,xl
 955  024f 97            	ld	xl,a
 956  0250 a682          	ld	a,#130
 957  0252 95            	ld	xh,a
 958  0253 cd0086        	call	L5_DS1302Write
 960                     ; 264 	DS1302Write(DS1302_HOUR_WRITE,(u8Hour/10)<<4|(u8Hour%10)); //24小时模式
 962  0256 7b06          	ld	a,(OFST-2,sp)
 963  0258 5f            	clrw	x
 964  0259 97            	ld	xl,a
 965  025a a60a          	ld	a,#10
 966  025c cd0000        	call	c_smodx
 968  025f 1f01          	ldw	(OFST-7,sp),x
 969  0261 7b06          	ld	a,(OFST-2,sp)
 970  0263 5f            	clrw	x
 971  0264 97            	ld	xl,a
 972  0265 a60a          	ld	a,#10
 973  0267 cd0000        	call	c_sdivx
 975  026a 58            	sllw	x
 976  026b 58            	sllw	x
 977  026c 58            	sllw	x
 978  026d 58            	sllw	x
 979  026e 01            	rrwa	x,a
 980  026f 1a02          	or	a,(OFST-6,sp)
 981  0271 01            	rrwa	x,a
 982  0272 1a01          	or	a,(OFST-7,sp)
 983  0274 01            	rrwa	x,a
 984  0275 9f            	ld	a,xl
 985  0276 97            	ld	xl,a
 986  0277 a684          	ld	a,#132
 987  0279 95            	ld	xh,a
 988  027a cd0086        	call	L5_DS1302Write
 990                     ; 265 	DS1302Write(DS1302_DAY_WRITE,(u8Day/10)<<4|(u8Day%10)); 
 992  027d 7b05          	ld	a,(OFST-3,sp)
 993  027f 5f            	clrw	x
 994  0280 97            	ld	xl,a
 995  0281 a60a          	ld	a,#10
 996  0283 cd0000        	call	c_smodx
 998  0286 1f01          	ldw	(OFST-7,sp),x
 999  0288 7b05          	ld	a,(OFST-3,sp)
1000  028a 5f            	clrw	x
1001  028b 97            	ld	xl,a
1002  028c a60a          	ld	a,#10
1003  028e cd0000        	call	c_sdivx
1005  0291 58            	sllw	x
1006  0292 58            	sllw	x
1007  0293 58            	sllw	x
1008  0294 58            	sllw	x
1009  0295 01            	rrwa	x,a
1010  0296 1a02          	or	a,(OFST-6,sp)
1011  0298 01            	rrwa	x,a
1012  0299 1a01          	or	a,(OFST-7,sp)
1013  029b 01            	rrwa	x,a
1014  029c 9f            	ld	a,xl
1015  029d 97            	ld	xl,a
1016  029e a686          	ld	a,#134
1017  02a0 95            	ld	xh,a
1018  02a1 cd0086        	call	L5_DS1302Write
1020                     ; 266 	DS1302Write(DS1302_MONTH_WRITE,(u8Month/10)<<4|(u8Month%10));
1022  02a4 7b04          	ld	a,(OFST-4,sp)
1023  02a6 5f            	clrw	x
1024  02a7 97            	ld	xl,a
1025  02a8 a60a          	ld	a,#10
1026  02aa cd0000        	call	c_smodx
1028  02ad 1f01          	ldw	(OFST-7,sp),x
1029  02af 7b04          	ld	a,(OFST-4,sp)
1030  02b1 5f            	clrw	x
1031  02b2 97            	ld	xl,a
1032  02b3 a60a          	ld	a,#10
1033  02b5 cd0000        	call	c_sdivx
1035  02b8 58            	sllw	x
1036  02b9 58            	sllw	x
1037  02ba 58            	sllw	x
1038  02bb 58            	sllw	x
1039  02bc 01            	rrwa	x,a
1040  02bd 1a02          	or	a,(OFST-6,sp)
1041  02bf 01            	rrwa	x,a
1042  02c0 1a01          	or	a,(OFST-7,sp)
1043  02c2 01            	rrwa	x,a
1044  02c3 9f            	ld	a,xl
1045  02c4 97            	ld	xl,a
1046  02c5 a688          	ld	a,#136
1047  02c7 95            	ld	xh,a
1048  02c8 cd0086        	call	L5_DS1302Write
1050                     ; 267 	DS1302Write(DS1302_YEAR_WRITE,(u8Year/10)<<4|(u8Year%10));
1052  02cb 7b03          	ld	a,(OFST-5,sp)
1053  02cd 5f            	clrw	x
1054  02ce 97            	ld	xl,a
1055  02cf a60a          	ld	a,#10
1056  02d1 cd0000        	call	c_smodx
1058  02d4 1f01          	ldw	(OFST-7,sp),x
1059  02d6 7b03          	ld	a,(OFST-5,sp)
1060  02d8 5f            	clrw	x
1061  02d9 97            	ld	xl,a
1062  02da a60a          	ld	a,#10
1063  02dc cd0000        	call	c_sdivx
1065  02df 58            	sllw	x
1066  02e0 58            	sllw	x
1067  02e1 58            	sllw	x
1068  02e2 58            	sllw	x
1069  02e3 01            	rrwa	x,a
1070  02e4 1a02          	or	a,(OFST-6,sp)
1071  02e6 01            	rrwa	x,a
1072  02e7 1a01          	or	a,(OFST-7,sp)
1073  02e9 01            	rrwa	x,a
1074  02ea 9f            	ld	a,xl
1075  02eb 97            	ld	xl,a
1076  02ec a68c          	ld	a,#140
1077  02ee 95            	ld	xh,a
1078  02ef cd0086        	call	L5_DS1302Write
1080                     ; 270 	DS1302Write(DS1302_WP_WRITE,0x80); //恢复写保护
1082  02f2 ae0080        	ldw	x,#128
1083  02f5 a68e          	ld	a,#142
1084  02f7 95            	ld	xh,a
1085  02f8 cd0086        	call	L5_DS1302Write
1087                     ; 272 }
1090  02fb 5b08          	addw	sp,#8
1091  02fd 81            	ret
1130                     .const:	section	.text
1131  0000               L23:
1132  0000 030e          	dc.w	L342
1133  0002 0319          	dc.w	L742
1134  0004 030e          	dc.w	L342
1135  0006 0313          	dc.w	L542
1136  0008 030e          	dc.w	L342
1137  000a 0313          	dc.w	L542
1138  000c 030e          	dc.w	L342
1139  000e 030e          	dc.w	L342
1140  0010 0313          	dc.w	L542
1141  0012 030e          	dc.w	L342
1142  0014 0313          	dc.w	L542
1143  0016 030e          	dc.w	L342
1144                     ; 281 int MonthDays(int year, int month)
1144                     ; 282 {
1145                     	switch	.text
1146  02fe               _MonthDays:
1148  02fe 89            	pushw	x
1149       00000000      OFST:	set	0
1152                     ; 283 	switch(month)
1154  02ff 1e05          	ldw	x,(OFST+5,sp)
1156                     ; 301 	default:
1156                     ; 302 		return 0;
1157  0301 5a            	decw	x
1158  0302 a3000c        	cpw	x,#12
1159  0305 2405          	jruge	L03
1160  0307 58            	sllw	x
1161  0308 de0000        	ldw	x,(L23,x)
1162  030b fc            	jp	(x)
1163  030c               L03:
1164  030c 203c          	jra	L152
1165  030e               L342:
1166                     ; 285 	case 1:
1166                     ; 286 	case 3:
1166                     ; 287 	case 5:
1166                     ; 288 	case 7:
1166                     ; 289 	case 8:
1166                     ; 290 	case 10:
1166                     ; 291 	case 12: return 31; //一三五七八十腊，三十一天永不差
1168  030e ae001f        	ldw	x,#31
1170  0311 2003          	jra	L43
1171  0313               L542:
1172                     ; 292 	case 4:
1172                     ; 293 	case 6:
1172                     ; 294 	case 9:
1172                     ; 295 	case 11: return 30;//其他月份自然是30了
1174  0313 ae001e        	ldw	x,#30
1176  0316               L43:
1178  0316 5b02          	addw	sp,#2
1179  0318 81            	ret
1180  0319               L742:
1181                     ; 296 	case 2://计算闰月
1181                     ; 297 		if(year%4==0 && year%100!=0 || year%400==0)
1183  0319 1e01          	ldw	x,(OFST+1,sp)
1184  031b a604          	ld	a,#4
1185  031d cd0000        	call	c_smodx
1187  0320 a30000        	cpw	x,#0
1188  0323 260c          	jrne	L103
1190  0325 1e01          	ldw	x,(OFST+1,sp)
1191  0327 a664          	ld	a,#100
1192  0329 cd0000        	call	c_smodx
1194  032c a30000        	cpw	x,#0
1195  032f 260f          	jrne	L772
1196  0331               L103:
1198  0331 1e01          	ldw	x,(OFST+1,sp)
1199  0333 90ae0190      	ldw	y,#400
1200  0337 cd0000        	call	c_idiv
1202  033a 51            	exgw	x,y
1203  033b a30000        	cpw	x,#0
1204  033e 2605          	jrne	L572
1205  0340               L772:
1206                     ; 298 			return 29;
1208  0340 ae001d        	ldw	x,#29
1210  0343 20d1          	jra	L43
1211  0345               L572:
1212                     ; 300 		return 28;
1214  0345 ae001c        	ldw	x,#28
1216  0348 20cc          	jra	L43
1217  034a               L152:
1218                     ; 301 	default:
1218                     ; 302 		return 0;
1220  034a 5f            	clrw	x
1222  034b 20c9          	jra	L43
1358                     ; 308 void RTC_ReadDate(TIME *pTime)
1358                     ; 309 {
1359                     	switch	.text
1360  034d               _RTC_ReadDate:
1362  034d 89            	pushw	x
1363  034e 5207          	subw	sp,#7
1364       00000007      OFST:	set	7
1367                     ; 310 	u8 u8Year = 0;
1369                     ; 311 	u8 u8Month = 0;
1371                     ; 312 	u8 u8Day = 0;
1373                     ; 313 	u8 u8Hour = 0;
1375                     ; 314 	u8 u8Minute = 0;
1377                     ; 315 	u8 u8Second = 0;
1379                     ; 316 	u8 ReadValue = 0;
1381                     ; 318 	ReadValue = DS1302Read(0x81);   
1383  0350 a681          	ld	a,#129
1384  0352 cd0022        	call	L7_DS1302Read
1386  0355 6b07          	ld	(OFST+0,sp),a
1387                     ; 319     u8Second = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
1389  0357 7b07          	ld	a,(OFST+0,sp)
1390  0359 a40f          	and	a,#15
1391  035b 6b01          	ld	(OFST-6,sp),a
1392  035d 7b07          	ld	a,(OFST+0,sp)
1393  035f a470          	and	a,#112
1394  0361 4e            	swap	a
1395  0362 a40f          	and	a,#15
1396  0364 97            	ld	xl,a
1397  0365 a60a          	ld	a,#10
1398  0367 42            	mul	x,a
1399  0368 9f            	ld	a,xl
1400  0369 1b01          	add	a,(OFST-6,sp)
1401  036b 6b06          	ld	(OFST-1,sp),a
1402                     ; 321     ReadValue = DS1302Read(0x83);  
1404  036d a683          	ld	a,#131
1405  036f cd0022        	call	L7_DS1302Read
1407  0372 6b07          	ld	(OFST+0,sp),a
1408                     ; 322     u8Minute = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
1410  0374 7b07          	ld	a,(OFST+0,sp)
1411  0376 a40f          	and	a,#15
1412  0378 6b01          	ld	(OFST-6,sp),a
1413  037a 7b07          	ld	a,(OFST+0,sp)
1414  037c a470          	and	a,#112
1415  037e 4e            	swap	a
1416  037f a40f          	and	a,#15
1417  0381 97            	ld	xl,a
1418  0382 a60a          	ld	a,#10
1419  0384 42            	mul	x,a
1420  0385 9f            	ld	a,xl
1421  0386 1b01          	add	a,(OFST-6,sp)
1422  0388 6b05          	ld	(OFST-2,sp),a
1423                     ; 324     ReadValue = DS1302Read(0x85);  
1425  038a a685          	ld	a,#133
1426  038c cd0022        	call	L7_DS1302Read
1428  038f 6b07          	ld	(OFST+0,sp),a
1429                     ; 325     u8Hour = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F); 
1431  0391 7b07          	ld	a,(OFST+0,sp)
1432  0393 a40f          	and	a,#15
1433  0395 6b01          	ld	(OFST-6,sp),a
1434  0397 7b07          	ld	a,(OFST+0,sp)
1435  0399 a470          	and	a,#112
1436  039b 4e            	swap	a
1437  039c a40f          	and	a,#15
1438  039e 97            	ld	xl,a
1439  039f a60a          	ld	a,#10
1440  03a1 42            	mul	x,a
1441  03a2 9f            	ld	a,xl
1442  03a3 1b01          	add	a,(OFST-6,sp)
1443  03a5 6b04          	ld	(OFST-3,sp),a
1444                     ; 327     ReadValue = DS1302Read(0x87);  
1446  03a7 a687          	ld	a,#135
1447  03a9 cd0022        	call	L7_DS1302Read
1449  03ac 6b07          	ld	(OFST+0,sp),a
1450                     ; 328     u8Day = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F); 
1452  03ae 7b07          	ld	a,(OFST+0,sp)
1453  03b0 a40f          	and	a,#15
1454  03b2 6b01          	ld	(OFST-6,sp),a
1455  03b4 7b07          	ld	a,(OFST+0,sp)
1456  03b6 a470          	and	a,#112
1457  03b8 4e            	swap	a
1458  03b9 a40f          	and	a,#15
1459  03bb 97            	ld	xl,a
1460  03bc a60a          	ld	a,#10
1461  03be 42            	mul	x,a
1462  03bf 9f            	ld	a,xl
1463  03c0 1b01          	add	a,(OFST-6,sp)
1464  03c2 6b03          	ld	(OFST-4,sp),a
1465                     ; 330     ReadValue = DS1302Read(0x89);  
1467  03c4 a689          	ld	a,#137
1468  03c6 cd0022        	call	L7_DS1302Read
1470  03c9 6b07          	ld	(OFST+0,sp),a
1471                     ; 331     u8Month = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F);
1473  03cb 7b07          	ld	a,(OFST+0,sp)
1474  03cd a40f          	and	a,#15
1475  03cf 6b01          	ld	(OFST-6,sp),a
1476  03d1 7b07          	ld	a,(OFST+0,sp)
1477  03d3 a470          	and	a,#112
1478  03d5 4e            	swap	a
1479  03d6 a40f          	and	a,#15
1480  03d8 97            	ld	xl,a
1481  03d9 a60a          	ld	a,#10
1482  03db 42            	mul	x,a
1483  03dc 9f            	ld	a,xl
1484  03dd 1b01          	add	a,(OFST-6,sp)
1485  03df 6b02          	ld	(OFST-5,sp),a
1486                     ; 333     ReadValue = DS1302Read(0x8d);  
1488  03e1 a68d          	ld	a,#141
1489  03e3 cd0022        	call	L7_DS1302Read
1491  03e6 6b07          	ld	(OFST+0,sp),a
1492                     ; 334     u8Year = ((ReadValue&0x70)>>4)*10 + (ReadValue&0x0F); 
1494  03e8 7b07          	ld	a,(OFST+0,sp)
1495  03ea a40f          	and	a,#15
1496  03ec 6b01          	ld	(OFST-6,sp),a
1497  03ee 7b07          	ld	a,(OFST+0,sp)
1498  03f0 a470          	and	a,#112
1499  03f2 4e            	swap	a
1500  03f3 a40f          	and	a,#15
1501  03f5 97            	ld	xl,a
1502  03f6 a60a          	ld	a,#10
1503  03f8 42            	mul	x,a
1504  03f9 9f            	ld	a,xl
1505  03fa 1b01          	add	a,(OFST-6,sp)
1506  03fc 6b07          	ld	(OFST+0,sp),a
1507                     ; 336 	pTime->u8Year = u8Year;
1509  03fe 7b07          	ld	a,(OFST+0,sp)
1510  0400 1e08          	ldw	x,(OFST+1,sp)
1511  0402 f7            	ld	(x),a
1512                     ; 337 	pTime->u8Month = u8Month;
1514  0403 7b02          	ld	a,(OFST-5,sp)
1515  0405 1e08          	ldw	x,(OFST+1,sp)
1516  0407 e701          	ld	(1,x),a
1517                     ; 338 	pTime->u8Day = u8Day;
1519  0409 7b03          	ld	a,(OFST-4,sp)
1520  040b 1e08          	ldw	x,(OFST+1,sp)
1521  040d e702          	ld	(2,x),a
1522                     ; 339 	pTime->u8Hour = u8Hour;
1524  040f 7b04          	ld	a,(OFST-3,sp)
1525  0411 1e08          	ldw	x,(OFST+1,sp)
1526  0413 e703          	ld	(3,x),a
1527                     ; 340 	pTime->u8Minute = u8Minute;
1529  0415 7b05          	ld	a,(OFST-2,sp)
1530  0417 1e08          	ldw	x,(OFST+1,sp)
1531  0419 e704          	ld	(4,x),a
1532                     ; 341 	pTime->u8Second = u8Second;
1534  041b 7b06          	ld	a,(OFST-1,sp)
1535  041d 1e08          	ldw	x,(OFST+1,sp)
1536  041f e705          	ld	(5,x),a
1537                     ; 342 }
1540  0421 5b09          	addw	sp,#9
1541  0423 81            	ret
1579                     ; 344 void RTC_WriteDate(TIME *pTime)
1579                     ; 345 {
1580                     	switch	.text
1581  0424               _RTC_WriteDate:
1583  0424 89            	pushw	x
1584  0425 89            	pushw	x
1585       00000002      OFST:	set	2
1588                     ; 347 	DS1302Write(DS1302_WP_WRITE,0x00);//关闭写保护
1590  0426 5f            	clrw	x
1591  0427 a68e          	ld	a,#142
1592  0429 95            	ld	xh,a
1593  042a cd0086        	call	L5_DS1302Write
1595                     ; 349 	DS1302Write(DS1302_SECOND_WRITE,(pTime->u8Second/10)<<4|(pTime->u8Second%10));
1597  042d 1e03          	ldw	x,(OFST+1,sp)
1598  042f e605          	ld	a,(5,x)
1599  0431 5f            	clrw	x
1600  0432 97            	ld	xl,a
1601  0433 a60a          	ld	a,#10
1602  0435 cd0000        	call	c_smodx
1604  0438 1f01          	ldw	(OFST-1,sp),x
1605  043a 1e03          	ldw	x,(OFST+1,sp)
1606  043c e605          	ld	a,(5,x)
1607  043e 5f            	clrw	x
1608  043f 97            	ld	xl,a
1609  0440 a60a          	ld	a,#10
1610  0442 cd0000        	call	c_sdivx
1612  0445 58            	sllw	x
1613  0446 58            	sllw	x
1614  0447 58            	sllw	x
1615  0448 58            	sllw	x
1616  0449 01            	rrwa	x,a
1617  044a 1a02          	or	a,(OFST+0,sp)
1618  044c 01            	rrwa	x,a
1619  044d 1a01          	or	a,(OFST-1,sp)
1620  044f 01            	rrwa	x,a
1621  0450 9f            	ld	a,xl
1622  0451 97            	ld	xl,a
1623  0452 a680          	ld	a,#128
1624  0454 95            	ld	xh,a
1625  0455 cd0086        	call	L5_DS1302Write
1627                     ; 350 	DS1302Write(DS1302_MINUTE_WRITE,(pTime->u8Minute/10)<<4|(pTime->u8Minute%10));
1629  0458 1e03          	ldw	x,(OFST+1,sp)
1630  045a e604          	ld	a,(4,x)
1631  045c 5f            	clrw	x
1632  045d 97            	ld	xl,a
1633  045e a60a          	ld	a,#10
1634  0460 cd0000        	call	c_smodx
1636  0463 1f01          	ldw	(OFST-1,sp),x
1637  0465 1e03          	ldw	x,(OFST+1,sp)
1638  0467 e604          	ld	a,(4,x)
1639  0469 5f            	clrw	x
1640  046a 97            	ld	xl,a
1641  046b a60a          	ld	a,#10
1642  046d cd0000        	call	c_sdivx
1644  0470 58            	sllw	x
1645  0471 58            	sllw	x
1646  0472 58            	sllw	x
1647  0473 58            	sllw	x
1648  0474 01            	rrwa	x,a
1649  0475 1a02          	or	a,(OFST+0,sp)
1650  0477 01            	rrwa	x,a
1651  0478 1a01          	or	a,(OFST-1,sp)
1652  047a 01            	rrwa	x,a
1653  047b 9f            	ld	a,xl
1654  047c 97            	ld	xl,a
1655  047d a682          	ld	a,#130
1656  047f 95            	ld	xh,a
1657  0480 cd0086        	call	L5_DS1302Write
1659                     ; 351 	DS1302Write(DS1302_HOUR_WRITE,(pTime->u8Hour/10)<<4|(pTime->u8Hour%10)); //24小时模式
1661  0483 1e03          	ldw	x,(OFST+1,sp)
1662  0485 e603          	ld	a,(3,x)
1663  0487 5f            	clrw	x
1664  0488 97            	ld	xl,a
1665  0489 a60a          	ld	a,#10
1666  048b cd0000        	call	c_smodx
1668  048e 1f01          	ldw	(OFST-1,sp),x
1669  0490 1e03          	ldw	x,(OFST+1,sp)
1670  0492 e603          	ld	a,(3,x)
1671  0494 5f            	clrw	x
1672  0495 97            	ld	xl,a
1673  0496 a60a          	ld	a,#10
1674  0498 cd0000        	call	c_sdivx
1676  049b 58            	sllw	x
1677  049c 58            	sllw	x
1678  049d 58            	sllw	x
1679  049e 58            	sllw	x
1680  049f 01            	rrwa	x,a
1681  04a0 1a02          	or	a,(OFST+0,sp)
1682  04a2 01            	rrwa	x,a
1683  04a3 1a01          	or	a,(OFST-1,sp)
1684  04a5 01            	rrwa	x,a
1685  04a6 9f            	ld	a,xl
1686  04a7 97            	ld	xl,a
1687  04a8 a684          	ld	a,#132
1688  04aa 95            	ld	xh,a
1689  04ab cd0086        	call	L5_DS1302Write
1691                     ; 352 	DS1302Write(DS1302_DAY_WRITE,(pTime->u8Day/10)<<4|(pTime->u8Day%10)); 
1693  04ae 1e03          	ldw	x,(OFST+1,sp)
1694  04b0 e602          	ld	a,(2,x)
1695  04b2 5f            	clrw	x
1696  04b3 97            	ld	xl,a
1697  04b4 a60a          	ld	a,#10
1698  04b6 cd0000        	call	c_smodx
1700  04b9 1f01          	ldw	(OFST-1,sp),x
1701  04bb 1e03          	ldw	x,(OFST+1,sp)
1702  04bd e602          	ld	a,(2,x)
1703  04bf 5f            	clrw	x
1704  04c0 97            	ld	xl,a
1705  04c1 a60a          	ld	a,#10
1706  04c3 cd0000        	call	c_sdivx
1708  04c6 58            	sllw	x
1709  04c7 58            	sllw	x
1710  04c8 58            	sllw	x
1711  04c9 58            	sllw	x
1712  04ca 01            	rrwa	x,a
1713  04cb 1a02          	or	a,(OFST+0,sp)
1714  04cd 01            	rrwa	x,a
1715  04ce 1a01          	or	a,(OFST-1,sp)
1716  04d0 01            	rrwa	x,a
1717  04d1 9f            	ld	a,xl
1718  04d2 97            	ld	xl,a
1719  04d3 a686          	ld	a,#134
1720  04d5 95            	ld	xh,a
1721  04d6 cd0086        	call	L5_DS1302Write
1723                     ; 353 	DS1302Write(DS1302_MONTH_WRITE,(pTime->u8Month/10)<<4|(pTime->u8Month%10));
1725  04d9 1e03          	ldw	x,(OFST+1,sp)
1726  04db e601          	ld	a,(1,x)
1727  04dd 5f            	clrw	x
1728  04de 97            	ld	xl,a
1729  04df a60a          	ld	a,#10
1730  04e1 cd0000        	call	c_smodx
1732  04e4 1f01          	ldw	(OFST-1,sp),x
1733  04e6 1e03          	ldw	x,(OFST+1,sp)
1734  04e8 e601          	ld	a,(1,x)
1735  04ea 5f            	clrw	x
1736  04eb 97            	ld	xl,a
1737  04ec a60a          	ld	a,#10
1738  04ee cd0000        	call	c_sdivx
1740  04f1 58            	sllw	x
1741  04f2 58            	sllw	x
1742  04f3 58            	sllw	x
1743  04f4 58            	sllw	x
1744  04f5 01            	rrwa	x,a
1745  04f6 1a02          	or	a,(OFST+0,sp)
1746  04f8 01            	rrwa	x,a
1747  04f9 1a01          	or	a,(OFST-1,sp)
1748  04fb 01            	rrwa	x,a
1749  04fc 9f            	ld	a,xl
1750  04fd 97            	ld	xl,a
1751  04fe a688          	ld	a,#136
1752  0500 95            	ld	xh,a
1753  0501 cd0086        	call	L5_DS1302Write
1755                     ; 354 	DS1302Write(DS1302_YEAR_WRITE,(pTime->u8Year/10)<<4|(pTime->u8Year%10));
1757  0504 1e03          	ldw	x,(OFST+1,sp)
1758  0506 f6            	ld	a,(x)
1759  0507 5f            	clrw	x
1760  0508 97            	ld	xl,a
1761  0509 a60a          	ld	a,#10
1762  050b cd0000        	call	c_smodx
1764  050e 1f01          	ldw	(OFST-1,sp),x
1765  0510 1e03          	ldw	x,(OFST+1,sp)
1766  0512 f6            	ld	a,(x)
1767  0513 5f            	clrw	x
1768  0514 97            	ld	xl,a
1769  0515 a60a          	ld	a,#10
1770  0517 cd0000        	call	c_sdivx
1772  051a 58            	sllw	x
1773  051b 58            	sllw	x
1774  051c 58            	sllw	x
1775  051d 58            	sllw	x
1776  051e 01            	rrwa	x,a
1777  051f 1a02          	or	a,(OFST+0,sp)
1778  0521 01            	rrwa	x,a
1779  0522 1a01          	or	a,(OFST-1,sp)
1780  0524 01            	rrwa	x,a
1781  0525 9f            	ld	a,xl
1782  0526 97            	ld	xl,a
1783  0527 a68c          	ld	a,#140
1784  0529 95            	ld	xh,a
1785  052a cd0086        	call	L5_DS1302Write
1787                     ; 357 	DS1302Write(DS1302_WP_WRITE,0x80); //恢复写保护
1789  052d ae0080        	ldw	x,#128
1790  0530 a68e          	ld	a,#142
1791  0532 95            	ld	xh,a
1792  0533 cd0086        	call	L5_DS1302Write
1794                     ; 358 }
1797  0536 5b04          	addw	sp,#4
1798  0538 81            	ret
1811                     	xdef	_MonthDays
1812                     	xref	_Delay
1813                     	xdef	_RTC_SetDefaultTime
1814                     	xdef	_RTC_WriteDate
1815                     	xdef	_RTC_ReadDate
1816                     	xdef	_RTC_Init
1817                     	xref	_GPIO_ReadInputPin
1818                     	xref	_GPIO_WriteLow
1819                     	xref	_GPIO_WriteHigh
1820                     	xref	_GPIO_Init
1821                     	xref.b	c_x
1840                     	xref	c_idiv
1841                     	xref	c_smodx
1842                     	xref	c_smody
1843                     	xref	c_sdivx
1844                     	end

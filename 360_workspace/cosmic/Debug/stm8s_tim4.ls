   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 43 void TIM4_DeInit(void)
  43                     ; 44 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  52  0000 725f5340      	clr	21312
  53                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  55  0004 725f5341      	clr	21313
  56                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  58  0008 725f5344      	clr	21316
  59                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  61  000c 725f5345      	clr	21317
  62                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  64  0010 35ff5346      	mov	21318,#255
  65                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  67  0014 725f5342      	clr	21314
  68                     ; 51 }
  71  0018 81            	ret
 176                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 176                     ; 60 {
 177                     	switch	.text
 178  0019               _TIM4_TimeBaseInit:
 180  0019 89            	pushw	x
 181       00000000      OFST:	set	0
 184                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 186  001a 9e            	ld	a,xh
 187  001b 4d            	tnz	a
 188  001c 2723          	jreq	L21
 189  001e 9e            	ld	a,xh
 190  001f a101          	cp	a,#1
 191  0021 271e          	jreq	L21
 192  0023 9e            	ld	a,xh
 193  0024 a102          	cp	a,#2
 194  0026 2719          	jreq	L21
 195  0028 9e            	ld	a,xh
 196  0029 a103          	cp	a,#3
 197  002b 2714          	jreq	L21
 198  002d 9e            	ld	a,xh
 199  002e a104          	cp	a,#4
 200  0030 270f          	jreq	L21
 201  0032 9e            	ld	a,xh
 202  0033 a105          	cp	a,#5
 203  0035 270a          	jreq	L21
 204  0037 9e            	ld	a,xh
 205  0038 a106          	cp	a,#6
 206  003a 2705          	jreq	L21
 207  003c 9e            	ld	a,xh
 208  003d a107          	cp	a,#7
 209  003f 2603          	jrne	L01
 210  0041               L21:
 211  0041 4f            	clr	a
 212  0042 2010          	jra	L41
 213  0044               L01:
 214  0044 ae003e        	ldw	x,#62
 215  0047 89            	pushw	x
 216  0048 ae0000        	ldw	x,#0
 217  004b 89            	pushw	x
 218  004c ae0000        	ldw	x,#L56
 219  004f cd0000        	call	_assert_failed
 221  0052 5b04          	addw	sp,#4
 222  0054               L41:
 223                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 225  0054 7b01          	ld	a,(OFST+1,sp)
 226  0056 c75345        	ld	21317,a
 227                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 229  0059 7b02          	ld	a,(OFST+2,sp)
 230  005b c75346        	ld	21318,a
 231                     ; 67 }
 234  005e 85            	popw	x
 235  005f 81            	ret
 291                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 291                     ; 78 {
 292                     	switch	.text
 293  0060               _TIM4_Cmd:
 295  0060 88            	push	a
 296       00000000      OFST:	set	0
 299                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 301  0061 4d            	tnz	a
 302  0062 2704          	jreq	L22
 303  0064 a101          	cp	a,#1
 304  0066 2603          	jrne	L02
 305  0068               L22:
 306  0068 4f            	clr	a
 307  0069 2010          	jra	L42
 308  006b               L02:
 309  006b ae0050        	ldw	x,#80
 310  006e 89            	pushw	x
 311  006f ae0000        	ldw	x,#0
 312  0072 89            	pushw	x
 313  0073 ae0000        	ldw	x,#L56
 314  0076 cd0000        	call	_assert_failed
 316  0079 5b04          	addw	sp,#4
 317  007b               L42:
 318                     ; 83     if (NewState != DISABLE)
 320  007b 0d01          	tnz	(OFST+1,sp)
 321  007d 2706          	jreq	L511
 322                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 324  007f 72105340      	bset	21312,#0
 326  0083 2004          	jra	L711
 327  0085               L511:
 328                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 330  0085 72115340      	bres	21312,#0
 331  0089               L711:
 332                     ; 91 }
 335  0089 84            	pop	a
 336  008a 81            	ret
 395                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 395                     ; 104 {
 396                     	switch	.text
 397  008b               _TIM4_ITConfig:
 399  008b 89            	pushw	x
 400       00000000      OFST:	set	0
 403                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 405  008c 9e            	ld	a,xh
 406  008d a101          	cp	a,#1
 407  008f 2603          	jrne	L03
 408  0091 4f            	clr	a
 409  0092 2010          	jra	L23
 410  0094               L03:
 411  0094 ae006a        	ldw	x,#106
 412  0097 89            	pushw	x
 413  0098 ae0000        	ldw	x,#0
 414  009b 89            	pushw	x
 415  009c ae0000        	ldw	x,#L56
 416  009f cd0000        	call	_assert_failed
 418  00a2 5b04          	addw	sp,#4
 419  00a4               L23:
 420                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 422  00a4 0d02          	tnz	(OFST+2,sp)
 423  00a6 2706          	jreq	L63
 424  00a8 7b02          	ld	a,(OFST+2,sp)
 425  00aa a101          	cp	a,#1
 426  00ac 2603          	jrne	L43
 427  00ae               L63:
 428  00ae 4f            	clr	a
 429  00af 2010          	jra	L04
 430  00b1               L43:
 431  00b1 ae006b        	ldw	x,#107
 432  00b4 89            	pushw	x
 433  00b5 ae0000        	ldw	x,#0
 434  00b8 89            	pushw	x
 435  00b9 ae0000        	ldw	x,#L56
 436  00bc cd0000        	call	_assert_failed
 438  00bf 5b04          	addw	sp,#4
 439  00c1               L04:
 440                     ; 109     if (NewState != DISABLE)
 442  00c1 0d02          	tnz	(OFST+2,sp)
 443  00c3 270a          	jreq	L151
 444                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 446  00c5 c65341        	ld	a,21313
 447  00c8 1a01          	or	a,(OFST+1,sp)
 448  00ca c75341        	ld	21313,a
 450  00cd 2009          	jra	L351
 451  00cf               L151:
 452                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 454  00cf 7b01          	ld	a,(OFST+1,sp)
 455  00d1 43            	cpl	a
 456  00d2 c45341        	and	a,21313
 457  00d5 c75341        	ld	21313,a
 458  00d8               L351:
 459                     ; 119 }
 462  00d8 85            	popw	x
 463  00d9 81            	ret
 500                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 500                     ; 128 {
 501                     	switch	.text
 502  00da               _TIM4_UpdateDisableConfig:
 504  00da 88            	push	a
 505       00000000      OFST:	set	0
 508                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 510  00db 4d            	tnz	a
 511  00dc 2704          	jreq	L64
 512  00de a101          	cp	a,#1
 513  00e0 2603          	jrne	L44
 514  00e2               L64:
 515  00e2 4f            	clr	a
 516  00e3 2010          	jra	L05
 517  00e5               L44:
 518  00e5 ae0082        	ldw	x,#130
 519  00e8 89            	pushw	x
 520  00e9 ae0000        	ldw	x,#0
 521  00ec 89            	pushw	x
 522  00ed ae0000        	ldw	x,#L56
 523  00f0 cd0000        	call	_assert_failed
 525  00f3 5b04          	addw	sp,#4
 526  00f5               L05:
 527                     ; 133     if (NewState != DISABLE)
 529  00f5 0d01          	tnz	(OFST+1,sp)
 530  00f7 2706          	jreq	L371
 531                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 533  00f9 72125340      	bset	21312,#1
 535  00fd 2004          	jra	L571
 536  00ff               L371:
 537                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 539  00ff 72135340      	bres	21312,#1
 540  0103               L571:
 541                     ; 141 }
 544  0103 84            	pop	a
 545  0104 81            	ret
 604                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 604                     ; 152 {
 605                     	switch	.text
 606  0105               _TIM4_UpdateRequestConfig:
 608  0105 88            	push	a
 609       00000000      OFST:	set	0
 612                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 614  0106 4d            	tnz	a
 615  0107 2704          	jreq	L65
 616  0109 a101          	cp	a,#1
 617  010b 2603          	jrne	L45
 618  010d               L65:
 619  010d 4f            	clr	a
 620  010e 2010          	jra	L06
 621  0110               L45:
 622  0110 ae009a        	ldw	x,#154
 623  0113 89            	pushw	x
 624  0114 ae0000        	ldw	x,#0
 625  0117 89            	pushw	x
 626  0118 ae0000        	ldw	x,#L56
 627  011b cd0000        	call	_assert_failed
 629  011e 5b04          	addw	sp,#4
 630  0120               L06:
 631                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 633  0120 0d01          	tnz	(OFST+1,sp)
 634  0122 2706          	jreq	L522
 635                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 637  0124 72145340      	bset	21312,#2
 639  0128 2004          	jra	L722
 640  012a               L522:
 641                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 643  012a 72155340      	bres	21312,#2
 644  012e               L722:
 645                     ; 165 }
 648  012e 84            	pop	a
 649  012f 81            	ret
 707                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 707                     ; 176 {
 708                     	switch	.text
 709  0130               _TIM4_SelectOnePulseMode:
 711  0130 88            	push	a
 712       00000000      OFST:	set	0
 715                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 717  0131 a101          	cp	a,#1
 718  0133 2703          	jreq	L66
 719  0135 4d            	tnz	a
 720  0136 2603          	jrne	L46
 721  0138               L66:
 722  0138 4f            	clr	a
 723  0139 2010          	jra	L07
 724  013b               L46:
 725  013b ae00b2        	ldw	x,#178
 726  013e 89            	pushw	x
 727  013f ae0000        	ldw	x,#0
 728  0142 89            	pushw	x
 729  0143 ae0000        	ldw	x,#L56
 730  0146 cd0000        	call	_assert_failed
 732  0149 5b04          	addw	sp,#4
 733  014b               L07:
 734                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 736  014b 0d01          	tnz	(OFST+1,sp)
 737  014d 2706          	jreq	L752
 738                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 740  014f 72165340      	bset	21312,#3
 742  0153 2004          	jra	L162
 743  0155               L752:
 744                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 746  0155 72175340      	bres	21312,#3
 747  0159               L162:
 748                     ; 190 }
 751  0159 84            	pop	a
 752  015a 81            	ret
 821                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 821                     ; 213 {
 822                     	switch	.text
 823  015b               _TIM4_PrescalerConfig:
 825  015b 89            	pushw	x
 826       00000000      OFST:	set	0
 829                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 831  015c 9f            	ld	a,xl
 832  015d 4d            	tnz	a
 833  015e 2705          	jreq	L67
 834  0160 9f            	ld	a,xl
 835  0161 a101          	cp	a,#1
 836  0163 2603          	jrne	L47
 837  0165               L67:
 838  0165 4f            	clr	a
 839  0166 2010          	jra	L001
 840  0168               L47:
 841  0168 ae00d7        	ldw	x,#215
 842  016b 89            	pushw	x
 843  016c ae0000        	ldw	x,#0
 844  016f 89            	pushw	x
 845  0170 ae0000        	ldw	x,#L56
 846  0173 cd0000        	call	_assert_failed
 848  0176 5b04          	addw	sp,#4
 849  0178               L001:
 850                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 852  0178 0d01          	tnz	(OFST+1,sp)
 853  017a 272a          	jreq	L401
 854  017c 7b01          	ld	a,(OFST+1,sp)
 855  017e a101          	cp	a,#1
 856  0180 2724          	jreq	L401
 857  0182 7b01          	ld	a,(OFST+1,sp)
 858  0184 a102          	cp	a,#2
 859  0186 271e          	jreq	L401
 860  0188 7b01          	ld	a,(OFST+1,sp)
 861  018a a103          	cp	a,#3
 862  018c 2718          	jreq	L401
 863  018e 7b01          	ld	a,(OFST+1,sp)
 864  0190 a104          	cp	a,#4
 865  0192 2712          	jreq	L401
 866  0194 7b01          	ld	a,(OFST+1,sp)
 867  0196 a105          	cp	a,#5
 868  0198 270c          	jreq	L401
 869  019a 7b01          	ld	a,(OFST+1,sp)
 870  019c a106          	cp	a,#6
 871  019e 2706          	jreq	L401
 872  01a0 7b01          	ld	a,(OFST+1,sp)
 873  01a2 a107          	cp	a,#7
 874  01a4 2603          	jrne	L201
 875  01a6               L401:
 876  01a6 4f            	clr	a
 877  01a7 2010          	jra	L601
 878  01a9               L201:
 879  01a9 ae00d8        	ldw	x,#216
 880  01ac 89            	pushw	x
 881  01ad ae0000        	ldw	x,#0
 882  01b0 89            	pushw	x
 883  01b1 ae0000        	ldw	x,#L56
 884  01b4 cd0000        	call	_assert_failed
 886  01b7 5b04          	addw	sp,#4
 887  01b9               L601:
 888                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 890  01b9 7b01          	ld	a,(OFST+1,sp)
 891  01bb c75345        	ld	21317,a
 892                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 894  01be 7b02          	ld	a,(OFST+2,sp)
 895  01c0 c75343        	ld	21315,a
 896                     ; 223 }
 899  01c3 85            	popw	x
 900  01c4 81            	ret
 937                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 937                     ; 232 {
 938                     	switch	.text
 939  01c5               _TIM4_ARRPreloadConfig:
 941  01c5 88            	push	a
 942       00000000      OFST:	set	0
 945                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 947  01c6 4d            	tnz	a
 948  01c7 2704          	jreq	L411
 949  01c9 a101          	cp	a,#1
 950  01cb 2603          	jrne	L211
 951  01cd               L411:
 952  01cd 4f            	clr	a
 953  01ce 2010          	jra	L611
 954  01d0               L211:
 955  01d0 ae00ea        	ldw	x,#234
 956  01d3 89            	pushw	x
 957  01d4 ae0000        	ldw	x,#0
 958  01d7 89            	pushw	x
 959  01d8 ae0000        	ldw	x,#L56
 960  01db cd0000        	call	_assert_failed
 962  01de 5b04          	addw	sp,#4
 963  01e0               L611:
 964                     ; 237     if (NewState != DISABLE)
 966  01e0 0d01          	tnz	(OFST+1,sp)
 967  01e2 2706          	jreq	L333
 968                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 970  01e4 721e5340      	bset	21312,#7
 972  01e8 2004          	jra	L533
 973  01ea               L333:
 974                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 976  01ea 721f5340      	bres	21312,#7
 977  01ee               L533:
 978                     ; 245 }
 981  01ee 84            	pop	a
 982  01ef 81            	ret
1032                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1032                     ; 255 {
1033                     	switch	.text
1034  01f0               _TIM4_GenerateEvent:
1036  01f0 88            	push	a
1037       00000000      OFST:	set	0
1040                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
1042  01f1 a101          	cp	a,#1
1043  01f3 2603          	jrne	L221
1044  01f5 4f            	clr	a
1045  01f6 2010          	jra	L421
1046  01f8               L221:
1047  01f8 ae0101        	ldw	x,#257
1048  01fb 89            	pushw	x
1049  01fc ae0000        	ldw	x,#0
1050  01ff 89            	pushw	x
1051  0200 ae0000        	ldw	x,#L56
1052  0203 cd0000        	call	_assert_failed
1054  0206 5b04          	addw	sp,#4
1055  0208               L421:
1056                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
1058  0208 7b01          	ld	a,(OFST+1,sp)
1059  020a c75343        	ld	21315,a
1060                     ; 261 }
1063  020d 84            	pop	a
1064  020e 81            	ret
1096                     ; 270 void TIM4_SetCounter(uint8_t Counter)
1096                     ; 271 {
1097                     	switch	.text
1098  020f               _TIM4_SetCounter:
1102                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
1104  020f c75344        	ld	21316,a
1105                     ; 274 }
1108  0212 81            	ret
1140                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
1140                     ; 284 {
1141                     	switch	.text
1142  0213               _TIM4_SetAutoreload:
1146                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
1148  0213 c75346        	ld	21318,a
1149                     ; 287 }
1152  0216 81            	ret
1175                     ; 294 uint8_t TIM4_GetCounter(void)
1175                     ; 295 {
1176                     	switch	.text
1177  0217               _TIM4_GetCounter:
1181                     ; 297     return (uint8_t)(TIM4->CNTR);
1183  0217 c65344        	ld	a,21316
1186  021a 81            	ret
1210                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1210                     ; 306 {
1211                     	switch	.text
1212  021b               _TIM4_GetPrescaler:
1216                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
1218  021b c65345        	ld	a,21317
1221  021e 81            	ret
1301                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1301                     ; 319 {
1302                     	switch	.text
1303  021f               _TIM4_GetFlagStatus:
1305  021f 88            	push	a
1306  0220 88            	push	a
1307       00000001      OFST:	set	1
1310                     ; 320     FlagStatus bitstatus = RESET;
1312                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1314  0221 a101          	cp	a,#1
1315  0223 2603          	jrne	L041
1316  0225 4f            	clr	a
1317  0226 2010          	jra	L241
1318  0228               L041:
1319  0228 ae0143        	ldw	x,#323
1320  022b 89            	pushw	x
1321  022c ae0000        	ldw	x,#0
1322  022f 89            	pushw	x
1323  0230 ae0000        	ldw	x,#L56
1324  0233 cd0000        	call	_assert_failed
1326  0236 5b04          	addw	sp,#4
1327  0238               L241:
1328                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1330  0238 c65342        	ld	a,21314
1331  023b 1502          	bcp	a,(OFST+1,sp)
1332  023d 2706          	jreq	L374
1333                     ; 327     bitstatus = SET;
1335  023f a601          	ld	a,#1
1336  0241 6b01          	ld	(OFST+0,sp),a
1338  0243 2002          	jra	L574
1339  0245               L374:
1340                     ; 331     bitstatus = RESET;
1342  0245 0f01          	clr	(OFST+0,sp)
1343  0247               L574:
1344                     ; 333   return ((FlagStatus)bitstatus);
1346  0247 7b01          	ld	a,(OFST+0,sp)
1349  0249 85            	popw	x
1350  024a 81            	ret
1386                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1386                     ; 344 {
1387                     	switch	.text
1388  024b               _TIM4_ClearFlag:
1390  024b 88            	push	a
1391       00000000      OFST:	set	0
1394                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1396  024c a101          	cp	a,#1
1397  024e 2603          	jrne	L641
1398  0250 4f            	clr	a
1399  0251 2010          	jra	L051
1400  0253               L641:
1401  0253 ae015a        	ldw	x,#346
1402  0256 89            	pushw	x
1403  0257 ae0000        	ldw	x,#0
1404  025a 89            	pushw	x
1405  025b ae0000        	ldw	x,#L56
1406  025e cd0000        	call	_assert_failed
1408  0261 5b04          	addw	sp,#4
1409  0263               L051:
1410                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1412  0263 7b01          	ld	a,(OFST+1,sp)
1413  0265 43            	cpl	a
1414  0266 c75342        	ld	21314,a
1415                     ; 351 }
1418  0269 84            	pop	a
1419  026a 81            	ret
1480                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1480                     ; 361 {
1481                     	switch	.text
1482  026b               _TIM4_GetITStatus:
1484  026b 88            	push	a
1485  026c 89            	pushw	x
1486       00000002      OFST:	set	2
1489                     ; 362     ITStatus bitstatus = RESET;
1491                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1495                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1497  026d a101          	cp	a,#1
1498  026f 2603          	jrne	L451
1499  0271 4f            	clr	a
1500  0272 2010          	jra	L651
1501  0274               L451:
1502  0274 ae016f        	ldw	x,#367
1503  0277 89            	pushw	x
1504  0278 ae0000        	ldw	x,#0
1505  027b 89            	pushw	x
1506  027c ae0000        	ldw	x,#L56
1507  027f cd0000        	call	_assert_failed
1509  0282 5b04          	addw	sp,#4
1510  0284               L651:
1511                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1513  0284 c65342        	ld	a,21314
1514  0287 1403          	and	a,(OFST+1,sp)
1515  0289 6b01          	ld	(OFST-1,sp),a
1516                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1518  028b c65341        	ld	a,21313
1519  028e 1403          	and	a,(OFST+1,sp)
1520  0290 6b02          	ld	(OFST+0,sp),a
1521                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1523  0292 0d01          	tnz	(OFST-1,sp)
1524  0294 270a          	jreq	L345
1526  0296 0d02          	tnz	(OFST+0,sp)
1527  0298 2706          	jreq	L345
1528                     ; 375     bitstatus = (ITStatus)SET;
1530  029a a601          	ld	a,#1
1531  029c 6b02          	ld	(OFST+0,sp),a
1533  029e 2002          	jra	L545
1534  02a0               L345:
1535                     ; 379     bitstatus = (ITStatus)RESET;
1537  02a0 0f02          	clr	(OFST+0,sp)
1538  02a2               L545:
1539                     ; 381   return ((ITStatus)bitstatus);
1541  02a2 7b02          	ld	a,(OFST+0,sp)
1544  02a4 5b03          	addw	sp,#3
1545  02a6 81            	ret
1582                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1582                     ; 392 {
1583                     	switch	.text
1584  02a7               _TIM4_ClearITPendingBit:
1586  02a7 88            	push	a
1587       00000000      OFST:	set	0
1590                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1592  02a8 a101          	cp	a,#1
1593  02aa 2603          	jrne	L261
1594  02ac 4f            	clr	a
1595  02ad 2010          	jra	L461
1596  02af               L261:
1597  02af ae018a        	ldw	x,#394
1598  02b2 89            	pushw	x
1599  02b3 ae0000        	ldw	x,#0
1600  02b6 89            	pushw	x
1601  02b7 ae0000        	ldw	x,#L56
1602  02ba cd0000        	call	_assert_failed
1604  02bd 5b04          	addw	sp,#4
1605  02bf               L461:
1606                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1608  02bf 7b01          	ld	a,(OFST+1,sp)
1609  02c1 43            	cpl	a
1610  02c2 c75342        	ld	21314,a
1611                     ; 398 }
1614  02c5 84            	pop	a
1615  02c6 81            	ret
1628                     	xdef	_TIM4_ClearITPendingBit
1629                     	xdef	_TIM4_GetITStatus
1630                     	xdef	_TIM4_ClearFlag
1631                     	xdef	_TIM4_GetFlagStatus
1632                     	xdef	_TIM4_GetPrescaler
1633                     	xdef	_TIM4_GetCounter
1634                     	xdef	_TIM4_SetAutoreload
1635                     	xdef	_TIM4_SetCounter
1636                     	xdef	_TIM4_GenerateEvent
1637                     	xdef	_TIM4_ARRPreloadConfig
1638                     	xdef	_TIM4_PrescalerConfig
1639                     	xdef	_TIM4_SelectOnePulseMode
1640                     	xdef	_TIM4_UpdateRequestConfig
1641                     	xdef	_TIM4_UpdateDisableConfig
1642                     	xdef	_TIM4_ITConfig
1643                     	xdef	_TIM4_Cmd
1644                     	xdef	_TIM4_TimeBaseInit
1645                     	xdef	_TIM4_DeInit
1646                     	xref	_assert_failed
1647                     .const:	section	.text
1648  0000               L56:
1649  0000 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_t"
1650  0012 696d342e6300  	dc.b	"im4.c",0
1670                     	end

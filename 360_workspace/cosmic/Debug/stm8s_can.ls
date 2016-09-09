   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     	switch	.data
  16  0000               __Id:
  17  0000 00000000      	dc.l	0
  18  0004               __IDE:
  19  0004 00            	dc.b	0
  20  0005               __RTR:
  21  0005 00            	dc.b	0
  22  0006               __DLC:
  23  0006 00            	dc.b	0
  24  0007               __Data:
  25  0007 00            	dc.b	0
  26  0008 000000000000  	ds.b	7
  27  000f               __FMI:
  28  000f 00            	dc.b	0
  58                     ; 56 void CAN_DeInit(void)
  58                     ; 57 {
  60                     	switch	.text
  61  0000               _CAN_DeInit:
  65                     ; 59     CAN->MCR = CAN_MCR_INRQ;
  67  0000 35015420      	mov	21536,#1
  68                     ; 60     CAN->PSR = CAN_Page_Config;
  70  0004 35065427      	mov	21543,#6
  71                     ; 61     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  73  0008 4f            	clr	a
  74  0009 cd0b74        	call	_CAN_OperatingModeRequest
  76                     ; 62     CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  78  000c 725f5428      	clr	21544
  79                     ; 63     CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  81  0010 725f5429      	clr	21545
  82                     ; 64     CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  84  0014 3540542c      	mov	21548,#64
  85                     ; 65     CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  87  0018 3523542d      	mov	21549,#35
  88                     ; 66     CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  90  001c 725f5430      	clr	21552
  91                     ; 67     CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  93  0020 725f5431      	clr	21553
  94                     ; 68     CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  96  0024 725f5432      	clr	21554
  97                     ; 69     CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
  99  0028 725f5433      	clr	21555
 100                     ; 70     CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 102  002c 725f5434      	clr	21556
 103                     ; 71     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 105  0030 a601          	ld	a,#1
 106  0032 cd0b74        	call	_CAN_OperatingModeRequest
 108                     ; 72     CAN->PSR = CAN_Page_RxFifo;
 110  0035 35075427      	mov	21543,#7
 111                     ; 73     CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 113  0039 725f5429      	clr	21545
 114                     ; 74     CAN->PSR = CAN_Page_TxMailBox0;
 116  003d 725f5427      	clr	21543
 117                     ; 75     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 119  0041 725f5429      	clr	21545
 120                     ; 76     CAN->PSR = CAN_Page_TxMailBox1;
 122  0045 35015427      	mov	21543,#1
 123                     ; 77     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 125  0049 725f5429      	clr	21545
 126                     ; 78     CAN->PSR = CAN_Page_TxMailBox2;
 128  004d 35055427      	mov	21543,#5
 129                     ; 79     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 131  0051 725f5429      	clr	21545
 132                     ; 81     CAN->MCR = CAN_MCR_RESET_VALUE;
 134  0055 35025420      	mov	21536,#2
 135                     ; 82     CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 137  0059 35fd5421      	mov	21537,#253
 138                     ; 83     CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 140  005d 35ff5422      	mov	21538,#255
 141                     ; 84     CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 143  0061 35ff5424      	mov	21540,#255
 144                     ; 85     CAN->IER = CAN_IER_RESET_VALUE;
 146  0065 725f5425      	clr	21541
 147                     ; 86     CAN->DGR = CAN_DGR_RESET_VALUE;
 149  0069 350c5426      	mov	21542,#12
 150                     ; 87     CAN->PSR = CAN_PSR_RESET_VALUE;
 152  006d 725f5427      	clr	21543
 153                     ; 88 }
 156  0071 81            	ret
 703                     ; 100 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 703                     ; 101                                 CAN_Mode_TypeDef CAN_Mode,
 703                     ; 102                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 703                     ; 103                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 703                     ; 104                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 703                     ; 105                                 uint8_t CAN_Prescaler)
 703                     ; 106 {
 704                     	switch	.text
 705  0072               _CAN_Init:
 707  0072 89            	pushw	x
 708  0073 5204          	subw	sp,#4
 709       00000004      OFST:	set	4
 712                     ; 107     CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 714                     ; 108     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 716  0075 aeffff        	ldw	x,#65535
 717  0078 1f03          	ldw	(OFST-1,sp),x
 718                     ; 109     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 720  007a cd1049        	call	_CAN_GetSelectedPage
 722  007d 6b01          	ld	(OFST-3,sp),a
 723                     ; 113     assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 725  007f 0d05          	tnz	(OFST+1,sp)
 726  0081 270c          	jreq	L21
 727  0083 7b05          	ld	a,(OFST+1,sp)
 728  0085 a1fd          	cp	a,#253
 729  0087 2409          	jruge	L01
 730  0089 7b05          	ld	a,(OFST+1,sp)
 731  008b a104          	cp	a,#4
 732  008d 2503          	jrult	L01
 733  008f               L21:
 734  008f 4f            	clr	a
 735  0090 2010          	jra	L41
 736  0092               L01:
 737  0092 ae0071        	ldw	x,#113
 738  0095 89            	pushw	x
 739  0096 ae0000        	ldw	x,#0
 740  0099 89            	pushw	x
 741  009a ae0008        	ldw	x,#L572
 742  009d cd0000        	call	_assert_failed
 744  00a0 5b04          	addw	sp,#4
 745  00a2               L41:
 746                     ; 114     assert_param(IS_CAN_MODE_OK(CAN_Mode));
 748  00a2 0d06          	tnz	(OFST+2,sp)
 749  00a4 2712          	jreq	L02
 750  00a6 7b06          	ld	a,(OFST+2,sp)
 751  00a8 a101          	cp	a,#1
 752  00aa 270c          	jreq	L02
 753  00ac 7b06          	ld	a,(OFST+2,sp)
 754  00ae a102          	cp	a,#2
 755  00b0 2706          	jreq	L02
 756  00b2 7b06          	ld	a,(OFST+2,sp)
 757  00b4 a103          	cp	a,#3
 758  00b6 2603          	jrne	L61
 759  00b8               L02:
 760  00b8 4f            	clr	a
 761  00b9 2010          	jra	L22
 762  00bb               L61:
 763  00bb ae0072        	ldw	x,#114
 764  00be 89            	pushw	x
 765  00bf ae0000        	ldw	x,#0
 766  00c2 89            	pushw	x
 767  00c3 ae0008        	ldw	x,#L572
 768  00c6 cd0000        	call	_assert_failed
 770  00c9 5b04          	addw	sp,#4
 771  00cb               L22:
 772                     ; 115     assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 774  00cb 0d09          	tnz	(OFST+5,sp)
 775  00cd 2712          	jreq	L62
 776  00cf 7b09          	ld	a,(OFST+5,sp)
 777  00d1 a140          	cp	a,#64
 778  00d3 270c          	jreq	L62
 779  00d5 7b09          	ld	a,(OFST+5,sp)
 780  00d7 a180          	cp	a,#128
 781  00d9 2706          	jreq	L62
 782  00db 7b09          	ld	a,(OFST+5,sp)
 783  00dd a1c0          	cp	a,#192
 784  00df 2603          	jrne	L42
 785  00e1               L62:
 786  00e1 4f            	clr	a
 787  00e2 2010          	jra	L03
 788  00e4               L42:
 789  00e4 ae0073        	ldw	x,#115
 790  00e7 89            	pushw	x
 791  00e8 ae0000        	ldw	x,#0
 792  00eb 89            	pushw	x
 793  00ec ae0008        	ldw	x,#L572
 794  00ef cd0000        	call	_assert_failed
 796  00f2 5b04          	addw	sp,#4
 797  00f4               L03:
 798                     ; 116     assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 800  00f4 7b0a          	ld	a,(OFST+6,sp)
 801  00f6 a110          	cp	a,#16
 802  00f8 2403          	jruge	L23
 803  00fa 4f            	clr	a
 804  00fb 2010          	jra	L43
 805  00fd               L23:
 806  00fd ae0074        	ldw	x,#116
 807  0100 89            	pushw	x
 808  0101 ae0000        	ldw	x,#0
 809  0104 89            	pushw	x
 810  0105 ae0008        	ldw	x,#L572
 811  0108 cd0000        	call	_assert_failed
 813  010b 5b04          	addw	sp,#4
 814  010d               L43:
 815                     ; 117     assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 817  010d 7b0b          	ld	a,(OFST+7,sp)
 818  010f a110          	cp	a,#16
 819  0111 2506          	jrult	L24
 820  0113 7b0b          	ld	a,(OFST+7,sp)
 821  0115 a171          	cp	a,#113
 822  0117 2504          	jrult	L04
 823  0119               L24:
 824  0119 0d0b          	tnz	(OFST+7,sp)
 825  011b 2603          	jrne	L63
 826  011d               L04:
 827  011d 4f            	clr	a
 828  011e 2010          	jra	L44
 829  0120               L63:
 830  0120 ae0075        	ldw	x,#117
 831  0123 89            	pushw	x
 832  0124 ae0000        	ldw	x,#0
 833  0127 89            	pushw	x
 834  0128 ae0008        	ldw	x,#L572
 835  012b cd0000        	call	_assert_failed
 837  012e 5b04          	addw	sp,#4
 838  0130               L44:
 839                     ; 118     assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 841  0130 0d0c          	tnz	(OFST+8,sp)
 842  0132 2709          	jreq	L64
 843  0134 7b0c          	ld	a,(OFST+8,sp)
 844  0136 a141          	cp	a,#65
 845  0138 2403          	jruge	L64
 846  013a 4f            	clr	a
 847  013b 2010          	jra	L05
 848  013d               L64:
 849  013d ae0076        	ldw	x,#118
 850  0140 89            	pushw	x
 851  0141 ae0000        	ldw	x,#0
 852  0144 89            	pushw	x
 853  0145 ae0008        	ldw	x,#L572
 854  0148 cd0000        	call	_assert_failed
 856  014b 5b04          	addw	sp,#4
 857  014d               L05:
 858                     ; 121     CAN->MCR = CAN_MCR_INRQ;
 860  014d 35015420      	mov	21536,#1
 862  0151 2007          	jra	L303
 863  0153               L772:
 864                     ; 125         timeout--;
 866  0153 1e03          	ldw	x,(OFST-1,sp)
 867  0155 1d0001        	subw	x,#1
 868  0158 1f03          	ldw	(OFST-1,sp),x
 869  015a               L303:
 870                     ; 123     while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 872  015a c65421        	ld	a,21537
 873  015d a401          	and	a,#1
 874  015f a101          	cp	a,#1
 875  0161 2704          	jreq	L703
 877  0163 1e03          	ldw	x,(OFST-1,sp)
 878  0165 26ec          	jrne	L772
 879  0167               L703:
 880                     ; 129     if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 882  0167 c65421        	ld	a,21537
 883  016a a401          	and	a,#1
 884  016c a101          	cp	a,#1
 885  016e 270c          	jreq	L113
 886                     ; 132         InitStatus =  CAN_InitStatus_Failed;
 888  0170 0f02          	clr	(OFST-2,sp)
 890  0172               L313:
 891                     ; 166     CAN_SelectPage(can_page);
 893  0172 7b01          	ld	a,(OFST-3,sp)
 894  0174 cd104d        	call	_CAN_SelectPage
 896                     ; 169     return (CAN_InitStatus_TypeDef)InitStatus;
 898  0177 7b02          	ld	a,(OFST-2,sp)
 901  0179 5b06          	addw	sp,#6
 902  017b 81            	ret
 903  017c               L113:
 904                     ; 139         CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 906  017c c65420        	ld	a,21536
 907  017f 1a05          	or	a,(OFST+1,sp)
 908  0181 c75420        	ld	21536,a
 909                     ; 142         CAN->DGR |= (uint8_t)CAN_Mode ;
 911  0184 c65426        	ld	a,21542
 912  0187 1a06          	or	a,(OFST+2,sp)
 913  0189 c75426        	ld	21542,a
 914                     ; 143         CAN->PSR = CAN_Page_Config;
 916  018c 35065427      	mov	21543,#6
 917                     ; 144         CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 919  0190 7b0c          	ld	a,(OFST+8,sp)
 920  0192 4a            	dec	a
 921  0193 1a09          	or	a,(OFST+5,sp)
 922  0195 c7542c        	ld	21548,a
 923                     ; 145         CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 925  0198 7b0a          	ld	a,(OFST+6,sp)
 926  019a 1a0b          	or	a,(OFST+7,sp)
 927  019c c7542d        	ld	21549,a
 928                     ; 148         CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 930  019f 72115420      	bres	21536,#0
 931                     ; 150         timeout = 0xFFFF;
 933  01a3 aeffff        	ldw	x,#65535
 934  01a6 1f03          	ldw	(OFST-1,sp),x
 936  01a8 2007          	jra	L123
 937  01aa               L513:
 938                     ; 153             timeout--;
 940  01aa 1e03          	ldw	x,(OFST-1,sp)
 941  01ac 1d0001        	subw	x,#1
 942  01af 1f03          	ldw	(OFST-1,sp),x
 943  01b1               L123:
 944                     ; 151         while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 946  01b1 c65421        	ld	a,21537
 947  01b4 a401          	and	a,#1
 948  01b6 a101          	cp	a,#1
 949  01b8 2604          	jrne	L523
 951  01ba 1e03          	ldw	x,(OFST-1,sp)
 952  01bc 26ec          	jrne	L513
 953  01be               L523:
 954                     ; 156         if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 956  01be c65421        	ld	a,21537
 957  01c1 a401          	and	a,#1
 958  01c3 a101          	cp	a,#1
 959  01c5 2604          	jrne	L723
 960                     ; 158             InitStatus = CAN_InitStatus_Failed;
 962  01c7 0f02          	clr	(OFST-2,sp)
 964  01c9 20a7          	jra	L313
 965  01cb               L723:
 966                     ; 162             InitStatus = CAN_InitStatus_Success;
 968  01cb a601          	ld	a,#1
 969  01cd 6b02          	ld	(OFST-2,sp),a
 970  01cf 20a1          	jra	L313
1281                     ; 188 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1281                     ; 189                     FunctionalState CAN_FilterActivation,
1281                     ; 190                     CAN_FilterMode_TypeDef CAN_FilterMode,
1281                     ; 191                     CAN_FilterScale_TypeDef CAN_FilterScale,
1281                     ; 192                     uint8_t CAN_FilterID1,
1281                     ; 193                     uint8_t CAN_FilterID2,
1281                     ; 194                     uint8_t CAN_FilterID3,
1281                     ; 195                     uint8_t CAN_FilterID4,
1281                     ; 196                     uint8_t CAN_FilterIDMask1,
1281                     ; 197                     uint8_t CAN_FilterIDMask2,
1281                     ; 198                     uint8_t CAN_FilterIDMask3,
1281                     ; 199                     uint8_t CAN_FilterIDMask4)
1281                     ; 200 {
1282                     	switch	.text
1283  01d1               _CAN_FilterInit:
1285  01d1 89            	pushw	x
1286  01d2 5205          	subw	sp,#5
1287       00000005      OFST:	set	5
1290                     ; 201     uint8_t fact = 0;
1292                     ; 202     uint8_t fsc  = 0;
1294                     ; 203     uint8_t fmhl = 0;
1296                     ; 205     CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1298                     ; 206     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1300  01d4 cd1049        	call	_CAN_GetSelectedPage
1302  01d7 6b01          	ld	(OFST-4,sp),a
1303                     ; 209     assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1305  01d9 0d06          	tnz	(OFST+1,sp)
1306  01db 271e          	jreq	L65
1307  01dd 7b06          	ld	a,(OFST+1,sp)
1308  01df a101          	cp	a,#1
1309  01e1 2718          	jreq	L65
1310  01e3 7b06          	ld	a,(OFST+1,sp)
1311  01e5 a102          	cp	a,#2
1312  01e7 2712          	jreq	L65
1313  01e9 7b06          	ld	a,(OFST+1,sp)
1314  01eb a103          	cp	a,#3
1315  01ed 270c          	jreq	L65
1316  01ef 7b06          	ld	a,(OFST+1,sp)
1317  01f1 a104          	cp	a,#4
1318  01f3 2706          	jreq	L65
1319  01f5 7b06          	ld	a,(OFST+1,sp)
1320  01f7 a105          	cp	a,#5
1321  01f9 2603          	jrne	L45
1322  01fb               L65:
1323  01fb 4f            	clr	a
1324  01fc 2010          	jra	L06
1325  01fe               L45:
1326  01fe ae00d1        	ldw	x,#209
1327  0201 89            	pushw	x
1328  0202 ae0000        	ldw	x,#0
1329  0205 89            	pushw	x
1330  0206 ae0008        	ldw	x,#L572
1331  0209 cd0000        	call	_assert_failed
1333  020c 5b04          	addw	sp,#4
1334  020e               L06:
1335                     ; 210     assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1337  020e 0d07          	tnz	(OFST+2,sp)
1338  0210 2706          	jreq	L46
1339  0212 7b07          	ld	a,(OFST+2,sp)
1340  0214 a101          	cp	a,#1
1341  0216 2603          	jrne	L26
1342  0218               L46:
1343  0218 4f            	clr	a
1344  0219 2010          	jra	L66
1345  021b               L26:
1346  021b ae00d2        	ldw	x,#210
1347  021e 89            	pushw	x
1348  021f ae0000        	ldw	x,#0
1349  0222 89            	pushw	x
1350  0223 ae0008        	ldw	x,#L572
1351  0226 cd0000        	call	_assert_failed
1353  0229 5b04          	addw	sp,#4
1354  022b               L66:
1355                     ; 211     assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1357  022b 0d0a          	tnz	(OFST+5,sp)
1358  022d 2712          	jreq	L27
1359  022f 7b0a          	ld	a,(OFST+5,sp)
1360  0231 a110          	cp	a,#16
1361  0233 270c          	jreq	L27
1362  0235 7b0a          	ld	a,(OFST+5,sp)
1363  0237 a111          	cp	a,#17
1364  0239 2706          	jreq	L27
1365  023b 7b0a          	ld	a,(OFST+5,sp)
1366  023d a101          	cp	a,#1
1367  023f 2603          	jrne	L07
1368  0241               L27:
1369  0241 4f            	clr	a
1370  0242 2010          	jra	L47
1371  0244               L07:
1372  0244 ae00d3        	ldw	x,#211
1373  0247 89            	pushw	x
1374  0248 ae0000        	ldw	x,#0
1375  024b 89            	pushw	x
1376  024c ae0008        	ldw	x,#L572
1377  024f cd0000        	call	_assert_failed
1379  0252 5b04          	addw	sp,#4
1380  0254               L47:
1381                     ; 212     assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1383  0254 0d0b          	tnz	(OFST+6,sp)
1384  0256 2712          	jreq	L001
1385  0258 7b0b          	ld	a,(OFST+6,sp)
1386  025a a102          	cp	a,#2
1387  025c 270c          	jreq	L001
1388  025e 7b0b          	ld	a,(OFST+6,sp)
1389  0260 a104          	cp	a,#4
1390  0262 2706          	jreq	L001
1391  0264 7b0b          	ld	a,(OFST+6,sp)
1392  0266 a106          	cp	a,#6
1393  0268 2603          	jrne	L67
1394  026a               L001:
1395  026a 4f            	clr	a
1396  026b 2010          	jra	L201
1397  026d               L67:
1398  026d ae00d4        	ldw	x,#212
1399  0270 89            	pushw	x
1400  0271 ae0000        	ldw	x,#0
1401  0274 89            	pushw	x
1402  0275 ae0008        	ldw	x,#L572
1403  0278 cd0000        	call	_assert_failed
1405  027b 5b04          	addw	sp,#4
1406  027d               L201:
1407                     ; 215     if (CAN_FilterNumber == CAN_FilterNumber_0)
1409  027d 0d06          	tnz	(OFST+1,sp)
1410  027f 2610          	jrne	L305
1411                     ; 217         fact = 0x01;
1413  0281 a601          	ld	a,#1
1414  0283 6b03          	ld	(OFST-2,sp),a
1415                     ; 218         fsc  = 0x00;
1417  0285 0f04          	clr	(OFST-1,sp)
1418                     ; 219         fmhl = 0x03;
1420  0287 a603          	ld	a,#3
1421  0289 6b05          	ld	(OFST+0,sp),a
1422                     ; 221         can_page_filter = CAN_Page_Filter01;
1424  028b a602          	ld	a,#2
1425  028d 6b02          	ld	(OFST-3,sp),a
1427  028f 206c          	jra	L505
1428  0291               L305:
1429                     ; 223     else if (CAN_FilterNumber == CAN_FilterNumber_1)
1431  0291 7b06          	ld	a,(OFST+1,sp)
1432  0293 a101          	cp	a,#1
1433  0295 2612          	jrne	L705
1434                     ; 225         fact = 0x10;
1436  0297 a610          	ld	a,#16
1437  0299 6b03          	ld	(OFST-2,sp),a
1438                     ; 226         fsc  = 0x04;
1440  029b a604          	ld	a,#4
1441  029d 6b04          	ld	(OFST-1,sp),a
1442                     ; 227         fmhl = 0x0C;
1444  029f a60c          	ld	a,#12
1445  02a1 6b05          	ld	(OFST+0,sp),a
1446                     ; 229         can_page_filter = CAN_Page_Filter01;
1448  02a3 a602          	ld	a,#2
1449  02a5 6b02          	ld	(OFST-3,sp),a
1451  02a7 2054          	jra	L505
1452  02a9               L705:
1453                     ; 231     else if (CAN_FilterNumber == CAN_FilterNumber_2)
1455  02a9 7b06          	ld	a,(OFST+1,sp)
1456  02ab a102          	cp	a,#2
1457  02ad 2610          	jrne	L315
1458                     ; 233         fact = 0x01;
1460  02af a601          	ld	a,#1
1461  02b1 6b03          	ld	(OFST-2,sp),a
1462                     ; 234         fsc  = 0x00;
1464  02b3 0f04          	clr	(OFST-1,sp)
1465                     ; 235         fmhl = 0x30;
1467  02b5 a630          	ld	a,#48
1468  02b7 6b05          	ld	(OFST+0,sp),a
1469                     ; 237         can_page_filter = CAN_Page_Filter23;
1471  02b9 a603          	ld	a,#3
1472  02bb 6b02          	ld	(OFST-3,sp),a
1474  02bd 203e          	jra	L505
1475  02bf               L315:
1476                     ; 239     else if (CAN_FilterNumber == CAN_FilterNumber_3)
1478  02bf 7b06          	ld	a,(OFST+1,sp)
1479  02c1 a103          	cp	a,#3
1480  02c3 2612          	jrne	L715
1481                     ; 241         fact = 0x10;
1483  02c5 a610          	ld	a,#16
1484  02c7 6b03          	ld	(OFST-2,sp),a
1485                     ; 242         fsc  = 0x04;
1487  02c9 a604          	ld	a,#4
1488  02cb 6b04          	ld	(OFST-1,sp),a
1489                     ; 243         fmhl = 0xC0;
1491  02cd a6c0          	ld	a,#192
1492  02cf 6b05          	ld	(OFST+0,sp),a
1493                     ; 245         can_page_filter = CAN_Page_Filter23;
1495  02d1 a603          	ld	a,#3
1496  02d3 6b02          	ld	(OFST-3,sp),a
1498  02d5 2026          	jra	L505
1499  02d7               L715:
1500                     ; 247     else if (CAN_FilterNumber == CAN_FilterNumber_4)
1502  02d7 7b06          	ld	a,(OFST+1,sp)
1503  02d9 a104          	cp	a,#4
1504  02db 2610          	jrne	L325
1505                     ; 249         fact = 0x01;
1507  02dd a601          	ld	a,#1
1508  02df 6b03          	ld	(OFST-2,sp),a
1509                     ; 250         fsc  = 0x00;
1511  02e1 0f04          	clr	(OFST-1,sp)
1512                     ; 251         fmhl = 0x03;
1514  02e3 a603          	ld	a,#3
1515  02e5 6b05          	ld	(OFST+0,sp),a
1516                     ; 253         can_page_filter = CAN_Page_Filter45;
1518  02e7 a604          	ld	a,#4
1519  02e9 6b02          	ld	(OFST-3,sp),a
1521  02eb 2010          	jra	L505
1522  02ed               L325:
1523                     ; 257         fact = 0x10;
1525  02ed a610          	ld	a,#16
1526  02ef 6b03          	ld	(OFST-2,sp),a
1527                     ; 258         fsc  = 0x04;
1529  02f1 a604          	ld	a,#4
1530  02f3 6b04          	ld	(OFST-1,sp),a
1531                     ; 259         fmhl = 0x0C;
1533  02f5 a60c          	ld	a,#12
1534  02f7 6b05          	ld	(OFST+0,sp),a
1535                     ; 261         can_page_filter = CAN_Page_Filter45;
1537  02f9 a604          	ld	a,#4
1538  02fb 6b02          	ld	(OFST-3,sp),a
1539  02fd               L505:
1540                     ; 265     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1542  02fd 4f            	clr	a
1543  02fe cd0b74        	call	_CAN_OperatingModeRequest
1545                     ; 267     CAN->PSR = CAN_Page_Config;
1547  0301 35065427      	mov	21543,#6
1548                     ; 272     if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1550  0305 7b02          	ld	a,(OFST-3,sp)
1551  0307 a102          	cp	a,#2
1552  0309 262b          	jrne	L725
1553                     ; 275         CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1555  030b 7b04          	ld	a,(OFST-1,sp)
1556  030d 5f            	clrw	x
1557  030e 97            	ld	xl,a
1558  030f a606          	ld	a,#6
1559  0311 5d            	tnzw	x
1560  0312 2704          	jreq	L401
1561  0314               L601:
1562  0314 48            	sll	a
1563  0315 5a            	decw	x
1564  0316 26fc          	jrne	L601
1565  0318               L401:
1566  0318 1a03          	or	a,(OFST-2,sp)
1567  031a 43            	cpl	a
1568  031b c45432        	and	a,21554
1569  031e c75432        	ld	21554,a
1570                     ; 277         CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1572  0321 7b04          	ld	a,(OFST-1,sp)
1573  0323 5f            	clrw	x
1574  0324 97            	ld	xl,a
1575  0325 7b0b          	ld	a,(OFST+6,sp)
1576  0327 5d            	tnzw	x
1577  0328 2704          	jreq	L011
1578  032a               L211:
1579  032a 48            	sll	a
1580  032b 5a            	decw	x
1581  032c 26fc          	jrne	L211
1582  032e               L011:
1583  032e ca5432        	or	a,21554
1584  0331 c75432        	ld	21554,a
1586  0334 205a          	jra	L135
1587  0336               L725:
1588                     ; 279     else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1590  0336 7b02          	ld	a,(OFST-3,sp)
1591  0338 a103          	cp	a,#3
1592  033a 262b          	jrne	L335
1593                     ; 282         CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1595  033c 7b04          	ld	a,(OFST-1,sp)
1596  033e 5f            	clrw	x
1597  033f 97            	ld	xl,a
1598  0340 a606          	ld	a,#6
1599  0342 5d            	tnzw	x
1600  0343 2704          	jreq	L411
1601  0345               L611:
1602  0345 48            	sll	a
1603  0346 5a            	decw	x
1604  0347 26fc          	jrne	L611
1605  0349               L411:
1606  0349 1a03          	or	a,(OFST-2,sp)
1607  034b 43            	cpl	a
1608  034c c45433        	and	a,21555
1609  034f c75433        	ld	21555,a
1610                     ; 285         CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1612  0352 7b04          	ld	a,(OFST-1,sp)
1613  0354 5f            	clrw	x
1614  0355 97            	ld	xl,a
1615  0356 7b0b          	ld	a,(OFST+6,sp)
1616  0358 5d            	tnzw	x
1617  0359 2704          	jreq	L021
1618  035b               L221:
1619  035b 48            	sll	a
1620  035c 5a            	decw	x
1621  035d 26fc          	jrne	L221
1622  035f               L021:
1623  035f ca5433        	or	a,21555
1624  0362 c75433        	ld	21555,a
1626  0365 2029          	jra	L135
1627  0367               L335:
1628                     ; 291         CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1630  0367 7b04          	ld	a,(OFST-1,sp)
1631  0369 5f            	clrw	x
1632  036a 97            	ld	xl,a
1633  036b a606          	ld	a,#6
1634  036d 5d            	tnzw	x
1635  036e 2704          	jreq	L421
1636  0370               L621:
1637  0370 48            	sll	a
1638  0371 5a            	decw	x
1639  0372 26fc          	jrne	L621
1640  0374               L421:
1641  0374 1a03          	or	a,(OFST-2,sp)
1642  0376 43            	cpl	a
1643  0377 c45434        	and	a,21556
1644  037a c75434        	ld	21556,a
1645                     ; 294         CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1647  037d 7b04          	ld	a,(OFST-1,sp)
1648  037f 5f            	clrw	x
1649  0380 97            	ld	xl,a
1650  0381 7b0b          	ld	a,(OFST+6,sp)
1651  0383 5d            	tnzw	x
1652  0384 2704          	jreq	L031
1653  0386               L231:
1654  0386 48            	sll	a
1655  0387 5a            	decw	x
1656  0388 26fc          	jrne	L231
1657  038a               L031:
1658  038a ca5434        	or	a,21556
1659  038d c75434        	ld	21556,a
1660  0390               L135:
1661                     ; 300     if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1663  0390 7b02          	ld	a,(OFST-3,sp)
1664  0392 a104          	cp	a,#4
1665  0394 273d          	jreq	L735
1666                     ; 303         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1668  0396 0d0a          	tnz	(OFST+5,sp)
1669  0398 260b          	jrne	L145
1670                     ; 306             CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1672  039a 7b05          	ld	a,(OFST+0,sp)
1673  039c 43            	cpl	a
1674  039d c45430        	and	a,21552
1675  03a0 c75430        	ld	21552,a
1677  03a3 2069          	jra	L555
1678  03a5               L145:
1679                     ; 308         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1681  03a5 7b0a          	ld	a,(OFST+5,sp)
1682  03a7 a101          	cp	a,#1
1683  03a9 260a          	jrne	L545
1684                     ; 311             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1686  03ab c65430        	ld	a,21552
1687  03ae 1a05          	or	a,(OFST+0,sp)
1688  03b0 c75430        	ld	21552,a
1690  03b3 2059          	jra	L555
1691  03b5               L545:
1692                     ; 313         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1694  03b5 7b0a          	ld	a,(OFST+5,sp)
1695  03b7 a111          	cp	a,#17
1696  03b9 260c          	jrne	L155
1697                     ; 316             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1699  03bb 7b05          	ld	a,(OFST+0,sp)
1700  03bd a455          	and	a,#85
1701  03bf ca5430        	or	a,21552
1702  03c2 c75430        	ld	21552,a
1704  03c5 2047          	jra	L555
1705  03c7               L155:
1706                     ; 321             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1708  03c7 7b05          	ld	a,(OFST+0,sp)
1709  03c9 a4aa          	and	a,#170
1710  03cb ca5430        	or	a,21552
1711  03ce c75430        	ld	21552,a
1712  03d1 203b          	jra	L555
1713  03d3               L735:
1714                     ; 330         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1716  03d3 0d0a          	tnz	(OFST+5,sp)
1717  03d5 260b          	jrne	L755
1718                     ; 333             CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1720  03d7 7b05          	ld	a,(OFST+0,sp)
1721  03d9 43            	cpl	a
1722  03da c45431        	and	a,21553
1723  03dd c75431        	ld	21553,a
1725  03e0 202c          	jra	L555
1726  03e2               L755:
1727                     ; 335         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1729  03e2 7b0a          	ld	a,(OFST+5,sp)
1730  03e4 a101          	cp	a,#1
1731  03e6 260a          	jrne	L365
1732                     ; 338             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1734  03e8 c65431        	ld	a,21553
1735  03eb 1a05          	or	a,(OFST+0,sp)
1736  03ed c75431        	ld	21553,a
1738  03f0 201c          	jra	L555
1739  03f2               L365:
1740                     ; 340         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1742  03f2 7b0a          	ld	a,(OFST+5,sp)
1743  03f4 a111          	cp	a,#17
1744  03f6 260c          	jrne	L765
1745                     ; 343             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1747  03f8 7b05          	ld	a,(OFST+0,sp)
1748  03fa a455          	and	a,#85
1749  03fc ca5431        	or	a,21553
1750  03ff c75431        	ld	21553,a
1752  0402 200a          	jra	L555
1753  0404               L765:
1754                     ; 348             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1756  0404 7b05          	ld	a,(OFST+0,sp)
1757  0406 a4aa          	and	a,#170
1758  0408 ca5431        	or	a,21553
1759  040b c75431        	ld	21553,a
1760  040e               L555:
1761                     ; 354     CAN->PSR = (uint8_t)can_page_filter;
1763  040e 7b02          	ld	a,(OFST-3,sp)
1764  0410 c75427        	ld	21543,a
1765                     ; 355     if (fsc != 0)
1767  0413 0d04          	tnz	(OFST-1,sp)
1768  0415 2603          	jrne	L431
1769  0417 cc04e3        	jp	L375
1770  041a               L431:
1771                     ; 358         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1773  041a 0d0b          	tnz	(OFST+6,sp)
1774  041c 262c          	jrne	L575
1775                     ; 360             CAN->Page.Filter.FR09 = CAN_FilterID1;
1777  041e 7b0c          	ld	a,(OFST+7,sp)
1778  0420 c75430        	ld	21552,a
1779                     ; 361             CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1781  0423 7b10          	ld	a,(OFST+11,sp)
1782  0425 c75431        	ld	21553,a
1783                     ; 362             CAN->Page.Filter.FR11 = CAN_FilterID2;
1785  0428 7b0d          	ld	a,(OFST+8,sp)
1786  042a c75432        	ld	21554,a
1787                     ; 363             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1789  042d 7b11          	ld	a,(OFST+12,sp)
1790  042f c75433        	ld	21555,a
1791                     ; 364             CAN->Page.Filter.FR13 = CAN_FilterID3;
1793  0432 7b0e          	ld	a,(OFST+9,sp)
1794  0434 c75434        	ld	21556,a
1795                     ; 365             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1797  0437 7b12          	ld	a,(OFST+13,sp)
1798  0439 c75435        	ld	21557,a
1799                     ; 366             CAN->Page.Filter.FR15 = CAN_FilterID4;
1801  043c 7b0f          	ld	a,(OFST+10,sp)
1802  043e c75436        	ld	21558,a
1803                     ; 367             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1805  0441 7b13          	ld	a,(OFST+14,sp)
1806  0443 c75437        	ld	21559,a
1808  0446 aca105a1      	jpf	L316
1809  044a               L575:
1810                     ; 369         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1812  044a 7b0b          	ld	a,(OFST+6,sp)
1813  044c a102          	cp	a,#2
1814  044e 262c          	jrne	L106
1815                     ; 371             CAN->Page.Filter.FR09 = CAN_FilterID1;
1817  0450 7b0c          	ld	a,(OFST+7,sp)
1818  0452 c75430        	ld	21552,a
1819                     ; 372             CAN->Page.Filter.FR10 = CAN_FilterID2;
1821  0455 7b0d          	ld	a,(OFST+8,sp)
1822  0457 c75431        	ld	21553,a
1823                     ; 373             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1825  045a 7b10          	ld	a,(OFST+11,sp)
1826  045c c75432        	ld	21554,a
1827                     ; 374             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1829  045f 7b11          	ld	a,(OFST+12,sp)
1830  0461 c75433        	ld	21555,a
1831                     ; 375             CAN->Page.Filter.FR13 = CAN_FilterID3;
1833  0464 7b0e          	ld	a,(OFST+9,sp)
1834  0466 c75434        	ld	21556,a
1835                     ; 376             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1837  0469 7b12          	ld	a,(OFST+13,sp)
1838  046b c75435        	ld	21557,a
1839                     ; 377             CAN->Page.Filter.FR15 = CAN_FilterID4;
1841  046e 7b0f          	ld	a,(OFST+10,sp)
1842  0470 c75436        	ld	21558,a
1843                     ; 378             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1845  0473 7b13          	ld	a,(OFST+14,sp)
1846  0475 c75437        	ld	21559,a
1848  0478 aca105a1      	jpf	L316
1849  047c               L106:
1850                     ; 380         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1852  047c 7b0b          	ld	a,(OFST+6,sp)
1853  047e a104          	cp	a,#4
1854  0480 262c          	jrne	L506
1855                     ; 382             CAN->Page.Filter.FR09 = CAN_FilterID1;
1857  0482 7b0c          	ld	a,(OFST+7,sp)
1858  0484 c75430        	ld	21552,a
1859                     ; 383             CAN->Page.Filter.FR10 = CAN_FilterID2;
1861  0487 7b0d          	ld	a,(OFST+8,sp)
1862  0489 c75431        	ld	21553,a
1863                     ; 384             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1865  048c 7b10          	ld	a,(OFST+11,sp)
1866  048e c75432        	ld	21554,a
1867                     ; 385             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1869  0491 7b11          	ld	a,(OFST+12,sp)
1870  0493 c75433        	ld	21555,a
1871                     ; 386             CAN->Page.Filter.FR13 = CAN_FilterID3;
1873  0496 7b0e          	ld	a,(OFST+9,sp)
1874  0498 c75434        	ld	21556,a
1875                     ; 387             CAN->Page.Filter.FR14 = CAN_FilterID4;
1877  049b 7b0f          	ld	a,(OFST+10,sp)
1878  049d c75435        	ld	21557,a
1879                     ; 388             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1881  04a0 7b12          	ld	a,(OFST+13,sp)
1882  04a2 c75436        	ld	21558,a
1883                     ; 389             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1885  04a5 7b13          	ld	a,(OFST+14,sp)
1886  04a7 c75437        	ld	21559,a
1888  04aa aca105a1      	jpf	L316
1889  04ae               L506:
1890                     ; 391         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1892  04ae 7b0b          	ld	a,(OFST+6,sp)
1893  04b0 a106          	cp	a,#6
1894  04b2 2703          	jreq	L631
1895  04b4 cc05a1        	jp	L316
1896  04b7               L631:
1897                     ; 393             CAN->Page.Filter.FR09 = CAN_FilterID1;
1899  04b7 7b0c          	ld	a,(OFST+7,sp)
1900  04b9 c75430        	ld	21552,a
1901                     ; 394             CAN->Page.Filter.FR10 = CAN_FilterID2;
1903  04bc 7b0d          	ld	a,(OFST+8,sp)
1904  04be c75431        	ld	21553,a
1905                     ; 395             CAN->Page.Filter.FR11 = CAN_FilterID3;
1907  04c1 7b0e          	ld	a,(OFST+9,sp)
1908  04c3 c75432        	ld	21554,a
1909                     ; 396             CAN->Page.Filter.FR12 = CAN_FilterID4;
1911  04c6 7b0f          	ld	a,(OFST+10,sp)
1912  04c8 c75433        	ld	21555,a
1913                     ; 397             CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1915  04cb 7b10          	ld	a,(OFST+11,sp)
1916  04cd c75434        	ld	21556,a
1917                     ; 398             CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1919  04d0 7b11          	ld	a,(OFST+12,sp)
1920  04d2 c75435        	ld	21557,a
1921                     ; 399             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1923  04d5 7b12          	ld	a,(OFST+13,sp)
1924  04d7 c75436        	ld	21558,a
1925                     ; 400             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1927  04da 7b13          	ld	a,(OFST+14,sp)
1928  04dc c75437        	ld	21559,a
1929  04df aca105a1      	jpf	L316
1930  04e3               L375:
1931                     ; 406         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1933  04e3 0d0b          	tnz	(OFST+6,sp)
1934  04e5 262c          	jrne	L516
1935                     ; 408             CAN->Page.Filter.FR01 = CAN_FilterID1;
1937  04e7 7b0c          	ld	a,(OFST+7,sp)
1938  04e9 c75428        	ld	21544,a
1939                     ; 409             CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
1941  04ec 7b10          	ld	a,(OFST+11,sp)
1942  04ee c75429        	ld	21545,a
1943                     ; 410             CAN->Page.Filter.FR03 = CAN_FilterID2;
1945  04f1 7b0d          	ld	a,(OFST+8,sp)
1946  04f3 c7542a        	ld	21546,a
1947                     ; 411             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1949  04f6 7b11          	ld	a,(OFST+12,sp)
1950  04f8 c7542b        	ld	21547,a
1951                     ; 412             CAN->Page.Filter.FR05 = CAN_FilterID3;
1953  04fb 7b0e          	ld	a,(OFST+9,sp)
1954  04fd c7542c        	ld	21548,a
1955                     ; 413             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1957  0500 7b12          	ld	a,(OFST+13,sp)
1958  0502 c7542d        	ld	21549,a
1959                     ; 414             CAN->Page.Filter.FR07 = CAN_FilterID4;
1961  0505 7b0f          	ld	a,(OFST+10,sp)
1962  0507 c7542e        	ld	21550,a
1963                     ; 415             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1965  050a 7b13          	ld	a,(OFST+14,sp)
1966  050c c7542f        	ld	21551,a
1968  050f aca105a1      	jpf	L316
1969  0513               L516:
1970                     ; 417         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1972  0513 7b0b          	ld	a,(OFST+6,sp)
1973  0515 a102          	cp	a,#2
1974  0517 262a          	jrne	L126
1975                     ; 419             CAN->Page.Filter.FR01 = CAN_FilterID1;
1977  0519 7b0c          	ld	a,(OFST+7,sp)
1978  051b c75428        	ld	21544,a
1979                     ; 420             CAN->Page.Filter.FR02 = CAN_FilterID2;
1981  051e 7b0d          	ld	a,(OFST+8,sp)
1982  0520 c75429        	ld	21545,a
1983                     ; 421             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
1985  0523 7b10          	ld	a,(OFST+11,sp)
1986  0525 c7542a        	ld	21546,a
1987                     ; 422             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1989  0528 7b11          	ld	a,(OFST+12,sp)
1990  052a c7542b        	ld	21547,a
1991                     ; 423             CAN->Page.Filter.FR05 = CAN_FilterID3;
1993  052d 7b0e          	ld	a,(OFST+9,sp)
1994  052f c7542c        	ld	21548,a
1995                     ; 424             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1997  0532 7b12          	ld	a,(OFST+13,sp)
1998  0534 c7542d        	ld	21549,a
1999                     ; 425             CAN->Page.Filter.FR07 = CAN_FilterID4;
2001  0537 7b0f          	ld	a,(OFST+10,sp)
2002  0539 c7542e        	ld	21550,a
2003                     ; 426             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2005  053c 7b13          	ld	a,(OFST+14,sp)
2006  053e c7542f        	ld	21551,a
2008  0541 205e          	jra	L316
2009  0543               L126:
2010                     ; 428         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
2012  0543 7b0b          	ld	a,(OFST+6,sp)
2013  0545 a104          	cp	a,#4
2014  0547 262a          	jrne	L526
2015                     ; 430             CAN->Page.Filter.FR01 = CAN_FilterID1;
2017  0549 7b0c          	ld	a,(OFST+7,sp)
2018  054b c75428        	ld	21544,a
2019                     ; 431             CAN->Page.Filter.FR02 = CAN_FilterID2;
2021  054e 7b0d          	ld	a,(OFST+8,sp)
2022  0550 c75429        	ld	21545,a
2023                     ; 432             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2025  0553 7b10          	ld	a,(OFST+11,sp)
2026  0555 c7542a        	ld	21546,a
2027                     ; 433             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2029  0558 7b11          	ld	a,(OFST+12,sp)
2030  055a c7542b        	ld	21547,a
2031                     ; 434             CAN->Page.Filter.FR05 = CAN_FilterID3;
2033  055d 7b0e          	ld	a,(OFST+9,sp)
2034  055f c7542c        	ld	21548,a
2035                     ; 435             CAN->Page.Filter.FR06 = CAN_FilterID4;
2037  0562 7b0f          	ld	a,(OFST+10,sp)
2038  0564 c7542d        	ld	21549,a
2039                     ; 436             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2041  0567 7b12          	ld	a,(OFST+13,sp)
2042  0569 c7542e        	ld	21550,a
2043                     ; 437             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2045  056c 7b13          	ld	a,(OFST+14,sp)
2046  056e c7542f        	ld	21551,a
2048  0571 202e          	jra	L316
2049  0573               L526:
2050                     ; 439         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
2052  0573 7b0b          	ld	a,(OFST+6,sp)
2053  0575 a106          	cp	a,#6
2054  0577 2628          	jrne	L316
2055                     ; 441             CAN->Page.Filter.FR01 = CAN_FilterID1;
2057  0579 7b0c          	ld	a,(OFST+7,sp)
2058  057b c75428        	ld	21544,a
2059                     ; 442             CAN->Page.Filter.FR02 = CAN_FilterID2;
2061  057e 7b0d          	ld	a,(OFST+8,sp)
2062  0580 c75429        	ld	21545,a
2063                     ; 443             CAN->Page.Filter.FR03 = CAN_FilterID3;
2065  0583 7b0e          	ld	a,(OFST+9,sp)
2066  0585 c7542a        	ld	21546,a
2067                     ; 444             CAN->Page.Filter.FR04 = CAN_FilterID4;
2069  0588 7b0f          	ld	a,(OFST+10,sp)
2070  058a c7542b        	ld	21547,a
2071                     ; 445             CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
2073  058d 7b10          	ld	a,(OFST+11,sp)
2074  058f c7542c        	ld	21548,a
2075                     ; 446             CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
2077  0592 7b11          	ld	a,(OFST+12,sp)
2078  0594 c7542d        	ld	21549,a
2079                     ; 447             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2081  0597 7b12          	ld	a,(OFST+13,sp)
2082  0599 c7542e        	ld	21550,a
2083                     ; 448             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2085  059c 7b13          	ld	a,(OFST+14,sp)
2086  059e c7542f        	ld	21551,a
2087  05a1               L316:
2088                     ; 457     CAN->PSR = CAN_Page_Config;
2090  05a1 35065427      	mov	21543,#6
2091                     ; 458     if (CAN_FilterActivation != DISABLE)
2093  05a5 0d07          	tnz	(OFST+2,sp)
2094  05a7 272a          	jreq	L336
2095                     ; 460         if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
2097  05a9 7b06          	ld	a,(OFST+1,sp)
2098  05ab a506          	bcp	a,#6
2099  05ad 260a          	jrne	L536
2100                     ; 461         {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
2102  05af c65432        	ld	a,21554
2103  05b2 1a03          	or	a,(OFST-2,sp)
2104  05b4 c75432        	ld	21554,a
2106  05b7 201a          	jra	L336
2107  05b9               L536:
2108                     ; 463         else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
2110  05b9 7b06          	ld	a,(OFST+1,sp)
2111  05bb a406          	and	a,#6
2112  05bd a102          	cp	a,#2
2113  05bf 260a          	jrne	L146
2114                     ; 464         { CAN->Page.Config.FCR2 |= (uint8_t)fact;
2116  05c1 c65433        	ld	a,21555
2117  05c4 1a03          	or	a,(OFST-2,sp)
2118  05c6 c75433        	ld	21555,a
2120  05c9 2008          	jra	L336
2121  05cb               L146:
2122                     ; 467         { CAN->Page.Config.FCR3 |= (uint8_t)fact;
2124  05cb c65434        	ld	a,21556
2125  05ce 1a03          	or	a,(OFST-2,sp)
2126  05d0 c75434        	ld	21556,a
2127  05d3               L336:
2128                     ; 470     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
2130  05d3 a601          	ld	a,#1
2131  05d5 cd0b74        	call	_CAN_OperatingModeRequest
2133                     ; 472     CAN_SelectPage(can_page);
2135  05d8 7b01          	ld	a,(OFST-4,sp)
2136  05da cd104d        	call	_CAN_SelectPage
2138                     ; 473 }
2141  05dd 5b07          	addw	sp,#7
2142  05df 81            	ret
2283                     ; 481 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2283                     ; 482 {
2284                     	switch	.text
2285  05e0               _CAN_ITConfig:
2287  05e0 89            	pushw	x
2288  05e1 5203          	subw	sp,#3
2289       00000003      OFST:	set	3
2292                     ; 483     uint8_t tmperrorinterrupt = 0;
2294                     ; 484     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2296  05e3 cd1049        	call	_CAN_GetSelectedPage
2298  05e6 6b02          	ld	(OFST-1,sp),a
2299                     ; 488     assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2301  05e8 1e04          	ldw	x,(OFST+1,sp)
2302  05ea 2711          	jreq	L241
2303  05ec 1e04          	ldw	x,(OFST+1,sp)
2304  05ee 01            	rrwa	x,a
2305  05ef a470          	and	a,#112
2306  05f1 01            	rrwa	x,a
2307  05f2 a4b0          	and	a,#176
2308  05f4 01            	rrwa	x,a
2309  05f5 a30000        	cpw	x,#0
2310  05f8 2603          	jrne	L241
2311  05fa 4f            	clr	a
2312  05fb 2010          	jra	L441
2313  05fd               L241:
2314  05fd ae01e8        	ldw	x,#488
2315  0600 89            	pushw	x
2316  0601 ae0000        	ldw	x,#0
2317  0604 89            	pushw	x
2318  0605 ae0008        	ldw	x,#L572
2319  0608 cd0000        	call	_assert_failed
2321  060b 5b04          	addw	sp,#4
2322  060d               L441:
2323                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2325  060d 0d08          	tnz	(OFST+5,sp)
2326  060f 2706          	jreq	L051
2327  0611 7b08          	ld	a,(OFST+5,sp)
2328  0613 a101          	cp	a,#1
2329  0615 2603          	jrne	L641
2330  0617               L051:
2331  0617 4f            	clr	a
2332  0618 2010          	jra	L251
2333  061a               L641:
2334  061a ae01e9        	ldw	x,#489
2335  061d 89            	pushw	x
2336  061e ae0000        	ldw	x,#0
2337  0621 89            	pushw	x
2338  0622 ae0008        	ldw	x,#L572
2339  0625 cd0000        	call	_assert_failed
2341  0628 5b04          	addw	sp,#4
2342  062a               L251:
2343                     ; 491     tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2345  062a 1e04          	ldw	x,(OFST+1,sp)
2346  062c 4f            	clr	a
2347  062d 01            	rrwa	x,a
2348  062e 48            	sll	a
2349  062f 59            	rlcw	x
2350  0630 9f            	ld	a,xl
2351  0631 6b03          	ld	(OFST+0,sp),a
2352                     ; 492     tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2352                     ; 493                                   (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2354  0633 7b03          	ld	a,(OFST+0,sp)
2355  0635 a40f          	and	a,#15
2356  0637 44            	srl	a
2357  0638 6b01          	ld	(OFST-2,sp),a
2358  063a 7b03          	ld	a,(OFST+0,sp)
2359  063c a4f0          	and	a,#240
2360  063e 1a01          	or	a,(OFST-2,sp)
2361  0640 6b03          	ld	(OFST+0,sp),a
2362                     ; 495     CAN->PSR = CAN_Page_Config;
2364  0642 35065427      	mov	21543,#6
2365                     ; 496     if (NewState != DISABLE)
2367  0646 0d08          	tnz	(OFST+5,sp)
2368  0648 2712          	jreq	L527
2369                     ; 499         CAN->IER |= (uint8_t)(CAN_IT);
2371  064a c65425        	ld	a,21541
2372  064d 1a05          	or	a,(OFST+2,sp)
2373  064f c75425        	ld	21541,a
2374                     ; 500         CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2376  0652 c65429        	ld	a,21545
2377  0655 1a03          	or	a,(OFST+0,sp)
2378  0657 c75429        	ld	21545,a
2380  065a 2012          	jra	L727
2381  065c               L527:
2382                     ; 505         CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2384  065c 7b05          	ld	a,(OFST+2,sp)
2385  065e 43            	cpl	a
2386  065f c45425        	and	a,21541
2387  0662 c75425        	ld	21541,a
2388                     ; 506         CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2390  0665 7b03          	ld	a,(OFST+0,sp)
2391  0667 43            	cpl	a
2392  0668 c45429        	and	a,21545
2393  066b c75429        	ld	21545,a
2394  066e               L727:
2395                     ; 509     CAN_SelectPage(can_page);
2397  066e 7b02          	ld	a,(OFST-1,sp)
2398  0670 cd104d        	call	_CAN_SelectPage
2400                     ; 510 }
2403  0673 5b05          	addw	sp,#5
2404  0675 81            	ret
2464                     ; 519 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2464                     ; 520 {
2465                     	switch	.text
2466  0676               _CAN_ST7CompatibilityCmd:
2468  0676 88            	push	a
2469       00000000      OFST:	set	0
2472                     ; 522     assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2474  0677 4d            	tnz	a
2475  0678 2704          	jreq	L061
2476  067a a110          	cp	a,#16
2477  067c 2603          	jrne	L651
2478  067e               L061:
2479  067e 4f            	clr	a
2480  067f 2010          	jra	L261
2481  0681               L651:
2482  0681 ae020a        	ldw	x,#522
2483  0684 89            	pushw	x
2484  0685 ae0000        	ldw	x,#0
2485  0688 89            	pushw	x
2486  0689 ae0008        	ldw	x,#L572
2487  068c cd0000        	call	_assert_failed
2489  068f 5b04          	addw	sp,#4
2490  0691               L261:
2491                     ; 524     CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2493  0691 72195426      	bres	21542,#4
2494                     ; 527     CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2496  0695 c65426        	ld	a,21542
2497  0698 1a01          	or	a,(OFST+1,sp)
2498  069a c75426        	ld	21542,a
2499                     ; 528 }
2502  069d 84            	pop	a
2503  069e 81            	ret
2551                     ; 535 void CAN_TTComModeCmd(FunctionalState NewState)
2551                     ; 536 {
2552                     	switch	.text
2553  069f               _CAN_TTComModeCmd:
2555  069f 88            	push	a
2556  06a0 88            	push	a
2557       00000001      OFST:	set	1
2560                     ; 537     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2562  06a1 cd1049        	call	_CAN_GetSelectedPage
2564  06a4 6b01          	ld	(OFST+0,sp),a
2565                     ; 539     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2567  06a6 0d02          	tnz	(OFST+1,sp)
2568  06a8 2706          	jreq	L071
2569  06aa 7b02          	ld	a,(OFST+1,sp)
2570  06ac a101          	cp	a,#1
2571  06ae 2603          	jrne	L661
2572  06b0               L071:
2573  06b0 4f            	clr	a
2574  06b1 2010          	jra	L271
2575  06b3               L661:
2576  06b3 ae021b        	ldw	x,#539
2577  06b6 89            	pushw	x
2578  06b7 ae0000        	ldw	x,#0
2579  06ba 89            	pushw	x
2580  06bb ae0008        	ldw	x,#L572
2581  06be cd0000        	call	_assert_failed
2583  06c1 5b04          	addw	sp,#4
2584  06c3               L271:
2585                     ; 540     if (NewState != DISABLE)
2587  06c3 0d02          	tnz	(OFST+1,sp)
2588  06c5 2726          	jreq	L1001
2589                     ; 543         CAN->MCR |= CAN_MCR_TTCM;
2591  06c7 721e5420      	bset	21536,#7
2592                     ; 545         CAN->PSR = CAN_Page_TxMailBox0;
2594  06cb 725f5427      	clr	21543
2595                     ; 546         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2597  06cf 721e5429      	bset	21545,#7
2598                     ; 547         CAN->PSR = CAN_Page_TxMailBox1;
2600  06d3 35015427      	mov	21543,#1
2601                     ; 548         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2603  06d7 721e5429      	bset	21545,#7
2604                     ; 549         CAN->PSR = CAN_Page_TxMailBox2;
2606  06db 35055427      	mov	21543,#5
2607                     ; 550         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2609  06df 721e5429      	bset	21545,#7
2610                     ; 551         CAN->PSR = CAN_Page_RxFifo;
2612  06e3 35075427      	mov	21543,#7
2613                     ; 552         CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2615  06e7 721e5429      	bset	21545,#7
2617  06eb 2024          	jra	L3001
2618  06ed               L1001:
2619                     ; 557         CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2621  06ed 721f5420      	bres	21536,#7
2622                     ; 559         CAN->PSR = CAN_Page_TxMailBox0;
2624  06f1 725f5427      	clr	21543
2625                     ; 560         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2627  06f5 721f5429      	bres	21545,#7
2628                     ; 561         CAN->PSR = CAN_Page_TxMailBox1;
2630  06f9 35015427      	mov	21543,#1
2631                     ; 562         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2633  06fd 721f5429      	bres	21545,#7
2634                     ; 563         CAN->PSR = CAN_Page_TxMailBox2;
2636  0701 35055427      	mov	21543,#5
2637                     ; 564         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2639  0705 721f5429      	bres	21545,#7
2640                     ; 565         CAN->PSR = CAN_Page_RxFifo;
2642  0709 35075427      	mov	21543,#7
2643                     ; 566         CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2645  070d 721f5429      	bres	21545,#7
2646  0711               L3001:
2647                     ; 569     CAN_SelectPage(can_page);
2649  0711 7b01          	ld	a,(OFST+0,sp)
2650  0713 cd104d        	call	_CAN_SelectPage
2652                     ; 570 }
2655  0716 85            	popw	x
2656  0717 81            	ret
2858                     .const:	section	.text
2859  0000               L602:
2860  0000 20000000      	dc.l	536870912
2861  0004               L412:
2862  0004 00000800      	dc.l	2048
2863                     ; 581 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2863                     ; 582                                   CAN_Id_TypeDef CAN_IDE,
2863                     ; 583                                   CAN_RTR_TypeDef CAN_RTR,
2863                     ; 584                                   uint8_t CAN_DLC,
2863                     ; 585                                   uint8_t *CAN_Data)
2863                     ; 586 {
2864                     	switch	.text
2865  0718               _CAN_Transmit:
2867  0718 5206          	subw	sp,#6
2868       00000006      OFST:	set	6
2871                     ; 587     CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2873                     ; 588     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2875  071a cd1049        	call	_CAN_GetSelectedPage
2877  071d 6b05          	ld	(OFST-1,sp),a
2878                     ; 590     assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2880  071f 0d0d          	tnz	(OFST+7,sp)
2881  0721 2706          	jreq	L002
2882  0723 7b0d          	ld	a,(OFST+7,sp)
2883  0725 a140          	cp	a,#64
2884  0727 2603          	jrne	L671
2885  0729               L002:
2886  0729 4f            	clr	a
2887  072a 2010          	jra	L202
2888  072c               L671:
2889  072c ae024e        	ldw	x,#590
2890  072f 89            	pushw	x
2891  0730 ae0000        	ldw	x,#0
2892  0733 89            	pushw	x
2893  0734 ae0008        	ldw	x,#L572
2894  0737 cd0000        	call	_assert_failed
2896  073a 5b04          	addw	sp,#4
2897  073c               L202:
2898                     ; 591     if (CAN_IDE != CAN_Id_Standard)
2900  073c 0d0d          	tnz	(OFST+7,sp)
2901  073e 2724          	jreq	L3111
2902                     ; 593         assert_param(IS_CAN_EXTID_OK(CAN_Id));
2904  0740 96            	ldw	x,sp
2905  0741 1c0009        	addw	x,#OFST+3
2906  0744 cd0000        	call	c_ltor
2908  0747 ae0000        	ldw	x,#L602
2909  074a cd0000        	call	c_lcmp
2911  074d 2403          	jruge	L402
2912  074f 4f            	clr	a
2913  0750 2010          	jra	L012
2914  0752               L402:
2915  0752 ae0251        	ldw	x,#593
2916  0755 89            	pushw	x
2917  0756 ae0000        	ldw	x,#0
2918  0759 89            	pushw	x
2919  075a ae0008        	ldw	x,#L572
2920  075d cd0000        	call	_assert_failed
2922  0760 5b04          	addw	sp,#4
2923  0762               L012:
2925  0762 2022          	jra	L5111
2926  0764               L3111:
2927                     ; 597         assert_param(IS_CAN_STDID_OK(CAN_Id));
2929  0764 96            	ldw	x,sp
2930  0765 1c0009        	addw	x,#OFST+3
2931  0768 cd0000        	call	c_ltor
2933  076b ae0004        	ldw	x,#L412
2934  076e cd0000        	call	c_lcmp
2936  0771 2403          	jruge	L212
2937  0773 4f            	clr	a
2938  0774 2010          	jra	L612
2939  0776               L212:
2940  0776 ae0255        	ldw	x,#597
2941  0779 89            	pushw	x
2942  077a ae0000        	ldw	x,#0
2943  077d 89            	pushw	x
2944  077e ae0008        	ldw	x,#L572
2945  0781 cd0000        	call	_assert_failed
2947  0784 5b04          	addw	sp,#4
2948  0786               L612:
2949  0786               L5111:
2950                     ; 599     assert_param(IS_CAN_RTR_OK(CAN_RTR));
2952  0786 0d0e          	tnz	(OFST+8,sp)
2953  0788 2706          	jreq	L222
2954  078a 7b0e          	ld	a,(OFST+8,sp)
2955  078c a120          	cp	a,#32
2956  078e 2603          	jrne	L022
2957  0790               L222:
2958  0790 4f            	clr	a
2959  0791 2010          	jra	L422
2960  0793               L022:
2961  0793 ae0257        	ldw	x,#599
2962  0796 89            	pushw	x
2963  0797 ae0000        	ldw	x,#0
2964  079a 89            	pushw	x
2965  079b ae0008        	ldw	x,#L572
2966  079e cd0000        	call	_assert_failed
2968  07a1 5b04          	addw	sp,#4
2969  07a3               L422:
2970                     ; 600     assert_param(IS_CAN_DLC_OK(CAN_DLC));
2972  07a3 7b0f          	ld	a,(OFST+9,sp)
2973  07a5 a109          	cp	a,#9
2974  07a7 2403          	jruge	L622
2975  07a9 4f            	clr	a
2976  07aa 2010          	jra	L032
2977  07ac               L622:
2978  07ac ae0258        	ldw	x,#600
2979  07af 89            	pushw	x
2980  07b0 ae0000        	ldw	x,#0
2981  07b3 89            	pushw	x
2982  07b4 ae0008        	ldw	x,#L572
2983  07b7 cd0000        	call	_assert_failed
2985  07ba 5b04          	addw	sp,#4
2986  07bc               L032:
2987                     ; 602     if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
2989  07bc c65423        	ld	a,21539
2990  07bf a404          	and	a,#4
2991  07c1 a104          	cp	a,#4
2992  07c3 2604          	jrne	L7111
2993                     ; 604         CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
2995  07c5 0f06          	clr	(OFST+0,sp)
2997  07c7 2022          	jra	L1211
2998  07c9               L7111:
2999                     ; 606     else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
3001  07c9 c65423        	ld	a,21539
3002  07cc a408          	and	a,#8
3003  07ce a108          	cp	a,#8
3004  07d0 2606          	jrne	L3211
3005                     ; 608         CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
3007  07d2 a601          	ld	a,#1
3008  07d4 6b06          	ld	(OFST+0,sp),a
3010  07d6 2013          	jra	L1211
3011  07d8               L3211:
3012                     ; 610     else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
3014  07d8 c65423        	ld	a,21539
3015  07db a410          	and	a,#16
3016  07dd a110          	cp	a,#16
3017  07df 2606          	jrne	L7211
3018                     ; 612         CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
3020  07e1 a605          	ld	a,#5
3021  07e3 6b06          	ld	(OFST+0,sp),a
3023  07e5 2004          	jra	L1211
3024  07e7               L7211:
3025                     ; 616         CAN_TxStatus = CAN_TxStatus_NoMailBox;
3027  07e7 a6f4          	ld	a,#244
3028  07e9 6b06          	ld	(OFST+0,sp),a
3029  07eb               L1211:
3030                     ; 618     if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
3032  07eb 7b06          	ld	a,(OFST+0,sp)
3033  07ed a1f4          	cp	a,#244
3034  07ef 2603          	jrne	L232
3035  07f1 cc08bd        	jp	L3311
3036  07f4               L232:
3037                     ; 620         CAN->PSR = (uint8_t)CAN_TxStatus;
3039  07f4 7b06          	ld	a,(OFST+0,sp)
3040  07f6 c75427        	ld	21543,a
3041                     ; 622         if (CAN_IDE != CAN_Id_Standard)
3043  07f9 0d0d          	tnz	(OFST+7,sp)
3044  07fb 273b          	jreq	L5311
3045                     ; 624             CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
3047  07fd 7b09          	ld	a,(OFST+3,sp)
3048  07ff a41f          	and	a,#31
3049  0801 6b09          	ld	(OFST+3,sp),a
3050                     ; 625             CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
3052  0803 7b0c          	ld	a,(OFST+6,sp)
3053  0805 c7542d        	ld	21549,a
3054                     ; 626             CAN_Id = CAN_Id>>8;
3056  0808 96            	ldw	x,sp
3057  0809 1c0009        	addw	x,#OFST+3
3058  080c a608          	ld	a,#8
3059  080e cd0000        	call	c_lgursh
3061                     ; 627             CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
3063  0811 7b0c          	ld	a,(OFST+6,sp)
3064  0813 c7542c        	ld	21548,a
3065                     ; 628             CAN_Id = CAN_Id>>8;
3067  0816 96            	ldw	x,sp
3068  0817 1c0009        	addw	x,#OFST+3
3069  081a a608          	ld	a,#8
3070  081c cd0000        	call	c_lgursh
3072                     ; 629             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
3074  081f 7b0c          	ld	a,(OFST+6,sp)
3075  0821 c7542b        	ld	21547,a
3076                     ; 630             CAN_Id = CAN_Id>>8;
3078  0824 96            	ldw	x,sp
3079  0825 1c0009        	addw	x,#OFST+3
3080  0828 a608          	ld	a,#8
3081  082a cd0000        	call	c_lgursh
3083                     ; 631             CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
3085  082d 7b0c          	ld	a,(OFST+6,sp)
3086  082f 1a0d          	or	a,(OFST+7,sp)
3087  0831 1a0e          	or	a,(OFST+8,sp)
3088  0833 c7542a        	ld	21546,a
3090  0836 203a          	jra	L7311
3091  0838               L5311:
3092                     ; 635             CAN_Id &= (uint16_t)CAN_STDID_SIZE;
3094  0838 7b0b          	ld	a,(OFST+5,sp)
3095  083a a407          	and	a,#7
3096  083c 6b0b          	ld	(OFST+5,sp),a
3097  083e 0f0a          	clr	(OFST+4,sp)
3098  0840 0f09          	clr	(OFST+3,sp)
3099                     ; 636             CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
3101  0842 7b0e          	ld	a,(OFST+8,sp)
3102  0844 b703          	ld	c_lreg+3,a
3103  0846 3f02          	clr	c_lreg+2
3104  0848 3f01          	clr	c_lreg+1
3105  084a 3f00          	clr	c_lreg
3106  084c 96            	ldw	x,sp
3107  084d 1c0001        	addw	x,#OFST-5
3108  0850 cd0000        	call	c_rtol
3110  0853 96            	ldw	x,sp
3111  0854 1c0009        	addw	x,#OFST+3
3112  0857 cd0000        	call	c_ltor
3114  085a a606          	ld	a,#6
3115  085c cd0000        	call	c_lursh
3117  085f 96            	ldw	x,sp
3118  0860 1c0001        	addw	x,#OFST-5
3119  0863 cd0000        	call	c_lor
3121  0866 b603          	ld	a,c_lreg+3
3122  0868 c7542a        	ld	21546,a
3123                     ; 637             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
3125  086b 7b0c          	ld	a,(OFST+6,sp)
3126  086d 48            	sll	a
3127  086e 48            	sll	a
3128  086f c7542b        	ld	21547,a
3129  0872               L7311:
3130                     ; 641         CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
3132  0872 c65429        	ld	a,21545
3133  0875 a4f0          	and	a,#240
3134  0877 c75429        	ld	21545,a
3135                     ; 643         CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
3137  087a c65429        	ld	a,21545
3138  087d 1a0f          	or	a,(OFST+9,sp)
3139  087f c75429        	ld	21545,a
3140                     ; 645         CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
3142  0882 1e10          	ldw	x,(OFST+10,sp)
3143  0884 f6            	ld	a,(x)
3144  0885 c7542e        	ld	21550,a
3145                     ; 646         CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
3147  0888 1e10          	ldw	x,(OFST+10,sp)
3148  088a e601          	ld	a,(1,x)
3149  088c c7542f        	ld	21551,a
3150                     ; 647         CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
3152  088f 1e10          	ldw	x,(OFST+10,sp)
3153  0891 e602          	ld	a,(2,x)
3154  0893 c75430        	ld	21552,a
3155                     ; 648         CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
3157  0896 1e10          	ldw	x,(OFST+10,sp)
3158  0898 e603          	ld	a,(3,x)
3159  089a c75431        	ld	21553,a
3160                     ; 649         CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
3162  089d 1e10          	ldw	x,(OFST+10,sp)
3163  089f e604          	ld	a,(4,x)
3164  08a1 c75432        	ld	21554,a
3165                     ; 650         CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
3167  08a4 1e10          	ldw	x,(OFST+10,sp)
3168  08a6 e605          	ld	a,(5,x)
3169  08a8 c75433        	ld	21555,a
3170                     ; 651         CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
3172  08ab 1e10          	ldw	x,(OFST+10,sp)
3173  08ad e606          	ld	a,(6,x)
3174  08af c75434        	ld	21556,a
3175                     ; 652         CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
3177  08b2 1e10          	ldw	x,(OFST+10,sp)
3178  08b4 e607          	ld	a,(7,x)
3179  08b6 c75435        	ld	21557,a
3180                     ; 654         CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
3182  08b9 72105428      	bset	21544,#0
3183  08bd               L3311:
3184                     ; 657     CAN_SelectPage(can_page);
3186  08bd 7b05          	ld	a,(OFST-1,sp)
3187  08bf cd104d        	call	_CAN_SelectPage
3189                     ; 658     return (CAN_TxStatus_TypeDef)CAN_TxStatus;
3191  08c2 7b06          	ld	a,(OFST+0,sp)
3194  08c4 5b06          	addw	sp,#6
3195  08c6 81            	ret
3280                     ; 666 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3280                     ; 667 {
3281                     	switch	.text
3282  08c7               _CAN_TransmitStatus:
3284  08c7 88            	push	a
3285  08c8 88            	push	a
3286       00000001      OFST:	set	1
3289                     ; 669     CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
3291                     ; 670     uint8_t tmpstate=0;
3293  08c9 0f01          	clr	(OFST+0,sp)
3294                     ; 673     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3296  08cb 4d            	tnz	a
3297  08cc 2708          	jreq	L042
3298  08ce a101          	cp	a,#1
3299  08d0 2704          	jreq	L042
3300  08d2 a105          	cp	a,#5
3301  08d4 2603          	jrne	L632
3302  08d6               L042:
3303  08d6 4f            	clr	a
3304  08d7 2010          	jra	L242
3305  08d9               L632:
3306  08d9 ae02a1        	ldw	x,#673
3307  08dc 89            	pushw	x
3308  08dd ae0000        	ldw	x,#0
3309  08e0 89            	pushw	x
3310  08e1 ae0008        	ldw	x,#L572
3311  08e4 cd0000        	call	_assert_failed
3313  08e7 5b04          	addw	sp,#4
3314  08e9               L242:
3315                     ; 675     switch (CAN_TransmitMailbox)
3317  08e9 7b02          	ld	a,(OFST+1,sp)
3319                     ; 688         break;
3320  08eb 4d            	tnz	a
3321  08ec 2709          	jreq	L1411
3322  08ee 4a            	dec	a
3323  08ef 2718          	jreq	L3411
3324  08f1 a004          	sub	a,#4
3325  08f3 2728          	jreq	L5411
3326  08f5               L7411:
3327                     ; 686     default:
3327                     ; 687         tstate = CAN_TxStatus_Failed;
3329                     ; 688         break;
3331  08f5 203a          	jra	L3221
3332  08f7               L1411:
3333                     ; 677     case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
3335  08f7 c65422        	ld	a,21538
3336  08fa a411          	and	a,#17
3337  08fc 6b01          	ld	(OFST+0,sp),a
3338                     ; 678         tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
3340  08fe c65423        	ld	a,21539
3341  0901 a404          	and	a,#4
3342  0903 1a01          	or	a,(OFST+0,sp)
3343  0905 6b01          	ld	(OFST+0,sp),a
3344                     ; 679         break;
3346  0907 2028          	jra	L3221
3347  0909               L3411:
3348                     ; 680     case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3350  0909 c65422        	ld	a,21538
3351  090c a422          	and	a,#34
3352  090e 44            	srl	a
3353  090f 6b01          	ld	(OFST+0,sp),a
3354                     ; 681         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3356  0911 c65423        	ld	a,21539
3357  0914 a408          	and	a,#8
3358  0916 44            	srl	a
3359  0917 1a01          	or	a,(OFST+0,sp)
3360  0919 6b01          	ld	(OFST+0,sp),a
3361                     ; 682         break;
3363  091b 2014          	jra	L3221
3364  091d               L5411:
3365                     ; 683     case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3367  091d c65422        	ld	a,21538
3368  0920 a444          	and	a,#68
3369  0922 44            	srl	a
3370  0923 44            	srl	a
3371  0924 6b01          	ld	(OFST+0,sp),a
3372                     ; 684         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3374  0926 c65423        	ld	a,21539
3375  0929 a410          	and	a,#16
3376  092b 44            	srl	a
3377  092c 44            	srl	a
3378  092d 1a01          	or	a,(OFST+0,sp)
3379  092f 6b01          	ld	(OFST+0,sp),a
3380                     ; 685         break;
3382  0931               L3221:
3383                     ; 691     switch (tmpstate)
3385  0931 7b01          	ld	a,(OFST+0,sp)
3387                     ; 707         break;
3388  0933 4d            	tnz	a
3389  0934 2711          	jreq	L1511
3390  0936 a004          	sub	a,#4
3391  0938 271f          	jreq	L7511
3392  093a 4a            	dec	a
3393  093b 2710          	jreq	L3511
3394  093d a010          	sub	a,#16
3395  093f 2712          	jreq	L5511
3396  0941               L1611:
3397                     ; 705     default:
3397                     ; 706         tstate = CAN_TxStatus_Failed;
3399  0941 a6f0          	ld	a,#240
3400  0943 6b01          	ld	(OFST+0,sp),a
3401                     ; 707         break;
3403  0945 2016          	jra	L7221
3404  0947               L1511:
3405                     ; 694     case (0x00): tstate = CAN_TxStatus_Pending;
3407  0947 a6f2          	ld	a,#242
3408  0949 6b01          	ld	(OFST+0,sp),a
3409                     ; 695         break;
3411  094b 2010          	jra	L7221
3412  094d               L3511:
3413                     ; 697     case (0x05): tstate = CAN_TxStatus_Failed;
3415  094d a6f0          	ld	a,#240
3416  094f 6b01          	ld	(OFST+0,sp),a
3417                     ; 698         break;
3419  0951 200a          	jra	L7221
3420  0953               L5511:
3421                     ; 700     case (0x15): tstate = CAN_TxStatus_Ok;
3423  0953 a6f1          	ld	a,#241
3424  0955 6b01          	ld	(OFST+0,sp),a
3425                     ; 701         break;
3427  0957 2004          	jra	L7221
3428  0959               L7511:
3429                     ; 703     case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3431  0959 a6f5          	ld	a,#245
3432  095b 6b01          	ld	(OFST+0,sp),a
3433                     ; 704         break;
3435  095d               L7221:
3436                     ; 710     return (CAN_TxStatus_TypeDef)tstate;
3438  095d 7b01          	ld	a,(OFST+0,sp)
3441  095f 85            	popw	x
3442  0960 81            	ret
3491                     ; 718 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3491                     ; 719 {
3492                     	switch	.text
3493  0961               _CAN_CancelTransmit:
3495  0961 88            	push	a
3496  0962 88            	push	a
3497       00000001      OFST:	set	1
3500                     ; 720     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3502  0963 cd1049        	call	_CAN_GetSelectedPage
3504  0966 6b01          	ld	(OFST+0,sp),a
3505                     ; 722     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3507  0968 0d02          	tnz	(OFST+1,sp)
3508  096a 270c          	jreq	L052
3509  096c 7b02          	ld	a,(OFST+1,sp)
3510  096e a101          	cp	a,#1
3511  0970 2706          	jreq	L052
3512  0972 7b02          	ld	a,(OFST+1,sp)
3513  0974 a105          	cp	a,#5
3514  0976 2603          	jrne	L642
3515  0978               L052:
3516  0978 4f            	clr	a
3517  0979 2010          	jra	L252
3518  097b               L642:
3519  097b ae02d2        	ldw	x,#722
3520  097e 89            	pushw	x
3521  097f ae0000        	ldw	x,#0
3522  0982 89            	pushw	x
3523  0983 ae0008        	ldw	x,#L572
3524  0986 cd0000        	call	_assert_failed
3526  0989 5b04          	addw	sp,#4
3527  098b               L252:
3528                     ; 724     CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3530  098b 7b02          	ld	a,(OFST+1,sp)
3531  098d c75427        	ld	21543,a
3532                     ; 726     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3534  0990 72125428      	bset	21544,#1
3535                     ; 728     CAN_SelectPage(can_page);
3537  0994 7b01          	ld	a,(OFST+0,sp)
3538  0996 cd104d        	call	_CAN_SelectPage
3540                     ; 729 }
3543  0999 85            	popw	x
3544  099a 81            	ret
3567                     ; 736 void CAN_FIFORelease(void)
3567                     ; 737 {
3568                     	switch	.text
3569  099b               _CAN_FIFORelease:
3573                     ; 739     CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3575  099b 35205424      	mov	21540,#32
3576                     ; 740 }
3579  099f 81            	ret
3653                     ; 746 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3653                     ; 747 {
3654                     	switch	.text
3655  09a0               _CAN_MessagePending:
3657  09a0 88            	push	a
3658       00000001      OFST:	set	1
3661                     ; 748     CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3663                     ; 749     msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3665  09a1 c65424        	ld	a,21540
3666  09a4 a403          	and	a,#3
3667  09a6 6b01          	ld	(OFST+0,sp),a
3668                     ; 750     return (CAN_NbrPendingMessage_TypeDef)msgpending;
3670  09a8 7b01          	ld	a,(OFST+0,sp)
3673  09aa 5b01          	addw	sp,#1
3674  09ac 81            	ret
3739                     ; 761 void CAN_Receive(void)
3739                     ; 762 {
3740                     	switch	.text
3741  09ad               _CAN_Receive:
3743  09ad 520d          	subw	sp,#13
3744       0000000d      OFST:	set	13
3747                     ; 763     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3749  09af cd1049        	call	_CAN_GetSelectedPage
3751  09b2 6b01          	ld	(OFST-12,sp),a
3752                     ; 764     uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3758                     ; 767     CAN->PSR = CAN_Page_RxFifo;
3760  09b4 35075427      	mov	21543,#7
3761                     ; 770     _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3763  09b8 c6542a        	ld	a,21546
3764  09bb a440          	and	a,#64
3765  09bd c70004        	ld	__IDE,a
3766                     ; 771     if (_IDE != CAN_Id_Standard)
3768  09c0 725d0004      	tnz	__IDE
3769  09c4 2602          	jrne	L262
3770  09c6 207b          	jp	L1431
3771  09c8               L262:
3772                     ; 773       temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3774  09c8 c6542c        	ld	a,21548
3775  09cb 5f            	clrw	x
3776  09cc 97            	ld	xl,a
3777  09cd 90ae0100      	ldw	y,#256
3778  09d1 cd0000        	call	c_umul
3780  09d4 96            	ldw	x,sp
3781  09d5 1c0006        	addw	x,#OFST-7
3782  09d8 cd0000        	call	c_rtol
3784                     ; 774       temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3786  09db c6542b        	ld	a,21547
3787  09de b703          	ld	c_lreg+3,a
3788  09e0 3f02          	clr	c_lreg+2
3789  09e2 3f01          	clr	c_lreg+1
3790  09e4 3f00          	clr	c_lreg
3791  09e6 a610          	ld	a,#16
3792  09e8 cd0000        	call	c_llsh
3794  09eb 96            	ldw	x,sp
3795  09ec 1c000a        	addw	x,#OFST-3
3796  09ef cd0000        	call	c_rtol
3798                     ; 775       temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3800  09f2 c6542a        	ld	a,21546
3801  09f5 b703          	ld	c_lreg+3,a
3802  09f7 3f02          	clr	c_lreg+2
3803  09f9 3f01          	clr	c_lreg+1
3804  09fb 3f00          	clr	c_lreg
3805  09fd b603          	ld	a,c_lreg+3
3806  09ff a41f          	and	a,#31
3807  0a01 b703          	ld	c_lreg+3,a
3808  0a03 3f02          	clr	c_lreg+2
3809  0a05 3f01          	clr	c_lreg+1
3810  0a07 3f00          	clr	c_lreg
3811  0a09 a618          	ld	a,#24
3812  0a0b cd0000        	call	c_llsh
3814  0a0e 96            	ldw	x,sp
3815  0a0f 1c0002        	addw	x,#OFST-11
3816  0a12 cd0000        	call	c_rtol
3818                     ; 777       _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3820  0a15 c6542d        	ld	a,21549
3821  0a18 b703          	ld	c_lreg+3,a
3822  0a1a 3f02          	clr	c_lreg+2
3823  0a1c 3f01          	clr	c_lreg+1
3824  0a1e 3f00          	clr	c_lreg
3825  0a20 96            	ldw	x,sp
3826  0a21 1c0006        	addw	x,#OFST-7
3827  0a24 cd0000        	call	c_lor
3829  0a27 96            	ldw	x,sp
3830  0a28 1c000a        	addw	x,#OFST-3
3831  0a2b cd0000        	call	c_lor
3833  0a2e 96            	ldw	x,sp
3834  0a2f 1c0002        	addw	x,#OFST-11
3835  0a32 cd0000        	call	c_lor
3837  0a35 b600          	ld	a,c_lreg
3838  0a37 a41f          	and	a,#31
3839  0a39 b700          	ld	c_lreg,a
3840  0a3b ae0000        	ldw	x,#__Id
3841  0a3e cd0000        	call	c_rtol
3844  0a41 204c          	jra	L3431
3845  0a43               L1431:
3846                     ; 781         temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3848  0a43 c6542a        	ld	a,21546
3849  0a46 5f            	clrw	x
3850  0a47 a41f          	and	a,#31
3851  0a49 5f            	clrw	x
3852  0a4a 02            	rlwa	x,a
3853  0a4b 58            	sllw	x
3854  0a4c 58            	sllw	x
3855  0a4d 58            	sllw	x
3856  0a4e 58            	sllw	x
3857  0a4f 58            	sllw	x
3858  0a50 58            	sllw	x
3859  0a51 cd0000        	call	c_uitolx
3861  0a54 96            	ldw	x,sp
3862  0a55 1c0006        	addw	x,#OFST-7
3863  0a58 cd0000        	call	c_rtol
3865                     ; 782         temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3867  0a5b c6542b        	ld	a,21547
3868  0a5e 5f            	clrw	x
3869  0a5f 97            	ld	xl,a
3870  0a60 54            	srlw	x
3871  0a61 54            	srlw	x
3872  0a62 9f            	ld	a,xl
3873  0a63 5f            	clrw	x
3874  0a64 a43f          	and	a,#63
3875  0a66 5f            	clrw	x
3876  0a67 cd0000        	call	c_uitol
3878  0a6a 96            	ldw	x,sp
3879  0a6b 1c000a        	addw	x,#OFST-3
3880  0a6e cd0000        	call	c_rtol
3882                     ; 784       _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3884  0a71 96            	ldw	x,sp
3885  0a72 1c0006        	addw	x,#OFST-7
3886  0a75 cd0000        	call	c_ltor
3888  0a78 96            	ldw	x,sp
3889  0a79 1c000a        	addw	x,#OFST-3
3890  0a7c cd0000        	call	c_lor
3892  0a7f b602          	ld	a,c_lreg+2
3893  0a81 a407          	and	a,#7
3894  0a83 b702          	ld	c_lreg+2,a
3895  0a85 3f01          	clr	c_lreg+1
3896  0a87 3f00          	clr	c_lreg
3897  0a89 ae0000        	ldw	x,#__Id
3898  0a8c cd0000        	call	c_rtol
3900  0a8f               L3431:
3901                     ; 787     _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
3903  0a8f c6542a        	ld	a,21546
3904  0a92 a420          	and	a,#32
3905  0a94 c70005        	ld	__RTR,a
3906                     ; 790     _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
3908  0a97 c65429        	ld	a,21545
3909  0a9a a40f          	and	a,#15
3910  0a9c c70006        	ld	__DLC,a
3911                     ; 793     _FMI = CAN->Page.RxFIFO.MFMI;
3913  0a9f 555428000f    	mov	__FMI,21544
3914                     ; 796     _Data[0] = CAN->Page.RxFIFO.MDAR1;
3916  0aa4 55542e0007    	mov	__Data,21550
3917                     ; 797     _Data[1] = CAN->Page.RxFIFO.MDAR2;
3919  0aa9 55542f0008    	mov	__Data+1,21551
3920                     ; 798     _Data[2] = CAN->Page.RxFIFO.MDAR3;
3922  0aae 5554300009    	mov	__Data+2,21552
3923                     ; 799     _Data[3] = CAN->Page.RxFIFO.MDAR4;
3925  0ab3 555431000a    	mov	__Data+3,21553
3926                     ; 800     _Data[4] = CAN->Page.RxFIFO.MDAR5;
3928  0ab8 555432000b    	mov	__Data+4,21554
3929                     ; 801     _Data[5] = CAN->Page.RxFIFO.MDAR6;
3931  0abd 555433000c    	mov	__Data+5,21555
3932                     ; 802     _Data[6] = CAN->Page.RxFIFO.MDAR7;
3934  0ac2 555434000d    	mov	__Data+6,21556
3935                     ; 803     _Data[7] = CAN->Page.RxFIFO.MDAR8;
3937  0ac7 555435000e    	mov	__Data+7,21557
3938                     ; 806     CAN_FIFORelease();
3940  0acc cd099b        	call	_CAN_FIFORelease
3942                     ; 808     CAN_SelectPage(can_page);
3944  0acf 7b01          	ld	a,(OFST-12,sp)
3945  0ad1 cd104d        	call	_CAN_SelectPage
3947                     ; 809 }
3950  0ad4 5b0d          	addw	sp,#13
3951  0ad6 81            	ret
3975                     ; 819 uint32_t CAN_GetReceivedId(void)
3975                     ; 820 {
3976                     	switch	.text
3977  0ad7               _CAN_GetReceivedId:
3981                     ; 821     return (_Id);
3983  0ad7 ae0000        	ldw	x,#__Id
3984  0ada cd0000        	call	c_ltor
3988  0add 81            	ret
4013                     ; 832 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
4013                     ; 833 {
4014                     	switch	.text
4015  0ade               _CAN_GetReceivedIDE:
4019                     ; 834     return (CAN_Id_TypeDef)(_IDE);
4021  0ade c60004        	ld	a,__IDE
4024  0ae1 81            	ret
4049                     ; 845 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
4049                     ; 846 {
4050                     	switch	.text
4051  0ae2               _CAN_GetReceivedRTR:
4055                     ; 847     return (CAN_RTR_TypeDef)(_RTR);
4057  0ae2 c60005        	ld	a,__RTR
4060  0ae5 81            	ret
4084                     ; 858 uint8_t CAN_GetReceivedDLC(void)
4084                     ; 859 {
4085                     	switch	.text
4086  0ae6               _CAN_GetReceivedDLC:
4090                     ; 860     return (_DLC);
4092  0ae6 c60006        	ld	a,__DLC
4095  0ae9 81            	ret
4130                     ; 872 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
4130                     ; 873 {
4131                     	switch	.text
4132  0aea               _CAN_GetReceivedData:
4134  0aea 88            	push	a
4135       00000000      OFST:	set	0
4138                     ; 874     assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
4140  0aeb a109          	cp	a,#9
4141  0aed 2403          	jruge	L672
4142  0aef 4f            	clr	a
4143  0af0 2010          	jra	L003
4144  0af2               L672:
4145  0af2 ae036a        	ldw	x,#874
4146  0af5 89            	pushw	x
4147  0af6 ae0000        	ldw	x,#0
4148  0af9 89            	pushw	x
4149  0afa ae0008        	ldw	x,#L572
4150  0afd cd0000        	call	_assert_failed
4152  0b00 5b04          	addw	sp,#4
4153  0b02               L003:
4154                     ; 875     return (_Data[CAN_DataIndex]);
4156  0b02 7b01          	ld	a,(OFST+1,sp)
4157  0b04 5f            	clrw	x
4158  0b05 97            	ld	xl,a
4159  0b06 d60007        	ld	a,(__Data,x)
4162  0b09 5b01          	addw	sp,#1
4163  0b0b 81            	ret
4187                     ; 886 uint8_t CAN_GetReceivedFMI(void)
4187                     ; 887 {
4188                     	switch	.text
4189  0b0c               _CAN_GetReceivedFMI:
4193                     ; 888     return (_FMI);
4195  0b0c c6000f        	ld	a,__FMI
4198  0b0f 81            	ret
4243                     ; 896 uint16_t CAN_GetMessageTimeStamp(void)
4243                     ; 897 {
4244                     	switch	.text
4245  0b10               _CAN_GetMessageTimeStamp:
4247  0b10 5203          	subw	sp,#3
4248       00000003      OFST:	set	3
4251                     ; 898     uint16_t timestamp = 0;
4253                     ; 899     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4255  0b12 cd1049        	call	_CAN_GetSelectedPage
4257  0b15 6b01          	ld	(OFST-2,sp),a
4258                     ; 902     CAN->PSR = CAN_Page_RxFifo;
4260  0b17 35075427      	mov	21543,#7
4261                     ; 904     timestamp = CAN->Page.RxFIFO.MTSRL;
4263  0b1b c65436        	ld	a,21558
4264  0b1e 5f            	clrw	x
4265  0b1f 97            	ld	xl,a
4266  0b20 1f02          	ldw	(OFST-1,sp),x
4267                     ; 905     timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
4269  0b22 c65437        	ld	a,21559
4270  0b25 5f            	clrw	x
4271  0b26 97            	ld	xl,a
4272  0b27 4f            	clr	a
4273  0b28 02            	rlwa	x,a
4274  0b29 01            	rrwa	x,a
4275  0b2a 1a03          	or	a,(OFST+0,sp)
4276  0b2c 01            	rrwa	x,a
4277  0b2d 1a02          	or	a,(OFST-1,sp)
4278  0b2f 01            	rrwa	x,a
4279  0b30 1f02          	ldw	(OFST-1,sp),x
4280                     ; 908     CAN_SelectPage(can_page);
4282  0b32 7b01          	ld	a,(OFST-2,sp)
4283  0b34 cd104d        	call	_CAN_SelectPage
4285                     ; 910     return (uint16_t)(timestamp);
4287  0b37 1e02          	ldw	x,(OFST-1,sp)
4290  0b39 5b03          	addw	sp,#3
4291  0b3b 81            	ret
4347                     ; 918 CAN_Sleep_TypeDef CAN_Sleep(void)
4347                     ; 919 {
4348                     	switch	.text
4349  0b3c               _CAN_Sleep:
4351  0b3c 88            	push	a
4352       00000001      OFST:	set	1
4355                     ; 921     CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4357  0b3d 0f01          	clr	(OFST+0,sp)
4358                     ; 924     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4360  0b3f c65420        	ld	a,21536
4361  0b42 a4fe          	and	a,#254
4362  0b44 aa02          	or	a,#2
4363  0b46 c75420        	ld	21536,a
4364                     ; 927     if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4366  0b49 c65421        	ld	a,21537
4367  0b4c a403          	and	a,#3
4368  0b4e a102          	cp	a,#2
4369  0b50 2604          	jrne	L7741
4370                     ; 930         sleepstatus =  CAN_Sleep_Ok;
4372  0b52 a601          	ld	a,#1
4373  0b54 6b01          	ld	(OFST+0,sp),a
4374  0b56               L7741:
4375                     ; 934     return (CAN_Sleep_TypeDef) sleepstatus;
4377  0b56 7b01          	ld	a,(OFST+0,sp)
4380  0b58 5b01          	addw	sp,#1
4381  0b5a 81            	ret
4437                     ; 942 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4437                     ; 943 {
4438                     	switch	.text
4439  0b5b               _CAN_WakeUp:
4441  0b5b 88            	push	a
4442       00000001      OFST:	set	1
4445                     ; 944     CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4447  0b5c 0f01          	clr	(OFST+0,sp)
4448                     ; 947     CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4450  0b5e 72135420      	bres	21536,#1
4451                     ; 950     if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4453  0b62 c65421        	ld	a,21537
4454  0b65 a402          	and	a,#2
4455  0b67 a102          	cp	a,#2
4456  0b69 2704          	jreq	L7251
4457                     ; 953         wakeupstatus = CAN_WakeUp_Ok;
4459  0b6b a601          	ld	a,#1
4460  0b6d 6b01          	ld	(OFST+0,sp),a
4461  0b6f               L7251:
4462                     ; 957     return (CAN_WakeUp_TypeDef)wakeupstatus;
4464  0b6f 7b01          	ld	a,(OFST+0,sp)
4467  0b71 5b01          	addw	sp,#1
4468  0b73 81            	ret
4572                     ; 969 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4572                     ; 970 {
4573                     	switch	.text
4574  0b74               _CAN_OperatingModeRequest:
4576  0b74 88            	push	a
4577  0b75 5203          	subw	sp,#3
4578       00000003      OFST:	set	3
4581                     ; 972     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4583  0b77 aeffff        	ldw	x,#65535
4584  0b7a 1f02          	ldw	(OFST-1,sp),x
4585                     ; 973     uint8_t modestatus = 0;
4587                     ; 975     assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4589  0b7c 4d            	tnz	a
4590  0b7d 2708          	jreq	L613
4591  0b7f a101          	cp	a,#1
4592  0b81 2704          	jreq	L613
4593  0b83 a102          	cp	a,#2
4594  0b85 2603          	jrne	L413
4595  0b87               L613:
4596  0b87 4f            	clr	a
4597  0b88 2010          	jra	L023
4598  0b8a               L413:
4599  0b8a ae03cf        	ldw	x,#975
4600  0b8d 89            	pushw	x
4601  0b8e ae0000        	ldw	x,#0
4602  0b91 89            	pushw	x
4603  0b92 ae0008        	ldw	x,#L572
4604  0b95 cd0000        	call	_assert_failed
4606  0b98 5b04          	addw	sp,#4
4607  0b9a               L023:
4608                     ; 977     if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4610  0b9a 0d04          	tnz	(OFST+1,sp)
4611  0b9c 2633          	jrne	L5751
4612                     ; 980         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4614  0b9e c65420        	ld	a,21536
4615  0ba1 a4fd          	and	a,#253
4616  0ba3 aa01          	or	a,#1
4617  0ba5 c75420        	ld	21536,a
4619  0ba8 2007          	jra	L3061
4620  0baa               L7751:
4621                     ; 985             timeout--;
4623  0baa 1e02          	ldw	x,(OFST-1,sp)
4624  0bac 1d0001        	subw	x,#1
4625  0baf 1f02          	ldw	(OFST-1,sp),x
4626  0bb1               L3061:
4627                     ; 983         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4629  0bb1 c65421        	ld	a,21537
4630  0bb4 a403          	and	a,#3
4631  0bb6 a101          	cp	a,#1
4632  0bb8 2704          	jreq	L7061
4634  0bba 1e02          	ldw	x,(OFST-1,sp)
4635  0bbc 26ec          	jrne	L7751
4636  0bbe               L7061:
4637                     ; 987         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4639  0bbe c65421        	ld	a,21537
4640  0bc1 a403          	and	a,#3
4641  0bc3 a101          	cp	a,#1
4642  0bc5 2704          	jreq	L1161
4643                     ; 989           modestatus = CAN_ModeStatus_Failed;
4645  0bc7 0f01          	clr	(OFST-2,sp)
4647  0bc9 2074          	jra	L5161
4648  0bcb               L1161:
4649                     ; 993           modestatus = CAN_ModeStatus_Success;  
4651  0bcb a601          	ld	a,#1
4652  0bcd 6b01          	ld	(OFST-2,sp),a
4653  0bcf 206e          	jra	L5161
4654  0bd1               L5751:
4655                     ; 997     else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4657  0bd1 7b04          	ld	a,(OFST+1,sp)
4658  0bd3 a101          	cp	a,#1
4659  0bd5 262d          	jrne	L7161
4660                     ; 1000         CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4662  0bd7 c65420        	ld	a,21536
4663  0bda a4fc          	and	a,#252
4664  0bdc c75420        	ld	21536,a
4666  0bdf 2007          	jra	L3261
4667  0be1               L1261:
4668                     ; 1005             timeout--;
4670  0be1 1e02          	ldw	x,(OFST-1,sp)
4671  0be3 1d0001        	subw	x,#1
4672  0be6 1f02          	ldw	(OFST-1,sp),x
4673  0be8               L3261:
4674                     ; 1003         while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4676  0be8 c65421        	ld	a,21537
4677  0beb a503          	bcp	a,#3
4678  0bed 2704          	jreq	L7261
4680  0bef 1e02          	ldw	x,(OFST-1,sp)
4681  0bf1 26ee          	jrne	L1261
4682  0bf3               L7261:
4683                     ; 1007         if ((CAN->MSR & CAN_MODE_MASK) != 0)
4685  0bf3 c65421        	ld	a,21537
4686  0bf6 a503          	bcp	a,#3
4687  0bf8 2704          	jreq	L1361
4688                     ; 1009           modestatus = CAN_ModeStatus_Failed;
4690  0bfa 0f01          	clr	(OFST-2,sp)
4692  0bfc 2041          	jra	L5161
4693  0bfe               L1361:
4694                     ; 1013           modestatus = CAN_ModeStatus_Success;  
4696  0bfe a601          	ld	a,#1
4697  0c00 6b01          	ld	(OFST-2,sp),a
4698  0c02 203b          	jra	L5161
4699  0c04               L7161:
4700                     ; 1016     else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4702  0c04 7b04          	ld	a,(OFST+1,sp)
4703  0c06 a102          	cp	a,#2
4704  0c08 2633          	jrne	L7361
4705                     ; 1019         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4707  0c0a c65420        	ld	a,21536
4708  0c0d a4fe          	and	a,#254
4709  0c0f aa02          	or	a,#2
4710  0c11 c75420        	ld	21536,a
4712  0c14 2007          	jra	L5461
4713  0c16               L1461:
4714                     ; 1024             timeout--;
4716  0c16 1e02          	ldw	x,(OFST-1,sp)
4717  0c18 1d0001        	subw	x,#1
4718  0c1b 1f02          	ldw	(OFST-1,sp),x
4719  0c1d               L5461:
4720                     ; 1022         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4722  0c1d c65421        	ld	a,21537
4723  0c20 a403          	and	a,#3
4724  0c22 a102          	cp	a,#2
4725  0c24 2704          	jreq	L1561
4727  0c26 1e02          	ldw	x,(OFST-1,sp)
4728  0c28 26ec          	jrne	L1461
4729  0c2a               L1561:
4730                     ; 1026         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4732  0c2a c65421        	ld	a,21537
4733  0c2d a403          	and	a,#3
4734  0c2f a102          	cp	a,#2
4735  0c31 2704          	jreq	L3561
4736                     ; 1028            modestatus = CAN_ModeStatus_Failed;  
4738  0c33 0f01          	clr	(OFST-2,sp)
4740  0c35 2008          	jra	L5161
4741  0c37               L3561:
4742                     ; 1032            modestatus = CAN_ModeStatus_Success;  
4744  0c37 a601          	ld	a,#1
4745  0c39 6b01          	ld	(OFST-2,sp),a
4746  0c3b 2002          	jra	L5161
4747  0c3d               L7361:
4748                     ; 1037          modestatus = CAN_ModeStatus_Failed;
4750  0c3d 0f01          	clr	(OFST-2,sp)
4751  0c3f               L5161:
4752                     ; 1039   return (CAN_ModeStatus_TypeDef)(modestatus);
4754  0c3f 7b01          	ld	a,(OFST-2,sp)
4757  0c41 5b04          	addw	sp,#4
4758  0c43 81            	ret
4877                     ; 1047 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
4877                     ; 1048 {
4878                     	switch	.text
4879  0c44               _CAN_GetLastErrorCode:
4881  0c44 89            	pushw	x
4882       00000002      OFST:	set	2
4885                     ; 1049     CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
4887                     ; 1050     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4889  0c45 cd1049        	call	_CAN_GetSelectedPage
4891  0c48 6b01          	ld	(OFST-1,sp),a
4892                     ; 1052     CAN->PSR = CAN_Page_Config;
4894  0c4a 35065427      	mov	21543,#6
4895                     ; 1053     errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
4897  0c4e c65428        	ld	a,21544
4898  0c51 a470          	and	a,#112
4899  0c53 6b02          	ld	(OFST+0,sp),a
4900                     ; 1056     CAN_SelectPage(can_page);
4902  0c55 7b01          	ld	a,(OFST-1,sp)
4903  0c57 cd104d        	call	_CAN_SelectPage
4905                     ; 1058     return (CAN_ErrorCode_TypeDef)(errcode);
4907  0c5a 7b02          	ld	a,(OFST+0,sp)
4910  0c5c 85            	popw	x
4911  0c5d 81            	ret
5042                     ; 1073 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
5042                     ; 1074 {
5043                     	switch	.text
5044  0c5e               _CAN_ClearFlag:
5046  0c5e 89            	pushw	x
5047  0c5f 88            	push	a
5048       00000001      OFST:	set	1
5051                     ; 1075     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5053                     ; 1077     assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
5055  0c60 a33401        	cpw	x,#13313
5056  0c63 271e          	jreq	L033
5057  0c65 a33402        	cpw	x,#13314
5058  0c68 2719          	jreq	L033
5059  0c6a a33404        	cpw	x,#13316
5060  0c6d 2714          	jreq	L033
5061  0c6f a33208        	cpw	x,#12808
5062  0c72 270f          	jreq	L033
5063  0c74 a33210        	cpw	x,#12816
5064  0c77 270a          	jreq	L033
5065  0c79 a33108        	cpw	x,#12552
5066  0c7c 2705          	jreq	L033
5067  0c7e a33070        	cpw	x,#12400
5068  0c81 2603          	jrne	L623
5069  0c83               L033:
5070  0c83 4f            	clr	a
5071  0c84 2010          	jra	L233
5072  0c86               L623:
5073  0c86 ae0435        	ldw	x,#1077
5074  0c89 89            	pushw	x
5075  0c8a ae0000        	ldw	x,#0
5076  0c8d 89            	pushw	x
5077  0c8e ae0008        	ldw	x,#L572
5078  0c91 cd0000        	call	_assert_failed
5080  0c94 5b04          	addw	sp,#4
5081  0c96               L233:
5082                     ; 1078     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5084  0c96 7b02          	ld	a,(OFST+1,sp)
5085  0c98 a507          	bcp	a,#7
5086  0c9a 2731          	jreq	L3002
5087                     ; 1080         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5089  0c9c 1e02          	ldw	x,(OFST+1,sp)
5090  0c9e 01            	rrwa	x,a
5091  0c9f a40b          	and	a,#11
5092  0ca1 01            	rrwa	x,a
5093  0ca2 a402          	and	a,#2
5094  0ca4 01            	rrwa	x,a
5095  0ca5 a30000        	cpw	x,#0
5096  0ca8 2707          	jreq	L5002
5097                     ; 1083             CAN->RFR = (uint8_t)(CAN_Flag);
5099  0caa 7b03          	ld	a,(OFST+2,sp)
5100  0cac c75424        	ld	21540,a
5102  0caf 202e          	jra	L5102
5103  0cb1               L5002:
5104                     ; 1085         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5106  0cb1 1e02          	ldw	x,(OFST+1,sp)
5107  0cb3 01            	rrwa	x,a
5108  0cb4 a403          	and	a,#3
5109  0cb6 01            	rrwa	x,a
5110  0cb7 a404          	and	a,#4
5111  0cb9 01            	rrwa	x,a
5112  0cba a30000        	cpw	x,#0
5113  0cbd 2707          	jreq	L1102
5114                     ; 1088             CAN->TSR = (uint8_t)(CAN_Flag);
5116  0cbf 7b03          	ld	a,(OFST+2,sp)
5117  0cc1 c75422        	ld	21538,a
5119  0cc4 2019          	jra	L5102
5120  0cc6               L1102:
5121                     ; 1093             CAN->MSR = (uint8_t)(CAN_Flag);
5123  0cc6 7b03          	ld	a,(OFST+2,sp)
5124  0cc8 c75421        	ld	21537,a
5125  0ccb 2012          	jra	L5102
5126  0ccd               L3002:
5127                     ; 1099         can_page = CAN_GetSelectedPage();
5129  0ccd cd1049        	call	_CAN_GetSelectedPage
5131  0cd0 6b01          	ld	(OFST+0,sp),a
5132                     ; 1102         CAN->PSR = CAN_Page_Config;
5134  0cd2 35065427      	mov	21543,#6
5135                     ; 1103         CAN->Page.Config.ESR = (uint8_t)RESET;
5137  0cd6 725f5428      	clr	21544
5138                     ; 1106         CAN_SelectPage(can_page);
5140  0cda 7b01          	ld	a,(OFST+0,sp)
5141  0cdc cd104d        	call	_CAN_SelectPage
5143  0cdf               L5102:
5144                     ; 1108 }
5147  0cdf 5b03          	addw	sp,#3
5148  0ce1 81            	ret
5227                     ; 1115 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
5227                     ; 1116 {
5228                     	switch	.text
5229  0ce2               _CAN_GetFlagStatus:
5231  0ce2 89            	pushw	x
5232  0ce3 89            	pushw	x
5233       00000002      OFST:	set	2
5236                     ; 1117     FlagStatus bitstatus = RESET;
5238                     ; 1118     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5240                     ; 1121     assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
5242  0ce4 a33401        	cpw	x,#13313
5243  0ce7 2732          	jreq	L043
5244  0ce9 a33402        	cpw	x,#13314
5245  0cec 272d          	jreq	L043
5246  0cee a33404        	cpw	x,#13316
5247  0cf1 2728          	jreq	L043
5248  0cf3 a31203        	cpw	x,#4611
5249  0cf6 2723          	jreq	L043
5250  0cf8 a33208        	cpw	x,#12808
5251  0cfb 271e          	jreq	L043
5252  0cfd a33210        	cpw	x,#12816
5253  0d00 2719          	jreq	L043
5254  0d02 a33108        	cpw	x,#12552
5255  0d05 2714          	jreq	L043
5256  0d07 a31001        	cpw	x,#4097
5257  0d0a 270f          	jreq	L043
5258  0d0c a31002        	cpw	x,#4098
5259  0d0f 270a          	jreq	L043
5260  0d11 a31004        	cpw	x,#4100
5261  0d14 2705          	jreq	L043
5262  0d16 a33070        	cpw	x,#12400
5263  0d19 2603          	jrne	L633
5264  0d1b               L043:
5265  0d1b 4f            	clr	a
5266  0d1c 2010          	jra	L243
5267  0d1e               L633:
5268  0d1e ae0461        	ldw	x,#1121
5269  0d21 89            	pushw	x
5270  0d22 ae0000        	ldw	x,#0
5271  0d25 89            	pushw	x
5272  0d26 ae0008        	ldw	x,#L572
5273  0d29 cd0000        	call	_assert_failed
5275  0d2c 5b04          	addw	sp,#4
5276  0d2e               L243:
5277                     ; 1123     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5279  0d2e 7b03          	ld	a,(OFST+1,sp)
5280  0d30 a507          	bcp	a,#7
5281  0d32 274f          	jreq	L5502
5282                     ; 1125         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5284  0d34 1e03          	ldw	x,(OFST+1,sp)
5285  0d36 01            	rrwa	x,a
5286  0d37 a40b          	and	a,#11
5287  0d39 01            	rrwa	x,a
5288  0d3a a402          	and	a,#2
5289  0d3c 01            	rrwa	x,a
5290  0d3d a30000        	cpw	x,#0
5291  0d40 2711          	jreq	L7502
5292                     ; 1128             if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
5294  0d42 c65424        	ld	a,21540
5295  0d45 1404          	and	a,(OFST+2,sp)
5296  0d47 2706          	jreq	L1602
5297                     ; 1131                 bitstatus = SET;
5299  0d49 a601          	ld	a,#1
5300  0d4b 6b02          	ld	(OFST+0,sp),a
5302  0d4d 2051          	jra	L3012
5303  0d4f               L1602:
5304                     ; 1136                 bitstatus = RESET;
5306  0d4f 0f02          	clr	(OFST+0,sp)
5307  0d51 204d          	jra	L3012
5308  0d53               L7502:
5309                     ; 1140         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5311  0d53 1e03          	ldw	x,(OFST+1,sp)
5312  0d55 01            	rrwa	x,a
5313  0d56 a403          	and	a,#3
5314  0d58 01            	rrwa	x,a
5315  0d59 a404          	and	a,#4
5316  0d5b 01            	rrwa	x,a
5317  0d5c a30000        	cpw	x,#0
5318  0d5f 2711          	jreq	L7602
5319                     ; 1143             if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
5321  0d61 c65422        	ld	a,21538
5322  0d64 1404          	and	a,(OFST+2,sp)
5323  0d66 2706          	jreq	L1702
5324                     ; 1146                 bitstatus = SET;
5326  0d68 a601          	ld	a,#1
5327  0d6a 6b02          	ld	(OFST+0,sp),a
5329  0d6c 2032          	jra	L3012
5330  0d6e               L1702:
5331                     ; 1151                 bitstatus = RESET;
5333  0d6e 0f02          	clr	(OFST+0,sp)
5334  0d70 202e          	jra	L3012
5335  0d72               L7602:
5336                     ; 1157             if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
5338  0d72 c65421        	ld	a,21537
5339  0d75 1404          	and	a,(OFST+2,sp)
5340  0d77 2706          	jreq	L7702
5341                     ; 1160                 bitstatus = SET;
5343  0d79 a601          	ld	a,#1
5344  0d7b 6b02          	ld	(OFST+0,sp),a
5346  0d7d 2021          	jra	L3012
5347  0d7f               L7702:
5348                     ; 1165                 bitstatus = RESET;
5350  0d7f 0f02          	clr	(OFST+0,sp)
5351  0d81 201d          	jra	L3012
5352  0d83               L5502:
5353                     ; 1172         can_page = CAN_GetSelectedPage();
5355  0d83 cd1049        	call	_CAN_GetSelectedPage
5357  0d86 6b01          	ld	(OFST-1,sp),a
5358                     ; 1174         CAN->PSR = CAN_Page_Config;
5360  0d88 35065427      	mov	21543,#6
5361                     ; 1175         if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
5363  0d8c c65428        	ld	a,21544
5364  0d8f 1404          	and	a,(OFST+2,sp)
5365  0d91 2706          	jreq	L5012
5366                     ; 1178             bitstatus = SET;
5368  0d93 a601          	ld	a,#1
5369  0d95 6b02          	ld	(OFST+0,sp),a
5371  0d97 2002          	jra	L7012
5372  0d99               L5012:
5373                     ; 1183             bitstatus = RESET;
5375  0d99 0f02          	clr	(OFST+0,sp)
5376  0d9b               L7012:
5377                     ; 1186         CAN_SelectPage(can_page);
5379  0d9b 7b01          	ld	a,(OFST-1,sp)
5380  0d9d cd104d        	call	_CAN_SelectPage
5382  0da0               L3012:
5383                     ; 1191     return  (FlagStatus)bitstatus;
5385  0da0 7b02          	ld	a,(OFST+0,sp)
5388  0da2 5b04          	addw	sp,#4
5389  0da4 81            	ret
5449                     ; 1199 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5449                     ; 1200 {
5450                     	switch	.text
5451  0da5               _CAN_GetITStatus:
5453  0da5 89            	pushw	x
5454  0da6 89            	pushw	x
5455       00000002      OFST:	set	2
5458                     ; 1201     ITStatus pendingbitstatus = RESET;
5460                     ; 1202     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5462  0da7 cd1049        	call	_CAN_GetSelectedPage
5464  0daa 6b01          	ld	(OFST-1,sp),a
5465                     ; 1205     assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5467  0dac 1e03          	ldw	x,(OFST+1,sp)
5468  0dae a30001        	cpw	x,#1
5469  0db1 273f          	jreq	L053
5470  0db3 1e03          	ldw	x,(OFST+1,sp)
5471  0db5 a30002        	cpw	x,#2
5472  0db8 2738          	jreq	L053
5473  0dba 1e03          	ldw	x,(OFST+1,sp)
5474  0dbc a30004        	cpw	x,#4
5475  0dbf 2731          	jreq	L053
5476  0dc1 1e03          	ldw	x,(OFST+1,sp)
5477  0dc3 a30008        	cpw	x,#8
5478  0dc6 272a          	jreq	L053
5479  0dc8 1e03          	ldw	x,(OFST+1,sp)
5480  0dca a30080        	cpw	x,#128
5481  0dcd 2723          	jreq	L053
5482  0dcf 1e03          	ldw	x,(OFST+1,sp)
5483  0dd1 a34000        	cpw	x,#16384
5484  0dd4 271c          	jreq	L053
5485  0dd6 1e03          	ldw	x,(OFST+1,sp)
5486  0dd8 a30100        	cpw	x,#256
5487  0ddb 2715          	jreq	L053
5488  0ddd 1e03          	ldw	x,(OFST+1,sp)
5489  0ddf a30200        	cpw	x,#512
5490  0de2 270e          	jreq	L053
5491  0de4 1e03          	ldw	x,(OFST+1,sp)
5492  0de6 a30400        	cpw	x,#1024
5493  0de9 2707          	jreq	L053
5494  0deb 1e03          	ldw	x,(OFST+1,sp)
5495  0ded a30800        	cpw	x,#2048
5496  0df0 2603          	jrne	L643
5497  0df2               L053:
5498  0df2 4f            	clr	a
5499  0df3 2010          	jra	L253
5500  0df5               L643:
5501  0df5 ae04b5        	ldw	x,#1205
5502  0df8 89            	pushw	x
5503  0df9 ae0000        	ldw	x,#0
5504  0dfc 89            	pushw	x
5505  0dfd ae0008        	ldw	x,#L572
5506  0e00 cd0000        	call	_assert_failed
5508  0e03 5b04          	addw	sp,#4
5509  0e05               L253:
5510                     ; 1208     switch (CAN_IT)
5512  0e05 1e03          	ldw	x,(OFST+1,sp)
5514                     ; 1321         break;
5515  0e07 5a            	decw	x
5516  0e08 2746          	jreq	L1112
5517  0e0a 5a            	decw	x
5518  0e0b 2760          	jreq	L3112
5519  0e0d 1d0002        	subw	x,#2
5520  0e10 2778          	jreq	L5112
5521  0e12 1d0004        	subw	x,#4
5522  0e15 2603          	jrne	L453
5523  0e17 cc0ea7        	jp	L7112
5524  0e1a               L453:
5525  0e1a 1d0078        	subw	x,#120
5526  0e1d 2603          	jrne	L653
5527  0e1f cc0ec4        	jp	L1212
5528  0e22               L653:
5529  0e22 1d0080        	subw	x,#128
5530  0e25 2603          	jrne	L063
5531  0e27 cc0efe        	jp	L5212
5532  0e2a               L063:
5533  0e2a 1d0100        	subw	x,#256
5534  0e2d 2603          	jrne	L263
5535  0e2f cc0f1b        	jp	L7212
5536  0e32               L263:
5537  0e32 1d0200        	subw	x,#512
5538  0e35 2603          	jrne	L463
5539  0e37 cc0f38        	jp	L1312
5540  0e3a               L463:
5541  0e3a 1d0400        	subw	x,#1024
5542  0e3d 2603          	jrne	L663
5543  0e3f cc0f55        	jp	L3312
5544  0e42               L663:
5545  0e42 1d3800        	subw	x,#14336
5546  0e45 2603          	jrne	L073
5547  0e47 cc0ee1        	jp	L3212
5548  0e4a               L073:
5549  0e4a               L5312:
5550                     ; 1319     default :
5550                     ; 1320         pendingbitstatus = RESET;
5552  0e4a 0f02          	clr	(OFST+0,sp)
5553                     ; 1321         break;
5555  0e4c ac700f70      	jpf	L7612
5556  0e50               L1112:
5557                     ; 1210     case CAN_IT_TME:
5557                     ; 1211         if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5559  0e50 c65425        	ld	a,21541
5560  0e53 a501          	bcp	a,#1
5561  0e55 2710          	jreq	L1712
5562                     ; 1213             pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5564  0e57 ae0007        	ldw	x,#7
5565  0e5a c65422        	ld	a,21538
5566  0e5d 95            	ld	xh,a
5567  0e5e cd1051        	call	L3_CheckITStatus
5569  0e61 6b02          	ld	(OFST+0,sp),a
5571  0e63 ac700f70      	jpf	L7612
5572  0e67               L1712:
5573                     ; 1217             pendingbitstatus = RESET;
5575  0e67 0f02          	clr	(OFST+0,sp)
5576  0e69 ac700f70      	jpf	L7612
5577  0e6d               L3112:
5578                     ; 1221     case CAN_IT_FMP:
5578                     ; 1222         if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5580  0e6d c65425        	ld	a,21541
5581  0e70 a502          	bcp	a,#2
5582  0e72 2710          	jreq	L5712
5583                     ; 1224             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5585  0e74 ae0003        	ldw	x,#3
5586  0e77 c65424        	ld	a,21540
5587  0e7a 95            	ld	xh,a
5588  0e7b cd1051        	call	L3_CheckITStatus
5590  0e7e 6b02          	ld	(OFST+0,sp),a
5592  0e80 ac700f70      	jpf	L7612
5593  0e84               L5712:
5594                     ; 1228             pendingbitstatus = RESET;
5596  0e84 0f02          	clr	(OFST+0,sp)
5597  0e86 ac700f70      	jpf	L7612
5598  0e8a               L5112:
5599                     ; 1231     case CAN_IT_FF:
5599                     ; 1232         if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5601  0e8a c65425        	ld	a,21541
5602  0e8d a504          	bcp	a,#4
5603  0e8f 2710          	jreq	L1022
5604                     ; 1234             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5606  0e91 ae0008        	ldw	x,#8
5607  0e94 c65424        	ld	a,21540
5608  0e97 95            	ld	xh,a
5609  0e98 cd1051        	call	L3_CheckITStatus
5611  0e9b 6b02          	ld	(OFST+0,sp),a
5613  0e9d ac700f70      	jpf	L7612
5614  0ea1               L1022:
5615                     ; 1238             pendingbitstatus = RESET;
5617  0ea1 0f02          	clr	(OFST+0,sp)
5618  0ea3 ac700f70      	jpf	L7612
5619  0ea7               L7112:
5620                     ; 1241     case CAN_IT_FOV:
5620                     ; 1242         if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5622  0ea7 c65425        	ld	a,21541
5623  0eaa a508          	bcp	a,#8
5624  0eac 2710          	jreq	L5022
5625                     ; 1244             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5627  0eae ae0010        	ldw	x,#16
5628  0eb1 c65424        	ld	a,21540
5629  0eb4 95            	ld	xh,a
5630  0eb5 cd1051        	call	L3_CheckITStatus
5632  0eb8 6b02          	ld	(OFST+0,sp),a
5634  0eba ac700f70      	jpf	L7612
5635  0ebe               L5022:
5636                     ; 1248             pendingbitstatus = RESET;
5638  0ebe 0f02          	clr	(OFST+0,sp)
5639  0ec0 ac700f70      	jpf	L7612
5640  0ec4               L1212:
5641                     ; 1251     case CAN_IT_WKU:
5641                     ; 1252         if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5643  0ec4 c65425        	ld	a,21541
5644  0ec7 a580          	bcp	a,#128
5645  0ec9 2710          	jreq	L1122
5646                     ; 1254             pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5648  0ecb ae0008        	ldw	x,#8
5649  0ece c65421        	ld	a,21537
5650  0ed1 95            	ld	xh,a
5651  0ed2 cd1051        	call	L3_CheckITStatus
5653  0ed5 6b02          	ld	(OFST+0,sp),a
5655  0ed7 ac700f70      	jpf	L7612
5656  0edb               L1122:
5657                     ; 1258             pendingbitstatus = RESET;
5659  0edb 0f02          	clr	(OFST+0,sp)
5660  0edd ac700f70      	jpf	L7612
5661  0ee1               L3212:
5662                     ; 1262     case CAN_IT_ERR:
5662                     ; 1263         CAN->PSR = CAN_Page_Config;
5664  0ee1 35065427      	mov	21543,#6
5665                     ; 1264         if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5667  0ee5 c65429        	ld	a,21545
5668  0ee8 a580          	bcp	a,#128
5669  0eea 270e          	jreq	L5122
5670                     ; 1266             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5672  0eec ae0077        	ldw	x,#119
5673  0eef c65428        	ld	a,21544
5674  0ef2 95            	ld	xh,a
5675  0ef3 cd1051        	call	L3_CheckITStatus
5677  0ef6 6b02          	ld	(OFST+0,sp),a
5679  0ef8 2076          	jra	L7612
5680  0efa               L5122:
5681                     ; 1270             pendingbitstatus = RESET;
5683  0efa 0f02          	clr	(OFST+0,sp)
5684  0efc 2072          	jra	L7612
5685  0efe               L5212:
5686                     ; 1274     case CAN_IT_EWG:
5686                     ; 1275         CAN->PSR = CAN_Page_Config;
5688  0efe 35065427      	mov	21543,#6
5689                     ; 1276         if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5691  0f02 c65429        	ld	a,21545
5692  0f05 a501          	bcp	a,#1
5693  0f07 270e          	jreq	L1222
5694                     ; 1278             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5696  0f09 ae0001        	ldw	x,#1
5697  0f0c c65428        	ld	a,21544
5698  0f0f 95            	ld	xh,a
5699  0f10 cd1051        	call	L3_CheckITStatus
5701  0f13 6b02          	ld	(OFST+0,sp),a
5703  0f15 2059          	jra	L7612
5704  0f17               L1222:
5705                     ; 1282             pendingbitstatus = RESET;
5707  0f17 0f02          	clr	(OFST+0,sp)
5708  0f19 2055          	jra	L7612
5709  0f1b               L7212:
5710                     ; 1286     case CAN_IT_EPV:
5710                     ; 1287         CAN->PSR = CAN_Page_Config;
5712  0f1b 35065427      	mov	21543,#6
5713                     ; 1288         if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5715  0f1f c65429        	ld	a,21545
5716  0f22 a502          	bcp	a,#2
5717  0f24 270e          	jreq	L5222
5718                     ; 1290             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5720  0f26 ae0002        	ldw	x,#2
5721  0f29 c65428        	ld	a,21544
5722  0f2c 95            	ld	xh,a
5723  0f2d cd1051        	call	L3_CheckITStatus
5725  0f30 6b02          	ld	(OFST+0,sp),a
5727  0f32 203c          	jra	L7612
5728  0f34               L5222:
5729                     ; 1294             pendingbitstatus = RESET;
5731  0f34 0f02          	clr	(OFST+0,sp)
5732  0f36 2038          	jra	L7612
5733  0f38               L1312:
5734                     ; 1297     case CAN_IT_BOF:
5734                     ; 1298         CAN->PSR = CAN_Page_Config;
5736  0f38 35065427      	mov	21543,#6
5737                     ; 1299         if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5739  0f3c c65429        	ld	a,21545
5740  0f3f a504          	bcp	a,#4
5741  0f41 270e          	jreq	L1322
5742                     ; 1301             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5744  0f43 ae0004        	ldw	x,#4
5745  0f46 c65428        	ld	a,21544
5746  0f49 95            	ld	xh,a
5747  0f4a cd1051        	call	L3_CheckITStatus
5749  0f4d 6b02          	ld	(OFST+0,sp),a
5751  0f4f 201f          	jra	L7612
5752  0f51               L1322:
5753                     ; 1305             pendingbitstatus = RESET;
5755  0f51 0f02          	clr	(OFST+0,sp)
5756  0f53 201b          	jra	L7612
5757  0f55               L3312:
5758                     ; 1308     case CAN_IT_LEC:
5758                     ; 1309         CAN->PSR = CAN_Page_Config;
5760  0f55 35065427      	mov	21543,#6
5761                     ; 1310         if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5763  0f59 c65429        	ld	a,21545
5764  0f5c a510          	bcp	a,#16
5765  0f5e 270e          	jreq	L5322
5766                     ; 1312             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5768  0f60 ae0070        	ldw	x,#112
5769  0f63 c65428        	ld	a,21544
5770  0f66 95            	ld	xh,a
5771  0f67 cd1051        	call	L3_CheckITStatus
5773  0f6a 6b02          	ld	(OFST+0,sp),a
5775  0f6c 2002          	jra	L7612
5776  0f6e               L5322:
5777                     ; 1316             pendingbitstatus = RESET;
5779  0f6e 0f02          	clr	(OFST+0,sp)
5780  0f70               L7612:
5781                     ; 1324     CAN_SelectPage(can_page);
5783  0f70 7b01          	ld	a,(OFST-1,sp)
5784  0f72 cd104d        	call	_CAN_SelectPage
5786                     ; 1326     return  (ITStatus)pendingbitstatus;
5788  0f75 7b02          	ld	a,(OFST+0,sp)
5791  0f77 5b04          	addw	sp,#4
5792  0f79 81            	ret
5841                     ; 1344 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
5841                     ; 1345 {
5842                     	switch	.text
5843  0f7a               _CAN_ClearITPendingBit:
5845  0f7a 89            	pushw	x
5846  0f7b 88            	push	a
5847       00000001      OFST:	set	1
5850                     ; 1346     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5852  0f7c cd1049        	call	_CAN_GetSelectedPage
5854  0f7f 6b01          	ld	(OFST+0,sp),a
5855                     ; 1348     assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
5857  0f81 1e02          	ldw	x,(OFST+1,sp)
5858  0f83 a30001        	cpw	x,#1
5859  0f86 2738          	jreq	L673
5860  0f88 1e02          	ldw	x,(OFST+1,sp)
5861  0f8a a30004        	cpw	x,#4
5862  0f8d 2731          	jreq	L673
5863  0f8f 1e02          	ldw	x,(OFST+1,sp)
5864  0f91 a30008        	cpw	x,#8
5865  0f94 272a          	jreq	L673
5866  0f96 1e02          	ldw	x,(OFST+1,sp)
5867  0f98 a30080        	cpw	x,#128
5868  0f9b 2723          	jreq	L673
5869  0f9d 1e02          	ldw	x,(OFST+1,sp)
5870  0f9f a34000        	cpw	x,#16384
5871  0fa2 271c          	jreq	L673
5872  0fa4 1e02          	ldw	x,(OFST+1,sp)
5873  0fa6 a30100        	cpw	x,#256
5874  0fa9 2715          	jreq	L673
5875  0fab 1e02          	ldw	x,(OFST+1,sp)
5876  0fad a30200        	cpw	x,#512
5877  0fb0 270e          	jreq	L673
5878  0fb2 1e02          	ldw	x,(OFST+1,sp)
5879  0fb4 a30400        	cpw	x,#1024
5880  0fb7 2707          	jreq	L673
5881  0fb9 1e02          	ldw	x,(OFST+1,sp)
5882  0fbb a30800        	cpw	x,#2048
5883  0fbe 2603          	jrne	L473
5884  0fc0               L673:
5885  0fc0 4f            	clr	a
5886  0fc1 2010          	jra	L004
5887  0fc3               L473:
5888  0fc3 ae0544        	ldw	x,#1348
5889  0fc6 89            	pushw	x
5890  0fc7 ae0000        	ldw	x,#0
5891  0fca 89            	pushw	x
5892  0fcb ae0008        	ldw	x,#L572
5893  0fce cd0000        	call	_assert_failed
5895  0fd1 5b04          	addw	sp,#4
5896  0fd3               L004:
5897                     ; 1350     switch (CAN_IT)
5899  0fd3 1e02          	ldw	x,(OFST+1,sp)
5901                     ; 1393     default :
5901                     ; 1394         break;
5902  0fd5 5a            	decw	x
5903  0fd6 272a          	jreq	L1422
5904  0fd8 1d0003        	subw	x,#3
5905  0fdb 272b          	jreq	L3422
5906  0fdd 1d0004        	subw	x,#4
5907  0fe0 272c          	jreq	L5422
5908  0fe2 1d0078        	subw	x,#120
5909  0fe5 272d          	jreq	L7422
5910  0fe7 1d0080        	subw	x,#128
5911  0fea 273c          	jreq	L3522
5912  0fec 1d0100        	subw	x,#256
5913  0fef 273d          	jreq	L5522
5914  0ff1 1d0200        	subw	x,#512
5915  0ff4 273e          	jreq	L7522
5916  0ff6 1d0400        	subw	x,#1024
5917  0ff9 273f          	jreq	L1622
5918  0ffb 1d3800        	subw	x,#14336
5919  0ffe 271a          	jreq	L1522
5920  1000 2040          	jra	L1132
5921  1002               L1422:
5922                     ; 1352     case CAN_IT_TME:
5922                     ; 1353         CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
5924  1002 35075422      	mov	21538,#7
5925                     ; 1354         break;
5927  1006 203a          	jra	L1132
5928  1008               L3422:
5929                     ; 1356     case CAN_IT_FF:
5929                     ; 1357         CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
5931  1008 35085424      	mov	21540,#8
5932                     ; 1358         break;
5934  100c 2034          	jra	L1132
5935  100e               L5422:
5936                     ; 1360     case CAN_IT_FOV:
5936                     ; 1361         CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
5938  100e 35105424      	mov	21540,#16
5939                     ; 1362         break;
5941  1012 202e          	jra	L1132
5942  1014               L7422:
5943                     ; 1364     case CAN_IT_WKU:
5943                     ; 1365         CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
5945  1014 35085421      	mov	21537,#8
5946                     ; 1366         break;
5948  1018 2028          	jra	L1132
5949  101a               L1522:
5950                     ; 1368     case CAN_IT_ERR:
5950                     ; 1369         CAN->PSR = CAN_Page_Config;
5952  101a 35065427      	mov	21543,#6
5953                     ; 1370         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5955  101e 725f5428      	clr	21544
5956                     ; 1371         CAN->MSR = CAN_MSR_ERRI;
5958  1022 35045421      	mov	21537,#4
5959                     ; 1372         break;
5961  1026 201a          	jra	L1132
5962  1028               L3522:
5963                     ; 1374     case CAN_IT_EWG:
5963                     ; 1375         CAN->MSR = CAN_MSR_ERRI;
5965  1028 35045421      	mov	21537,#4
5966                     ; 1376         break;
5968  102c 2014          	jra	L1132
5969  102e               L5522:
5970                     ; 1378     case CAN_IT_EPV:
5970                     ; 1379         CAN->MSR = CAN_MSR_ERRI;
5972  102e 35045421      	mov	21537,#4
5973                     ; 1380         break;
5975  1032 200e          	jra	L1132
5976  1034               L7522:
5977                     ; 1382     case CAN_IT_BOF:
5977                     ; 1383         CAN->MSR = CAN_MSR_ERRI;
5979  1034 35045421      	mov	21537,#4
5980                     ; 1384         break;
5982  1038 2008          	jra	L1132
5983  103a               L1622:
5984                     ; 1386     case CAN_IT_LEC:
5984                     ; 1387         CAN->PSR = CAN_Page_Config;
5986  103a 35065427      	mov	21543,#6
5987                     ; 1388         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
5989  103e 725f5428      	clr	21544
5990                     ; 1389         break;
5992  1042               L3622:
5993                     ; 1393     default :
5993                     ; 1394         break;
5995  1042               L1132:
5996                     ; 1397     CAN_SelectPage(can_page);
5998  1042 7b01          	ld	a,(OFST+0,sp)
5999  1044 ad07          	call	_CAN_SelectPage
6001                     ; 1398 }
6004  1046 5b03          	addw	sp,#3
6005  1048 81            	ret
6030                     ; 1405 CAN_Page_TypeDef CAN_GetSelectedPage(void)
6030                     ; 1406 {
6031                     	switch	.text
6032  1049               _CAN_GetSelectedPage:
6036                     ; 1407     return (CAN_Page_TypeDef)(CAN->PSR);
6038  1049 c65427        	ld	a,21543
6041  104c 81            	ret
6076                     ; 1415 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
6076                     ; 1416 {
6077                     	switch	.text
6078  104d               _CAN_SelectPage:
6082                     ; 1417     CAN->PSR = (uint8_t)CAN_Page;
6084  104d c75427        	ld	21543,a
6085                     ; 1418 }
6088  1050 81            	ret
6138                     ; 1426 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
6138                     ; 1427 {
6139                     	switch	.text
6140  1051               L3_CheckITStatus:
6142  1051 89            	pushw	x
6143  1052 88            	push	a
6144       00000001      OFST:	set	1
6147                     ; 1428     ITStatus pendingbitstatus = RESET;
6149                     ; 1429     if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
6151  1053 9f            	ld	a,xl
6152  1054 1402          	and	a,(OFST+1,sp)
6153  1056 2706          	jreq	L3632
6154                     ; 1432         pendingbitstatus = SET;
6156  1058 a601          	ld	a,#1
6157  105a 6b01          	ld	(OFST+0,sp),a
6159  105c 2002          	jra	L5632
6160  105e               L3632:
6161                     ; 1437         pendingbitstatus = RESET;
6163  105e 0f01          	clr	(OFST+0,sp)
6164  1060               L5632:
6165                     ; 1439     return (ITStatus)pendingbitstatus;
6167  1060 7b01          	ld	a,(OFST+0,sp)
6170  1062 5b03          	addw	sp,#3
6171  1064 81            	ret
6241                     	xdef	__FMI
6242                     	xdef	__Data
6243                     	xdef	__DLC
6244                     	xdef	__RTR
6245                     	xdef	__IDE
6246                     	xdef	__Id
6247                     	xdef	_CAN_ClearITPendingBit
6248                     	xdef	_CAN_GetITStatus
6249                     	xdef	_CAN_ClearFlag
6250                     	xdef	_CAN_GetFlagStatus
6251                     	xdef	_CAN_SelectPage
6252                     	xdef	_CAN_GetSelectedPage
6253                     	xdef	_CAN_GetLastErrorCode
6254                     	xdef	_CAN_OperatingModeRequest
6255                     	xdef	_CAN_WakeUp
6256                     	xdef	_CAN_Sleep
6257                     	xdef	_CAN_GetMessageTimeStamp
6258                     	xdef	_CAN_GetReceivedFMI
6259                     	xdef	_CAN_GetReceivedData
6260                     	xdef	_CAN_GetReceivedDLC
6261                     	xdef	_CAN_GetReceivedRTR
6262                     	xdef	_CAN_GetReceivedIDE
6263                     	xdef	_CAN_GetReceivedId
6264                     	xdef	_CAN_Receive
6265                     	xdef	_CAN_MessagePending
6266                     	xdef	_CAN_FIFORelease
6267                     	xdef	_CAN_CancelTransmit
6268                     	xdef	_CAN_TransmitStatus
6269                     	xdef	_CAN_TTComModeCmd
6270                     	xdef	_CAN_Transmit
6271                     	xdef	_CAN_ST7CompatibilityCmd
6272                     	xdef	_CAN_ITConfig
6273                     	xdef	_CAN_FilterInit
6274                     	xdef	_CAN_Init
6275                     	xdef	_CAN_DeInit
6276                     	xref	_assert_failed
6277                     	switch	.const
6278  0008               L572:
6279  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_c"
6280  001a 616e2e6300    	dc.b	"an.c",0
6281                     	xref.b	c_lreg
6282                     	xref.b	c_x
6283                     	xref.b	c_y
6303                     	xref	c_uitol
6304                     	xref	c_uitolx
6305                     	xref	c_llsh
6306                     	xref	c_umul
6307                     	xref	c_lor
6308                     	xref	c_rtol
6309                     	xref	c_lursh
6310                     	xref	c_lgursh
6311                     	xref	c_lcmp
6312                     	xref	c_ltor
6313                     	end

   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  16                     	bsct
  17  0000               __Id:
  18  0000 00000000      	dc.l	0
  19  0004               __IDE:
  20  0004 00            	dc.b	0
  21  0005               __RTR:
  22  0005 00            	dc.b	0
  23  0006               __DLC:
  24  0006 00            	dc.b	0
  25  0007               __Data:
  26  0007 00            	dc.b	0
  27  0008 000000000000  	ds.b	7
  28  000f               __FMI:
  29  000f 00            	dc.b	0
  59                     ; 56 void CAN_DeInit(void)
  59                     ; 57 {
  61                     	switch	.text
  62  0000               _CAN_DeInit:
  66                     ; 59     CAN->MCR = CAN_MCR_INRQ;
  68  0000 35015420      	mov	21536,#1
  69                     ; 60     CAN->PSR = CAN_Page_Config;
  71  0004 35065427      	mov	21543,#6
  72                     ; 61     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  74  0008 4f            	clr	a
  75  0009 cd0b6a        	call	_CAN_OperatingModeRequest
  77                     ; 62     CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  79  000c 725f5428      	clr	21544
  80                     ; 63     CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  82  0010 725f5429      	clr	21545
  83                     ; 64     CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  85  0014 3540542c      	mov	21548,#64
  86                     ; 65     CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  88  0018 3523542d      	mov	21549,#35
  89                     ; 66     CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  91  001c 725f5430      	clr	21552
  92                     ; 67     CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  94  0020 725f5431      	clr	21553
  95                     ; 68     CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  97  0024 725f5432      	clr	21554
  98                     ; 69     CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
 100  0028 725f5433      	clr	21555
 101                     ; 70     CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
 103  002c 725f5434      	clr	21556
 104                     ; 71     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
 106  0030 a601          	ld	a,#1
 107  0032 cd0b6a        	call	_CAN_OperatingModeRequest
 109                     ; 72     CAN->PSR = CAN_Page_RxFifo;
 111  0035 35075427      	mov	21543,#7
 112                     ; 73     CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 114  0039 725f5429      	clr	21545
 115                     ; 74     CAN->PSR = CAN_Page_TxMailBox0;
 117  003d 725f5427      	clr	21543
 118                     ; 75     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 120  0041 725f5429      	clr	21545
 121                     ; 76     CAN->PSR = CAN_Page_TxMailBox1;
 123  0045 35015427      	mov	21543,#1
 124                     ; 77     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 126  0049 725f5429      	clr	21545
 127                     ; 78     CAN->PSR = CAN_Page_TxMailBox2;
 129  004d 35055427      	mov	21543,#5
 130                     ; 79     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 132  0051 725f5429      	clr	21545
 133                     ; 81     CAN->MCR = CAN_MCR_RESET_VALUE;
 135  0055 35025420      	mov	21536,#2
 136                     ; 82     CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 138  0059 35fd5421      	mov	21537,#253
 139                     ; 83     CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 141  005d 35ff5422      	mov	21538,#255
 142                     ; 84     CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 144  0061 35ff5424      	mov	21540,#255
 145                     ; 85     CAN->IER = CAN_IER_RESET_VALUE;
 147  0065 725f5425      	clr	21541
 148                     ; 86     CAN->DGR = CAN_DGR_RESET_VALUE;
 150  0069 350c5426      	mov	21542,#12
 151                     ; 87     CAN->PSR = CAN_PSR_RESET_VALUE;
 153  006d 725f5427      	clr	21543
 154                     ; 88 }
 157  0071 81            	ret
 708                     ; 100 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 708                     ; 101                                 CAN_Mode_TypeDef CAN_Mode,
 708                     ; 102                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 708                     ; 103                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 708                     ; 104                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 708                     ; 105                                 uint8_t CAN_Prescaler)
 708                     ; 106 {
 709                     	switch	.text
 710  0072               _CAN_Init:
 712  0072 89            	pushw	x
 713  0073 5204          	subw	sp,#4
 714       00000004      OFST:	set	4
 717                     ; 107     CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 719                     ; 108     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 721  0075 aeffff        	ldw	x,#65535
 722  0078 1f03          	ldw	(OFST-1,sp),x
 723                     ; 109     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 725  007a cd103f        	call	_CAN_GetSelectedPage
 727  007d 6b01          	ld	(OFST-3,sp),a
 728                     ; 113     assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 730  007f 0d05          	tnz	(OFST+1,sp)
 731  0081 270c          	jreq	L21
 732  0083 7b05          	ld	a,(OFST+1,sp)
 733  0085 a1fd          	cp	a,#253
 734  0087 2409          	jruge	L01
 735  0089 7b05          	ld	a,(OFST+1,sp)
 736  008b a104          	cp	a,#4
 737  008d 2503          	jrult	L01
 738  008f               L21:
 739  008f 4f            	clr	a
 740  0090 2010          	jra	L41
 741  0092               L01:
 742  0092 ae0071        	ldw	x,#113
 743  0095 89            	pushw	x
 744  0096 ae0000        	ldw	x,#0
 745  0099 89            	pushw	x
 746  009a ae0008        	ldw	x,#L103
 747  009d cd0000        	call	_assert_failed
 749  00a0 5b04          	addw	sp,#4
 750  00a2               L41:
 751                     ; 114     assert_param(IS_CAN_MODE_OK(CAN_Mode));
 753  00a2 0d06          	tnz	(OFST+2,sp)
 754  00a4 2712          	jreq	L02
 755  00a6 7b06          	ld	a,(OFST+2,sp)
 756  00a8 a101          	cp	a,#1
 757  00aa 270c          	jreq	L02
 758  00ac 7b06          	ld	a,(OFST+2,sp)
 759  00ae a102          	cp	a,#2
 760  00b0 2706          	jreq	L02
 761  00b2 7b06          	ld	a,(OFST+2,sp)
 762  00b4 a103          	cp	a,#3
 763  00b6 2603          	jrne	L61
 764  00b8               L02:
 765  00b8 4f            	clr	a
 766  00b9 2010          	jra	L22
 767  00bb               L61:
 768  00bb ae0072        	ldw	x,#114
 769  00be 89            	pushw	x
 770  00bf ae0000        	ldw	x,#0
 771  00c2 89            	pushw	x
 772  00c3 ae0008        	ldw	x,#L103
 773  00c6 cd0000        	call	_assert_failed
 775  00c9 5b04          	addw	sp,#4
 776  00cb               L22:
 777                     ; 115     assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 779  00cb 0d09          	tnz	(OFST+5,sp)
 780  00cd 2712          	jreq	L62
 781  00cf 7b09          	ld	a,(OFST+5,sp)
 782  00d1 a140          	cp	a,#64
 783  00d3 270c          	jreq	L62
 784  00d5 7b09          	ld	a,(OFST+5,sp)
 785  00d7 a180          	cp	a,#128
 786  00d9 2706          	jreq	L62
 787  00db 7b09          	ld	a,(OFST+5,sp)
 788  00dd a1c0          	cp	a,#192
 789  00df 2603          	jrne	L42
 790  00e1               L62:
 791  00e1 4f            	clr	a
 792  00e2 2010          	jra	L03
 793  00e4               L42:
 794  00e4 ae0073        	ldw	x,#115
 795  00e7 89            	pushw	x
 796  00e8 ae0000        	ldw	x,#0
 797  00eb 89            	pushw	x
 798  00ec ae0008        	ldw	x,#L103
 799  00ef cd0000        	call	_assert_failed
 801  00f2 5b04          	addw	sp,#4
 802  00f4               L03:
 803                     ; 116     assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 805  00f4 7b0a          	ld	a,(OFST+6,sp)
 806  00f6 a110          	cp	a,#16
 807  00f8 2403          	jruge	L23
 808  00fa 4f            	clr	a
 809  00fb 2010          	jra	L43
 810  00fd               L23:
 811  00fd ae0074        	ldw	x,#116
 812  0100 89            	pushw	x
 813  0101 ae0000        	ldw	x,#0
 814  0104 89            	pushw	x
 815  0105 ae0008        	ldw	x,#L103
 816  0108 cd0000        	call	_assert_failed
 818  010b 5b04          	addw	sp,#4
 819  010d               L43:
 820                     ; 117     assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 822  010d 7b0b          	ld	a,(OFST+7,sp)
 823  010f a110          	cp	a,#16
 824  0111 2506          	jrult	L24
 825  0113 7b0b          	ld	a,(OFST+7,sp)
 826  0115 a171          	cp	a,#113
 827  0117 2504          	jrult	L04
 828  0119               L24:
 829  0119 0d0b          	tnz	(OFST+7,sp)
 830  011b 2603          	jrne	L63
 831  011d               L04:
 832  011d 4f            	clr	a
 833  011e 2010          	jra	L44
 834  0120               L63:
 835  0120 ae0075        	ldw	x,#117
 836  0123 89            	pushw	x
 837  0124 ae0000        	ldw	x,#0
 838  0127 89            	pushw	x
 839  0128 ae0008        	ldw	x,#L103
 840  012b cd0000        	call	_assert_failed
 842  012e 5b04          	addw	sp,#4
 843  0130               L44:
 844                     ; 118     assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 846  0130 0d0c          	tnz	(OFST+8,sp)
 847  0132 2709          	jreq	L64
 848  0134 7b0c          	ld	a,(OFST+8,sp)
 849  0136 a141          	cp	a,#65
 850  0138 2403          	jruge	L64
 851  013a 4f            	clr	a
 852  013b 2010          	jra	L05
 853  013d               L64:
 854  013d ae0076        	ldw	x,#118
 855  0140 89            	pushw	x
 856  0141 ae0000        	ldw	x,#0
 857  0144 89            	pushw	x
 858  0145 ae0008        	ldw	x,#L103
 859  0148 cd0000        	call	_assert_failed
 861  014b 5b04          	addw	sp,#4
 862  014d               L05:
 863                     ; 121     CAN->MCR = CAN_MCR_INRQ;
 865  014d 35015420      	mov	21536,#1
 867  0151 2007          	jra	L703
 868  0153               L303:
 869                     ; 125         timeout--;
 871  0153 1e03          	ldw	x,(OFST-1,sp)
 872  0155 1d0001        	subw	x,#1
 873  0158 1f03          	ldw	(OFST-1,sp),x
 874  015a               L703:
 875                     ; 123     while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 877  015a c65421        	ld	a,21537
 878  015d a401          	and	a,#1
 879  015f a101          	cp	a,#1
 880  0161 2704          	jreq	L313
 882  0163 1e03          	ldw	x,(OFST-1,sp)
 883  0165 26ec          	jrne	L303
 884  0167               L313:
 885                     ; 129     if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 887  0167 c65421        	ld	a,21537
 888  016a a401          	and	a,#1
 889  016c a101          	cp	a,#1
 890  016e 270c          	jreq	L513
 891                     ; 132         InitStatus =  CAN_InitStatus_Failed;
 893  0170 0f02          	clr	(OFST-2,sp)
 895  0172               L713:
 896                     ; 166     CAN_SelectPage(can_page);
 898  0172 7b01          	ld	a,(OFST-3,sp)
 899  0174 cd1043        	call	_CAN_SelectPage
 901                     ; 169     return (CAN_InitStatus_TypeDef)InitStatus;
 903  0177 7b02          	ld	a,(OFST-2,sp)
 906  0179 5b06          	addw	sp,#6
 907  017b 81            	ret
 908  017c               L513:
 909                     ; 139         CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 911  017c c65420        	ld	a,21536
 912  017f 1a05          	or	a,(OFST+1,sp)
 913  0181 c75420        	ld	21536,a
 914                     ; 142         CAN->DGR |= (uint8_t)CAN_Mode ;
 916  0184 c65426        	ld	a,21542
 917  0187 1a06          	or	a,(OFST+2,sp)
 918  0189 c75426        	ld	21542,a
 919                     ; 143         CAN->PSR = CAN_Page_Config;
 921  018c 35065427      	mov	21543,#6
 922                     ; 144         CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 924  0190 7b0c          	ld	a,(OFST+8,sp)
 925  0192 4a            	dec	a
 926  0193 1a09          	or	a,(OFST+5,sp)
 927  0195 c7542c        	ld	21548,a
 928                     ; 145         CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 930  0198 7b0a          	ld	a,(OFST+6,sp)
 931  019a 1a0b          	or	a,(OFST+7,sp)
 932  019c c7542d        	ld	21549,a
 933                     ; 148         CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 935  019f 72115420      	bres	21536,#0
 936                     ; 150         timeout = 0xFFFF;
 938  01a3 aeffff        	ldw	x,#65535
 939  01a6 1f03          	ldw	(OFST-1,sp),x
 941  01a8 2007          	jra	L523
 942  01aa               L123:
 943                     ; 153             timeout--;
 945  01aa 1e03          	ldw	x,(OFST-1,sp)
 946  01ac 1d0001        	subw	x,#1
 947  01af 1f03          	ldw	(OFST-1,sp),x
 948  01b1               L523:
 949                     ; 151         while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 951  01b1 c65421        	ld	a,21537
 952  01b4 a401          	and	a,#1
 953  01b6 a101          	cp	a,#1
 954  01b8 2604          	jrne	L133
 956  01ba 1e03          	ldw	x,(OFST-1,sp)
 957  01bc 26ec          	jrne	L123
 958  01be               L133:
 959                     ; 156         if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 961  01be c65421        	ld	a,21537
 962  01c1 a401          	and	a,#1
 963  01c3 a101          	cp	a,#1
 964  01c5 2604          	jrne	L333
 965                     ; 158             InitStatus = CAN_InitStatus_Failed;
 967  01c7 0f02          	clr	(OFST-2,sp)
 969  01c9 20a7          	jra	L713
 970  01cb               L333:
 971                     ; 162             InitStatus = CAN_InitStatus_Success;
 973  01cb a601          	ld	a,#1
 974  01cd 6b02          	ld	(OFST-2,sp),a
 975  01cf 20a1          	jra	L713
1308                     ; 188 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1308                     ; 189                     FunctionalState CAN_FilterActivation,
1308                     ; 190                     CAN_FilterMode_TypeDef CAN_FilterMode,
1308                     ; 191                     CAN_FilterScale_TypeDef CAN_FilterScale,
1308                     ; 192                     uint8_t CAN_FilterID1,
1308                     ; 193                     uint8_t CAN_FilterID2,
1308                     ; 194                     uint8_t CAN_FilterID3,
1308                     ; 195                     uint8_t CAN_FilterID4,
1308                     ; 196                     uint8_t CAN_FilterIDMask1,
1308                     ; 197                     uint8_t CAN_FilterIDMask2,
1308                     ; 198                     uint8_t CAN_FilterIDMask3,
1308                     ; 199                     uint8_t CAN_FilterIDMask4)
1308                     ; 200 {
1309                     	switch	.text
1310  01d1               _CAN_FilterInit:
1312  01d1 89            	pushw	x
1313  01d2 5205          	subw	sp,#5
1314       00000005      OFST:	set	5
1317                     ; 201     uint8_t fact = 0;
1319                     ; 202     uint8_t fsc  = 0;
1321                     ; 203     uint8_t fmhl = 0;
1323                     ; 205     CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1325                     ; 206     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1327  01d4 cd103f        	call	_CAN_GetSelectedPage
1329  01d7 6b01          	ld	(OFST-4,sp),a
1330                     ; 209     assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1332  01d9 0d06          	tnz	(OFST+1,sp)
1333  01db 271e          	jreq	L65
1334  01dd 7b06          	ld	a,(OFST+1,sp)
1335  01df a101          	cp	a,#1
1336  01e1 2718          	jreq	L65
1337  01e3 7b06          	ld	a,(OFST+1,sp)
1338  01e5 a102          	cp	a,#2
1339  01e7 2712          	jreq	L65
1340  01e9 7b06          	ld	a,(OFST+1,sp)
1341  01eb a103          	cp	a,#3
1342  01ed 270c          	jreq	L65
1343  01ef 7b06          	ld	a,(OFST+1,sp)
1344  01f1 a104          	cp	a,#4
1345  01f3 2706          	jreq	L65
1346  01f5 7b06          	ld	a,(OFST+1,sp)
1347  01f7 a105          	cp	a,#5
1348  01f9 2603          	jrne	L45
1349  01fb               L65:
1350  01fb 4f            	clr	a
1351  01fc 2010          	jra	L06
1352  01fe               L45:
1353  01fe ae00d1        	ldw	x,#209
1354  0201 89            	pushw	x
1355  0202 ae0000        	ldw	x,#0
1356  0205 89            	pushw	x
1357  0206 ae0008        	ldw	x,#L103
1358  0209 cd0000        	call	_assert_failed
1360  020c 5b04          	addw	sp,#4
1361  020e               L06:
1362                     ; 210     assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1364  020e 0d07          	tnz	(OFST+2,sp)
1365  0210 2706          	jreq	L46
1366  0212 7b07          	ld	a,(OFST+2,sp)
1367  0214 a101          	cp	a,#1
1368  0216 2603          	jrne	L26
1369  0218               L46:
1370  0218 4f            	clr	a
1371  0219 2010          	jra	L66
1372  021b               L26:
1373  021b ae00d2        	ldw	x,#210
1374  021e 89            	pushw	x
1375  021f ae0000        	ldw	x,#0
1376  0222 89            	pushw	x
1377  0223 ae0008        	ldw	x,#L103
1378  0226 cd0000        	call	_assert_failed
1380  0229 5b04          	addw	sp,#4
1381  022b               L66:
1382                     ; 211     assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1384  022b 0d0a          	tnz	(OFST+5,sp)
1385  022d 2712          	jreq	L27
1386  022f 7b0a          	ld	a,(OFST+5,sp)
1387  0231 a110          	cp	a,#16
1388  0233 270c          	jreq	L27
1389  0235 7b0a          	ld	a,(OFST+5,sp)
1390  0237 a111          	cp	a,#17
1391  0239 2706          	jreq	L27
1392  023b 7b0a          	ld	a,(OFST+5,sp)
1393  023d a101          	cp	a,#1
1394  023f 2603          	jrne	L07
1395  0241               L27:
1396  0241 4f            	clr	a
1397  0242 2010          	jra	L47
1398  0244               L07:
1399  0244 ae00d3        	ldw	x,#211
1400  0247 89            	pushw	x
1401  0248 ae0000        	ldw	x,#0
1402  024b 89            	pushw	x
1403  024c ae0008        	ldw	x,#L103
1404  024f cd0000        	call	_assert_failed
1406  0252 5b04          	addw	sp,#4
1407  0254               L47:
1408                     ; 212     assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1410  0254 0d0b          	tnz	(OFST+6,sp)
1411  0256 2712          	jreq	L001
1412  0258 7b0b          	ld	a,(OFST+6,sp)
1413  025a a102          	cp	a,#2
1414  025c 270c          	jreq	L001
1415  025e 7b0b          	ld	a,(OFST+6,sp)
1416  0260 a104          	cp	a,#4
1417  0262 2706          	jreq	L001
1418  0264 7b0b          	ld	a,(OFST+6,sp)
1419  0266 a106          	cp	a,#6
1420  0268 2603          	jrne	L67
1421  026a               L001:
1422  026a 4f            	clr	a
1423  026b 2010          	jra	L201
1424  026d               L67:
1425  026d ae00d4        	ldw	x,#212
1426  0270 89            	pushw	x
1427  0271 ae0000        	ldw	x,#0
1428  0274 89            	pushw	x
1429  0275 ae0008        	ldw	x,#L103
1430  0278 cd0000        	call	_assert_failed
1432  027b 5b04          	addw	sp,#4
1433  027d               L201:
1434                     ; 215     if (CAN_FilterNumber == CAN_FilterNumber_0)
1436  027d 0d06          	tnz	(OFST+1,sp)
1437  027f 2610          	jrne	L535
1438                     ; 217         fact = 0x01;
1440  0281 a601          	ld	a,#1
1441  0283 6b03          	ld	(OFST-2,sp),a
1442                     ; 218         fsc  = 0x00;
1444  0285 0f04          	clr	(OFST-1,sp)
1445                     ; 219         fmhl = 0x03;
1447  0287 a603          	ld	a,#3
1448  0289 6b05          	ld	(OFST+0,sp),a
1449                     ; 221         can_page_filter = CAN_Page_Filter01;
1451  028b a602          	ld	a,#2
1452  028d 6b02          	ld	(OFST-3,sp),a
1454  028f 206c          	jra	L735
1455  0291               L535:
1456                     ; 223     else if (CAN_FilterNumber == CAN_FilterNumber_1)
1458  0291 7b06          	ld	a,(OFST+1,sp)
1459  0293 a101          	cp	a,#1
1460  0295 2612          	jrne	L145
1461                     ; 225         fact = 0x10;
1463  0297 a610          	ld	a,#16
1464  0299 6b03          	ld	(OFST-2,sp),a
1465                     ; 226         fsc  = 0x04;
1467  029b a604          	ld	a,#4
1468  029d 6b04          	ld	(OFST-1,sp),a
1469                     ; 227         fmhl = 0x0C;
1471  029f a60c          	ld	a,#12
1472  02a1 6b05          	ld	(OFST+0,sp),a
1473                     ; 229         can_page_filter = CAN_Page_Filter01;
1475  02a3 a602          	ld	a,#2
1476  02a5 6b02          	ld	(OFST-3,sp),a
1478  02a7 2054          	jra	L735
1479  02a9               L145:
1480                     ; 231     else if (CAN_FilterNumber == CAN_FilterNumber_2)
1482  02a9 7b06          	ld	a,(OFST+1,sp)
1483  02ab a102          	cp	a,#2
1484  02ad 2610          	jrne	L545
1485                     ; 233         fact = 0x01;
1487  02af a601          	ld	a,#1
1488  02b1 6b03          	ld	(OFST-2,sp),a
1489                     ; 234         fsc  = 0x00;
1491  02b3 0f04          	clr	(OFST-1,sp)
1492                     ; 235         fmhl = 0x30;
1494  02b5 a630          	ld	a,#48
1495  02b7 6b05          	ld	(OFST+0,sp),a
1496                     ; 237         can_page_filter = CAN_Page_Filter23;
1498  02b9 a603          	ld	a,#3
1499  02bb 6b02          	ld	(OFST-3,sp),a
1501  02bd 203e          	jra	L735
1502  02bf               L545:
1503                     ; 239     else if (CAN_FilterNumber == CAN_FilterNumber_3)
1505  02bf 7b06          	ld	a,(OFST+1,sp)
1506  02c1 a103          	cp	a,#3
1507  02c3 2612          	jrne	L155
1508                     ; 241         fact = 0x10;
1510  02c5 a610          	ld	a,#16
1511  02c7 6b03          	ld	(OFST-2,sp),a
1512                     ; 242         fsc  = 0x04;
1514  02c9 a604          	ld	a,#4
1515  02cb 6b04          	ld	(OFST-1,sp),a
1516                     ; 243         fmhl = 0xC0;
1518  02cd a6c0          	ld	a,#192
1519  02cf 6b05          	ld	(OFST+0,sp),a
1520                     ; 245         can_page_filter = CAN_Page_Filter23;
1522  02d1 a603          	ld	a,#3
1523  02d3 6b02          	ld	(OFST-3,sp),a
1525  02d5 2026          	jra	L735
1526  02d7               L155:
1527                     ; 247     else if (CAN_FilterNumber == CAN_FilterNumber_4)
1529  02d7 7b06          	ld	a,(OFST+1,sp)
1530  02d9 a104          	cp	a,#4
1531  02db 2610          	jrne	L555
1532                     ; 249         fact = 0x01;
1534  02dd a601          	ld	a,#1
1535  02df 6b03          	ld	(OFST-2,sp),a
1536                     ; 250         fsc  = 0x00;
1538  02e1 0f04          	clr	(OFST-1,sp)
1539                     ; 251         fmhl = 0x03;
1541  02e3 a603          	ld	a,#3
1542  02e5 6b05          	ld	(OFST+0,sp),a
1543                     ; 253         can_page_filter = CAN_Page_Filter45;
1545  02e7 a604          	ld	a,#4
1546  02e9 6b02          	ld	(OFST-3,sp),a
1548  02eb 2010          	jra	L735
1549  02ed               L555:
1550                     ; 257         fact = 0x10;
1552  02ed a610          	ld	a,#16
1553  02ef 6b03          	ld	(OFST-2,sp),a
1554                     ; 258         fsc  = 0x04;
1556  02f1 a604          	ld	a,#4
1557  02f3 6b04          	ld	(OFST-1,sp),a
1558                     ; 259         fmhl = 0x0C;
1560  02f5 a60c          	ld	a,#12
1561  02f7 6b05          	ld	(OFST+0,sp),a
1562                     ; 261         can_page_filter = CAN_Page_Filter45;
1564  02f9 a604          	ld	a,#4
1565  02fb 6b02          	ld	(OFST-3,sp),a
1566  02fd               L735:
1567                     ; 265     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1569  02fd 4f            	clr	a
1570  02fe cd0b6a        	call	_CAN_OperatingModeRequest
1572                     ; 267     CAN->PSR = CAN_Page_Config;
1574  0301 35065427      	mov	21543,#6
1575                     ; 272     if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1577  0305 7b02          	ld	a,(OFST-3,sp)
1578  0307 a102          	cp	a,#2
1579  0309 262b          	jrne	L165
1580                     ; 275         CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1582  030b 7b04          	ld	a,(OFST-1,sp)
1583  030d 5f            	clrw	x
1584  030e 97            	ld	xl,a
1585  030f a606          	ld	a,#6
1586  0311 5d            	tnzw	x
1587  0312 2704          	jreq	L401
1588  0314               L601:
1589  0314 48            	sll	a
1590  0315 5a            	decw	x
1591  0316 26fc          	jrne	L601
1592  0318               L401:
1593  0318 1a03          	or	a,(OFST-2,sp)
1594  031a 43            	cpl	a
1595  031b c45432        	and	a,21554
1596  031e c75432        	ld	21554,a
1597                     ; 277         CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1599  0321 7b04          	ld	a,(OFST-1,sp)
1600  0323 5f            	clrw	x
1601  0324 97            	ld	xl,a
1602  0325 7b0b          	ld	a,(OFST+6,sp)
1603  0327 5d            	tnzw	x
1604  0328 2704          	jreq	L011
1605  032a               L211:
1606  032a 48            	sll	a
1607  032b 5a            	decw	x
1608  032c 26fc          	jrne	L211
1609  032e               L011:
1610  032e ca5432        	or	a,21554
1611  0331 c75432        	ld	21554,a
1613  0334 205a          	jra	L365
1614  0336               L165:
1615                     ; 279     else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1617  0336 7b02          	ld	a,(OFST-3,sp)
1618  0338 a103          	cp	a,#3
1619  033a 262b          	jrne	L565
1620                     ; 282         CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1622  033c 7b04          	ld	a,(OFST-1,sp)
1623  033e 5f            	clrw	x
1624  033f 97            	ld	xl,a
1625  0340 a606          	ld	a,#6
1626  0342 5d            	tnzw	x
1627  0343 2704          	jreq	L411
1628  0345               L611:
1629  0345 48            	sll	a
1630  0346 5a            	decw	x
1631  0347 26fc          	jrne	L611
1632  0349               L411:
1633  0349 1a03          	or	a,(OFST-2,sp)
1634  034b 43            	cpl	a
1635  034c c45433        	and	a,21555
1636  034f c75433        	ld	21555,a
1637                     ; 285         CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1639  0352 7b04          	ld	a,(OFST-1,sp)
1640  0354 5f            	clrw	x
1641  0355 97            	ld	xl,a
1642  0356 7b0b          	ld	a,(OFST+6,sp)
1643  0358 5d            	tnzw	x
1644  0359 2704          	jreq	L021
1645  035b               L221:
1646  035b 48            	sll	a
1647  035c 5a            	decw	x
1648  035d 26fc          	jrne	L221
1649  035f               L021:
1650  035f ca5433        	or	a,21555
1651  0362 c75433        	ld	21555,a
1653  0365 2029          	jra	L365
1654  0367               L565:
1655                     ; 291         CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1657  0367 7b04          	ld	a,(OFST-1,sp)
1658  0369 5f            	clrw	x
1659  036a 97            	ld	xl,a
1660  036b a606          	ld	a,#6
1661  036d 5d            	tnzw	x
1662  036e 2704          	jreq	L421
1663  0370               L621:
1664  0370 48            	sll	a
1665  0371 5a            	decw	x
1666  0372 26fc          	jrne	L621
1667  0374               L421:
1668  0374 1a03          	or	a,(OFST-2,sp)
1669  0376 43            	cpl	a
1670  0377 c45434        	and	a,21556
1671  037a c75434        	ld	21556,a
1672                     ; 294         CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1674  037d 7b04          	ld	a,(OFST-1,sp)
1675  037f 5f            	clrw	x
1676  0380 97            	ld	xl,a
1677  0381 7b0b          	ld	a,(OFST+6,sp)
1678  0383 5d            	tnzw	x
1679  0384 2704          	jreq	L031
1680  0386               L231:
1681  0386 48            	sll	a
1682  0387 5a            	decw	x
1683  0388 26fc          	jrne	L231
1684  038a               L031:
1685  038a ca5434        	or	a,21556
1686  038d c75434        	ld	21556,a
1687  0390               L365:
1688                     ; 300     if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1690  0390 7b02          	ld	a,(OFST-3,sp)
1691  0392 a104          	cp	a,#4
1692  0394 273d          	jreq	L175
1693                     ; 303         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1695  0396 0d0a          	tnz	(OFST+5,sp)
1696  0398 260b          	jrne	L375
1697                     ; 306             CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1699  039a 7b05          	ld	a,(OFST+0,sp)
1700  039c 43            	cpl	a
1701  039d c45430        	and	a,21552
1702  03a0 c75430        	ld	21552,a
1704  03a3 2069          	jra	L706
1705  03a5               L375:
1706                     ; 308         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1708  03a5 7b0a          	ld	a,(OFST+5,sp)
1709  03a7 a101          	cp	a,#1
1710  03a9 260a          	jrne	L775
1711                     ; 311             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1713  03ab c65430        	ld	a,21552
1714  03ae 1a05          	or	a,(OFST+0,sp)
1715  03b0 c75430        	ld	21552,a
1717  03b3 2059          	jra	L706
1718  03b5               L775:
1719                     ; 313         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1721  03b5 7b0a          	ld	a,(OFST+5,sp)
1722  03b7 a111          	cp	a,#17
1723  03b9 260c          	jrne	L306
1724                     ; 316             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1726  03bb 7b05          	ld	a,(OFST+0,sp)
1727  03bd a455          	and	a,#85
1728  03bf ca5430        	or	a,21552
1729  03c2 c75430        	ld	21552,a
1731  03c5 2047          	jra	L706
1732  03c7               L306:
1733                     ; 321             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1735  03c7 7b05          	ld	a,(OFST+0,sp)
1736  03c9 a4aa          	and	a,#170
1737  03cb ca5430        	or	a,21552
1738  03ce c75430        	ld	21552,a
1739  03d1 203b          	jra	L706
1740  03d3               L175:
1741                     ; 330         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1743  03d3 0d0a          	tnz	(OFST+5,sp)
1744  03d5 260b          	jrne	L116
1745                     ; 333             CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1747  03d7 7b05          	ld	a,(OFST+0,sp)
1748  03d9 43            	cpl	a
1749  03da c45431        	and	a,21553
1750  03dd c75431        	ld	21553,a
1752  03e0 202c          	jra	L706
1753  03e2               L116:
1754                     ; 335         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1756  03e2 7b0a          	ld	a,(OFST+5,sp)
1757  03e4 a101          	cp	a,#1
1758  03e6 260a          	jrne	L516
1759                     ; 338             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1761  03e8 c65431        	ld	a,21553
1762  03eb 1a05          	or	a,(OFST+0,sp)
1763  03ed c75431        	ld	21553,a
1765  03f0 201c          	jra	L706
1766  03f2               L516:
1767                     ; 340         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1769  03f2 7b0a          	ld	a,(OFST+5,sp)
1770  03f4 a111          	cp	a,#17
1771  03f6 260c          	jrne	L126
1772                     ; 343             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1774  03f8 7b05          	ld	a,(OFST+0,sp)
1775  03fa a455          	and	a,#85
1776  03fc ca5431        	or	a,21553
1777  03ff c75431        	ld	21553,a
1779  0402 200a          	jra	L706
1780  0404               L126:
1781                     ; 348             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1783  0404 7b05          	ld	a,(OFST+0,sp)
1784  0406 a4aa          	and	a,#170
1785  0408 ca5431        	or	a,21553
1786  040b c75431        	ld	21553,a
1787  040e               L706:
1788                     ; 354     CAN->PSR = (uint8_t)can_page_filter;
1790  040e 7b02          	ld	a,(OFST-3,sp)
1791  0410 c75427        	ld	21543,a
1792                     ; 355     if (fsc != 0)
1794  0413 0d04          	tnz	(OFST-1,sp)
1795  0415 2603          	jrne	L431
1796  0417 cc04e3        	jp	L526
1797  041a               L431:
1798                     ; 358         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1800  041a 0d0b          	tnz	(OFST+6,sp)
1801  041c 262c          	jrne	L726
1802                     ; 360             CAN->Page.Filter.FR09 = CAN_FilterID1;
1804  041e 7b0c          	ld	a,(OFST+7,sp)
1805  0420 c75430        	ld	21552,a
1806                     ; 361             CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1808  0423 7b10          	ld	a,(OFST+11,sp)
1809  0425 c75431        	ld	21553,a
1810                     ; 362             CAN->Page.Filter.FR11 = CAN_FilterID2;
1812  0428 7b0d          	ld	a,(OFST+8,sp)
1813  042a c75432        	ld	21554,a
1814                     ; 363             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1816  042d 7b11          	ld	a,(OFST+12,sp)
1817  042f c75433        	ld	21555,a
1818                     ; 364             CAN->Page.Filter.FR13 = CAN_FilterID3;
1820  0432 7b0e          	ld	a,(OFST+9,sp)
1821  0434 c75434        	ld	21556,a
1822                     ; 365             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1824  0437 7b12          	ld	a,(OFST+13,sp)
1825  0439 c75435        	ld	21557,a
1826                     ; 366             CAN->Page.Filter.FR15 = CAN_FilterID4;
1828  043c 7b0f          	ld	a,(OFST+10,sp)
1829  043e c75436        	ld	21558,a
1830                     ; 367             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1832  0441 7b13          	ld	a,(OFST+14,sp)
1833  0443 c75437        	ld	21559,a
1835  0446 aca105a1      	jpf	L546
1836  044a               L726:
1837                     ; 369         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1839  044a 7b0b          	ld	a,(OFST+6,sp)
1840  044c a102          	cp	a,#2
1841  044e 262c          	jrne	L336
1842                     ; 371             CAN->Page.Filter.FR09 = CAN_FilterID1;
1844  0450 7b0c          	ld	a,(OFST+7,sp)
1845  0452 c75430        	ld	21552,a
1846                     ; 372             CAN->Page.Filter.FR10 = CAN_FilterID2;
1848  0455 7b0d          	ld	a,(OFST+8,sp)
1849  0457 c75431        	ld	21553,a
1850                     ; 373             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1852  045a 7b10          	ld	a,(OFST+11,sp)
1853  045c c75432        	ld	21554,a
1854                     ; 374             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1856  045f 7b11          	ld	a,(OFST+12,sp)
1857  0461 c75433        	ld	21555,a
1858                     ; 375             CAN->Page.Filter.FR13 = CAN_FilterID3;
1860  0464 7b0e          	ld	a,(OFST+9,sp)
1861  0466 c75434        	ld	21556,a
1862                     ; 376             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1864  0469 7b12          	ld	a,(OFST+13,sp)
1865  046b c75435        	ld	21557,a
1866                     ; 377             CAN->Page.Filter.FR15 = CAN_FilterID4;
1868  046e 7b0f          	ld	a,(OFST+10,sp)
1869  0470 c75436        	ld	21558,a
1870                     ; 378             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1872  0473 7b13          	ld	a,(OFST+14,sp)
1873  0475 c75437        	ld	21559,a
1875  0478 aca105a1      	jpf	L546
1876  047c               L336:
1877                     ; 380         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1879  047c 7b0b          	ld	a,(OFST+6,sp)
1880  047e a104          	cp	a,#4
1881  0480 262c          	jrne	L736
1882                     ; 382             CAN->Page.Filter.FR09 = CAN_FilterID1;
1884  0482 7b0c          	ld	a,(OFST+7,sp)
1885  0484 c75430        	ld	21552,a
1886                     ; 383             CAN->Page.Filter.FR10 = CAN_FilterID2;
1888  0487 7b0d          	ld	a,(OFST+8,sp)
1889  0489 c75431        	ld	21553,a
1890                     ; 384             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1892  048c 7b10          	ld	a,(OFST+11,sp)
1893  048e c75432        	ld	21554,a
1894                     ; 385             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1896  0491 7b11          	ld	a,(OFST+12,sp)
1897  0493 c75433        	ld	21555,a
1898                     ; 386             CAN->Page.Filter.FR13 = CAN_FilterID3;
1900  0496 7b0e          	ld	a,(OFST+9,sp)
1901  0498 c75434        	ld	21556,a
1902                     ; 387             CAN->Page.Filter.FR14 = CAN_FilterID4;
1904  049b 7b0f          	ld	a,(OFST+10,sp)
1905  049d c75435        	ld	21557,a
1906                     ; 388             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1908  04a0 7b12          	ld	a,(OFST+13,sp)
1909  04a2 c75436        	ld	21558,a
1910                     ; 389             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1912  04a5 7b13          	ld	a,(OFST+14,sp)
1913  04a7 c75437        	ld	21559,a
1915  04aa aca105a1      	jpf	L546
1916  04ae               L736:
1917                     ; 391         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1919  04ae 7b0b          	ld	a,(OFST+6,sp)
1920  04b0 a106          	cp	a,#6
1921  04b2 2703          	jreq	L631
1922  04b4 cc05a1        	jp	L546
1923  04b7               L631:
1924                     ; 393             CAN->Page.Filter.FR09 = CAN_FilterID1;
1926  04b7 7b0c          	ld	a,(OFST+7,sp)
1927  04b9 c75430        	ld	21552,a
1928                     ; 394             CAN->Page.Filter.FR10 = CAN_FilterID2;
1930  04bc 7b0d          	ld	a,(OFST+8,sp)
1931  04be c75431        	ld	21553,a
1932                     ; 395             CAN->Page.Filter.FR11 = CAN_FilterID3;
1934  04c1 7b0e          	ld	a,(OFST+9,sp)
1935  04c3 c75432        	ld	21554,a
1936                     ; 396             CAN->Page.Filter.FR12 = CAN_FilterID4;
1938  04c6 7b0f          	ld	a,(OFST+10,sp)
1939  04c8 c75433        	ld	21555,a
1940                     ; 397             CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1942  04cb 7b10          	ld	a,(OFST+11,sp)
1943  04cd c75434        	ld	21556,a
1944                     ; 398             CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1946  04d0 7b11          	ld	a,(OFST+12,sp)
1947  04d2 c75435        	ld	21557,a
1948                     ; 399             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1950  04d5 7b12          	ld	a,(OFST+13,sp)
1951  04d7 c75436        	ld	21558,a
1952                     ; 400             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1954  04da 7b13          	ld	a,(OFST+14,sp)
1955  04dc c75437        	ld	21559,a
1956  04df aca105a1      	jpf	L546
1957  04e3               L526:
1958                     ; 406         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1960  04e3 0d0b          	tnz	(OFST+6,sp)
1961  04e5 262c          	jrne	L746
1962                     ; 408             CAN->Page.Filter.FR01 = CAN_FilterID1;
1964  04e7 7b0c          	ld	a,(OFST+7,sp)
1965  04e9 c75428        	ld	21544,a
1966                     ; 409             CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
1968  04ec 7b10          	ld	a,(OFST+11,sp)
1969  04ee c75429        	ld	21545,a
1970                     ; 410             CAN->Page.Filter.FR03 = CAN_FilterID2;
1972  04f1 7b0d          	ld	a,(OFST+8,sp)
1973  04f3 c7542a        	ld	21546,a
1974                     ; 411             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1976  04f6 7b11          	ld	a,(OFST+12,sp)
1977  04f8 c7542b        	ld	21547,a
1978                     ; 412             CAN->Page.Filter.FR05 = CAN_FilterID3;
1980  04fb 7b0e          	ld	a,(OFST+9,sp)
1981  04fd c7542c        	ld	21548,a
1982                     ; 413             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1984  0500 7b12          	ld	a,(OFST+13,sp)
1985  0502 c7542d        	ld	21549,a
1986                     ; 414             CAN->Page.Filter.FR07 = CAN_FilterID4;
1988  0505 7b0f          	ld	a,(OFST+10,sp)
1989  0507 c7542e        	ld	21550,a
1990                     ; 415             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1992  050a 7b13          	ld	a,(OFST+14,sp)
1993  050c c7542f        	ld	21551,a
1995  050f aca105a1      	jpf	L546
1996  0513               L746:
1997                     ; 417         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1999  0513 7b0b          	ld	a,(OFST+6,sp)
2000  0515 a102          	cp	a,#2
2001  0517 262a          	jrne	L356
2002                     ; 419             CAN->Page.Filter.FR01 = CAN_FilterID1;
2004  0519 7b0c          	ld	a,(OFST+7,sp)
2005  051b c75428        	ld	21544,a
2006                     ; 420             CAN->Page.Filter.FR02 = CAN_FilterID2;
2008  051e 7b0d          	ld	a,(OFST+8,sp)
2009  0520 c75429        	ld	21545,a
2010                     ; 421             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2012  0523 7b10          	ld	a,(OFST+11,sp)
2013  0525 c7542a        	ld	21546,a
2014                     ; 422             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2016  0528 7b11          	ld	a,(OFST+12,sp)
2017  052a c7542b        	ld	21547,a
2018                     ; 423             CAN->Page.Filter.FR05 = CAN_FilterID3;
2020  052d 7b0e          	ld	a,(OFST+9,sp)
2021  052f c7542c        	ld	21548,a
2022                     ; 424             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
2024  0532 7b12          	ld	a,(OFST+13,sp)
2025  0534 c7542d        	ld	21549,a
2026                     ; 425             CAN->Page.Filter.FR07 = CAN_FilterID4;
2028  0537 7b0f          	ld	a,(OFST+10,sp)
2029  0539 c7542e        	ld	21550,a
2030                     ; 426             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2032  053c 7b13          	ld	a,(OFST+14,sp)
2033  053e c7542f        	ld	21551,a
2035  0541 205e          	jra	L546
2036  0543               L356:
2037                     ; 428         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
2039  0543 7b0b          	ld	a,(OFST+6,sp)
2040  0545 a104          	cp	a,#4
2041  0547 262a          	jrne	L756
2042                     ; 430             CAN->Page.Filter.FR01 = CAN_FilterID1;
2044  0549 7b0c          	ld	a,(OFST+7,sp)
2045  054b c75428        	ld	21544,a
2046                     ; 431             CAN->Page.Filter.FR02 = CAN_FilterID2;
2048  054e 7b0d          	ld	a,(OFST+8,sp)
2049  0550 c75429        	ld	21545,a
2050                     ; 432             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2052  0553 7b10          	ld	a,(OFST+11,sp)
2053  0555 c7542a        	ld	21546,a
2054                     ; 433             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2056  0558 7b11          	ld	a,(OFST+12,sp)
2057  055a c7542b        	ld	21547,a
2058                     ; 434             CAN->Page.Filter.FR05 = CAN_FilterID3;
2060  055d 7b0e          	ld	a,(OFST+9,sp)
2061  055f c7542c        	ld	21548,a
2062                     ; 435             CAN->Page.Filter.FR06 = CAN_FilterID4;
2064  0562 7b0f          	ld	a,(OFST+10,sp)
2065  0564 c7542d        	ld	21549,a
2066                     ; 436             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2068  0567 7b12          	ld	a,(OFST+13,sp)
2069  0569 c7542e        	ld	21550,a
2070                     ; 437             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2072  056c 7b13          	ld	a,(OFST+14,sp)
2073  056e c7542f        	ld	21551,a
2075  0571 202e          	jra	L546
2076  0573               L756:
2077                     ; 439         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
2079  0573 7b0b          	ld	a,(OFST+6,sp)
2080  0575 a106          	cp	a,#6
2081  0577 2628          	jrne	L546
2082                     ; 441             CAN->Page.Filter.FR01 = CAN_FilterID1;
2084  0579 7b0c          	ld	a,(OFST+7,sp)
2085  057b c75428        	ld	21544,a
2086                     ; 442             CAN->Page.Filter.FR02 = CAN_FilterID2;
2088  057e 7b0d          	ld	a,(OFST+8,sp)
2089  0580 c75429        	ld	21545,a
2090                     ; 443             CAN->Page.Filter.FR03 = CAN_FilterID3;
2092  0583 7b0e          	ld	a,(OFST+9,sp)
2093  0585 c7542a        	ld	21546,a
2094                     ; 444             CAN->Page.Filter.FR04 = CAN_FilterID4;
2096  0588 7b0f          	ld	a,(OFST+10,sp)
2097  058a c7542b        	ld	21547,a
2098                     ; 445             CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
2100  058d 7b10          	ld	a,(OFST+11,sp)
2101  058f c7542c        	ld	21548,a
2102                     ; 446             CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
2104  0592 7b11          	ld	a,(OFST+12,sp)
2105  0594 c7542d        	ld	21549,a
2106                     ; 447             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2108  0597 7b12          	ld	a,(OFST+13,sp)
2109  0599 c7542e        	ld	21550,a
2110                     ; 448             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2112  059c 7b13          	ld	a,(OFST+14,sp)
2113  059e c7542f        	ld	21551,a
2114  05a1               L546:
2115                     ; 457     CAN->PSR = CAN_Page_Config;
2117  05a1 35065427      	mov	21543,#6
2118                     ; 458     if (CAN_FilterActivation != DISABLE)
2120  05a5 0d07          	tnz	(OFST+2,sp)
2121  05a7 272a          	jreq	L566
2122                     ; 460         if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
2124  05a9 7b06          	ld	a,(OFST+1,sp)
2125  05ab a506          	bcp	a,#6
2126  05ad 260a          	jrne	L766
2127                     ; 461         {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
2129  05af c65432        	ld	a,21554
2130  05b2 1a03          	or	a,(OFST-2,sp)
2131  05b4 c75432        	ld	21554,a
2133  05b7 201a          	jra	L566
2134  05b9               L766:
2135                     ; 463         else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
2137  05b9 7b06          	ld	a,(OFST+1,sp)
2138  05bb a406          	and	a,#6
2139  05bd a102          	cp	a,#2
2140  05bf 260a          	jrne	L376
2141                     ; 464         { CAN->Page.Config.FCR2 |= (uint8_t)fact;
2143  05c1 c65433        	ld	a,21555
2144  05c4 1a03          	or	a,(OFST-2,sp)
2145  05c6 c75433        	ld	21555,a
2147  05c9 2008          	jra	L566
2148  05cb               L376:
2149                     ; 467         { CAN->Page.Config.FCR3 |= (uint8_t)fact;
2151  05cb c65434        	ld	a,21556
2152  05ce 1a03          	or	a,(OFST-2,sp)
2153  05d0 c75434        	ld	21556,a
2154  05d3               L566:
2155                     ; 470     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
2157  05d3 a601          	ld	a,#1
2158  05d5 cd0b6a        	call	_CAN_OperatingModeRequest
2160                     ; 472     CAN_SelectPage(can_page);
2162  05d8 7b01          	ld	a,(OFST-4,sp)
2163  05da cd1043        	call	_CAN_SelectPage
2165                     ; 473 }
2168  05dd 5b07          	addw	sp,#7
2169  05df 81            	ret
2312                     ; 481 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2312                     ; 482 {
2313                     	switch	.text
2314  05e0               _CAN_ITConfig:
2316  05e0 89            	pushw	x
2317  05e1 5203          	subw	sp,#3
2318       00000003      OFST:	set	3
2321                     ; 483     uint8_t tmperrorinterrupt = 0;
2323                     ; 484     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2325  05e3 cd103f        	call	_CAN_GetSelectedPage
2327  05e6 6b02          	ld	(OFST-1,sp),a
2328                     ; 488     assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2330  05e8 1e04          	ldw	x,(OFST+1,sp)
2331  05ea 2711          	jreq	L241
2332  05ec 1e04          	ldw	x,(OFST+1,sp)
2333  05ee 01            	rrwa	x,a
2334  05ef a470          	and	a,#112
2335  05f1 01            	rrwa	x,a
2336  05f2 a4b0          	and	a,#176
2337  05f4 01            	rrwa	x,a
2338  05f5 a30000        	cpw	x,#0
2339  05f8 2603          	jrne	L241
2340  05fa 4f            	clr	a
2341  05fb 2010          	jra	L441
2342  05fd               L241:
2343  05fd ae01e8        	ldw	x,#488
2344  0600 89            	pushw	x
2345  0601 ae0000        	ldw	x,#0
2346  0604 89            	pushw	x
2347  0605 ae0008        	ldw	x,#L103
2348  0608 cd0000        	call	_assert_failed
2350  060b 5b04          	addw	sp,#4
2351  060d               L441:
2352                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2354  060d 0d08          	tnz	(OFST+5,sp)
2355  060f 2706          	jreq	L051
2356  0611 7b08          	ld	a,(OFST+5,sp)
2357  0613 a101          	cp	a,#1
2358  0615 2603          	jrne	L641
2359  0617               L051:
2360  0617 4f            	clr	a
2361  0618 2010          	jra	L251
2362  061a               L641:
2363  061a ae01e9        	ldw	x,#489
2364  061d 89            	pushw	x
2365  061e ae0000        	ldw	x,#0
2366  0621 89            	pushw	x
2367  0622 ae0008        	ldw	x,#L103
2368  0625 cd0000        	call	_assert_failed
2370  0628 5b04          	addw	sp,#4
2371  062a               L251:
2372                     ; 491     tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2374  062a 1e04          	ldw	x,(OFST+1,sp)
2375  062c 4f            	clr	a
2376  062d 01            	rrwa	x,a
2377  062e 48            	sll	a
2378  062f 59            	rlcw	x
2379  0630 9f            	ld	a,xl
2380  0631 6b03          	ld	(OFST+0,sp),a
2381                     ; 492     tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2381                     ; 493                                   (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2383  0633 7b03          	ld	a,(OFST+0,sp)
2384  0635 a40f          	and	a,#15
2385  0637 44            	srl	a
2386  0638 6b01          	ld	(OFST-2,sp),a
2387  063a 7b03          	ld	a,(OFST+0,sp)
2388  063c a4f0          	and	a,#240
2389  063e 1a01          	or	a,(OFST-2,sp)
2390  0640 6b03          	ld	(OFST+0,sp),a
2391                     ; 495     CAN->PSR = CAN_Page_Config;
2393  0642 35065427      	mov	21543,#6
2394                     ; 496     if (NewState != DISABLE)
2396  0646 0d08          	tnz	(OFST+5,sp)
2397  0648 2712          	jreq	L167
2398                     ; 499         CAN->IER |= (uint8_t)(CAN_IT);
2400  064a c65425        	ld	a,21541
2401  064d 1a05          	or	a,(OFST+2,sp)
2402  064f c75425        	ld	21541,a
2403                     ; 500         CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2405  0652 c65429        	ld	a,21545
2406  0655 1a03          	or	a,(OFST+0,sp)
2407  0657 c75429        	ld	21545,a
2409  065a 2012          	jra	L367
2410  065c               L167:
2411                     ; 505         CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2413  065c 7b05          	ld	a,(OFST+2,sp)
2414  065e 43            	cpl	a
2415  065f c45425        	and	a,21541
2416  0662 c75425        	ld	21541,a
2417                     ; 506         CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2419  0665 7b03          	ld	a,(OFST+0,sp)
2420  0667 43            	cpl	a
2421  0668 c45429        	and	a,21545
2422  066b c75429        	ld	21545,a
2423  066e               L367:
2424                     ; 509     CAN_SelectPage(can_page);
2426  066e 7b02          	ld	a,(OFST-1,sp)
2427  0670 cd1043        	call	_CAN_SelectPage
2429                     ; 510 }
2432  0673 5b05          	addw	sp,#5
2433  0675 81            	ret
2493                     ; 519 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2493                     ; 520 {
2494                     	switch	.text
2495  0676               _CAN_ST7CompatibilityCmd:
2497  0676 88            	push	a
2498       00000000      OFST:	set	0
2501                     ; 522     assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2503  0677 4d            	tnz	a
2504  0678 2704          	jreq	L061
2505  067a a110          	cp	a,#16
2506  067c 2603          	jrne	L651
2507  067e               L061:
2508  067e 4f            	clr	a
2509  067f 2010          	jra	L261
2510  0681               L651:
2511  0681 ae020a        	ldw	x,#522
2512  0684 89            	pushw	x
2513  0685 ae0000        	ldw	x,#0
2514  0688 89            	pushw	x
2515  0689 ae0008        	ldw	x,#L103
2516  068c cd0000        	call	_assert_failed
2518  068f 5b04          	addw	sp,#4
2519  0691               L261:
2520                     ; 524     CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2522  0691 72195426      	bres	21542,#4
2523                     ; 527     CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2525  0695 c65426        	ld	a,21542
2526  0698 1a01          	or	a,(OFST+1,sp)
2527  069a c75426        	ld	21542,a
2528                     ; 528 }
2531  069d 84            	pop	a
2532  069e 81            	ret
2580                     ; 535 void CAN_TTComModeCmd(FunctionalState NewState)
2580                     ; 536 {
2581                     	switch	.text
2582  069f               _CAN_TTComModeCmd:
2584  069f 88            	push	a
2585  06a0 88            	push	a
2586       00000001      OFST:	set	1
2589                     ; 537     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2591  06a1 cd103f        	call	_CAN_GetSelectedPage
2593  06a4 6b01          	ld	(OFST+0,sp),a
2594                     ; 539     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2596  06a6 0d02          	tnz	(OFST+1,sp)
2597  06a8 2706          	jreq	L071
2598  06aa 7b02          	ld	a,(OFST+1,sp)
2599  06ac a101          	cp	a,#1
2600  06ae 2603          	jrne	L661
2601  06b0               L071:
2602  06b0 4f            	clr	a
2603  06b1 2010          	jra	L271
2604  06b3               L661:
2605  06b3 ae021b        	ldw	x,#539
2606  06b6 89            	pushw	x
2607  06b7 ae0000        	ldw	x,#0
2608  06ba 89            	pushw	x
2609  06bb ae0008        	ldw	x,#L103
2610  06be cd0000        	call	_assert_failed
2612  06c1 5b04          	addw	sp,#4
2613  06c3               L271:
2614                     ; 540     if (NewState != DISABLE)
2616  06c3 0d02          	tnz	(OFST+1,sp)
2617  06c5 2726          	jreq	L5301
2618                     ; 543         CAN->MCR |= CAN_MCR_TTCM;
2620  06c7 721e5420      	bset	21536,#7
2621                     ; 545         CAN->PSR = CAN_Page_TxMailBox0;
2623  06cb 725f5427      	clr	21543
2624                     ; 546         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2626  06cf 721e5429      	bset	21545,#7
2627                     ; 547         CAN->PSR = CAN_Page_TxMailBox1;
2629  06d3 35015427      	mov	21543,#1
2630                     ; 548         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2632  06d7 721e5429      	bset	21545,#7
2633                     ; 549         CAN->PSR = CAN_Page_TxMailBox2;
2635  06db 35055427      	mov	21543,#5
2636                     ; 550         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2638  06df 721e5429      	bset	21545,#7
2639                     ; 551         CAN->PSR = CAN_Page_RxFifo;
2641  06e3 35075427      	mov	21543,#7
2642                     ; 552         CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2644  06e7 721e5429      	bset	21545,#7
2646  06eb 2024          	jra	L7301
2647  06ed               L5301:
2648                     ; 557         CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2650  06ed 721f5420      	bres	21536,#7
2651                     ; 559         CAN->PSR = CAN_Page_TxMailBox0;
2653  06f1 725f5427      	clr	21543
2654                     ; 560         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2656  06f5 721f5429      	bres	21545,#7
2657                     ; 561         CAN->PSR = CAN_Page_TxMailBox1;
2659  06f9 35015427      	mov	21543,#1
2660                     ; 562         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2662  06fd 721f5429      	bres	21545,#7
2663                     ; 563         CAN->PSR = CAN_Page_TxMailBox2;
2665  0701 35055427      	mov	21543,#5
2666                     ; 564         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2668  0705 721f5429      	bres	21545,#7
2669                     ; 565         CAN->PSR = CAN_Page_RxFifo;
2671  0709 35075427      	mov	21543,#7
2672                     ; 566         CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2674  070d 721f5429      	bres	21545,#7
2675  0711               L7301:
2676                     ; 569     CAN_SelectPage(can_page);
2678  0711 7b01          	ld	a,(OFST+0,sp)
2679  0713 cd1043        	call	_CAN_SelectPage
2681                     ; 570 }
2684  0716 85            	popw	x
2685  0717 81            	ret
2891                     .const:	section	.text
2892  0000               L602:
2893  0000 20000000      	dc.l	536870912
2894  0004               L412:
2895  0004 00000800      	dc.l	2048
2896                     ; 581 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2896                     ; 582                                   CAN_Id_TypeDef CAN_IDE,
2896                     ; 583                                   CAN_RTR_TypeDef CAN_RTR,
2896                     ; 584                                   uint8_t CAN_DLC,
2896                     ; 585                                   uint8_t *CAN_Data)
2896                     ; 586 {
2897                     	switch	.text
2898  0718               _CAN_Transmit:
2900  0718 5206          	subw	sp,#6
2901       00000006      OFST:	set	6
2904                     ; 587     CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2906                     ; 588     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2908  071a cd103f        	call	_CAN_GetSelectedPage
2910  071d 6b05          	ld	(OFST-1,sp),a
2911                     ; 590     assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2913  071f 0d0d          	tnz	(OFST+7,sp)
2914  0721 2706          	jreq	L002
2915  0723 7b0d          	ld	a,(OFST+7,sp)
2916  0725 a140          	cp	a,#64
2917  0727 2603          	jrne	L671
2918  0729               L002:
2919  0729 4f            	clr	a
2920  072a 2010          	jra	L202
2921  072c               L671:
2922  072c ae024e        	ldw	x,#590
2923  072f 89            	pushw	x
2924  0730 ae0000        	ldw	x,#0
2925  0733 89            	pushw	x
2926  0734 ae0008        	ldw	x,#L103
2927  0737 cd0000        	call	_assert_failed
2929  073a 5b04          	addw	sp,#4
2930  073c               L202:
2931                     ; 591     if (CAN_IDE != CAN_Id_Standard)
2933  073c 0d0d          	tnz	(OFST+7,sp)
2934  073e 2724          	jreq	L3511
2935                     ; 593         assert_param(IS_CAN_EXTID_OK(CAN_Id));
2937  0740 96            	ldw	x,sp
2938  0741 1c0009        	addw	x,#OFST+3
2939  0744 cd0000        	call	c_ltor
2941  0747 ae0000        	ldw	x,#L602
2942  074a cd0000        	call	c_lcmp
2944  074d 2403          	jruge	L402
2945  074f 4f            	clr	a
2946  0750 2010          	jra	L012
2947  0752               L402:
2948  0752 ae0251        	ldw	x,#593
2949  0755 89            	pushw	x
2950  0756 ae0000        	ldw	x,#0
2951  0759 89            	pushw	x
2952  075a ae0008        	ldw	x,#L103
2953  075d cd0000        	call	_assert_failed
2955  0760 5b04          	addw	sp,#4
2956  0762               L012:
2958  0762 2022          	jra	L5511
2959  0764               L3511:
2960                     ; 597         assert_param(IS_CAN_STDID_OK(CAN_Id));
2962  0764 96            	ldw	x,sp
2963  0765 1c0009        	addw	x,#OFST+3
2964  0768 cd0000        	call	c_ltor
2966  076b ae0004        	ldw	x,#L412
2967  076e cd0000        	call	c_lcmp
2969  0771 2403          	jruge	L212
2970  0773 4f            	clr	a
2971  0774 2010          	jra	L612
2972  0776               L212:
2973  0776 ae0255        	ldw	x,#597
2974  0779 89            	pushw	x
2975  077a ae0000        	ldw	x,#0
2976  077d 89            	pushw	x
2977  077e ae0008        	ldw	x,#L103
2978  0781 cd0000        	call	_assert_failed
2980  0784 5b04          	addw	sp,#4
2981  0786               L612:
2982  0786               L5511:
2983                     ; 599     assert_param(IS_CAN_RTR_OK(CAN_RTR));
2985  0786 0d0e          	tnz	(OFST+8,sp)
2986  0788 2706          	jreq	L222
2987  078a 7b0e          	ld	a,(OFST+8,sp)
2988  078c a120          	cp	a,#32
2989  078e 2603          	jrne	L022
2990  0790               L222:
2991  0790 4f            	clr	a
2992  0791 2010          	jra	L422
2993  0793               L022:
2994  0793 ae0257        	ldw	x,#599
2995  0796 89            	pushw	x
2996  0797 ae0000        	ldw	x,#0
2997  079a 89            	pushw	x
2998  079b ae0008        	ldw	x,#L103
2999  079e cd0000        	call	_assert_failed
3001  07a1 5b04          	addw	sp,#4
3002  07a3               L422:
3003                     ; 600     assert_param(IS_CAN_DLC_OK(CAN_DLC));
3005  07a3 7b0f          	ld	a,(OFST+9,sp)
3006  07a5 a109          	cp	a,#9
3007  07a7 2403          	jruge	L622
3008  07a9 4f            	clr	a
3009  07aa 2010          	jra	L032
3010  07ac               L622:
3011  07ac ae0258        	ldw	x,#600
3012  07af 89            	pushw	x
3013  07b0 ae0000        	ldw	x,#0
3014  07b3 89            	pushw	x
3015  07b4 ae0008        	ldw	x,#L103
3016  07b7 cd0000        	call	_assert_failed
3018  07ba 5b04          	addw	sp,#4
3019  07bc               L032:
3020                     ; 602     if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
3022  07bc c65423        	ld	a,21539
3023  07bf a404          	and	a,#4
3024  07c1 a104          	cp	a,#4
3025  07c3 2604          	jrne	L7511
3026                     ; 604         CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
3028  07c5 0f06          	clr	(OFST+0,sp)
3030  07c7 2022          	jra	L1611
3031  07c9               L7511:
3032                     ; 606     else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
3034  07c9 c65423        	ld	a,21539
3035  07cc a408          	and	a,#8
3036  07ce a108          	cp	a,#8
3037  07d0 2606          	jrne	L3611
3038                     ; 608         CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
3040  07d2 a601          	ld	a,#1
3041  07d4 6b06          	ld	(OFST+0,sp),a
3043  07d6 2013          	jra	L1611
3044  07d8               L3611:
3045                     ; 610     else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
3047  07d8 c65423        	ld	a,21539
3048  07db a410          	and	a,#16
3049  07dd a110          	cp	a,#16
3050  07df 2606          	jrne	L7611
3051                     ; 612         CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
3053  07e1 a605          	ld	a,#5
3054  07e3 6b06          	ld	(OFST+0,sp),a
3056  07e5 2004          	jra	L1611
3057  07e7               L7611:
3058                     ; 616         CAN_TxStatus = CAN_TxStatus_NoMailBox;
3060  07e7 a6f4          	ld	a,#244
3061  07e9 6b06          	ld	(OFST+0,sp),a
3062  07eb               L1611:
3063                     ; 618     if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
3065  07eb 7b06          	ld	a,(OFST+0,sp)
3066  07ed a1f4          	cp	a,#244
3067  07ef 2603          	jrne	L232
3068  07f1 cc08bd        	jp	L3711
3069  07f4               L232:
3070                     ; 620         CAN->PSR = (uint8_t)CAN_TxStatus;
3072  07f4 7b06          	ld	a,(OFST+0,sp)
3073  07f6 c75427        	ld	21543,a
3074                     ; 622         if (CAN_IDE != CAN_Id_Standard)
3076  07f9 0d0d          	tnz	(OFST+7,sp)
3077  07fb 273b          	jreq	L5711
3078                     ; 624             CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
3080  07fd 7b09          	ld	a,(OFST+3,sp)
3081  07ff a41f          	and	a,#31
3082  0801 6b09          	ld	(OFST+3,sp),a
3083                     ; 625             CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
3085  0803 7b0c          	ld	a,(OFST+6,sp)
3086  0805 c7542d        	ld	21549,a
3087                     ; 626             CAN_Id = CAN_Id>>8;
3089  0808 96            	ldw	x,sp
3090  0809 1c0009        	addw	x,#OFST+3
3091  080c a608          	ld	a,#8
3092  080e cd0000        	call	c_lgursh
3094                     ; 627             CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
3096  0811 7b0c          	ld	a,(OFST+6,sp)
3097  0813 c7542c        	ld	21548,a
3098                     ; 628             CAN_Id = CAN_Id>>8;
3100  0816 96            	ldw	x,sp
3101  0817 1c0009        	addw	x,#OFST+3
3102  081a a608          	ld	a,#8
3103  081c cd0000        	call	c_lgursh
3105                     ; 629             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
3107  081f 7b0c          	ld	a,(OFST+6,sp)
3108  0821 c7542b        	ld	21547,a
3109                     ; 630             CAN_Id = CAN_Id>>8;
3111  0824 96            	ldw	x,sp
3112  0825 1c0009        	addw	x,#OFST+3
3113  0828 a608          	ld	a,#8
3114  082a cd0000        	call	c_lgursh
3116                     ; 631             CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
3118  082d 7b0c          	ld	a,(OFST+6,sp)
3119  082f 1a0d          	or	a,(OFST+7,sp)
3120  0831 1a0e          	or	a,(OFST+8,sp)
3121  0833 c7542a        	ld	21546,a
3123  0836 203a          	jra	L7711
3124  0838               L5711:
3125                     ; 635             CAN_Id &= (uint16_t)CAN_STDID_SIZE;
3127  0838 7b0b          	ld	a,(OFST+5,sp)
3128  083a a407          	and	a,#7
3129  083c 6b0b          	ld	(OFST+5,sp),a
3130  083e 0f0a          	clr	(OFST+4,sp)
3131  0840 0f09          	clr	(OFST+3,sp)
3132                     ; 636             CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
3134  0842 7b0e          	ld	a,(OFST+8,sp)
3135  0844 b703          	ld	c_lreg+3,a
3136  0846 3f02          	clr	c_lreg+2
3137  0848 3f01          	clr	c_lreg+1
3138  084a 3f00          	clr	c_lreg
3139  084c 96            	ldw	x,sp
3140  084d 1c0001        	addw	x,#OFST-5
3141  0850 cd0000        	call	c_rtol
3143  0853 96            	ldw	x,sp
3144  0854 1c0009        	addw	x,#OFST+3
3145  0857 cd0000        	call	c_ltor
3147  085a a606          	ld	a,#6
3148  085c cd0000        	call	c_lursh
3150  085f 96            	ldw	x,sp
3151  0860 1c0001        	addw	x,#OFST-5
3152  0863 cd0000        	call	c_lor
3154  0866 b603          	ld	a,c_lreg+3
3155  0868 c7542a        	ld	21546,a
3156                     ; 637             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
3158  086b 7b0c          	ld	a,(OFST+6,sp)
3159  086d 48            	sll	a
3160  086e 48            	sll	a
3161  086f c7542b        	ld	21547,a
3162  0872               L7711:
3163                     ; 641         CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
3165  0872 c65429        	ld	a,21545
3166  0875 a4f0          	and	a,#240
3167  0877 c75429        	ld	21545,a
3168                     ; 643         CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
3170  087a c65429        	ld	a,21545
3171  087d 1a0f          	or	a,(OFST+9,sp)
3172  087f c75429        	ld	21545,a
3173                     ; 645         CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
3175  0882 1e10          	ldw	x,(OFST+10,sp)
3176  0884 f6            	ld	a,(x)
3177  0885 c7542e        	ld	21550,a
3178                     ; 646         CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
3180  0888 1e10          	ldw	x,(OFST+10,sp)
3181  088a e601          	ld	a,(1,x)
3182  088c c7542f        	ld	21551,a
3183                     ; 647         CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
3185  088f 1e10          	ldw	x,(OFST+10,sp)
3186  0891 e602          	ld	a,(2,x)
3187  0893 c75430        	ld	21552,a
3188                     ; 648         CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
3190  0896 1e10          	ldw	x,(OFST+10,sp)
3191  0898 e603          	ld	a,(3,x)
3192  089a c75431        	ld	21553,a
3193                     ; 649         CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
3195  089d 1e10          	ldw	x,(OFST+10,sp)
3196  089f e604          	ld	a,(4,x)
3197  08a1 c75432        	ld	21554,a
3198                     ; 650         CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
3200  08a4 1e10          	ldw	x,(OFST+10,sp)
3201  08a6 e605          	ld	a,(5,x)
3202  08a8 c75433        	ld	21555,a
3203                     ; 651         CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
3205  08ab 1e10          	ldw	x,(OFST+10,sp)
3206  08ad e606          	ld	a,(6,x)
3207  08af c75434        	ld	21556,a
3208                     ; 652         CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
3210  08b2 1e10          	ldw	x,(OFST+10,sp)
3211  08b4 e607          	ld	a,(7,x)
3212  08b6 c75435        	ld	21557,a
3213                     ; 654         CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
3215  08b9 72105428      	bset	21544,#0
3216  08bd               L3711:
3217                     ; 657     CAN_SelectPage(can_page);
3219  08bd 7b05          	ld	a,(OFST-1,sp)
3220  08bf cd1043        	call	_CAN_SelectPage
3222                     ; 658     return (CAN_TxStatus_TypeDef)CAN_TxStatus;
3224  08c2 7b06          	ld	a,(OFST+0,sp)
3227  08c4 5b06          	addw	sp,#6
3228  08c6 81            	ret
3315                     ; 666 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3315                     ; 667 {
3316                     	switch	.text
3317  08c7               _CAN_TransmitStatus:
3319  08c7 88            	push	a
3320  08c8 88            	push	a
3321       00000001      OFST:	set	1
3324                     ; 669     CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
3326                     ; 670     uint8_t tmpstate=0;
3328  08c9 0f01          	clr	(OFST+0,sp)
3329                     ; 673     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3331  08cb 4d            	tnz	a
3332  08cc 2708          	jreq	L042
3333  08ce a101          	cp	a,#1
3334  08d0 2704          	jreq	L042
3335  08d2 a105          	cp	a,#5
3336  08d4 2603          	jrne	L632
3337  08d6               L042:
3338  08d6 4f            	clr	a
3339  08d7 2010          	jra	L242
3340  08d9               L632:
3341  08d9 ae02a1        	ldw	x,#673
3342  08dc 89            	pushw	x
3343  08dd ae0000        	ldw	x,#0
3344  08e0 89            	pushw	x
3345  08e1 ae0008        	ldw	x,#L103
3346  08e4 cd0000        	call	_assert_failed
3348  08e7 5b04          	addw	sp,#4
3349  08e9               L242:
3350                     ; 675     switch (CAN_TransmitMailbox)
3352  08e9 7b02          	ld	a,(OFST+1,sp)
3354                     ; 688         break;
3355  08eb 4d            	tnz	a
3356  08ec 2709          	jreq	L1021
3357  08ee 4a            	dec	a
3358  08ef 2718          	jreq	L3021
3359  08f1 a004          	sub	a,#4
3360  08f3 2728          	jreq	L5021
3361  08f5               L7021:
3362                     ; 686     default:
3362                     ; 687         tstate = CAN_TxStatus_Failed;
3364                     ; 688         break;
3366  08f5 203a          	jra	L5621
3367  08f7               L1021:
3368                     ; 677     case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
3370  08f7 c65422        	ld	a,21538
3371  08fa a411          	and	a,#17
3372  08fc 6b01          	ld	(OFST+0,sp),a
3373                     ; 678         tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
3375  08fe c65423        	ld	a,21539
3376  0901 a404          	and	a,#4
3377  0903 1a01          	or	a,(OFST+0,sp)
3378  0905 6b01          	ld	(OFST+0,sp),a
3379                     ; 679         break;
3381  0907 2028          	jra	L5621
3382  0909               L3021:
3383                     ; 680     case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3385  0909 c65422        	ld	a,21538
3386  090c a422          	and	a,#34
3387  090e 44            	srl	a
3388  090f 6b01          	ld	(OFST+0,sp),a
3389                     ; 681         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3391  0911 c65423        	ld	a,21539
3392  0914 a408          	and	a,#8
3393  0916 44            	srl	a
3394  0917 1a01          	or	a,(OFST+0,sp)
3395  0919 6b01          	ld	(OFST+0,sp),a
3396                     ; 682         break;
3398  091b 2014          	jra	L5621
3399  091d               L5021:
3400                     ; 683     case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3402  091d c65422        	ld	a,21538
3403  0920 a444          	and	a,#68
3404  0922 44            	srl	a
3405  0923 44            	srl	a
3406  0924 6b01          	ld	(OFST+0,sp),a
3407                     ; 684         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3409  0926 c65423        	ld	a,21539
3410  0929 a410          	and	a,#16
3411  092b 44            	srl	a
3412  092c 44            	srl	a
3413  092d 1a01          	or	a,(OFST+0,sp)
3414  092f 6b01          	ld	(OFST+0,sp),a
3415                     ; 685         break;
3417  0931               L5621:
3418                     ; 691     switch (tmpstate)
3420  0931 7b01          	ld	a,(OFST+0,sp)
3422                     ; 707         break;
3423  0933 4d            	tnz	a
3424  0934 2711          	jreq	L1121
3425  0936 a004          	sub	a,#4
3426  0938 271f          	jreq	L7121
3427  093a 4a            	dec	a
3428  093b 2710          	jreq	L3121
3429  093d a010          	sub	a,#16
3430  093f 2712          	jreq	L5121
3431  0941               L1221:
3432                     ; 705     default:
3432                     ; 706         tstate = CAN_TxStatus_Failed;
3434  0941 a6f0          	ld	a,#240
3435  0943 6b01          	ld	(OFST+0,sp),a
3436                     ; 707         break;
3438  0945 2016          	jra	L1721
3439  0947               L1121:
3440                     ; 694     case (0x00): tstate = CAN_TxStatus_Pending;
3442  0947 a6f2          	ld	a,#242
3443  0949 6b01          	ld	(OFST+0,sp),a
3444                     ; 695         break;
3446  094b 2010          	jra	L1721
3447  094d               L3121:
3448                     ; 697     case (0x05): tstate = CAN_TxStatus_Failed;
3450  094d a6f0          	ld	a,#240
3451  094f 6b01          	ld	(OFST+0,sp),a
3452                     ; 698         break;
3454  0951 200a          	jra	L1721
3455  0953               L5121:
3456                     ; 700     case (0x15): tstate = CAN_TxStatus_Ok;
3458  0953 a6f1          	ld	a,#241
3459  0955 6b01          	ld	(OFST+0,sp),a
3460                     ; 701         break;
3462  0957 2004          	jra	L1721
3463  0959               L7121:
3464                     ; 703     case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3466  0959 a6f5          	ld	a,#245
3467  095b 6b01          	ld	(OFST+0,sp),a
3468                     ; 704         break;
3470  095d               L1721:
3471                     ; 710     return (CAN_TxStatus_TypeDef)tstate;
3473  095d 7b01          	ld	a,(OFST+0,sp)
3476  095f 85            	popw	x
3477  0960 81            	ret
3526                     ; 718 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3526                     ; 719 {
3527                     	switch	.text
3528  0961               _CAN_CancelTransmit:
3530  0961 88            	push	a
3531  0962 88            	push	a
3532       00000001      OFST:	set	1
3535                     ; 720     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3537  0963 cd103f        	call	_CAN_GetSelectedPage
3539  0966 6b01          	ld	(OFST+0,sp),a
3540                     ; 722     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3542  0968 0d02          	tnz	(OFST+1,sp)
3543  096a 270c          	jreq	L052
3544  096c 7b02          	ld	a,(OFST+1,sp)
3545  096e a101          	cp	a,#1
3546  0970 2706          	jreq	L052
3547  0972 7b02          	ld	a,(OFST+1,sp)
3548  0974 a105          	cp	a,#5
3549  0976 2603          	jrne	L642
3550  0978               L052:
3551  0978 4f            	clr	a
3552  0979 2010          	jra	L252
3553  097b               L642:
3554  097b ae02d2        	ldw	x,#722
3555  097e 89            	pushw	x
3556  097f ae0000        	ldw	x,#0
3557  0982 89            	pushw	x
3558  0983 ae0008        	ldw	x,#L103
3559  0986 cd0000        	call	_assert_failed
3561  0989 5b04          	addw	sp,#4
3562  098b               L252:
3563                     ; 724     CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3565  098b 7b02          	ld	a,(OFST+1,sp)
3566  098d c75427        	ld	21543,a
3567                     ; 726     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3569  0990 72125428      	bset	21544,#1
3570                     ; 728     CAN_SelectPage(can_page);
3572  0994 7b01          	ld	a,(OFST+0,sp)
3573  0996 cd1043        	call	_CAN_SelectPage
3575                     ; 729 }
3578  0999 85            	popw	x
3579  099a 81            	ret
3602                     ; 736 void CAN_FIFORelease(void)
3602                     ; 737 {
3603                     	switch	.text
3604  099b               _CAN_FIFORelease:
3608                     ; 739     CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3610  099b 35205424      	mov	21540,#32
3611                     ; 740 }
3614  099f 81            	ret
3688                     ; 746 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3688                     ; 747 {
3689                     	switch	.text
3690  09a0               _CAN_MessagePending:
3692  09a0 88            	push	a
3693       00000001      OFST:	set	1
3696                     ; 748     CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3698                     ; 749     msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3700  09a1 c65424        	ld	a,21540
3701  09a4 a403          	and	a,#3
3702  09a6 6b01          	ld	(OFST+0,sp),a
3703                     ; 750     return (CAN_NbrPendingMessage_TypeDef)msgpending;
3705  09a8 7b01          	ld	a,(OFST+0,sp)
3708  09aa 5b01          	addw	sp,#1
3709  09ac 81            	ret
3780                     ; 761 void CAN_Receive(void)
3780                     ; 762 {
3781                     	switch	.text
3782  09ad               _CAN_Receive:
3784  09ad 520d          	subw	sp,#13
3785       0000000d      OFST:	set	13
3788                     ; 763     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3790  09af cd103f        	call	_CAN_GetSelectedPage
3792  09b2 6b01          	ld	(OFST-12,sp),a
3793                     ; 764     uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3799                     ; 767     CAN->PSR = CAN_Page_RxFifo;
3801  09b4 35075427      	mov	21543,#7
3802                     ; 770     _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3804  09b8 c6542a        	ld	a,21546
3805  09bb a440          	and	a,#64
3806  09bd b704          	ld	__IDE,a
3807                     ; 771     if (_IDE != CAN_Id_Standard)
3809  09bf 3d04          	tnz	__IDE
3810  09c1 2602          	jrne	L262
3811  09c3 207b          	jp	L1141
3812  09c5               L262:
3813                     ; 773       temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3815  09c5 c6542c        	ld	a,21548
3816  09c8 5f            	clrw	x
3817  09c9 97            	ld	xl,a
3818  09ca 90ae0100      	ldw	y,#256
3819  09ce cd0000        	call	c_umul
3821  09d1 96            	ldw	x,sp
3822  09d2 1c0006        	addw	x,#OFST-7
3823  09d5 cd0000        	call	c_rtol
3825                     ; 774       temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3827  09d8 c6542b        	ld	a,21547
3828  09db b703          	ld	c_lreg+3,a
3829  09dd 3f02          	clr	c_lreg+2
3830  09df 3f01          	clr	c_lreg+1
3831  09e1 3f00          	clr	c_lreg
3832  09e3 a610          	ld	a,#16
3833  09e5 cd0000        	call	c_llsh
3835  09e8 96            	ldw	x,sp
3836  09e9 1c000a        	addw	x,#OFST-3
3837  09ec cd0000        	call	c_rtol
3839                     ; 775       temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3841  09ef c6542a        	ld	a,21546
3842  09f2 b703          	ld	c_lreg+3,a
3843  09f4 3f02          	clr	c_lreg+2
3844  09f6 3f01          	clr	c_lreg+1
3845  09f8 3f00          	clr	c_lreg
3846  09fa b603          	ld	a,c_lreg+3
3847  09fc a41f          	and	a,#31
3848  09fe b703          	ld	c_lreg+3,a
3849  0a00 3f02          	clr	c_lreg+2
3850  0a02 3f01          	clr	c_lreg+1
3851  0a04 3f00          	clr	c_lreg
3852  0a06 a618          	ld	a,#24
3853  0a08 cd0000        	call	c_llsh
3855  0a0b 96            	ldw	x,sp
3856  0a0c 1c0002        	addw	x,#OFST-11
3857  0a0f cd0000        	call	c_rtol
3859                     ; 777       _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3861  0a12 c6542d        	ld	a,21549
3862  0a15 b703          	ld	c_lreg+3,a
3863  0a17 3f02          	clr	c_lreg+2
3864  0a19 3f01          	clr	c_lreg+1
3865  0a1b 3f00          	clr	c_lreg
3866  0a1d 96            	ldw	x,sp
3867  0a1e 1c0006        	addw	x,#OFST-7
3868  0a21 cd0000        	call	c_lor
3870  0a24 96            	ldw	x,sp
3871  0a25 1c000a        	addw	x,#OFST-3
3872  0a28 cd0000        	call	c_lor
3874  0a2b 96            	ldw	x,sp
3875  0a2c 1c0002        	addw	x,#OFST-11
3876  0a2f cd0000        	call	c_lor
3878  0a32 b600          	ld	a,c_lreg
3879  0a34 a41f          	and	a,#31
3880  0a36 b700          	ld	c_lreg,a
3881  0a38 ae0000        	ldw	x,#__Id
3882  0a3b cd0000        	call	c_rtol
3885  0a3e 204c          	jra	L3141
3886  0a40               L1141:
3887                     ; 781         temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3889  0a40 c6542a        	ld	a,21546
3890  0a43 5f            	clrw	x
3891  0a44 a41f          	and	a,#31
3892  0a46 5f            	clrw	x
3893  0a47 02            	rlwa	x,a
3894  0a48 58            	sllw	x
3895  0a49 58            	sllw	x
3896  0a4a 58            	sllw	x
3897  0a4b 58            	sllw	x
3898  0a4c 58            	sllw	x
3899  0a4d 58            	sllw	x
3900  0a4e cd0000        	call	c_uitolx
3902  0a51 96            	ldw	x,sp
3903  0a52 1c0006        	addw	x,#OFST-7
3904  0a55 cd0000        	call	c_rtol
3906                     ; 782         temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3908  0a58 c6542b        	ld	a,21547
3909  0a5b 5f            	clrw	x
3910  0a5c 97            	ld	xl,a
3911  0a5d 54            	srlw	x
3912  0a5e 54            	srlw	x
3913  0a5f 9f            	ld	a,xl
3914  0a60 5f            	clrw	x
3915  0a61 a43f          	and	a,#63
3916  0a63 5f            	clrw	x
3917  0a64 cd0000        	call	c_uitol
3919  0a67 96            	ldw	x,sp
3920  0a68 1c000a        	addw	x,#OFST-3
3921  0a6b cd0000        	call	c_rtol
3923                     ; 784       _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3925  0a6e 96            	ldw	x,sp
3926  0a6f 1c0006        	addw	x,#OFST-7
3927  0a72 cd0000        	call	c_ltor
3929  0a75 96            	ldw	x,sp
3930  0a76 1c000a        	addw	x,#OFST-3
3931  0a79 cd0000        	call	c_lor
3933  0a7c b602          	ld	a,c_lreg+2
3934  0a7e a407          	and	a,#7
3935  0a80 b702          	ld	c_lreg+2,a
3936  0a82 3f01          	clr	c_lreg+1
3937  0a84 3f00          	clr	c_lreg
3938  0a86 ae0000        	ldw	x,#__Id
3939  0a89 cd0000        	call	c_rtol
3941  0a8c               L3141:
3942                     ; 787     _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
3944  0a8c c6542a        	ld	a,21546
3945  0a8f a420          	and	a,#32
3946  0a91 b705          	ld	__RTR,a
3947                     ; 790     _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
3949  0a93 c65429        	ld	a,21545
3950  0a96 a40f          	and	a,#15
3951  0a98 b706          	ld	__DLC,a
3952                     ; 793     _FMI = CAN->Page.RxFIFO.MFMI;
3954  0a9a 555428000f    	mov	__FMI,21544
3955                     ; 796     _Data[0] = CAN->Page.RxFIFO.MDAR1;
3957  0a9f 55542e0007    	mov	__Data,21550
3958                     ; 797     _Data[1] = CAN->Page.RxFIFO.MDAR2;
3960  0aa4 55542f0008    	mov	__Data+1,21551
3961                     ; 798     _Data[2] = CAN->Page.RxFIFO.MDAR3;
3963  0aa9 5554300009    	mov	__Data+2,21552
3964                     ; 799     _Data[3] = CAN->Page.RxFIFO.MDAR4;
3966  0aae 555431000a    	mov	__Data+3,21553
3967                     ; 800     _Data[4] = CAN->Page.RxFIFO.MDAR5;
3969  0ab3 555432000b    	mov	__Data+4,21554
3970                     ; 801     _Data[5] = CAN->Page.RxFIFO.MDAR6;
3972  0ab8 555433000c    	mov	__Data+5,21555
3973                     ; 802     _Data[6] = CAN->Page.RxFIFO.MDAR7;
3975  0abd 555434000d    	mov	__Data+6,21556
3976                     ; 803     _Data[7] = CAN->Page.RxFIFO.MDAR8;
3978  0ac2 555435000e    	mov	__Data+7,21557
3979                     ; 806     CAN_FIFORelease();
3981  0ac7 cd099b        	call	_CAN_FIFORelease
3983                     ; 808     CAN_SelectPage(can_page);
3985  0aca 7b01          	ld	a,(OFST-12,sp)
3986  0acc cd1043        	call	_CAN_SelectPage
3988                     ; 809 }
3991  0acf 5b0d          	addw	sp,#13
3992  0ad1 81            	ret
4016                     ; 819 uint32_t CAN_GetReceivedId(void)
4016                     ; 820 {
4017                     	switch	.text
4018  0ad2               _CAN_GetReceivedId:
4022                     ; 821     return (_Id);
4024  0ad2 ae0000        	ldw	x,#__Id
4025  0ad5 cd0000        	call	c_ltor
4029  0ad8 81            	ret
4054                     ; 832 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
4054                     ; 833 {
4055                     	switch	.text
4056  0ad9               _CAN_GetReceivedIDE:
4060                     ; 834     return (CAN_Id_TypeDef)(_IDE);
4062  0ad9 b604          	ld	a,__IDE
4065  0adb 81            	ret
4090                     ; 845 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
4090                     ; 846 {
4091                     	switch	.text
4092  0adc               _CAN_GetReceivedRTR:
4096                     ; 847     return (CAN_RTR_TypeDef)(_RTR);
4098  0adc b605          	ld	a,__RTR
4101  0ade 81            	ret
4125                     ; 858 uint8_t CAN_GetReceivedDLC(void)
4125                     ; 859 {
4126                     	switch	.text
4127  0adf               _CAN_GetReceivedDLC:
4131                     ; 860     return (_DLC);
4133  0adf b606          	ld	a,__DLC
4136  0ae1 81            	ret
4173                     ; 872 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
4173                     ; 873 {
4174                     	switch	.text
4175  0ae2               _CAN_GetReceivedData:
4177  0ae2 88            	push	a
4178       00000000      OFST:	set	0
4181                     ; 874     assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
4183  0ae3 a109          	cp	a,#9
4184  0ae5 2403          	jruge	L672
4185  0ae7 4f            	clr	a
4186  0ae8 2010          	jra	L003
4187  0aea               L672:
4188  0aea ae036a        	ldw	x,#874
4189  0aed 89            	pushw	x
4190  0aee ae0000        	ldw	x,#0
4191  0af1 89            	pushw	x
4192  0af2 ae0008        	ldw	x,#L103
4193  0af5 cd0000        	call	_assert_failed
4195  0af8 5b04          	addw	sp,#4
4196  0afa               L003:
4197                     ; 875     return (_Data[CAN_DataIndex]);
4199  0afa 7b01          	ld	a,(OFST+1,sp)
4200  0afc 5f            	clrw	x
4201  0afd 97            	ld	xl,a
4202  0afe e607          	ld	a,(__Data,x)
4205  0b00 5b01          	addw	sp,#1
4206  0b02 81            	ret
4230                     ; 886 uint8_t CAN_GetReceivedFMI(void)
4230                     ; 887 {
4231                     	switch	.text
4232  0b03               _CAN_GetReceivedFMI:
4236                     ; 888     return (_FMI);
4238  0b03 b60f          	ld	a,__FMI
4241  0b05 81            	ret
4288                     ; 896 uint16_t CAN_GetMessageTimeStamp(void)
4288                     ; 897 {
4289                     	switch	.text
4290  0b06               _CAN_GetMessageTimeStamp:
4292  0b06 5203          	subw	sp,#3
4293       00000003      OFST:	set	3
4296                     ; 898     uint16_t timestamp = 0;
4298                     ; 899     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4300  0b08 cd103f        	call	_CAN_GetSelectedPage
4302  0b0b 6b01          	ld	(OFST-2,sp),a
4303                     ; 902     CAN->PSR = CAN_Page_RxFifo;
4305  0b0d 35075427      	mov	21543,#7
4306                     ; 904     timestamp = CAN->Page.RxFIFO.MTSRL;
4308  0b11 c65436        	ld	a,21558
4309  0b14 5f            	clrw	x
4310  0b15 97            	ld	xl,a
4311  0b16 1f02          	ldw	(OFST-1,sp),x
4312                     ; 905     timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
4314  0b18 c65437        	ld	a,21559
4315  0b1b 5f            	clrw	x
4316  0b1c 97            	ld	xl,a
4317  0b1d 4f            	clr	a
4318  0b1e 02            	rlwa	x,a
4319  0b1f 01            	rrwa	x,a
4320  0b20 1a03          	or	a,(OFST+0,sp)
4321  0b22 01            	rrwa	x,a
4322  0b23 1a02          	or	a,(OFST-1,sp)
4323  0b25 01            	rrwa	x,a
4324  0b26 1f02          	ldw	(OFST-1,sp),x
4325                     ; 908     CAN_SelectPage(can_page);
4327  0b28 7b01          	ld	a,(OFST-2,sp)
4328  0b2a cd1043        	call	_CAN_SelectPage
4330                     ; 910     return (uint16_t)(timestamp);
4332  0b2d 1e02          	ldw	x,(OFST-1,sp)
4335  0b2f 5b03          	addw	sp,#3
4336  0b31 81            	ret
4392                     ; 918 CAN_Sleep_TypeDef CAN_Sleep(void)
4392                     ; 919 {
4393                     	switch	.text
4394  0b32               _CAN_Sleep:
4396  0b32 88            	push	a
4397       00000001      OFST:	set	1
4400                     ; 921     CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4402  0b33 0f01          	clr	(OFST+0,sp)
4403                     ; 924     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4405  0b35 c65420        	ld	a,21536
4406  0b38 a4fe          	and	a,#254
4407  0b3a aa02          	or	a,#2
4408  0b3c c75420        	ld	21536,a
4409                     ; 927     if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4411  0b3f c65421        	ld	a,21537
4412  0b42 a403          	and	a,#3
4413  0b44 a102          	cp	a,#2
4414  0b46 2604          	jrne	L3551
4415                     ; 930         sleepstatus =  CAN_Sleep_Ok;
4417  0b48 a601          	ld	a,#1
4418  0b4a 6b01          	ld	(OFST+0,sp),a
4419  0b4c               L3551:
4420                     ; 934     return (CAN_Sleep_TypeDef) sleepstatus;
4422  0b4c 7b01          	ld	a,(OFST+0,sp)
4425  0b4e 5b01          	addw	sp,#1
4426  0b50 81            	ret
4482                     ; 942 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4482                     ; 943 {
4483                     	switch	.text
4484  0b51               _CAN_WakeUp:
4486  0b51 88            	push	a
4487       00000001      OFST:	set	1
4490                     ; 944     CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4492  0b52 0f01          	clr	(OFST+0,sp)
4493                     ; 947     CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4495  0b54 72135420      	bres	21536,#1
4496                     ; 950     if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4498  0b58 c65421        	ld	a,21537
4499  0b5b a402          	and	a,#2
4500  0b5d a102          	cp	a,#2
4501  0b5f 2704          	jreq	L3061
4502                     ; 953         wakeupstatus = CAN_WakeUp_Ok;
4504  0b61 a601          	ld	a,#1
4505  0b63 6b01          	ld	(OFST+0,sp),a
4506  0b65               L3061:
4507                     ; 957     return (CAN_WakeUp_TypeDef)wakeupstatus;
4509  0b65 7b01          	ld	a,(OFST+0,sp)
4512  0b67 5b01          	addw	sp,#1
4513  0b69 81            	ret
4621                     ; 969 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4621                     ; 970 {
4622                     	switch	.text
4623  0b6a               _CAN_OperatingModeRequest:
4625  0b6a 88            	push	a
4626  0b6b 5203          	subw	sp,#3
4627       00000003      OFST:	set	3
4630                     ; 972     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4632  0b6d aeffff        	ldw	x,#65535
4633  0b70 1f02          	ldw	(OFST-1,sp),x
4634                     ; 973     uint8_t modestatus = 0;
4636                     ; 975     assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4638  0b72 4d            	tnz	a
4639  0b73 2708          	jreq	L613
4640  0b75 a101          	cp	a,#1
4641  0b77 2704          	jreq	L613
4642  0b79 a102          	cp	a,#2
4643  0b7b 2603          	jrne	L413
4644  0b7d               L613:
4645  0b7d 4f            	clr	a
4646  0b7e 2010          	jra	L023
4647  0b80               L413:
4648  0b80 ae03cf        	ldw	x,#975
4649  0b83 89            	pushw	x
4650  0b84 ae0000        	ldw	x,#0
4651  0b87 89            	pushw	x
4652  0b88 ae0008        	ldw	x,#L103
4653  0b8b cd0000        	call	_assert_failed
4655  0b8e 5b04          	addw	sp,#4
4656  0b90               L023:
4657                     ; 977     if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4659  0b90 0d04          	tnz	(OFST+1,sp)
4660  0b92 2633          	jrne	L5561
4661                     ; 980         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4663  0b94 c65420        	ld	a,21536
4664  0b97 a4fd          	and	a,#253
4665  0b99 aa01          	or	a,#1
4666  0b9b c75420        	ld	21536,a
4668  0b9e 2007          	jra	L3661
4669  0ba0               L7561:
4670                     ; 985             timeout--;
4672  0ba0 1e02          	ldw	x,(OFST-1,sp)
4673  0ba2 1d0001        	subw	x,#1
4674  0ba5 1f02          	ldw	(OFST-1,sp),x
4675  0ba7               L3661:
4676                     ; 983         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4678  0ba7 c65421        	ld	a,21537
4679  0baa a403          	and	a,#3
4680  0bac a101          	cp	a,#1
4681  0bae 2704          	jreq	L7661
4683  0bb0 1e02          	ldw	x,(OFST-1,sp)
4684  0bb2 26ec          	jrne	L7561
4685  0bb4               L7661:
4686                     ; 987         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4688  0bb4 c65421        	ld	a,21537
4689  0bb7 a403          	and	a,#3
4690  0bb9 a101          	cp	a,#1
4691  0bbb 2704          	jreq	L1761
4692                     ; 989           modestatus = CAN_ModeStatus_Failed;
4694  0bbd 0f01          	clr	(OFST-2,sp)
4696  0bbf 2074          	jra	L5761
4697  0bc1               L1761:
4698                     ; 993           modestatus = CAN_ModeStatus_Success;  
4700  0bc1 a601          	ld	a,#1
4701  0bc3 6b01          	ld	(OFST-2,sp),a
4702  0bc5 206e          	jra	L5761
4703  0bc7               L5561:
4704                     ; 997     else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4706  0bc7 7b04          	ld	a,(OFST+1,sp)
4707  0bc9 a101          	cp	a,#1
4708  0bcb 262d          	jrne	L7761
4709                     ; 1000         CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4711  0bcd c65420        	ld	a,21536
4712  0bd0 a4fc          	and	a,#252
4713  0bd2 c75420        	ld	21536,a
4715  0bd5 2007          	jra	L3071
4716  0bd7               L1071:
4717                     ; 1005             timeout--;
4719  0bd7 1e02          	ldw	x,(OFST-1,sp)
4720  0bd9 1d0001        	subw	x,#1
4721  0bdc 1f02          	ldw	(OFST-1,sp),x
4722  0bde               L3071:
4723                     ; 1003         while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4725  0bde c65421        	ld	a,21537
4726  0be1 a503          	bcp	a,#3
4727  0be3 2704          	jreq	L7071
4729  0be5 1e02          	ldw	x,(OFST-1,sp)
4730  0be7 26ee          	jrne	L1071
4731  0be9               L7071:
4732                     ; 1007         if ((CAN->MSR & CAN_MODE_MASK) != 0)
4734  0be9 c65421        	ld	a,21537
4735  0bec a503          	bcp	a,#3
4736  0bee 2704          	jreq	L1171
4737                     ; 1009           modestatus = CAN_ModeStatus_Failed;
4739  0bf0 0f01          	clr	(OFST-2,sp)
4741  0bf2 2041          	jra	L5761
4742  0bf4               L1171:
4743                     ; 1013           modestatus = CAN_ModeStatus_Success;  
4745  0bf4 a601          	ld	a,#1
4746  0bf6 6b01          	ld	(OFST-2,sp),a
4747  0bf8 203b          	jra	L5761
4748  0bfa               L7761:
4749                     ; 1016     else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4751  0bfa 7b04          	ld	a,(OFST+1,sp)
4752  0bfc a102          	cp	a,#2
4753  0bfe 2633          	jrne	L7171
4754                     ; 1019         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4756  0c00 c65420        	ld	a,21536
4757  0c03 a4fe          	and	a,#254
4758  0c05 aa02          	or	a,#2
4759  0c07 c75420        	ld	21536,a
4761  0c0a 2007          	jra	L5271
4762  0c0c               L1271:
4763                     ; 1024             timeout--;
4765  0c0c 1e02          	ldw	x,(OFST-1,sp)
4766  0c0e 1d0001        	subw	x,#1
4767  0c11 1f02          	ldw	(OFST-1,sp),x
4768  0c13               L5271:
4769                     ; 1022         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4771  0c13 c65421        	ld	a,21537
4772  0c16 a403          	and	a,#3
4773  0c18 a102          	cp	a,#2
4774  0c1a 2704          	jreq	L1371
4776  0c1c 1e02          	ldw	x,(OFST-1,sp)
4777  0c1e 26ec          	jrne	L1271
4778  0c20               L1371:
4779                     ; 1026         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4781  0c20 c65421        	ld	a,21537
4782  0c23 a403          	and	a,#3
4783  0c25 a102          	cp	a,#2
4784  0c27 2704          	jreq	L3371
4785                     ; 1028            modestatus = CAN_ModeStatus_Failed;  
4787  0c29 0f01          	clr	(OFST-2,sp)
4789  0c2b 2008          	jra	L5761
4790  0c2d               L3371:
4791                     ; 1032            modestatus = CAN_ModeStatus_Success;  
4793  0c2d a601          	ld	a,#1
4794  0c2f 6b01          	ld	(OFST-2,sp),a
4795  0c31 2002          	jra	L5761
4796  0c33               L7171:
4797                     ; 1037          modestatus = CAN_ModeStatus_Failed;
4799  0c33 0f01          	clr	(OFST-2,sp)
4800  0c35               L5761:
4801                     ; 1039   return (CAN_ModeStatus_TypeDef)(modestatus);
4803  0c35 7b01          	ld	a,(OFST-2,sp)
4806  0c37 5b04          	addw	sp,#4
4807  0c39 81            	ret
4926                     ; 1047 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
4926                     ; 1048 {
4927                     	switch	.text
4928  0c3a               _CAN_GetLastErrorCode:
4930  0c3a 89            	pushw	x
4931       00000002      OFST:	set	2
4934                     ; 1049     CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
4936                     ; 1050     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4938  0c3b cd103f        	call	_CAN_GetSelectedPage
4940  0c3e 6b01          	ld	(OFST-1,sp),a
4941                     ; 1052     CAN->PSR = CAN_Page_Config;
4943  0c40 35065427      	mov	21543,#6
4944                     ; 1053     errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
4946  0c44 c65428        	ld	a,21544
4947  0c47 a470          	and	a,#112
4948  0c49 6b02          	ld	(OFST+0,sp),a
4949                     ; 1056     CAN_SelectPage(can_page);
4951  0c4b 7b01          	ld	a,(OFST-1,sp)
4952  0c4d cd1043        	call	_CAN_SelectPage
4954                     ; 1058     return (CAN_ErrorCode_TypeDef)(errcode);
4956  0c50 7b02          	ld	a,(OFST+0,sp)
4959  0c52 85            	popw	x
4960  0c53 81            	ret
5091                     ; 1073 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
5091                     ; 1074 {
5092                     	switch	.text
5093  0c54               _CAN_ClearFlag:
5095  0c54 89            	pushw	x
5096  0c55 88            	push	a
5097       00000001      OFST:	set	1
5100                     ; 1075     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5102                     ; 1077     assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
5104  0c56 a33401        	cpw	x,#13313
5105  0c59 271e          	jreq	L033
5106  0c5b a33402        	cpw	x,#13314
5107  0c5e 2719          	jreq	L033
5108  0c60 a33404        	cpw	x,#13316
5109  0c63 2714          	jreq	L033
5110  0c65 a33208        	cpw	x,#12808
5111  0c68 270f          	jreq	L033
5112  0c6a a33210        	cpw	x,#12816
5113  0c6d 270a          	jreq	L033
5114  0c6f a33108        	cpw	x,#12552
5115  0c72 2705          	jreq	L033
5116  0c74 a33070        	cpw	x,#12400
5117  0c77 2603          	jrne	L623
5118  0c79               L033:
5119  0c79 4f            	clr	a
5120  0c7a 2010          	jra	L233
5121  0c7c               L623:
5122  0c7c ae0435        	ldw	x,#1077
5123  0c7f 89            	pushw	x
5124  0c80 ae0000        	ldw	x,#0
5125  0c83 89            	pushw	x
5126  0c84 ae0008        	ldw	x,#L103
5127  0c87 cd0000        	call	_assert_failed
5129  0c8a 5b04          	addw	sp,#4
5130  0c8c               L233:
5131                     ; 1078     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5133  0c8c 7b02          	ld	a,(OFST+1,sp)
5134  0c8e a507          	bcp	a,#7
5135  0c90 2731          	jreq	L3602
5136                     ; 1080         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5138  0c92 1e02          	ldw	x,(OFST+1,sp)
5139  0c94 01            	rrwa	x,a
5140  0c95 a40b          	and	a,#11
5141  0c97 01            	rrwa	x,a
5142  0c98 a402          	and	a,#2
5143  0c9a 01            	rrwa	x,a
5144  0c9b a30000        	cpw	x,#0
5145  0c9e 2707          	jreq	L5602
5146                     ; 1083             CAN->RFR = (uint8_t)(CAN_Flag);
5148  0ca0 7b03          	ld	a,(OFST+2,sp)
5149  0ca2 c75424        	ld	21540,a
5151  0ca5 202e          	jra	L5702
5152  0ca7               L5602:
5153                     ; 1085         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5155  0ca7 1e02          	ldw	x,(OFST+1,sp)
5156  0ca9 01            	rrwa	x,a
5157  0caa a403          	and	a,#3
5158  0cac 01            	rrwa	x,a
5159  0cad a404          	and	a,#4
5160  0caf 01            	rrwa	x,a
5161  0cb0 a30000        	cpw	x,#0
5162  0cb3 2707          	jreq	L1702
5163                     ; 1088             CAN->TSR = (uint8_t)(CAN_Flag);
5165  0cb5 7b03          	ld	a,(OFST+2,sp)
5166  0cb7 c75422        	ld	21538,a
5168  0cba 2019          	jra	L5702
5169  0cbc               L1702:
5170                     ; 1093             CAN->MSR = (uint8_t)(CAN_Flag);
5172  0cbc 7b03          	ld	a,(OFST+2,sp)
5173  0cbe c75421        	ld	21537,a
5174  0cc1 2012          	jra	L5702
5175  0cc3               L3602:
5176                     ; 1099         can_page = CAN_GetSelectedPage();
5178  0cc3 cd103f        	call	_CAN_GetSelectedPage
5180  0cc6 6b01          	ld	(OFST+0,sp),a
5181                     ; 1102         CAN->PSR = CAN_Page_Config;
5183  0cc8 35065427      	mov	21543,#6
5184                     ; 1103         CAN->Page.Config.ESR = (uint8_t)RESET;
5186  0ccc 725f5428      	clr	21544
5187                     ; 1106         CAN_SelectPage(can_page);
5189  0cd0 7b01          	ld	a,(OFST+0,sp)
5190  0cd2 cd1043        	call	_CAN_SelectPage
5192  0cd5               L5702:
5193                     ; 1108 }
5196  0cd5 5b03          	addw	sp,#3
5197  0cd7 81            	ret
5276                     ; 1115 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
5276                     ; 1116 {
5277                     	switch	.text
5278  0cd8               _CAN_GetFlagStatus:
5280  0cd8 89            	pushw	x
5281  0cd9 89            	pushw	x
5282       00000002      OFST:	set	2
5285                     ; 1117     FlagStatus bitstatus = RESET;
5287                     ; 1118     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5289                     ; 1121     assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
5291  0cda a33401        	cpw	x,#13313
5292  0cdd 2732          	jreq	L043
5293  0cdf a33402        	cpw	x,#13314
5294  0ce2 272d          	jreq	L043
5295  0ce4 a33404        	cpw	x,#13316
5296  0ce7 2728          	jreq	L043
5297  0ce9 a31203        	cpw	x,#4611
5298  0cec 2723          	jreq	L043
5299  0cee a33208        	cpw	x,#12808
5300  0cf1 271e          	jreq	L043
5301  0cf3 a33210        	cpw	x,#12816
5302  0cf6 2719          	jreq	L043
5303  0cf8 a33108        	cpw	x,#12552
5304  0cfb 2714          	jreq	L043
5305  0cfd a31001        	cpw	x,#4097
5306  0d00 270f          	jreq	L043
5307  0d02 a31002        	cpw	x,#4098
5308  0d05 270a          	jreq	L043
5309  0d07 a31004        	cpw	x,#4100
5310  0d0a 2705          	jreq	L043
5311  0d0c a33070        	cpw	x,#12400
5312  0d0f 2603          	jrne	L633
5313  0d11               L043:
5314  0d11 4f            	clr	a
5315  0d12 2010          	jra	L243
5316  0d14               L633:
5317  0d14 ae0461        	ldw	x,#1121
5318  0d17 89            	pushw	x
5319  0d18 ae0000        	ldw	x,#0
5320  0d1b 89            	pushw	x
5321  0d1c ae0008        	ldw	x,#L103
5322  0d1f cd0000        	call	_assert_failed
5324  0d22 5b04          	addw	sp,#4
5325  0d24               L243:
5326                     ; 1123     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5328  0d24 7b03          	ld	a,(OFST+1,sp)
5329  0d26 a507          	bcp	a,#7
5330  0d28 274f          	jreq	L5312
5331                     ; 1125         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5333  0d2a 1e03          	ldw	x,(OFST+1,sp)
5334  0d2c 01            	rrwa	x,a
5335  0d2d a40b          	and	a,#11
5336  0d2f 01            	rrwa	x,a
5337  0d30 a402          	and	a,#2
5338  0d32 01            	rrwa	x,a
5339  0d33 a30000        	cpw	x,#0
5340  0d36 2711          	jreq	L7312
5341                     ; 1128             if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
5343  0d38 c65424        	ld	a,21540
5344  0d3b 1404          	and	a,(OFST+2,sp)
5345  0d3d 2706          	jreq	L1412
5346                     ; 1131                 bitstatus = SET;
5348  0d3f a601          	ld	a,#1
5349  0d41 6b02          	ld	(OFST+0,sp),a
5351  0d43 2051          	jra	L3612
5352  0d45               L1412:
5353                     ; 1136                 bitstatus = RESET;
5355  0d45 0f02          	clr	(OFST+0,sp)
5356  0d47 204d          	jra	L3612
5357  0d49               L7312:
5358                     ; 1140         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5360  0d49 1e03          	ldw	x,(OFST+1,sp)
5361  0d4b 01            	rrwa	x,a
5362  0d4c a403          	and	a,#3
5363  0d4e 01            	rrwa	x,a
5364  0d4f a404          	and	a,#4
5365  0d51 01            	rrwa	x,a
5366  0d52 a30000        	cpw	x,#0
5367  0d55 2711          	jreq	L7412
5368                     ; 1143             if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
5370  0d57 c65422        	ld	a,21538
5371  0d5a 1404          	and	a,(OFST+2,sp)
5372  0d5c 2706          	jreq	L1512
5373                     ; 1146                 bitstatus = SET;
5375  0d5e a601          	ld	a,#1
5376  0d60 6b02          	ld	(OFST+0,sp),a
5378  0d62 2032          	jra	L3612
5379  0d64               L1512:
5380                     ; 1151                 bitstatus = RESET;
5382  0d64 0f02          	clr	(OFST+0,sp)
5383  0d66 202e          	jra	L3612
5384  0d68               L7412:
5385                     ; 1157             if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
5387  0d68 c65421        	ld	a,21537
5388  0d6b 1404          	and	a,(OFST+2,sp)
5389  0d6d 2706          	jreq	L7512
5390                     ; 1160                 bitstatus = SET;
5392  0d6f a601          	ld	a,#1
5393  0d71 6b02          	ld	(OFST+0,sp),a
5395  0d73 2021          	jra	L3612
5396  0d75               L7512:
5397                     ; 1165                 bitstatus = RESET;
5399  0d75 0f02          	clr	(OFST+0,sp)
5400  0d77 201d          	jra	L3612
5401  0d79               L5312:
5402                     ; 1172         can_page = CAN_GetSelectedPage();
5404  0d79 cd103f        	call	_CAN_GetSelectedPage
5406  0d7c 6b01          	ld	(OFST-1,sp),a
5407                     ; 1174         CAN->PSR = CAN_Page_Config;
5409  0d7e 35065427      	mov	21543,#6
5410                     ; 1175         if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
5412  0d82 c65428        	ld	a,21544
5413  0d85 1404          	and	a,(OFST+2,sp)
5414  0d87 2706          	jreq	L5612
5415                     ; 1178             bitstatus = SET;
5417  0d89 a601          	ld	a,#1
5418  0d8b 6b02          	ld	(OFST+0,sp),a
5420  0d8d 2002          	jra	L7612
5421  0d8f               L5612:
5422                     ; 1183             bitstatus = RESET;
5424  0d8f 0f02          	clr	(OFST+0,sp)
5425  0d91               L7612:
5426                     ; 1186         CAN_SelectPage(can_page);
5428  0d91 7b01          	ld	a,(OFST-1,sp)
5429  0d93 cd1043        	call	_CAN_SelectPage
5431  0d96               L3612:
5432                     ; 1191     return  (FlagStatus)bitstatus;
5434  0d96 7b02          	ld	a,(OFST+0,sp)
5437  0d98 5b04          	addw	sp,#4
5438  0d9a 81            	ret
5498                     ; 1199 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5498                     ; 1200 {
5499                     	switch	.text
5500  0d9b               _CAN_GetITStatus:
5502  0d9b 89            	pushw	x
5503  0d9c 89            	pushw	x
5504       00000002      OFST:	set	2
5507                     ; 1201     ITStatus pendingbitstatus = RESET;
5509                     ; 1202     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5511  0d9d cd103f        	call	_CAN_GetSelectedPage
5513  0da0 6b01          	ld	(OFST-1,sp),a
5514                     ; 1205     assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5516  0da2 1e03          	ldw	x,(OFST+1,sp)
5517  0da4 a30001        	cpw	x,#1
5518  0da7 273f          	jreq	L053
5519  0da9 1e03          	ldw	x,(OFST+1,sp)
5520  0dab a30002        	cpw	x,#2
5521  0dae 2738          	jreq	L053
5522  0db0 1e03          	ldw	x,(OFST+1,sp)
5523  0db2 a30004        	cpw	x,#4
5524  0db5 2731          	jreq	L053
5525  0db7 1e03          	ldw	x,(OFST+1,sp)
5526  0db9 a30008        	cpw	x,#8
5527  0dbc 272a          	jreq	L053
5528  0dbe 1e03          	ldw	x,(OFST+1,sp)
5529  0dc0 a30080        	cpw	x,#128
5530  0dc3 2723          	jreq	L053
5531  0dc5 1e03          	ldw	x,(OFST+1,sp)
5532  0dc7 a34000        	cpw	x,#16384
5533  0dca 271c          	jreq	L053
5534  0dcc 1e03          	ldw	x,(OFST+1,sp)
5535  0dce a30100        	cpw	x,#256
5536  0dd1 2715          	jreq	L053
5537  0dd3 1e03          	ldw	x,(OFST+1,sp)
5538  0dd5 a30200        	cpw	x,#512
5539  0dd8 270e          	jreq	L053
5540  0dda 1e03          	ldw	x,(OFST+1,sp)
5541  0ddc a30400        	cpw	x,#1024
5542  0ddf 2707          	jreq	L053
5543  0de1 1e03          	ldw	x,(OFST+1,sp)
5544  0de3 a30800        	cpw	x,#2048
5545  0de6 2603          	jrne	L643
5546  0de8               L053:
5547  0de8 4f            	clr	a
5548  0de9 2010          	jra	L253
5549  0deb               L643:
5550  0deb ae04b5        	ldw	x,#1205
5551  0dee 89            	pushw	x
5552  0def ae0000        	ldw	x,#0
5553  0df2 89            	pushw	x
5554  0df3 ae0008        	ldw	x,#L103
5555  0df6 cd0000        	call	_assert_failed
5557  0df9 5b04          	addw	sp,#4
5558  0dfb               L253:
5559                     ; 1208     switch (CAN_IT)
5561  0dfb 1e03          	ldw	x,(OFST+1,sp)
5563                     ; 1321         break;
5564  0dfd 5a            	decw	x
5565  0dfe 2746          	jreq	L1712
5566  0e00 5a            	decw	x
5567  0e01 2760          	jreq	L3712
5568  0e03 1d0002        	subw	x,#2
5569  0e06 2778          	jreq	L5712
5570  0e08 1d0004        	subw	x,#4
5571  0e0b 2603          	jrne	L453
5572  0e0d cc0e9d        	jp	L7712
5573  0e10               L453:
5574  0e10 1d0078        	subw	x,#120
5575  0e13 2603          	jrne	L653
5576  0e15 cc0eba        	jp	L1022
5577  0e18               L653:
5578  0e18 1d0080        	subw	x,#128
5579  0e1b 2603          	jrne	L063
5580  0e1d cc0ef4        	jp	L5022
5581  0e20               L063:
5582  0e20 1d0100        	subw	x,#256
5583  0e23 2603          	jrne	L263
5584  0e25 cc0f11        	jp	L7022
5585  0e28               L263:
5586  0e28 1d0200        	subw	x,#512
5587  0e2b 2603          	jrne	L463
5588  0e2d cc0f2e        	jp	L1122
5589  0e30               L463:
5590  0e30 1d0400        	subw	x,#1024
5591  0e33 2603          	jrne	L663
5592  0e35 cc0f4b        	jp	L3122
5593  0e38               L663:
5594  0e38 1d3800        	subw	x,#14336
5595  0e3b 2603          	jrne	L073
5596  0e3d cc0ed7        	jp	L3022
5597  0e40               L073:
5598  0e40               L5122:
5599                     ; 1319     default :
5599                     ; 1320         pendingbitstatus = RESET;
5601  0e40 0f02          	clr	(OFST+0,sp)
5602                     ; 1321         break;
5604  0e42 ac660f66      	jpf	L7422
5605  0e46               L1712:
5606                     ; 1210     case CAN_IT_TME:
5606                     ; 1211         if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5608  0e46 c65425        	ld	a,21541
5609  0e49 a501          	bcp	a,#1
5610  0e4b 2710          	jreq	L1522
5611                     ; 1213             pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5613  0e4d ae0007        	ldw	x,#7
5614  0e50 c65422        	ld	a,21538
5615  0e53 95            	ld	xh,a
5616  0e54 cd1047        	call	L3_CheckITStatus
5618  0e57 6b02          	ld	(OFST+0,sp),a
5620  0e59 ac660f66      	jpf	L7422
5621  0e5d               L1522:
5622                     ; 1217             pendingbitstatus = RESET;
5624  0e5d 0f02          	clr	(OFST+0,sp)
5625  0e5f ac660f66      	jpf	L7422
5626  0e63               L3712:
5627                     ; 1221     case CAN_IT_FMP:
5627                     ; 1222         if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5629  0e63 c65425        	ld	a,21541
5630  0e66 a502          	bcp	a,#2
5631  0e68 2710          	jreq	L5522
5632                     ; 1224             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5634  0e6a ae0003        	ldw	x,#3
5635  0e6d c65424        	ld	a,21540
5636  0e70 95            	ld	xh,a
5637  0e71 cd1047        	call	L3_CheckITStatus
5639  0e74 6b02          	ld	(OFST+0,sp),a
5641  0e76 ac660f66      	jpf	L7422
5642  0e7a               L5522:
5643                     ; 1228             pendingbitstatus = RESET;
5645  0e7a 0f02          	clr	(OFST+0,sp)
5646  0e7c ac660f66      	jpf	L7422
5647  0e80               L5712:
5648                     ; 1231     case CAN_IT_FF:
5648                     ; 1232         if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5650  0e80 c65425        	ld	a,21541
5651  0e83 a504          	bcp	a,#4
5652  0e85 2710          	jreq	L1622
5653                     ; 1234             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5655  0e87 ae0008        	ldw	x,#8
5656  0e8a c65424        	ld	a,21540
5657  0e8d 95            	ld	xh,a
5658  0e8e cd1047        	call	L3_CheckITStatus
5660  0e91 6b02          	ld	(OFST+0,sp),a
5662  0e93 ac660f66      	jpf	L7422
5663  0e97               L1622:
5664                     ; 1238             pendingbitstatus = RESET;
5666  0e97 0f02          	clr	(OFST+0,sp)
5667  0e99 ac660f66      	jpf	L7422
5668  0e9d               L7712:
5669                     ; 1241     case CAN_IT_FOV:
5669                     ; 1242         if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5671  0e9d c65425        	ld	a,21541
5672  0ea0 a508          	bcp	a,#8
5673  0ea2 2710          	jreq	L5622
5674                     ; 1244             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5676  0ea4 ae0010        	ldw	x,#16
5677  0ea7 c65424        	ld	a,21540
5678  0eaa 95            	ld	xh,a
5679  0eab cd1047        	call	L3_CheckITStatus
5681  0eae 6b02          	ld	(OFST+0,sp),a
5683  0eb0 ac660f66      	jpf	L7422
5684  0eb4               L5622:
5685                     ; 1248             pendingbitstatus = RESET;
5687  0eb4 0f02          	clr	(OFST+0,sp)
5688  0eb6 ac660f66      	jpf	L7422
5689  0eba               L1022:
5690                     ; 1251     case CAN_IT_WKU:
5690                     ; 1252         if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5692  0eba c65425        	ld	a,21541
5693  0ebd a580          	bcp	a,#128
5694  0ebf 2710          	jreq	L1722
5695                     ; 1254             pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5697  0ec1 ae0008        	ldw	x,#8
5698  0ec4 c65421        	ld	a,21537
5699  0ec7 95            	ld	xh,a
5700  0ec8 cd1047        	call	L3_CheckITStatus
5702  0ecb 6b02          	ld	(OFST+0,sp),a
5704  0ecd ac660f66      	jpf	L7422
5705  0ed1               L1722:
5706                     ; 1258             pendingbitstatus = RESET;
5708  0ed1 0f02          	clr	(OFST+0,sp)
5709  0ed3 ac660f66      	jpf	L7422
5710  0ed7               L3022:
5711                     ; 1262     case CAN_IT_ERR:
5711                     ; 1263         CAN->PSR = CAN_Page_Config;
5713  0ed7 35065427      	mov	21543,#6
5714                     ; 1264         if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5716  0edb c65429        	ld	a,21545
5717  0ede a580          	bcp	a,#128
5718  0ee0 270e          	jreq	L5722
5719                     ; 1266             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5721  0ee2 ae0077        	ldw	x,#119
5722  0ee5 c65428        	ld	a,21544
5723  0ee8 95            	ld	xh,a
5724  0ee9 cd1047        	call	L3_CheckITStatus
5726  0eec 6b02          	ld	(OFST+0,sp),a
5728  0eee 2076          	jra	L7422
5729  0ef0               L5722:
5730                     ; 1270             pendingbitstatus = RESET;
5732  0ef0 0f02          	clr	(OFST+0,sp)
5733  0ef2 2072          	jra	L7422
5734  0ef4               L5022:
5735                     ; 1274     case CAN_IT_EWG:
5735                     ; 1275         CAN->PSR = CAN_Page_Config;
5737  0ef4 35065427      	mov	21543,#6
5738                     ; 1276         if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5740  0ef8 c65429        	ld	a,21545
5741  0efb a501          	bcp	a,#1
5742  0efd 270e          	jreq	L1032
5743                     ; 1278             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5745  0eff ae0001        	ldw	x,#1
5746  0f02 c65428        	ld	a,21544
5747  0f05 95            	ld	xh,a
5748  0f06 cd1047        	call	L3_CheckITStatus
5750  0f09 6b02          	ld	(OFST+0,sp),a
5752  0f0b 2059          	jra	L7422
5753  0f0d               L1032:
5754                     ; 1282             pendingbitstatus = RESET;
5756  0f0d 0f02          	clr	(OFST+0,sp)
5757  0f0f 2055          	jra	L7422
5758  0f11               L7022:
5759                     ; 1286     case CAN_IT_EPV:
5759                     ; 1287         CAN->PSR = CAN_Page_Config;
5761  0f11 35065427      	mov	21543,#6
5762                     ; 1288         if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5764  0f15 c65429        	ld	a,21545
5765  0f18 a502          	bcp	a,#2
5766  0f1a 270e          	jreq	L5032
5767                     ; 1290             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5769  0f1c ae0002        	ldw	x,#2
5770  0f1f c65428        	ld	a,21544
5771  0f22 95            	ld	xh,a
5772  0f23 cd1047        	call	L3_CheckITStatus
5774  0f26 6b02          	ld	(OFST+0,sp),a
5776  0f28 203c          	jra	L7422
5777  0f2a               L5032:
5778                     ; 1294             pendingbitstatus = RESET;
5780  0f2a 0f02          	clr	(OFST+0,sp)
5781  0f2c 2038          	jra	L7422
5782  0f2e               L1122:
5783                     ; 1297     case CAN_IT_BOF:
5783                     ; 1298         CAN->PSR = CAN_Page_Config;
5785  0f2e 35065427      	mov	21543,#6
5786                     ; 1299         if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5788  0f32 c65429        	ld	a,21545
5789  0f35 a504          	bcp	a,#4
5790  0f37 270e          	jreq	L1132
5791                     ; 1301             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5793  0f39 ae0004        	ldw	x,#4
5794  0f3c c65428        	ld	a,21544
5795  0f3f 95            	ld	xh,a
5796  0f40 cd1047        	call	L3_CheckITStatus
5798  0f43 6b02          	ld	(OFST+0,sp),a
5800  0f45 201f          	jra	L7422
5801  0f47               L1132:
5802                     ; 1305             pendingbitstatus = RESET;
5804  0f47 0f02          	clr	(OFST+0,sp)
5805  0f49 201b          	jra	L7422
5806  0f4b               L3122:
5807                     ; 1308     case CAN_IT_LEC:
5807                     ; 1309         CAN->PSR = CAN_Page_Config;
5809  0f4b 35065427      	mov	21543,#6
5810                     ; 1310         if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5812  0f4f c65429        	ld	a,21545
5813  0f52 a510          	bcp	a,#16
5814  0f54 270e          	jreq	L5132
5815                     ; 1312             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5817  0f56 ae0070        	ldw	x,#112
5818  0f59 c65428        	ld	a,21544
5819  0f5c 95            	ld	xh,a
5820  0f5d cd1047        	call	L3_CheckITStatus
5822  0f60 6b02          	ld	(OFST+0,sp),a
5824  0f62 2002          	jra	L7422
5825  0f64               L5132:
5826                     ; 1316             pendingbitstatus = RESET;
5828  0f64 0f02          	clr	(OFST+0,sp)
5829  0f66               L7422:
5830                     ; 1324     CAN_SelectPage(can_page);
5832  0f66 7b01          	ld	a,(OFST-1,sp)
5833  0f68 cd1043        	call	_CAN_SelectPage
5835                     ; 1326     return  (ITStatus)pendingbitstatus;
5837  0f6b 7b02          	ld	a,(OFST+0,sp)
5840  0f6d 5b04          	addw	sp,#4
5841  0f6f 81            	ret
5890                     ; 1344 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
5890                     ; 1345 {
5891                     	switch	.text
5892  0f70               _CAN_ClearITPendingBit:
5894  0f70 89            	pushw	x
5895  0f71 88            	push	a
5896       00000001      OFST:	set	1
5899                     ; 1346     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5901  0f72 cd103f        	call	_CAN_GetSelectedPage
5903  0f75 6b01          	ld	(OFST+0,sp),a
5904                     ; 1348     assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
5906  0f77 1e02          	ldw	x,(OFST+1,sp)
5907  0f79 a30001        	cpw	x,#1
5908  0f7c 2738          	jreq	L673
5909  0f7e 1e02          	ldw	x,(OFST+1,sp)
5910  0f80 a30004        	cpw	x,#4
5911  0f83 2731          	jreq	L673
5912  0f85 1e02          	ldw	x,(OFST+1,sp)
5913  0f87 a30008        	cpw	x,#8
5914  0f8a 272a          	jreq	L673
5915  0f8c 1e02          	ldw	x,(OFST+1,sp)
5916  0f8e a30080        	cpw	x,#128
5917  0f91 2723          	jreq	L673
5918  0f93 1e02          	ldw	x,(OFST+1,sp)
5919  0f95 a34000        	cpw	x,#16384
5920  0f98 271c          	jreq	L673
5921  0f9a 1e02          	ldw	x,(OFST+1,sp)
5922  0f9c a30100        	cpw	x,#256
5923  0f9f 2715          	jreq	L673
5924  0fa1 1e02          	ldw	x,(OFST+1,sp)
5925  0fa3 a30200        	cpw	x,#512
5926  0fa6 270e          	jreq	L673
5927  0fa8 1e02          	ldw	x,(OFST+1,sp)
5928  0faa a30400        	cpw	x,#1024
5929  0fad 2707          	jreq	L673
5930  0faf 1e02          	ldw	x,(OFST+1,sp)
5931  0fb1 a30800        	cpw	x,#2048
5932  0fb4 2603          	jrne	L473
5933  0fb6               L673:
5934  0fb6 4f            	clr	a
5935  0fb7 2010          	jra	L004
5936  0fb9               L473:
5937  0fb9 ae0544        	ldw	x,#1348
5938  0fbc 89            	pushw	x
5939  0fbd ae0000        	ldw	x,#0
5940  0fc0 89            	pushw	x
5941  0fc1 ae0008        	ldw	x,#L103
5942  0fc4 cd0000        	call	_assert_failed
5944  0fc7 5b04          	addw	sp,#4
5945  0fc9               L004:
5946                     ; 1350     switch (CAN_IT)
5948  0fc9 1e02          	ldw	x,(OFST+1,sp)
5950                     ; 1393     default :
5950                     ; 1394         break;
5951  0fcb 5a            	decw	x
5952  0fcc 272a          	jreq	L1232
5953  0fce 1d0003        	subw	x,#3
5954  0fd1 272b          	jreq	L3232
5955  0fd3 1d0004        	subw	x,#4
5956  0fd6 272c          	jreq	L5232
5957  0fd8 1d0078        	subw	x,#120
5958  0fdb 272d          	jreq	L7232
5959  0fdd 1d0080        	subw	x,#128
5960  0fe0 273c          	jreq	L3332
5961  0fe2 1d0100        	subw	x,#256
5962  0fe5 273d          	jreq	L5332
5963  0fe7 1d0200        	subw	x,#512
5964  0fea 273e          	jreq	L7332
5965  0fec 1d0400        	subw	x,#1024
5966  0fef 273f          	jreq	L1432
5967  0ff1 1d3800        	subw	x,#14336
5968  0ff4 271a          	jreq	L1332
5969  0ff6 2040          	jra	L1732
5970  0ff8               L1232:
5971                     ; 1352     case CAN_IT_TME:
5971                     ; 1353         CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
5973  0ff8 35075422      	mov	21538,#7
5974                     ; 1354         break;
5976  0ffc 203a          	jra	L1732
5977  0ffe               L3232:
5978                     ; 1356     case CAN_IT_FF:
5978                     ; 1357         CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
5980  0ffe 35085424      	mov	21540,#8
5981                     ; 1358         break;
5983  1002 2034          	jra	L1732
5984  1004               L5232:
5985                     ; 1360     case CAN_IT_FOV:
5985                     ; 1361         CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
5987  1004 35105424      	mov	21540,#16
5988                     ; 1362         break;
5990  1008 202e          	jra	L1732
5991  100a               L7232:
5992                     ; 1364     case CAN_IT_WKU:
5992                     ; 1365         CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
5994  100a 35085421      	mov	21537,#8
5995                     ; 1366         break;
5997  100e 2028          	jra	L1732
5998  1010               L1332:
5999                     ; 1368     case CAN_IT_ERR:
5999                     ; 1369         CAN->PSR = CAN_Page_Config;
6001  1010 35065427      	mov	21543,#6
6002                     ; 1370         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6004  1014 725f5428      	clr	21544
6005                     ; 1371         CAN->MSR = CAN_MSR_ERRI;
6007  1018 35045421      	mov	21537,#4
6008                     ; 1372         break;
6010  101c 201a          	jra	L1732
6011  101e               L3332:
6012                     ; 1374     case CAN_IT_EWG:
6012                     ; 1375         CAN->MSR = CAN_MSR_ERRI;
6014  101e 35045421      	mov	21537,#4
6015                     ; 1376         break;
6017  1022 2014          	jra	L1732
6018  1024               L5332:
6019                     ; 1378     case CAN_IT_EPV:
6019                     ; 1379         CAN->MSR = CAN_MSR_ERRI;
6021  1024 35045421      	mov	21537,#4
6022                     ; 1380         break;
6024  1028 200e          	jra	L1732
6025  102a               L7332:
6026                     ; 1382     case CAN_IT_BOF:
6026                     ; 1383         CAN->MSR = CAN_MSR_ERRI;
6028  102a 35045421      	mov	21537,#4
6029                     ; 1384         break;
6031  102e 2008          	jra	L1732
6032  1030               L1432:
6033                     ; 1386     case CAN_IT_LEC:
6033                     ; 1387         CAN->PSR = CAN_Page_Config;
6035  1030 35065427      	mov	21543,#6
6036                     ; 1388         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6038  1034 725f5428      	clr	21544
6039                     ; 1389         break;
6041  1038               L3432:
6042                     ; 1393     default :
6042                     ; 1394         break;
6044  1038               L1732:
6045                     ; 1397     CAN_SelectPage(can_page);
6047  1038 7b01          	ld	a,(OFST+0,sp)
6048  103a ad07          	call	_CAN_SelectPage
6050                     ; 1398 }
6053  103c 5b03          	addw	sp,#3
6054  103e 81            	ret
6079                     ; 1405 CAN_Page_TypeDef CAN_GetSelectedPage(void)
6079                     ; 1406 {
6080                     	switch	.text
6081  103f               _CAN_GetSelectedPage:
6085                     ; 1407     return (CAN_Page_TypeDef)(CAN->PSR);
6087  103f c65427        	ld	a,21543
6090  1042 81            	ret
6125                     ; 1415 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
6125                     ; 1416 {
6126                     	switch	.text
6127  1043               _CAN_SelectPage:
6131                     ; 1417     CAN->PSR = (uint8_t)CAN_Page;
6133  1043 c75427        	ld	21543,a
6134                     ; 1418 }
6137  1046 81            	ret
6191                     ; 1426 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
6191                     ; 1427 {
6192                     	switch	.text
6193  1047               L3_CheckITStatus:
6195  1047 89            	pushw	x
6196  1048 88            	push	a
6197       00000001      OFST:	set	1
6200                     ; 1428     ITStatus pendingbitstatus = RESET;
6202                     ; 1429     if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
6204  1049 9f            	ld	a,xl
6205  104a 1402          	and	a,(OFST+1,sp)
6206  104c 2706          	jreq	L7442
6207                     ; 1432         pendingbitstatus = SET;
6209  104e a601          	ld	a,#1
6210  1050 6b01          	ld	(OFST+0,sp),a
6212  1052 2002          	jra	L1542
6213  1054               L7442:
6214                     ; 1437         pendingbitstatus = RESET;
6216  1054 0f01          	clr	(OFST+0,sp)
6217  1056               L1542:
6218                     ; 1439     return (ITStatus)pendingbitstatus;
6220  1056 7b01          	ld	a,(OFST+0,sp)
6223  1058 5b03          	addw	sp,#3
6224  105a 81            	ret
6294                     	xdef	__FMI
6295                     	xdef	__Data
6296                     	xdef	__DLC
6297                     	xdef	__RTR
6298                     	xdef	__IDE
6299                     	xdef	__Id
6300                     	xdef	_CAN_ClearITPendingBit
6301                     	xdef	_CAN_GetITStatus
6302                     	xdef	_CAN_ClearFlag
6303                     	xdef	_CAN_GetFlagStatus
6304                     	xdef	_CAN_SelectPage
6305                     	xdef	_CAN_GetSelectedPage
6306                     	xdef	_CAN_GetLastErrorCode
6307                     	xdef	_CAN_OperatingModeRequest
6308                     	xdef	_CAN_WakeUp
6309                     	xdef	_CAN_Sleep
6310                     	xdef	_CAN_GetMessageTimeStamp
6311                     	xdef	_CAN_GetReceivedFMI
6312                     	xdef	_CAN_GetReceivedData
6313                     	xdef	_CAN_GetReceivedDLC
6314                     	xdef	_CAN_GetReceivedRTR
6315                     	xdef	_CAN_GetReceivedIDE
6316                     	xdef	_CAN_GetReceivedId
6317                     	xdef	_CAN_Receive
6318                     	xdef	_CAN_MessagePending
6319                     	xdef	_CAN_FIFORelease
6320                     	xdef	_CAN_CancelTransmit
6321                     	xdef	_CAN_TransmitStatus
6322                     	xdef	_CAN_TTComModeCmd
6323                     	xdef	_CAN_Transmit
6324                     	xdef	_CAN_ST7CompatibilityCmd
6325                     	xdef	_CAN_ITConfig
6326                     	xdef	_CAN_FilterInit
6327                     	xdef	_CAN_Init
6328                     	xdef	_CAN_DeInit
6329                     	xref	_assert_failed
6330                     	switch	.const
6331  0008               L103:
6332  0008 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_c"
6333  001a 616e2e6300    	dc.b	"an.c",0
6334                     	xref.b	c_lreg
6335                     	xref.b	c_x
6336                     	xref.b	c_y
6356                     	xref	c_uitol
6357                     	xref	c_uitolx
6358                     	xref	c_llsh
6359                     	xref	c_umul
6360                     	xref	c_lor
6361                     	xref	c_rtol
6362                     	xref	c_lursh
6363                     	xref	c_lgursh
6364                     	xref	c_lcmp
6365                     	xref	c_ltor
6366                     	end

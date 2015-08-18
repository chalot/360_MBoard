   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  15                     .const:	section	.text
  16  0000               L3_prefix:
  17  0000 00            	dc.b	0
  18  0001 00            	dc.b	0
  19  0002 00            	dc.b	0
  20  0003 2d            	dc.b	45
  21  0004 00            	dc.b	0
  22  0005 01            	dc.b	1
  23  0006 2b            	dc.b	43
  24  0007 00            	dc.b	0
  25  0008 01            	dc.b	1
  26  0009 20            	dc.b	32
  27  000a 00            	dc.b	0
  28  000b 01            	dc.b	1
  29  000c 30            	dc.b	48
  30  000d 78            	dc.b	120
  31  000e 02            	dc.b	2
  32  000f 30            	dc.b	48
  33  0010 58            	dc.b	88
  34  0011 02            	dc.b	2
 105                     ; 104 int sprintf(char FAR *s, const char FAR *format, ...)  
 105                     ; 105 {  
 107                     	switch	.text
 108  0000               _sprintf:
 110  0000 89            	pushw	x
 111  0001 5204          	subw	sp,#4
 112       00000004      OFST:	set	4
 115                     ; 109   va_start(sp, format);  
 117                     ; 111   return_count = _print_out(s, format, sp);  
 119  0003 96            	ldw	x,sp
 120  0004 1c000b        	addw	x,#OFST+7
 121  0007 89            	pushw	x
 122  0008 1e0b          	ldw	x,(OFST+7,sp)
 123  000a 89            	pushw	x
 124  000b 1e09          	ldw	x,(OFST+5,sp)
 125  000d ad20          	call	__print_out
 127  000f 5b04          	addw	sp,#4
 128  0011 1f01          	ldw	(OFST-3,sp),x
 129                     ; 112   va_end(sp);  
 131                     ; 113   return (return_count);  
 133  0013 1e01          	ldw	x,(OFST-3,sp)
 136  0015 5b06          	addw	sp,#6
 137  0017 81            	ret
 192                     ; 116 int printf(const char FAR *format, ...)  
 192                     ; 117 {  
 193                     	switch	.text
 194  0018               _printf:
 196  0018 89            	pushw	x
 197  0019 5204          	subw	sp,#4
 198       00000004      OFST:	set	4
 201                     ; 121   va_start(sp, format);  
 203                     ; 122   return_count = _print_out(NULL, format, sp);  
 205  001b 96            	ldw	x,sp
 206  001c 1c0009        	addw	x,#OFST+5
 207  001f 89            	pushw	x
 208  0020 1e07          	ldw	x,(OFST+3,sp)
 209  0022 89            	pushw	x
 210  0023 5f            	clrw	x
 211  0024 ad09          	call	__print_out
 213  0026 5b04          	addw	sp,#4
 214  0028 1f01          	ldw	(OFST-3,sp),x
 215                     ; 123   va_end(sp);  
 217                     ; 124   return (return_count);  
 219  002a 1e01          	ldw	x,(OFST-3,sp)
 222  002c 5b06          	addw	sp,#6
 223  002e 81            	ret
 226                     	switch	.const
 227  0012               L521_base10:
 228  0012 3b9aca00      	dc.l	1000000000
 229  0016 05f5e100      	dc.l	100000000
 230  001a 00989680      	dc.l	10000000
 231  001e 000f4240      	dc.l	1000000
 232  0022 000186a0      	dc.l	100000
 233  0026 00002710      	dc.l	10000
 234  002a 000003e8      	dc.l	1000
 235  002e 00000064      	dc.l	100
 236  0032 0000000a      	dc.l	10
 237  0036 00000001      	dc.l	1
 238  003a               L541_ascii_table_lower:
 239  003a 303132333435  	dc.b	"0123456789abcdef",0
 240  004b               L741_ascii_table_upper:
 241  004b 303132333435  	dc.b	"0123456789ABCDEF",0
 242  005c               L151_hex_shift:
 243  005c 1c            	dc.b	28
 244  005d 18            	dc.b	24
 245  005e 14            	dc.b	20
 246  005f 10            	dc.b	16
 247  0060 0c            	dc.b	12
 248  0061 08            	dc.b	8
 249  0062 04            	dc.b	4
 250  0063 00            	dc.b	0
 251  0064               L561_err_msg:
 252  0064 21214e472121  	dc.b	"!!NG!!",0
 253  006b               L761_err_fmt:
 254  006b 2000          	dc.b	" ",0
 520                     ; 127 int _print_out(char FAR *s, const char FAR *format, va_list sp)  
 520                     ; 128 {  
 521                     	switch	.text
 522  002f               __print_out:
 524  002f 89            	pushw	x
 525  0030 5226          	subw	sp,#38
 526       00000026      OFST:	set	38
 529                     ; 129   int total = 0;  
 531  0032 5f            	clrw	x
 532  0033 1f19          	ldw	(OFST-13,sp),x
 534  0035 ac6d056d      	jpf	L563
 535  0039               L363:
 536                     ; 137     unsigned char left_justify = 0;         /* set default to right justify */  
 538  0039 0f07          	clr	(OFST-31,sp)
 539                     ; 138     unsigned char prefix_select = 0;        /* set default prefix to none */  
 541  003b 0f0b          	clr	(OFST-27,sp)
 542                     ; 139     int  min_width = 0;            /* set default field min_width to 0 */  
 544  003d 5f            	clrw	x
 545  003e 1f0c          	ldw	(OFST-26,sp),x
 546                     ; 140     int  precision = 0;            /* set default precision to 0 */  
 548  0040 5f            	clrw	x
 549  0041 1f13          	ldw	(OFST-19,sp),x
 550                     ; 141     unsigned char size_type = UI;           /* set default type to unsigned int */  
 552  0043 0f0a          	clr	(OFST-28,sp)
 553                     ; 142     char const FAR * str_ptr = tmp_buf;    /* set default string source to buffer */  
 555  0045 96            	ldw	x,sp
 556  0046 1c001b        	addw	x,#OFST-11
 557  0049 1f08          	ldw	(OFST-30,sp),x
 558                     ; 150     int str_len = 0;  
 560  004b 5f            	clrw	x
 561  004c 1f17          	ldw	(OFST-15,sp),x
 562                     ; 151     tmp_buf[0] = 0;  
 564  004e 0f1b          	clr	(OFST-11,sp)
 565                     ; 153     if ( *format == '%' )                   /* start of escape characters */  
 567  0050 1e2b          	ldw	x,(OFST+5,sp)
 568  0052 f6            	ld	a,(x)
 569  0053 a125          	cp	a,#37
 570  0055 2703          	jreq	L03
 571  0057 cc03f0        	jp	L173
 572  005a               L03:
 573                     ; 155       out_state = PREFIX;  
 575  005a a601          	ld	a,#1
 576  005c 6b12          	ld	(OFST-20,sp),a
 577  005e               L373:
 578                     ; 158         format++;                           /* point to next character */  
 580  005e 1e2b          	ldw	x,(OFST+5,sp)
 581  0060 1c0001        	addw	x,#1
 582  0063 1f2b          	ldw	(OFST+5,sp),x
 583                     ; 161         switch (*format)  
 585  0065 1e2b          	ldw	x,(OFST+5,sp)
 586  0067 f6            	ld	a,(x)
 588                     ; 180             break;  
 589  0068 a020          	sub	a,#32
 590  006a 2729          	jreq	L101
 591  006c a003          	sub	a,#3
 592  006e 2719          	jreq	L57
 593  0070 a008          	sub	a,#8
 594  0072 271b          	jreq	L77
 595  0074 a002          	sub	a,#2
 596  0076 2723          	jreq	L301
 597  0078 a003          	sub	a,#3
 598  007a 2706          	jreq	L37
 599  007c               L501:
 600                     ; 178           default:  
 600                     ; 179             out_state = OUT_DONE;           /* no flags left */  
 602  007c a605          	ld	a,#5
 603  007e 6b12          	ld	(OFST-20,sp),a
 604                     ; 180             break;  
 606  0080 201d          	jra	L304
 607  0082               L37:
 608                     ; 163           case '0':  
 608                     ; 164             precision = -1;                 /* if precision not explicitly set, this will zero fill min_width */  
 610  0082 aeffff        	ldw	x,#65535
 611  0085 1f13          	ldw	(OFST-19,sp),x
 612                     ; 165             break;  
 614  0087 2016          	jra	L304
 615  0089               L57:
 616                     ; 166           case '#':  
 616                     ; 167             prefix_select = 4;              /* exact prefix will be determined during type decode */  
 618  0089 a604          	ld	a,#4
 619  008b 6b0b          	ld	(OFST-27,sp),a
 620                     ; 168             break;  
 622  008d 2010          	jra	L304
 623  008f               L77:
 624                     ; 169           case '+':  
 624                     ; 170             prefix_select = 2;              /* this will be overriden if number is negative */  
 626  008f a602          	ld	a,#2
 627  0091 6b0b          	ld	(OFST-27,sp),a
 628                     ; 171             break;  
 630  0093 200a          	jra	L304
 631  0095               L101:
 632                     ; 172           case ' ':  
 632                     ; 173             prefix_select = 3;              /* this will be overriden if number is negative */  
 634  0095 a603          	ld	a,#3
 635  0097 6b0b          	ld	(OFST-27,sp),a
 636                     ; 174             break;  
 638  0099 2004          	jra	L304
 639  009b               L301:
 640                     ; 175           case '-':  
 640                     ; 176             left_justify = 1;               /* left justification */  
 642  009b a601          	ld	a,#1
 643  009d 6b07          	ld	(OFST-31,sp),a
 644                     ; 177             break;  
 646  009f               L304:
 647                     ; 182         } while( out_state != OUT_DONE );  
 649  009f 7b12          	ld	a,(OFST-20,sp)
 650  00a1 a105          	cp	a,#5
 651  00a3 26b9          	jrne	L373
 652                     ; 185       index = 0;  
 654  00a5 0f16          	clr	(OFST-16,sp)
 656  00a7 202a          	jra	L114
 657  00a9               L504:
 658                     ; 188         min_width = (min_width * index * 10) + (*format - '0');  
 660  00a9 1e2b          	ldw	x,(OFST+5,sp)
 661  00ab f6            	ld	a,(x)
 662  00ac 5f            	clrw	x
 663  00ad 97            	ld	xl,a
 664  00ae 1d0030        	subw	x,#48
 665  00b1 1f03          	ldw	(OFST-35,sp),x
 666  00b3 1e0c          	ldw	x,(OFST-26,sp)
 667  00b5 7b16          	ld	a,(OFST-16,sp)
 668  00b7 905f          	clrw	y
 669  00b9 9097          	ld	yl,a
 670  00bb cd0000        	call	c_imul
 672  00be 90ae000a      	ldw	y,#10
 673  00c2 cd0000        	call	c_imul
 675  00c5 72fb03        	addw	x,(OFST-35,sp)
 676  00c8 1f0c          	ldw	(OFST-26,sp),x
 677                     ; 189         index++;  
 679  00ca 0c16          	inc	(OFST-16,sp)
 680                     ; 190         format++;  
 682  00cc 1e2b          	ldw	x,(OFST+5,sp)
 683  00ce 1c0001        	addw	x,#1
 684  00d1 1f2b          	ldw	(OFST+5,sp),x
 685  00d3               L114:
 686                     ; 186       while ( (*format >= '0') && (*format <= '9') )  
 688  00d3 1e2b          	ldw	x,(OFST+5,sp)
 689  00d5 f6            	ld	a,(x)
 690  00d6 a130          	cp	a,#48
 691  00d8 2507          	jrult	L514
 693  00da 1e2b          	ldw	x,(OFST+5,sp)
 694  00dc f6            	ld	a,(x)
 695  00dd a13a          	cp	a,#58
 696  00df 25c8          	jrult	L504
 697  00e1               L514:
 698                     ; 194       if (*format == '.')  
 700  00e1 1e2b          	ldw	x,(OFST+5,sp)
 701  00e3 f6            	ld	a,(x)
 702  00e4 a12e          	cp	a,#46
 703  00e6 2643          	jrne	L714
 704                     ; 196         format++;  
 706  00e8 1e2b          	ldw	x,(OFST+5,sp)
 707  00ea 1c0001        	addw	x,#1
 708  00ed 1f2b          	ldw	(OFST+5,sp),x
 709                     ; 197         index = 0;  
 711  00ef 0f16          	clr	(OFST-16,sp)
 713  00f1 202a          	jra	L524
 714  00f3               L124:
 715                     ; 200           precision = (precision * index * 10) + (*format - '0');  
 717  00f3 1e2b          	ldw	x,(OFST+5,sp)
 718  00f5 f6            	ld	a,(x)
 719  00f6 5f            	clrw	x
 720  00f7 97            	ld	xl,a
 721  00f8 1d0030        	subw	x,#48
 722  00fb 1f03          	ldw	(OFST-35,sp),x
 723  00fd 1e13          	ldw	x,(OFST-19,sp)
 724  00ff 7b16          	ld	a,(OFST-16,sp)
 725  0101 905f          	clrw	y
 726  0103 9097          	ld	yl,a
 727  0105 cd0000        	call	c_imul
 729  0108 90ae000a      	ldw	y,#10
 730  010c cd0000        	call	c_imul
 732  010f 72fb03        	addw	x,(OFST-35,sp)
 733  0112 1f13          	ldw	(OFST-19,sp),x
 734                     ; 201           index++;  
 736  0114 0c16          	inc	(OFST-16,sp)
 737                     ; 202           format++;  
 739  0116 1e2b          	ldw	x,(OFST+5,sp)
 740  0118 1c0001        	addw	x,#1
 741  011b 1f2b          	ldw	(OFST+5,sp),x
 742  011d               L524:
 743                     ; 198         while ( (*format >= '0') && (*format <= '9') )  
 745  011d 1e2b          	ldw	x,(OFST+5,sp)
 746  011f f6            	ld	a,(x)
 747  0120 a130          	cp	a,#48
 748  0122 2507          	jrult	L714
 750  0124 1e2b          	ldw	x,(OFST+5,sp)
 751  0126 f6            	ld	a,(x)
 752  0127 a13a          	cp	a,#58
 753  0129 25c8          	jrult	L124
 754  012b               L714:
 755                     ; 207       switch(*format)  
 757  012b 1e2b          	ldw	x,(OFST+5,sp)
 758  012d f6            	ld	a,(x)
 760                     ; 217         default:  
 760                     ; 218           break;  
 761  012e a068          	sub	a,#104
 762  0130 2706          	jreq	L701
 763  0132 a004          	sub	a,#4
 764  0134 270f          	jreq	L111
 765  0136 2018          	jra	L534
 766  0138               L701:
 767                     ; 209         case 'h':  
 767                     ; 210           size_type = UH;  
 769  0138 a601          	ld	a,#1
 770  013a 6b0a          	ld	(OFST-28,sp),a
 771                     ; 211           format++;  
 773  013c 1e2b          	ldw	x,(OFST+5,sp)
 774  013e 1c0001        	addw	x,#1
 775  0141 1f2b          	ldw	(OFST+5,sp),x
 776                     ; 212           break;  
 778  0143 200b          	jra	L534
 779  0145               L111:
 780                     ; 213         case 'l':  
 780                     ; 214           size_type = UL;  
 782  0145 a602          	ld	a,#2
 783  0147 6b0a          	ld	(OFST-28,sp),a
 784                     ; 215           format++;  
 786  0149 1e2b          	ldw	x,(OFST+5,sp)
 787  014b 1c0001        	addw	x,#1
 788  014e 1f2b          	ldw	(OFST+5,sp),x
 789                     ; 216           break;  
 791  0150               L311:
 792                     ; 217         default:  
 792                     ; 218           break;  
 794  0150               L534:
 795                     ; 223       switch(*format)  
 797  0150 1e2b          	ldw	x,(OFST+5,sp)
 798  0152 f6            	ld	a,(x)
 800                     ; 378           break;  
 801  0153 a025          	sub	a,#37
 802  0155 273c          	jreq	L511
 803  0157 a02e          	sub	a,#46
 804  0159 2603          	jrne	L23
 805  015b cc03c3        	jp	L161
 806  015e               L23:
 807  015e a005          	sub	a,#5
 808  0160 2603          	jrne	L43
 809  0162 cc02fd        	jp	L141
 810  0165               L43:
 811  0165 a00b          	sub	a,#11
 812  0167 275e          	jreq	L711
 813  0169 4a            	dec	a
 814  016a 2771          	jreq	L121
 815  016c a005          	sub	a,#5
 816  016e 276d          	jreq	L121
 817  0170 a00a          	sub	a,#10
 818  0172 2603          	jrne	L63
 819  0174 cc03c3        	jp	L161
 820  0177               L63:
 821  0177 a002          	sub	a,#2
 822  0179 2768          	jreq	L321
 823  017b a003          	sub	a,#3
 824  017d 2603          	jrne	L04
 825  017f cc0303        	jp	L341
 826  0182               L04:
 827  0182               L361:
 828                     ; 374           str_ptr = err_msg;  
 830  0182 ae0064        	ldw	x,#L561_err_msg
 831  0185 1f08          	ldw	(OFST-30,sp),x
 832                     ; 375           str_len = (int)sizeof(err_msg)-1;  
 834  0187 ae0006        	ldw	x,#6
 835  018a 1f17          	ldw	(OFST-15,sp),x
 836                     ; 376           format=err_fmt;  
 838  018c ae006b        	ldw	x,#L761_err_fmt
 839  018f 1f2b          	ldw	(OFST+5,sp),x
 840                     ; 378           break;  
 842  0191 200b          	jra	L125
 843  0193               L511:
 844                     ; 228           tmp_buf[0] = '%';  
 846  0193 a625          	ld	a,#37
 847  0195 6b1b          	ld	(OFST-11,sp),a
 848                     ; 229           tmp_buf[1] = 0;  
 850  0197 0f1c          	clr	(OFST-10,sp)
 851                     ; 230           str_len = 1;  
 853  0199 ae0001        	ldw	x,#1
 854  019c 1f17          	ldw	(OFST-15,sp),x
 855                     ; 231           break;  
 856  019e               L125:
 857                     ; 405     out_state=LEFT_SPACE;  
 859  019e 0f12          	clr	(OFST-20,sp)
 860                     ; 408     if (precision == -1)  
 862  01a0 1e13          	ldw	x,(OFST-19,sp)
 863  01a2 a3ffff        	cpw	x,#65535
 864  01a5 2703          	jreq	L24
 865  01a7 cc0436        	jp	L525
 866  01aa               L24:
 867                     ; 409       precision = min_width - prefix[prefix_select].size;  
 869  01aa 7b0b          	ld	a,(OFST-27,sp)
 870  01ac 97            	ld	xl,a
 871  01ad a603          	ld	a,#3
 872  01af 42            	mul	x,a
 873  01b0 89            	pushw	x
 874  01b1 7b0e          	ld	a,(OFST-24,sp)
 875  01b3 97            	ld	xl,a
 876  01b4 7b0f          	ld	a,(OFST-23,sp)
 877  01b6 9085          	popw	y
 878  01b8 90d00002      	sub	a,(L3_prefix+2,y)
 879  01bc 2401          	jrnc	L61
 880  01be 5a            	decw	x
 881  01bf               L61:
 882  01bf 02            	rlwa	x,a
 883  01c0 1f13          	ldw	(OFST-19,sp),x
 884  01c2 01            	rrwa	x,a
 885  01c3 ac360436      	jpf	L525
 886  01c7               L711:
 887                     ; 237           tmp_buf[0] = (char)va_arg(sp, int);  
 889  01c7 1e2d          	ldw	x,(OFST+7,sp)
 890  01c9 1c0002        	addw	x,#2
 891  01cc 1f2d          	ldw	(OFST+7,sp),x
 892  01ce 5a            	decw	x
 893  01cf 5a            	decw	x
 894  01d0 e601          	ld	a,(1,x)
 895  01d2 6b1b          	ld	(OFST-11,sp),a
 896                     ; 238           tmp_buf[1] = 0;  
 898  01d4 0f1c          	clr	(OFST-10,sp)
 899                     ; 239           str_len = 1;  
 901  01d6 ae0001        	ldw	x,#1
 902  01d9 1f17          	ldw	(OFST-15,sp),x
 903                     ; 240           break;  
 905  01db 20c1          	jra	L125
 906  01dd               L121:
 907                     ; 243         case 'd':  
 907                     ; 244         case 'i':  
 907                     ; 245           size_type += SI;  
 909  01dd 7b0a          	ld	a,(OFST-28,sp)
 910  01df ab03          	add	a,#3
 911  01e1 6b0a          	ld	(OFST-28,sp),a
 912  01e3               L321:
 913                     ; 254           switch (size_type)  
 915  01e3 7b0a          	ld	a,(OFST-28,sp)
 917                     ; 276               break;  
 918  01e5 4d            	tnz	a
 919  01e6 270f          	jreq	L721
 920  01e8 4a            	dec	a
 921  01e9 2738          	jreq	L331
 922  01eb 4a            	dec	a
 923  01ec 2761          	jreq	L731
 924  01ee 4a            	dec	a
 925  01ef 271c          	jreq	L131
 926  01f1 4a            	dec	a
 927  01f2 2745          	jreq	L531
 928  01f4 4a            	dec	a
 929  01f5 2758          	jreq	L731
 930  01f7               L721:
 931                     ; 256             default:  
 931                     ; 257             case UI:  
 931                     ; 258               value.UL = (unsigned long)va_arg(sp, unsigned int);  
 933  01f7 1e2d          	ldw	x,(OFST+7,sp)
 934  01f9 1c0002        	addw	x,#2
 935  01fc 1f2d          	ldw	(OFST+7,sp),x
 936  01fe 5a            	decw	x
 937  01ff 5a            	decw	x
 938  0200 fe            	ldw	x,(x)
 939  0201 cd0000        	call	c_uitolx
 941  0204 96            	ldw	x,sp
 942  0205 1c000e        	addw	x,#OFST-24
 943  0208 cd0000        	call	c_rtol
 945                     ; 259               break;  
 947  020b 2056          	jra	L544
 948  020d               L131:
 949                     ; 261             case SI:  
 949                     ; 262               value.SL = (signed long)va_arg(sp, signed int);  
 951  020d 1e2d          	ldw	x,(OFST+7,sp)
 952  020f 1c0002        	addw	x,#2
 953  0212 1f2d          	ldw	(OFST+7,sp),x
 954  0214 5a            	decw	x
 955  0215 5a            	decw	x
 956  0216 fe            	ldw	x,(x)
 957  0217 cd0000        	call	c_itolx
 959  021a 96            	ldw	x,sp
 960  021b 1c000e        	addw	x,#OFST-24
 961  021e cd0000        	call	c_rtol
 963                     ; 263               break;  
 965  0221 2040          	jra	L544
 966  0223               L331:
 967                     ; 265             case UH:  
 967                     ; 266               value.UL = (unsigned long)(unsigned short)va_arg(sp, unsigned int);  
 969  0223 1e2d          	ldw	x,(OFST+7,sp)
 970  0225 1c0002        	addw	x,#2
 971  0228 1f2d          	ldw	(OFST+7,sp),x
 972  022a 5a            	decw	x
 973  022b 5a            	decw	x
 974  022c fe            	ldw	x,(x)
 975  022d cd0000        	call	c_uitolx
 977  0230 96            	ldw	x,sp
 978  0231 1c000e        	addw	x,#OFST-24
 979  0234 cd0000        	call	c_rtol
 981                     ; 267               break;  
 983  0237 202a          	jra	L544
 984  0239               L531:
 985                     ; 269             case SH:  
 985                     ; 270               value.SL = (signed long)(signed short)va_arg(sp, signed int);  
 987  0239 1e2d          	ldw	x,(OFST+7,sp)
 988  023b 1c0002        	addw	x,#2
 989  023e 1f2d          	ldw	(OFST+7,sp),x
 990  0240 5a            	decw	x
 991  0241 5a            	decw	x
 992  0242 fe            	ldw	x,(x)
 993  0243 cd0000        	call	c_itolx
 995  0246 96            	ldw	x,sp
 996  0247 1c000e        	addw	x,#OFST-24
 997  024a cd0000        	call	c_rtol
 999                     ; 271               break;  
1001  024d 2014          	jra	L544
1002  024f               L731:
1003                     ; 273             case UL:  
1003                     ; 274             case SL:  
1003                     ; 275               value.UL = va_arg(sp, unsigned long);  
1005  024f 1e2d          	ldw	x,(OFST+7,sp)
1006  0251 1c0004        	addw	x,#4
1007  0254 1f2d          	ldw	(OFST+7,sp),x
1008  0256 1d0004        	subw	x,#4
1009  0259 9093          	ldw	y,x
1010  025b ee02          	ldw	x,(2,x)
1011  025d 1f10          	ldw	(OFST-22,sp),x
1012  025f 93            	ldw	x,y
1013  0260 fe            	ldw	x,(x)
1014  0261 1f0e          	ldw	(OFST-24,sp),x
1015                     ; 276               break;  
1017  0263               L544:
1018                     ; 280           if (size_type >= SI)  
1020  0263 7b0a          	ld	a,(OFST-28,sp)
1021  0265 a103          	cp	a,#3
1022  0267 2510          	jrult	L744
1023                     ; 282             if (value.SL < 0)  
1025  0269 9c            	rvf
1026  026a 0d0e          	tnz	(OFST-24,sp)
1027  026c 2e0b          	jrsge	L744
1028                     ; 284               value.SL = -value.SL;  
1030  026e 96            	ldw	x,sp
1031  026f 1c000e        	addw	x,#OFST-24
1032  0272 cd0000        	call	c_lgneg
1034                     ; 285               prefix_select = 1;  
1036  0275 a601          	ld	a,#1
1037  0277 6b0b          	ld	(OFST-27,sp),a
1038  0279               L744:
1039                     ; 290           for (index = 0; index < 10; index++)  
1041  0279 0f16          	clr	(OFST-16,sp)
1042  027b               L354:
1043                     ; 292             tmp_char = (unsigned char)(value.UL/base10[index]);  
1045  027b 96            	ldw	x,sp
1046  027c 1c000e        	addw	x,#OFST-24
1047  027f cd0000        	call	c_ltor
1049  0282 7b16          	ld	a,(OFST-16,sp)
1050  0284 97            	ld	xl,a
1051  0285 a604          	ld	a,#4
1052  0287 42            	mul	x,a
1053  0288 1c0012        	addw	x,#L521_base10
1054  028b cd0000        	call	c_ludv
1056  028e b603          	ld	a,c_lreg+3
1057  0290 6b15          	ld	(OFST-17,sp),a
1058                     ; 293             value.UL -= tmp_char * base10[index];  
1060  0292 7b15          	ld	a,(OFST-17,sp)
1061  0294 b703          	ld	c_lreg+3,a
1062  0296 3f02          	clr	c_lreg+2
1063  0298 3f01          	clr	c_lreg+1
1064  029a 3f00          	clr	c_lreg
1065  029c 96            	ldw	x,sp
1066  029d 1c0001        	addw	x,#OFST-37
1067  02a0 cd0000        	call	c_rtol
1069  02a3 7b16          	ld	a,(OFST-16,sp)
1070  02a5 97            	ld	xl,a
1071  02a6 a604          	ld	a,#4
1072  02a8 42            	mul	x,a
1073  02a9 1c0012        	addw	x,#L521_base10
1074  02ac cd0000        	call	c_ltor
1076  02af 96            	ldw	x,sp
1077  02b0 1c0001        	addw	x,#OFST-37
1078  02b3 cd0000        	call	c_lmul
1080  02b6 96            	ldw	x,sp
1081  02b7 1c000e        	addw	x,#OFST-24
1082  02ba cd0000        	call	c_lgsub
1084                     ; 294             tmp_buf[str_len] = tmp_char + '0';  
1086  02bd 7b15          	ld	a,(OFST-17,sp)
1087  02bf ab30          	add	a,#48
1088  02c1 96            	ldw	x,sp
1089  02c2 1c001b        	addw	x,#OFST-11
1090  02c5 1f03          	ldw	(OFST-35,sp),x
1091  02c7 1e17          	ldw	x,(OFST-15,sp)
1092  02c9 72fb03        	addw	x,(OFST-35,sp)
1093  02cc f7            	ld	(x),a
1094                     ; 295             if ((tmp_char != 0) || (str_len !=0))  
1096  02cd 0d15          	tnz	(OFST-17,sp)
1097  02cf 2604          	jrne	L364
1099  02d1 1e17          	ldw	x,(OFST-15,sp)
1100  02d3 2707          	jreq	L164
1101  02d5               L364:
1102                     ; 296               str_len++;  
1104  02d5 1e17          	ldw	x,(OFST-15,sp)
1105  02d7 1c0001        	addw	x,#1
1106  02da 1f17          	ldw	(OFST-15,sp),x
1107  02dc               L164:
1108                     ; 290           for (index = 0; index < 10; index++)  
1110  02dc 0c16          	inc	(OFST-16,sp)
1113  02de 7b16          	ld	a,(OFST-16,sp)
1114  02e0 a10a          	cp	a,#10
1115  02e2 2597          	jrult	L354
1116                     ; 299           if (str_len == 0)  
1118  02e4 1e17          	ldw	x,(OFST-15,sp)
1119  02e6 2605          	jrne	L564
1120                     ; 300             str_len = 1; /* if value was zero, we need to increment length */  
1122  02e8 ae0001        	ldw	x,#1
1123  02eb 1f17          	ldw	(OFST-15,sp),x
1124  02ed               L564:
1125                     ; 302           tmp_buf[str_len] = 0;  
1127  02ed 96            	ldw	x,sp
1128  02ee 1c001b        	addw	x,#OFST-11
1129  02f1 1f03          	ldw	(OFST-35,sp),x
1130  02f3 1e17          	ldw	x,(OFST-15,sp)
1131  02f5 72fb03        	addw	x,(OFST-35,sp)
1132  02f8 7f            	clr	(x)
1133                     ; 303           break;  
1135  02f9 ac9e019e      	jpf	L125
1136  02fd               L141:
1137                     ; 306         case 'X':  
1137                     ; 307           if (prefix_select != 0) prefix_select++;  
1139  02fd 0d0b          	tnz	(OFST-27,sp)
1140  02ff 2702          	jreq	L341
1143  0301 0c0b          	inc	(OFST-27,sp)
1144  0303               L341:
1145                     ; 317           switch (size_type)  
1147  0303 7b0a          	ld	a,(OFST-28,sp)
1149                     ; 333               break;  
1150  0305 4d            	tnz	a
1151  0306 270f          	jreq	L351
1152  0308 4a            	dec	a
1153  0309 2722          	jreq	L551
1154  030b 4a            	dec	a
1155  030c 2735          	jreq	L751
1156  030e 4a            	dec	a
1157  030f 2706          	jreq	L351
1158  0311 4a            	dec	a
1159  0312 2719          	jreq	L551
1160  0314 4a            	dec	a
1161  0315 272c          	jreq	L751
1162  0317               L351:
1163                     ; 319             default:  
1163                     ; 320             case UI:  
1163                     ; 321             case SI:  
1163                     ; 322               value.UL = (unsigned long)va_arg(sp, unsigned int);  
1165  0317 1e2d          	ldw	x,(OFST+7,sp)
1166  0319 1c0002        	addw	x,#2
1167  031c 1f2d          	ldw	(OFST+7,sp),x
1168  031e 5a            	decw	x
1169  031f 5a            	decw	x
1170  0320 fe            	ldw	x,(x)
1171  0321 cd0000        	call	c_uitolx
1173  0324 96            	ldw	x,sp
1174  0325 1c000e        	addw	x,#OFST-24
1175  0328 cd0000        	call	c_rtol
1177                     ; 323               break;  
1179  032b 202a          	jra	L374
1180  032d               L551:
1181                     ; 325             case UH:  
1181                     ; 326             case SH:  
1181                     ; 327               value.UL = (unsigned long)(unsigned short)va_arg(sp, unsigned int);  
1183  032d 1e2d          	ldw	x,(OFST+7,sp)
1184  032f 1c0002        	addw	x,#2
1185  0332 1f2d          	ldw	(OFST+7,sp),x
1186  0334 5a            	decw	x
1187  0335 5a            	decw	x
1188  0336 fe            	ldw	x,(x)
1189  0337 cd0000        	call	c_uitolx
1191  033a 96            	ldw	x,sp
1192  033b 1c000e        	addw	x,#OFST-24
1193  033e cd0000        	call	c_rtol
1195                     ; 328               break;  
1197  0341 2014          	jra	L374
1198  0343               L751:
1199                     ; 330             case UL:  
1199                     ; 331             case SL:  
1199                     ; 332               value.UL = va_arg(sp, unsigned long);  
1201  0343 1e2d          	ldw	x,(OFST+7,sp)
1202  0345 1c0004        	addw	x,#4
1203  0348 1f2d          	ldw	(OFST+7,sp),x
1204  034a 1d0004        	subw	x,#4
1205  034d 9093          	ldw	y,x
1206  034f ee02          	ldw	x,(2,x)
1207  0351 1f10          	ldw	(OFST-22,sp),x
1208  0353 93            	ldw	x,y
1209  0354 fe            	ldw	x,(x)
1210  0355 1f0e          	ldw	(OFST-24,sp),x
1211                     ; 333               break;  
1213  0357               L374:
1214                     ; 338           for (index = 0; index < 8; index++)  
1216  0357 0f16          	clr	(OFST-16,sp)
1217  0359               L574:
1218                     ; 340             tmp_char = (unsigned char)(value.UL >> hex_shift[index]) & 0x0F;  
1220  0359 96            	ldw	x,sp
1221  035a 1c000e        	addw	x,#OFST-24
1222  035d cd0000        	call	c_ltor
1224  0360 7b16          	ld	a,(OFST-16,sp)
1225  0362 5f            	clrw	x
1226  0363 97            	ld	xl,a
1227  0364 d6005c        	ld	a,(L151_hex_shift,x)
1228  0367 cd0000        	call	c_lursh
1230  036a b603          	ld	a,c_lreg+3
1231  036c a40f          	and	a,#15
1232  036e 6b15          	ld	(OFST-17,sp),a
1233                     ; 341             tmp_buf[str_len] = (*format == 'x') ? ascii_table_lower[tmp_char] : ascii_table_upper[tmp_char];  
1235  0370 1e2b          	ldw	x,(OFST+5,sp)
1236  0372 f6            	ld	a,(x)
1237  0373 a178          	cp	a,#120
1238  0375 2609          	jrne	L21
1239  0377 7b15          	ld	a,(OFST-17,sp)
1240  0379 5f            	clrw	x
1241  037a 97            	ld	xl,a
1242  037b d6003a        	ld	a,(L541_ascii_table_lower,x)
1243  037e 2007          	jra	L41
1244  0380               L21:
1245  0380 7b15          	ld	a,(OFST-17,sp)
1246  0382 5f            	clrw	x
1247  0383 97            	ld	xl,a
1248  0384 d6004b        	ld	a,(L741_ascii_table_upper,x)
1249  0387               L41:
1250  0387 96            	ldw	x,sp
1251  0388 1c001b        	addw	x,#OFST-11
1252  038b 1f03          	ldw	(OFST-35,sp),x
1253  038d 1e17          	ldw	x,(OFST-15,sp)
1254  038f 72fb03        	addw	x,(OFST-35,sp)
1255  0392 f7            	ld	(x),a
1256                     ; 342             if ((tmp_char != 0) || (str_len !=0))  
1258  0393 0d15          	tnz	(OFST-17,sp)
1259  0395 2604          	jrne	L505
1261  0397 1e17          	ldw	x,(OFST-15,sp)
1262  0399 2707          	jreq	L305
1263  039b               L505:
1264                     ; 343               str_len++;  
1266  039b 1e17          	ldw	x,(OFST-15,sp)
1267  039d 1c0001        	addw	x,#1
1268  03a0 1f17          	ldw	(OFST-15,sp),x
1269  03a2               L305:
1270                     ; 338           for (index = 0; index < 8; index++)  
1272  03a2 0c16          	inc	(OFST-16,sp)
1275  03a4 7b16          	ld	a,(OFST-16,sp)
1276  03a6 a108          	cp	a,#8
1277  03a8 25af          	jrult	L574
1278                     ; 346           if (str_len == 0)  
1280  03aa 1e17          	ldw	x,(OFST-15,sp)
1281  03ac 2605          	jrne	L705
1282                     ; 347             str_len = 1; /* if value was zero, we need to increment length */  
1284  03ae ae0001        	ldw	x,#1
1285  03b1 1f17          	ldw	(OFST-15,sp),x
1286  03b3               L705:
1287                     ; 349           tmp_buf[str_len] = 0;  
1289  03b3 96            	ldw	x,sp
1290  03b4 1c001b        	addw	x,#OFST-11
1291  03b7 1f03          	ldw	(OFST-35,sp),x
1292  03b9 1e17          	ldw	x,(OFST-15,sp)
1293  03bb 72fb03        	addw	x,(OFST-35,sp)
1294  03be 7f            	clr	(x)
1295                     ; 350           break;  
1297  03bf ac9e019e      	jpf	L125
1298  03c3               L161:
1299                     ; 359           str_ptr = t_str_ptr = va_arg(sp, char FAR *);  
1301  03c3 1e2d          	ldw	x,(OFST+7,sp)
1302  03c5 1c0002        	addw	x,#2
1303  03c8 1f2d          	ldw	(OFST+7,sp),x
1304  03ca 5a            	decw	x
1305  03cb 5a            	decw	x
1306  03cc fe            	ldw	x,(x)
1307  03cd 1f05          	ldw	(OFST-33,sp),x
1308  03cf 1e05          	ldw	x,(OFST-33,sp)
1309  03d1 1f08          	ldw	(OFST-30,sp),x
1311  03d3 200e          	jra	L515
1312  03d5               L115:
1313                     ; 362             str_len++;  
1315  03d5 1e17          	ldw	x,(OFST-15,sp)
1316  03d7 1c0001        	addw	x,#1
1317  03da 1f17          	ldw	(OFST-15,sp),x
1318                     ; 363             t_str_ptr++;  
1320  03dc 1e05          	ldw	x,(OFST-33,sp)
1321  03de 1c0001        	addw	x,#1
1322  03e1 1f05          	ldw	(OFST-33,sp),x
1323  03e3               L515:
1324                     ; 360           while(*t_str_ptr)    /* find string length */  
1326  03e3 1e05          	ldw	x,(OFST-33,sp)
1327  03e5 7d            	tnz	(x)
1328  03e6 26ed          	jrne	L115
1329                     ; 365           break;  
1331  03e8 ac9e019e      	jpf	L125
1332  03ec               L144:
1333                     ; 378           break;  
1334  03ec ac9e019e      	jpf	L125
1335  03f0               L173:
1336                     ; 385       index = 0;  
1338  03f0 0f16          	clr	(OFST-16,sp)
1339                     ; 386       if( *format == '\n')    /* Add CR to LF */  
1341  03f2 1e2b          	ldw	x,(OFST+5,sp)
1342  03f4 f6            	ld	a,(x)
1343  03f5 a10a          	cp	a,#10
1344  03f7 2616          	jrne	L325
1345                     ; 387         tmp_buf[str_len++] = '\r';  
1347  03f9 96            	ldw	x,sp
1348  03fa 1c001b        	addw	x,#OFST-11
1349  03fd 1f03          	ldw	(OFST-35,sp),x
1350  03ff 1e17          	ldw	x,(OFST-15,sp)
1351  0401 1c0001        	addw	x,#1
1352  0404 1f17          	ldw	(OFST-15,sp),x
1353  0406 1d0001        	subw	x,#1
1354  0409 72fb03        	addw	x,(OFST-35,sp)
1355  040c a60d          	ld	a,#13
1356  040e f7            	ld	(x),a
1357  040f               L325:
1358                     ; 389       tmp_buf[str_len++] = *format;  
1360  040f 1e2b          	ldw	x,(OFST+5,sp)
1361  0411 f6            	ld	a,(x)
1362  0412 96            	ldw	x,sp
1363  0413 1c001b        	addw	x,#OFST-11
1364  0416 1f03          	ldw	(OFST-35,sp),x
1365  0418 1e17          	ldw	x,(OFST-15,sp)
1366  041a 1c0001        	addw	x,#1
1367  041d 1f17          	ldw	(OFST-15,sp),x
1368  041f 1d0001        	subw	x,#1
1369  0422 72fb03        	addw	x,(OFST-35,sp)
1370  0425 f7            	ld	(x),a
1371                     ; 390       tmp_buf[str_len] = 0;  
1373  0426 96            	ldw	x,sp
1374  0427 1c001b        	addw	x,#OFST-11
1375  042a 1f03          	ldw	(OFST-35,sp),x
1376  042c 1e17          	ldw	x,(OFST-15,sp)
1377  042e 72fb03        	addw	x,(OFST-35,sp)
1378  0431 7f            	clr	(x)
1379  0432 ac9e019e      	jpf	L125
1380  0436               L525:
1381                     ; 411     if ((precision > 0) && (*format == 's'))  
1383  0436 9c            	rvf
1384  0437 1e13          	ldw	x,(OFST-19,sp)
1385  0439 2d15          	jrsle	L725
1387  043b 1e2b          	ldw	x,(OFST+5,sp)
1388  043d f6            	ld	a,(x)
1389  043e a173          	cp	a,#115
1390  0440 260e          	jrne	L725
1391                     ; 414       if (str_len > precision)  
1393  0442 9c            	rvf
1394  0443 1e17          	ldw	x,(OFST-15,sp)
1395  0445 1313          	cpw	x,(OFST-19,sp)
1396  0447 2d04          	jrsle	L135
1397                     ; 415         str_len = precision;  
1399  0449 1e13          	ldw	x,(OFST-19,sp)
1400  044b 1f17          	ldw	(OFST-15,sp),x
1401  044d               L135:
1402                     ; 418       precision = 0;  
1404  044d 5f            	clrw	x
1405  044e 1f13          	ldw	(OFST-19,sp),x
1406  0450               L725:
1407                     ; 422     precision = precision - str_len;  
1409  0450 1e13          	ldw	x,(OFST-19,sp)
1410  0452 72f017        	subw	x,(OFST-15,sp)
1411  0455 1f13          	ldw	(OFST-19,sp),x
1412                     ; 425     min_width = (min_width - str_len) - prefix[prefix_select].size;  
1414  0457 7b0b          	ld	a,(OFST-27,sp)
1415  0459 97            	ld	xl,a
1416  045a a603          	ld	a,#3
1417  045c 42            	mul	x,a
1418  045d d60002        	ld	a,(L3_prefix+2,x)
1419  0460 6b04          	ld	(OFST-34,sp),a
1420  0462 1e0c          	ldw	x,(OFST-26,sp)
1421  0464 72f017        	subw	x,(OFST-15,sp)
1422  0467 01            	rrwa	x,a
1423  0468 1004          	sub	a,(OFST-34,sp)
1424  046a 2401          	jrnc	L02
1425  046c 5a            	decw	x
1426  046d               L02:
1427  046d 02            	rlwa	x,a
1428  046e 1f0c          	ldw	(OFST-26,sp),x
1429  0470 01            	rrwa	x,a
1430                     ; 426     min_width -= (precision > 0) ? precision : 0;  
1432  0471 9c            	rvf
1433  0472 1e13          	ldw	x,(OFST-19,sp)
1434  0474 2d04          	jrsle	L22
1435  0476 1e13          	ldw	x,(OFST-19,sp)
1436  0478 2001          	jra	L42
1437  047a               L22:
1438  047a 5f            	clrw	x
1439  047b               L42:
1440  047b 1f03          	ldw	(OFST-35,sp),x
1441  047d 1e0c          	ldw	x,(OFST-26,sp)
1442  047f 72f003        	subw	x,(OFST-35,sp)
1443  0482 1f0c          	ldw	(OFST-26,sp),x
1444  0484               L335:
1445                     ; 430       tmp_char = 0;  
1447  0484 0f15          	clr	(OFST-17,sp)
1448                     ; 432       switch (out_state)  
1450  0486 7b12          	ld	a,(OFST-20,sp)
1452                     ; 502           break;  
1453  0488 4d            	tnz	a
1454  0489 2717          	jreq	L171
1455  048b 4a            	dec	a
1456  048c 2733          	jreq	L371
1457  048e 4a            	dec	a
1458  048f 275b          	jreq	L571
1459  0491 4a            	dec	a
1460  0492 2773          	jreq	L771
1461  0494 4a            	dec	a
1462  0495 2603          	jrne	L44
1463  0497 cc0524        	jp	L102
1464  049a               L44:
1465  049a               L302:
1466                     ; 501           out_state = OUT_DONE;  
1468  049a a605          	ld	a,#5
1469  049c 6b12          	ld	(OFST-20,sp),a
1470                     ; 502           break;  
1472  049e ac3a053a      	jpf	L345
1473  04a2               L171:
1474                     ; 436           if ((min_width > 0) && (left_justify == 0))  
1476  04a2 9c            	rvf
1477  04a3 1e0c          	ldw	x,(OFST-26,sp)
1478  04a5 2d12          	jrsle	L545
1480  04a7 0d07          	tnz	(OFST-31,sp)
1481  04a9 260e          	jrne	L545
1482                     ; 438             tmp_char = ' ';  
1484  04ab a620          	ld	a,#32
1485  04ad 6b15          	ld	(OFST-17,sp),a
1486                     ; 439             min_width--;  
1488  04af 1e0c          	ldw	x,(OFST-26,sp)
1489  04b1 1d0001        	subw	x,#1
1490  04b4 1f0c          	ldw	(OFST-26,sp),x
1492  04b6 cc053a        	jra	L345
1493  04b9               L545:
1494                     ; 444             index = 0;  
1496  04b9 0f16          	clr	(OFST-16,sp)
1497                     ; 445             out_state = PREFIX;  
1499  04bb a601          	ld	a,#1
1500  04bd 6b12          	ld	(OFST-20,sp),a
1501  04bf 2079          	jra	L345
1502  04c1               L371:
1503                     ; 451           tmp_char = prefix[prefix_select].c[index++];  
1505  04c1 7b16          	ld	a,(OFST-16,sp)
1506  04c3 0c16          	inc	(OFST-16,sp)
1507  04c5 6b04          	ld	(OFST-34,sp),a
1508  04c7 7b0b          	ld	a,(OFST-27,sp)
1509  04c9 97            	ld	xl,a
1510  04ca a603          	ld	a,#3
1511  04cc 42            	mul	x,a
1512  04cd 01            	rrwa	x,a
1513  04ce 1b04          	add	a,(OFST-34,sp)
1514  04d0 2401          	jrnc	L62
1515  04d2 5c            	incw	x
1516  04d3               L62:
1517  04d3 02            	rlwa	x,a
1518  04d4 d60000        	ld	a,(L3_prefix,x)
1519  04d7 6b15          	ld	(OFST-17,sp),a
1520                     ; 452           if (index >= prefix[prefix_select].size)  
1522  04d9 7b0b          	ld	a,(OFST-27,sp)
1523  04db 97            	ld	xl,a
1524  04dc a603          	ld	a,#3
1525  04de 42            	mul	x,a
1526  04df d60002        	ld	a,(L3_prefix+2,x)
1527  04e2 1116          	cp	a,(OFST-16,sp)
1528  04e4 2254          	jrugt	L345
1529                     ; 455             out_state = ZERO_PAD;  
1531  04e6 a602          	ld	a,#2
1532  04e8 6b12          	ld	(OFST-20,sp),a
1533  04ea 204e          	jra	L345
1534  04ec               L571:
1535                     ; 461           if (precision > 0)  
1537  04ec 9c            	rvf
1538  04ed 1e13          	ldw	x,(OFST-19,sp)
1539  04ef 2d0d          	jrsle	L355
1540                     ; 463             tmp_char = '0';  
1542  04f1 a630          	ld	a,#48
1543  04f3 6b15          	ld	(OFST-17,sp),a
1544                     ; 464             precision--;  
1546  04f5 1e13          	ldw	x,(OFST-19,sp)
1547  04f7 1d0001        	subw	x,#1
1548  04fa 1f13          	ldw	(OFST-19,sp),x
1550  04fc 203c          	jra	L345
1551  04fe               L355:
1552                     ; 469             precision = 0;  
1554  04fe 5f            	clrw	x
1555  04ff 1f13          	ldw	(OFST-19,sp),x
1556                     ; 470             out_state = VALUE_TXT;  
1558  0501 a603          	ld	a,#3
1559  0503 6b12          	ld	(OFST-20,sp),a
1560  0505 2033          	jra	L345
1561  0507               L771:
1562                     ; 476           tmp_char = str_ptr[precision++];    /* use precision for indexing because is type "int" */  
1564  0507 1e13          	ldw	x,(OFST-19,sp)
1565  0509 1c0001        	addw	x,#1
1566  050c 1f13          	ldw	(OFST-19,sp),x
1567  050e 1d0001        	subw	x,#1
1568  0511 72fb08        	addw	x,(OFST-30,sp)
1569  0514 f6            	ld	a,(x)
1570  0515 6b15          	ld	(OFST-17,sp),a
1571                     ; 477           if (precision >= str_len)  
1573  0517 9c            	rvf
1574  0518 1e13          	ldw	x,(OFST-19,sp)
1575  051a 1317          	cpw	x,(OFST-15,sp)
1576  051c 2f1c          	jrslt	L345
1577                     ; 480             out_state = RIGHT_SPACE;  
1579  051e a604          	ld	a,#4
1580  0520 6b12          	ld	(OFST-20,sp),a
1581  0522 2016          	jra	L345
1582  0524               L102:
1583                     ; 486           if (min_width > 0)  
1585  0524 9c            	rvf
1586  0525 1e0c          	ldw	x,(OFST-26,sp)
1587  0527 2d0d          	jrsle	L165
1588                     ; 488             tmp_char = ' ';  
1590  0529 a620          	ld	a,#32
1591  052b 6b15          	ld	(OFST-17,sp),a
1592                     ; 489             min_width--;  
1594  052d 1e0c          	ldw	x,(OFST-26,sp)
1595  052f 1d0001        	subw	x,#1
1596  0532 1f0c          	ldw	(OFST-26,sp),x
1598  0534 2004          	jra	L345
1599  0536               L165:
1600                     ; 494             out_state = OUT_DONE;  
1602  0536 a605          	ld	a,#5
1603  0538 6b12          	ld	(OFST-20,sp),a
1604  053a               L345:
1605                     ; 506       if (tmp_char != 0)  
1607  053a 0d15          	tnz	(OFST-17,sp)
1608  053c 271f          	jreq	L535
1609                     ; 508         if(s != NULL)  
1611  053e 1e27          	ldw	x,(OFST+1,sp)
1612  0540 270f          	jreq	L765
1613                     ; 509           *s++ = tmp_char;  
1615  0542 7b15          	ld	a,(OFST-17,sp)
1616  0544 1e27          	ldw	x,(OFST+1,sp)
1617  0546 1c0001        	addw	x,#1
1618  0549 1f27          	ldw	(OFST+1,sp),x
1619  054b 1d0001        	subw	x,#1
1620  054e f7            	ld	(x),a
1622  054f 2005          	jra	L175
1623  0551               L765:
1624                     ; 511           (void)putchar(tmp_char);  
1626  0551 7b15          	ld	a,(OFST-17,sp)
1627  0553 cd0000        	call	_putchar
1629  0556               L175:
1630                     ; 512         total++;  
1632  0556 1e19          	ldw	x,(OFST-13,sp)
1633  0558 1c0001        	addw	x,#1
1634  055b 1f19          	ldw	(OFST-13,sp),x
1635  055d               L535:
1636                     ; 516     while (out_state!=OUT_DONE);  
1638  055d 7b12          	ld	a,(OFST-20,sp)
1639  055f a105          	cp	a,#5
1640  0561 2703          	jreq	L64
1641  0563 cc0484        	jp	L335
1642  0566               L64:
1643                     ; 518     format++;  
1645  0566 1e2b          	ldw	x,(OFST+5,sp)
1646  0568 1c0001        	addw	x,#1
1647  056b 1f2b          	ldw	(OFST+5,sp),x
1648  056d               L563:
1649                     ; 134   while ( *format )                         /* loop till hit NULL */  
1651  056d 1e2b          	ldw	x,(OFST+5,sp)
1652  056f 7d            	tnz	(x)
1653  0570 2703          	jreq	L05
1654  0572 cc0039        	jp	L363
1655  0575               L05:
1656                     ; 522   if(s != NULL)  
1658  0575 1e27          	ldw	x,(OFST+1,sp)
1659  0577 2703          	jreq	L375
1660                     ; 523     *s = 0;  
1662  0579 1e27          	ldw	x,(OFST+1,sp)
1663  057b 7f            	clr	(x)
1664  057c               L375:
1665                     ; 525   return total;  
1667  057c 1e19          	ldw	x,(OFST-13,sp)
1670  057e 5b28          	addw	sp,#40
1671  0580 81            	ret
1722                     	xdef	_printf
1723                     	xdef	_sprintf
1724                     	xdef	__print_out
1725                     	xref	_putchar
1726                     	xref.b	c_lreg
1727                     	xref.b	c_x
1746                     	xref	c_lursh
1747                     	xref	c_lgsub
1748                     	xref	c_lmul
1749                     	xref	c_ludv
1750                     	xref	c_ltor
1751                     	xref	c_lgneg
1752                     	xref	c_itolx
1753                     	xref	c_rtol
1754                     	xref	c_uitolx
1755                     	xref	c_imul
1756                     	end

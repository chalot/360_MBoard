   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.8.32 - 23 Mar 2010
   3                     ; Generator V4.3.4 - 23 Mar 2010
  43                     ; 61 void I2C_DeInit(void)
  43                     ; 62 {
  45                     	switch	.text
  46  0000               _I2C_DeInit:
  50                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  52  0000 725f5210      	clr	21008
  53                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  55  0004 725f5211      	clr	21009
  56                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  58  0008 725f5212      	clr	21010
  59                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  61  000c 725f5213      	clr	21011
  62                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  64  0010 725f5214      	clr	21012
  65                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  67  0014 725f521a      	clr	21018
  68                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  70  0018 725f521b      	clr	21019
  71                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  73  001c 725f521c      	clr	21020
  74                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  76  0020 3502521d      	mov	21021,#2
  77                     ; 72 }
  80  0024 81            	ret
 248                     .const:	section	.text
 249  0000               L44:
 250  0000 00061a81      	dc.l	400001
 251  0004               L05:
 252  0004 000186a1      	dc.l	100001
 253  0008               L25:
 254  0008 000f4240      	dc.l	1000000
 255                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 255                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 255                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 255                     ; 93 {
 256                     	switch	.text
 257  0025               _I2C_Init:
 259  0025 5209          	subw	sp,#9
 260       00000009      OFST:	set	9
 263                     ; 94   uint16_t result = 0x0004;
 265                     ; 95   uint16_t tmpval = 0;
 267                     ; 96   uint8_t tmpccrh = 0;
 269  0027 0f07          	clr	(OFST-2,sp)
 270                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 272  0029 0d13          	tnz	(OFST+10,sp)
 273  002b 270c          	jreq	L21
 274  002d 7b13          	ld	a,(OFST+10,sp)
 275  002f a101          	cp	a,#1
 276  0031 2706          	jreq	L21
 277  0033 7b13          	ld	a,(OFST+10,sp)
 278  0035 a102          	cp	a,#2
 279  0037 2603          	jrne	L01
 280  0039               L21:
 281  0039 4f            	clr	a
 282  003a 2010          	jra	L41
 283  003c               L01:
 284  003c ae0063        	ldw	x,#99
 285  003f 89            	pushw	x
 286  0040 ae0000        	ldw	x,#0
 287  0043 89            	pushw	x
 288  0044 ae000c        	ldw	x,#L511
 289  0047 cd0000        	call	_assert_failed
 291  004a 5b04          	addw	sp,#4
 292  004c               L41:
 293                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 295  004c 0d14          	tnz	(OFST+11,sp)
 296  004e 2706          	jreq	L02
 297  0050 7b14          	ld	a,(OFST+11,sp)
 298  0052 a180          	cp	a,#128
 299  0054 2603          	jrne	L61
 300  0056               L02:
 301  0056 4f            	clr	a
 302  0057 2010          	jra	L22
 303  0059               L61:
 304  0059 ae0064        	ldw	x,#100
 305  005c 89            	pushw	x
 306  005d ae0000        	ldw	x,#0
 307  0060 89            	pushw	x
 308  0061 ae000c        	ldw	x,#L511
 309  0064 cd0000        	call	_assert_failed
 311  0067 5b04          	addw	sp,#4
 312  0069               L22:
 313                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 315  0069 1e10          	ldw	x,(OFST+7,sp)
 316  006b a30400        	cpw	x,#1024
 317  006e 2403          	jruge	L42
 318  0070 4f            	clr	a
 319  0071 2010          	jra	L62
 320  0073               L42:
 321  0073 ae0065        	ldw	x,#101
 322  0076 89            	pushw	x
 323  0077 ae0000        	ldw	x,#0
 324  007a 89            	pushw	x
 325  007b ae000c        	ldw	x,#L511
 326  007e cd0000        	call	_assert_failed
 328  0081 5b04          	addw	sp,#4
 329  0083               L62:
 330                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 332  0083 0d12          	tnz	(OFST+9,sp)
 333  0085 2706          	jreq	L23
 334  0087 7b12          	ld	a,(OFST+9,sp)
 335  0089 a140          	cp	a,#64
 336  008b 2603          	jrne	L03
 337  008d               L23:
 338  008d 4f            	clr	a
 339  008e 2010          	jra	L43
 340  0090               L03:
 341  0090 ae0066        	ldw	x,#102
 342  0093 89            	pushw	x
 343  0094 ae0000        	ldw	x,#0
 344  0097 89            	pushw	x
 345  0098 ae000c        	ldw	x,#L511
 346  009b cd0000        	call	_assert_failed
 348  009e 5b04          	addw	sp,#4
 349  00a0               L43:
 350                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 352  00a0 0d15          	tnz	(OFST+12,sp)
 353  00a2 2709          	jreq	L63
 354  00a4 7b15          	ld	a,(OFST+12,sp)
 355  00a6 a119          	cp	a,#25
 356  00a8 2403          	jruge	L63
 357  00aa 4f            	clr	a
 358  00ab 2010          	jra	L04
 359  00ad               L63:
 360  00ad ae0067        	ldw	x,#103
 361  00b0 89            	pushw	x
 362  00b1 ae0000        	ldw	x,#0
 363  00b4 89            	pushw	x
 364  00b5 ae000c        	ldw	x,#L511
 365  00b8 cd0000        	call	_assert_failed
 367  00bb 5b04          	addw	sp,#4
 368  00bd               L04:
 369                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 371  00bd 96            	ldw	x,sp
 372  00be 1c000c        	addw	x,#OFST+3
 373  00c1 cd0000        	call	c_lzmp
 375  00c4 2712          	jreq	L24
 376  00c6 96            	ldw	x,sp
 377  00c7 1c000c        	addw	x,#OFST+3
 378  00ca cd0000        	call	c_ltor
 380  00cd ae0000        	ldw	x,#L44
 381  00d0 cd0000        	call	c_lcmp
 383  00d3 2403          	jruge	L24
 384  00d5 4f            	clr	a
 385  00d6 2010          	jra	L64
 386  00d8               L24:
 387  00d8 ae0068        	ldw	x,#104
 388  00db 89            	pushw	x
 389  00dc ae0000        	ldw	x,#0
 390  00df 89            	pushw	x
 391  00e0 ae000c        	ldw	x,#L511
 392  00e3 cd0000        	call	_assert_failed
 394  00e6 5b04          	addw	sp,#4
 395  00e8               L64:
 396                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 398  00e8 c65212        	ld	a,21010
 399  00eb a4c0          	and	a,#192
 400  00ed c75212        	ld	21010,a
 401                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 403  00f0 c65212        	ld	a,21010
 404  00f3 1a15          	or	a,(OFST+12,sp)
 405  00f5 c75212        	ld	21010,a
 406                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 408  00f8 72115210      	bres	21008,#0
 409                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 411  00fc c6521c        	ld	a,21020
 412  00ff a430          	and	a,#48
 413  0101 c7521c        	ld	21020,a
 414                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 416  0104 725f521b      	clr	21019
 417                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 419  0108 96            	ldw	x,sp
 420  0109 1c000c        	addw	x,#OFST+3
 421  010c cd0000        	call	c_ltor
 423  010f ae0004        	ldw	x,#L05
 424  0112 cd0000        	call	c_lcmp
 426  0115 2403          	jruge	L45
 427  0117 cc01a4        	jp	L711
 428  011a               L45:
 429                     ; 125     tmpccrh = I2C_CCRH_FS;
 431  011a a680          	ld	a,#128
 432  011c 6b07          	ld	(OFST-2,sp),a
 433                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 435  011e 0d12          	tnz	(OFST+9,sp)
 436  0120 2630          	jrne	L121
 437                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 439  0122 96            	ldw	x,sp
 440  0123 1c000c        	addw	x,#OFST+3
 441  0126 cd0000        	call	c_ltor
 443  0129 a603          	ld	a,#3
 444  012b cd0000        	call	c_smul
 446  012e 96            	ldw	x,sp
 447  012f 1c0001        	addw	x,#OFST-8
 448  0132 cd0000        	call	c_rtol
 450  0135 7b15          	ld	a,(OFST+12,sp)
 451  0137 b703          	ld	c_lreg+3,a
 452  0139 3f02          	clr	c_lreg+2
 453  013b 3f01          	clr	c_lreg+1
 454  013d 3f00          	clr	c_lreg
 455  013f ae0008        	ldw	x,#L25
 456  0142 cd0000        	call	c_lmul
 458  0145 96            	ldw	x,sp
 459  0146 1c0001        	addw	x,#OFST-8
 460  0149 cd0000        	call	c_ludv
 462  014c be02          	ldw	x,c_lreg+2
 463  014e 1f08          	ldw	(OFST-1,sp),x
 465  0150 2034          	jra	L321
 466  0152               L121:
 467                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 469  0152 96            	ldw	x,sp
 470  0153 1c000c        	addw	x,#OFST+3
 471  0156 cd0000        	call	c_ltor
 473  0159 a619          	ld	a,#25
 474  015b cd0000        	call	c_smul
 476  015e 96            	ldw	x,sp
 477  015f 1c0001        	addw	x,#OFST-8
 478  0162 cd0000        	call	c_rtol
 480  0165 7b15          	ld	a,(OFST+12,sp)
 481  0167 b703          	ld	c_lreg+3,a
 482  0169 3f02          	clr	c_lreg+2
 483  016b 3f01          	clr	c_lreg+1
 484  016d 3f00          	clr	c_lreg
 485  016f ae0008        	ldw	x,#L25
 486  0172 cd0000        	call	c_lmul
 488  0175 96            	ldw	x,sp
 489  0176 1c0001        	addw	x,#OFST-8
 490  0179 cd0000        	call	c_ludv
 492  017c be02          	ldw	x,c_lreg+2
 493  017e 1f08          	ldw	(OFST-1,sp),x
 494                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 496  0180 7b07          	ld	a,(OFST-2,sp)
 497  0182 aa40          	or	a,#64
 498  0184 6b07          	ld	(OFST-2,sp),a
 499  0186               L321:
 500                     ; 141     if (result < (uint16_t)0x01)
 502  0186 1e08          	ldw	x,(OFST-1,sp)
 503  0188 2605          	jrne	L521
 504                     ; 144       result = (uint16_t)0x0001;
 506  018a ae0001        	ldw	x,#1
 507  018d 1f08          	ldw	(OFST-1,sp),x
 508  018f               L521:
 509                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 511  018f 7b15          	ld	a,(OFST+12,sp)
 512  0191 97            	ld	xl,a
 513  0192 a603          	ld	a,#3
 514  0194 42            	mul	x,a
 515  0195 a60a          	ld	a,#10
 516  0197 cd0000        	call	c_sdivx
 518  019a 5c            	incw	x
 519  019b 1f05          	ldw	(OFST-4,sp),x
 520                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 522  019d 7b06          	ld	a,(OFST-3,sp)
 523  019f c7521d        	ld	21021,a
 525  01a2 2043          	jra	L721
 526  01a4               L711:
 527                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 529  01a4 96            	ldw	x,sp
 530  01a5 1c000c        	addw	x,#OFST+3
 531  01a8 cd0000        	call	c_ltor
 533  01ab 3803          	sll	c_lreg+3
 534  01ad 3902          	rlc	c_lreg+2
 535  01af 3901          	rlc	c_lreg+1
 536  01b1 3900          	rlc	c_lreg
 537  01b3 96            	ldw	x,sp
 538  01b4 1c0001        	addw	x,#OFST-8
 539  01b7 cd0000        	call	c_rtol
 541  01ba 7b15          	ld	a,(OFST+12,sp)
 542  01bc b703          	ld	c_lreg+3,a
 543  01be 3f02          	clr	c_lreg+2
 544  01c0 3f01          	clr	c_lreg+1
 545  01c2 3f00          	clr	c_lreg
 546  01c4 ae0008        	ldw	x,#L25
 547  01c7 cd0000        	call	c_lmul
 549  01ca 96            	ldw	x,sp
 550  01cb 1c0001        	addw	x,#OFST-8
 551  01ce cd0000        	call	c_ludv
 553  01d1 be02          	ldw	x,c_lreg+2
 554  01d3 1f08          	ldw	(OFST-1,sp),x
 555                     ; 161     if (result < (uint16_t)0x0004)
 557  01d5 1e08          	ldw	x,(OFST-1,sp)
 558  01d7 a30004        	cpw	x,#4
 559  01da 2405          	jruge	L131
 560                     ; 164       result = (uint16_t)0x0004;
 562  01dc ae0004        	ldw	x,#4
 563  01df 1f08          	ldw	(OFST-1,sp),x
 564  01e1               L131:
 565                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 567  01e1 7b15          	ld	a,(OFST+12,sp)
 568  01e3 4c            	inc	a
 569  01e4 c7521d        	ld	21021,a
 570  01e7               L721:
 571                     ; 175   I2C->CCRL = (uint8_t)result;
 573  01e7 7b09          	ld	a,(OFST+0,sp)
 574  01e9 c7521b        	ld	21019,a
 575                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 577  01ec 7b08          	ld	a,(OFST-1,sp)
 578  01ee a40f          	and	a,#15
 579  01f0 1a07          	or	a,(OFST-2,sp)
 580  01f2 c7521c        	ld	21020,a
 581                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 583  01f5 72105210      	bset	21008,#0
 584                     ; 182   I2C_AcknowledgeConfig(Ack);
 586  01f9 7b13          	ld	a,(OFST+10,sp)
 587  01fb cd0323        	call	_I2C_AcknowledgeConfig
 589                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 591  01fe 7b11          	ld	a,(OFST+8,sp)
 592  0200 c75213        	ld	21011,a
 593                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 593                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 595  0203 7b10          	ld	a,(OFST+7,sp)
 596  0205 97            	ld	xl,a
 597  0206 7b11          	ld	a,(OFST+8,sp)
 598  0208 9f            	ld	a,xl
 599  0209 a403          	and	a,#3
 600  020b 97            	ld	xl,a
 601  020c 4f            	clr	a
 602  020d 02            	rlwa	x,a
 603  020e 4f            	clr	a
 604  020f 01            	rrwa	x,a
 605  0210 48            	sll	a
 606  0211 59            	rlcw	x
 607  0212 9f            	ld	a,xl
 608  0213 6b04          	ld	(OFST-5,sp),a
 609  0215 7b14          	ld	a,(OFST+11,sp)
 610  0217 aa40          	or	a,#64
 611  0219 1a04          	or	a,(OFST-5,sp)
 612  021b c75214        	ld	21012,a
 613                     ; 188 }
 616  021e 5b09          	addw	sp,#9
 617  0220 81            	ret
 673                     ; 196 void I2C_Cmd(FunctionalState NewState)
 673                     ; 197 {
 674                     	switch	.text
 675  0221               _I2C_Cmd:
 677  0221 88            	push	a
 678       00000000      OFST:	set	0
 681                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 683  0222 4d            	tnz	a
 684  0223 2704          	jreq	L26
 685  0225 a101          	cp	a,#1
 686  0227 2603          	jrne	L06
 687  0229               L26:
 688  0229 4f            	clr	a
 689  022a 2010          	jra	L46
 690  022c               L06:
 691  022c ae00c8        	ldw	x,#200
 692  022f 89            	pushw	x
 693  0230 ae0000        	ldw	x,#0
 694  0233 89            	pushw	x
 695  0234 ae000c        	ldw	x,#L511
 696  0237 cd0000        	call	_assert_failed
 698  023a 5b04          	addw	sp,#4
 699  023c               L46:
 700                     ; 202   if (NewState != DISABLE)
 702  023c 0d01          	tnz	(OFST+1,sp)
 703  023e 2706          	jreq	L161
 704                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 706  0240 72105210      	bset	21008,#0
 708  0244 2004          	jra	L361
 709  0246               L161:
 710                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 712  0246 72115210      	bres	21008,#0
 713  024a               L361:
 714                     ; 212 }
 717  024a 84            	pop	a
 718  024b 81            	ret
 754                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 754                     ; 221 {
 755                     	switch	.text
 756  024c               _I2C_GeneralCallCmd:
 758  024c 88            	push	a
 759       00000000      OFST:	set	0
 762                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 764  024d 4d            	tnz	a
 765  024e 2704          	jreq	L27
 766  0250 a101          	cp	a,#1
 767  0252 2603          	jrne	L07
 768  0254               L27:
 769  0254 4f            	clr	a
 770  0255 2010          	jra	L47
 771  0257               L07:
 772  0257 ae00e0        	ldw	x,#224
 773  025a 89            	pushw	x
 774  025b ae0000        	ldw	x,#0
 775  025e 89            	pushw	x
 776  025f ae000c        	ldw	x,#L511
 777  0262 cd0000        	call	_assert_failed
 779  0265 5b04          	addw	sp,#4
 780  0267               L47:
 781                     ; 226   if (NewState != DISABLE)
 783  0267 0d01          	tnz	(OFST+1,sp)
 784  0269 2706          	jreq	L302
 785                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 787  026b 721c5210      	bset	21008,#6
 789  026f 2004          	jra	L502
 790  0271               L302:
 791                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 793  0271 721d5210      	bres	21008,#6
 794  0275               L502:
 795                     ; 236 }
 798  0275 84            	pop	a
 799  0276 81            	ret
 835                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 835                     ; 247 {
 836                     	switch	.text
 837  0277               _I2C_GenerateSTART:
 839  0277 88            	push	a
 840       00000000      OFST:	set	0
 843                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 845  0278 4d            	tnz	a
 846  0279 2704          	jreq	L201
 847  027b a101          	cp	a,#1
 848  027d 2603          	jrne	L001
 849  027f               L201:
 850  027f 4f            	clr	a
 851  0280 2010          	jra	L401
 852  0282               L001:
 853  0282 ae00fa        	ldw	x,#250
 854  0285 89            	pushw	x
 855  0286 ae0000        	ldw	x,#0
 856  0289 89            	pushw	x
 857  028a ae000c        	ldw	x,#L511
 858  028d cd0000        	call	_assert_failed
 860  0290 5b04          	addw	sp,#4
 861  0292               L401:
 862                     ; 252   if (NewState != DISABLE)
 864  0292 0d01          	tnz	(OFST+1,sp)
 865  0294 2706          	jreq	L522
 866                     ; 255     I2C->CR2 |= I2C_CR2_START;
 868  0296 72105211      	bset	21009,#0
 870  029a 2004          	jra	L722
 871  029c               L522:
 872                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 874  029c 72115211      	bres	21009,#0
 875  02a0               L722:
 876                     ; 262 }
 879  02a0 84            	pop	a
 880  02a1 81            	ret
 916                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 916                     ; 271 {
 917                     	switch	.text
 918  02a2               _I2C_GenerateSTOP:
 920  02a2 88            	push	a
 921       00000000      OFST:	set	0
 924                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 926  02a3 4d            	tnz	a
 927  02a4 2704          	jreq	L211
 928  02a6 a101          	cp	a,#1
 929  02a8 2603          	jrne	L011
 930  02aa               L211:
 931  02aa 4f            	clr	a
 932  02ab 2010          	jra	L411
 933  02ad               L011:
 934  02ad ae0112        	ldw	x,#274
 935  02b0 89            	pushw	x
 936  02b1 ae0000        	ldw	x,#0
 937  02b4 89            	pushw	x
 938  02b5 ae000c        	ldw	x,#L511
 939  02b8 cd0000        	call	_assert_failed
 941  02bb 5b04          	addw	sp,#4
 942  02bd               L411:
 943                     ; 276   if (NewState != DISABLE)
 945  02bd 0d01          	tnz	(OFST+1,sp)
 946  02bf 2706          	jreq	L742
 947                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 949  02c1 72125211      	bset	21009,#1
 951  02c5 2004          	jra	L152
 952  02c7               L742:
 953                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 955  02c7 72135211      	bres	21009,#1
 956  02cb               L152:
 957                     ; 286 }
 960  02cb 84            	pop	a
 961  02cc 81            	ret
 998                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
 998                     ; 295 {
 999                     	switch	.text
1000  02cd               _I2C_SoftwareResetCmd:
1002  02cd 88            	push	a
1003       00000000      OFST:	set	0
1006                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1008  02ce 4d            	tnz	a
1009  02cf 2704          	jreq	L221
1010  02d1 a101          	cp	a,#1
1011  02d3 2603          	jrne	L021
1012  02d5               L221:
1013  02d5 4f            	clr	a
1014  02d6 2010          	jra	L421
1015  02d8               L021:
1016  02d8 ae0129        	ldw	x,#297
1017  02db 89            	pushw	x
1018  02dc ae0000        	ldw	x,#0
1019  02df 89            	pushw	x
1020  02e0 ae000c        	ldw	x,#L511
1021  02e3 cd0000        	call	_assert_failed
1023  02e6 5b04          	addw	sp,#4
1024  02e8               L421:
1025                     ; 299   if (NewState != DISABLE)
1027  02e8 0d01          	tnz	(OFST+1,sp)
1028  02ea 2706          	jreq	L172
1029                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
1031  02ec 721e5211      	bset	21009,#7
1033  02f0 2004          	jra	L372
1034  02f2               L172:
1035                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1037  02f2 721f5211      	bres	21009,#7
1038  02f6               L372:
1039                     ; 309 }
1042  02f6 84            	pop	a
1043  02f7 81            	ret
1080                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
1080                     ; 319 {
1081                     	switch	.text
1082  02f8               _I2C_StretchClockCmd:
1084  02f8 88            	push	a
1085       00000000      OFST:	set	0
1088                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1090  02f9 4d            	tnz	a
1091  02fa 2704          	jreq	L231
1092  02fc a101          	cp	a,#1
1093  02fe 2603          	jrne	L031
1094  0300               L231:
1095  0300 4f            	clr	a
1096  0301 2010          	jra	L431
1097  0303               L031:
1098  0303 ae0141        	ldw	x,#321
1099  0306 89            	pushw	x
1100  0307 ae0000        	ldw	x,#0
1101  030a 89            	pushw	x
1102  030b ae000c        	ldw	x,#L511
1103  030e cd0000        	call	_assert_failed
1105  0311 5b04          	addw	sp,#4
1106  0313               L431:
1107                     ; 323   if (NewState != DISABLE)
1109  0313 0d01          	tnz	(OFST+1,sp)
1110  0315 2706          	jreq	L313
1111                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1113  0317 721f5210      	bres	21008,#7
1115  031b 2004          	jra	L513
1116  031d               L313:
1117                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1119  031d 721e5210      	bset	21008,#7
1120  0321               L513:
1121                     ; 334 }
1124  0321 84            	pop	a
1125  0322 81            	ret
1162                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1162                     ; 344 {
1163                     	switch	.text
1164  0323               _I2C_AcknowledgeConfig:
1166  0323 88            	push	a
1167       00000000      OFST:	set	0
1170                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
1172  0324 4d            	tnz	a
1173  0325 2708          	jreq	L241
1174  0327 a101          	cp	a,#1
1175  0329 2704          	jreq	L241
1176  032b a102          	cp	a,#2
1177  032d 2603          	jrne	L041
1178  032f               L241:
1179  032f 4f            	clr	a
1180  0330 2010          	jra	L441
1181  0332               L041:
1182  0332 ae015b        	ldw	x,#347
1183  0335 89            	pushw	x
1184  0336 ae0000        	ldw	x,#0
1185  0339 89            	pushw	x
1186  033a ae000c        	ldw	x,#L511
1187  033d cd0000        	call	_assert_failed
1189  0340 5b04          	addw	sp,#4
1190  0342               L441:
1191                     ; 349   if (Ack == I2C_ACK_NONE)
1193  0342 0d01          	tnz	(OFST+1,sp)
1194  0344 2606          	jrne	L533
1195                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1197  0346 72155211      	bres	21009,#2
1199  034a 2014          	jra	L733
1200  034c               L533:
1201                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
1203  034c 72145211      	bset	21009,#2
1204                     ; 359     if (Ack == I2C_ACK_CURR)
1206  0350 7b01          	ld	a,(OFST+1,sp)
1207  0352 a101          	cp	a,#1
1208  0354 2606          	jrne	L143
1209                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1211  0356 72175211      	bres	21009,#3
1213  035a 2004          	jra	L733
1214  035c               L143:
1215                     ; 367       I2C->CR2 |= I2C_CR2_POS;
1217  035c 72165211      	bset	21009,#3
1218  0360               L733:
1219                     ; 370 }
1222  0360 84            	pop	a
1223  0361 81            	ret
1296                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1296                     ; 381 {
1297                     	switch	.text
1298  0362               _I2C_ITConfig:
1300  0362 89            	pushw	x
1301       00000000      OFST:	set	0
1304                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1306  0363 9e            	ld	a,xh
1307  0364 a101          	cp	a,#1
1308  0366 271e          	jreq	L251
1309  0368 9e            	ld	a,xh
1310  0369 a102          	cp	a,#2
1311  036b 2719          	jreq	L251
1312  036d 9e            	ld	a,xh
1313  036e a104          	cp	a,#4
1314  0370 2714          	jreq	L251
1315  0372 9e            	ld	a,xh
1316  0373 a103          	cp	a,#3
1317  0375 270f          	jreq	L251
1318  0377 9e            	ld	a,xh
1319  0378 a105          	cp	a,#5
1320  037a 270a          	jreq	L251
1321  037c 9e            	ld	a,xh
1322  037d a106          	cp	a,#6
1323  037f 2705          	jreq	L251
1324  0381 9e            	ld	a,xh
1325  0382 a107          	cp	a,#7
1326  0384 2603          	jrne	L051
1327  0386               L251:
1328  0386 4f            	clr	a
1329  0387 2010          	jra	L451
1330  0389               L051:
1331  0389 ae0180        	ldw	x,#384
1332  038c 89            	pushw	x
1333  038d ae0000        	ldw	x,#0
1334  0390 89            	pushw	x
1335  0391 ae000c        	ldw	x,#L511
1336  0394 cd0000        	call	_assert_failed
1338  0397 5b04          	addw	sp,#4
1339  0399               L451:
1340                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1342  0399 0d02          	tnz	(OFST+2,sp)
1343  039b 2706          	jreq	L061
1344  039d 7b02          	ld	a,(OFST+2,sp)
1345  039f a101          	cp	a,#1
1346  03a1 2603          	jrne	L651
1347  03a3               L061:
1348  03a3 4f            	clr	a
1349  03a4 2010          	jra	L261
1350  03a6               L651:
1351  03a6 ae0181        	ldw	x,#385
1352  03a9 89            	pushw	x
1353  03aa ae0000        	ldw	x,#0
1354  03ad 89            	pushw	x
1355  03ae ae000c        	ldw	x,#L511
1356  03b1 cd0000        	call	_assert_failed
1358  03b4 5b04          	addw	sp,#4
1359  03b6               L261:
1360                     ; 387   if (NewState != DISABLE)
1362  03b6 0d02          	tnz	(OFST+2,sp)
1363  03b8 270a          	jreq	L104
1364                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1366  03ba c6521a        	ld	a,21018
1367  03bd 1a01          	or	a,(OFST+1,sp)
1368  03bf c7521a        	ld	21018,a
1370  03c2 2009          	jra	L304
1371  03c4               L104:
1372                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1374  03c4 7b01          	ld	a,(OFST+1,sp)
1375  03c6 43            	cpl	a
1376  03c7 c4521a        	and	a,21018
1377  03ca c7521a        	ld	21018,a
1378  03cd               L304:
1379                     ; 397 }
1382  03cd 85            	popw	x
1383  03ce 81            	ret
1420                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1420                     ; 406 {
1421                     	switch	.text
1422  03cf               _I2C_FastModeDutyCycleConfig:
1424  03cf 88            	push	a
1425       00000000      OFST:	set	0
1428                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1430  03d0 4d            	tnz	a
1431  03d1 2704          	jreq	L071
1432  03d3 a140          	cp	a,#64
1433  03d5 2603          	jrne	L661
1434  03d7               L071:
1435  03d7 4f            	clr	a
1436  03d8 2010          	jra	L271
1437  03da               L661:
1438  03da ae0199        	ldw	x,#409
1439  03dd 89            	pushw	x
1440  03de ae0000        	ldw	x,#0
1441  03e1 89            	pushw	x
1442  03e2 ae000c        	ldw	x,#L511
1443  03e5 cd0000        	call	_assert_failed
1445  03e8 5b04          	addw	sp,#4
1446  03ea               L271:
1447                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1449  03ea 7b01          	ld	a,(OFST+1,sp)
1450  03ec a140          	cp	a,#64
1451  03ee 2606          	jrne	L324
1452                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1454  03f0 721c521c      	bset	21020,#6
1456  03f4 2004          	jra	L524
1457  03f6               L324:
1458                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1460  03f6 721d521c      	bres	21020,#6
1461  03fa               L524:
1462                     ; 421 }
1465  03fa 84            	pop	a
1466  03fb 81            	ret
1489                     ; 428 uint8_t I2C_ReceiveData(void)
1489                     ; 429 {
1490                     	switch	.text
1491  03fc               _I2C_ReceiveData:
1495                     ; 431   return ((uint8_t)I2C->DR);
1497  03fc c65216        	ld	a,21014
1500  03ff 81            	ret
1564                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1564                     ; 442 {
1565                     	switch	.text
1566  0400               _I2C_Send7bitAddress:
1568  0400 89            	pushw	x
1569       00000000      OFST:	set	0
1572                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1574  0401 9e            	ld	a,xh
1575  0402 a501          	bcp	a,#1
1576  0404 2603          	jrne	L002
1577  0406 4f            	clr	a
1578  0407 2010          	jra	L202
1579  0409               L002:
1580  0409 ae01bc        	ldw	x,#444
1581  040c 89            	pushw	x
1582  040d ae0000        	ldw	x,#0
1583  0410 89            	pushw	x
1584  0411 ae000c        	ldw	x,#L511
1585  0414 cd0000        	call	_assert_failed
1587  0417 5b04          	addw	sp,#4
1588  0419               L202:
1589                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1591  0419 0d02          	tnz	(OFST+2,sp)
1592  041b 2706          	jreq	L602
1593  041d 7b02          	ld	a,(OFST+2,sp)
1594  041f a101          	cp	a,#1
1595  0421 2603          	jrne	L402
1596  0423               L602:
1597  0423 4f            	clr	a
1598  0424 2010          	jra	L012
1599  0426               L402:
1600  0426 ae01bd        	ldw	x,#445
1601  0429 89            	pushw	x
1602  042a ae0000        	ldw	x,#0
1603  042d 89            	pushw	x
1604  042e ae000c        	ldw	x,#L511
1605  0431 cd0000        	call	_assert_failed
1607  0434 5b04          	addw	sp,#4
1608  0436               L012:
1609                     ; 448   Address &= (uint8_t)0xFE;
1611  0436 7b01          	ld	a,(OFST+1,sp)
1612  0438 a4fe          	and	a,#254
1613  043a 6b01          	ld	(OFST+1,sp),a
1614                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1616  043c 7b01          	ld	a,(OFST+1,sp)
1617  043e 1a02          	or	a,(OFST+2,sp)
1618  0440 c75216        	ld	21014,a
1619                     ; 452 }
1622  0443 85            	popw	x
1623  0444 81            	ret
1655                     ; 459 void I2C_SendData(uint8_t Data)
1655                     ; 460 {
1656                     	switch	.text
1657  0445               _I2C_SendData:
1661                     ; 462   I2C->DR = Data;
1663  0445 c75216        	ld	21014,a
1664                     ; 463 }
1667  0448 81            	ret
1888                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1888                     ; 580 {
1889                     	switch	.text
1890  0449               _I2C_CheckEvent:
1892  0449 89            	pushw	x
1893  044a 5206          	subw	sp,#6
1894       00000006      OFST:	set	6
1897                     ; 581   __IO uint16_t lastevent = 0x00;
1899  044c 5f            	clrw	x
1900  044d 1f04          	ldw	(OFST-2,sp),x
1901                     ; 582   uint8_t flag1 = 0x00 ;
1903                     ; 583   uint8_t flag2 = 0x00;
1905                     ; 584   ErrorStatus status = ERROR;
1907                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1909  044f 1e07          	ldw	x,(OFST+1,sp)
1910  0451 a30682        	cpw	x,#1666
1911  0454 2769          	jreq	L022
1912  0456 1e07          	ldw	x,(OFST+1,sp)
1913  0458 a30202        	cpw	x,#514
1914  045b 2762          	jreq	L022
1915  045d 1e07          	ldw	x,(OFST+1,sp)
1916  045f a31200        	cpw	x,#4608
1917  0462 275b          	jreq	L022
1918  0464 1e07          	ldw	x,(OFST+1,sp)
1919  0466 a30240        	cpw	x,#576
1920  0469 2754          	jreq	L022
1921  046b 1e07          	ldw	x,(OFST+1,sp)
1922  046d a30350        	cpw	x,#848
1923  0470 274d          	jreq	L022
1924  0472 1e07          	ldw	x,(OFST+1,sp)
1925  0474 a30684        	cpw	x,#1668
1926  0477 2746          	jreq	L022
1927  0479 1e07          	ldw	x,(OFST+1,sp)
1928  047b a30794        	cpw	x,#1940
1929  047e 273f          	jreq	L022
1930  0480 1e07          	ldw	x,(OFST+1,sp)
1931  0482 a30004        	cpw	x,#4
1932  0485 2738          	jreq	L022
1933  0487 1e07          	ldw	x,(OFST+1,sp)
1934  0489 a30010        	cpw	x,#16
1935  048c 2731          	jreq	L022
1936  048e 1e07          	ldw	x,(OFST+1,sp)
1937  0490 a30301        	cpw	x,#769
1938  0493 272a          	jreq	L022
1939  0495 1e07          	ldw	x,(OFST+1,sp)
1940  0497 a30782        	cpw	x,#1922
1941  049a 2723          	jreq	L022
1942  049c 1e07          	ldw	x,(OFST+1,sp)
1943  049e a30302        	cpw	x,#770
1944  04a1 271c          	jreq	L022
1945  04a3 1e07          	ldw	x,(OFST+1,sp)
1946  04a5 a30340        	cpw	x,#832
1947  04a8 2715          	jreq	L022
1948  04aa 1e07          	ldw	x,(OFST+1,sp)
1949  04ac a30784        	cpw	x,#1924
1950  04af 270e          	jreq	L022
1951  04b1 1e07          	ldw	x,(OFST+1,sp)
1952  04b3 a30780        	cpw	x,#1920
1953  04b6 2707          	jreq	L022
1954  04b8 1e07          	ldw	x,(OFST+1,sp)
1955  04ba a30308        	cpw	x,#776
1956  04bd 2603          	jrne	L612
1957  04bf               L022:
1958  04bf 4f            	clr	a
1959  04c0 2010          	jra	L222
1960  04c2               L612:
1961  04c2 ae024b        	ldw	x,#587
1962  04c5 89            	pushw	x
1963  04c6 ae0000        	ldw	x,#0
1964  04c9 89            	pushw	x
1965  04ca ae000c        	ldw	x,#L511
1966  04cd cd0000        	call	_assert_failed
1968  04d0 5b04          	addw	sp,#4
1969  04d2               L222:
1970                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1972  04d2 1e07          	ldw	x,(OFST+1,sp)
1973  04d4 a30004        	cpw	x,#4
1974  04d7 260b          	jrne	L706
1975                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1977  04d9 c65218        	ld	a,21016
1978  04dc a404          	and	a,#4
1979  04de 5f            	clrw	x
1980  04df 97            	ld	xl,a
1981  04e0 1f04          	ldw	(OFST-2,sp),x
1983  04e2 201f          	jra	L116
1984  04e4               L706:
1985                     ; 595     flag1 = I2C->SR1;
1987  04e4 c65217        	ld	a,21015
1988  04e7 6b03          	ld	(OFST-3,sp),a
1989                     ; 596     flag2 = I2C->SR3;
1991  04e9 c65219        	ld	a,21017
1992  04ec 6b06          	ld	(OFST+0,sp),a
1993                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1995  04ee 7b03          	ld	a,(OFST-3,sp)
1996  04f0 5f            	clrw	x
1997  04f1 97            	ld	xl,a
1998  04f2 1f01          	ldw	(OFST-5,sp),x
1999  04f4 7b06          	ld	a,(OFST+0,sp)
2000  04f6 5f            	clrw	x
2001  04f7 97            	ld	xl,a
2002  04f8 4f            	clr	a
2003  04f9 02            	rlwa	x,a
2004  04fa 01            	rrwa	x,a
2005  04fb 1a02          	or	a,(OFST-4,sp)
2006  04fd 01            	rrwa	x,a
2007  04fe 1a01          	or	a,(OFST-5,sp)
2008  0500 01            	rrwa	x,a
2009  0501 1f04          	ldw	(OFST-2,sp),x
2010  0503               L116:
2011                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2013  0503 1e04          	ldw	x,(OFST-2,sp)
2014  0505 01            	rrwa	x,a
2015  0506 1408          	and	a,(OFST+2,sp)
2016  0508 01            	rrwa	x,a
2017  0509 1407          	and	a,(OFST+1,sp)
2018  050b 01            	rrwa	x,a
2019  050c 1307          	cpw	x,(OFST+1,sp)
2020  050e 2606          	jrne	L316
2021                     ; 603     status = SUCCESS;
2023  0510 a601          	ld	a,#1
2024  0512 6b06          	ld	(OFST+0,sp),a
2026  0514 2002          	jra	L516
2027  0516               L316:
2028                     ; 608     status = ERROR;
2030  0516 0f06          	clr	(OFST+0,sp)
2031  0518               L516:
2032                     ; 612   return status;
2034  0518 7b06          	ld	a,(OFST+0,sp)
2037  051a 5b08          	addw	sp,#8
2038  051c 81            	ret
2087                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
2087                     ; 630 {
2088                     	switch	.text
2089  051d               _I2C_GetLastEvent:
2091  051d 5206          	subw	sp,#6
2092       00000006      OFST:	set	6
2095                     ; 631   __IO uint16_t lastevent = 0;
2097  051f 5f            	clrw	x
2098  0520 1f05          	ldw	(OFST-1,sp),x
2099                     ; 632   uint16_t flag1 = 0;
2101                     ; 633   uint16_t flag2 = 0;
2103                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2105  0522 c65218        	ld	a,21016
2106  0525 a504          	bcp	a,#4
2107  0527 2707          	jreq	L146
2108                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2110  0529 ae0004        	ldw	x,#4
2111  052c 1f05          	ldw	(OFST-1,sp),x
2113  052e 201b          	jra	L346
2114  0530               L146:
2115                     ; 642     flag1 = I2C->SR1;
2117  0530 c65217        	ld	a,21015
2118  0533 5f            	clrw	x
2119  0534 97            	ld	xl,a
2120  0535 1f01          	ldw	(OFST-5,sp),x
2121                     ; 643     flag2 = I2C->SR3;
2123  0537 c65219        	ld	a,21017
2124  053a 5f            	clrw	x
2125  053b 97            	ld	xl,a
2126  053c 1f03          	ldw	(OFST-3,sp),x
2127                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2129  053e 1e03          	ldw	x,(OFST-3,sp)
2130  0540 4f            	clr	a
2131  0541 02            	rlwa	x,a
2132  0542 01            	rrwa	x,a
2133  0543 1a02          	or	a,(OFST-4,sp)
2134  0545 01            	rrwa	x,a
2135  0546 1a01          	or	a,(OFST-5,sp)
2136  0548 01            	rrwa	x,a
2137  0549 1f05          	ldw	(OFST-1,sp),x
2138  054b               L346:
2139                     ; 649   return (I2C_Event_TypeDef)lastevent;
2141  054b 1e05          	ldw	x,(OFST-1,sp)
2144  054d 5b06          	addw	sp,#6
2145  054f 81            	ret
2357                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2357                     ; 681 {
2358                     	switch	.text
2359  0550               _I2C_GetFlagStatus:
2361  0550 89            	pushw	x
2362  0551 89            	pushw	x
2363       00000002      OFST:	set	2
2366                     ; 682   uint8_t tempreg = 0;
2368  0552 0f02          	clr	(OFST+0,sp)
2369                     ; 683   uint8_t regindex = 0;
2371                     ; 684   FlagStatus bitstatus = RESET;
2373                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2375  0554 a30180        	cpw	x,#384
2376  0557 274b          	jreq	L232
2377  0559 a30140        	cpw	x,#320
2378  055c 2746          	jreq	L232
2379  055e a30110        	cpw	x,#272
2380  0561 2741          	jreq	L232
2381  0563 a30108        	cpw	x,#264
2382  0566 273c          	jreq	L232
2383  0568 a30104        	cpw	x,#260
2384  056b 2737          	jreq	L232
2385  056d a30102        	cpw	x,#258
2386  0570 2732          	jreq	L232
2387  0572 a30101        	cpw	x,#257
2388  0575 272d          	jreq	L232
2389  0577 a30220        	cpw	x,#544
2390  057a 2728          	jreq	L232
2391  057c a30208        	cpw	x,#520
2392  057f 2723          	jreq	L232
2393  0581 a30204        	cpw	x,#516
2394  0584 271e          	jreq	L232
2395  0586 a30202        	cpw	x,#514
2396  0589 2719          	jreq	L232
2397  058b a30201        	cpw	x,#513
2398  058e 2714          	jreq	L232
2399  0590 a30310        	cpw	x,#784
2400  0593 270f          	jreq	L232
2401  0595 a30304        	cpw	x,#772
2402  0598 270a          	jreq	L232
2403  059a a30302        	cpw	x,#770
2404  059d 2705          	jreq	L232
2405  059f a30301        	cpw	x,#769
2406  05a2 2603          	jrne	L032
2407  05a4               L232:
2408  05a4 4f            	clr	a
2409  05a5 2010          	jra	L432
2410  05a7               L032:
2411  05a7 ae02af        	ldw	x,#687
2412  05aa 89            	pushw	x
2413  05ab ae0000        	ldw	x,#0
2414  05ae 89            	pushw	x
2415  05af ae000c        	ldw	x,#L511
2416  05b2 cd0000        	call	_assert_failed
2418  05b5 5b04          	addw	sp,#4
2419  05b7               L432:
2420                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2422  05b7 7b03          	ld	a,(OFST+1,sp)
2423  05b9 6b01          	ld	(OFST-1,sp),a
2424                     ; 692   switch (regindex)
2426  05bb 7b01          	ld	a,(OFST-1,sp)
2428                     ; 709     default:
2428                     ; 710       break;
2429  05bd 4a            	dec	a
2430  05be 2708          	jreq	L546
2431  05c0 4a            	dec	a
2432  05c1 270c          	jreq	L746
2433  05c3 4a            	dec	a
2434  05c4 2710          	jreq	L156
2435  05c6 2013          	jra	L167
2436  05c8               L546:
2437                     ; 695     case 0x01:
2437                     ; 696       tempreg = (uint8_t)I2C->SR1;
2439  05c8 c65217        	ld	a,21015
2440  05cb 6b02          	ld	(OFST+0,sp),a
2441                     ; 697       break;
2443  05cd 200c          	jra	L167
2444  05cf               L746:
2445                     ; 700     case 0x02:
2445                     ; 701       tempreg = (uint8_t)I2C->SR2;
2447  05cf c65218        	ld	a,21016
2448  05d2 6b02          	ld	(OFST+0,sp),a
2449                     ; 702       break;
2451  05d4 2005          	jra	L167
2452  05d6               L156:
2453                     ; 705     case 0x03:
2453                     ; 706       tempreg = (uint8_t)I2C->SR3;
2455  05d6 c65219        	ld	a,21017
2456  05d9 6b02          	ld	(OFST+0,sp),a
2457                     ; 707       break;
2459  05db               L356:
2460                     ; 709     default:
2460                     ; 710       break;
2462  05db               L167:
2463                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2465  05db 7b04          	ld	a,(OFST+2,sp)
2466  05dd 1502          	bcp	a,(OFST+0,sp)
2467  05df 2706          	jreq	L367
2468                     ; 717     bitstatus = SET;
2470  05e1 a601          	ld	a,#1
2471  05e3 6b02          	ld	(OFST+0,sp),a
2473  05e5 2002          	jra	L567
2474  05e7               L367:
2475                     ; 722     bitstatus = RESET;
2477  05e7 0f02          	clr	(OFST+0,sp)
2478  05e9               L567:
2479                     ; 725   return bitstatus;
2481  05e9 7b02          	ld	a,(OFST+0,sp)
2484  05eb 5b04          	addw	sp,#4
2485  05ed 81            	ret
2528                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2528                     ; 761 {
2529                     	switch	.text
2530  05ee               _I2C_ClearFlag:
2532  05ee 89            	pushw	x
2533  05ef 89            	pushw	x
2534       00000002      OFST:	set	2
2537                     ; 762   uint16_t flagpos = 0;
2539                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2541  05f0 01            	rrwa	x,a
2542  05f1 9f            	ld	a,xl
2543  05f2 a4fd          	and	a,#253
2544  05f4 97            	ld	xl,a
2545  05f5 4f            	clr	a
2546  05f6 02            	rlwa	x,a
2547  05f7 5d            	tnzw	x
2548  05f8 2607          	jrne	L042
2549  05fa 1e03          	ldw	x,(OFST+1,sp)
2550  05fc 2703          	jreq	L042
2551  05fe 4f            	clr	a
2552  05ff 2010          	jra	L242
2553  0601               L042:
2554  0601 ae02fc        	ldw	x,#764
2555  0604 89            	pushw	x
2556  0605 ae0000        	ldw	x,#0
2557  0608 89            	pushw	x
2558  0609 ae000c        	ldw	x,#L511
2559  060c cd0000        	call	_assert_failed
2561  060f 5b04          	addw	sp,#4
2562  0611               L242:
2563                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2565  0611 7b03          	ld	a,(OFST+1,sp)
2566  0613 97            	ld	xl,a
2567  0614 7b04          	ld	a,(OFST+2,sp)
2568  0616 a4ff          	and	a,#255
2569  0618 5f            	clrw	x
2570  0619 02            	rlwa	x,a
2571  061a 1f01          	ldw	(OFST-1,sp),x
2572  061c 01            	rrwa	x,a
2573                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2575  061d 7b02          	ld	a,(OFST+0,sp)
2576  061f 43            	cpl	a
2577  0620 c75218        	ld	21016,a
2578                     ; 770 }
2581  0623 5b04          	addw	sp,#4
2582  0625 81            	ret
2747                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2747                     ; 793 {
2748                     	switch	.text
2749  0626               _I2C_GetITStatus:
2751  0626 89            	pushw	x
2752  0627 5204          	subw	sp,#4
2753       00000004      OFST:	set	4
2756                     ; 794   ITStatus bitstatus = RESET;
2758                     ; 795   __IO uint8_t enablestatus = 0;
2760  0629 0f03          	clr	(OFST-1,sp)
2761                     ; 796   uint16_t tempregister = 0;
2763                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2765  062b a31680        	cpw	x,#5760
2766  062e 2737          	jreq	L052
2767  0630 a31640        	cpw	x,#5696
2768  0633 2732          	jreq	L052
2769  0635 a31210        	cpw	x,#4624
2770  0638 272d          	jreq	L052
2771  063a a31208        	cpw	x,#4616
2772  063d 2728          	jreq	L052
2773  063f a31204        	cpw	x,#4612
2774  0642 2723          	jreq	L052
2775  0644 a31202        	cpw	x,#4610
2776  0647 271e          	jreq	L052
2777  0649 a31201        	cpw	x,#4609
2778  064c 2719          	jreq	L052
2779  064e a32220        	cpw	x,#8736
2780  0651 2714          	jreq	L052
2781  0653 a32108        	cpw	x,#8456
2782  0656 270f          	jreq	L052
2783  0658 a32104        	cpw	x,#8452
2784  065b 270a          	jreq	L052
2785  065d a32102        	cpw	x,#8450
2786  0660 2705          	jreq	L052
2787  0662 a32101        	cpw	x,#8449
2788  0665 2603          	jrne	L642
2789  0667               L052:
2790  0667 4f            	clr	a
2791  0668 2010          	jra	L252
2792  066a               L642:
2793  066a ae031f        	ldw	x,#799
2794  066d 89            	pushw	x
2795  066e ae0000        	ldw	x,#0
2796  0671 89            	pushw	x
2797  0672 ae000c        	ldw	x,#L511
2798  0675 cd0000        	call	_assert_failed
2800  0678 5b04          	addw	sp,#4
2801  067a               L252:
2802                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2804  067a 7b05          	ld	a,(OFST+1,sp)
2805  067c 97            	ld	xl,a
2806  067d 7b06          	ld	a,(OFST+2,sp)
2807  067f 9f            	ld	a,xl
2808  0680 a407          	and	a,#7
2809  0682 97            	ld	xl,a
2810  0683 4f            	clr	a
2811  0684 02            	rlwa	x,a
2812  0685 4f            	clr	a
2813  0686 01            	rrwa	x,a
2814  0687 9f            	ld	a,xl
2815  0688 5f            	clrw	x
2816  0689 97            	ld	xl,a
2817  068a 1f01          	ldw	(OFST-3,sp),x
2818                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2820  068c c6521a        	ld	a,21018
2821  068f 1402          	and	a,(OFST-2,sp)
2822  0691 6b03          	ld	(OFST-1,sp),a
2823                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2825  0693 7b05          	ld	a,(OFST+1,sp)
2826  0695 97            	ld	xl,a
2827  0696 7b06          	ld	a,(OFST+2,sp)
2828  0698 9f            	ld	a,xl
2829  0699 a430          	and	a,#48
2830  069b 97            	ld	xl,a
2831  069c 4f            	clr	a
2832  069d 02            	rlwa	x,a
2833  069e a30100        	cpw	x,#256
2834  06a1 2615          	jrne	L3701
2835                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2837  06a3 c65217        	ld	a,21015
2838  06a6 1506          	bcp	a,(OFST+2,sp)
2839  06a8 270a          	jreq	L5701
2841  06aa 0d03          	tnz	(OFST-1,sp)
2842  06ac 2706          	jreq	L5701
2843                     ; 812       bitstatus = SET;
2845  06ae a601          	ld	a,#1
2846  06b0 6b04          	ld	(OFST+0,sp),a
2848  06b2 2017          	jra	L1011
2849  06b4               L5701:
2850                     ; 817       bitstatus = RESET;
2852  06b4 0f04          	clr	(OFST+0,sp)
2853  06b6 2013          	jra	L1011
2854  06b8               L3701:
2855                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2857  06b8 c65218        	ld	a,21016
2858  06bb 1506          	bcp	a,(OFST+2,sp)
2859  06bd 270a          	jreq	L3011
2861  06bf 0d03          	tnz	(OFST-1,sp)
2862  06c1 2706          	jreq	L3011
2863                     ; 826       bitstatus = SET;
2865  06c3 a601          	ld	a,#1
2866  06c5 6b04          	ld	(OFST+0,sp),a
2868  06c7 2002          	jra	L1011
2869  06c9               L3011:
2870                     ; 831       bitstatus = RESET;
2872  06c9 0f04          	clr	(OFST+0,sp)
2873  06cb               L1011:
2874                     ; 835   return  bitstatus;
2876  06cb 7b04          	ld	a,(OFST+0,sp)
2879  06cd 5b06          	addw	sp,#6
2880  06cf 81            	ret
2924                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2924                     ; 874 {
2925                     	switch	.text
2926  06d0               _I2C_ClearITPendingBit:
2928  06d0 89            	pushw	x
2929  06d1 89            	pushw	x
2930       00000002      OFST:	set	2
2933                     ; 875   uint16_t flagpos = 0;
2935                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2937  06d2 a32220        	cpw	x,#8736
2938  06d5 2714          	jreq	L062
2939  06d7 a32108        	cpw	x,#8456
2940  06da 270f          	jreq	L062
2941  06dc a32104        	cpw	x,#8452
2942  06df 270a          	jreq	L062
2943  06e1 a32102        	cpw	x,#8450
2944  06e4 2705          	jreq	L062
2945  06e6 a32101        	cpw	x,#8449
2946  06e9 2603          	jrne	L652
2947  06eb               L062:
2948  06eb 4f            	clr	a
2949  06ec 2010          	jra	L262
2950  06ee               L652:
2951  06ee ae036e        	ldw	x,#878
2952  06f1 89            	pushw	x
2953  06f2 ae0000        	ldw	x,#0
2954  06f5 89            	pushw	x
2955  06f6 ae000c        	ldw	x,#L511
2956  06f9 cd0000        	call	_assert_failed
2958  06fc 5b04          	addw	sp,#4
2959  06fe               L262:
2960                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2962  06fe 7b03          	ld	a,(OFST+1,sp)
2963  0700 97            	ld	xl,a
2964  0701 7b04          	ld	a,(OFST+2,sp)
2965  0703 a4ff          	and	a,#255
2966  0705 5f            	clrw	x
2967  0706 02            	rlwa	x,a
2968  0707 1f01          	ldw	(OFST-1,sp),x
2969  0709 01            	rrwa	x,a
2970                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2972  070a 7b02          	ld	a,(OFST+0,sp)
2973  070c 43            	cpl	a
2974  070d c75218        	ld	21016,a
2975                     ; 885 }
2978  0710 5b04          	addw	sp,#4
2979  0712 81            	ret
2992                     	xdef	_I2C_ClearITPendingBit
2993                     	xdef	_I2C_GetITStatus
2994                     	xdef	_I2C_ClearFlag
2995                     	xdef	_I2C_GetFlagStatus
2996                     	xdef	_I2C_GetLastEvent
2997                     	xdef	_I2C_CheckEvent
2998                     	xdef	_I2C_SendData
2999                     	xdef	_I2C_Send7bitAddress
3000                     	xdef	_I2C_ReceiveData
3001                     	xdef	_I2C_ITConfig
3002                     	xdef	_I2C_FastModeDutyCycleConfig
3003                     	xdef	_I2C_AcknowledgeConfig
3004                     	xdef	_I2C_StretchClockCmd
3005                     	xdef	_I2C_SoftwareResetCmd
3006                     	xdef	_I2C_GenerateSTOP
3007                     	xdef	_I2C_GenerateSTART
3008                     	xdef	_I2C_GeneralCallCmd
3009                     	xdef	_I2C_Cmd
3010                     	xdef	_I2C_Init
3011                     	xdef	_I2C_DeInit
3012                     	xref	_assert_failed
3013                     	switch	.const
3014  000c               L511:
3015  000c 2e2e5c6c6962  	dc.b	"..\lib\src\stm8s_i"
3016  001e 32632e6300    	dc.b	"2c.c",0
3017                     	xref.b	c_lreg
3018                     	xref.b	c_x
3038                     	xref	c_sdivx
3039                     	xref	c_ludv
3040                     	xref	c_rtol
3041                     	xref	c_smul
3042                     	xref	c_lmul
3043                     	xref	c_lcmp
3044                     	xref	c_ltor
3045                     	xref	c_lzmp
3046                     	end

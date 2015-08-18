# ST Visual Debugger Generated MAKE File, based on 360.stp

ifeq ($(CFG), )
CFG=Debug
$(warning ***No configuration specified. Defaulting to $(CFG)***)
endif

ToolsetRoot=C:\COSMIC\CXSTM8_32K
ToolsetBin=C:\COSMIC\CXSTM8_32K
ToolsetInc=C:\COSMIC\CXSTM8_32K\Hstm8
ToolsetLib=C:\COSMIC\CXSTM8_32K\Lib
ToolsetIncOpts=-iC:\COSMIC\CXSTM8_32K\Hstm8 
ToolsetLibOpts=-lC:\COSMIC\CXSTM8_32K\Lib 
ObjectExt=o
OutputExt=elf
InputName=$(basename $(notdir $<))


# 
# Debug
# 
ifeq "$(CFG)" "Debug"


OutputPath=Debug
ProjectSFile=360
TargetSName=360
TargetFName=360.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  +mods0 +debug -pxp -no -pp -l -i..\app -i.. -i..\lib\inc $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  -xx -l $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) 360.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Debug\main.$(ObjectExt) : main.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\periph.h c:\cosmic\cxstm8_32k\hstm8\stdio.h ..\app\key.h ..\app\beep.h ..\app\comm.h ..\app\ir.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c c:\cosmic\cxstm8_32k\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_it.$(ObjectExt) : stm8s_it.c c:\cosmic\cxstm8_32k\hstm8\mods0.h stm8s_it.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\comm.h ..\app\key.h ..\app\periph.h ..\app\ir.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\beep.$(ObjectExt) : ..\app\beep.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\beep.h stm8s_conf.h ..\lib\inc\stm8s.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\utility.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\comm.$(ObjectExt) : ..\app\comm.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\comm.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\key.h ..\app\periph.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\ir.$(ObjectExt) : ..\app\ir.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\ir.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\periph.h ..\app\utility.h ..\app\comm.h ..\app\key.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\key.$(ObjectExt) : ..\app\key.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\key.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\periph.h ..\app\utility.h ..\app\comm.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\periph.$(ObjectExt) : ..\app\periph.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\periph.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\utility.$(ObjectExt) : ..\app\utility.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\utility.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_awu.$(ObjectExt) : ..\lib\src\stm8s_awu.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_beep.$(ObjectExt) : ..\lib\src\stm8s_beep.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_can.$(ObjectExt) : ..\lib\src\stm8s_can.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_clk.$(ObjectExt) : ..\lib\src\stm8s_clk.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_exti.$(ObjectExt) : ..\lib\src\stm8s_exti.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_flash.$(ObjectExt) : ..\lib\src\stm8s_flash.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_gpio.$(ObjectExt) : ..\lib\src\stm8s_gpio.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_i2c.$(ObjectExt) : ..\lib\src\stm8s_i2c.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_itc.$(ObjectExt) : ..\lib\src\stm8s_itc.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_iwdg.$(ObjectExt) : ..\lib\src\stm8s_iwdg.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_rst.$(ObjectExt) : ..\lib\src\stm8s_rst.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_spi.$(ObjectExt) : ..\lib\src\stm8s_spi.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim1.$(ObjectExt) : ..\lib\src\stm8s_tim1.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim2.$(ObjectExt) : ..\lib\src\stm8s_tim2.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim3.$(ObjectExt) : ..\lib\src\stm8s_tim3.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_tim4.$(ObjectExt) : ..\lib\src\stm8s_tim4.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart1.$(ObjectExt) : ..\lib\src\stm8s_uart1.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_uart3.$(ObjectExt) : ..\lib\src\stm8s_uart3.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Debug\stm8s_wwdg.$(ObjectExt) : ..\lib\src\stm8s_wwdg.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_wwdg.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

360.elf :  $(OutputPath)\main.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\beep.o $(OutputPath)\comm.o $(OutputPath)\ir.o $(OutputPath)\key.o $(OutputPath)\periph.o $(OutputPath)\utility.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_can.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim3.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_uart3.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\360.lkf
	$(ToolsetBin)\clnk  -m $(OutputPath)\$(TargetSName).map $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\beep.o
	-@erase $(OutputPath)\comm.o
	-@erase $(OutputPath)\ir.o
	-@erase $(OutputPath)\key.o
	-@erase $(OutputPath)\periph.o
	-@erase $(OutputPath)\utility.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_can.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim3.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_uart3.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\360.elf
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\beep.ls
	-@erase $(OutputPath)\comm.ls
	-@erase $(OutputPath)\ir.ls
	-@erase $(OutputPath)\key.ls
	-@erase $(OutputPath)\periph.ls
	-@erase $(OutputPath)\utility.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_can.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim3.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_uart3.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
endif

# 
# Release
# 
ifeq "$(CFG)" "Release"


OutputPath=Release
ProjectSFile=360
TargetSName=360
TargetFName=360.elf
IntermPath=$(dir $@)
CFLAGS_PRJ=$(ToolsetBin)\cxstm8  -i..\app -i.. -i..\lib\inc +mods0 -pp $(ToolsetIncOpts) -cl$(IntermPath:%\=%) -co$(IntermPath:%\=%) $<
ASMFLAGS_PRJ=$(ToolsetBin)\castm8  $(ToolsetIncOpts) -o$(IntermPath)$(InputName).$(ObjectExt) $<

all : $(OutputPath) 360.elf

$(OutputPath) : 
	if not exist $(OutputPath)/ mkdir $(OutputPath)

Release\main.$(ObjectExt) : main.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\periph.h c:\cosmic\cxstm8_32k\hstm8\stdio.h ..\app\key.h ..\app\beep.h ..\app\comm.h ..\app\ir.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8_interrupt_vector.$(ObjectExt) : stm8_interrupt_vector.c c:\cosmic\cxstm8_32k\hstm8\mods0.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_it.$(ObjectExt) : stm8s_it.c c:\cosmic\cxstm8_32k\hstm8\mods0.h stm8s_it.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\comm.h ..\app\key.h ..\app\periph.h ..\app\ir.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\beep.$(ObjectExt) : ..\app\beep.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\beep.h stm8s_conf.h ..\lib\inc\stm8s.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\utility.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\comm.$(ObjectExt) : ..\app\comm.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\comm.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\key.h ..\app\periph.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\ir.$(ObjectExt) : ..\app\ir.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\ir.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\periph.h ..\app\utility.h ..\app\comm.h ..\app\key.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\key.$(ObjectExt) : ..\app\key.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\key.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h ..\app\periph.h ..\app\utility.h ..\app\comm.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\periph.$(ObjectExt) : ..\app\periph.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\periph.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\utility.$(ObjectExt) : ..\app\utility.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\app\utility.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_awu.$(ObjectExt) : ..\lib\src\stm8s_awu.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_beep.$(ObjectExt) : ..\lib\src\stm8s_beep.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_can.$(ObjectExt) : ..\lib\src\stm8s_can.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_clk.$(ObjectExt) : ..\lib\src\stm8s_clk.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_exti.$(ObjectExt) : ..\lib\src\stm8s_exti.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_flash.$(ObjectExt) : ..\lib\src\stm8s_flash.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_gpio.$(ObjectExt) : ..\lib\src\stm8s_gpio.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_i2c.$(ObjectExt) : ..\lib\src\stm8s_i2c.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_itc.$(ObjectExt) : ..\lib\src\stm8s_itc.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_iwdg.$(ObjectExt) : ..\lib\src\stm8s_iwdg.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_rst.$(ObjectExt) : ..\lib\src\stm8s_rst.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_spi.$(ObjectExt) : ..\lib\src\stm8s_spi.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim1.$(ObjectExt) : ..\lib\src\stm8s_tim1.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim2.$(ObjectExt) : ..\lib\src\stm8s_tim2.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim3.$(ObjectExt) : ..\lib\src\stm8s_tim3.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_tim4.$(ObjectExt) : ..\lib\src\stm8s_tim4.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart1.$(ObjectExt) : ..\lib\src\stm8s_uart1.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_uart3.$(ObjectExt) : ..\lib\src\stm8s_uart3.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_uart3.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_wwdg.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

Release\stm8s_wwdg.$(ObjectExt) : ..\lib\src\stm8s_wwdg.c c:\cosmic\cxstm8_32k\hstm8\mods0.h ..\lib\inc\stm8s_wwdg.h ..\lib\inc\stm8s.h stm8s_conf.h ..\lib\inc\stm8s_awu.h ..\lib\inc\stm8s_beep.h ..\lib\inc\stm8s_can.h ..\lib\inc\stm8s_clk.h ..\lib\inc\stm8s_exti.h ..\lib\inc\stm8s_flash.h ..\lib\inc\stm8s_gpio.h ..\lib\inc\stm8s_i2c.h ..\lib\inc\stm8s_itc.h ..\lib\inc\stm8s_iwdg.h ..\lib\inc\stm8s_rst.h ..\lib\inc\stm8s_spi.h ..\lib\inc\stm8s_tim1.h ..\lib\inc\stm8s_tim2.h ..\lib\inc\stm8s_tim3.h ..\lib\inc\stm8s_tim4.h ..\lib\inc\stm8s_uart1.h ..\lib\inc\stm8s_uart3.h 
	@if not exist $(dir $@)  mkdir $(dir $@)
	$(CFLAGS_PRJ)

360.elf :  $(OutputPath)\main.o $(OutputPath)\stm8_interrupt_vector.o $(OutputPath)\stm8s_it.o $(OutputPath)\beep.o $(OutputPath)\comm.o $(OutputPath)\ir.o $(OutputPath)\key.o $(OutputPath)\periph.o $(OutputPath)\utility.o $(OutputPath)\stm8s_awu.o $(OutputPath)\stm8s_beep.o $(OutputPath)\stm8s_can.o $(OutputPath)\stm8s_clk.o $(OutputPath)\stm8s_exti.o $(OutputPath)\stm8s_flash.o $(OutputPath)\stm8s_gpio.o $(OutputPath)\stm8s_i2c.o $(OutputPath)\stm8s_itc.o $(OutputPath)\stm8s_iwdg.o $(OutputPath)\stm8s_rst.o $(OutputPath)\stm8s_spi.o $(OutputPath)\stm8s_tim1.o $(OutputPath)\stm8s_tim2.o $(OutputPath)\stm8s_tim3.o $(OutputPath)\stm8s_tim4.o $(OutputPath)\stm8s_uart1.o $(OutputPath)\stm8s_uart3.o $(OutputPath)\stm8s_wwdg.o $(OutputPath)\360.lkf
	$(ToolsetBin)\clnk  $(ToolsetLibOpts) -o $(OutputPath)\$(TargetSName).sm8 $(OutputPath)\$(TargetSName).lkf 
	$(ToolsetBin)\cvdwarf  $(OutputPath)\$(TargetSName).sm8 

	$(ToolsetBin)\chex  -o $(OutputPath)\$(TargetSName).s19 $(OutputPath)\$(TargetSName).sm8
clean : 
	-@erase $(OutputPath)\main.o
	-@erase $(OutputPath)\stm8_interrupt_vector.o
	-@erase $(OutputPath)\stm8s_it.o
	-@erase $(OutputPath)\beep.o
	-@erase $(OutputPath)\comm.o
	-@erase $(OutputPath)\ir.o
	-@erase $(OutputPath)\key.o
	-@erase $(OutputPath)\periph.o
	-@erase $(OutputPath)\utility.o
	-@erase $(OutputPath)\stm8s_awu.o
	-@erase $(OutputPath)\stm8s_beep.o
	-@erase $(OutputPath)\stm8s_can.o
	-@erase $(OutputPath)\stm8s_clk.o
	-@erase $(OutputPath)\stm8s_exti.o
	-@erase $(OutputPath)\stm8s_flash.o
	-@erase $(OutputPath)\stm8s_gpio.o
	-@erase $(OutputPath)\stm8s_i2c.o
	-@erase $(OutputPath)\stm8s_itc.o
	-@erase $(OutputPath)\stm8s_iwdg.o
	-@erase $(OutputPath)\stm8s_rst.o
	-@erase $(OutputPath)\stm8s_spi.o
	-@erase $(OutputPath)\stm8s_tim1.o
	-@erase $(OutputPath)\stm8s_tim2.o
	-@erase $(OutputPath)\stm8s_tim3.o
	-@erase $(OutputPath)\stm8s_tim4.o
	-@erase $(OutputPath)\stm8s_uart1.o
	-@erase $(OutputPath)\stm8s_uart3.o
	-@erase $(OutputPath)\stm8s_wwdg.o
	-@erase $(OutputPath)\360.elf
	-@erase $(OutputPath)\360.map
	-@erase $(OutputPath)\360.st7
	-@erase $(OutputPath)\360.s19
	-@erase $(OutputPath)\main.ls
	-@erase $(OutputPath)\stm8_interrupt_vector.ls
	-@erase $(OutputPath)\stm8s_it.ls
	-@erase $(OutputPath)\beep.ls
	-@erase $(OutputPath)\comm.ls
	-@erase $(OutputPath)\ir.ls
	-@erase $(OutputPath)\key.ls
	-@erase $(OutputPath)\periph.ls
	-@erase $(OutputPath)\utility.ls
	-@erase $(OutputPath)\stm8s_awu.ls
	-@erase $(OutputPath)\stm8s_beep.ls
	-@erase $(OutputPath)\stm8s_can.ls
	-@erase $(OutputPath)\stm8s_clk.ls
	-@erase $(OutputPath)\stm8s_exti.ls
	-@erase $(OutputPath)\stm8s_flash.ls
	-@erase $(OutputPath)\stm8s_gpio.ls
	-@erase $(OutputPath)\stm8s_i2c.ls
	-@erase $(OutputPath)\stm8s_itc.ls
	-@erase $(OutputPath)\stm8s_iwdg.ls
	-@erase $(OutputPath)\stm8s_rst.ls
	-@erase $(OutputPath)\stm8s_spi.ls
	-@erase $(OutputPath)\stm8s_tim1.ls
	-@erase $(OutputPath)\stm8s_tim2.ls
	-@erase $(OutputPath)\stm8s_tim3.ls
	-@erase $(OutputPath)\stm8s_tim4.ls
	-@erase $(OutputPath)\stm8s_uart1.ls
	-@erase $(OutputPath)\stm8s_uart3.ls
	-@erase $(OutputPath)\stm8s_wwdg.ls
endif

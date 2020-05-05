transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control/Sdram_WR_FIFO.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control/Sdram_RD_FIFO.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/VGA_Controller.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/SEG7_LUT_8.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/SEG7_LUT.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/sdram_pll.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/Reset_Delay.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/RAW2RGB.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/Line_Buffer.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/I2C_Controller.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/I2C_CCD_Config.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/CCD_Capture.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/IP {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/IP/SDRAM_FIFO_WR.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control/Sdram_Control.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control/sdr_data_path.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control/control_interface.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Sdram_Control/command.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/DE2_115_CAMERA.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/IP {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/IP/SDRAM_FIFO_RD.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/font_rom.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/OCMbuffer.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/AvgResizer.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/RGB2Grey.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/Snipper.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/Font_display.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Font_resizer.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/ResizerFile.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/Final_toplevel.sv}
vlib final_soc
vmap final_soc final_soc

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/src/disp_testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L final_soc -voptargs="+acc"  disp_testbench

add wave *
view structure
view signals
run 5000 ns

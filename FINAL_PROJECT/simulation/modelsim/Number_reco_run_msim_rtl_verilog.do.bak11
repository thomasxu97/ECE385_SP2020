transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/nn {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/nn/multiplier.sv}

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/testbench {C:/intelFPGA_lite/18.1/ECE385/FINAL_PROJECT/testbench/nntestbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  nntestbench

add wave *
view structure
view signals
run 1000 ns

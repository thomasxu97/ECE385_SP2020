transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib lab9_soc
vmap lab9_soc lab9_soc
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/lab9_soc.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_sysid_qsys_0.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_sdram_pll.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_sdram.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_onchip_memory2_0.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_nios2_gen2_0.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_nios2_gen2_0_cpu.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_nios2_gen2_0_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_nios2_gen2_0_cpu_debug_slave_tck.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_nios2_gen2_0_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_nios2_gen2_0_cpu_test_bench.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_jtag_uart_0.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_button.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_TIMER.v}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/AES.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/SubBytes.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/lab9_top.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/InvShiftRows.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/InvMixColumns.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/hexdriver.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/AddRoundKey.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/KeyExpansion.sv}
vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/InvSubByteMatrix.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_irq_mapper.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -vlog01compat -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_std_synchronizer_nocut.v}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_rsp_mux_001.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_rsp_demux_002.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_cmd_mux_002.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_cmd_demux_001.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_router_004.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_router_002.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_router_001.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/lab9_soc_mm_interconnect_0_router.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work lab9_soc +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules {C:/intelFPGA_lite/18.1/ECE385/lab9/lab9_soc/synthesis/submodules/avalon_aes_interface.sv}

vlog -sv -work work +incdir+C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog {C:/intelFPGA_lite/18.1/ECE385/lab9/SysVerilog/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -L lab9_soc -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 5000 ns

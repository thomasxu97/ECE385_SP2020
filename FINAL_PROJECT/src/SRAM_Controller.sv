module SRAM_Controller(
    input logic                     Clk, Reset,
    input logic     [9:0]           datain,
    input logic     [12:0]          X_coord,
    input logic     [12:0]          Y_coord,
    input logic                     isstore,
    output	logic	[19:0]		    SRAM_ADDR,
    output	logic	          		SRAM_CE_N,
    output  logic   [15:0]          Data_from_sys,
    output	logic	          		SRAM_LB_N,
    output	logic	          		SRAM_OE_N,
    output	logic	          		SRAM_UB_N,
    output	logic	          		SRAM_WE_N
);
// always be active
assign SRAM_CE_N = 1'b0;
assign SRAM_UB_N = 1'b0;
assign SRAM_LB_N = 1'b0;

endmodule

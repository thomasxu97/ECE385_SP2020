//------------------------------------------------------------------------------
// Company:        UIUC ECE Dept.
// Engineer:       Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Lab 6 Given Code - SLC-3 
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 10-19-2017 
//    spring 2018 Distribution
//
//------------------------------------------------------------------------------
module slc3(
    input logic [15:0] S,
    input logic Clk, Reset, Run, Continue,
    output logic [11:0] LED,
    output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
    output logic CE, UB, LB, OE_sh, WE_sh,
    output logic [19:0] ADDR,
    inout wire [15:0] Data //tristate buffers need to be of type wire
);

// Declaration of push button active high signals
logic Reset_sh, Continue_sh, Run_sh;
logic Reset_ah, Continue_ah, Run_ah;
logic OE, WE;

assign Reset_ah = ~Reset_sh;
assign Continue_ah = ~Continue_sh;
assign Run_ah = ~Run_sh;

// Internal connections
logic BEN;
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic GatePC, GateMDR, GateALU, GateMARMUX;
logic [1:0] PCMUX, DRMUX;
logic [2:0] ADDR2MUX;
logic ADDR1MUX, MARMUX, MDRMUX, SRMUX;
logic MIO_EN;

logic [15:0] MDR_in;
logic [15:0] MAR, MDR, IR, PC;
logic [15:0] Data_from_SRAM, Data_to_SRAM;

// Signals being displayed on hex display
logic [3:0][3:0] hex_4;

// For week 1, hexdrivers will display IR. Comment out these in week 2.
// HexDriver hex_driver3 (IR[15:12], HEX3);
// HexDriver hex_driver2 (IR[11:8], HEX2);
// HexDriver hex_driver1 (IR[7:4], HEX1);
// HexDriver hex_driver0 (IR[3:0], HEX0);

// For week 2, hexdrivers will be mounted to Mem2IO
HexDriver hex_driver3 (hex_4[3][3:0], HEX3);
HexDriver hex_driver2 (hex_4[2][3:0], HEX2);
HexDriver hex_driver1 (hex_4[1][3:0], HEX1);
HexDriver hex_driver0 (hex_4[0][3:0], HEX0);

// The other hex display will show PC for both weeks.
HexDriver hex_driver7 (PC[15:12], HEX7);
HexDriver hex_driver6 (PC[11:8], HEX6);
HexDriver hex_driver5 (PC[7:4], HEX5);
HexDriver hex_driver4 (PC[3:0], HEX4);

// Connect MAR to ADDR, which is also connected as an input into MEM2IO.
// MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
// input into MDR)
assign ADDR = { 4'b00, MAR }; //Note, our external SRAM chip is 1Mx16, but address space is only 64Kx16
assign MIO_EN = ~OE;

assign LED = LD_LED ? IR[11:0] : 12'b0;

// synchronizers
sync button_sync[2:0] (Clk, {Reset, Continue, Run}, {Reset_sh, Continue_sh, Run_sh});
sync_r1 output_sync[1:0] (Clk, Reset_ah, {OE, WE}, {OE_sh, WE_sh});

// You need to make your own datapath module and connect everything to the datapath
// Be careful about whether Reset is active high or low
datapath Datapath(
    .Clk (Clk),
    .Reset (Reset_ah),
    .LD_PC (LD_PC),
    .LD_IR (LD_IR),
    .LD_REGF (LD_REG),
    .LD_MDR (LD_MDR),
    .LD_MAR (LD_MAR),
    .LD_BEN (LD_BEN),
    .MDR_in (MDR_in),
    .pcmux_sel (PCMUX),
    .regfilemux_sel (DRMUX),
	 .srmux_sel (SRMUX),
    .marmux_sel (MARMUX),
    .mdrmux_sel (MDRMUX),
    .alumux1_sel (ADDR1MUX),
    .alumux2_sel (ADDR2MUX),
    .PC_out (PC),
    .MDR_out (MDR),
    .MAR_out (MAR),
    .IR_out (IR),
    .BEN (BEN)
);

// Our SRAM and I/O controller
Mem2IO memory_subsystem(
    .*, .Reset(Reset_ah), .ADDR(ADDR), .Switches(S),
	 .OE(OE_sh), .WE(WE_sh),
    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]),
    .Data_from_CPU(MDR), .Data_to_CPU(MDR_in),
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);

// The tri-state buffer serves as the interface between Mem2IO and SRAM
tristate #(.N(16)) tr0(
    .Clk(Clk), .tristate_output_enable(~WE), .Data_write(Data_to_SRAM), .Data_read(Data_from_SRAM), .Data(Data)
);

// State machine and control signals
ISDU state_controller(
    .*, .Reset(Reset_ah), .Run(Run_ah), .Continue(Continue_ah),
    .Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]),
    .Mem_CE(CE), .Mem_UB(UB), .Mem_LB(LB), .Mem_OE(OE), .Mem_WE(WE)
);

endmodule

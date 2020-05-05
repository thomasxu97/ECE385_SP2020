module SDRAM_FIFO_RD(
		CLK,
		//	FIFO Read Side 1
    RD1_DATA,
		//	FIFO Read Side 2
    RD2_DATA,
		// helper ports
		RD,
		RD_LOAD,	
		RD_CLK,
		mDATAOUT,
		OUT_VALID,
		RD_MASK,
		read_side_fifo_wusedw1,
		read_side_fifo_wusedw2
);
//=======================================================
//  PARAMETER declarations
//=======================================================
`include  "Sdram_Params.h"
localparam 				RD1_ADDR = 23'h000000;
localparam				RD2_ADDR = 23'h100000;
localparam				RD1_MAX_ADDR = 800*600/2;
localparam				RD2_MAX_ADDR = 23'h100000+800*600/2;
localparam				RD_LENGTH = 8'h80;
//=======================================================
//  PORT declarations
//=======================================================
//	HOST Side
input 							            CLK;
//	FIFO Read Side 1
output [`DIOSIZE-1:0]           RD1_DATA;               //Data Output
//	FIFO Read Side 2
output [`DIOSIZE-1:0]           RD2_DATA;               //Data Output	
//helper ports
input							              RD;					          //Read Request
input						              	RD_LOAD;				        //Read FIFO Clear
input											RD_CLK;				        //Read FIFO Clock
input 	[`DSIZE-1:0]				mDATAOUT;
input										OUT_VALID;
input 	[1:0]							RD_MASK;
output 	[7:0]							read_side_fifo_wusedw1;
output 	[7:0]							read_side_fifo_wusedw2;				
Sdram_RD_FIFO  u_read1_fifo (
				.data(mDATAOUT),
				.wrreq(OUT_VALID&&RD_MASK[0]),
				.wrclk(CLK),
				.aclr(RD_LOAD),
				.rdreq(RD),
				.rdclk(RD_CLK),
				.q(RD1_DATA),
				.wrusedw(read_side_fifo_wusedw1) );
				
Sdram_RD_FIFO  u_read2_fifo (
				.data(mDATAOUT),
				.wrreq(OUT_VALID&&RD_MASK[1]),
				.wrclk(CLK),
				.aclr(RD_LOAD),
				.rdreq(RD),
				.rdclk(RD_CLK),
				.q(RD2_DATA),
				.wrusedw(read_side_fifo_wusedw2) );	
endmodule

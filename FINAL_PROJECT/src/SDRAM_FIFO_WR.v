module SDRAM_FIFO_WR(
		CLK,
		//	FIFO Write Side 1
		WR1_DATA,
		//	FIFO Write Side 2
		WR2_DATA,
		// helper ports
		WR,
		WR_LOAD,
		WR_CLK,
		IN_REQ,
		WR_MASK,
		mDATAIN,
		write_side_fifo_rusedw1,
		write_side_fifo_rusedw2
);

//=======================================================
//  PARAMETER declarations
//=======================================================
`include  "Sdram_Params.h"
localparam 			WR1_ADDR = 23'h000000;
localparam 			WR2_ADDR = 23'h100000;
localparam 			WR1_MAX_ADDR = 800*600/2;
localparam 			WR2_MAX_ADDR = 23'h100000+800*600/2;
localparam			WR_LENGTH = 8'h80;
//=======================================================
//  PORT declarations
//=======================================================
//	HOST Side
input 							            CLK;
//	FIFO Write Side 1
input  [`DIOSIZE-1:0]           WR1_DATA;               //Data Input
//	FIFO Write Side 2
input  [`DIOSIZE-1:0]           WR2_DATA;               //Data Input
input							         WR;					          //Write Request
input							         WR_LOAD;			         	//Write FIFO Clear
input							         WR_CLK;				        //Write FIFO Clock
input										IN_REQ;
input		[1:0]							WR_MASK;
output 	[`DSIZE-1:0]				mDATAIN;
output 	[7:0]							write_side_fifo_rusedw1;
output 	[7:0]							write_side_fifo_rusedw2;

wire 	[`DSIZE-1:0]				mDATAIN1;
wire 	[`DSIZE-1:0]				mDATAIN2;
assign mDATAIN = (WR_MASK[0])	?	mDATAIN1 : mDATAIN2;
//=======================================================
//  Sub-module
//=======================================================
Sdram_WR_FIFO  u_write1_fifo (
				.data(WR1_DATA),
				.wrreq(WR),
				.wrclk(WR_CLK),
				.aclr(WR_LOAD),
				.rdreq(IN_REQ&&WR_MASK[0]),
				.rdclk(CLK),
				.q(mDATAIN1),
				.rdusedw(write_side_fifo_rusedw1) );

Sdram_WR_FIFO  u_write2_fifo (
				.data(WR2_DATA),
				.wrreq(WR),
				.wrclk(WR_CLK),
				.aclr(WR_LOAD),
				.rdreq(IN_REQ&&WR_MASK[1]),
				.rdclk(CLK),
				.q(mDATAIN2),
				.rdusedw(write_side_fifo_rusedw2)	);			              
endmodule


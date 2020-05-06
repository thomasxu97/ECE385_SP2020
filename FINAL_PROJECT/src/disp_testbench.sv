module disp_testbench();
timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;
logic clk, rst;
logic Read;
logic [9:0] oVGA_R,oVGA_G,oVGA_B;
logic VGA_HS, VGA_VS, VGA_SYNC_N, VGA_BLANK_N;
logic [12:0] x_coord, y_coord;
logic isdisplay;
// Toggle the clock
always begin : CLOCK_GENERATION
#1 clk = ~clk;
end
VGA_Controller		u1	(	//	Host Side
							.oRequest(Read),
							.iRed(10'd128),
							.iGreen(10'd128),
							.iBlue(10'd128),
							//	VGA Side
							.oVGA_R(oVGA_R),
							.oVGA_G(oVGA_G),
							.oVGA_B(oVGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							.oVGA_SYNC(VGA_SYNC_N),
							.oVGA_BLANK(VGA_BLANK_N),
							//	Control Signal
							.iCLK(clk),
							.iRST_N(rst),
							.iZOOM_MODE_SW(1'd0),
                     .x_pos(x_coord),
                     .y_pos(y_coord),
                     .isdisplay(isdisplay)
						);

initial begin
	clk = 1'd0;
	rst = 1'd0;
	
#4	rst = 1'd0;
#4	rst = 1'd1;
end
endmodule 
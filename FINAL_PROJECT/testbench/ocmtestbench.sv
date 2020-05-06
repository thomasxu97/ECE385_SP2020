module ocmtestbench();
timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;
logic clk, rst;
logic [12:0] x_pos,y_pos;
logic [7:0] pxl;
logic outpxl;
logic [7:0] oxpos,oypos;
logic store, wr_en;
// Toggle the clock
always begin : CLOCK_GENERATION
#1 clk = ~clk;
end
endmodule 
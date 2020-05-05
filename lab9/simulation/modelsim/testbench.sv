module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

logic clk;
logic [127:0] Cipherkey;
logic [1407:0] KeySchedule;

initial begin
	clk = 1'd0;
	Cipherkey = 128'h000102030405060708090a0b0c0d0e0f;
end

always begin : CLOCK_GENERATION
#1 clk = ~clk;
end

KeyExpansion keyExp(.*);

endmodule 
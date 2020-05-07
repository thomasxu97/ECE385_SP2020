module nntestbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;
logic [31:0] a [9:0];
logic [4:0] f;
argmax argmax (
	.in (a),
	.number (f)
	);

initial begin
#1 a[0] = 32'h00000000;
#1 a[1] = 32'h00000000;
#1 a[2] = 32'h00000000;
#1 a[3] = 32'h00000000;
#1 a[4] = 32'h00000000;
#1 a[5] = 32'h00000000;
#1 a[6] = 32'h00000000;
#1 a[7] = 32'h00000000;
#1 a[8] = 32'h00000000;
#1 a[9] = 32'h4841B347;
end

endmodule 
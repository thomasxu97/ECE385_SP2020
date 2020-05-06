module nntestbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;
logic [31:0] a, b, f;
multiplier u_mult(.a(a), .b(b), .f(f));

initial begin
#1 a = 32'hC23D70A3;
#1 b = 32'h00000000;
end

endmodule 
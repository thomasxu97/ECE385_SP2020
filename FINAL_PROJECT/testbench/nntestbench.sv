module nntestbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;
logic [31:0] a, b, f, r;
multiplier mult(.a(a), .b(b), .f(f));


initial begin
#1 a = 32'h4148A3D7;
#1 b = 32'h42B2428F;
#1 r = 32'h448BB616;
end

endmodule 

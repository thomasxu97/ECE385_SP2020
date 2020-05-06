// ieee 754 adder

module relu (
	input [31:0] a, 
	output [31:0] f
);

assign f = a[31] ? '0 : a;

endmodule
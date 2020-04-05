module AddRoundKey(
	input logic [127:0] state,
	input logic [127:0] key,
	output logic [127:0] ans
);
	
	assign ans = state ^ key;
	
endmodule 
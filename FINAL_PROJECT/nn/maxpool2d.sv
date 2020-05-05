// max pool 2d 2*2
// return the maximum value of abs(data)

module maxpool2d (
	input logic [31:0] in [3:0], 
	output logic [31:0] out
);

function logic [31:0] max (logic [31:0] a, logic [31:0] b);
	logic [7:0] exp_a, exp_b;
	logic [22:0] data_a, data_b;

	assign exp_a = {1'b0, a[30:23]};
	assign exp_b = {1'b0, b[30:23]};
	assign data_a = {24'b0, 1'b1, a[22:0]};
	assign data_b = {24'b0, 1'b1, b[22:0]};

	return ((exp_a == exp_b) ? ((data_a > data_b) ? a : b) : 
		((exp_a > exp_b) ? a : b))
endfunction


assign f = max(max(in[3], in[2]), max(in[1], in[0]));

endmodule
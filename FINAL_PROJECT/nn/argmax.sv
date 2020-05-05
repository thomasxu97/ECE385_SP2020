module argmax (
	input logic [31:0] in [9:0],
	outut logic [4:0] number
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

logic [31:0] max_score;
assign max_score = max(max(max(max(in[0], in[1]), max(in[2], in[3])), max(max(in[4], in[5]), max(in[6], in[7]))), max(in[8], in[9]));

assign number = (in[0] == max_score) ? 0 : 
	((in[1] == max_score) ? 1 : 
	((in[2] == max_score) ? 2 : 
	((in[3] == max_score) ? 3 : 
	((in[4] == max_score) ? 4 : 
	((in[5] == max_score) ? 5 : 
	((in[6] == max_score) ? 6 : 
	((in[7] == max_score) ? 7 : 
	((in[8] == max_score) ? 8 : 9))))))));

endmodule

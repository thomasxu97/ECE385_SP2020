module argmax (
	input logic [31:0] in [9:0],
	output logic [4:0] number
);

function logic [31:0] max (logic [31:0] a, logic [31:0] b);
	logic [8:0] exp_a, exp_b;
	logic [23:0] data_a, data_b;

	exp_a = {1'b0, a[30:23]};
	exp_b = {1'b0, b[30:23]};
	data_a = {1'b1, a[22:0]};
	data_b = {1'b1, b[22:0]};

	return ((exp_a == exp_b) ? ((data_a > data_b) ? a : b) : 
		((exp_a > exp_b) ? a : b));
endfunction

logic [31:0] max_score;
assign max_score = max(max(max(max(in[0], in[1]), max(in[2], in[3])), max(max(in[4], in[5]), max(in[6], in[7]))), max(in[8], in[9]));

assign number = (in[0] == max_score) ? 4'd0 : 
	((in[1] == max_score) ? 4'd1 : 
	((in[2] == max_score) ? 4'd2 : 
	((in[3] == max_score) ? 4'd3 : 
	((in[4] == max_score) ? 4'd4 : 
	((in[5] == max_score) ? 4'd5 : 
	((in[6] == max_score) ? 4'd6 : 
	((in[7] == max_score) ? 4'd7 : 
	((in[8] == max_score) ? 4'd8 : 4'd9))))))));

endmodule

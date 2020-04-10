module InvMixColumnsMatrix(
	input logic [127:0] in,
	output logic [127:0] out
)

	logic [31:0] word_1;
	logic [31:0] word_2;
	logic [31:0] word_3;
	logic [31:0] word_4;
	
	InvMixColumns IMColumns_1(.in(in[127:96], .out(word_1));
	InvMixColumns IMColumns_1(.in(in[95:64], .out(word_1));
	InvMixColumns IMColumns_1(.in(in[63:32], .out(word_1));
	InvMixColumns IMColumns_1(.in(in[31:0], .out(word_1));
	
	assign out = {word_1, word_2, word_3, word_4};
	
endmodule 
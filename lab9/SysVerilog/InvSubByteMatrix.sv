module InvSubBytesMatrix(
	input clk,
	input logic [127:0] in,
	output logic [127:0] out
);
	logic [31:0] word_1;
	logic [31:0] word_2;
	logic [31:0] word_3;
	logic [31:0] word_4;

	InvSubWord ISWord_1(.*, .in(in[127:96]), .out(word_1));
	InvSubWord ISWord_2(.*, .in(in[95 :64]), .out(word_2));
	InvSubWord ISWord_3(.*, .in(in[63 :32]), .out(word_3));
	InvSubWord ISWord_4(.*, .in(in[31 :0]), .out(word_4));

	assign out = {word_1, word_2, word_3, word_4};
endmodule 

module InvSubWord(
	input clk,
	input logic [31:0] in,
	output logic [31:0] out
);

	logic [7:0] byte_1;
	logic [7:0] byte_2;
	logic [7:0] byte_3;
	logic [7:0] byte_4;
	
	InvSubBytes ISBytes_1(.*, .in(in[31: 24]), .out(byte_1));
	InvSubBytes ISBytes_2(.*, .in(in[23: 16]), .out(byte_2));
	InvSubBytes ISBytes_3(.*, .in(in[15:  8]), .out(byte_3));
	InvSubBytes ISBytes_4(.*, .in(in[7:   0]), .out(byte_4));
	
	assign out = {byte_1, byte_2, byte_3, byte_4};
endmodule 
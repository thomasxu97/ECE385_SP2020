module Adder9bit
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
	 input 	logic				mode,
    output  logic[7:0]     Sum,
    output  logic          CO
);
	logic[1:0]	P;
	logic[1:0]	G;
	logic[1:0]	C;
	logic[7:0]  TcB;
	always_comb
	begin
		if (mode == 1'b0) begin		//subtract
			TcB = ~B + 1'b1;
		end
		else
			TcB = B;
	end
	
	
	assign C[0] = 1'b0;
	assign C[1] = (C[0] & P[0]) | G[0];

	carry_lookahead_adder_four_bit CLA0 (.A(A[3:0]), .B(TcB[3:0]), .Cin(C[0]), .Sum(Sum[3:0]), .P(P[0]), .G(G[0]));
	carry_lookahead_adder_four_bit CLA1 (.A(A[7:4]), .B(TcB[7:4]), .Cin(C[1]), .Sum(Sum[7:4]), .P(P[1]), .G(G[1]));
	
	assign CO = ((C[1] & P[1]) | G[1]) ^ ~mode;
	

endmodule

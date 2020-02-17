module Adder9bit
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
    output  logic[7:0]     Sum,
    output  logic          CO
);
	logic[3:0]	P;
	logic[3:0]	G;
	logic[3:0]	C;

	assign C[0] = 1'b0;
	assign C[1] = (C[0] & P[0]) | G[0];
	assign C[2] = (C[1] & P[1]) | G[1];
	assign C[3] = (C[2] & P[2]) | G[2];
	assign CO = (C[3] & P[3]) | G[3];

	carry_lookahead_adder_four_bit CLA0 (.A(A[3:0]), .B(B[3:0]), .Cin(C[0]), .Sum(Sum[3:0]), .P(P[0]), .G(G[0]));
	carry_lookahead_adder_four_bit CLA1 (.A(A[7:4]), .B(B[7:4]), .Cin(C[1]), .Sum(Sum[7:4]), .P(P[1]), .G(G[1]));

endmodule

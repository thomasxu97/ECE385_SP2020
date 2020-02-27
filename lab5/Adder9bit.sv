module full_adder (input A, B, C,
					output Sum, CO);
	assign	Sum = A^B^C;
	assign	CO = (A&B)|(B&C)|(A&C);
endmodule


module Adder9bit
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
    output  logic[7:0]     Sum,
    output  logic          X
);
	logic[1:0]	P;
	logic[1:0]	G;
	logic[2:0]	C;
	logic[8:0]	Sum_tmp;
	logic 		Cout;
	
	assign C[0] = 1'b0;
	assign C[1] = (C[0] & P[0]) | G[0];
	assign C[2] = ((C[1] & P[1]) | G[1]);
	assign X = Sum_tmp[8];
	assign Sum = Sum_tmp[7:0];
	
	carry_lookahead_adder_four_bit CLA0 (.A(A[3:0]), .B(B[3:0]), .Cin(C[0]), .Sum(Sum_tmp[3:0]), .P(P[0]), .G(G[0]));
	carry_lookahead_adder_four_bit CLA1 (.A(A[7:4]), .B(B[7:4]), .Cin(C[1]), .Sum(Sum_tmp[7:4]), .P(P[1]), .G(G[1]));
	full_adder FA0 (.A(A[7]), .B(B[7]), .C(C[2]), .Sum(Sum_tmp[8]), .CO(Cout));
	

endmodule

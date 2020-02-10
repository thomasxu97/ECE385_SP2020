module carry_lookahead_adder_four_bit 
(
	input	logic[3:0]		A,
	input	logic[3:0]		B,
	input	logic			Cin,
	output	logic[3:0]		Sum,
	output	logic			P,
	output 	logic			G
);
	logic	c0, c1, c2, c3;
	logic 	p0, p1, p2, p3;
	logic	g0, g1, g2, g3;

	assign	p0 = A[0] | B[0];
	assign	p1 = A[1] | B[1];
	assign	p2 = A[2] | B[2];
	assign	p3 = A[3] | B[3];
	assign	g0 = A[0] & B[0];
	assign	g1 = A[1] & B[1];
	assign	g2 = A[2] & B[2];
	assign	g3 = A[3] & B[3];
	assign	c0 = Cin;
	assign	c1 = (c0 & p0) | g0;
	assign	c2 = (c1 & p1) | g1;
	assign	c3 = (c2 & p2) | g2;

	assign	Sum[0] = A[0] ^ B[0] ^ c0;
	assign 	Sum[1] = A[1] ^ B[1] ^ c1;
	assign	Sum[2] = A[2] ^ B[2] ^ c2;
	assign	Sum[3] = A[3] ^ B[3] ^ c3;

	assign	P = p0 & p1 & p2 & p3;
	assign	G = g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1);
endmodule

module carry_lookahead_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
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
	carry_lookahead_adder_four_bit CLA2 (.A(A[11:8]), .B(B[11:8]), .Cin(C[2]), .Sum(Sum[11:8]), .P(P[2]), .G(G[2]));
	carry_lookahead_adder_four_bit CLA3 (.A(A[15:12]), .B(B[15:12]), .Cin(C[3]), .Sum(Sum[15:12]), .P(P[3]), .G(G[3]));
endmodule

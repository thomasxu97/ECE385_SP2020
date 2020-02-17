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
	assign	c1 = (Cin & p0) | g0;
	assign	c2 = (Cin & p0 & p1) | (g0 & p1) | g1;
	assign	c3 = (Cin & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;

	assign	Sum[0] = A[0] ^ B[0] ^ c0;
	assign 	Sum[1] = A[1] ^ B[1] ^ c1;
	assign	Sum[2] = A[2] ^ B[2] ^ c2;
	assign	Sum[3] = A[3] ^ B[3] ^ c3;

	assign	P = p0 & p1 & p2 & p3;
	assign	G = g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1);
endmodule


module carry_lookahead_adder_four_bit 
(
	input	logic[3:0]		A,
	input	logic[3:0]		B,
	input	logic			Cin,
	output	logic[3:0]		Sum,
	output	logic			CO
);
	logic	c0, c1, c2, c3;
	logic 	p0, p1, p2, p3;
	logic	g0, g1, g2, g3;
	logic	P, G;

	assign	p0 = A[0] | B[0];
	assign	p1 = A[1] | B[1];
	assign	p2 = A[2] | B[2];
	assign	p3 = A[3] | B[3];
	assign	g0 = A[0] & B[0];
	assign	g0 = A[1] & B[1];
	assign	g0 = A[2] & B[2];
	assign	g0 = A[3] & B[3];
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
	assign	CO = (Cin & P) | G;
endmodule


module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);
	logic[15:0]		tmp_result_0;
	logic[15:0]		tmp_result_1;
	logic[3:0]		CO_0;
	logic[3:0]		CO_1;
	logic[3:0]		CO_result;

    carry_lookahead_adder_four_bit CLA00 (.A(A[3:0]), .B(B[3:0]), .Cin(1'b0), .Sum(tmp_result_0[3:0]), .CO(CO_0[0]));
    carry_lookahead_adder_four_bit CLA01 (.A(A[7:4]), .B(B[7:4]), .Cin(1'b0), .Sum(tmp_result_0[7:4]), .CO(CO_0[1]));
    carry_lookahead_adder_four_bit CLA02 (.A(A[11:8]), .B(B[11:8]), .Cin(1'b0), .Sum(tmp_result_0[11:8]), .CO(CO_0[2]));
    carry_lookahead_adder_four_bit CLA03 (.A(A[15:12]), .B(B[15:12]), .Cin(1'b0), .Sum(tmp_result_0[15:12]), .CO(CO_0[3]));
    carry_lookahead_adder_four_bit CLA10 (.A(A[3:0]), .B(B[3:0]), .Cin(1'b1), .Sum(tmp_result_1[3:0]), .CO(CO_1[0]));
    carry_lookahead_adder_four_bit CLA11 (.A(A[7:4]), .B(B[7:4]), .Cin(1'b1), .Sum(tmp_result_1[7:4]), .CO(CO_1[1]));
    carry_lookahead_adder_four_bit CLA12 (.A(A[11:8]), .B(B[11:8]), .Cin(1'b1), .Sum(tmp_result_1[11:8]), .CO(CO_1[2]));
    carry_lookahead_adder_four_bit CLA13 (.A(A[15:12]), .B(B[15:12]), .Cin(1'b1), .Sum(tmp_result_1[15:12]), .CO(CO_1[3]));

    CO_result[0] = CO_0[0];
    Sum[3:0] = tmp_result_0[3:0];
    if (CO_result[0] == 1'b0) 
    	begin CO_result[1] = CO_0[1]; Sum[7:4] = tmp_result_0[7:4]; end 
    else 
    	begin CO_result[1] = CO_1[1]; Sum[7:4] = tmp_result_1[7:4]; end
	if (CO_result[1] == 1'b0) 
		begin CO_result[2] = CO_0[2]; Sum[11:8] = tmp_result_0[7:4]; end 
	else 
		begin CO_result[2] = CO_1[2]; Sum[7:4] = tmp_result_1[11:8]; end
	if (CO_result[2] == 1'b0) 
		begin CO_result[3] = CO_0[3]; Sum[15:12] = tmp_result_0[7:4]; end 
	else 
		begin CO_result[3] = CO_1[3]; Sum[7:4] = tmp_result_1[15:12]; end

	assign CO = CO_result[3];


endmodule

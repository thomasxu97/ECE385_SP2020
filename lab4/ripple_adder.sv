module full_adder (input A, B, C,
					output Sum, CO);
	assign	Sum = A^B^C;
	assign	CO = (A&B)|(B&C)|(A&C);
endmodule


module ripple_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);
	logic	[15:0] carry;
	assign	CO = carry[15];


	full_adder FA0(.A(A[0]), .B(B[0]), .C(1'b0), .Sum(Sum[0]), .CO(carry[0]));
	full_adder FA1(.A(A[1]), .B(B[1]), .C(carry[0]), .Sum(Sum[1]), .CO(carry[1]));
	full_adder FA2(.A(A[2]), .B(B[2]), .C(carry[1]), .Sum(Sum[2]), .CO(carry[2]));
	full_adder FA3(.A(A[3]), .B(B[3]), .C(carry[2]), .Sum(Sum[3]), .CO(carry[3]));
	full_adder FA4(.A(A[4]), .B(B[4]), .C(carry[3]), .Sum(Sum[4]), .CO(carry[4]));
	full_adder FA5(.A(A[5]), .B(B[5]), .C(carry[4]), .Sum(Sum[5]), .CO(carry[5]));
	full_adder FA6(.A(A[6]), .B(B[6]), .C(carry[5]), .Sum(Sum[6]), .CO(carry[6]));
	full_adder FA7(.A(A[7]), .B(B[7]), .C(carry[6]), .Sum(Sum[7]), .CO(carry[7]));
	full_adder FA8(.A(A[8]), .B(B[8]), .C(carry[7]), .Sum(Sum[8]), .CO(carry[8]));
	full_adder FA9(.A(A[9]), .B(B[9]), .C(carry[8]), .Sum(Sum[9]), .CO(carry[9]));
	full_adder FA10(.A(A[10]), .B(B[10]), .C(carry[9]), .Sum(Sum[10]), .CO(carry[10]));
	full_adder FA11(.A(A[11]), .B(B[11]), .C(carry[10]), .Sum(Sum[11]), .CO(carry[11]));
	full_adder FA12(.A(A[12]), .B(B[12]), .C(carry[11]), .Sum(Sum[12]), .CO(carry[12]));
	full_adder FA13(.A(A[13]), .B(B[13]), .C(carry[12]), .Sum(Sum[13]), .CO(carry[13]));
	full_adder FA14(.A(A[14]), .B(B[14]), .C(carry[13]), .Sum(Sum[14]), .CO(carry[14]));
	full_adder FA15(.A(A[15]), .B(B[15]), .C(carry[14]), .Sum(Sum[15]), .CO(carry[15]));
     
endmodule



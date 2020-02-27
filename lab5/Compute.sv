module Compute
(
	input			AddEn,
	input 		SubEn,
	input			Run,
	input[7:0] 	OpA,
	input[7:0]	OpB,
	input 		Updatex,
					
	output logic [7:0] result,
	output reg 	X
);

	logic[7:0]	A_comb;
	logic[7:0]	B_comb;
	logic 		X_comb;
	
	always_comb begin
		A_comb = OpA;
		B_comb = OpB;
		if (SubEn) begin
			B_comb = ~OpB+1'b1;
		end
	end
	
	always_ff @(posedge Updatex or posedge Run) begin
		if (Run) X <= 1'b0;
		else X <= X_comb;
	end
	
	Adder9bit Adder(.A(A_comb), .B(B_comb), .Sum(result), .X(X_comb));
					
endmodule	
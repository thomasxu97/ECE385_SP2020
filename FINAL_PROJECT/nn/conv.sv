// nn conv 5*5

module conv (
	input logic [31:0] in [24:0], 
	input logic [31:0] w [24:0],
	output logic [31:0] out
);

logic [31:0] mul [31:0];
logic [31:0] add1 [15:0];
logic [31:0] add2 [7:0];
logic [31:0] add3 [3:0];
logic [31:0] add4 [1:0];
logic [31:0] add5;

multiplier multiplier [24:0] (
	.a (in[24:0]),
	.b (w[24:0]),
	.out (mul[24:0])
);

Genvar i;
for (i=25; i<32;i=i+1) begin
	mul[i] = 31'b0;
end

adder adder1 [15:0] (
	.a (mul[15:0]), 
	.b (mul[31:16]), 
	.f (add1[15:0])
);

adder adder2 [7:0] (
	.a (add1[7:0]), 
	.b (add1[15:8]), 
	.f (add2[7:0])
);

adder adder3 [3:0] (
	.a (add2[3:0]), 
	.b (add2[7:4]), 
	.f (add3[3:0])
);

adder adder4 [1:0] (
	.a (add3[1:0]), 
	.b (add3[2:1]), 
	.f (add4[1:0])
);

adder adder5 (
	.a (add4[1]), 
	.b (add4[0]), 
	.f (add5)
);

relu relu (
	.a (add5),
	.f (out)
);

endmodule
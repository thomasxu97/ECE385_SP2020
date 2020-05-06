// top neural network
// input data 28 * 28 bit value

module nn (
	input Clk, 
	input Rst,
    input logic data [28*28-1:0],
    output logic [4:0] prediction, 
    output resp
);

logic [31:0] d1 [30-1:0];
logic [31:0] g1 [30-1:0];
logic [31:0] m1 [30-1:0];
logic [31:0] t1 [30-1:0];
logic [31:0] z1 [30-1:0];
logic [31:0] a1 [30-1:0];

logic [31:0] d2 [15-1:0];
logic [31:0] g2 [15-1:0];
logic [31:0] m2 [15-1:0];
logic [31:0] t2 [15-1:0];
logic [31:0] z2 [15-1:0];
logic [31:0] a2 [15-1:0];

logic [31:0] d3 [10-1:0];
logic [31:0] g3 [10-1:0];
logic [31:0] m3 [10-1:0];
logic [31:0] t3 [10-1:0];
logic [31:0] z3 [10-1:0];

logic [31:0] counter_1;
logic [31:0] counter_2;
logic [31:0] counter_3;

logic [31:0] w1 [28*28*30-1:0];
logic [31:0] w2 [30*15-1:0];
logic [31:0] w3 [15*10-1:0]; 
logic [31:0] b1 [30-1:0];
logic [31:0] b2 [15-1:0]; 
logic [31:0] b3 [10-1:0];


enum logic [4:0] {
	Ready,
	Layer1, 
	Layer2,
	Layer3,
	Output
} State, Next_state;

multiplier mult_1 [29:0] (
	.a (d1), 
	.b (g1), 
	.f (m1)
);

adder add_1 [29:0] (
	.a (m1), 
	.b (t1), 
	.f (z1)
);

relu relu_1 [29:0] (
	.a (z1), 
	.f (a1)
);

multiplier mult_2 [14:0] (
	.a (d2), 
	.b (g2), 
	.f (m2)
);

adder add_2 [14:0] (
	.a (m2), 
	.b (t2), 
	.f (z2)
);

relu relu_2 [14:0] (
	.a (z2), 
	.f (a2)
);

multiplier mult_3 [9:0] (
	.a (d3), 
	.b (g3), 
	.f (m3)
);

adder add_3 [9:0] (
	.a (m3), 
	.b (t3), 
	.f (z3)
);

argmax argmax (
	.in (z3), 
	.number (prediction)
);


always_ff @(posedge Clk) begin
	if (Rst) State <= Next_state;
	else State <= Ready;

	unique case (State)
		Ready : begin
			counter_1 <= '0;
			counter_2 <= '0;
			counter_3 <= '0;
		end
		Layer1 : begin
			counter_1 <= counter_1 + 1'b1;
			for (int i=0; i<30; i=i+1) begin
				d1[i] <= data[counter_1] ? 32'h3F800000 : 32'h00000000;
				g1[i] <= w1[counter_1 * 30 + i];
				t1[i] <= (counter_1 == '0) ? b1[i] : z1[i];
			end
		end
		Layer2 : begin
			counter_2 <= counter_2 + 1'b1;
			for (int i=0; i<15; i=i+1) begin
				d2[i] <= a1[counter_2];
				g2[i] <= w2[counter_2 * 15 + i];
				t2[i] <= (counter_2 == '0) ? b2[i] : z2[i];
			end
		end
		Layer3 : begin
			counter_3 <= counter_3 + 1'b1;
			for (int i=0; i<10; i=i+1) begin
				d3[i] <= a2[counter_3];
				g3[i] <= w3[counter_3 * 10 + i];
				t3[i] <= (counter_3 == '0) ? b3[i] : z3[i];
			end
		end
		Output : ;
		Default : ;
	endcase

end

always_comb begin
	Next_state = State;
	resp = 1'b0;
	unique case (State): 
		Ready: Next_state = Layer1;
		Layer1: if (counter_1 >= 28*28) Next_state = Layer2;
		Layer2: if (counter_2 >= 30) Next_state = Layer3;
		Layer3: if (counter_3 >= 15) Next_state = Output;
		Output: begin Next_state = Ready; resp = 1'b1; end
	endcase
   
end

endmodule


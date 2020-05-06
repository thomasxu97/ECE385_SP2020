// top neural network
// input data 28 * 28 bit value

module nn (
	input Clk, 
	input Rst,
	input Start,
    input logic [28*28-1:0] data,
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

//////// weight matrix ////////////
logic [31:0] w1_addr;
logic [31:0] w2_addr;
logic [31:0] w3_addr;

logic [31:0] b1 [30-1:0];
logic [31:0] b2 [15-1:0];
logic [31:0] b3 [10-1:0];
logic [32*30-1:0] w1;
logic [32*15-1:0] w2;
logic [32*10-1:0] w3;


assign b1[0] = 32'h3ff11456;
assign b1[1] = 32'h3ff9f879;
assign b1[2] = 32'h3fc9399c;
assign b1[3] = 32'h4061cae1;
assign b1[4] = 32'h3fe89108;
assign b1[5] = 32'h3ff6dbc8;
assign b1[6] = 32'h40059a1c;
assign b1[7] = 32'h3fefff6f;
assign b1[8] = 32'h3f91f186;
assign b1[9] = 32'h3f93a848;
assign b1[10] = 32'hbe934a5d;
assign b1[11] = 32'hbda21e16;
assign b1[12] = 32'h405558bc;
assign b1[13] = 32'h3f6ab05b;
assign b1[14] = 32'h4024a92a;
assign b1[15] = 32'hbfa70796;
assign b1[16] = 32'h3ffc799a;
assign b1[17] = 32'h3f8265c9;
assign b1[18] = 32'h4011aeab;
assign b1[19] = 32'h40597376;
assign b1[20] = 32'h3fa9256a;
assign b1[21] = 32'hc190c1f1;
assign b1[22] = 32'h403a548c;
assign b1[23] = 32'hc101e679;
assign b1[24] = 32'h3fe2c25c;
assign b1[25] = 32'h3fd69cbb;
assign b1[26] = 32'h3ebec1e5;
assign b1[27] = 32'h3fac7881;
assign b1[28] = 32'h3f505583;
assign b1[29] = 32'hc11e58c4;

assign b2[0] = 32'h40290f86;
assign b2[1] = 32'h3f345794;
assign b2[2] = 32'h3f58feb6;
assign b2[3] = 32'h3fc06886;
assign b2[4] = 32'h408c26b2;
assign b2[5] = 32'h40b96033;
assign b2[6] = 32'h4009afd1;
assign b2[7] = 32'h4037eccc;
assign b2[8] = 32'h403c1482;
assign b2[9] = 32'h4066396a;
assign b2[10] = 32'h3fba094f;
assign b2[11] = 32'h40299b49;
assign b2[12] = 32'h3e87a4e8;
assign b2[13] = 32'h3e9bd926;
assign b2[14] = 32'h3fdfef8b;

assign b3[0] = 32'h3fbe7e0a;
assign b3[1] = 32'hc0838846;
assign b3[2] = 32'hc05dea4a;
assign b3[3] = 32'hbfe9ef81;
assign b3[4] = 32'h3f300ee2;
assign b3[5] = 32'h3f570295;
assign b3[6] = 32'h408b563d;
assign b3[7] = 32'hc0a13bd6;
assign b3[8] = 32'h3fb1a379;
assign b3[9] = 32'h3f3a284b;

//////////////////////////////
weight_mat_w1 u_w1(.addr(w1_addr), .weight(w1));
weight_mat_w2 u_w2(.addr(w2_addr), .weight(w2));
weight_mat_w3 u_w3(.addr(w3_addr), .weight(w3));


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
	if (~Rst) State <= Next_state;
	else State <= Ready;

	unique case (State)
		Ready : begin
			counter_1 <= '0;
			counter_2 <= '0;
			counter_3 <= '0;
		end
		Layer1 : begin
			counter_1 <= counter_1 + 1'b1;
			w1_addr <= counter_1 * 30;
		end
		Layer2 : begin
			counter_2 <= counter_2 + 1'b1;
			w2_addr <= counter_2 * 15;
		end
		Layer3 : begin
			counter_3 <= counter_3 + 1'b1;
			w3_addr <= counter_3 * 10;
		end
		Output : ;
		default : ;
	endcase
end

function void set_default ();
	Next_state = State;
	resp = 1'b0;
	for (int i=0; i<30; i=i+1) begin
		d1[i] = 32'h00000000;
		g1[i] = 32'h00000000;
		t1[i] = 32'h00000000;
	end
	for (int i=0; i<15; i++) begin
		d2[i] = 32'h00000000;
		g2[i] = 32'h00000000;
		t2[i] = 32'h00000000;
	end
	for (int i=0; i<10; i++) begin
		d3[i] = 32'h00000000;
		g3[i] = 32'h00000000;
		t3[i] = 32'h00000000;
	end
endfunction

always_comb begin
	set_default();
	unique case (State)
		Ready: begin if (Start) Next_state = Layer1; end
		Layer1: begin
			if (counter_1 == 28*28) Next_state = Layer2;
			for (int i=0; i<30; i=i+1) begin
				d1[i] = data[counter_1-1] ? 32'h3F800000 : 32'h00000000;
				g1[i] = w1[i*32+31 -:32];
				t1[i] = ((counter_1-1) == '0) ? b1[i] : z1[i];
			end
		end
		Layer2: begin
			if (counter_2 == 30) Next_state = Layer3;
			for (int i=0; i<15; i=i+1) begin
				d2[i] <= a1[counter_2-1];
				g2[i] <= w2[i*32+31 -:32];
				t2[i] <= ((counter_2-1) == '0) ? b2[i] : z2[i];
			end
		end
		Layer3: begin
			if (counter_3 == 15) Next_state = Output;
			for (int i=0; i<10; i=i+1) begin
				d3[i] <= a2[counter_3-1];
				g3[i] <= w3[i*32+31 -:32];
				t3[i] <= ((counter_3-1) == '0) ? b3[i] : z3[i];
			end
		end
		Output: begin Next_state = Ready; resp = 1'b1; end
	endcase
   
end

endmodule
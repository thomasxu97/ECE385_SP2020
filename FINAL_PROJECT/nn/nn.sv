// top neural network
// input data 28 * 28 bit value

module nn (
	input Clk, 
	input Rst,
	input Start,
    input logic [28*28-1:0] data,
    input logic [15:0] rdata,
//	output wire [15:0] rdata,
    output logic [4:0] prediction, 
    output logic [19:0] address,
	 output logic resp,
	 output logic [31:0] w_
);
/////////////// for debug //////////////////
//logic CE, UB, LB,OE, WE;
//assign CE = 1'b0;
//assign LB = 1'b0;
//assign OE = 1'b0;
//assign WE = 1'b1;
//assign UB = 1'b0;
//test_memory my_test_memory(.Reset(Rst), .I_O(rdata), .A(address), .*);


///////////////////////////////
logic [31:0] a1 [29:0];
logic [31:0] a2 [14:0];
logic [31:0] z3 [9:0];

logic [31:0] d, w, m, t, z, a;

logic [31:0] row_counter;
logic [31:0] col_counter;

logic [31:0] b1 [30-1:0];
logic [31:0] b2 [15-1:0];
logic [31:0] b3 [10-1:0];

assign w_ = w;
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

multiplier mult (
	.a (d), 
	.b (w), 
	.f (m)
);

adder add (
	.a (m), 
	.b (t), 
	.f (z)
);

relu relu (
	.a (z), 
	.f (a)
);

argmax argmax (
	.in (z3),
	.number (prediction)
);

enum logic [4:0] {
	Ready,
	Layer1_prep,
	Layer1_load_1,
	Layer1_load_2,
	Layer1_load_3,
	Layer1_load_4,
	Layer1_multiply,
	Layer1_add,
	Layer1_activation,
	Layer2_prep,
	Layer2_load_1,
	Layer2_load_2,
	Layer2_load_3,
	Layer2_load_4,
	Layer2_multiply,
	Layer2_add,
	Layer2_activation,
	Layer3_prep,
	Layer3_load_1,
	Layer3_load_2,
	Layer3_load_3,
	Layer3_load_4,
	Layer3_multiply,
	Layer3_add,
	Layer3_activation,
	Output
} State, Next_state;

always_ff @(posedge Clk) begin
	if (~Rst) State <= Next_state;
	else State <= Ready;
	case (State)
		Ready : ;
		Layer1_prep : begin row_counter <= '0; col_counter <= '0; end
		Layer1_load_1 : if (row_counter == '0) t <= b1[col_counter]; else t <= z;
		Layer1_load_2 : ;
		Layer1_load_3 : w[15:0] <= rdata;
		Layer1_load_4 : ;
		Layer1_multiply : begin w[31:16] <= rdata; d <= data[row_counter] ? 32'h3F800000 : 32'h00000000; end
		Layer1_add : row_counter <= row_counter + 1'b1;
		Layer1_activation : begin a1[col_counter] <= a; row_counter <= '0; col_counter <= col_counter + 1'b1; end
		Layer2_prep : begin row_counter <= '0; col_counter <= '0; end
		Layer2_load_1 : if (row_counter == '0) t <= b2[col_counter]; else t <= z;
		Layer2_load_2 : ;
		Layer2_load_3 : w[15:0] <= rdata;
		Layer2_load_4 : ;
		Layer2_multiply : begin w[31:16] <= rdata; d <= a1[row_counter]; end
		Layer2_add : row_counter <= row_counter + 1'b1;
		Layer2_activation : begin a2[col_counter] <= a; row_counter <= '0; col_counter <= col_counter + 1'b1; end
		Layer3_prep : begin row_counter <= '0; col_counter <= '0; end
		Layer3_load_1 : if (row_counter == '0) t <= b3[col_counter]; else t <= z;
		Layer3_load_2 : ;
		Layer3_load_3 : w[15:0] <= rdata;
		Layer3_load_4 : ;
		Layer3_multiply : begin w[31:16] <= rdata; d <= a2[row_counter]; end
		Layer3_add : row_counter <= row_counter + 1'b1;
		Layer3_activation : begin z3[col_counter] <= z; row_counter <= '0; col_counter <= col_counter + 1'b1; end
		Output : ;
	endcase
end

always_comb begin
	Next_state = State;
	case (State)
		Ready : if (Start) Next_state = Layer1_prep;
		Layer1_prep : Next_state = Layer1_load_1;
		Layer1_load_1 : Next_state = Layer1_load_2;
		Layer1_load_2 : Next_state = Layer1_load_3;
		Layer1_load_3 : Next_state = Layer1_load_4;
		Layer1_load_4 : Next_state = Layer1_multiply;
		Layer1_multiply : Next_state = Layer1_add;
		Layer1_add : if (row_counter == 783) Next_state = Layer1_activation;
					 else Next_state = Layer1_load_1;
		Layer1_activation : if (col_counter == 29) Next_state = Layer2_prep;
							else Next_state = Layer1_load_1;
		Layer2_prep : Next_state = Layer2_load_1;
		Layer2_load_1 : Next_state = Layer2_load_2;
		Layer2_load_2 : Next_state = Layer2_load_3;
		Layer2_load_3 : Next_state = Layer2_load_4;
		Layer2_load_4 : Next_state = Layer2_multiply;
		Layer2_multiply : Next_state = Layer2_add;
		Layer2_add : if (row_counter == 29) Next_state = Layer2_activation;
					 else Next_state = Layer2_load_1;
		Layer2_activation : if (col_counter == 14) Next_state = Layer3_prep;
							else Next_state = Layer2_load_1;
		Layer3_prep : Next_state = Layer3_load_1;
		Layer3_load_1 : Next_state = Layer3_load_2;
		Layer3_load_2 : Next_state = Layer3_load_3;
		Layer3_load_3 : Next_state = Layer3_load_4;
		Layer3_load_4 : Next_state = Layer3_multiply;
		Layer3_multiply : Next_state = Layer3_add;
		Layer3_add : if (row_counter == 14) Next_state = Layer3_activation;
					 else Next_state = Layer3_load_1;
		Layer3_activation : if (col_counter == 9) Next_state = Output;
							else Next_state = Layer3_load_1;
		Output : ;
	endcase
end

always_comb begin
	address = 'x;
	resp = 1'b0;
	case (State) 
		Ready : ;
		Layer1_prep : ;
		Layer1_load_1 : ;
		Layer1_load_2 : address = (row_counter * 30 + col_counter) * 2;
		Layer1_load_3 : address = (row_counter * 30 + col_counter) * 2;
		Layer1_load_4 : address = (row_counter * 30 + col_counter) * 2 + 1;
		Layer1_multiply : address = (row_counter * 30 + col_counter) * 2 + 1;
		Layer1_add : ;
		Layer1_activation : ;
		Layer2_prep : ;
		Layer2_load_1 : ;
		Layer2_load_2 : address = 20'd47040 + (row_counter * 15 + col_counter) * 2;
		Layer2_load_3 : address = 20'd47040 + (row_counter * 15 + col_counter) * 2;
		Layer2_load_4 : address = 20'd47040 + (row_counter * 15 + col_counter) * 2 + 1;
		Layer2_multiply : address = 20'd47040 + (row_counter * 15 + col_counter) * 2 + 1;
		Layer2_add : ;
		Layer2_activation : ;
		Layer3_prep : ;
		Layer3_load_1 : ;
		Layer3_load_2 : address = 20'd47940 + (row_counter * 10 + col_counter) * 2;
		Layer3_load_3 : address = 20'd47940 + (row_counter * 10 + col_counter) * 2;
		Layer3_load_4 : address = 20'd47940 + (row_counter * 10 + col_counter) * 2 + 1;
		Layer3_multiply : address = 20'd47940 + (row_counter * 10 + col_counter) * 2 + 1;
		Layer3_add : ;
		Layer3_activation : ;
		Output : resp = 1'b1;
	endcase
end


endmodule 
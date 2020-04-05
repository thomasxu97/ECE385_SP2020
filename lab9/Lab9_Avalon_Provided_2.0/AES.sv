/************************************************************************
AES Decryption Core Logic

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES (
	input	 logic CLK,
	input  logic RESET,
	input  logic AES_START,
	output logic AES_DONE,
	input  logic [127:0] AES_KEY,
	input  logic [127:0] AES_MSG_ENC,
	output logic [127:0] AES_MSG_DEC
);
	
	logic done_flag = 0;
	logic [7:0] State;
	logic [7:0] next_state;
	logic [7:0] round;
	logic [127:0] key;
	logic [127:0] state_matrix;
	logic [127:0] post_ISR_state, post_ISB_state, post_IMC_state, post_ARK_state;
	logic [1407:0] KeySchedule;
	logic [7:0] inbyte, outbyte;
	//Parameters
	localparam Nb = 8'd4;
	localparam Nr = 8'd10;
	
	assign AES_DONE = done_flag;
	KeyExpansion keyExp (
			.clk(CLK),
			.Cipherkey(key),
			.KeySchedule(KeySchedule)
	);
	
	AddRoundKey ARkey(
			.state(state_matrix),
			.key(key),
			.ans(post_ARK_state)
	);
	
	InvShiftRows ISRows(
			.data_in(state_matrix),
			.data_out(post_ISR_state)
	);
	
	InvSubBytesMatrix ISBMatrix(
			.clk(CLK),
			.in(state_matrix),
			.out(post_ISB_state)
	);
	
	InvMixColumnsMatrix IMCMatrix(
			.in(state_matrix),
			.out(post_IMC_state)
	);
	
	// States
	localparam WAIT 						= 8'd00;
	localparam DONE						= 8'd01;
	localparam INIT						= 8'd02;
	localparam KEY_EXPANSION_1			= 8'd03;
	localparam LOOP_INV_SHIFTROWS		= 8'd04;
	localparam POST_INV_SHIFTROWS		= 8'd05;
	localparam LOOP_INV_SUBBYTES_1 	= 8'd06;
	localparam POST_INV_SUBBYTES_1	= 8'd07;
	localparam PRE_ADD_ROUNDKEY	   = 8'd08;
	localparam LOOP_ADD_ROUNDKEY		= 8'd09;
	localparam POST_ADD_ROUNDKEY		= 8'd10;
	localparam INV_MIXCOLUMNS			= 8'd11;
	localparam ERROR						= 8'd12;
	localparam KEY_EXPANSION_2			= 8'd13;
	localparam LOOP_INV_SUBBYTES_2 	= 8'd14;
	localparam POST_INV_SUBBYTES_2	= 8'd15;
	
	initial begin
		State = WAIT;
		round = 1;
	end
	
	always_comb begin
		next_state = ERROR;
		if (RESET) begin
			next_state = WAIT;
		end else begin
			case(State)
				WAIT: begin
					if(AES_START == 0) next_state = WAIT;
					else	next_state = INIT;
				end
				
				DONE: begin
					if(AES_START == 1) next_state = DONE;
					else	next_state = WAIT;
				end
				
				INIT: next_state = KEY_EXPANSION;
				
            KEY_EXPANSION_1:next_state = KEY_EXPANSION_2;

				KEY_EXPANSION_2: next_state = PRE_ADD_ROUNDKEY;
				
				PRE_ADD_ROUNDKEY: next_state = LOOP_INV_SHIFTROWS;
				
				LOOP_INV_SHIFTROWS: next_state = LOOP_INV_SUBBYTES;

				LOOP_INV_SUBBYTES_1: next_state = LOOP_INV_SUBBYTES_2;
				
				LOOP_INV_SUBBYTES_2: next_state = LOOP_ADD_ROUNDKEY;
				
				LOOP_ADD_ROUNDKEY: next_state = INV_MIXCOLUMNS;
				
				INV_MIXCOLUMNS: begin
					if(round <= Nr-1) next_state = LOOP_INV_SHIFTROWS;
					else next_state = POST_INV_SHIFTROWS;
				end
				
				POST_INV_SHIFTROWS: next_state = POST_INV_SUBBYTES;
				
				POST_INV_SUBBYTES_1: next_state = POST_INV_SUBBYTES_2;
				
				POST_INV_SUBBYTES_2: next_state = POST_ADD_ROUNDKEY;
				
				POST_ADD_ROUNDKEY: next_state = DONE;
				
				ERROR: next_state = ERROR;
			endcase
		end
	end
	
	always_ff @(posedge CLK) begin
		State = next_state;
		case(State) 
				WAIT: begin
					done_flag = 0;
				end
				INIT: begin
					state_matrix <= AES_MSG_ENC;
					key <= AES_KEY;
				end
                
				PRE_ADD_ROUNDKEY: begin
					key <= KeySchedule[128*round-1:128*(round-1)];
					state_matrix <= post_ARK_state;
					
				LOOP_INV_SHIFTROWS: begin
					state_matrix <= post_ISR_state;
				end

				LOOP_INV_SUBBYTES_2: begin
					state_matrix <= post_ISB_state;
				end
				
				LOOP_ADD_ROUNDKEY: begin
					key <= KeySchedule[128*round-1:128*(round-1)]
					state_matrix <= post_ARK_state;
				end
				
				INV_MIXCOLUMNS: begin
					round = round + 1
					state_matrix <= post_IMC_state;
				end
				
				POST_INV_SHIFTROWS: begin
					state_matrix <= post_ISR_state;
				end
				
				POST_INV_SUBBYTES_2: begin
					state_matrix <= post_ISB_state;
				end
				
				POST_ADD_ROUNDKEY: begin
					key <= KeySchedule[1407:1280]
					state_matrix <= post_ARK_state;
				end

				DONE: begin
					done_flag <= 1;
				end
		endcase
	end
endmodule

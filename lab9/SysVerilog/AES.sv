/************************************************************************
AES Decryption Core Logic

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department
************************************************************************/

module AES (
	input	 logic CLK,
	input  logic RESET,
	input  logic [31:0] AES_START,
	output logic AES_DONE,
	input  logic [127:0] AES_KEY,
	input  logic [127:0] AES_MSG_ENC,
	output logic [127:0] AES_MSG_DEC
);
	
	logic done_flag = 0;
	logic [7:0] round = 1;
	logic [7:0] counter_delay;
	logic [127:0] key, key_static;
	logic [127:0] state_matrix;
	logic [127:0] post_ISR_state, post_ISB_state, post_IMC_state, post_ARK_state;
	logic [1407:0] KeySchedule;
	logic [127:0] keytable [10:0];
	logic [7:0] inbyte, outbyte;
	logic [127:0] decrypted_msg;
	logic [31:0] word_in, word_out;
	//Parameters
	localparam Nb = 8'd4;
	localparam Nr = 8'd10;
	
	assign keytable[0] = KeySchedule[1407:1280];
	assign keytable[1] = KeySchedule[1279:1152];
	assign keytable[2] = KeySchedule[1151:1024];
	assign keytable[3] = KeySchedule[1023: 896];
	assign keytable[4] = KeySchedule[895 : 768];
	assign keytable[5] = KeySchedule[767 : 640];
	assign keytable[6] = KeySchedule[639 : 512];
	assign keytable[7] = KeySchedule[511 : 384];
	assign keytable[8] = KeySchedule[383 : 256];
	assign keytable[9] = KeySchedule[255 : 128];
	assign keytable[10] = KeySchedule[127 :  0];
	assign AES_DONE = done_flag;
	assign AES_MSG_DEC = decrypted_msg;
	KeyExpansion keyExp (
			.clk(CLK),
			.Cipherkey(key_static),
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
	
	InvMixColumns IMC(
			.in(word_in),
			.out(word_out)
	);
	
	// FSM
	enum logic [7:0] {WAIT, 
							DONE, 
							INIT, 
							KEY_EXPANSION, 
							LOOP_INV_SHIFTROWS,
							POST_INV_SHIFTROWS,
							LOOP_INV_SUBBYTES_1,
							LOOP_INV_SUBBYTES_2,
							POST_INV_SUBBYTES_1,
							POST_INV_SUBBYTES_2,
							PRE_ADD_ROUNDKEY,
							LOOP_ADD_ROUNDKEY,
							POST_ADD_ROUNDKEY,
							INV_MIXCOLUMNS_1,
							INV_MIXCOLUMNS_1_NEXT,
							INV_MIXCOLUMNS_2,
							INV_MIXCOLUMNS_2_NEXT,
							INV_MIXCOLUMNS_3,
							INV_MIXCOLUMNS_3_NEXT,
							INV_MIXCOLUMNS_4,
							INV_MIXCOLUMNS_4_NEXT,
							ASSIGNKEY_1,
							ASSIGNKEY_2,
							ASSIGNKEY_3
							}   curr_state, next_state; 

	
	always_comb begin
		next_state = curr_state;
		unique case(curr_state)
				WAIT: begin
					if(AES_START == 1) next_state = INIT;
					else	next_state = WAIT;
				end
				
				DONE: begin
					if(AES_START == 0) next_state = WAIT;
					else	next_state = DONE;
				end
				
				INIT: next_state = KEY_EXPANSION;
				
            KEY_EXPANSION: begin
					if (counter_delay == 9) begin
						next_state = ASSIGNKEY_1;
					end else begin
						next_state = KEY_EXPANSION;
					end
				end

				ASSIGNKEY_1: next_state = PRE_ADD_ROUNDKEY;
				
				PRE_ADD_ROUNDKEY: next_state = LOOP_INV_SHIFTROWS;
				
				LOOP_INV_SHIFTROWS: next_state = LOOP_INV_SUBBYTES_1;

				LOOP_INV_SUBBYTES_1: next_state = LOOP_INV_SUBBYTES_2;
				
				LOOP_INV_SUBBYTES_2: next_state = ASSIGNKEY_2;
				
				ASSIGNKEY_2: next_state = LOOP_ADD_ROUNDKEY;
				
				LOOP_ADD_ROUNDKEY: next_state = INV_MIXCOLUMNS_1;
				
				INV_MIXCOLUMNS_1: next_state = INV_MIXCOLUMNS_1_NEXT;
				INV_MIXCOLUMNS_1_NEXT: next_state = INV_MIXCOLUMNS_2;
				INV_MIXCOLUMNS_2: next_state = INV_MIXCOLUMNS_2_NEXT;
				INV_MIXCOLUMNS_2_NEXT: next_state = INV_MIXCOLUMNS_3;
				INV_MIXCOLUMNS_3: next_state = INV_MIXCOLUMNS_3_NEXT;
				INV_MIXCOLUMNS_3_NEXT: next_state = INV_MIXCOLUMNS_4;
				INV_MIXCOLUMNS_4: next_state = INV_MIXCOLUMNS_4_NEXT;
				INV_MIXCOLUMNS_4_NEXT: begin
					if(round > 1) next_state = LOOP_INV_SHIFTROWS;
					else next_state = POST_INV_SHIFTROWS;
				end
				
				POST_INV_SHIFTROWS: next_state = POST_INV_SUBBYTES_1;
				
				POST_INV_SUBBYTES_1: next_state = POST_INV_SUBBYTES_2;
				
				POST_INV_SUBBYTES_2: next_state = ASSIGNKEY_3;
				
				ASSIGNKEY_3: next_state = POST_ADD_ROUNDKEY;
				
				POST_ADD_ROUNDKEY: next_state = DONE;
			endcase
	end
	
	always_ff @(posedge CLK) begin
		if (RESET) begin
			curr_state <= WAIT;
		end
      else begin
			curr_state <= next_state;
			case(curr_state) 
				WAIT: begin
					done_flag <= 0;
				end
				INIT: begin
					state_matrix <= AES_MSG_ENC;
					key_static <= AES_KEY;
					counter_delay <= 8'd0;
					round <= 8'd9;
				end
                
				KEY_EXPANSION: begin
					counter_delay <= counter_delay + 1'd1;
				end
				
				ASSIGNKEY_1: key <= keytable[10];
				
				PRE_ADD_ROUNDKEY: begin
					state_matrix <= post_ARK_state;
				end
				
				LOOP_INV_SHIFTROWS: begin
					state_matrix <= post_ISR_state;
				end

				LOOP_INV_SUBBYTES_2: begin
					state_matrix <= post_ISB_state;
					
				end
				
				ASSIGNKEY_2: key <= keytable[round];
				
				LOOP_ADD_ROUNDKEY: begin
					state_matrix <= post_ARK_state;
				end
				
				INV_MIXCOLUMNS_1: word_in <= state_matrix[127:96];
				INV_MIXCOLUMNS_1_NEXT: state_matrix[127:96] <= word_out;
				INV_MIXCOLUMNS_2: word_in <= state_matrix[95:64];
				INV_MIXCOLUMNS_2_NEXT: state_matrix[95:64] <= word_out;
				INV_MIXCOLUMNS_3: word_in <= state_matrix[63:32];
				INV_MIXCOLUMNS_3_NEXT: state_matrix[63:32] <= word_out;
				INV_MIXCOLUMNS_4: word_in <= state_matrix[31:0];
				INV_MIXCOLUMNS_4_NEXT: begin
					round <= round - 1'd1;
					state_matrix[31:0] <= word_out;
				end
				
				POST_INV_SHIFTROWS: begin
					state_matrix <= post_ISR_state;
				end
				
				POST_INV_SUBBYTES_2: begin
					state_matrix <= post_ISB_state;
					
				end
				
				ASSIGNKEY_3: key <= keytable[0];
				
				POST_ADD_ROUNDKEY: begin
					state_matrix <= post_ARK_state;
				end

				DONE: begin
					done_flag <= 1;
					decrypted_msg <= state_matrix;
				end
			endcase
		end
	end
endmodule

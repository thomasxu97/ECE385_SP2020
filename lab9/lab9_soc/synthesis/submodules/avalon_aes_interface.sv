/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);
	logic [31:0] AES_KEY0, AES_KEY1, AES_KEY2, AES_KEY3;
	logic [31:0] AES_MSG_EN0, AES_MSG_EN1, AES_MSG_EN2, AES_MSG_EN3;
	logic [31:0] AES_MSG_DE0, AES_MSG_DE1, AES_MSG_DE2, AES_MSG_DE3;
	logic [31:0] AES_START, AES_DONE;
	logic [31:0] EMPTY_REG;
	logic [31:0] write_reg;
	logic [31:0] write_wire;
	logic [127:0] msg_dec;
	logic start, done_wire;
	assign EXPORT_DATA = {AES_MSG_EN0[31:16], AES_MSG_EN3[15:0]};
	assign start = AES_START[0];
	AES decrypter(
		.CLK(CLK),
		.RESET(RESET),
		.AES_START(start),
		.AES_DONE(done_wire),
		.AES_KEY({AES_KEY0, AES_KEY1, AES_KEY2, AES_KEY3}),
		.AES_MSG_ENC({AES_MSG_EN0,AES_MSG_EN1,AES_MSG_EN2,AES_MSG_EN3}),
		.AES_MSG_DEC(msg_dec)
	);

	
	always_comb begin
		AVL_READDATA = EMPTY_REG;
		if (AVL_CS && AVL_READ) begin
			case (AVL_ADDR) 
				4'd0: AVL_READDATA 	= AES_KEY0;
				4'd1: AVL_READDATA 	= AES_KEY1;
				4'd2: AVL_READDATA 	= AES_KEY2;
				4'd3: AVL_READDATA 	= AES_KEY3;
				4'd4: AVL_READDATA 	= AES_MSG_EN0;
				4'd5: AVL_READDATA 	= AES_MSG_EN1;
				4'd6: AVL_READDATA 	= AES_MSG_EN2;
				4'd7: AVL_READDATA 	= AES_MSG_EN3;
				4'd8: AVL_READDATA 	= AES_MSG_DE0;
				4'd9: AVL_READDATA 	= AES_MSG_DE1;
				4'd10: AVL_READDATA 	= AES_MSG_DE2;
				4'd11: AVL_READDATA 	= AES_MSG_DE3;
				4'd14: AVL_READDATA 	= AES_START;
				4'd15: AVL_READDATA 	= AES_DONE;
				default: AVL_READDATA = EMPTY_REG;
			endcase
		end
	end
	
	always_comb begin
		case (AVL_ADDR) 
				4'd0: write_reg 	= AES_KEY0;
				4'd1: write_reg 	= AES_KEY1;
				4'd2: write_reg 	= AES_KEY2;
				4'd3: write_reg 	= AES_KEY3;
				4'd4: write_reg 	= AES_MSG_EN0;
				4'd5: write_reg 	= AES_MSG_EN1;
				4'd6: write_reg 	= AES_MSG_EN2;
				4'd7: write_reg 	= AES_MSG_EN3;
				4'd8: write_reg 	= AES_MSG_DE0;
				4'd9: write_reg 	= AES_MSG_DE1;
				4'd10: write_reg 	= AES_MSG_DE2;
				4'd11: write_reg 	= AES_MSG_DE3;
				4'd14: write_reg 	= AES_START;
				4'd15: write_reg 	= AES_DONE;
				default: write_reg = EMPTY_REG;
		endcase
		case (AVL_BYTE_EN) 
			4'b1111: write_wire = AVL_WRITEDATA;
			4'b1100: write_wire = {AVL_WRITEDATA[31:16], write_reg[15:0]};
			4'b0011: write_wire = {write_reg[31:16], AVL_WRITEDATA[15:0]};
			4'b1000: write_wire = {AVL_WRITEDATA[31:24], write_reg[23:0]};
			4'b0100: write_wire = {write_reg[31:24], AVL_WRITEDATA[23:16], write_reg[15:0]};
			4'b0010: write_wire = {write_reg[31:16], AVL_WRITEDATA[15:8], write_reg[7:0]};
			4'b0001: write_wire = {write_reg[31:8], AVL_WRITEDATA[7:0]};
			default: write_wire = 32'd0;
		endcase
	end
	always_ff @ (posedge CLK) begin
		if (RESET) begin
			AES_KEY0		<= 32'd0;
			AES_KEY1		<= 32'd0;
			AES_KEY2		<= 32'd0;
			AES_KEY3		<= 32'd0;
			AES_MSG_EN0	<= 32'd0;
			AES_MSG_EN1	<= 32'd0;
			AES_MSG_EN2	<= 32'd0;
			AES_MSG_EN3	<= 32'd0;
			AES_MSG_DE0	<= 32'd0;
			AES_MSG_DE1	<= 32'd0;
			AES_MSG_DE2	<= 32'd0;
			AES_MSG_DE3	<= 32'd0;
			AES_START	<= 32'd0;
			AES_DONE		<= 32'd0;
		end
		else if (AVL_CS && AVL_WRITE) begin
			case (AVL_ADDR) 
				4'd0: AES_KEY0 		<= write_wire;
				4'd1: AES_KEY1 		<= write_wire;
				4'd2: AES_KEY2 		<= write_wire;
				4'd3: AES_KEY3 		<= write_wire;
				4'd4: AES_MSG_EN0 	<= write_wire;
				4'd5: AES_MSG_EN1 	<= write_wire;
				4'd6: AES_MSG_EN2 	<= write_wire;
				4'd7: AES_MSG_EN3 	<= write_wire;
				4'd14: AES_START 		<= write_wire;
				default: EMPTY_REG 	<= write_wire;
			endcase
		end 
		else begin
			case (AVL_ADDR) 
				4'd8: AES_MSG_DE0 	<= msg_dec[127:96];
				4'd9: AES_MSG_DE1 	<= msg_dec[95:64];
				4'd10: AES_MSG_DE2 	<= msg_dec[63:32];
				4'd11: AES_MSG_DE3 	<= msg_dec[31:0];
				4'd15: AES_DONE 		<= {31'd0, done_wire};
			endcase
		end
	end
endmodule


module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

logic clk, rst, start, done;
logic [127:0] Cipherkey, msg_enc, msg_dec;

AES decrypt(
	.CLK(clk),
	.RESET(rst),
	.AES_START(start),
	.AES_DONE(done),
	.AES_KEY(Cipherkey),
	.AES_MSG_ENC(msg_enc),
	.AES_MSG_DEC(msg_dec)
);

// Toggle the clock
always begin : CLOCK_GENERATION
#1 clk = ~clk;
end

initial begin
	clk = 1'd0;
	rst = 1'd0;
	start = 1'd0;
	
#4	rst = 1'd1;
#4	rst = 1'd0;
#2	Cipherkey = 128'h000102030405060708090a0b0c0d0e0f;
#2	msg_enc = 128'hdaec3055df058e1c39e814ea76f6747e;
#2 start = 1'd1;

#287 start = 1'd0;
#2 Cipherkey = 128'h3b280014beaac269d613a16bfdc2be03;
#2 msg_enc = 128'h439d619920ce415661019634f59fcf63;
#2 start = 1'd1;
end

endmodule


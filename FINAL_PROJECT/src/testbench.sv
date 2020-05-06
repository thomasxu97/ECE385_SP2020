module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;
logic clk, rst;
logic [12:0] x_pos,y_pos;
logic [7:0] pxl;
logic outpxl;
logic [7:0] oxpos,oypos;
logic store, wr_en;
// Toggle the clock
always begin : CLOCK_GENERATION
#1 clk = ~clk;
end

ResizerFile u_resizer(
	.Clk(clk),
	.Reset(rst),
	.isStore(store),
	.x_cont(x_pos),
	.y_cont(y_pos),
	.ipixel(pxl),
	.opixel(outpxl),
	.oX_pos(oxpos),
	.oY_pos(oypos),
	.wr_pxl(wr_en)
);


initial begin
	clk = 1'd0;
	rst = 1'd0;
	
#4	rst = 1'd1;
#4	rst = 1'd0;
//#2 x_pos = 0; y_pos = 0; pxl = 32;
//#2 x_pos = 1; y_pos = 0; pxl = 64;
//#2 x_pos = 2; y_pos = 0; pxl = 189;
//#2 x_pos = 3; y_pos = 0; pxl = 123;
//#2 x_pos = 4; y_pos = 0; pxl = 25;
//#2 x_pos = 5; y_pos = 0; pxl = 69;
//#2 x_pos = 6; y_pos = 0; pxl = 136;
//#2 x_pos = 7; y_pos = 0; pxl = 145;
//#2 x_pos = 8; y_pos = 0; pxl = 213;
//#2 x_pos = 9; y_pos = 0; pxl = 12;
//#2 x_pos = 10; y_pos = 0; pxl = 59;
//#2 x_pos = 11; y_pos = 0; pxl = 87;
//#2 x_pos = 12; y_pos = 0; pxl = 196;
//#2 x_pos = 13; y_pos = 0; pxl = 187;
//#2 x_pos = 14; y_pos = 0; pxl = 48;
//#2 x_pos = 15; y_pos = 0; pxl = 233;
//#2 x_pos = 16; y_pos = 0; pxl = 43;
//#2 x_pos = 17; y_pos = 0; pxl = 48;
//#2 x_pos = 18; y_pos = 0; pxl = 213;
//#2 x_pos = 19; y_pos = 0; pxl = 154;
//#2 x_pos = 20; y_pos = 0; pxl = 189;
//#2 x_pos = 21; y_pos = 0; pxl = 136;
//#2 x_pos = 22; y_pos = 0; pxl = 117;
//#2 x_pos = 23; y_pos = 0; pxl = 59;
//#2 x_pos = 24; y_pos = 0; pxl = 48;
//#2 x_pos = 25; y_pos = 0; pxl = 32;
//#2 x_pos = 26; y_pos = 0; pxl = 97;
//#2 x_pos = 27; y_pos = 0; pxl = 69;
//#2 x_pos = 28; y_pos = 0; pxl = 145;
//#2 x_pos = 29; y_pos = 0; pxl = 239;
//#2 x_pos = 30; y_pos = 0; pxl = 145;
//#2 x_pos = 31; y_pos = 0; pxl = 12;
//#2 x_pos = 32; y_pos = 0; pxl = 136;
//#2 x_pos = 33; y_pos = 0; pxl = 178;
//#2 x_pos = 34; y_pos = 0; pxl = 194;
//#2 x_pos = 35; y_pos = 0; pxl = 121;
//#2 x_pos = 36; y_pos = 0; pxl = 36;
//#2 x_pos = 37; y_pos = 0; pxl = 56;
//#2 x_pos = 38; y_pos = 0; pxl = 97;
//#2 x_pos = 39; y_pos = 0; pxl = 45;
//#2 x_pos = 40; y_pos = 0; pxl = 145;
//#2 x_pos = 41; y_pos = 0; pxl = 69;
//#2 x_pos = 42; y_pos = 0; pxl = 85;
//#2 x_pos = 43; y_pos = 0; pxl = 119;
//#2 x_pos = 44; y_pos = 0; pxl = 147;
//#2 x_pos = 45; y_pos = 0; pxl = 65;
//#2 x_pos = 46; y_pos = 0; pxl = 69;
//#2 x_pos = 47; y_pos = 0; pxl = 48;
//#2 x_pos = 48; y_pos = 0; pxl = 255;
//#2 x_pos = 49; y_pos = 0; pxl = 26;
//#2 x_pos = 50; y_pos = 0; pxl = 89;
//#2 x_pos = 51; y_pos = 0; pxl = 132;
//#2 x_pos = 52; y_pos = 0; pxl = 164;
//#2 x_pos = 53; y_pos = 0; pxl = 96;
//#2 x_pos = 54; y_pos = 0; pxl = 232;
//#2 x_pos = 55; y_pos = 0; pxl = 75;
//#2 x_pos = 56; y_pos = 0; pxl = 99;
for (int i = 0; i < 280; i++) begin
	for (int j = 0; j < 280; j++) begin
#2		store = 1'd1; x_pos = j; y_pos = i; pxl = (i*j) % 255;
	end
end
end
endmodule 
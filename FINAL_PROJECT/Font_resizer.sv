module Font_resizer #(XSTART = 0, XEND = 0, YSTART = 0, YEND = 0)(
	input 	logic 	ipixel,
	input 	logic [12:0] ix_cont,
	input 	logic [12:0] iy_cont,
	output 	logic 	Font_on
);

always_comb begin
	Font_on = 1'bz;
	if (ix_cont >= XSTART && ix_cont < XEND &&
		iy_cont >= YSTART && iy_cont < YEND) begin
		Font_on = ipixel;
	end
end
endmodule 
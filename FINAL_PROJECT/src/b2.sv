module weight_mat_b2(
	input [3:0] addr,
	output [31:0] weight
);
	parameter ADDR_WIDTH = 4;
   parameter DATA_WIDTH = 32;
				
	// ROM definition				
	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
	32'h40290F86,
	32'h3F345794,
	32'h3F58FEB6,
	32'h3FC06885,
	32'h408C26B1,
	32'h40B96032,
	32'h4009AFD1,
	32'h4037ECCC,
	32'h403C1482,
	32'h4066396A,
	32'h3FBA094F,
	32'h40299B49,
	32'h3E87A4E7,
	32'h3E9BD926,
	32'h3FDFEF8B};
	
	assign weight = ROM[addr];
endmodule

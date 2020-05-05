module weight_mat_b3(
	input [3:0] addr,
	output [31:0] weight
);
	parameter ADDR_WIDTH = 4;
   parameter DATA_WIDTH = 32;
				
	// ROM definition				
	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
	32'h3FBE7E09,
	32'hC0838845,
	32'hC05DEA4A,
	32'hBFE9EF81,
	32'h3F300EE2,
	32'h3F570295,
	32'h408B563C,
	32'hC0A13BD6,
	32'h3FB1A379,
	32'h3F3A284A
	};
	
	assign weight = ROM[addr];
endmodule

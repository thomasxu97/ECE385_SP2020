module weight_mat_b1(
	input [4:0] addr,
	output [31:0] weight
);
	parameter ADDR_WIDTH = 5;
   parameter DATA_WIDTH = 32;
				
	// ROM definition				
	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
		32'h3FF11455,
		32'h3FF9F879,
		32'h3FC9399C,
		32'h4061CAE0,
		32'h3FE89107,
		32'h3FF6DBC8,
		32'h40059A1B,
		32'h3FEFFF6E,
		32'h3F91F185,
		32'h3F93A847,
		32'hBE934A5D,
		32'hBDA21E16,
		32'h405558BC,
		32'h3F6AB05B,
		32'h4024A92A,
		32'hBFA70796,
		32'h3FFC799A,
		32'h3F8265C8,
		32'h4011AEAB,
		32'h40597376,
		32'h3FA9256A,
		32'hC190C1F1,
		32'h403A548B,
		32'hC101E678,
		32'h3FE2C25C,
		32'h3FD69CBA,
		32'h3EBEC1E5,
		32'h3FAC7881,
		32'h3F505582,
		32'hC11E58C4};
	assign weight = ROM[addr];

endmodule

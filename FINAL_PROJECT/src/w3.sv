module weight_mat_w3(
	input [7:0] addr,
	output [31:0] weight
);
	parameter ADDR_WIDTH = 8;
   parameter DATA_WIDTH = 32;
				
	// ROM definition				
	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
32'h3E03E50D,
32'h3E09FEBE,
32'h3E0E477A,
32'h3E0AF112,
32'h3CC5F486,
32'h3DE8AB08,
32'hBD71D04A,
32'h3E0B4DA5,
32'h3DE0779B,
32'h3D181AE8,
32'hBE70B6E7,
32'hBD14E73E,
32'hBC0A31B9,
32'hBDA468C0,
32'hC0604C4E,
32'hBFB3691E,
32'hC00A7413,
32'hBF034ABD,
32'hBFB2D7D9,
32'hC093226C,
32'hC04D8C60,
32'hBFA6F86B,
32'hBF24DABB,
32'hBEB4EF4F,
32'hBFA49757,
32'hBFE99E42,
32'hBF7ED5C4,
32'hBEB153BC,
32'hBFB94563,
32'hBEF8FA57,
32'hBC531DCF,
32'hBD7B310F,
32'hBE8073BC,
32'hBE9A9913,
32'hBF2C3ACB,
32'hBD507E7E,
32'hBE0FD809,
32'hBC631672,
32'hBEE647A9,
32'hBDEB2832,
32'h3DF5E154,
32'h3E5C903D,
32'h3E32B50F,
32'h3E31A630,
32'h3E3DDF66,
32'h3E06A9F4,
32'hBE3E0BD7,
32'h3E5CE405,
32'h3E544E91,
32'h3E5D1136,
32'h3E64149A,
32'h3E9C80F2,
32'h3E9E88D5,
32'h3E98ECAD,
32'h3EA0CD6B,
32'h3DFA7893,
32'h3D90ECE0,
32'h3EA2278E,
32'h3E6F9D17,
32'h3E9BB394,
32'hBF1A2A45,
32'h3D1B8215,
32'h3D15EB79,
32'h3D6588B2,
32'hBC25A0F8,
32'h3D6F994D,
32'hBEC49395,
32'h3D7167C4,
32'h5DEE1810,
32'h3D529DD4,
32'hBF98BD3F,
32'h1DC35C7D,
32'h5DF10630,
32'hBF34C433,
32'hBF94717A,
32'hBF0EEAC0,
32'hBF7370B3,
32'h5DC1018A,
32'hBC4365E5,
32'hBEE958B2,
32'hBF9D1E7C,
32'hBF27362F,
32'hC0600C00,
32'hBDBCDC2F,
32'hBF49DA10,
32'hBDB22E0B,
32'hBE3537A0,
32'hC0105663,
32'hBF231FA3,
32'hBF0265C7,
32'h3DF91640,
32'h3E735F65,
32'h3E78ED79,
32'h3E75A704,
32'hBFC9FA4F,
32'h3E46BEF5,
32'hBE5EDA9B,
32'h3E644DD3,
32'h3E7193AE,
32'h3D7BF48D,
32'hBFEFA1F4,
32'h3E582F90,
32'hBF1C5065,
32'hBFB2B9A7,
32'h3E42E299,
32'h3E46D63D,
32'hBF920E91,
32'hBF372104,
32'hBF61D33A,
32'h3D44D84E,
32'h3E19520A,
32'h3E313C17,
32'hBF2C16E0,
32'hBF5949FD,
32'h3E3304EF,
32'hBF38CCD7,
32'hBE9D1DAE,
32'h3E27B993,
32'hBE8B264B,
32'h3E26421F,
32'hBEEDC1BA,
32'hBE2EB308,
32'h3ECC93B8,
32'h3E7D49CF,
32'h3E92DBBF,
32'hBFB06005,
32'h3E9EC920,
32'h3EB24AC5,
32'hBF1D2D84,
32'hBF7626DF,
32'hC040CA22,
32'h3D636243,
32'h3D33E462,
32'hBF21B3AD,
32'hBC99100A,
32'hBE8EABB6,
32'hBF40EA27,
32'h3C9342CA,
32'hBF3302E3,
32'hBF2AB024,
32'hBF96EE23,
32'hBF8826E1,
32'h3E2AC3AB,
32'h3E466A11,
32'hC0185A7E,
32'h3E2818CF,
32'hBFF7B61D,
32'h3E3DA764,
32'h3DC9795F,
32'hBF2D8023
	};
		assign weight = ROM[addr];
endmodule
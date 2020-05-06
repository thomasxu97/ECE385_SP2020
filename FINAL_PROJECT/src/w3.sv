module weight_mat_w3(
	input [31:0] addr,
	output [32*10-1:0] weight
);
	parameter ADDR_WIDTH = 8;
   parameter DATA_WIDTH = 32;
				
	// ROM definition				
	parameter [0:2**ADDR_WIDTH-1][DATA_WIDTH-1:0] ROM = {
	32'h3e03e50e,
32'h3e09febf,
32'h3e0e477b,
32'h3e0af113,
32'h3cc5f486,
32'h3de8ab09,
32'hbd71d04a,
32'h3e0b4da5,
32'h3de0779b,
32'h3d181ae8,
32'hbe70b6e7,
32'hbd14e73e,
32'hbc0a31b9,
32'hbda468c0,
32'hc0604c4e,
32'hbfb3691f,
32'hc00a7413,
32'hbf034abd,
32'hbfb2d7da,
32'hc093226c,
32'hc04d8c60,
32'hbfa6f86b,
32'hbf24dabb,
32'hbeb4ef4f,
32'hbfa49757,
32'hbfe99e42,
32'hbf7ed5c4,
32'hbeb153bc,
32'hbfb94564,
32'hbef8fa57,
32'hbc531dcf,
32'hbd7b310f,
32'hbe8073bc,
32'hbe9a9913,
32'hbf2c3acb,
32'hbd507e7e,
32'hbe0fd809,
32'hbc631672,
32'hbee647a9,
32'hbdeb2832,
32'h3df5e155,
32'h3e5c903e,
32'h3e32b510,
32'h3e31a630,
32'h3e3ddf66,
32'h3e06a9f4,
32'hbe3e0bd7,
32'h3e5ce405,
32'h3e544e91,
32'h3e5d1137,
32'h3e64149a,
32'h3e9c80f3,
32'h3e9e88d5,
32'h3e98ecad,
32'h3ea0cd6c,
32'h3dfa7893,
32'h3d90ece1,
32'h3ea2278e,
32'h3e6f9d17,
32'h3e9bb394,
32'hbf1a2a45,
32'h3d1b8216,
32'h3d15eb7a,
32'h3d6588b2,
32'hbc25a0f8,
32'h3d6f994d,
32'hbec49395,
32'h3d7167c4,
32'hbbdc3020,
32'h3d529dd5,
32'hbf98bd3f,
32'h3b86b8fa,
32'hbbe20c60,
32'hbf34c433,
32'hbf94717a,
32'hbf0eeac0,
32'hbf7370b3,
32'hbb820314,
32'hbc4365e5,
32'hbee958b2,
32'hbf9d1e7c,
32'hbf27362f,
32'hc0600c01,
32'hbdbcdc2f,
32'hbf49da10,
32'hbdb22e0b,
32'hbe3537a0,
32'hc0105664,
32'hbf231fa3,
32'hbf0265c7,
32'h3df91640,
32'h3e735f66,
32'h3e78ed7a,
32'h3e75a704,
32'hbfc9fa4f,
32'h3e46bef6,
32'hbe5eda9b,
32'h3e644dd4,
32'h3e7193af,
32'h3d7bf48d,
32'hbfefa1f4,
32'h3e582f91,
32'hbf1c5065,
32'hbfb2b9a7,
32'h3e42e29a,
32'h3e46d63d,
32'hbf920e91,
32'hbf372104,
32'hbf61d33a,
32'h3d44d84e,
32'h3e19520a,
32'h3e313c18,
32'hbf2c16e0,
32'hbf5949fd,
32'h3e3304f0,
32'hbf38ccd7,
32'hbe9d1dae,
32'h3e27b993,
32'hbe8b264b,
32'h3e264220,
32'hbeedc1ba,
32'hbe2eb308,
32'h3ecc93b9,
32'h3e7d49d0,
32'h3e92dbc0,
32'hbfb06005,
32'h3e9ec921,
32'h3eb24ac5,
32'hbf1d2d84,
32'hbf7626df,
32'hc040ca22,
32'h3d636244,
32'h3d33e462,
32'hbf21b3ad,
32'hbc99100a,
32'hbe8eabb6,
32'hbf40ea27,
32'h3c9342cb,
32'hbf3302e3,
32'hbf2ab024,
32'hbf96ee23,
32'hbf8826e1,
32'h3e2ac3ab,
32'h3e466a11,
32'hc0185a7e,
32'h3e2818cf,
32'hbff7b61d,
32'h3e3da765,
32'h3dc9795f,
32'hbf2d8023
};
	assign weight = {ROM[addr],ROM[addr+1],ROM[addr+2],ROM[addr+3],ROM[addr+4],ROM[addr+5],
						ROM[addr+6],ROM[addr+7],ROM[addr+8],ROM[addr+9]};

endmodule 
module  Mem2IO ( 	input logic Clk, Reset,
					input logic OE_n, WE_n,       // all active low
					input logic [15:0] Data_from_sys, Data_from_SRAM,
					output logic [15:0] Data_to_sys, Data_to_SRAM
);

	// always load data from SRAM.
	always_comb
    begin 
        Data_to_sys = 16'd0;
        if (WE_n && ~OE_n) 
			Data_to_sys = Data_from_SRAM;
    end
    // Pass data from CPU to SRAM
	assign Data_to_SRAM = Data_from_sys;
endmodule

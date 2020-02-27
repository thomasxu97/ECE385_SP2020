module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset_SH, ClearA_LoadB_SH, Run_SH;
logic [7:0] S;
logic [7:0] Aval,
		 Bval;
logic [6:0] AhexL,
		 AhexU,
		 BhexL,
		 BhexU; 

// To store expected results
logic [15:0] ans_1a;
logic X;
				
// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
Multiplier multiplier0(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#5 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset_SH = 0;		// Toggle Rest
ClearA_LoadB_SH = 1;
Run_SH = 1;
S = 8'd59;

#10 Reset_SH = 1;

#10 ClearA_LoadB_SH = 0;
#10 ClearA_LoadB_SH = 1;

#10 S = -8'd07;

#10 Run_SH = 0;	// Toggle Execute
   
#300 Run_SH = 1;
    ans_1a = (16'b1111_1110_0110_0011);
    if (Aval != ans_1a[15:8])
	 ErrorCnt++;
    if (Bval != ans_1a[7:0])
	 ErrorCnt++;

if (ErrorCnt == 0)
	$display("Success!");  // Command line output in ModelSim
else
	$display("%d error(s) detected. Try again!", ErrorCnt);
end
endmodule

module nntestbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk;
logic Reset, Run;
logic [28*28-1:0] img_data;
logic CE, UB, LB, OE, WE;
logic [19:0] ADDR;
logic [4:0] pred;
logic nn_flag;
logic [15:0] w_data;
logic [31:0] weight;

		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
nn u_nn(
	 .Clk(Clk),
	 .Rst(Reset),
	 .Start(Run),
    .data(img_data),
    .prediction(pred),
	 .resp(nn_flag),
	 .rdata(w_data),
	 .address(ADDR),
	 .w_(weight)
);


// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
	 img_data = 784'd0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST
Reset = 1;		// Toggle Rest
Run = 1;

#4 Reset = 0;

#4 Run = 0;
#4 Run = 1;


/* test 4
#100 S = 16'b1100;
#4 Continue = 0;
#4 Continue = 1;
#50 S = 16'b0011;
#4 Continue = 0;
#4 Continue = 1;
*/ 

/* test 5
#40 S = 16'b1011;
#4 Continue = 0;
#100 Continue = 1;
#4 Continue = 0;
#100 Continue = 1;
*/
end
endmodule

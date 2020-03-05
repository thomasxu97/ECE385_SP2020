module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1 
timeprecision 1ns;

// These signals are internal because the processor will be 
// instantiated as a submodule in testbench.
logic Clk;
logic Reset, Run, Continue;
logic [15:0] S;
logic [11:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7;
logic CE, UB, LB, OE, WE;
logic [19:0] ADDR;
wire [15:0] Data;
		
// Instantiating the DUT
// Make sure the module and signal names match with those in your design
lab6_toplevel lab6(.*);	

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST
Reset = 0;		// Toggle Rest
Run = 1;
Continue = 1;
S = 11;

#4 Reset = 1;

#4 Run = 0;
#4 Run = 1;

/* test 1
#4 S = 16'b1011;
# 50 Continue = 0;
# 4 Continue = 1;
*/


#100 S = 4;
#4 Continue = 0;
#4 Continue = 1;

for (int i=0; i< 10; i++) begin
	#100 Continue = 0;
	#4 Continue = 1;
end

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

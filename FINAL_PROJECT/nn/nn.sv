// top neural network
// input data 28 * 28 bit value

module nn (
    input logic data [28*28-1:0],
    input logic [31:0] w1 [28*28*30-1:0], 
    input logic [31:0] b1 [30-1:0], 
    input logic [31:0] w2 [30*15-1:0], 
    input logic [31:0] b2 [15-1:0], 
    input logic [31:0] w3 [15*10-1:0], 
    input logic [31:0] b3 [10-1:0]
    output logic [4:0] prediction
);

logic [31:0] z0 [28*28-1:0];
logic [31:0] m1 [28*28*30-1:0];
logic [31:0] z1 [30-1:0];
logic [31:0] a1 [30-1:0];
logic [31:0] m2 [30*15-1:0];
logic [31:0] z2 [15-1:0];
logic [31:0] a2 [15-1:0];
logic [31:0] m3 [15*10-1:0];
logic [31:0] z3 [10-1:0];

always_comb begin
    Genvar i, j, k;

    for (i=0; i<28*28; i=i+1) begin
        z0[i] = data[i] ? 32'h3F800000 : 32'h00000000;
    end

    for (i=0; i<28*28; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            multiplier multiplier (
                .a (z0[i]), 
                .b (w1[i*30+j]), 
                .f (m1[i*30+j])
            );
        end
    end

    


end

endmodule
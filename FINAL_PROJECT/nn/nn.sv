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

logic [31:0] d_first_layer [1155:0]; // 34*34*1 padding
logic [31:0] d_first_layer_out [21019:0]; // 34*34*32


always_comb begin
    Genvar i, j, k;

    for (i=0; i<28; i=i+1) begin
        for (j=0; j<28; j=j+1) begin
            d_first_layer[(i+3)*34+(j+3)] = data[i*28+j] ? 32'h3F800000 : 32'h00000000;
        end
    end

    for (i=0; i<28; i=i+1) begin
        for (j=0; j<28; j=j+1) begin
            for (k=0; k<32; k=k+1) begin
                conv conv (
                    .in (d_first_layer[])
                    .w ()
                    .out (d_first_layer_out)
                );
            end
        end
    end

end

endmodule
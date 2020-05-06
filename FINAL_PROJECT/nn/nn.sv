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
logic [31:0] m1 [1024*30-1:0];
logic [31:0] t1 [512*30-1:0];
logic [31:0] t2 [256*30-1:0];
logic [31:0] t3 [128*30-1:0];
logic [31:0] t4 [64*30-1:0];
logic [31:0] t5 [32*30-1:0];
logic [31:0] t6 [16*30-1:0];
logic [31:0] t7 [8*30-1:0];
logic [31:0] t8 [4*30-1:0];
logic [31:0] t9 [2*30-1:0];
logic [31:0] t10 [30-1:0];
logic [31:0] z1 [30-1:0];
logic [31:0] a1 [30-1:0];
logic [31:0] m2 [32*15-1:0];
logic [31:0] t11 [16*15-1:0];
logic [31:0] t12 [8*15-1:0];
logic [31:0] t13 [4*15-1:0];
logic [31:0] t14 [2*15-1:0];
logic [31:0] t15 [15-1:0];
logic [31:0] z2 [15-1:0];
logic [31:0] a2 [15-1:0];
logic [31:0] m3 [16*10-1:0];
logic [31:0] t16 [8*10-1:0];
logic [31:0] t17 [4*10-1:0];
logic [31:0] t18 [2*10-1:0];
logic [31:0] t19 [10-1:0];
logic [31:0] z3 [10-1:0];


generate
    genvar i, j;
    for (i=0; i<28*28; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            multiplier multiplier (
                .a (z0[i]), 
                .b (w1[i*30+j]), 
                .f (m1[i*30+j])
            );
        end
    end

    for (i=0; i<512; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (m1[i*60+j]),
                .b (m1[i*60+30+j]),
                .f (t1[i*30+j])
            );
        end
    end

    for (i=0; i<256; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t1[i*60+j]),
                .b (t1[i*60+30+j]),
                .f (t2[i*30+j])
            );
        end
    end

    for (i=0; i<128; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t2[i*60+j]),
                .b (t2[i*60+30+j]),
                .f (t3[i*30+j])
            );
        end
    end

    for (i=0; i<64; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t3[i*60+j]),
                .b (t3[i*60+30+j]),
                .f (t4[i*30+j])
            );
        end
    end

    for (i=0; i<32; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t4[i*60+j]),
                .b (t4[i*60+30+j]),
                .f (t5[i*30+j])
            );
        end
    end

    for (i=0; i<16; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t5[i*60+j]),
                .b (t5[i*60+30+j]),
                .f (t6[i*30+j])
            );
        end
    end

    for (i=0; i<8; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t6[i*60+j]),
                .b (t6[i*60+30+j]),
                .f (t7[i*30+j])
            );
        end
    end

    for (i=0; i<4; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t7[i*60+j]),
                .b (t7[i*60+30+j]),
                .f (t8[i*30+j])
            );
        end
    end

    for (i=0; i<2; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t8[i*60+j]),
                .b (t8[i*60+30+j]),
                .f (t9[i*30+j])
            );
        end
    end

    for (i=0; i<1; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            adder adder (
                .a (t9[i*60+j]),
                .b (t9[i*60+30+j]),
                .f (t10[i*30+j])
            );
        end
    end

    for (j=0; j<30; j=j+1) begin
        adder adder (
            .a (t10[j]),
            .b (b1[j]),
            .f (z1[j])
        );
    end

    for (j=0; j<30; j=j+1) begin
        relu relu (
            .a (z1[j]),
            .f (a1[j])
        );
    end

    for (i=0; i<30; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            multiplier multiplier (
                .a (z1[i]), 
                .b (w2[i*15+j]), 
                .f (m2[i*15+j])
            );
        end
    end

    for (i=0; i<16; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            adder adder (
                .a (m2[i*30+j]),
                .b (m2[i*30+15+j]),
                .f (t11[i*15+j])
            );
        end
    end

    for (i=0; i<8; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            adder adder (
                .a (t11[i*30+j]),
                .b (t11[i*30+15+j]),
                .f (t12[i*15+j])
            );
        end
    end

    for (i=0; i<4; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            adder adder (
                .a (t12[i*30+j]),
                .b (t12[i*30+15+j]),
                .f (t13[i*15+j])
            );
        end
    end

    for (i=0; i<2; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            adder adder (
                .a (t13[i*30+j]),
                .b (t13[i*30+15+j]),
                .f (t14[i*15+j])
            );
        end
    end

    for (i=0; i<1; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            adder adder (
                .a (t14[i*30+j]),
                .b (t14[i*30+15+j]),
                .f (t15[i*15+j])
            );
        end
    end

    for (j=0; j<15; j=j+1) begin
        adder adder (
            .a (t15[j]),
            .b (b2[j]),
            .f (z2[j])
        );
    end

    for (j=0; j<15; j=j+1) begin
        relu relu (
            .a (z2[j]),
            .f (a2[j])
        );
    end

    for (i=0; i<15; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            multiplier multiplier (
                .a (z2[i]), 
                .b (w3[i*10+j]), 
                .f (m3[i*10+j])
            );
        end
    end

    for (i=0; i<8; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            adder adder (
                .a (m3[i*20+j]),
                .b (m3[i*20+10+j]),
                .f (t16[i*10+j])
            );
        end
    end

    for (i=0; i<4; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            adder adder (
                .a (t16[i*20+j]),
                .b (t16[i*20+10+j]),
                .f (t17[i*10+j])
            );
        end
    end

    for (i=0; i<2; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            adder adder (
                .a (t17[i*20+j]),
                .b (t17[i*20+10+j]),
                .f (t18[i*10+j])
            );
        end
    end

    for (i=0; i<1; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            adder adder (
                .a (t18[i*20+j]),
                .b (t18[i*20+10+j]),
                .f (t19[i*10+j])
            );
        end
    end

    for (j=0; j<10; j=j+1) begin
        adder adder (
            .a (t19[j]),
            .b (b3[j]),
            .f (z3[j])
        );
    end
endgenerate

argmax argmax (
        .in (z3),
        .number (prediction)
    );


always_comb begin
    for (int i=0; i<28*28; i=i+1) begin
        z0[i] = data[i] ? 32'h3F800000 : 32'h00000000;
    end

    for (i=28*28; i<1024; i=i+1) begin
        for (j=0; j<30; j=j+1) begin
            m1[i*30+j] = 32'b0;
        end
    end

    for (i=30; i<32; i=i+1) begin
        for (j=0; j<15; j=j+1) begin
            m2[i*15+j] = 32'b0;
        end
    end

    for (i=15; i<16; i=i+1) begin
        for (j=0; j<10; j=j+1) begin
            m3[i*10+j] = 32'b0;
        end
    end

end

endmodule
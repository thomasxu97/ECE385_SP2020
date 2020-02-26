module alu #(parameter width = 16)
(
    input [3:0] opcode,
    input [width-1:0] a, b,
    output logic [width-1:0] f
);

always_comb
begin
    unique case (opcode)
        4'b0001:  f = a + b;
        4'b0101:  f = a & b;
        4'b1001:  f = ~a;
    endcase
end

endmodule : alu

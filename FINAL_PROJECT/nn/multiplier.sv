// ieee 754 multiplier
// no overflow situation considered

module multiplier {
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] f,
};

logic sign_a, sign_b, sign_f;
logic [8:0] exp_a, exp_b, exp_f;
logic [47:0] data_a, data_b, data_f;

assign sign_a = a[31];
assign sign_b = b[31];
assign exp_a = {1'b0, a[30:23]};
assign exp_b = {1'b0, b[30:23]};
assign data_a = {24'b0, 1'b1, a[22:0]};
assign data_b = {24'b0, 1'b1, b[22:0]};

assign sign_f = sign_a ^ sign_b;
assign data_f = data_a * data_b;
assign exp_f = exp_a + exp_b - 127 + 23 + data_f[47];

always_comb 
begin
    case(data_f[47])
        1'b1: f = {sign_f, exp_f[8:0], data_f[46:24]};
        1'b0: f = {sign_f, exp_f[8:0], data_f[45:23]};
    endcase
end

endmodule
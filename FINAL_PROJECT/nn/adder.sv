// ieee 754 adder

module adder (
    input logic [31:0] a, 
    input logic [31:0] b,
    output logic [31:0] f
);

logic sign_a, sign_b, sign_f;
logic [7:0] exp_a, exp_b, exp_f;
logic [25:0] data_a, data_b, data_f;

logic [25:0] align_a, align_b, align_f;
logic [25:0] signed_a, signed_b, signed_f;

assign sign_a = a[31];
assign sign_b = b[31];
assign exp_a = a[30:23];
assign exp_b = b[30:23];
assign data_a = {3'b001, a[22:0]};
assign data_b = {3'b001, b[22:0]};


assign align_a = (exp_a > exp_b) ? data_a : (data_a >> (exp_b - exp_a));
assign align_b = (exp_b > exp_a) ? data_b : (data_b >> (exp_a - exp_b));

assign signed_a = sign_a ? (~align_a + 1) : align_a;
assign signed_b = sign_b ? (~align_b + 1) : align_b;

assign signed_f = signed_a + signed_b;
assign sign_f = signed_f[25];
assign align_f = sign_f ? (~signed_f + 1) : signed_f;

assign exp_f = (exp_a > exp_b) ? exp_a : exp_b;

always_comb
begin
    casex (align_f[24:0])
        25'b1xxxxxxxxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f + 5'd1), align_f[23:1]};
        25'b01xxxxxxxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f + 5'd0), align_f[22:0]};
        25'b001xxxxxxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd1), align_f[21:0], 1'b0};
        25'b0001xxxxxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd2), align_f[20:0], 2'b0};
        25'b00001xxxxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd3), align_f[19:0], 3'b0};
        25'b000001xxxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd4), align_f[18:0], 4'b0};
        25'b0000001xxxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd5), align_f[17:0], 5'b0};
        25'b00000001xxxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd6), align_f[16:0], 6'b0};
        25'b000000001xxxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd7), align_f[15:0], 7'b0};
        25'b0000000001xxxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd8), align_f[14:0], 8'b0};
        25'b00000000001xxxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd9), align_f[13:0], 9'b0};
        25'b000000000001xxxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd10), align_f[12:0], 10'b0};
        25'b0000000000001xxxxxxxxxxxx : f = {sign_f, (exp_f - 5'd11), align_f[11:0], 11'b0};
        25'b00000000000001xxxxxxxxxxx : f = {sign_f, (exp_f - 5'd12), align_f[10:0], 12'b0};
        25'b000000000000001xxxxxxxxxx : f = {sign_f, (exp_f - 5'd13), align_f[9:0], 13'b0};
        25'b0000000000000001xxxxxxxxx : f = {sign_f, (exp_f - 5'd14), align_f[8:0], 14'b0};
        25'b00000000000000001xxxxxxxx : f = {sign_f, (exp_f - 5'd15), align_f[7:0], 15'b0};
        25'b000000000000000001xxxxxxx : f = {sign_f, (exp_f - 5'd16), align_f[6:0], 16'b0};
        25'b0000000000000000001xxxxxx : f = {sign_f, (exp_f - 5'd17), align_f[5:0], 17'b0};
        25'b00000000000000000001xxxxx : f = {sign_f, (exp_f - 5'd18), align_f[4:0], 18'b0};
        25'b000000000000000000001xxxx : f = {sign_f, (exp_f - 5'd19), align_f[3:0], 19'b0};
        25'b0000000000000000000001xxx : f = {sign_f, (exp_f - 5'd20), align_f[2:0], 20'b0};
        25'b00000000000000000000001xx : f = {sign_f, (exp_f - 5'd21), align_f[1:0], 21'b0};
        25'b000000000000000000000001x : f = {sign_f, (exp_f - 5'd22), align_f[0:0], 22'b0};
        25'b0000000000000000000000001 : f = {sign_f, (exp_f - 5'd23), 23'b0};
        25'b0000000000000000000000000 : f = 32'b0;
    endcase
end








endmodule
module ir #(parameter width = 16)
(
    input Clk,
    input Reset,
    input LD_IR,
    input [width-1:0] in,
    output [3:0] opcode,
    output [2:0] DR,
    output [2:0] SR1,
    output [2:0] SR2,
    output [4:0] imm5,
    output [8:0] PCoffset9,
    output [10:0] PCoffset11,
    output [5:0] offset6,
    output [11:0] ledVect12,
    output [width-1:0] out
);

logic [width-1:0] data;

assign opcode = data[15:12];
assign DR = data[11:9];
assign SR1 = data[8:6];
assign SR2 = data[2:0];
assign imm5 = data[4:0];
assign PCoffset9 = data[8:0];
assign PCoffset11 = data[10:0];
assign offset6 = data[5:0];
assign ledVect12 = data[11:0];
assign out = data;

always_ff @(posedge Clk)
begin
    if (Reset)
    begin
        data <= '0;
    end
    else if (LD_IR)
    begin
        data <= in;
    end
    else
    begin
        data <= data;
    end
end

endmodule : ir

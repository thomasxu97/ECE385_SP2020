module datapath #(parameter width = 16)
(
    input Clk,
    input Reset,
    input LD_PC,
    input LD_IR,
    input LD_REGF,
    input LD_MDR,
    input LD_MAR,
    input LD_NZP,
    input LD_LED,
    input [width-1:0] MDR_in,
    input [1:0] pcmux_sel,
    input [1:0] regfilemux_sel,
    input mdrmux_sel,
    input marmux_sel,
    input alumux1_sel,
    input [2:0] alumux2_sel,
    output [width-1:0] PC_out,
    output [width-1:0] MDR_out,
    output [width-1:0] address,
    output [width-1:0] IR_out,
    output BEN
);


//signals

logic [width-1:0] pcmux_out;

logic [3:0] opcode;
logic [2:0] DR;
logic [2:0] SR1;
logic [2:0] SR2;
logic [4:0] imm5;
logic [8:0] PCoffset9;
logic [10:0] PCoffset11;
logic [5:0] offset6;
logic [11:0] ledVect12;

logic [width-1:0] regfilemux_out;
logic [width-1:0] RA;
logic [width-1:0] RB;

logic [width-1:0] MAR_out;
logic [width-1:0] marmux_out;
logic [width-1:0] mdrmux_out;
logic [2:0] nzp_out;

logic [width-1:0] alumux1_out;
logic [width-1:0] alumux2_out;
logic [width-1:0] alu_out;

assign BEN = ((nzp_out & DR) != 0) & (opcode == 4'b0000);
assign address = (LD_LED) ? 16'hFFF : MAR_out;

ir IR(
    .Clk (Clk),
    .Reset (Reset),
    .LD_IR (LD_IR),
    .in (MDR_out),
    .opcode (opcode),
    .DR (DR),
    .SR1 (SR1),
    .SR2 (SR2),
    .imm5 (imm5),
    .PCoffset9 (PCoffset9),
    .PCoffset11 (PCoffset11),
    .offset6 (offset6),
    .ledVect12 (ledVect12),
    .out (IR_out)
);

pc_register PC(
    .Clk (Clk),
    .Reset (Reset),
    .LD_PC (LD_PC),
    .in (pcmux_out),
    .out (PC_out)
);

regfile regfile(
    .Clk (Clk),
    .Reset (Reset),
    .LD_REGF (LD_REGF),
    .in (regfilemux_out),
    .SR1 (SR1),
    .SR2 (SR2),
    .DR (DR),
    .RA (RA),
    .RB (RB)
);

register MDR(
    .Clk (Clk),
    .Reset (Reset),
    .LD (LD_MDR),
    .in (mdrmux_out),
    .out (MDR_out)
);

register MAR(
    .Clk (Clk),
    .Reset (Reset),
    .LD (LD_MAR),
    .in (marmux_out),
    .out (MAR_out)
);

nzp NZP(
    .Clk (Clk),
    .Reset (Reset),
    .LD (LD_NZP),
    .in (regfilemux_out),
    .nzp (nzp_out)
);

alu ALU(
    .opcode (opcode),
    .a (alumux1_out),
    .b (alumux2_out),
    .f (alu_out)
);

always_comb begin : MUXES
    case (pcmux_sel)
        2'b00: pcmux_out = PC_out + 1;
        2'b01: pcmux_out = RA;
        2'b10: pcmux_out = alu_out;
        default: pcmux_out = PC_out + 1;
    endcase

    case (regfilemux_sel)
        2'b00: regfilemux_out = alu_out;
        2'b01: regfilemux_out = MDR_out;
        2'b10: regfilemux_out = PC_out;
        default: regfilemux_out = alu_out;
    endcase

    case (alumux1_sel)
        1'b0: alumux1_out = RA;
        1'b1: alumux1_out = PC_out;
    endcase

    case (alumux2_sel)
        3'b000: alumux2_out = RB;
        3'b001: alumux2_out = $signed(imm5);
        3'b010: alumux2_out = $signed(PCoffset9);
        3'b011: alumux2_out = $signed(PCoffset11);
        3'b100: alumux2_out = $signed(offset6);
        default: alumux2_out = RB;
    endcase

    case (marmux_sel)
        1'b0: marmux_out = PC_out;
        1'b1: marmux_out = alu_out;
    endcase

    case (mdrmux_sel)
        1'b0: mdrmux_out = MDR_in;
        1'b1: mdrmux_out = RA;
    endcase
end

endmodule
module regfile #(parameter width = 16)
(
    input Clk,
    input Reset,
    input LD_REGF,
    input [width-1:0] in,
    input [2:0] SR1, SR2, DR,
    output logic [width-1:0] RA, RB
);

logic [width-1:0] data [8];

always_ff @(posedge Clk)
begin
    if (Reset)
    begin
        for (int i=0; i<8; i=i+1) begin
            data[i] <= '0;
        end
    end
    else if (LD_REGF)
    begin
        data[DR] <= in;
    end
end

always_comb
begin
    RA = data[SR1];
    RB = data[SR2];
end

endmodule : regfile

module pc_register #(parameter width = 16)
(
    input Clk,
    input Reset,
    input LD_PC,
    input [width-1:0] in,
    output logic [width-1:0] out
);

// PC needs to start at 0

logic [width-1:0] data;

always_ff @(posedge Clk)
begin
    if (Reset)
    begin
        data <= '0;
    end
    else if (LD_PC)
    begin
        data <= in;
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    out = data;
end

endmodule : pc_register

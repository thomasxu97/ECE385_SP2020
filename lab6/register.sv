module register #(parameter width = 16)
(
    input Clk,
    input Reset,
    input LD,
    input [width-1:0] in,
    output logic [width-1:0] out
);

logic [width-1:0] data;

always_ff @(posedge Clk)
begin
    if (Reset)
    begin
        data <= '0;
    end
    else if (LD)
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

endmodule : register

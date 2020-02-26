module nzp #(parameter width = 16)
(
    input Clk,
    input Reset,
    input LD,
    input [width-1:0] in,
    output logic [2:0] nzp
);

logic [2:0] data;

always_ff @(posedge Clk)
begin
    if (Reset)
    begin
        data <= 3'b0;
    end
    else if (LD)
    begin
        data <= (in > 0)? 3'b001 : ((in < 0) ? 3'b100 : 3'b010);
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    nzp = data;
end

endmodule : nzp

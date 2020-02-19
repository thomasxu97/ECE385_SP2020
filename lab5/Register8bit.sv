module Register8bit(
    input logic[7:0] Din,
    input logic Clk,
    input logic Shift,
    input logic Clear,
    input logic Load,
    input logic ShiftIn,

    output logic[7:0] Dout,
    output logic ShiftOut
);

always_ff @(posedge Clk or posedge Clear)
    begin
        if (Clear) Dout <= 8'h00;
        else if (Load) Dout <= Din;
        else if (Shift)
        begin
            Dout[0] <= Dout[1];
            Dout[1] <= Dout[2];
            Dout[2] <= Dout[3];
            Dout[3] <= Dout[4];
            Dout[4] <= Dout[5];
            Dout[5] <= Dout[6];
            Dout[6] <= Dout[7];
            Dout[7] <= ShiftIn;
        end
    end

    assign ShiftOut = Dout[0];
endmodule

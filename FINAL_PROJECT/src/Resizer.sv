// resize the 280*280 image into 28*28
module Resizer(
    input logic iClk,
    input logic iReset,
    input logic [7:0]  iPixel,
    output logic [7:0] oPixel,
    output logic orequest,
    output logic [19:0] sram_addr;
    output logic oClk;
);

logic [15:0] pxl_cont;
logic [7:0] c_cont;
logic [7:0] counter;
logic [7:0] clk_counter;
logic [31:0] sum;
logic slow_clk;

assign oClk <= slow_clk;
// clock generator the slow clock is 10 times slower the input clock
always_ff @(posedge iClk) begin
    if (iReset) begin
        clk_counter <= 8'd0;
    end
    else if (clk_counter < 4) begin
        clk_counter <= clk_counter + 1'd1;
    end else begin
        slow_clk <= ~slow_clk;
        clk_counter <= 8'd0;
    end
end
// pixel position generator
always_ff @(posedge slow_clk) begin
    pxl_cont <= pxl_cont + 1'd1;
    if (c_cont == 27) begin
        c_cont <= 8'd0;
    end else begin
        c_cont <= c_cont +1'd1;
    end
    if (pxl_cont == 28*28-1) begin
        pxl_cont <= 8'd0;
    end
end
// new pixel generator
always_ff @(posedge iClk) begin
    if (iReset) begin
        r_cont <= 0;
        c_cont <= 0;
        counter <= 0;
        sum <= 0;
    end
    else if (counter == 9) begin
        oPixel <= sum/10;
        counter <= 0;
    end
    else begin
        sum <= sum + iPixel;
        counter <= counter + 1'd1;
    end
    
end
endmodule
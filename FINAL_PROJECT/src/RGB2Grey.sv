module RGB2Grey(
    input   logic   [7:0]   iRed,
    input   logic   [7:0]   iGreen,
    input   logic   [7:0]   iBlue,
    output  logic   [7:0]   ogrey
);
assign ogrey = (iBlue+iRed+iGreen)/3;
endmodule
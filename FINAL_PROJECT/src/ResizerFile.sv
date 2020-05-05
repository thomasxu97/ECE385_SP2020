module ResizerFile(
    input logic Clk, Reset, isStore,
    input logic [12:0] x_cont, y_cont,
    input logic [7:0] ipixel,
    output logic opixel,
    output logic [7:0] oX_pos, oY_pos,
	 output logic wr_pxl
);
parameter threshold = 127;
logic pxl_flag_1;
logic pxl_flag_2;
logic pxl_flag_3;
logic pxl_flag_4;
logic pxl_flag_5;
logic pxl_flag_6;
logic pxl_flag_7;
logic pxl_flag_8;
logic pxl_flag_9;
logic pxl_flag_10;
logic pxl_flag_11;
logic pxl_flag_12;
logic pxl_flag_13;
logic pxl_flag_14;
logic pxl_flag_15;
logic pxl_flag_16;
logic pxl_flag_17;
logic pxl_flag_18;
logic pxl_flag_19;
logic pxl_flag_20;
logic pxl_flag_21;
logic pxl_flag_22;
logic pxl_flag_23;
logic pxl_flag_24;
logic pxl_flag_25;
logic pxl_flag_26;
logic pxl_flag_27;
logic pxl_flag_28;
logic opixel_1;
logic opixel_2;
logic opixel_3;
logic opixel_4;
logic opixel_5;
logic opixel_6;
logic opixel_7;
logic opixel_8;
logic opixel_9;
logic opixel_10;
logic opixel_11;
logic opixel_12;
logic opixel_13;
logic opixel_14;
logic opixel_15;
logic opixel_16;
logic opixel_17;
logic opixel_18;
logic opixel_19;
logic opixel_20;
logic opixel_21;
logic opixel_22;
logic opixel_23;
logic opixel_24;
logic opixel_25;
logic opixel_26;
logic opixel_27;
logic opixel_28;
logic wr_flag1;
logic wr_flag2;
logic wr_flag3;
logic wr_flag4;
logic wr_flag5;
logic wr_flag6;
logic wr_flag7;
logic wr_flag8;
logic wr_flag9;
logic wr_flag10;
logic wr_flag11;
logic wr_flag12;
logic wr_flag13;
logic wr_flag14;
logic wr_flag15;
logic wr_flag16;
logic wr_flag17;
logic wr_flag18;
logic wr_flag19;
logic wr_flag20;
logic wr_flag21;
logic wr_flag22;
logic wr_flag23;
logic wr_flag24;
logic wr_flag25;
logic wr_flag26;
logic wr_flag27;
logic wr_flag28;
logic [7:0] counter;
AvgResizer #(.XSTART(0), .XEND(9), .thed(threshold)) 		ar1(.*,.opixel(opixel_1), .oflag(pxl_flag_1), .wflag(wr_flag1));
AvgResizer #(.XSTART(10), .XEND(19), .thed(threshold))	ar2(.*,.opixel(opixel_2), .oflag(pxl_flag_2), .wflag(wr_flag2));
AvgResizer #(.XSTART(20), .XEND(29), .thed(threshold))	ar3(.*,.opixel(opixel_3), .oflag(pxl_flag_3), .wflag(wr_flag3));
AvgResizer #(.XSTART(30), .XEND(39), .thed(threshold))	ar4(.*,.opixel(opixel_4), .oflag(pxl_flag_4), .wflag(wr_flag4));
AvgResizer #(.XSTART(40), .XEND(49), .thed(threshold))	ar5(.*,.opixel(opixel_5), .oflag(pxl_flag_5), .wflag(wr_flag5));
AvgResizer #(.XSTART(50), .XEND(59), .thed(threshold))	ar6(.*,.opixel(opixel_6), .oflag(pxl_flag_6), .wflag(wr_flag6));
AvgResizer #(.XSTART(60), .XEND(69), .thed(threshold))	ar7(.*,.opixel(opixel_7), .oflag(pxl_flag_7), .wflag(wr_flag7));
AvgResizer #(.XSTART(70), .XEND(79), .thed(threshold))	ar8(.*,.opixel(opixel_8), .oflag(pxl_flag_8), .wflag(wr_flag8));
AvgResizer #(.XSTART(80), .XEND(89), .thed(threshold))	ar9(.*,.opixel(opixel_9), .oflag(pxl_flag_9), .wflag(wr_flag9));
AvgResizer #(.XSTART(90), .XEND(99), .thed(threshold))	ar10(.*,.opixel(opixel_10), .oflag(pxl_flag_10), .wflag(wr_flag10));
AvgResizer #(.XSTART(100), .XEND(109), .thed(threshold))	ar11(.*,.opixel(opixel_11), .oflag(pxl_flag_11), .wflag(wr_flag11));
AvgResizer #(.XSTART(110), .XEND(119), .thed(threshold))	ar12(.*,.opixel(opixel_12), .oflag(pxl_flag_12), .wflag(wr_flag12));
AvgResizer #(.XSTART(120), .XEND(129), .thed(threshold))	ar13(.*,.opixel(opixel_13), .oflag(pxl_flag_13), .wflag(wr_flag13));
AvgResizer #(.XSTART(130), .XEND(139), .thed(threshold))	ar14(.*,.opixel(opixel_14), .oflag(pxl_flag_14), .wflag(wr_flag14));
AvgResizer #(.XSTART(140), .XEND(149), .thed(threshold))	ar15(.*,.opixel(opixel_15), .oflag(pxl_flag_15), .wflag(wr_flag15));
AvgResizer #(.XSTART(150), .XEND(159), .thed(threshold))	ar16(.*,.opixel(opixel_16), .oflag(pxl_flag_16), .wflag(wr_flag16));
AvgResizer #(.XSTART(160), .XEND(169), .thed(threshold))	ar17(.*,.opixel(opixel_17), .oflag(pxl_flag_17), .wflag(wr_flag17));
AvgResizer #(.XSTART(170), .XEND(179), .thed(threshold))	ar18(.*,.opixel(opixel_18), .oflag(pxl_flag_18), .wflag(wr_flag18));
AvgResizer #(.XSTART(180), .XEND(189), .thed(threshold))	ar19(.*,.opixel(opixel_19), .oflag(pxl_flag_19), .wflag(wr_flag19));
AvgResizer #(.XSTART(190), .XEND(199), .thed(threshold))	ar20(.*,.opixel(opixel_20), .oflag(pxl_flag_20), .wflag(wr_flag20));
AvgResizer #(.XSTART(200), .XEND(209), .thed(threshold))	ar21(.*,.opixel(opixel_21), .oflag(pxl_flag_21), .wflag(wr_flag21));
AvgResizer #(.XSTART(210), .XEND(219), .thed(threshold))	ar22(.*,.opixel(opixel_22), .oflag(pxl_flag_22), .wflag(wr_flag22));
AvgResizer #(.XSTART(220), .XEND(229), .thed(threshold))	ar23(.*,.opixel(opixel_23), .oflag(pxl_flag_23), .wflag(wr_flag23));
AvgResizer #(.XSTART(230), .XEND(239), .thed(threshold))	ar24(.*,.opixel(opixel_24), .oflag(pxl_flag_24), .wflag(wr_flag24));
AvgResizer #(.XSTART(240), .XEND(249), .thed(threshold))	ar25(.*,.opixel(opixel_25), .oflag(pxl_flag_25), .wflag(wr_flag25));
AvgResizer #(.XSTART(250), .XEND(259), .thed(threshold))	ar26(.*,.opixel(opixel_26), .oflag(pxl_flag_26), .wflag(wr_flag26));
AvgResizer #(.XSTART(260), .XEND(269), .thed(threshold))	ar27(.*,.opixel(opixel_27), .oflag(pxl_flag_27), .wflag(wr_flag27));
AvgResizer #(.XSTART(270), .XEND(279), .thed(threshold))	ar28(.*,.opixel(opixel_28), .oflag(pxl_flag_28), .wflag(wr_flag28));

assign oX_pos = x_cont/10;
assign oY_pos = y_cont/10;
assign wr_pxl = (wr_flag1 || wr_flag2 || wr_flag3 || wr_flag4 || wr_flag5 || wr_flag6 ||
						wr_flag7 || wr_flag8 || wr_flag9 || wr_flag10 || wr_flag11 || wr_flag12||
						wr_flag13 || wr_flag14|| wr_flag15 || wr_flag16 || wr_flag17 || wr_flag18 ||
						wr_flag19 || wr_flag20 || wr_flag21 || wr_flag22 || wr_flag23 || wr_flag24 ||
						wr_flag25 || wr_flag26 || wr_flag27 || wr_flag28) ? 1'd1:1'd0;
always_ff @(posedge Clk) begin 
	 if (Reset) begin
		opixel <= 1'dz;
		counter <= 8'd0;
	 end
	 if (counter == 28) begin
		opixel <= 1'dz;
		counter <= 8'd0;
	 end
    if (pxl_flag_1) begin
		opixel <= opixel_1;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_2) begin 
		opixel <= opixel_2;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_3) begin
		opixel <= opixel_3;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_4) begin
		opixel <= opixel_4;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_5) begin
		opixel <= opixel_5;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_6) begin
		opixel <= opixel_6;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_7) begin
		opixel <= opixel_7;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_8) begin
		opixel <= opixel_8;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_9) begin
		opixel <= opixel_9;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_10) begin
		opixel <= opixel_10;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_11) begin
		opixel <= opixel_11;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_12) begin
		opixel <= opixel_12;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_13) begin
		opixel <= opixel_13;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_14) begin
		opixel <= opixel_14;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_15) begin
		opixel <= opixel_15;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_16) begin
		opixel <= opixel_16;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_17) begin
		opixel <= opixel_17;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_18) begin
		opixel <= opixel_18;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_19) begin
		opixel <= opixel_19;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_20) begin
		opixel <= opixel_20;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_21) begin
		opixel <= opixel_21;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_22) begin
		opixel <= opixel_22;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_23) begin
		opixel <= opixel_23;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_24) begin
		opixel <= opixel_24;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_25) begin
		opixel <= opixel_25;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_26) begin
		opixel <= opixel_26;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_27) begin
		opixel <= opixel_27;
		counter <= counter + 1'd1;
	 end
    else if (pxl_flag_28) begin
		opixel <= opixel_28;			
		counter <= counter + 1'd1;
	 end
end
endmodule 

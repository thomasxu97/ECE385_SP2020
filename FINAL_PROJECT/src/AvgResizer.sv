// Take in a 10*10 grey scale image 
// resize it to 1*1 black/white bilevel pixel
module AvgResizer #(XSTART = 0, XEND = 9, thed = 127)(
    input logic Clk, Reset, isStore,
    input logic [12:0] x_cont, 
    input logic [7:0] ipixel,
    output logic opixel,
    output logic oflag,
	 output logic wflag
);
logic [7:0] pxl_counter;
logic [7:0] counter;

always_ff @(posedge Clk) begin
    if (Reset) begin
        pxl_counter <= 0;
		  counter <= 0;
	 end
    else if (isStore && x_cont >= XSTART && x_cont <= XEND) begin
		  if (pxl_counter == 99) begin
				pxl_counter <= 8'd0;
				counter <= 1'd0;
			end
        else if (pxl_counter < 99 && ipixel < thed) pxl_counter <= pxl_counter + 1'd1;
        else begin
				counter <= counter + 1'd1;
				pxl_counter <= pxl_counter + 1'd1;
		  end
    end
end

always_ff @(posedge Clk) begin
	if (pxl_counter == 99) begin
		oflag <= 1'd1;
	end
	else oflag <= 1'd0;
	if (counter >= 50) opixel <= 1'd1;
	else opixel <= 1'd0;
end

always_ff @(posedge Clk) begin
	if (oflag == 1'd1) 
		wflag <= 1'd1;
	else 
		wflag <= 1'd0;
end
endmodule
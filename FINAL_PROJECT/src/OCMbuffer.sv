module OCMbuffer(
    input Clk_w, Clk_r,Reset,
	 input write,
	 input read,
    input logic ipixel,
    input logic [7:0] x_w,x_r,
    input logic [7:0] y_w,y_r,
    output logic opixel
);

logic buffer[0:28*28-1];
logic [9:0] writeAddress, readAddress;

assign writeAddress = x_w + y_w* 5'd28;
assign readAddress = x_r + y_r* 5'd28;


always_ff @ (posedge Clk_w) begin
	if (Reset) begin
		for (int i =0; i <= 783; i++) begin
			buffer[i] <= 1'd0;
		end
	end
	if (write)
		buffer[writeAddress] <= ipixel;
end

always_ff @ (posedge Clk_r) begin
   if (read)
		opixel <= buffer[readAddress];
end

endmodule
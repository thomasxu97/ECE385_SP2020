module OCMbuffer(
    input Clk,Reset,
	 input write,
    input logic ipixel,
    output logic [28*28-1:0] odata,
	 output logic ready
);

logic [28*28-1:0]buffer;
logic [9:0] writeAddr, nextAddr;

always_comb begin
	nextAddr = writeAddr + 10'd1;
	if (nextAddr == 10'd784) begin
		nextAddr = 10'd0;
	end
end
always_ff @ (posedge Clk) begin
	if (Reset) begin
		for (int i =0; i <= 783; i++) begin
			buffer[i] <= 1'd0;
		end
		writeAddr <= 10'd0;
		ready <= 1'd0;
	end
	if (write) begin
		buffer[writeAddr] <= ipixel;
		writeAddr <= nextAddr;
	end
	if (nextAddr == 10'd784) 
		ready <= 1'd1;
	else 
		ready <= 1'd0;
end

always_ff @ (posedge Clk) begin
   if (ready)
		odata <= buffer;
end

endmodule
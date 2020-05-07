// snip the center 280*280 pixels
module Snipper (
	 input logic 							iClk, iRst,
	 input logic 							isdisplay,
    input logic     [12:0]          X_coord,
    input logic     [12:0]          Y_coord,
    output logic    [12:0]				oX_cont, oY_cont,
	 output logic 							isstore
);
// define parameters
////	Horizontal Parameter	( Pixel )
parameter	X_START = 260;
parameter   X_END = 540;
parameter   Y_START = 160;
parameter   Y_END = 440;

always_ff @(posedge iClk) begin
	if (iRst) begin
		oX_cont <= 13'd0;
		oY_cont <= 13'd0;
		isstore <= 1'd0;
	end
	else begin
		if (isdisplay && X_coord >= X_START && X_coord <= X_END 
				&& Y_coord >= Y_START && Y_coord <= Y_END) begin
				oX_cont <= oX_cont + 1'd1;
			if (oX_cont == 279) begin
				oX_cont <= 13'd0;
				oY_cont <= oY_cont + 1'd1;
			end
			else if (oY_cont == 279) begin
				oY_cont <= 13'd0;
			end
			isstore <= 1'd1;
		end
	end
end

//always_comb begin
//	isstore = 1'b0;
//	if (isdisplay && X_coord >= X_START && X_coord <= X_END 
//					&& Y_coord >= Y_START && Y_coord <= Y_END) begin
//		isstore = 1'b1;
//	end
//end
endmodule
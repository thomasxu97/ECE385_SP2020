// --------------------------------------------------------------------
// Copyright (c) 2010 by Terasic Technologies Inc. 
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// --------------------------------------------------------------------
//           
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	VGA_Controller
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny FAN Peli Li:| 22/07/2010:| Initial Revision
// --------------------------------------------------------------------

module	VGA_Controller(	//	Host Side
						iRed,
						iGreen,
						iBlue,
						oRequest,
						//	VGA Side
						oVGA_R,
						oVGA_G,
						oVGA_B,
						oVGA_H_SYNC,
						oVGA_V_SYNC,
						oVGA_SYNC,
						oVGA_BLANK,

						//	Control Signal
						iCLK,
						iRST_N,
						iZOOM_MODE_SW,
                        // coordinates
                  x_pos,
                  y_pos,
                  isdisplay,
						result
);
 // SVGA_800x600p60
////	Horizontal Parameter	( Pixel )
parameter	H_SYNC_CYC	=	128;         //Peli
parameter	H_SYNC_BACK	=	88;
parameter	H_SYNC_ACT	=	800;	
parameter	H_SYNC_FRONT=	40;
parameter	H_SYNC_TOTAL=	1056;
//	Virtical Parameter		( Line )
parameter	V_SYNC_CYC	=	4;
parameter	V_SYNC_BACK	=	23;
parameter	V_SYNC_ACT	=	600;	
parameter	V_SYNC_FRONT=	1;
parameter	V_SYNC_TOTAL=	628;

//	Start Offset
parameter	X_START		=	H_SYNC_CYC+H_SYNC_BACK;
parameter	Y_START		=	V_SYNC_CYC+V_SYNC_BACK;

parameter	LX_START = 260+X_START;
parameter   LX_END = 540+X_START;
parameter   LY_START = 160+Y_START;
parameter   LY_END = 440+Y_START;
/////////// I/O specification /////////////
//	Host Side
input		[9:0]	iRed;
input		[9:0]	iGreen;
input		[9:0]	iBlue;
output	reg			oRequest;
//	VGA Side
output	reg	[9:0]	oVGA_R;
output	reg	[9:0]	oVGA_G;
output	reg	[9:0]	oVGA_B;
output	reg			oVGA_H_SYNC;
output	reg			oVGA_V_SYNC;
output	reg			oVGA_SYNC;
output	reg			oVGA_BLANK; 
output  reg [12:0]  x_pos;
output  reg [12:0]  y_pos;
output  reg         isdisplay;
input 	[4:0] 		result;   
//	Control Signal
input				iCLK;
input				iRST_N;
input 				iZOOM_MODE_SW;
//////////// Wire/ Reg declare /////////////
wire		[9:0]	mVGA_R;
wire		[9:0]	mVGA_G;
wire		[9:0]	mVGA_B;
reg					mVGA_H_SYNC;
reg					mVGA_V_SYNC;
wire				mVGA_SYNC;
wire				mVGA_BLANK;
//	Internal Registers and Wires
reg		[12:0]		H_Cont;
reg		[12:0]		V_Cont;

wire	[12:0]		v_mask;
reg 	[4:0] 		epred;
///////// Font module ///////////////////
wire 				font_on;
parameter		FONT_ON_X_A = 368+X_START;
parameter		FONT_ON_X_N = 368+X_START+10;
parameter		FONT_ON_X_S = 368+X_START+20;
parameter		FONT_ON_X_W = 368+X_START+30;
parameter		FONT_ON_X_E = 368+X_START+40;
parameter		FONT_ON_X_R = 368+X_START+50;
parameter		FONT_ON_X_COL = 368+X_START+60;
parameter		FONT_ON_X_P = 368+X_START+80;
parameter		FONT_ON_Y = 500+Y_START;
parameter		FONT_SIZE_X = 8;
parameter		FONT_SIZE_Y = 16;

wire [10:0]		sprite_addr;
wire [7:0]		sprite_data;
font_rom 	u_fr (.addr(sprite_addr), .data(sprite_data));
always @(posedge iCLK) begin
	case(result)
		5'd0: epred <= 'h30;
		5'd1: epred <= 'h31;
		5'd2: epred <= 'h32;
		5'd3: epred <= 'h33;
		5'd4: epred <= 'h34;
		5'd5: epred <= 'h35;
		5'd6: epred <= 'h36;
		5'd7: epred <= 'h37;
		5'd8: epred <= 'h38;
		5'd9: epred <= 'h39;
		default: epred <= 'h23;
	endcase
end 



always @(*) begin
	if (H_Cont >= FONT_ON_X_A && H_Cont < FONT_ON_X_A + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h41);
	end 
	else if (H_Cont >= FONT_ON_X_N && H_Cont < FONT_ON_X_N + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h4e);
	end 
	else if (H_Cont >= FONT_ON_X_S && H_Cont < FONT_ON_X_S + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h53);
	end 
	else if (H_Cont >= FONT_ON_X_W && H_Cont < FONT_ON_X_W + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h57);
	end 
	else if (H_Cont >= FONT_ON_X_E && H_Cont < FONT_ON_X_E + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h45);
	end 
	else if (H_Cont >= FONT_ON_X_R && H_Cont < FONT_ON_X_R + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h52);
	end 
	else if (H_Cont >= FONT_ON_X_COL && H_Cont < FONT_ON_X_COL + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*'h3a);
	end 
	else if (H_Cont >= FONT_ON_X_P && H_Cont < FONT_ON_X_P + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y) begin
		font_on = 1'b1;
		sprite_addr = (V_Cont - FONT_ON_Y + 16*(epred+'h20));
	end 
	else begin
		font_on = 1'b0;
		sprite_addr = 10'd0;
	end
end

/////////////logic block /////////////////////
assign v_mask = 13'd0 ;//iZOOM_MODE_SW ? 13'd0 : 13'd26;

assign	mVGA_BLANK	=	mVGA_H_SYNC & mVGA_V_SYNC;
assign	mVGA_SYNC	=	1'b0;
					
always @(*) begin 
	mVGA_R = 0;
	mVGA_G = 0;
	mVGA_B = 0;
	if (	H_Cont>=X_START 	&& H_Cont<X_START+H_SYNC_ACT &&
			V_Cont>=Y_START+v_mask 	&& V_Cont<Y_START+V_SYNC_ACT ) begin
			if (H_Cont>=LX_START 	&& H_Cont<LX_END &&
					V_Cont>=LY_START 	&& V_Cont<LY_END ) begin
				mVGA_R = iRed;
				mVGA_G = iGreen;
				mVGA_B = iBlue;
			end
			else begin
				mVGA_R = iRed/2;
				mVGA_G = iGreen/2;
				mVGA_B = iBlue/2;
			end
	end
	if (H_Cont >= FONT_ON_X_A && H_Cont < FONT_ON_X_A + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_A] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_N && H_Cont < FONT_ON_X_N + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_N] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_S && H_Cont < FONT_ON_X_S + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_S] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_W && H_Cont < FONT_ON_X_W + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_W] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_E && H_Cont < FONT_ON_X_E + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_E] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_R && H_Cont < FONT_ON_X_R + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_R] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_COL && H_Cont < FONT_ON_X_COL + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_COL] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
	else if (H_Cont >= FONT_ON_X_P && H_Cont < FONT_ON_X_P + FONT_SIZE_X &&
		V_Cont >= FONT_ON_Y && V_Cont < FONT_ON_Y + FONT_SIZE_Y && sprite_data[H_Cont - FONT_ON_X_P] == 1'b1) begin
		mVGA_R = 10'd255;
		mVGA_G = 10'd255;
		mVGA_B = 10'd255;
	end 
end 
						
always@(posedge iCLK or negedge iRST_N)
	begin
		if (!iRST_N)
			begin
				oVGA_R <= 0;
				oVGA_G <= 0;
                oVGA_B <= 0;
				oVGA_BLANK <= 0;
				oVGA_SYNC <= 0;
				oVGA_H_SYNC <= 0;
				oVGA_V_SYNC <= 0; 
			end
		else
			begin
				oVGA_R <= mVGA_R;
				oVGA_G <= mVGA_G;
            oVGA_B <= mVGA_B;
				oVGA_BLANK <= mVGA_BLANK;
				oVGA_SYNC <= mVGA_SYNC;
				oVGA_H_SYNC <= mVGA_H_SYNC;
				oVGA_V_SYNC <= mVGA_V_SYNC;				
			end               
	end

// x,y coordinates generator
always@(posedge iCLK)
begin
    if (H_Cont>=X_START && H_Cont<X_START+H_SYNC_ACT &&
		V_Cont>=Y_START+v_mask 	&& V_Cont<Y_START+V_SYNC_ACT ) begin
        x_pos <= H_Cont - X_START;
        y_pos <= V_Cont - Y_START-v_mask;
        isdisplay <= 1'd1;
    end else begin
        x_pos <= 13'bzzzzzzzzzzzzz;
        y_pos <= 13'bzzzzzzzzzzzzz;
        isdisplay <= 1'd0;
    end
end


//	Pixel LUT Address Generator
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	oRequest	<=	0;
	else
	begin
		if(	H_Cont>=X_START-2 && H_Cont<X_START+H_SYNC_ACT-2 &&
			V_Cont>=Y_START && V_Cont<Y_START+V_SYNC_ACT )
		oRequest	<=	1;
		else
		oRequest	<=	0;
	end
end

//	H_Sync Generator, Ref. 40 MHz Clock
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		H_Cont		<=	0;
		mVGA_H_SYNC	<=	0;
	end
	else
	begin
		//	H_Sync Counter
		if( H_Cont < H_SYNC_TOTAL )
		H_Cont	<=	H_Cont+1;
		else
		H_Cont	<=	0;
		//	H_Sync Generator
		if( H_Cont < H_SYNC_CYC )
		mVGA_H_SYNC	<=	0;
		else
		mVGA_H_SYNC	<=	1;
	end
end

//	V_Sync Generator, Ref. H_Sync
always@(posedge iCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		V_Cont		<=	0;
		mVGA_V_SYNC	<=	0;
	end
	else
	begin
		//	When H_Sync Re-start
		if(H_Cont==0)
		begin
			//	V_Sync Counter
			if( V_Cont < V_SYNC_TOTAL )
			V_Cont	<=	V_Cont+1;
			else
			V_Cont	<=	0;
			//	V_Sync Generator
			if(	V_Cont < V_SYNC_CYC )
			mVGA_V_SYNC	<=	0;
			else
			mVGA_V_SYNC	<=	1;
		end
	end
end

endmodule
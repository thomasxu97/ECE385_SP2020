module FIFO_Control(
		RESET_N,
		CLK,
		// write fifo ports
		WR1_DATA,
		WR2_DATA,
		WR,
		WR_LOAD,
		WR_CLK,
		// read fifo ports
		RD1_DATA,
		RD2_DATA,
		RD,
		RD_LOAD,	
		RD_CLK,
		// SDRAM control signal
		SA,
		BA,
		CS_N,
		CKE,
		RAS_N,
		CAS_N,
		WE_N,
		DQ,
		DQM,
);
//=======================================================
//  PARAMETER declarations
//=======================================================
`include  "Sdram_Params.h"

//=======================================================
//  PORT declarations
//=======================================================
//	HOST Side
input                           RESET_N;                //System Reset
input 							     CLK;
input  [`DIOSIZE-1:0]           WR1_DATA;               //Data Input
input  [`DIOSIZE-1:0]           WR2_DATA;               //Data Input
input							        WR;					          //Write Request
input							        WR_LOAD;			         	//Write FIFO Clear
input							        WR_CLK;				        //Write FIFO Clock
output [`DIOSIZE-1:0]           RD1_DATA;               //Data Output
output [`DIOSIZE-1:0]           RD2_DATA;               //Data Output	
input							        RD;					          //Read Request
input						     `   	RD_LOAD;				        //Read FIFO Clear
input										RD_CLK;				        //Read FIFO Clock
//////////// SDRAM //////////
input		    [12:0]		SA;
input		     [1:0]		BA;
input		          		CAS_N;
input		          		CKE;
input		          		DRAM_CLK;
input		          		DRAM_CS_N;
inout		    [31:0]		DRAM_DQ;
input		     [3:0]		DRAM_DQM;
input		          		DRAM_RAS_N;
input		          		DRAM_WE_N;


//=======================================================
//  REG/WIRE Declarations
//=======================================================
reg								              IN_REQ;					        //Input	data request to write side fifo
reg		       [1:0]			        WR_MASK;				        //Write port active mask
reg		       [1:0]			        RD_MASK;				        //Read port active mask
wire 				[`DSIZE-1:0]				mDATAIN;
reg	  			[`DSIZE-1:0]            mDATAOUT;               //Controller Data output 
wire 				[7:0]							write_side_fifo_rusedw1;
wire			 	[7:0]							write_side_fifo_rusedw2;
wire           [7:0]		        			read_side_fifo_wusedw1;
wire           [7:0]		        			read_side_fifo_wusedw2;
reg						      		      OUT_VALID;			        //Output data request to read side fifo
//=======================================================
//  Sub-module
//=======================================================
SDRAM_FIFO_WR write_fifo(
		.RESET_N,
		.CLK,
		//	FIFO Write Side 1
		.WR1_DATA,
		//	FIFO Write Side 2
		.WR2_DATA,
		// helper ports
		.WR,
		.WR_LOAD,
		.WR_CLK,
		.IN_REQ,
		.WR_MASK,
		.mDATAIN,
		.write_side_fifo_rusedw1,
		.write_side_fifo_rusedw2
);

SDRAM_FIFO_RD read_fifo(
		.RESET_N,
		.CLK,
		.RD1_DATA,
		//	FIFO Read Side 2
		.RD2_DATA,
		// helper ports
		.RD,
		.RD_LOAD,	
		.RD_CLK,
		.mDATAOUT,
		.OUT_VALID,
		.RD_MASK,
		.read_side_fifo_wusedw1,
		.read_side_fifo_wusedw2
);

//=======================================================
//  Structural coding
//=======================================================
assign DQ = oe ? DQOUT : `DSIZE'hzzzz;
assign active	=	Read | Write;

always @ (posedge CLK)
begin
	  SA      <= (ST==SC_CL+mLENGTH) ? 12'h200	:	ISA;
    BA      <= IBA;
    CS_N    <= ICS_N;
    CKE     <= ICKE;
    RAS_N   <= (ST==SC_CL+mLENGTH) ? 1'b0 : IRAS_N;
    CAS_N   <= (ST==SC_CL+mLENGTH) ? 1'b1 : ICAS_N;
    WE_N    <= (ST==SC_CL+mLENGTH) ? 1'b0 : IWE_N;
	  PM_STOP	<= (ST==SC_CL+mLENGTH) ? 1'b1 : 1'b0;
	  PM_DONE	<= (ST==SC_CL+SC_RCD+mLENGTH+2)	?	1'b1 : 1'b0;
	  DQM		  <= (active && (ST>=SC_CL) )	 ? (((ST==SC_CL+mLENGTH) && Write)?	4'b1111	:	4'b0	)	:	4'b1111;
	  mDATAOUT<= DQ;
end

always@(posedge CLK or negedge RESET_N)
begin
	if(!RESET_N)
	begin
		CMD			  <= 0;
		ST			  <= 0;
		Pre_RD	  <= 0;
		Pre_WR	  <= 0;
		Read		  <= 0;
		Write		  <= 0;
		OUT_VALID	<= 0;
		IN_REQ		<= 0;
		mWR_DONE	<= 0;
		mRD_DONE	<= 0;
	end
	else
	begin
		Pre_RD	<=	mRD;
		Pre_WR	<=	mWR;
		case (ST)
		0:	begin
				if (!Pre_RD && mRD)
				begin
					Read	<=	1;
					Write	<=	0;
					CMD		<=	2'b01;
					ST		<=	1;
				end
				else if (!Pre_WR && mWR)
				begin
					Read	<=	0;
					Write	<=	1;
					CMD		<=	2'b10;
					ST		<=	1;
				end
		end
		1:	begin
				if (CMDACK)
				begin
					CMD   <=  2'b00;
					ST    <=  2;
				end
		end
		default:  begin	
				if (ST!=SC_CL+SC_RCD+mLENGTH+1)
				  ST    <=  ST+1;
				else
				  ST    <=  0;
		end
		endcase
	
		if (Read)
		begin
			if (ST==SC_CL+SC_RCD+1)
			  OUT_VALID	<=	1;
			else if (ST==SC_CL+SC_RCD+mLENGTH+1)
			begin
				OUT_VALID	<=	0;
				Read		  <=	0;
				mRD_DONE	<=	1;
			end
		end
		else
		  mRD_DONE	  <=	0;
		
		if (Write)
		begin
			if (ST==SC_CL-1)
			  IN_REQ	<=	1;
			else if (ST==SC_CL+mLENGTH-1)
			  IN_REQ	<=	0;
			else if (ST==SC_CL+SC_RCD+mLENGTH)
			begin
				Write 	<=	0;
				mWR_DONE<=	1;
			end
		end
		else
		  mWR_DONE  <=	0;
	end
end

//	Internal Address & Length Control
always@(posedge CLK or negedge RESET_N)
	if (!RESET_N)
	begin
		rWR1_ADDR		  <=	WR1_ADDR;
		rWR2_ADDR		  <=	WR2_ADDR;
		rRD1_ADDR		  <=	RD1_ADDR;
		rRD2_ADDR		  <=	RD2_ADDR;
		rWR1_MAX_ADDR	<=	WR1_MAX_ADDR;
		rWR2_MAX_ADDR	<=	WR2_MAX_ADDR;
		rRD1_MAX_ADDR	<=	RD1_MAX_ADDR;
		rRD2_MAX_ADDR	<=	RD2_MAX_ADDR;

		rWR1_LENGTH		<=	WR1_LENGTH;
		rWR2_LENGTH		<=	WR2_LENGTH;
		rRD1_LENGTH		<=	RD1_LENGTH;
		rRD2_LENGTH		<=	RD2_LENGTH;
	end
	else
	begin
		//	Write Side 1
    if (mWR_DONE&&WR_MASK[0])
		begin
			if(rWR1_ADDR<rWR1_MAX_ADDR-rWR1_LENGTH)
				rWR1_ADDR	<= rWR1_ADDR+rWR1_LENGTH;
			else
				rWR1_ADDR	<= WR1_ADDR;
		end
		//	Write Side 2
		if (mWR_DONE&&WR_MASK[1])
		begin
			if(rWR2_ADDR<rWR2_MAX_ADDR-rWR2_LENGTH)
				rWR2_ADDR	<=	rWR2_ADDR+rWR2_LENGTH;
			else
				rWR2_ADDR	<=	WR2_ADDR;
		end
		//	Read Side 1
		if (mRD_DONE&&RD_MASK[0])
		begin
			if(rRD1_ADDR<rRD1_MAX_ADDR-rRD1_LENGTH)
				rRD1_ADDR	<=	rRD1_ADDR+rRD1_LENGTH;
			else
				rRD1_ADDR	<=	RD1_ADDR;
		end
		//	Read Side 2
		if (mRD_DONE&&RD_MASK[1])
		begin
			if(rRD2_ADDR<rRD2_MAX_ADDR-rRD2_LENGTH)
				rRD2_ADDR	<=	rRD2_ADDR+rRD2_LENGTH;
			else
				rRD2_ADDR	<=	RD2_ADDR;
		end
	end

//	Auto Read/Write Control
always@(posedge CLK or negedge RESET_N)
	if (!RESET_N)
	begin
		mWR		<=	0;
		mRD		<=	0;
		mADDR   <=	0;
		mLENGTH	<=	0;
		RD_MASK <=	0; //Peli
		WR_MASK <=	0;
	end
	else
	begin
		if ( (mWR==0) && (mRD==0) && (ST==0) &&
			(WR_MASK==0)	&&	(RD_MASK==0) &&
			(WR1_LOAD==0)	&&	(RD1_LOAD==0) &&
			(WR2_LOAD==0)	&&	(RD2_LOAD==0) )
		begin
			//	Write Side 1
			if ( (write_side_fifo_rusedw1 >= rWR1_LENGTH) && (rWR1_LENGTH!=0) )
			begin
				mADDR	  <=	rWR1_ADDR;
				mLENGTH	<=	rWR1_LENGTH;
				WR_MASK	<=	2'b01;
				RD_MASK	<=	2'b00;
				mWR		  <=	1;
				mRD		  <=	0;
			end
			//	Write Side 2
			else if ( (write_side_fifo_rusedw2 >= rWR2_LENGTH) && (rWR2_LENGTH!=0) )
			begin
				mADDR	  <=	rWR2_ADDR;
				mLENGTH	<=	rWR2_LENGTH;
				WR_MASK	<=	2'b10;
				RD_MASK	<=	2'b00;
				mWR		  <=	1;
				mRD		  <=	0;
			end
			//	Read Side 1
			else if ( (read_side_fifo_wusedw1 < rRD1_LENGTH) )
			begin
				mADDR	  <=	rRD1_ADDR;
				mLENGTH	<=	rRD1_LENGTH;
				WR_MASK	<=	2'b00;
				RD_MASK	<=	2'b01;
				mWR		  <=	0;
				mRD		  <=	1;				
			end
			//	Read Side 2
			else if ( (read_side_fifo_wusedw2 < rRD2_LENGTH) )
			begin
				mADDR  	<=	rRD2_ADDR;
				mLENGTH	<=	rRD2_LENGTH;
				WR_MASK	<=	2'b00;
				RD_MASK	<=	2'b10;
				mWR		  <=	0;
				mRD		  <=	1;
			end
		end
		
		if (mWR_DONE)
		begin
			WR_MASK	<=	0;
			mWR		  <=	0;
		end
		
		if (mRD_DONE)
		begin
			RD_MASK	<=	0;
			mRD		  <=	0;
		end
	end

endmodule 
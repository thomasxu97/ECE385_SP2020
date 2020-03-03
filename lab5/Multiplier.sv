module Multiplier(
    input logic[7:0] S,
    input logic Clk,
    input logic Reset_SH,
    input logic Run_SH,
    input logic ClearA_LoadB_SH,

    output logic[6:0] AhexU, 
    output logic[6:0] AhexL,
    output logic[6:0] BhexU,
    output logic[6:0] BhexL,
    output logic[7:0] Aval,
    output logic[7:0] Bval,
    output logic X
);
    logic[7:0]      Sum;
    logic[7:0]      Sum_comb;
    logic[7:0]      A_comb;
    logic[7:0]      B_comb;
    logic[6:0]      AhexU_comb;
    logic[6:0]      AhexL_comb;
    logic[6:0]      BhexU_comb;
    logic[6:0]      BhexL_comb;
    logic           Reg_shift;
    logic           Add_comb;
    logic           Sub_comb;
    logic           LoadA;
    logic           ClearB = 1'b0;
	 logic 			  ClearA;
    logic           Aout;
    logic           Bout;
    logic           X_comb;
	 logic			  Clr_ld;
	 logic 			Reset, ClearA_LoadB, Run;
	 
    always_ff @(posedge Clk) begin
        AhexU <= AhexU_comb;
        AhexL <= AhexL_comb;
        BhexU <= BhexU_comb;
        BhexL <= BhexL_comb;
    end
	 
	 Compute comp(	.AddEn(Add_comb),
						.SubEn(Sub_comb),
						.Run,
						.OpA(Aval),
						.OpB(S),
						.Updatex(X_comb),
						
						.result(Sum),
						.X
					  );
					  

    ControlUnit Ctrl(
						.ClearA_LoadB(~ClearA_LoadB), 
						.Run(~Run), 
						.Clk(Clk), 
						.Reset(~Reset), 
						.M(Bout), 
						.ClearA, 
						.Clr_ld(Clr_ld), 
						.Shift(Reg_shift), 
						.Add(Add_comb), 
						.Sub(Sub_comb), 
						.LoadA(LoadA),
						.Updatex(X_comb)
						);

    Register8bit A(
						.Din(Sum), 
						.Clk(Clk), 
						.Shift(Reg_shift), 
						.Clear(ClearA),
						.Load(LoadA), 
						.ShiftIn(X), 
						.Dout(Aval), 
						.ShiftOut(Aout)
						);

    Register8bit B(
						.Din(S), 
						.Clk(Clk), 
						.Shift(Reg_shift), 
						.Clear(ClearB),
						.Load(Clr_ld), 
						.ShiftIn(Aout), 
						.Dout(Bval), 
						.ShiftOut(Bout)
						);

    HexDriver AhexU_inst(
						.In0(Aval[7:4]), 
						.Out0(AhexU_comb)
						);
    
    HexDriver AhexL_inst(
						.In0(Aval[3:0]),
						.Out0(AhexL_comb)
						);

    HexDriver BhexU_inst(
					   .In0(Bval[7:4]),
					   .Out0(BhexU_comb)
						);
    
    HexDriver BhexL_inst(
						.In0(Bval[3:0]),
						.Out0(BhexL_comb)
						);
	 
	 sync button_sync[2:0] (Clk, {Reset_SH, ClearA_LoadB_SH, Run_SH}, {Reset, ClearA_LoadB, Run});

endmodule
module lab5_top_level(
    input logic[7:0] S,
    input logic Clk,
    input logic Reset,
    input logic Run,
    input logic ClearA_LoadB,

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
    logic           ClearB;
    logic           Aout;
    logic           Bout;
    logic           X_comb;

    always_ff @(posedge Clk) begin
        AhexU <= AhexU_comb;
        AhexL <= AhexL_comb;
        BhexU <= BhexU_comb;
        BhexL <= BhexL_comb;
    end

    always_ff @(posedge Clk)
    begin
        if(!Reset)
            X <= 0;
        if(Clr_ld)
            X <= 0;
        if(Add_comb == 1'b1) 
        begin
            A_comb <= A;
            B_comb <= S;
        end
        if(Sub_comb == 1'b1)
        begin
            A_comb <= A;
            B_comb <= ~S+1'b1;
        end
    end

    always_comb
    begin
        Sum = Sum_comb;
        X = X_comb;
    end

    Adder9bit Adder(.A(A_comb), .B(B_comb), .Sum(Sum_comb), .CO(X_comb));

    ControlUnit Ctrl(.ClearA_LoadB(~ClearA_LoadB), .Run(~Run), .Clk, .Reset(~Reset), 
        .M(Bout), .Clr_ld(ClearA_LoadB), .Shift(Reg_shift),
        .Add(Add_comb), .Sub(Sub_comb));

    Register8bit A(.Din(Sum), .Clk, .Shift(Reg_shift), .Clear(ClearA_LoadB),
        .Load(LoadA), .ShiftIn(X), .Dout(Aval), .ShiftOut(Aout));

    Register8bit B(.Din(S), .Clk, .Shift(Reg_shift), .Clear(ClearB),
        .Load(ClearA_LoadB), .ShiftIn(Aout), .Dout(Bval), .ShiftOut(Bout));

    HexDriver AhexU_inst
    (
        .In0(Aval[3:0]),   // This connects the 4 least significant bits of 
                        // register A to the input of a hex driver named Ahex0_inst
        .Out0(AhexU_comb)
    );
    
    HexDriver AhexL_inst
    (
        .In0(Aval[7:4]),
        .Out0(AhexL_comb)
    );

    HexDriver BhexU_inst
    (
        .In0(Bval[3:0]),
        .Out0(BhexU_comb)
    );
    
    HexDriver BhexL_inst
    (
        .In0(Bval[7:4]),
        .Out0(BhexL_comb)
    );
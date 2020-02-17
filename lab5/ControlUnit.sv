module ControlUnit(
    input logic ClearA_LoadB,
    input logic Run,
    input logic Clk,
    input logic Reset,
    input logic M,

    output logic Clr_ld,
    output logic Shift,
    output logic Add,
    output logic Sub
);
    logic [2:0] Counter = 3'b0;
    enum logic [2:0] {INIT, START, ADD, SHIFT, SUB, FINISH} curr_state, next_state;

    always_ff @(posedge Clk or posedge Reset)
    begin
        if (Reset) 
            begin
                curr_state <= INIT;
                Counter <= 3'b0;
            end
        else 
            begin
                curr_state <= next_state;
                Counter <= Counter + 1'b1;           
            end
    end

    always_comb
        begin
            next_state = curr_state;
            unique case (curr_state)
                INIT: 
                if (Run) 
                    begin
                        next_state = START;
                        Counter = 3'b0;
                    end
                if (ClearA_LoadB)
                    Clr_ld = 1'b1;   
                    
                START: 
                    if (M == 1 && Counter < 7) 
                        next_state = ADD;
                    else if (M == 0)
                        next_state = SHIFT;
                    else if (M == 1 && Counter == 7)
                        next_state = SUB;

                ADD:
                    Add = 1'b1;
                    next_state = SHIFT;

                SUB:
                    Sub = 1'b1;
                    next_state = SHIFT;
                
                SHIFT:
                    Shift = 1'b1;
                    if (Counter < 7)
                        begin
                            next_state = START;
                        end
                    else next_state = FINISH;

                FINISH:
                    if (~Run) next_state = INIT;

            endcase
        end

endmodule



    

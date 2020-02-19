module ControlUnit(
    input logic ClearA_LoadB,
    input logic Run,
    input logic Clk,
    input logic Reset,
    input logic M,

    output logic Clr_ld,
    output logic Shift,
    output logic Add,
    output logic Sub,
	 output logic LoadA
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
                curr_state = next_state;
					 if (curr_state == INIT) Counter = 3'b0;
					 if (curr_state == SHIFT) Counter = Counter + 1'b1;
            end
    end

    always_comb
        begin
            next_state = curr_state;
				Clr_ld = 1'b0;
				Add = 1'b0;
				Shift = 1'b0;
				Sub = 1'b0;
				LoadA = 1'b0;
				
            case (curr_state)
					INIT: 
					begin
					if (Run) begin
							next_state = START;
							Clr_ld = 1'b1; 
						end
						else if (ClearA_LoadB) begin
							 Clr_ld = 1'b1; 
						end
					end
                    
               START: 
					begin
                    if (M == 1 && Counter < 7) 
                        next_state = ADD;
                    else if (M == 0)
                        next_state = SHIFT;
                    else if (M == 1 && Counter == 7)
                        next_state = SUB;
                    else
                        next_state = START;
					end
					
               ADD:
					begin
                    Add = 1'b1;
						  LoadA = 1'b1;
                    next_state = SHIFT;
					end

               SUB:
					begin
                    Sub = 1'b1;
                    next_state = SHIFT;
					end
                
               SHIFT:
					begin
                    Shift = 1'b1;
                    if (Counter < 8)
                        next_state = START;
                    else 
                        next_state = FINISH;
					end

               FINISH:
                   if (~Run) next_state = INIT;

            endcase
        end

endmodule



    

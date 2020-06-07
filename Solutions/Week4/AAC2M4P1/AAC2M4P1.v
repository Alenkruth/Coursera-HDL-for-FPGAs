module LS161a(
    input [3:0] D,        // Parallel Input
    input CLK,            // Clock
    input CLR_n,          // Active Low Asynchronous Reset
    input LOAD_n,         // Enable Parallel Input
    input ENP,            // Count Enable Parallel
    input ENT,            // Count Enable Trickle
    output reg [3:0]Q,        // Parallel Output 	
    output reg RCO);          // Ripple Carry Output (Terminal Count)

    wire [3:0] concat = {CLR_n,LOAD_n,ENT,ENP};

    always @(posedge(CLK),negedge(CLR_n)) begin
        case (concat)
            4'b0XXX : Q <= 4'b0000;
            4'b10XX : Q <= D;
            4'b1111 : Q <= Q + 1'b1;
            4'b110X : Q <= Q;
            4'b11X0 : Q <= Q;
        endcase
        RCO <= ENT && (&Q);
    end
endmodule  

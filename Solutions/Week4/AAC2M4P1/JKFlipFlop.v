//comments
//this module is a JK Flip flop
module jk(
    input wire i_j,
    input wire i_k,
    input wire i_clk,
    input wire i_clear,
    output reg o_q,
    output reg o_qnot);

    //o_q = 1'b0;
    //o_qnot = 1'b1;

    always @(posedge i_clk) begin
        if (i_clear == 1'b0) begin  
            o_q <= 1'b0;
            o_qnot <= 1'b1; 
        end
        case ({i_j,i_k})
            2'b00 : begin o_q <= o_q; o_qnot <= o_qnot; end
            2'b01 : begin o_q <= 1'b0; o_qnot <= 1'b1; end
            2'b10 : begin o_q <= 1'b1; o_qnot <= 1'b0; end
            2'b11 : begin o_q <= ~o_q; o_qnot <= ~o_qnot; end
        endcase
    end
endmodule
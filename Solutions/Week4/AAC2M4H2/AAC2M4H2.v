module FIFO8x9(
  input clk, rst,
  input RdPtrClr, WrPtrClr, 
  input RdInc, WrInc,
  input [8:0] DataIn,
  output reg [8:0] DataOut,
  input rden, wren);
//signal declarations

	reg [8:0] fifo_array[7:0];
	reg [2:0] wrptr, rdptr;
	wire [2:0] wr_cnt, rd_cnt;
  wire [6:0] concat;

  assign wr_cnt = wrptr;
  assign re_cnt = rdptr;
  assign concat = {rst,RdPtrClr,WrPtrClr,RdInc,WrInc,rden,wren};

  always @(posedge clk) begin
    case(concat)
      7'b0XXXXXX : begin //reset low
        DataOut <= 9'bZZZZZZZZZ;
        fifo_array [0] <= 0;
        fifo_array [1] <= 0;
        fifo_array [2] <= 0;
        fifo_array [3] <= 0;
        fifo_array [4] <= 0;
        fifo_array [5] <= 0;
        fifo_array [6] <= 0;
        fifo_array [7] <= 0;
        wrptr <= 0;
        rdptr <= 0;
      end
      7'b11XXXXX : begin //Rdptrclr
        DataOut <= 9'bZZZZZZZZZ;
        rdptr <= 0;
      end
      7'b1X1XXXX : begin //Wrptrclr
        DataOut <= 9'bZZZZZZZZZ;
        wrptr <= 0;
      end
      7'b1XX1XXX : begin //RdInc
        DataOut <= 9'bZZZZZZZZZ;
        rdptr <= rdptr + 1'b1;
      end
      7'b1XXX1XX : begin //WrInc
        DataOut <= 9'bZZZZZZZZZ;
        wrptr <= wrptr + 1'b1;
      end
      7'b1XXXX1X : begin //rden
        DataOut <= fifo_array[rdptr];
      end
      7'b1XXXXX1 : begin //wren
        fifo_array[wrptr] <= DataIn;
      end
      default : DataOut <= 9'bZZZZZZZZZ;
    endcase
  end

  //always @(RdInc,WrInc,rden,wren) begin
  //  end
endmodule


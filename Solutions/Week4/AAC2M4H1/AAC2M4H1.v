module ALU ( 
  input [2:0] Op_code,
  input [31:0] A, B,
  output reg [31:0] Y);

  parameter Buffer_A = 3'b000;      // Y <= A
  parameter Add = 3'b001;           // Y <= A + B
  parameter Sub = 3'b010;           // Y <= A - B
  parameter And = 3'b011;           // Y <= A & B
  parameter Or = 3'b100;            // Y <= A | B
  parameter Increment_A = 3'b101;   // Y <= A + 1'b1
  parameter Decrement_A = 3'b110;   // Y <= A - 1'b1
  parameter Buffer_B = 3'b111;      // Y  <= B

  always @(*) begin
  	case (Op_code)
  		Buffer_A : Y <= A;
  		Add : Y <= A + B;
  		Sub : Y <= A - B;
  		And : Y <= A & B;
  		Or : Y <= A | B;
  		Increment_A : Y <= A + 1'b1;
  		Decrement_A : Y <= A - 1'b1;
  		Buffer_B : Y <= B;
  		default : Y <= 32'h00000000;
  	endcase // Op_code
  end
endmodule



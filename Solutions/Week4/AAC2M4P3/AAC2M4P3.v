module FSM(
  input In1,
  input RST,
  input CLK, 
  output reg Out1);

  parameter A = 2'b00;
  parameter B = 2'b01;
  parameter C = 2'b10;
  
  reg [1:0] current_state;
  reg [1:0] next_state;

  always @(posedge CLK, negedge RST) begin 
  	if (RST == 1'b0) current_state <= A;
  	else current_state <= next_state;
  end

  always @(current_state, In1) begin
  	case(current_state) 
  		A : begin
  			if (In1 == 1'b1) next_state <= B;
  			else next_state <= current_state;
  		end
  		B : begin 
  			if (In1 == 1'b0) next_state <= C;
  			else next_state <= current_state;
  		end
  		C : begin 
  			if (In1 == 1'b1) next_state <= A;
  			else next_state <= current_state;
  		end
  		default : next_state <= A;
  	endcase 
  end

  always @(current_state) begin 
  	case (current_state)
  		A : Out1 <= 1'b0;
  		B : Out1 <= 1'b0;
  		C : Out1 <= 1'b1;
  		default : Out1 <= 1'b0;
  	endcase 
  end

endmodule
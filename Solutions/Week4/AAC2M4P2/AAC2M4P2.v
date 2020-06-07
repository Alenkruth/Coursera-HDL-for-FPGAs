module RAM128x32 
#(
  parameter Data_width = 32,  //# of bits in word
            Addr_width = 7  // # of address bits
  )
  (  //ports
    input wire clk,
    input wire we,
    input wire [(Addr_width-1):0] address, 
    input wire [(Data_width-1):0] d,
    output wire [(Data_width-1):0] q
  );

  reg [(Data_width-1):0] ram [(2**(Addr_width)-1):0];
  reg [(Data_width-1):0] out;

  assign q = out;

  always @(posedge clk) begin 
    if (we == 1'b1) begin 
      ram [address] <= d;
      out <= 32'hZZZZZZZZ;
    end
    else begin 
      out <= ram [address];
    end 
  end
endmodule 
////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//               Application Assignment Problem 5 Module 3 Course 2           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
//
// 
// @file AAC2M3H1.v
// @brief Application Assignment 2-007 4-bit full adder
// @version: 1.0 
// Date of current revision:  @date 2019-07-01  
// Target FPGA: [Intel Altera MAX10] 
// Tools used: [Quartus Prime 16.1 or Sigasi] for editing and/or synthesis 
//             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
//             [Quartus Prime 16.1]  for place and route if applied
//             
//  Functional Description:  This file contains the Verilog which describes the 
//               FPGA implementation of 4-bit adder with carry. The inputs are 2 
//               3-bit vectors A and B, and a scalar carry in Cin.  Outputs are
//               Sum and Cout.  
//
//  Hierarchy:  There is only one level in this simple design.
//        
//  Designed by:  @author [your name] 
//                [Organization]
//                [email] 
//
//      Copyright (c) 2019 by Tim Scherr
//
// Redistribution, modification or use of this software in source or binary
// forms is permitted as long as the files maintain this copyright. Users are
// permitted to modify this and use it to learn about the field of HDl code.
// Tim Scherr and the University of Colorado are not liable for any misuse
// of this material.
//////////////////////////////////////////////////////////////////////////////
// 
  	                                            		
module Add(
    input wire i_a,
    input wire i_b,
    input wire i_cin,
    output wire o_sum,
    output wire o_cout);

    wire temp1, temp2, temp3, temp4, temp5;
    
    //sum 
    assign temp1 = i_a ^ i_b;
    assign sum = i_cin ^ temp1;

    //carry
    assign temp2 = i_a & i_b;
    assign temp3 = i_a & i_cin;
    assign temp4 = i_b & i_cin;
    assign temp5 = temp2 | temp3;
    assign cout = temp5 | temp4;
    
endmodule

module FullAdd4(                	
    input wire [3:0] A, 
    input wire [3:0] B, 
    input wire Cin, 			
    output wire[3:0] Sum,
    output wire Cout);

    wire temp1, temp2, temp3;
                   	          	
// student code here
    Add bit0 (.i_a(A[0]),.i_b(B[0]),.i_cin(Cin),.o_sum(Sum[0]),.o_cout(temp1));
    Add bit1 (.i_a(A[1]),.i_b(B[1]),.i_cin(temp1),.o_sum(Sum[1]),.o_cout(temp2));
    Add bit2 (.i_a(A[2]),.i_b(B[2]),.i_cin(temp2),.o_sum(Sum[2]),.o_cout(temp3));
    Add bit3 (.i_a(A[3]),.i_b(B[3]),.i_cin(temp3),.o_sum(Sum[3]),.o_cout(Cout));

endmodule // Majority  




    
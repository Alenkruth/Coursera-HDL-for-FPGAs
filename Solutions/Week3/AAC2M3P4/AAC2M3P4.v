////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//               Application Assignment Problem 4 Module 3 Course 2           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
//
// 
// @file AAC2M3P4.v
// @brief Application Assignment 2-007 Example code with errors to be found
// @version: 1.0 
// Date of current revision:  @date 2019-06-03  
// Target FPGA: [Intel Altera MAX10] 
// Tools used: [Quartus Prime 16.1 or Sigasi] for editing and/or synthesis 
//             [Modeltech ModelSIM 10.4a Student Edition] for simulation 
//             [Quartus Prime 16.1]  for place and route if applied
//             
//  Functional Description:  This file contains the Verilog which describes the 
//               FPGA implementation of Majority Vote circuit. The inputs are 3 
//               scalars A, B, and C with Y as the output.
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
  	                                            		
module Majority (
    input wire A,
    input wire B,
    input wire C,
    output reg Y);  		
                   	          	
// student code here
    wire temp1,temp2,temp3,temp4;
    assign temp1 = A && B;
    assign temp2 = A && C;
    assign temp3 = B && C;
    assign temp4 = temp1 || temp2;
    always @(*) Y <= temp4 || temp3;

endmodule // Majority  




    
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 15:59:06
// Design Name: 
// Module Name: COMPLIMENT
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DEC_OP_32bit(
input [31:0] A,
input [31:0] B,
output[31:0] OUTPUT
    );
    wire [31:0]S;
    SUB_32bit s1(.A(A),.B(32'd4),.OUTPUT(S));
    assign OUTPUT=S;
endmodule

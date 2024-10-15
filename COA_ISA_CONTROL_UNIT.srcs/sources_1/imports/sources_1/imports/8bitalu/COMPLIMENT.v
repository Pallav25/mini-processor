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
module COMPLIMENT_32bit(
input [31:0] A,
output [31:0] OUTPUT
    );
    wire [31:0] S;
    wire [31:0] C,B;
    NOT_OP_32bit n1(.A(A),.OUTPUT(B));
    ADD_32bit a1(.A(B),.B(32'b1),.OUTPUT(S),.cout(C));
    assign OUTPUT=S;
endmodule

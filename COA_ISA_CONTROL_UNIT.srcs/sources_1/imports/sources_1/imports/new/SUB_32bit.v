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


module SUB_32bit(
input [31:0] A,
input [31:0] B,
output Cout,
output [31:0] OUTPUT
    );
    wire [31:0] comp_b,S;
    COMPLIMENT_32bit c(.A(B),.OUTPUT(comp_b));
    ADD_32bit a(.A(A),.B(comp_b),.cout(Cout),.OUTPUT(S));
    assign OUTPUT=S;
endmodule

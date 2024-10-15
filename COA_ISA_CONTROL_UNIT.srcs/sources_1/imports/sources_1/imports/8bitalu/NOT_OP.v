`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 14:42:43
// Design Name: 
// Module Name: NOT_OP
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


module NOT_OP(input [7:0] A,input B,
    output [7:0] OUTPUT);
    
    
    not n0(OUTPUT[0],A[0]);
    not n1(OUTPUT[1],A[1]);
    not n2(OUTPUT[2],A[2]);
    not n3(OUTPUT[3],A[3]);
    not n4(OUTPUT[4],A[4]);
    not n5(OUTPUT[5],A[5]);
    not n6(OUTPUT[6],A[6]);
    not n7(OUTPUT[7],A[7]);
    
endmodule

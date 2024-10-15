`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 14:24:33
// Design Name: 
// Module Name: RSL_OP
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


module AND_OP(
input [7:0]A,
input [7:0]B,
output [7:0] OUTPUT
    );
        and  a0(OUTPUT[0],A[0],B[0]);
        and  a1(OUTPUT[1],A[1],B[1]);
        and  a2(OUTPUT[2],A[2],B[2]);
        and  a3(OUTPUT[3],A[3],B[3]);
        and  a4(OUTPUT[4],A[4],B[4]);
        and  a5(OUTPUT[5],A[5],B[5]);
        and  a6(OUTPUT[6],A[6],B[6]);
        and  a7(OUTPUT[7],A[7],B[7]);
        
        
endmodule

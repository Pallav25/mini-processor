`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 08:04:11
// Design Name: 
// Module Name: NOR_OP
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


module NOR_OP(
    input [7:0] A,
    input [7:0] B,
    output [7:0] OUTPUT
    );
    //8 gates
    nor n0(OUTPUT[0], A[0], B[0]);
    nor n1(OUTPUT[1], A[1], B[1]);
    nor n2(OUTPUT[2], A[2], B[2]);
    nor n3(OUTPUT[3], A[3], B[3]);
    nor n4(OUTPUT[4], A[4], B[4]);
    nor n5(OUTPUT[5], A[5], B[5]);
    nor n6(OUTPUT[6], A[6], B[6]);
    nor n7(OUTPUT[7], A[7], B[7]);
    
endmodule

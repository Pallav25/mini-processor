`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 08:52:14
// Design Name: 
// Module Name: THREE_BIT_ADDER
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


module THREE_BIT_ADDER(
    input [2:0] A,
    input [2:0] B,
    input Cin,
    output [2:0] Sum,
    output Cout
    );

    wire C1, C2;

    FULLADDER FA0 (
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(C1)
    );

    TWO_BIT_ADDER TBA (
        .A(A[2:1]),
        .B(B[2:1]),
        .Cin(C1),
        .Sum(Sum[2:1]),
        .Cout(Cout)
    );
endmodule

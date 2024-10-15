`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 08:52:14
// Design Name: 
// Module Name: TWO_BIT_ADDER
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


module TWO_BIT_ADDER(
    input [1:0] A,
    input [1:0] B,
    input Cin,
    output [1:0] Sum,
    output Cout
    );

    wire w1;

    FULLADDER fa1(.A(A[0]),.B(B[0]),.Cin(Cin),.Cout(w1),.Sum(Sum[0]));
    FULLADDER fa2(.A(A[1]),.B(B[1]),.Cin(w1),.Cout(Cout),.Sum(Sum[1]));


endmodule

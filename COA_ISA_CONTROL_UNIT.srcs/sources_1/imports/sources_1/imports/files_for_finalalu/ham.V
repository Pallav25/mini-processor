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

module HAM(
    input [7:0] A,
    input [7:0] B,
    output [3:0] OUTPUT
);
wire [1:0]a1,a2;
wire [2:0]threebit;
FULLADDER fa1(.A(A[7]),.B(A[6]),.Cin(A[5]),.Cout(a1[1]),.Sum(a1[0]));
FULLADDER fa2(.A(A[4]),.B(A[3]),.Cin(A[2]),.Cout(a2[1]),.Sum(a2[0]));

TWO_BIT_ADDER tba1(.A(a1),.B(a2),.Cin(A[1]),.Sum(threebit[1:0]),.Cout(threebit[2]));
THREE_BIT_ADDER t3ba1(.A(threebit),.B(3'b0),.Cin(A[0]),.Sum(OUTPUT[2:0]),.Cout(OUTPUT[3]));
endmodule

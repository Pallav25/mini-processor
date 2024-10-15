`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 08:52:14
// Design Name: 
// Module Name: FULLADDER
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


module FULLADDER(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );

    wire w1,w2,w3,w4,w5;

    xor x1(w1,A,B);
    xor x2(Sum,w1,Cin);
    and a1(w2,A,B);
    and a2(w3,B,Cin);
    and a3(w4,A,Cin);
    or o1(w5,w2,w3);
    or o2(Cout,w4,w5);
endmodule

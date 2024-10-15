`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 11:16:25
// Design Name: 
// Module Name: mux2to1
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


module mux2to1(
    input in0,
    input in1,
    input sel,
    output out
);

    wire w1,w2,w3;
    and a1(w1,sel,in1);
    not n1(w2,sel);
    and a2(w3,w2,in0);
    or o1(out,w1,w3);
endmodule
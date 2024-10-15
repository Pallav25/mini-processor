`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:16:57
// Design Name: 
// Module Name: INC_OP
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
module INC_OP_32bit(
input [31:0] A,
input [31:0] B,
output [31:0] OUTPUT
    );
    wire [31:0] increase;
    ADD_32bit A1(.A(A),.B(32'd4),.OUTPUT(increase));
    assign OUTPUT=increase;
endmodule
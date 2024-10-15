`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2024 08:01:15
// Design Name: 
// Module Name: NOR_OP_32bit
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


module NOR_OP_32bit(
    input [31:0] A,
    input [31:0] B,
    output [31:0] OUTPUT
    );

    // Instantiate four 8-bit NOR modules
    NOR_OP nor0 (.A(A[7:0]),   .B(B[7:0]),   .OUTPUT(OUTPUT[7:0]));
    NOR_OP nor1 (.A(A[15:8]),  .B(B[15:8]),  .OUTPUT(OUTPUT[15:8]));
    NOR_OP nor2 (.A(A[23:16]), .B(B[23:16]), .OUTPUT(OUTPUT[23:16]));
    NOR_OP nor3 (.A(A[31:24]), .B(B[31:24]), .OUTPUT(OUTPUT[31:24]));

endmodule

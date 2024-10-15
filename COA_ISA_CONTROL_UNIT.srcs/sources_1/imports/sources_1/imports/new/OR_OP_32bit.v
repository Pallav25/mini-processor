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

module OR_OP_32bit(
    input [31:0] A,
    input [31:0] B,
    output [31:0] OUTPUT
);
    // Instantiate four 8-bit OR_OP modules
    OR_OP or0 (.A(A[7:0]),   .B(B[7:0]),   .OUTPUT(OUTPUT[7:0]));
    OR_OP or1 (.A(A[15:8]),  .B(B[15:8]),  .OUTPUT(OUTPUT[15:8]));
    OR_OP or2 (.A(A[23:16]), .B(B[23:16]), .OUTPUT(OUTPUT[23:16]));
    OR_OP or3 (.A(A[31:24]), .B(B[31:24]), .OUTPUT(OUTPUT[31:24]));

endmodule

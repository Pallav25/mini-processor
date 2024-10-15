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
module OR_OP(
    input [7:0] A,
    input [7:0] B,
    output [7:0] OUTPUT
);
    // Instantiate 8 OR gates for each bit
    or u0 (OUTPUT[0], A[0], B[0]);
    or u1 (OUTPUT[1], A[1], B[1]);
    or u2 (OUTPUT[2], A[2], B[2]);
    or u3 (OUTPUT[3], A[3], B[3]);
    or u4 (OUTPUT[4], A[4], B[4]);
    or u5 (OUTPUT[5], A[5], B[5]);
    or u6 (OUTPUT[6], A[6], B[6]);
    or u7 (OUTPUT[7], A[7], B[7]);

endmodule

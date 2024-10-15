`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024
// Design Name: 
// Module Name: NOT_OP_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module performs a 32-bit bitwise NOT operation on input A
//              by instantiating four 8-bit NOT_OP modules.
// 
// Dependencies: NOT_OP
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module NOT_OP_32bit(
    input [31:0] A,         // 32-bit input data
    input [31:0] B,
    output [31:0] OUTPUT    // 32-bit output result
);

    // Internal wires to hold the outputs from the 8-bit modules
    wire [7:0] out0, out1, out2, out3;

    // Instantiate four 8-bit NOT_OP modules
    NOT_OP not0 (
        .A(A[7:0]), 
        .B(1'b0),   // B is not used in NOT_OP
        .OUTPUT(out0)
    );
    
    NOT_OP not1 (
        .A(A[15:8]), 
        .B(1'b0),   // B is not used in NOT_OP
        .OUTPUT(out1)
    );

    NOT_OP not2 (
        .A(A[23:16]), 
        .B(1'b0),   // B is not used in NOT_OP
        .OUTPUT(out2)
    );

    NOT_OP not3 (
        .A(A[31:24]), 
        .B(1'b0),   // B is not used in NOT_OP
        .OUTPUT(out3)
    );

    // Concatenate the outputs to form the 32-bit result
    assign OUTPUT = {out3, out2, out1, out0};

endmodule


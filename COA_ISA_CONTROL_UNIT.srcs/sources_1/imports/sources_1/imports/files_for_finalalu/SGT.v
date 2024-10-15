`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024
// Design Name: 
// Module Name: SGT_32bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module performs a 32-bit set greater than operation on inputs A and B,
//              using a subtractor and multiplexers.
// 
// Dependencies: Subtractor_32bit, mux2to1
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////





// 32-bit set greater than module
module SGT_32bit (
    input [31:0] A,
    input [31:0] B,
    output [31:0] OUTPUT
);
    wire [31:0] sub_result;
    wire sgt;

    // Instantiate the subtractor
    SUB_32bit subtractor (
        .A(A),
        .B(B),
        .OUTPUT(sub_result)
    );

    assign sgt = sub_result[31];

    // Use multiplexers to set the output
    mux2to1 mux0 (.in0(1'b1), .in1(1'b0), .sel(sgt), .out(OUTPUT[0]));
    assign OUTPUT[31:1] = 31'b0;
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2024 14:24:33
// Design Name: 
// Module Name: RSA_OP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This module performs a 32-bit arithmetic right shift operation 
//              on input A, with the shift amount specified by B, using multiplexers.
// 
// Dependencies: mux2to1
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RSA_OP_32bit(
    input [31:0] A,        // 32-bit input data
    input [31:0] B,        // 32-bit shift amount (only 0 or 1)
    output [31:0] OUTPUT   // 32-bit output result
);
    // directly use 2to1 mux to assign output from input for every bit
    mux2to1 mux0(.in0(A[0]), .in1(A[1]), .sel(B[0]), .out(OUTPUT[0]));
    mux2to1 mux1(.in0(A[1]), .in1(A[2]), .sel(B[0]), .out(OUTPUT[1]));
    mux2to1 mux2(.in0(A[2]), .in1(A[3]), .sel(B[0]), .out(OUTPUT[2]));
    mux2to1 mux3(.in0(A[3]), .in1(A[4]), .sel(B[0]), .out(OUTPUT[3]));
    mux2to1 mux4(.in0(A[4]), .in1(A[5]), .sel(B[0]), .out(OUTPUT[4]));
    mux2to1 mux5(.in0(A[5]), .in1(A[6]), .sel(B[0]), .out(OUTPUT[5]));
    mux2to1 mux6(.in0(A[6]), .in1(A[7]), .sel(B[0]), .out(OUTPUT[6]));
    mux2to1 mux7(.in0(A[7]), .in1(A[8]), .sel(B[0]), .out(OUTPUT[7]));
    mux2to1 mux8(.in0(A[8]), .in1(A[9]), .sel(B[0]), .out(OUTPUT[8]));
    mux2to1 mux9(.in0(A[9]), .in1(A[10]), .sel(B[0]), .out(OUTPUT[9]));
    mux2to1 mux10(.in0(A[10]), .in1(A[11]), .sel(B[0]), .out(OUTPUT[10]));
    mux2to1 mux11(.in0(A[11]), .in1(A[12]), .sel(B[0]), .out(OUTPUT[11]));
    mux2to1 mux12(.in0(A[12]), .in1(A[13]), .sel(B[0]), .out(OUTPUT[12]));
    mux2to1 mux13(.in0(A[13]), .in1(A[14]), .sel(B[0]), .out(OUTPUT[13]));
    mux2to1 mux14(.in0(A[14]), .in1(A[15]), .sel(B[0]), .out(OUTPUT[14]));
    mux2to1 mux15(.in0(A[15]), .in1(A[16]), .sel(B[0]), .out(OUTPUT[15]));
    mux2to1 mux16(.in0(A[16]), .in1(A[17]), .sel(B[0]), .out(OUTPUT[16]));
    mux2to1 mux17(.in0(A[17]), .in1(A[18]), .sel(B[0]), .out(OUTPUT[17]));
    mux2to1 mux18(.in0(A[18]), .in1(A[19]), .sel(B[0]), .out(OUTPUT[18]));
    mux2to1 mux19(.in0(A[19]), .in1(A[20]), .sel(B[0]), .out(OUTPUT[19]));
    mux2to1 mux20(.in0(A[20]), .in1(A[21]), .sel(B[0]), .out(OUTPUT[20]));
    mux2to1 mux21(.in0(A[21]), .in1(A[22]), .sel(B[0]), .out(OUTPUT[21]));
    mux2to1 mux22(.in0(A[22]), .in1(A[23]), .sel(B[0]), .out(OUTPUT[22]));
    mux2to1 mux23(.in0(A[23]), .in1(A[24]), .sel(B[0]), .out(OUTPUT[23]));
    mux2to1 mux24(.in0(A[24]), .in1(A[25]), .sel(B[0]), .out(OUTPUT[24]));
    mux2to1 mux25(.in0(A[25]), .in1(A[26]), .sel(B[0]), .out(OUTPUT[25]));
    mux2to1 mux26(.in0(A[26]), .in1(A[27]), .sel(B[0]), .out(OUTPUT[26]));
    mux2to1 mux27(.in0(A[27]), .in1(A[28]), .sel(B[0]), .out(OUTPUT[27]));
    mux2to1 mux28(.in0(A[28]), .in1(A[29]), .sel(B[0]), .out(OUTPUT[28]));
    mux2to1 mux29(.in0(A[29]), .in1(A[30]), .sel(B[0]), .out(OUTPUT[29]));
    mux2to1 mux30(.in0(A[30]), .in1(A[31]), .sel(B[0]), .out(OUTPUT[30]));
    mux2to1 mux31(.in0(A[31]), .in1(A[31]), .sel(B[0]), .out(OUTPUT[31])); 
    
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 15:08:46
// Design Name: 
// Module Name: top_module_32bit
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

// Top module that uses a 16-to-1 multiplexer to select between different ALU functions
module alu_32bit (
    input [31:0] A,                 // First 32-bit input
    input [31:0] B,                 // Second 32-bit input
    input [3:0] ALUfunction,        // 4-bit input to select ALU function
    output reg [31:0] OUTPUT        // 32-bit output
);

    // Declare internal wires to connect the ALU functions to the 16-to-1 mux
    wire [31:0] alu_out [15:0];

    // Instantiate the 16 ALU function modules (converted to 32-bit)
    ADD_32bit alu0 (.A(A), .B(B), .OUTPUT(alu_out[0]));
    SUB_32bit alu1 (.A(A), .B(B), .OUTPUT(alu_out[1]));
    AND_OP_32bit alu2 (.A(A), .B(B), .OUTPUT(alu_out[2]));
    OR_OP_32bit alu3 (.A(A), .B(B), .OUTPUT(alu_out[3]));
    XOR_OP_32bit alu4 (.A(A), .B(B), .OUTPUT(alu_out[4]));
    NOR_OP_32bit alu5 (.A(A), .B(B), .OUTPUT(alu_out[5]));
    NOT_OP_32bit alu6 (.A(A), .B(B), .OUTPUT(alu_out[6]));
    LSL_OP_32bit alu7 (.A(A), .B(B), .OUTPUT(alu_out[7]));
    RSL_OP_32bit alu8 (.A(A), .B(B), .OUTPUT(alu_out[8]));
    RSA_OP_32bit alu9 (.A(A), .B(B), .OUTPUT(alu_out[9]));
    INC_OP_32bit alu10 (.A(A), .B(B), .OUTPUT(alu_out[10]));
    DEC_OP_32bit alu11 (.A(A), .B(B), .OUTPUT(alu_out[11]));
    SLT_32bit alu12 (.A(A), .B(B), .OUTPUT(alu_out[12]));
    SGT_32bit alu13 (.A(A), .B(B), .OUTPUT(alu_out[13]));
    LUI_32bit alu14 (.A(A), .OUTPUT(alu_out[14]));
    HAM_32bit alu15 (.A(A), .B(B), .OUTPUT(alu_out[15]));

    // Mux to select the appropriate ALU function
    always@(*) begin
        case(ALUfunction)
            4'd0: OUTPUT = alu_out[0];
            4'd1: OUTPUT = alu_out[1];
            4'd2: OUTPUT = alu_out[2];
            4'd3: OUTPUT = alu_out[3];
            4'd4: OUTPUT = alu_out[4];
            4'd5: OUTPUT = alu_out[5];
            4'd6: OUTPUT = alu_out[6];
            4'd7: OUTPUT = alu_out[7];
            4'd8: OUTPUT = alu_out[8];
            4'd9: OUTPUT = alu_out[9];
            4'd10: OUTPUT = alu_out[10];
            4'd11: OUTPUT = alu_out[11];
            4'd12: OUTPUT = alu_out[12];
            4'd13: OUTPUT = alu_out[13];
            4'd14: OUTPUT = alu_out[14];
            4'd15: OUTPUT = alu_out[15];

            default: OUTPUT = 32'b0; // Default case to avoid latches
        endcase
    end

endmodule

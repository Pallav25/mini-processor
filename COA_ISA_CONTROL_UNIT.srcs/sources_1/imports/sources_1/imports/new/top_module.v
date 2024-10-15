`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.09.2024 12:12:05
// Design Name: 
// Module Name: top_module
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

module top_module (
    input wire rst,
    input wire clk,
    input wire perform,
    input wire [3:0] Rx,
    input wire [3:0] Ry,
    input wire [3:0] Rz,
    input wire [3:0] op,
    output wire [15:0]  result,
    output [3:0] read_reg1,
    output [3:0] read_reg2, 
    output [3:0] write_reg
);

    
    wire [31:0] write_data;
    wire [31:0] alu_in1, alu_in2,alu_out;
    wire [31:0] reg1, reg2;
    wire [3:0] alu_op;
    wire write_enable;

    // Instantiate the Register Bank
    register_bank reg_bank (
        .rst(rst),
        .clk(clk),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_data1(alu_in1),
        .read_data2(alu_in2)        
    );

    // Instantiate the Control Path
    control_path ctrl_path (
        .clk(clk),
        .rst(rst),
        .perform(perform),
        .Rx(Rx),
        .Ry(Ry),
        .Rz(Rz),
        .op(op),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg),
        .result(result),
        .alu_op(alu_op),
        .write_enable(write_enable),
        .ldA(ldA),
        .ldB(ldB),
        .ldZ(ldZ)

    );

    // Instantiate the ALU
    alu_32bit alu (
        .A(alu_in1),
        .B(alu_in2),
        .ALUfunction(alu_op),
        .OUTPUT(alu_out) // Result to be written back to register bank
    );

    independent_register A(
        .clk(clk),
        .ld(ldA),
        .inputdata(reg1),
        .data(alu_in1)
    );

    independent_register B(
        .clk(clk),
        .ld(ldB),
        .inputdata(reg2),
        .data(alu_in2)
    );

    independent_register Z(
        .clk(clk),
        .ld(ldZ),
        .inputdata(alu_out),
        .data(write_data)
    );

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.09.2024 22:11:04
// Design Name: 
// Module Name: reg_bank
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

module register_bank (
    input wire clk,
    input wire rst,
    input wire [2:0] read_reg1,    // First register to read
    input wire [2:0] read_reg2,    // Second register to read
    input wire [2:0] write_reg,    // Register to write
    input wire [31:0] write_data,  // Data to write
    input wire write_enable,          // Write enable signal and if disabled then read
    output reg[31:0] read_data1, // Data output from read_reg1
    output reg[31:0] read_data2,  // Data output from read_reg2
    output wire [31:0] value1,
    output wire [31:0] value2,
    output wire [31:0] value3,
    output wire [31:0] value4,
    output wire [31:0] value5,
    output wire [31:0] value6,
    output wire [31:0] value7
);

    reg [31:0] registers [7:0]; // 8 registers of 32-bits each
    
    assign value1=registers[1];
    assign value2=registers[2];
    assign value3=registers[3];
    assign value4=registers[4];
    assign value5=registers[5];
    assign value6=registers[6];
    assign value7=registers[7];
    

    // Initialize R0 to 0
    initial begin
        registers[0] = 32'b0;
    end

    always @(negedge clk) begin
        read_data1<=registers[read_reg1];
        read_data2<=registers[read_reg2];
    end
    

    // Write operation (sequential)
    always @(posedge clk) begin
        if(rst) begin
            registers[1]<=32'd36;
            registers[2]<=32'd12;
            registers[3]<=32'd124;
            registers[4]<=32'd3;
            registers[5]<=32'd1;
            registers[6]<=32'd15;
            registers[7]<=32'd2;
        end
        else if (write_enable && write_reg != 3'b000) begin
            registers[write_reg] <= write_data;
        end
    end
endmodule

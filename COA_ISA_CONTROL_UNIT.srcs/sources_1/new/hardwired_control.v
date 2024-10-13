`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2024 10:00:49
// Design Name: 
// Module Name: hardwired_control
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

module control_unit (
    input wire clk,
    input wire reset,
    input wire [5:0] opcode,
    input wire [12:0] funct,
    input wire zero_flag,
    output reg [3:0] alu_op,
    output reg reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, pc_write, ir_write,
    output reg [2:0] state
);

    // State encoding
    parameter IF = 3'b000, ID = 3'b001, EX = 3'b010, MEM = 3'b011, WB = 3'b100;

    // State register
    reg [2:0] next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IF;
        else
            state <= next_state;
    end

    // Combinational logic for next state and control signals
    always @(*) begin
        // Default control signal values
        {reg_dst, alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, pc_write, ir_write} = 9'b0;
        alu_op = 4'b0000;
        next_state = state;

        case (state)
            IF: begin
                pc_write = 1'b1;
                ir_write = 1'b1;
                next_state = ID;
            end

            ID: begin
                // Decode instruction and set control signals
                case (opcode)
                    6'b000000: begin  // R-type
                        reg_dst = 1'b1;
                        alu_op = funct[3:0];  // Assuming ALU op is in the lower 4 bits of funct
                        next_state = EX;
                    end
                    // Add more cases for other instruction types
                endcase
            end

            EX: begin
                // Execute instruction
                case (opcode)
                    6'b000000: next_state = WB;  // R-type
                    // Add more cases for other instruction types
                endcase
            end

            MEM: begin
                // Memory access
                case (opcode)
                    // Add cases for load/store instructions
                endcase
            end

            WB: begin
                // Write back
                reg_write = 1'b1;
                next_state = IF;
            end
        endcase
    end
endmodule
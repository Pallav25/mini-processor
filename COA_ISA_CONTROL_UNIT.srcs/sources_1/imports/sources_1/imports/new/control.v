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

module control_path (
    input wire clk,
    input wire rst,
    input wire perform,
    input wire [3:0] Rx,
    input wire [3:0] Ry,
    input wire [3:0] Rz,
    input wire [3:0] op,
    output reg [3:0] read_reg1,
    output reg [3:0] read_reg2,
    output reg [3:0] write_reg,
    output reg [3:0] alu_op,
    output reg write_enable,
    output reg ldUp,
    output reg ldLow,
    output reg ldA,
    output reg ldB,
    output reg ldZ
);

//implement the control path using 4 states
//state 0: IDLE
//state 1: READ
//state 2: EXECUTE
//state 4: WRITE

//state register
reg [1:0] state_reg, state_next;

//state transition logic
always @(state_reg) begin
    case(state_reg)
        2'b00: begin
            state_next = 2'b00;
        end
        2'b01: begin
            state_next = 2'b10;
        end
        2'b10: begin
            state_next = 2'b11;
        end
        2'b11: begin
            state_next = 2'b00;
        end
        default: begin
            state_next = 2'b00;
        end
    endcase
end

always@(posedge perform) begin
    if(state_reg == 2'b00) begin
        state_next = 2'b01;
    end
end

//state register update
always @(posedge clk) begin
    if(rst) begin
        state_reg <= 2'b00;
        state_next <=2'b00;
    end
    else begin
        state_reg <= state_next;
    end
end

//control signals depending on state
always @(state_reg) begin
    case(state_reg)
        2'b00: begin
            read_reg1 <= 4'b0000;
            read_reg2 <= 4'b0000;
            ldA <= 1'b0;
            ldB <= 1'b0;
            ldZ <= 1'b0;
            write_enable <= 1'b0;
            ldLow <= 1'b0;
        end
        2'b01: begin
            read_reg1 <= Rz;
            read_reg2 <= Ry;
            #1 ldA <= 1'b1;
            #1 ldB <= 1'b1;
        end
        2'b10: begin
            alu_op <= op;
            #1 ldZ <= 1'b1;
            #1 ldA <= 1'b0;
            #1 ldB <= 1'b0;            
            #1 ldUp <= 1'b1;
        end
        2'b11: begin
            write_reg <= Rx;
            #1 write_enable <= 1'b1;
            #1 ldZ <= 1'b0;
            ldUp <= 1'b0;
            ldLow <= 1'b1;
        end
        default: begin
            read_reg1 = 4'b0000;
            read_reg2 = 4'b0000;
            write_reg = 4'b0000;
            alu_op = 4'b0000;
            write_enable = 1'b0;
        end
    endcase
end

endmodule
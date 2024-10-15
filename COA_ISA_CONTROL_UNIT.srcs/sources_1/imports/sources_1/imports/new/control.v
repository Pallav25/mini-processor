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
    input wire [2:0] control, // 3-bit control input
    output reg [2:0] read_reg1,
    output reg [2:0] read_reg2,
    output reg [2:0] write_reg,
    output reg [3:0] alu_op,
    output reg write_enable,
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
            read_reg1 = 3'b000;
            read_reg2 = 3'b000;
            ldA = 1'b0;
            ldB = 1'b0;
            ldZ = 1'b0;
            write_enable = 1'b0;
        end
        2'b01: begin
            case(control)
                3'b000: begin
                    read_reg1 <= 3'b010;
                    read_reg2 <= 3'b011;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

                3'b001: begin
                    read_reg1 <= 3'b001;
                    read_reg2 <= 3'b101;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                    write_enable <= 1'b0;
                end

                3'b010: begin
                    read_reg1 <= 3'b001;
                    read_reg2 <= 3'b010;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

                3'b011: begin
                    read_reg1 <= 3'b001;
                    read_reg2 <= 3'b010;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

                3'b100: begin
                    read_reg1 <= 3'b001;
                    read_reg2 <= 3'b010;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

                3'b101: begin
                    read_reg1 <= 3'b001;
                    read_reg2 <= 3'b010;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

                3'b110: begin
                    read_reg1 <= 3'b010;
                    read_reg2 <= 3'b000;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

                3'b111: begin
                    read_reg1 <= 3'b000;
                    read_reg2 <= 3'b000;
                    #1 ldA <= 1'b1;
                    #1 ldB <= 1'b1;
                end

            endcase
        end
        2'b10: begin
            case(control)
                3'b000: begin
                    alu_op <= 4'd0;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b001: begin
                    alu_op <= 4'd1;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b010: begin
                    alu_op <= 4'd10;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b011: begin
                    alu_op <= 4'd11;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b100: begin
                    alu_op <= 4'd2;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b101: begin
                    alu_op <= 4'd4;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b110: begin
                    alu_op <= 4'd8;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

                3'b111: begin
                    alu_op <= 4'd8;
                    #1 ldZ <= 1'b1;
                    #1 ldA <= 1'b0;
                    #1 ldB <= 1'b0;
                end

            endcase
        end
        2'b11: begin
            case(control)
                3'b000: begin
                    write_reg <= 3'b001;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

                3'b001: begin
                    write_reg <= 3'b100;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

                3'b010: begin
                    write_reg <= 3'b010;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

                3'b011: begin
                    write_reg <= 3'b111;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

                3'b100: begin
                    write_reg <= 3'b110;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

                3'b101: begin
                    write_reg <= 3'b001;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end 

                3'b110: begin
                    write_reg <= 3'b011;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

                3'b111: begin
                    write_reg <= 3'b110;
                    #1 write_enable <= 1'b1;
                    #1 ldZ <= 1'b0;
                end

            endcase
        end
        default: begin
            read_reg1 = 3'b000;
            read_reg2 = 3'b000;
            write_reg = 3'b000;
            alu_op = 4'b0000;
            write_enable = 1'b0;
        end
    endcase
end

endmodule
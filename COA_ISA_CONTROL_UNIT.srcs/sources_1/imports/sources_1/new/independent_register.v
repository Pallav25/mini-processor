`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2024 22:08:04
// Design Name: 
// Module Name: independent_register
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


module independent_register(
    input ld,
    input clk,
    input [31:0] inputdata,
    output reg [31:0] data
    );
    
    always@(posedge clk) begin
        if(ld) data <=inputdata;
    end
endmodule

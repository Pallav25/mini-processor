`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2024 21:59:27
// Design Name: 
// Module Name: reg_16bit
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


module reg_16bit(
    input ldUp,
    input ldLow,
    input clk,
    input [31:0] inputdata,
    output reg [15:0] data
    );
    
    always@(posedge clk) begin
        if(ldUp) data <=inputdata[31:16];
        else if(ldLow) data <=inputdata[15:0];
        else data <= 16'b0;
    end
endmodule

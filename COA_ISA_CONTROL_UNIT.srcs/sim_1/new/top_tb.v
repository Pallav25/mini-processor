`timescale 1ns / 1ps

module top_module_tb;

    // Inputs
    reg rst;
    reg clk;
    reg perform;
    reg [3:0] Rx;
    reg [3:0] Ry;
    reg [3:0] Rz;
    reg [3:0] op;

    // Outputs
    wire [15:0] result;
    wire [3:0] read_reg1;
    wire [3:0] read_reg2;
    wire [3:0] write_reg;


    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .rst(rst),
        .clk(clk),
        .perform(perform),
        .Rx(Rx),
        .Ry(Ry),
        .Rz(Rz),
        .op(op),
        .result(result),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        rst = 1;
        clk = 0;
        perform = 0;
        Rx = 0;
        Ry = 0;
        Rz = 0;
        op = 0;

        // Wait for global reset
        #10;
        rst = 0;

        // Test Case 1: ADD
        #10;
        perform = 1;
        Rx = 4'b0001; // Register 1
        Ry = 4'b0010; // Register 2
        Rz = 4'b0011; // Register 3
        op = 4'b0000; // ADD operation
        #10;
        perform = 0;
        #50;

        // Test Case 2: SUB
        #10;
        perform = 1;
        Rx = 4'b0100; // Register 4
        Ry = 4'b0101; // Register 5
        Rz = 4'b0110; // Register 6
        op = 4'b0001; // SUB operation
        #10;
        perform = 0;
        #50;

        // Test Case 3: AND
        #10;
        perform = 1;
        Rx = 4'b0111; // Register 7
        Ry = 4'b1000; // Register 8
        Rz = 4'b1001; // Register 9
        op = 4'b0010; // AND operation
        #10;
        perform = 0;
        #50;

        // Test Case 4: OR
        #10;
        perform = 1;
        Rx = 4'b1010; // Register 10
        Ry = 4'b1011; // Register 11
        Rz = 4'b1100; // Register 12
        op = 4'b0011; // OR operation
        #10;
        perform = 0;
        #50;

        // Test Case 5: XOR
        #10;
        perform = 1;
        Rx = 4'b1101; // Register 13
        Ry = 4'b1110; // Register 14
        Rz = 4'b1111; // Register 15
        op = 4'b0100; // XOR operation
        #10;
        perform = 0;
        #50;

        // Test Case 6: NOR
        #10;
        perform = 1;
        Rx = 4'b0001; // Register 1
        Ry = 4'b0010; // Register 2
        Rz = 4'b0011; // Register 3
        op = 4'b0101; // NOR operation
        #10;
        perform = 0;
        #50;

        // Test Case 7: NOT
        #10;
        perform = 1;
        Rx = 4'b0100; // Register 4
        Ry = 4'b0101; // Register 5
        Rz = 4'b0110; // Register 6
        op = 4'b0110; // NOT operation
        #10;
        perform = 0;
        #50;

        // Test Case 8: SL
        #10;
        perform = 1;
        Rx = 4'b0111; // Register 7
        Ry = 4'b1000; // Register 8
        Rz = 4'b1001; // Register 9
        op = 4'b0111; // SL operation
        #10;
        perform = 0;
        #50;

        // Test Case 9: SRL
        #10;
        perform = 1;
        Rx = 4'b1010; // Register 10
        Ry = 4'b1011; // Register 11
        Rz = 4'b1100; // Register 12
        op = 4'b1000; // SRL operation
        #10;
        perform = 0;
        #50;

        // Test Case 10: SRA
        #10;
        perform = 1;
        Rx = 4'b1101; // Register 13
        Ry = 4'b1110; // Register 14
        Rz = 4'b1111; // Register 15
        op = 4'b1001; // SRA operation
        #10;
        perform = 0;
        #50;

        // Test Case 11: INC
        #10;
        perform = 1;
        Rx = 4'b0001; // Register 1
        Ry = 4'b0010; // Register 2
        Rz = 4'b0011; // Register 3
        op = 4'b1010; // INC operation
        #10;
        perform = 0;
        #50;

        // Test Case 12: DEC
        #10;
        perform = 1;
        Rx = 4'b0100; // Register 4
        Ry = 4'b0101; // Register 5
        Rz = 4'b0110; // Register 6
        op = 4'b1011; // DEC operation
        #10;
        perform = 0;
        #50;

        // Test Case 13: SLT
        #10;
        perform = 1;
        Rx = 4'b0111; // Register 7
        Ry = 4'b1000; // Register 8
        Rz = 4'b1001; // Register 9
        op = 4'b1100; // SLT operation
        #10;
        perform = 0;
        #50;

        // Test Case 14: SGT
        #10;
        perform = 1;
        Rx = 4'b1010; // Register 10
        Ry = 4'b1011; // Register 11
        Rz = 4'b1100; // Register 12
        op = 4'b1101; // SGT operation
        #10;
        perform = 0;
        #50;

        // Test Case 15: LUI
        #10;
        perform = 1;
        Rx = 4'b1101; // Register 13
        Ry = 4'b1110; // Register 14
        Rz = 4'b1111; // Register 15
        op = 4'b1110; // LUI operation
        #10;
        perform = 0;
        #50;

        // Test Case 16: HAM
        #10;
        perform = 1;
        Rx = 4'b0001; // Register 1
        Ry = 4'b0010; // Register 2
        Rz = 4'b0011; // Register 3
        op = 4'b1111; // HAM operation
        #10;
        perform = 0;
        #50;

        // Finish simulation
        #10;
        $finish;
    end

endmodule
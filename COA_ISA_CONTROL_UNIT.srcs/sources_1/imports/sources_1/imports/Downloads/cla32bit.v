`timescale 1ns / 1ps

module ADD_32bit(
    input [31:0] A, 
    input [31:0] B, 
    output cout, 
    output [31:0] OUTPUT
);
    wire t1, t2, t3, t4, t5, t6, t7;
    wire cin;
    assign cin=1'b0;
    
    // First 4-bit carry lookahead blocks
    carry_lookhead f1(A[3:0], B[3:0], cin, t1, OUTPUT[3:0]);
    carry_lookhead f2(A[7:4], B[7:4], t1, t2, OUTPUT[7:4]);
    carry_lookhead f3(A[11:8], B[11:8], t2, t3, OUTPUT[11:8]);
    carry_lookhead f4(A[15:12], B[15:12], t3, t4, OUTPUT[15:12]);
    
    // Second 4-bit carry lookahead blocks
    carry_lookhead f5(A[19:16], B[19:16], t4, t5, OUTPUT[19:16]);
    carry_lookhead f6(A[23:20], B[23:20], t5, t6, OUTPUT[23:20]);
    carry_lookhead f7(A[27:24], B[27:24], t6, t7, OUTPUT[27:24]);
    carry_lookhead f8(A[31:28], B[31:28], t7, cout, OUTPUT[31:28]);

endmodule

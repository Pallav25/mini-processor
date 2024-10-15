module HAM_32bit(
    input [31:0] A,
    input [31:0] B,
    output [31:0] OUTPUT
);
    wire [3:0] output0, output1, output2, output3;
    wire [4:0] sum1, sum2;

    // Instantiate the 8-bit HAM module four times
    HAM ham0 (
        .A(A[7:0]),
        .B(B[7:0]),
        .OUTPUT(output0)
    );

    HAM ham1 (
        .A(A[15:8]),
        .B(B[15:8]),
        .OUTPUT(output1)
    );

    HAM ham2 (
        .A(A[23:16]),
        .B(B[23:16]),
        .OUTPUT(output2)
    );

    HAM ham3 (
        .A(A[31:24]),
        .B(B[31:24]),
        .OUTPUT(output3)
    );

    carry_lookhead cla1 (
        .a(output0),
        .b(output1),
        .cin(1'b0),
        .sum(sum1[3:0]),
        .cout(sum1[4])

    );

    carry_lookhead cla2 (
        .a(output2),
        .b(output3),
        .cin(1'b0),
        .sum(sum2[3:0]),
        .cout(sum2[4])

    );

    // Add the intermediate sums
    FIVE_BIT_ADDER fba3 (
        .a(sum1),
        .b(sum2),
        .cin(1'b0),
        .sum(OUTPUT[4:0]),
        .cout(OUTPUT[5])
    );
    assign OUTPUT[31:6] = 26'b0;


endmodule
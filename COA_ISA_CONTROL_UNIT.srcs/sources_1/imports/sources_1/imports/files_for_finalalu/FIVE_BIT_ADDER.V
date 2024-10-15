

module FIVE_BIT_ADDER(
    input [4:0] a,
    input [4:0] b,
    input cin,
    output [4:0] sum,
    output cout
);
    wire [3:0] Sum1;
    wire Cout1;

    // Instantiate the first 4-bit adder cla
    carry_lookhead cla0 (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(cin),
        .sum(Sum1),
        .cout(Cout1)
    );
    // Instantiate A FULL ADDER for msb
    FULLADDER fa1 (
        .A(a[4]),
        .B(b[4]),
        .Cin(Cout1),
        .Sum(sum[4]),
        .Cout(cout)
    );
    assign sum[3:0] = Sum1;
endmodule
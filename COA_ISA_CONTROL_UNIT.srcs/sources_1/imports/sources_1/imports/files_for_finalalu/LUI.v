//load upper immideate in structural way
module LUI_32bit(
    input [31:0] A,
    output [31:0] OUTPUT
    );

    //Assuming higher 16 bits of A are just sign extended and lower 16 bits have immediate value to be loaded
    assign OUTPUT[31]=A[15];
    assign OUTPUT[30]=A[14];
    assign OUTPUT[29]=A[13];
    assign OUTPUT[28]=A[12];
    assign OUTPUT[27]=A[11];
    assign OUTPUT[26]=A[10];
    assign OUTPUT[25]=A[9];
    assign OUTPUT[24]=A[8];
    assign OUTPUT[23]=A[7];
    assign OUTPUT[22]=A[6];
    assign OUTPUT[21]=A[5];
    assign OUTPUT[20]=A[4];
    assign OUTPUT[19]=A[3];
    assign OUTPUT[18]=A[2];
    assign OUTPUT[17]=A[1];
    assign OUTPUT[16]=A[0];
    assign OUTPUT[15]=1'b0;
    assign OUTPUT[14]=1'b0;
    assign OUTPUT[13]=1'b0;
    assign OUTPUT[12]=1'b0;
    assign OUTPUT[11]=1'b0;
    assign OUTPUT[10]=1'b0;
    assign OUTPUT[9]=1'b0;
    assign OUTPUT[8]=1'b0;
    assign OUTPUT[7]=1'b0;
    assign OUTPUT[6]=1'b0;
    assign OUTPUT[5]=1'b0;
    assign OUTPUT[4]=1'b0;
    assign OUTPUT[3]=1'b0;
    assign OUTPUT[2]=1'b0;
    assign OUTPUT[1]=1'b0;
    assign OUTPUT[0]=1'b0;

endmodule
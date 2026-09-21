`include "src/parte_2/laboratorio_2_1_sumador_1bitA.v"

module sumador_3bits (
    input [2:0] A,
    input [2:0] B,
    input Cin,
    output [2:0] S,
    output [3:0] suma_total
);

wire C1;
wire C2;
wire Carry_out;

sumador_1bit bit_0 (
    .A(A[0]),
    .B(B[0]),
    .Cin(Cin),
    .Cout(C1),
    .S(S[0])
);

sumador_1bit bit_1 (
    .A(A[1]),
    .B(B[1]),
    .Cin(C1),
    .Cout(C2),
    .S(S[1])
);

sumador_1bit bit_2 (
    .A(A[2]),
    .B(B[2]),
    .Cin(C2),
    .Cout(Carry_out),
    .S(S[2])
);

assign suma_total = {Carry_out, S};

endmodule

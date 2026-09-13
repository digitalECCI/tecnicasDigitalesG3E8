//`include "laboratorio_1_4A.v"

module full_sumador (
    input  [3:0] A,
    input  [3:0] B,
    output       Co,
    output [3:0] S
);

    wire C1;
    wire C2;
    wire C3;

    sumador_1bit bit0 (
        .A(A[0]),
        .B(B[0]),
        .Ci(1'b0),
        .Co(C1),
        .S(S[0])
    );

    sumador_1bit bit1 (
        .A(A[1]),
        .B(B[1]),
        .Ci(C1),
        .Co(C2),
        .S(S[1])
    );

    sumador_1bit bit2 (
        .A(A[2]),
        .B(B[2]),
        .Ci(C2),
        .Co(C3),
        .S(S[2])
    );

   
    sumador_1bit bit3 (
        .A(A[3]),
        .B(B[3]),
        .Ci(C3),
        .Co(Co),
        .S(S[3])
    );

endmodule

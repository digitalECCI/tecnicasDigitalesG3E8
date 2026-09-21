`include "src/parte_2/laboratorio_2_2_sumador_3bitB.v"

module deco7seg (
    input [2:0] A,
    input [2:0] B,
    output [3:0] suma_total,
    output reg [6:0] display
);

wire [3:0] binario;

sumador_3bits visualizacion (
    .A(A),
    .B(B),
    .Cin(1'b0),
    .suma_total(suma_total)
);

assign binario = suma_total;

always @(*) begin
    case (binario)
        /* 0 */ 4'b0000: display = 7'b0000001;
        /* 1 */ 4'b0001: display = 7'b1001111;
        /* 2 */ 4'b0010: display = 7'b0010010;
        /* 3 */ 4'b0011: display = 7'b0000110;
        /* 4 */ 4'b0100: display = 7'b1001100;
        /* 5 */ 4'b0101: display = 7'b0100100;
        /* 6 */ 4'b0110: display = 7'b0100000;
        /* 7 */ 4'b0111: display = 7'b0001111;
        /* 8 */ 4'b1000: display = 7'b0000000;
        /* 9 */ 4'b1001: display = 7'b0000100;
        /* A */ 4'b1010: display = 7'b0001000;
        /* B */ 4'b1011: display = 7'b1100000;
        /* C */ 4'b1100: display = 7'b0110001;
        /* D */ 4'b1101: display = 7'b1000010;
        /* E */ 4'b1110: display = 7'b0110000;
        /* F */ 4'b1111: display = 7'b0111000;
        default: display = 7'b1111111;
    endcase
end

endmodule

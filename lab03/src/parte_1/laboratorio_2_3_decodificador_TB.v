`timescale 1s/1s

`include "src/parte_1/laboratorio_2_3_decodificador.v"

module decodificar_binario_digital_TB();

reg [3:0] A_TB;
wire [6:0] display_TB;

decodificar_binario_digital uut (
    .A(A_TB),
    .display(display_TB)
);

initial begin
    A_TB = 4'b0000;
    #5;
    A_TB = 4'b0001;
    #5;
    A_TB = 4'b0010;
    #5;
    A_TB = 4'b0011;
    #5;
    A_TB = 4'b0100;
    #5;
    A_TB = 4'b0101;
    #5;
    A_TB = 4'b0110;
    #5;
    A_TB = 4'b0111;
    #5;
    A_TB = 4'b1000;
    #5;
    A_TB = 4'b1001;
    #5;
    A_TB = 4'b1010;
    #5;
    A_TB = 4'b1011;
    #5;
    A_TB = 4'b1100;
    #5;
    A_TB = 4'b1101;
    #5;
    A_TB = 4'b1110;
    #5;
    A_TB = 4'b1111;
    #5;
    $finish;
end

initial begin
    $dumpfile("simulacion_BCD.vcd");
    $dumpvars(0, decodificar_binario_digital_TB);
end

endmodule

`timescale 1s/1s

`include "src/parte_2/deco7seg.v"

module deco7seg_Tb();

reg [2:0] A_TB;
reg [2:0] B_TB;

wire [3:0] suma_total_TB;
wire [6:0] display_TB;

integer i;
integer j;

deco7seg uut (
    .A(A_TB),
    .B(B_TB),
    .display(display_TB),
    .suma_total(suma_total_TB)
);

initial begin
    for (i = 0; i < 8; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            A_TB = i;
            B_TB = j;
            #5;
        end
    end
    $finish;
end

initial begin
    $dumpfile("simulador_deco3bits.vcd");
    $dumpvars(0, deco7seg_Tb);
end

endmodule

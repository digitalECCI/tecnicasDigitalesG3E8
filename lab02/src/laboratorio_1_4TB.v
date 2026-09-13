`include "laboratorio_1_4B.v"

`timescale 1s/1s

module full_sumador_TB();

   
    reg [3:0] A_TB;
    reg [3:0] B_TB;

    // Salidas
    wire [3:0] S_TB;
    wire       Co_TB;

    integer i;
    integer j;

    full_sumador uut (
        .A(A_TB),
        .B(B_TB),
        .Co(Co_TB),
        .S(S_TB)
    );

    initial begin

        for (i = 0; i < 16; i = i + 1) begin

           
            for (j = 0; j < 16; j = j + 1) begin

                A_TB = i;
                B_TB = j;

                #5;

            end

        end

        $finish;

    end

   
    initial begin

        $dumpfile("simulacion_full_sumador.vcd");
        $dumpvars(0, full_sumador_TB);

    end

endmodule
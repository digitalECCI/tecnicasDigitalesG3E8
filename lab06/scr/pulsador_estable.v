module pulsador_estable #(
    parameter integer CICLOS_ESTABLES = 500_000,
    parameter NIVEL_INICIAL = 1'b0
)(
    input wire clk, boton, inhibir,
    output reg nivel = NIVEL_INICIAL,
    output reg pulso = 1'b0
);

localparam integer BITS_CONTADOR =
    (CICLOS_ESTABLES > 1) ? $clog2(CICLOS_ESTABLES) : 1;
localparam integer ULTIMA_CUENTA = CICLOS_ESTABLES - 1;

reg muestra = NIVEL_INICIAL;
reg sincronizado = NIVEL_INICIAL;
reg [BITS_CONTADOR-1:0] contador = 0;
reg liberado = 1'b0;
reg pulso_habilitado = 1'b0;

wire boton_suelto;
assign boton_suelto = !sincronizado && !nivel;

always @(posedge clk) begin
    muestra <= boton;
    sincronizado <= muestra;
    pulso <= 1'b0;

    // Tras el reset, espera dos muestras sueltas antes de aceptar pulsos.
    // Asi tambien salen del sincronizador las muestras tomadas al reiniciar.
    if (inhibir) begin
        liberado <= 1'b0;
        pulso_habilitado <= 1'b0;
    end
    else begin
        liberado <= boton_suelto;
        if (liberado && boton_suelto)
            pulso_habilitado <= 1'b1;
    end

    if (sincronizado == nivel) begin
        contador <= 0;
    end
    else if (contador == ULTIMA_CUENTA[BITS_CONTADOR-1:0]) begin
        contador <= 0;
        nivel <= sincronizado;
        pulso <= sincronizado && pulso_habilitado && !inhibir;
    end
    else begin
        contador <= contador + 1'b1;
    end
end

endmodule

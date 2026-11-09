module polaridad_placa (
    input wire [1:0] teclas_n,
    output wire boton_confirmar, boton_reset
);

// El pulsador de la DE10-Lite entrega 0 al presionarlo.
assign boton_confirmar = ~teclas_n[0];
assign boton_reset = ~teclas_n[1];

endmodule

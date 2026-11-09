module pwm_servo #(
    parameter [19:0] CICLOS_CERRADO = 20'd50_000,
    parameter [19:0] CICLOS_ABIERTO = 20'd100_000
)(
    input wire clk, abrir, fin_trama,
    input wire [19:0] cuenta,
    output reg pwm = 1'b0
);

localparam [19:0] FIN_CERRADO = CICLOS_CERRADO - 20'd1;
localparam [19:0] FIN_ABIERTO = CICLOS_ABIERTO - 20'd1;
reg abierto_en_trama = 1'b0;

always @(posedge clk) begin
    if (fin_trama) begin
        abierto_en_trama <= abrir;
        pwm <= 1'b1;
    end
    // La salida queda registrada para el siguiente valor de cuenta.
    else if (abierto_en_trama)
        pwm <= (cuenta < FIN_ABIERTO);
    else
        pwm <= (cuenta < FIN_CERRADO);
end

endmodule

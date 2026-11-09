module reloj_pwm #(
    parameter [19:0] CICLOS_PERIODO = 20'd1_000_000
)(
    input clk,
    output reg [19:0] cuenta = CICLOS_PERIODO - 20'd1,
    output fin_trama
);

localparam [19:0] CUENTA_MAXIMA = CICLOS_PERIODO - 20'd1;

assign fin_trama = (cuenta == CUENTA_MAXIMA);

always @(posedge clk) begin
    if (fin_trama)
        cuenta <= 20'd0;
    else
        cuenta <= cuenta + 20'd1;
end

endmodule

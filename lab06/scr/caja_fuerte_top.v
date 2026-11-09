module caja_fuerte_top #(
    parameter integer CICLOS_ANTIRREBOTE = 500_000,
    parameter [19:0] CICLOS_PERIODO_PWM = 20'd1_000_000,
    parameter [19:0] CICLOS_SERVO_CERRADO = 20'd50_000,
    parameter [19:0] CICLOS_SERVO_ABIERTO = 20'd100_000,
    parameter TRES_GRUPOS = 1'b1,
    parameter INVERTIR_HEX = 1'b1,
    parameter INVERTIR_LED = 1'b0,
    parameter INVERTIR_PWM = 1'b0
)(
    input wire clk_50mhz,
    input wire [7:0] SW,
    input wire [3:0] SW_EXT,
    input wire [1:0] KEY_N,
    output wire [7:0] HEX0_N, HEX1_N, HEX2_N,
    output wire [7:0] HEX3_N, HEX4_N, HEX5_N,
    output wire led_verde, led_rojo, servo_pwm
);

wire boton_confirmar, boton_reset;
wire confirmar, reset;
wire [3:0] grupo_1, grupo_2, grupo_3;
wire [3:0] digito_eco;
wire [2:0] estado;
wire [1:0] intentos;
wire abrir, verde, rojo;
wire [6:0] seg0, seg1, seg2, seg3, seg4, seg5;
wire punto_error;
wire [19:0] cuenta_pwm;
wire fin_trama, pwm;

polaridad_placa adaptar_teclas (
    .teclas_n(KEY_N),
    .boton_confirmar(boton_confirmar),
    .boton_reset(boton_reset)
);

pulsador_estable #(.CICLOS_ESTABLES(CICLOS_ANTIRREBOTE)) tecla_confirmar (
    .clk(clk_50mhz),
    .boton(boton_confirmar),
    .inhibir(reset),
    .nivel(),
    .pulso(confirmar)
);

pulsador_estable #(
    .CICLOS_ESTABLES(CICLOS_ANTIRREBOTE),
    .NIVEL_INICIAL(1'b1)
) tecla_reset (
    .clk(clk_50mhz),
    .boton(boton_reset),
    .inhibir(1'b0),
    .nivel(reset),
    .pulso()
);

sincronizar_switches entrada_1 (
    .clk(clk_50mhz),
    .switches(SW[3:0]),
    .digito(grupo_1)
);

sincronizar_switches entrada_2 (
    .clk(clk_50mhz),
    .switches(SW[7:4]),
    .digito(grupo_2)
);

sincronizar_switches entrada_3 (
    .clk(clk_50mhz),
    .switches(SW_EXT),
    .digito(grupo_3)
);

control_caja_fuerte #(.TRES_GRUPOS(TRES_GRUPOS)) control (
    .clk(clk_50mhz),
    .reset(reset),
    .confirmar(confirmar),
    .grupo_1(grupo_1),
    .grupo_2(grupo_2),
    .grupo_3(grupo_3),
    .estado(estado),
    .intentos(intentos),
    .digito_eco(digito_eco),
    .abrir(abrir),
    .led_verde(verde),
    .led_rojo(rojo)
);

mensajes_caja_fuerte display (
    .estado(estado),
    .digito_eco(digito_eco),
    .intentos(intentos),
    .seg0(seg0),
    .seg1(seg1),
    .seg2(seg2),
    .seg3(seg3),
    .seg4(seg4),
    .seg5(seg5),
    .punto_error(punto_error)
);

reloj_pwm #(.CICLOS_PERIODO(CICLOS_PERIODO_PWM)) reloj_servo (
    .clk(clk_50mhz),
    .cuenta(cuenta_pwm),
    .fin_trama(fin_trama)
);

pwm_servo #(
    .CICLOS_CERRADO(CICLOS_SERVO_CERRADO),
    .CICLOS_ABIERTO(CICLOS_SERVO_ABIERTO)
) servo (
    .clk(clk_50mhz),
    .abrir(abrir),
    .cuenta(cuenta_pwm),
    .fin_trama(fin_trama),
    .pwm(pwm)
);

acondicionar_salidas #(
    .INVERTIR_HEX(INVERTIR_HEX),
    .INVERTIR_LED(INVERTIR_LED),
    .INVERTIR_PWM(INVERTIR_PWM)
) adaptar_salidas (
    .seg0(seg0),
    .seg1(seg1),
    .seg2(seg2),
    .seg3(seg3),
    .seg4(seg4),
    .seg5(seg5),
    .punto_error(punto_error),
    .verde(verde),
    .rojo(rojo),
    .pwm(pwm),
    .HEX0_N(HEX0_N),
    .HEX1_N(HEX1_N),
    .HEX2_N(HEX2_N),
    .HEX3_N(HEX3_N),
    .HEX4_N(HEX4_N),
    .HEX5_N(HEX5_N),
    .led_verde(led_verde),
    .led_rojo(led_rojo),
    .servo_pwm(servo_pwm)
);

endmodule

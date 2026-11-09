module acondicionar_salidas #(
    parameter INVERTIR_HEX = 1'b1,
    parameter INVERTIR_LED = 1'b0,
    parameter INVERTIR_PWM = 1'b0
)(
    input [6:0] seg0, seg1, seg2, seg3, seg4, seg5,
    input punto_error,
    input verde, rojo, pwm,
    output [7:0] HEX0_N, HEX1_N, HEX2_N, HEX3_N, HEX4_N, HEX5_N,
    output led_verde, led_rojo, servo_pwm
);

// Bits [6:0]: gfedcba. Bit [7]: punto decimal independiente.
localparam [6:0] MASCARA_HEX = {7{INVERTIR_HEX}};

assign HEX0_N = {INVERTIR_HEX, seg0 ^ MASCARA_HEX};
assign HEX1_N = {INVERTIR_HEX, seg1 ^ MASCARA_HEX};
assign HEX2_N = {INVERTIR_HEX, seg2 ^ MASCARA_HEX};
assign HEX3_N = {(punto_error ^ INVERTIR_HEX), seg3 ^ MASCARA_HEX};
assign HEX4_N = {INVERTIR_HEX, seg4 ^ MASCARA_HEX};
assign HEX5_N = {INVERTIR_HEX, seg5 ^ MASCARA_HEX};

assign led_verde = verde ^ INVERTIR_LED;
assign led_rojo = rojo ^ INVERTIR_LED;
assign servo_pwm = pwm ^ INVERTIR_PWM;

endmodule

module mensajes_caja_fuerte (
    input [2:0] estado,
    input [3:0] digito_eco,
    input [1:0] intentos,
    output reg [6:0] seg0, seg1, seg2, seg3, seg4, seg5,
    output punto_error
);

// Segmentos activos en alto, orden gfedcba.
localparam [6:0] BLANCO = 7'h00;
localparam [6:0] GUION  = 7'h40;
localparam [6:0] A = 7'h77, b = 7'h7C, c = 7'h58, E = 7'h79;
localparam [6:0] I = 7'h06, L = 7'h38, n = 7'h54, O = 7'h3F;
localparam [6:0] q = 7'h67, S = 7'h6D, t = 7'h78, u = 7'h1C;

localparam [2:0] S_CAP1    = 3'b001;
localparam [2:0] S_CAP2    = 3'b010;
localparam [2:0] S_ABIERTO = 3'b100;
localparam [2:0] S_ERROR   = 3'b101;
localparam [2:0] S_BLOQUEO = 3'b110;

wire [3:0] numero;
wire [6:0] patron_numero;

assign numero = (estado == S_ERROR) ? {2'b00, intentos} : digito_eco;
assign punto_error = (estado == S_ERROR);

decodificador_hexadecimal numero_display (
    .numero(numero),
    .segmentos(patron_numero)
);

always @(*) begin
    case (estado)
        S_CAP1, S_CAP2:
            {seg5, seg4, seg3, seg2, seg1, seg0} =
                {BLANCO, BLANCO, BLANCO, BLANCO, BLANCO, patron_numero};
        S_ABIERTO:
            {seg5, seg4, seg3, seg2, seg1, seg0} = {A, c, c, E, S, O};
        S_ERROR:
            {seg5, seg4, seg3, seg2, seg1, seg0} =
                {I, n, t, BLANCO, BLANCO, patron_numero};
        S_BLOQUEO:
            {seg5, seg4, seg3, seg2, seg1, seg0} = {b, L, O, q, u, E};
        default:
            {seg5, seg4, seg3, seg2, seg1, seg0} = {6{GUION}};
    endcase
end

endmodule

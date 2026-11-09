module control_caja_fuerte #(
    parameter TRES_GRUPOS = 1'b1
)(
    input wire clk, reset, confirmar,
    input wire [3:0] grupo_1, grupo_2, grupo_3,
    output reg [2:0] estado,
    output reg [1:0] intentos,
    output reg [3:0] digito_eco,
    output reg abrir, led_verde, led_rojo
);

localparam [2:0] S_INICIO  = 3'b000;
localparam [2:0] S_CAP1    = 3'b001;
localparam [2:0] S_CAP2    = 3'b010;
localparam [2:0] S_VERIF   = 3'b011;
localparam [2:0] S_ABIERTO = 3'b100;
localparam [2:0] S_ERROR   = 3'b101;
localparam [2:0] S_BLOQUEO = 3'b110;

localparam [11:0] CLAVE = 12'h123;

reg [2:0] estado_siguiente;
reg [3:0] digito_1;
reg [3:0] digito_2;
reg [3:0] digito_3;
wire clave_correcta;

assign clave_correcta = ({digito_1, digito_2, digito_3} == CLAVE);

// 1. Registro de estado, captura de digitos y presupuesto de intentos.
always @(posedge clk) begin
    if (reset) begin
        estado <= S_INICIO;
        intentos <= 2'd3;
        digito_1 <= 4'd0;
        digito_2 <= 4'd0;
        digito_3 <= 4'd0;
    end
    else begin
        estado <= estado_siguiente;

        if (confirmar) begin
            case (estado)
                S_INICIO: digito_1 <= grupo_1;
                S_CAP1:   digito_2 <= TRES_GRUPOS ? grupo_2 : grupo_1;
                S_CAP2:   digito_3 <= TRES_GRUPOS ? grupo_3 : grupo_1;
                S_ERROR: begin
                    if (intentos != 2'd0) begin
                        digito_1 <= 4'd0;
                        digito_2 <= 4'd0;
                        digito_3 <= 4'd0;
                    end
                end
                default: begin end
            endcase
        end

        if (estado == S_VERIF && !clave_correcta && intentos != 2'd0)
            intentos <= intentos - 2'd1;
    end
end

// 2. Proximo estado.
always @(*) begin
    estado_siguiente = estado;
    case (estado)
        S_INICIO: if (confirmar) estado_siguiente = S_CAP1;
        S_CAP1:   if (confirmar) estado_siguiente = S_CAP2;
        S_CAP2:   if (confirmar) estado_siguiente = S_VERIF;
        S_VERIF: begin
            if (clave_correcta)
                estado_siguiente = S_ABIERTO;
            else
                estado_siguiente = S_ERROR;
        end
        S_ABIERTO: estado_siguiente = S_ABIERTO;
        S_ERROR: begin
            if (intentos == 2'd0)
                estado_siguiente = S_BLOQUEO;
            else if (confirmar)
                estado_siguiente = S_INICIO;
        end
        S_BLOQUEO: estado_siguiente = S_BLOQUEO;
        default:   estado_siguiente = S_BLOQUEO;
    endcase
end

// 3. Salidas de control Moore y dato de eco para el display.
always @(*) begin
    abrir = 1'b0;
    led_verde = 1'b0;
    led_rojo = 1'b0;
    digito_eco = 4'd0;

    case (estado)
        S_CAP1: digito_eco = digito_1;
        S_CAP2: digito_eco = digito_2;
        S_ABIERTO: begin
            abrir = 1'b1;
            led_verde = 1'b1;
        end
        S_ERROR, S_BLOQUEO: led_rojo = 1'b1;
        default: begin end
    endcase
end

endmodule

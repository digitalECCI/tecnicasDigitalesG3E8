module decodificador_hexadecimal (
    input wire [3:0] numero,
    output reg [6:0] segmentos
);

// Orden de bits: gfedcba. Los segmentos son activos en alto.
always @(*) begin
    case (numero)
        4'h0: segmentos = 7'h3F;
        4'h1: segmentos = 7'h06;
        4'h2: segmentos = 7'h5B;
        4'h3: segmentos = 7'h4F;
        4'h4: segmentos = 7'h66;
        4'h5: segmentos = 7'h6D;
        4'h6: segmentos = 7'h7D;
        4'h7: segmentos = 7'h07;
        4'h8: segmentos = 7'h7F;
        4'h9: segmentos = 7'h6F;
        4'hA: segmentos = 7'h77;
        4'hB: segmentos = 7'h7C;
        4'hC: segmentos = 7'h39;
        4'hD: segmentos = 7'h5E;
        4'hE: segmentos = 7'h79;
        4'hF: segmentos = 7'h71;
        default: segmentos = 7'd0;
    endcase
end

endmodule

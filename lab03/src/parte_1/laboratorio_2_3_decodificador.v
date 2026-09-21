module decodificar_binario_digital (
    input [3:0] A,
    output reg [6:0] display
);

always @(*) begin
    case (A)
        /* 0 */ 4'b0000: display = 7'b0000001;
        /* 1 */ 4'b0001: display = 7'b1001111;
        /* 2 */ 4'b0010: display = 7'b0010010;
        /* 3 */ 4'b0011: display = 7'b0000110;
        /* 4 */ 4'b0100: display = 7'b1001100;
        /* 5 */ 4'b0101: display = 7'b0100100;
        /* 6 */ 4'b0110: display = 7'b0100000;
        /* 7 */ 4'b0111: display = 7'b0001111;
        /* 8 */ 4'b1000: display = 7'b0000000;
        /* 9 */ 4'b1001: display = 7'b0000100;
        default: display = 7'b1111111;
    endcase
end

endmodule

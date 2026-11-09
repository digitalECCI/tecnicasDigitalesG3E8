module sincronizar_switches (
    input wire clk,
    input wire [3:0] switches,
    output reg [3:0] digito = 4'd0
);

reg [3:0] muestra = 4'd0;

always @(posedge clk) begin
    muestra <= switches;
    digito <= muestra;
end

endmodule

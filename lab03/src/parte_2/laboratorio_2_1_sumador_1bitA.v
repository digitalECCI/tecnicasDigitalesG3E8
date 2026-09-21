module sumador_1bit (
    input A,
    input B,
    input Cin,
    output S,
    output Cout
);

assign S = Cin ^ A ^ B;
assign Cout = (Cin & (A | B)) | (A & B);

endmodule

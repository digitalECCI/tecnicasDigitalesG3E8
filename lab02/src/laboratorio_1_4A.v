module sumador_1bit (

    input A, B, Ci,
    output Co, S


);

    assign Co= (Ci&(A|B))|(A&B);
    assign S = Ci^(A^B);

endmodule
// SystemVerilog 4-Bit Binary to Gray Converter 
// Gate-Level Modeling - Using primitive

module b_to_g (
    output logic [3:0] G,
    input  logic [3:0] B
);

    buf (G[3], B[3]);
    xor (G[2], B[3], B[2]);
    xor (G[1], B[2], B[1]);
    xor (G[0], B[1], B[0]);

endmodule
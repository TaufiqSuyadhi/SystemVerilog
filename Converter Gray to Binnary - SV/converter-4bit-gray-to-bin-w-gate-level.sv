// SystemVerilog code for 4-bit Gray to Binary Converter
// Gate-Level Modeling - Using "Primitive"

module g_to_b_sv (
    output logic [3:0] B,
    input  logic [3:0] G
);

    buf (B[3], G[3]);
    xor (B[2], B[3], G[2]);
    xor (B[1], B[2], G[1]);
    xor (B[0], B[1], G[0]);

endmodule
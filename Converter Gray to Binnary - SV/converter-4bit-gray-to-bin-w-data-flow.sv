// SystemVerilog code for 4-bit Gray to Binary Converter - RTL version
// Gate-Level Modeling - Using continues "assign"

module g_to_b_sv (
    output logic [3:0] B,
    input  logic [3:0] G
);

    assign B[3] = G[3];
    assign B[2] = B[3] ^ G[2];
    assign B[1] = B[2] ^ G[1];
    assign B[0] = B[1] ^ G[0];

endmodule
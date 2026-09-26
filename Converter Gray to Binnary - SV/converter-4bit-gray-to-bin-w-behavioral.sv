// SystemVerilog code for 4-bit Gray to Binary Converter - RTL version
// Gate-Level Modeling - Using continues "always_comb"

module g_to_b_sv (
    output logic [3:0] B,
    input  logic [3:0] G
);

    always_comb begin
        B[3] = G[3];
        B[2] = B[3] ^ G[2];
        B[1] = B[2] ^ G[1];
        B[0] = B[1] ^ G[0];
    end

endmodule

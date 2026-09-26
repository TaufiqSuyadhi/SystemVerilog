// SystemVerilog 4-Bit Binary to Gray Converter
// Behavioral Modeling - Using "always_comb"

module b_to_g_comb (
    output logic [3:0] G,
    input  logic [3:0] B
);

    always_comb begin
        G[3] = B[3];
        G[2] = B[3] ^ B[2];
        G[1] = B[2] ^ B[1];
        G[0] = B[1] ^ B[0];
    end

endmodule

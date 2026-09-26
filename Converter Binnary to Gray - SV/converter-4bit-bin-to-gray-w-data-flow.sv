// SystemVerilog 4-Bit Binary to Gray Converter 
// Dataflow Modeling - Using assign

module b_to_g_assign (
    output logic [3:0] G,
    input  logic [3:0] B
);

    assign G[3] = B[3];
    assign G[2] = B[3] ^ B[2];
    assign G[1] = B[2] ^ B[1];
    assign G[0] = B[1] ^ B[0];

endmodule
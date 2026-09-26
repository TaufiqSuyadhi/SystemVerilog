// SystemVerilog code to implement XOR logic gate design
// Modeling: Gate-Level Modeling or primitive.

module xor_gate (
    output logic y,
    input  logic a,
    input  logic b
);

    xor G1(y, a, b);

endmodule
// SystemVerilog code to implement XNOR logic gate design
// Modeling: Gate-Level Modeling or primitive.

module xnor_gate (
    output logic y,
    input  logic a,
    input  logic b
);

    xnor G1(y, a, b);

endmodule
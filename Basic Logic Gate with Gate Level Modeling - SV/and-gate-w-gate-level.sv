// SystemVerilog code to implement AND logic gate design
// Modeling: Gate-Level Modeling or primitive.

module and_gate (
    output logic y,
    input  logic a,
    input  logic b
);

    and G1(y, a, b);

endmodule

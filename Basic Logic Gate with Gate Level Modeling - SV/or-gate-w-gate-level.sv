// SystemVerilog code to implement OR logic gate design
// Modeling: Gate-Level Modeling or primitive.

module or_gate (
    output logic y,
    input  logic a,
    input  logic b
);

    or G1(y, a, b);

endmodule
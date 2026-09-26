// SystemVerilog code to implement NOT logic gate design
// Modeling: Gate-Level Modeling or primitive.

module not_gate (
    output logic y,
    input  logic a
);

    not G1(y, a);

endmodule
// SystemVerilog code to implement NOR logic gate design
// Modeling: Gate-Level Modeling or primitive.

module nor_gate (
    output logic y,
    input  logic a,
    input  logic b
);

    nor G1(y, a, b);

endmodule
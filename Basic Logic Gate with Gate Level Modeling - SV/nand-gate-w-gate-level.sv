// SystemVerilog code to implement NAND logic gate design
// Modeling: Gate-Level Modeling or primitive.

module nand_gate (
    output logic y,
    input  logic a,
    input  logic b
);

    nand G1(y, a, b);

endmodule
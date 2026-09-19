//SystemVerilog code to implement NAND gate with gate-level modeling

module nand_gate (
    input  logic a,
    input  logic b,
    output logic nand_out
);

    assign nand_out = ~(a & b);

endmodule
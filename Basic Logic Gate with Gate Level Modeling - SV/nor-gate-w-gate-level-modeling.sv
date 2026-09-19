//SystemVerilog code to implement NOR gate with gate-level modeling

module nor_gate (
    input  logic a,
    input  logic b,
    output logic nor_out
);

    assign nor_out = ~(a | b);

endmodule
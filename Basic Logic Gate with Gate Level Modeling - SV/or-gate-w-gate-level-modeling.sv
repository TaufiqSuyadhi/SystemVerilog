//SystemVerilog code to implement OR gate with gate-level modeling

module or_gate (
    input  logic a,
    input  logic b,
    output logic or_out
);

    assign or_out = a | b;

endmodule
`
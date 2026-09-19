//SystemVerilog code to implement AND gate with gate-level modeling

module and_gate (
    input  logic a,
    input  logic b,
    output logic and_out
);

    assign and_out = a & b;

endmodule

//SystemVerilog code to implement NOT gate with gate-level modeling

module not_gate (
    input  logic a,
    output logic not_out
);

    assign not_out = ~a;

endmodule
// SystemVerilog code to implement OR gate with gate-level modeling
// With always_comb

module or_gate (
    input  logic a,
    input  logic b,
    output logic or_out
);

    always_comb begin
        or_out = a | b;
    end

endmodule
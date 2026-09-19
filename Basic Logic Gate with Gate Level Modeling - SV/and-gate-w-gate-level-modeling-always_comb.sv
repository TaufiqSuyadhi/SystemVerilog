//SystemVerilog code to implement AND gate with gate-level modeling
// Using always_comb

module and_gate (
    input  logic a,
    input  logic b,
    output logic and_out
);

    always_comb begin
        and_out = a & b;
    end

endmodule
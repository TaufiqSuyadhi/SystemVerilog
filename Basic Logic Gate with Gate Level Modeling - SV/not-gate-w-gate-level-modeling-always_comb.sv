// SystemVerilog code to implement NOT gate with gate-level modeling
// With always_comb

module not_gate (
    input  logic a,
    output logic not_out
);

	always_comb begin
        not_out = ~a;
    end

endmodule
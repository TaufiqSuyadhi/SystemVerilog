// SystemVerilog code to implement NOR gate with gate-level modeling
// With always_comb

module nor_gate (
    input  logic a,
    input  logic b,
    output logic nor_out
);

    always_comb begin
        nor_out = ~(a | b);
    end

endmodule
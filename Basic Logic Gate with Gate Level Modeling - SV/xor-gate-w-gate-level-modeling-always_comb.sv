// SystemVerilog code to implement XOR gate with gate-level modeling
// With always_comb

module xor_gate (
    input  logic a,
    input  logic b,
    output logic xor_out
);

    always_comb begin
        xor_out = a ^ b;
    end

endmodule
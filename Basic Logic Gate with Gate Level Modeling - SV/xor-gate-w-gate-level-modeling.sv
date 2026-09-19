//SystemVerilog code to implement XOR gate with gate-level modeling

module xor_gate (
    input  logic a,
    input  logic b,
    output logic xor_out
);

    assign xor_out = a ^ b;

endmodule
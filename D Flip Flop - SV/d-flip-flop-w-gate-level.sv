// SystemVerilog code to implement D FlipFlop
// Modeling: Gate-Level

module d_ff_gate_sv (
    output logic q,
    input  logic d,
    input  logic clk
);

    always_ff @(posedge clk)
        q <= d;

endmodule
// SystemVerilog code to implement D FlipFlop
// Modeling: Sequential Dataflow Style

module d_ff_dataflow_sv (
    output logic q,
    input  logic d,
    input  logic clk
);

    always_ff @(posedge clk)
        q <= d;

endmodule
// SystemVerilog code to implement T FlipFlop
// modeling: Data-flow Modeling

module t_ff_dataflow_sv (
    output logic q,
    input  logic t,
    input  logic clk
);

    initial
        q = 1'b0;

    always_ff @(posedge clk)
        q <= t ? ~q : q;

endmodule
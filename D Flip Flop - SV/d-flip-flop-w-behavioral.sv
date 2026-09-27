// SystemVerilog code to implement D FlipFlop
// Modeling: Behavioral

module d_ff_behavior_sv (
    output logic q,
    input  logic d,
    input  logic clk
);

    always_ff @(posedge clk)
    begin
        q <= d;
    end

endmodule

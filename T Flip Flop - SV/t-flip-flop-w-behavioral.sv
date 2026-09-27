// SystemVerilog code to implement T FlipFlop
// modeling: Behavioral Modeling

module t_ff_behavior_sv (
    output logic q,
    input  logic t,
    input  logic clk
);

    initial
        q = 1'b0;

    always_ff @(posedge clk) begin

        case (t)

            1'b0: q <= q;     // Hold
            1'b1: q <= ~q;    // Toggle

        endcase

    end

endmodule
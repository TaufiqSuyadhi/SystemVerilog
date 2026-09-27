// SystemVerilog code to implement JK FlipFlop
// Modeling: BEHAVIORAL modeling

module jk_ff_behavior_sv (
    output logic q,
    input  logic j,
    input  logic k,
    input  logic clk
);

    always_ff @(posedge clk) begin

        case ({j,k})

            2'b00: q <= q;     // Hold
            2'b01: q <= 1'b0;  // Reset
            2'b10: q <= 1'b1;  // Set
            2'b11: q <= ~q;    // Toggle

            default: q <= q;

        endcase

    end

endmodule

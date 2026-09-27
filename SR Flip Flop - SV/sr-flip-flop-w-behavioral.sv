// SystemVerilog code to implement SR FlipFlop 
// Modeling: Behavioral modeling

module sr_ff_behavior_sv (
    output logic q,
    input  logic s,
    input  logic r,
    input  logic clk
);

    always_ff @(posedge clk) begin

        case ({s,r})

            2'b00 : q <= q;      // Hold
            2'b01 : q <= 1'b0;   // Reset
            2'b10 : q <= 1'b1;   // Set
            2'b11 : q <= 1'bx;   // Invalid

        endcase

    end

endmodule

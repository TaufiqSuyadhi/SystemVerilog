// SystemVerilog code to implement SR FlipFlop 
// Modeling: Gate-level modeling

module sr_ff_gate_sv (
    output logic q,
    input  logic s,
    input  logic r,
    input  logic clk
);

    always_ff @(posedge clk) begin

        if (!s && !r)
            q <= q;       // Hold

        else if (!s && r)
            q <= 1'b0;    // Reset

        else if (s && !r)
            q <= 1'b1;    // Set

        else
            q <= 1'bx;    // Invalid

    end

endmodule
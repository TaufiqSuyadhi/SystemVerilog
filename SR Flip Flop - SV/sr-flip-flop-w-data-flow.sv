// SystemVerilog code to implement SR FlipFlop 
// Modeling: Data-Flow modeling

module sr_ff_dataflow_sv (
    output logic q,
    input  logic s,
    input  logic r,
    input  logic clk
);

    always_ff @(posedge clk) begin

        if (s == 1'b0 && r == 1'b0)
            q <= q;

        else if (s == 1'b0 && r == 1'b1)
            q <= 1'b0;

        else if (s == 1'b1 && r == 1'b0)
            q <= 1'b1;

        else
            q <= 1'bx;

    end

endmodule
// SystemVerilog code to implement T FlipFlop
// modeling: Gate-Level Modeling

module t_ff_gate_sv (
    output logic q,
    input  logic t,
    input  logic clk
);

    initial
        q = 1'b0;

    always_ff @(posedge clk) begin
        if (t)
            q <= ~q;
        else
            q <= q;
    end

endmodule
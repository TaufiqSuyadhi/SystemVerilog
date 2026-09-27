// SystemVerilog code to implement JK FlipFlop
// Modeling: Dataflow modeling

module jk_ff_dataflow_sv (
    output logic q,
    input  logic j,
    input  logic k,
    input  logic clk
);

    logic q_next;

    assign q_next =
           ({j,k} == 2'b00) ? q  :
           ({j,k} == 2'b01) ? 1'b0 :
           ({j,k} == 2'b10) ? 1'b1 :
                              ~q;

    always_ff @(posedge clk)
        q <= q_next;

endmodule`
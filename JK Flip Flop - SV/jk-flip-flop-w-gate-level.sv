// SystemVerilog code to implement JK FlipFlop
// Modeling: Gate-level modeling

// Using the characteristic equation of a JK FF --> Q(next) = JQ' + K'Q

module jk_ff_gate_sv (
    output logic q,
    input  logic j,
    input  logic k,
    input  logic clk
);

    logic q_next;
    logic nq;
    logic nk;
    logic t1, t2;

    not (nq, q);
    not (nk, k);

    and (t1, j, nq);
    and (t2, nk, q);

    or  (q_next, t1, t2);

    always_ff @(posedge clk)
        q <= q_next;

endmodule
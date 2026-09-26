// SystemVerilog 4-bit Comparator Using gate-level Modeling

// Note: 
//		gt = greater-than
//		lt = Less-than
//		eq = equal-to

module comparator_4bit_gate (
    output logic gt,
    output logic lt,
    output logic eq,
    input  logic [3:0] A,
    input  logic [3:0] B
);

    logic e3, e2, e1, e0;
    logic g3, g2, g1, g0;
    logic l3, l2, l1, l0;

    // Equality of each bit
    xnor (e3, A[3], B[3]);
    xnor (e2, A[2], B[2]);
    xnor (e1, A[1], B[1]);
    xnor (e0, A[0], B[0]);

    // Greater-than conditions
    and (g3, A[3], ~B[3]);
    and (g2, e3, A[2], ~B[2]);
    and (g1, e3, e2, A[1], ~B[1]);
    and (g0, e3, e2, e1, A[0], ~B[0]);

    // Less-than conditions
    and (l3, ~A[3], B[3]);
    and (l2, e3, ~A[2], B[2]);
    and (l1, e3, e2, ~A[1], B[1]);
    and (l0, e3, e2, e1, ~A[0], B[0]);

    // A > B
    or (gt, g3, g2, g1, g0);

    // A < B
    or (lt, l3, l2, l1, l0);

    // A == B
    and (eq, e3, e2, e1, e0);

endmodule
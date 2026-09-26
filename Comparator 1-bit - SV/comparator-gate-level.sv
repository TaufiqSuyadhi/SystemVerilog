//SystemVerilog 1-bit Comparator Using Gate-Level Modeling
// Gate-Level Modeling - Primitive

module comparator_gate (
    output logic gt,
    output logic lt,
    output logic eq,
    input  logic a,
    input  logic b
);

    logic nota;
    logic notb;
    logic x1;
    logic x2;

    // A > B
    not (notb, b);
    and (gt, a, notb);

    // A < B
    not (nota, a);
    and (lt, nota, b);

    // A == B
    xor (x1, a, b);
    not (eq, x1);

endmodule

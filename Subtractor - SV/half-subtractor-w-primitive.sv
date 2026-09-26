// SystemVerilog code to implement half-subtractor using gate-level modeling
// Gate-Level Modeling - using "Primitive"

module hs_sv (
    output logic difference_hs,
    output logic borrow_hs,
    input  logic a,
    input  logic b
);

    logic e1;

    xor (difference_hs, a, b);
    not (e1, a);
    and (borrow_hs, e1, b);

endmodule
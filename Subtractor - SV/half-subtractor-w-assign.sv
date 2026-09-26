// SystemVerilog code to implement half-subtractor using Dataflow Modeling
// Dataflow Modeling - using "assign"

module hs_sv (
    output logic difference_hs,
    output logic borrow_hs,
    input  logic a,
    input  logic b
);

    assign difference_hs = a ^ b;
    assign borrow_hs     = (~a) & b;

endmodule
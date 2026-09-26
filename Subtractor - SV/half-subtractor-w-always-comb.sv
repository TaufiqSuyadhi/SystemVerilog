// SystemVerilog code to implement half-subtractor using Behavioral Modeling
// Behavioral Modeling - using "always_comb"

module hs_sv (
    output logic difference_hs,
    output logic borrow_hs,
    input  logic a,
    input  logic b
);

    always_comb begin
        difference_hs = a ^ b;
        borrow_hs     = (~a) & b;
    end

endmodule
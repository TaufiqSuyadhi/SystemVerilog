// SystemVerilog code to implement adder and subtractor using dataflow modeling
// (Half Adder, Full Adder) + (Half Subtractor, Full Subtractor)
// using Dataflow Modeling (assign)

module ha_fa_hs_fs_dataflow_sv (
    output logic sum_ha,
    output logic carry_ha,
    output logic sum_fa,
    output logic carry_fa,
    output logic diff_hs,
    output logic borrow_hs,
    output logic diff_fs,
    output logic borrow_fs,
    input  logic a,
    input  logic b,
    input  logic bin,
    input  logic cin
);

    // Half Adder
    assign sum_ha   = a ^ b;
    assign carry_ha = a & b;

    // Full Adder
    assign sum_fa   = a ^ b ^ cin;
    assign carry_fa = (a & b) | ((a ^ b) & cin);

    // Half Subtractor
    assign diff_hs   = a ^ b;
    assign borrow_hs = (~a) & b;

    // Full Subtractor
    assign diff_fs   = a ^ b ^ bin;
    assign borrow_fs = ((~a) & b) | ((~(a ^ b)) & bin);

endmodule

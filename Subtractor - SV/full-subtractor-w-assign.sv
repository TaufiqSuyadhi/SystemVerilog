// SystemVerilog code to implement full-subtractor using Dataflow Modeling
// Dataflow Modeling using "assign"

module fs_sv (
    output logic difference_fs,
    output logic borrow_fs,
    input  logic a,
    input  logic b,
    input  logic bin
);

    assign difference_fs = a ^ b ^ bin;

    assign borrow_fs =
           (~a & b) |
           (~(a ^ b) & bin);

endmodule
// SystemVerilog code to implement full-subtractor using gate-level modeling
// Gate-Level Modeling using primitives

module fs_sv (
    output logic difference_fs,
    output logic borrow_fs,
    input  logic a,
    input  logic b,
    input  logic bin
);

    logic e1, e2, e3, e4, e5;

    xor (e1, a, b);
    xor (difference_fs, e1, bin);

    not (e2, a);
    and (e3, e2, b);

    not (e4, e1);
    and (e5, e4, bin);

    or  (borrow_fs, e5, e3);

endmodule

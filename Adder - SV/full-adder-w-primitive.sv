// SystemVerilog code to implement Full Adder using gate-level modeling
// Gate-Level Modeling using primitives

module fa_sv (
    output logic sum_fa,
    output logic carry_fa,
    input  logic a,
    input  logic b,
    input  logic cin
);

    logic e1, e2, e3;

    xor (e1, a, b);
    xor (sum_fa, e1, cin);

    and (e3, a, b);
    and (e2, e1, cin);

    or  (carry_fa, e2, e3);

endmodule
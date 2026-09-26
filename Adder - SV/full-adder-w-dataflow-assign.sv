// SystemVerilog code to implement Full Adder using Dataflow Modeling
// Dataflow Modeling using "assign" statement

module fa_sv (
    output logic sum_fa,
    output logic carry_fa,
    input  logic a,
    input  logic b,
    input  logic cin
);

    assign sum_fa   = a ^ b ^ cin;
    assign carry_fa = (a & b) | (b & cin) | (a & cin);

endmodule
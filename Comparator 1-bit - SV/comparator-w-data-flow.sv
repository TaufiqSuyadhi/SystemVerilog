// SystemVerilog 1-bit Comparator Using Dataflow Modeling

// 1-Bit Comparator
// Dataflow Modeling

module comparator_dataflow (
    output logic gt,
    output logic lt,
    output logic eq,
    input  logic a,
    input  logic b
);

    assign gt =  a & ~b;
    assign lt = ~a &  b;
    assign eq = ~(a ^ b);

endmodule
// SystemVerilog 4-bit Comparator Using data-flow Modeling

// Note: 
//		gt = greater-than
//		lt = Less-than
//		eq = equal-to

module comparator_4bit_dataflow (
    output logic gt,
    output logic lt,
    output logic eq,
    input  logic [3:0] A,
    input  logic [3:0] B
);

    assign gt = (A > B);
    assign lt = (A < B);
    assign eq = (A == B);

endmodule
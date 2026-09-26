// SystemVerilog code to implement basic logic gates using dataflow modeling
// SystemVerilog code using "assign" statements

module logic_gate_dataflow_sv (
    output logic and_out,
    output logic or_out,
    output logic nand_out,
    output logic nor_out,
    output logic xor_out,
    output logic xnor_out,
    output logic not_out,
    input  logic a,
    input  logic b
);

    assign and_out  = a & b;
    assign or_out   = a | b;
    assign xor_out  = a ^ b;
    assign xnor_out = ~(a ^ b);
    assign nand_out = ~(a & b);
    assign nor_out  = ~(a | b);
    assign not_out  = ~a;

endmodule

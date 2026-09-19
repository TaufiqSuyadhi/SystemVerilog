// SystemVerilog code to implement basic logic gates using dataflow modeling
// SystemVerilog code using "always_comb" statements

module logic_gate_always_comb (
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

    always_comb begin
        and_out  = a & b;
        or_out   = a | b;
        xor_out  = a ^ b;
        xnor_out = ~(a ^ b);
        nand_out = ~(a & b);
        nor_out  = ~(a | b);
        not_out  = ~a;
    end

endmodule

// SystemVerilog code to implement basic logic gates
// Modeling: Behavioral modeling --> using "always_comb" statements

module gate_behavior_sv (
    output logic and_out,
    output logic or_out,
    output logic nand_out,
    output logic nor_out,
    output logic not_out,
    output logic xor_out,
    output logic xnor_out,
    input  logic a,
    input  logic b
);

// SystemVerilog Code (Behavioral Modeling Using always_comb)
    always_comb begin
        and_out  = a & b;
        or_out   = a | b;
        nand_out = ~(a & b);
        nor_out  = ~(a | b);
        not_out  = ~a;
        xor_out  = a ^ b;
        xnor_out = ~(a ^ b);
    end

/* Alternative SystemVerilog Version Using always @(*)
always @(*) begin
	and_out = a & b;
	or_out = a | b;
	nand_out = ~(a & b);
	nor_out = ~(a | b);
	not_out = ~a;
	xor_out = a ^ b;
	xnor_out = ~(a ^ b);
end
*/

endmodule

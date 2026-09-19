// SystemVerilog code to implement NAND gate with gate-level modeling
// With always_comb

module nand_gate (
    input  logic a,
    input  logic b,
    output logic nand_out
);
	
	always_comb begin
        nand_out = ~(a & b);
    end

endmodule
// SystemVerilog code to implement Full Adder using Behavioral Modeling
// Behavioral Modelingg using "always_comb" statement

module fa_sv (
    output logic sum_fa,
    output logic carry_fa,
    input  logic a,
    input  logic b,
    input  logic cin
);

    always_comb begin
        sum_fa   = a ^ b ^ cin;
        carry_fa = (a & b) | (b & cin) | (a & cin);
    end

endmodule

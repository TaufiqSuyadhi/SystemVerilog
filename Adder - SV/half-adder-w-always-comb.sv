// SystemVerilog code to implement Half-adder using Behavioral Modeling
// Half-adder Behavioral Modeling using "always_comb".

module ha_sv (
    output logic sum_ha,
    output logic carry_ha,
    input  logic a,
    input  logic b
);

    always_comb begin
        sum_ha   = a ^ b;
        carry_ha = a & b;
    end

endmodule
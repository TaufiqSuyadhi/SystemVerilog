// SystemVerilog code to implement Half-adder using gate-level modeling
// Half-adder gate-level modeling using "Primitive".

module ha_sv (
    output logic sum_ha,
    output logic carry_ha,
    input  logic a,
    input  logic b
);

    xor (sum_ha,   a, b);
    and (carry_ha, a, b);

endmodule
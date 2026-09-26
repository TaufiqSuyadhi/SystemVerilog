// SystemVerilog code to implement Half-adder using Dataflow Modeling
// Half-adder Dataflow Modeling using "assign".

module ha_sv (
    output logic sum_ha,
    output logic carry_ha,
    input  logic a,
    input  logic b
);

    assign sum_ha   = a ^ b;
    assign carry_ha = a & b;

endmodule
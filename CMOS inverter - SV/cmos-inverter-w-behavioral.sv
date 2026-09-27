// SystemVerilog code to implement CMOS inverter
// Model: Behaviour Modeling 

module cmos_inverter_beh (
    output logic y,
    input  logic a
);

    always_comb begin
        y = ~a;
    end

endmodule

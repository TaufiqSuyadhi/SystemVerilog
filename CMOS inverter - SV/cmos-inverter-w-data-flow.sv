// SystemVerilog code to implement CMOS inverter
// Model: Data-flow Modeling 

module cmos_inverter_df (
    output logic y,
    input  logic a
);

    assign y = ~a;

endmodule
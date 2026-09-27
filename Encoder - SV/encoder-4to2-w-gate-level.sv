// SystemVerilog code to implement Encoder 4-to-2
// Model: Gate Level

module encoder_gate_sv (
    output logic y0,
    output logic y1,
    input  logic I0,
    input  logic I1,
    input  logic I2,
    input  logic I3
);

    or (y0, I1, I3);
    or (y1, I2, I3);

endmodule
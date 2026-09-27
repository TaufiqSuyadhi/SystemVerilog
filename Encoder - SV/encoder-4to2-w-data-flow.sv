// SystemVerilog code to implement decoder 4-to-2
// Model: Data Flow

module encoder_dataflow_sv (
    output logic y0,
    output logic y1,
    input  logic I0,
    input  logic I1,
    input  logic I2,
    input  logic I3
);

    assign y0 = I1 | I3;
    assign y1 = I2 | I3;

endmodule
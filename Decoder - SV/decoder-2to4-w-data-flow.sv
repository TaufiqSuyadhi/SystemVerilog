// SystemVerilog code to implement decoder 2-to-4
// Model: Data flow

module decoder_dataflow_sv (
    output logic y0,
    output logic y1,
    output logic y2,
    output logic y3,
    input  logic I0,
    input  logic I1
);

    assign y0 = (~I0) & (~I1);
    assign y1 = (~I0) & I1;
    assign y2 = I0 & (~I1);
    assign y3 = I0 & I1;

endmodule


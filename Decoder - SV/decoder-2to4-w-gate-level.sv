// SystemVerilog code to implement decoder 2-to-4
// Model: Gate level

module decoder_gate_sv (
    output logic y0,
    output logic y1,
    output logic y2,
    output logic y3,
    input  logic I0,
    input  logic I1
);

    logic nI0, nI1;

    not (nI0, I0);
    not (nI1, I1);

    and (y0, nI0, nI1);
    and (y1, nI0, I1);
    and (y2, I0,  nI1);
    and (y3, I0,  I1);

endmodule
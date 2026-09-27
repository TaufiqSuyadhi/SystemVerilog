// SystemVerilog code to implement Demultiplexer (DEMUX) using DataFlow modeling
// 1-to-4 DeMUX

module demux_dataflow_sv (
    output logic y1,
    output logic y2,
    output logic y3,
    output logic y4,
    input  logic a,
    input  logic s1,
    input  logic s0
);

    assign y1 = (~s1 & ~s0 & a);
    assign y2 = (~s1 &  s0 & a);
    assign y3 = ( s1 & ~s0 & a);
    assign y4 = ( s1 &  s0 & a);

endmodule
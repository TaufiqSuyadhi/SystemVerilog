// SystemVerilog code to implement Demultiplexer (DEMUX) using gate-level modeling
// 1-to-4 DeMUX

module demux_gate_sv (
    output logic y1,
    output logic y2,
    output logic y3,
    output logic y4,
    input  logic a,
    input  logic s1,
    input  logic s0
);

    logic e1, e2;

    not (e1, s1);
    not (e2, s0);

    and (y1, e1, e2, a);
    and (y2, e1, s0, a);
    and (y3, s1, e2, a);
    and (y4, s1, s0, a);

endmodule
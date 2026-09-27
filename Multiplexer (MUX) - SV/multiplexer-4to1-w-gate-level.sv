// SystemVerilog code to implement Multiplexer 4 to 1 using gate-level modeling

module mux_gate_sv (
    output logic y,
    input  logic s1,
    input  logic s0,
    input  logic a,
    input  logic b,
    input  logic c,
    input  logic d
);

    logic e1, e2, e3, e4, e5, e6;

    not (e1, s1);
    not (e2, s0);

    and (e3, e1, e2, a);
    and (e4, e1, s0, b);
    and (e5, s1, e2, c);
    and (e6, s1, s0, d);

    or  (y, e3, e4, e5, e6);

endmodule

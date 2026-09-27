// SystemVerilog code to implement Multiplexer 4 to 1 using dataflow modeling

module mux_dataflow_sv (
    output logic y,
    input  logic s1,
    input  logic s0,
    input  logic a,
    input  logic b,
    input  logic c,
    input  logic d
);

    assign y =
           (~s1 & ~s0 & a) |
           (~s1 &  s0 & b) |
           ( s1 & ~s0 & c) |
           ( s1 &  s0 & d);

endmodule
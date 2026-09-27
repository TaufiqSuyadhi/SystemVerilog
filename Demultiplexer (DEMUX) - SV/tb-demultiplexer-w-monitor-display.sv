// SystemVerilog testbench code to simulate Demultiplexer (DEMUX) 
// Using Gate-level, Dataflow, and Behavioral modeling
// 1-to-4 DeMUX


`timescale 1ns/1ps

module demux_tb;

    logic a;
    logic s1;
    logic s0;

    logic y1_gate, y2_gate, y3_gate, y4_gate;
    logic y1_df,   y2_df,   y3_df,   y4_df;
    logic y1_beh,  y2_beh,  y3_beh,  y4_beh;

    // Gate-Level DUT
    demux_gate_sv u_gate (
        .y1(y1_gate),
        .y2(y2_gate),
        .y3(y3_gate),
        .y4(y4_gate),
        .a(a),
        .s1(s1),
        .s0(s0)
    );

    // Dataflow DUT
    demux_dataflow_sv u_dataflow (
        .y1(y1_df),
        .y2(y2_df),
        .y3(y3_df),
        .y4(y4_df),
        .a(a),
        .s1(s1),
        .s0(s0)
    );

    // Behavioral DUT
    demux_behavior_sv u_behavior (
        .y1(y1_beh),
        .y2(y2_beh),
        .y3(y3_beh),
        .y4(y4_beh),
        .a(a),
        .s1(s1),
        .s0(s0)
    );

    initial begin

        $display("------------------------------------------------------");
        $display("a s1 s0 | Gate(y1 y2 y3 y4)");
        $display("------------------------------------------------------");

        $monitor("%b  %b  %b | %b %b %b %b",
                 a, s1, s0,
                 y1_gate,
                 y2_gate,
                 y3_gate,
                 y4_gate);

        // a = 0
        a=0; s1=0; s0=0; #10;
        a=0; s1=0; s0=1; #10;
        a=0; s1=1; s0=0; #10;
        a=0; s1=1; s0=1; #10;

        // a = 1
        a=1; s1=0; s0=0; #10;
        a=1; s1=0; s0=1; #10;
        a=1; s1=1; s0=0; #10;
        a=1; s1=1; s0=1; #10;

        $finish;

    end

endmodule
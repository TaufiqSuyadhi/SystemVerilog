// SystemVerilog testbench code to simulate Multiplexer 4 to 1
// Unified testbench for gate-level/dataflow/behavioral modeling.
// With monitor and display

`timescale 1ns/1ps

module mux_tb;

    logic s1;
    logic s0;

    logic a;
    logic b;
    logic c;
    logic d;

    logic y_gate;
    logic y_dataflow;
    logic y_behavior;

    // Gate-Level DUT
    mux_gate_sv u_gate (
        .y (y_gate),
        .s1(s1),
        .s0(s0),
        .a (a),
        .b (b),
        .c (c),
        .d (d)
    );

    // Dataflow DUT
    mux_dataflow_sv u_dataflow (
        .y (y_dataflow),
        .s1(s1),
        .s0(s0),
        .a (a),
        .b (b),
        .c (c),
        .d (d)
    );

    // Behavioral DUT
    mux_behavior_sv u_behavior (
        .y (y_behavior),
        .s1(s1),
        .s0(s0),
        .a (a),
        .b (b),
        .c (c),
        .d (d)
    );

    initial begin

        $display("--------------------------------------------------------");
        $display("Time s1 s0 a b c d | Gate Dataflow Behavior");
        $display("--------------------------------------------------------");

        $monitor("%4t   %b  %b  %b %b %b %b |   %b      %b        %b",
                  $time,
                  s1, s0,
                  a, b, c, d,
                  y_gate,
                  y_dataflow,
                  y_behavior);

        // Test Pattern 1
        a=0; b=1; c=0; d=1;

        s1=0; s0=0; #10;
        s1=0; s0=1; #10;
        s1=1; s0=0; #10;
        s1=1; s0=1; #10;

        // Test Pattern 2
        a=1; b=0; c=1; d=0;

        s1=0; s0=0; #10;
        s1=0; s0=1; #10;
        s1=1; s0=0; #10;
        s1=1; s0=1; #10;

        $finish;

    end

endmodule
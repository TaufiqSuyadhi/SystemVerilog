// SystemVerilog testbench code to simulate JK FlipFlop
// Modeling: Gate-level, data-flow, and behavioral modeling
// Using $monitor

`timescale 1ns/1ps

module jk_ff_tb;

    logic j;
    logic k;
    logic clk;

    logic q_gate;
    logic q_dataflow;
    logic q_behavior;

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Gate-Level DUT
    jk_ff_gate_sv u_gate (
        .q(q_gate),
        .j(j),
        .k(k),
        .clk(clk)
    );

    // Dataflow DUT
    jk_ff_dataflow_sv u_dataflow (
        .q(q_dataflow),
        .j(j),
        .k(k),
        .clk(clk)
    );

    // Behavioral DUT
    jk_ff_behavior_sv u_behavior (
        .q(q_behavior),
        .j(j),
        .k(k),
        .clk(clk)
    );

    initial begin

        $monitor(
            "T=%0t clk=%b j=%b k=%b | Gate=%b Dataflow=%b Behavior=%b",
            $time, clk, j, k,
            q_gate, q_dataflow, q_behavior
        );

        // Hold
        j = 0; k = 0; #10;

        // Reset
        j = 0; k = 1; #10;

        // Set
        j = 1; k = 0; #10;

        // Toggle
        j = 1; k = 1; #10;

        // Toggle again
        j = 1; k = 1; #10;

        // Hold
        j = 0; k = 0; #10;

        $finish;

    end

endmodule
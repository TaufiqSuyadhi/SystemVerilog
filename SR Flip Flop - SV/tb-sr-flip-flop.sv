// SystemVerilog testbench code to simulate SR FlipFlop 
// Modeling: gate-level, data-flow, and Behavioral modeling

`timescale 1ns/1ps

module sr_ff_tb;

    logic s;
    logic r;
    logic clk;

    logic q_gate;
    logic q_dataflow;
    logic q_behavior;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Gate-Level DUT
    sr_ff_gate_sv u_gate (
        .q(q_gate),
        .s(s),
        .r(r),
        .clk(clk)
    );

    // Dataflow DUT
    sr_ff_dataflow_sv u_dataflow (
        .q(q_dataflow),
        .s(s),
        .r(r),
        .clk(clk)
    );

    // Behavioral DUT
    sr_ff_behavior_sv u_behavior (
        .q(q_behavior),
        .s(s),
        .r(r),
        .clk(clk)
    );

    initial begin

        $monitor(
          "T=%0t clk=%b s=%b r=%b | Gate=%b Dataflow=%b Behavior=%b",
          $time, clk, s, r,
          q_gate, q_dataflow, q_behavior
        );

        // Hold
        s = 0; r = 0; #10;

        // Set
        s = 1; r = 0; #10;

        // Hold
        s = 0; r = 0; #10;

        // Reset
        s = 0; r = 1; #10;

        // Hold
        s = 0; r = 0; #10;

        // Invalid
        s = 1; r = 1; #10;

        $finish;

    end

endmodule
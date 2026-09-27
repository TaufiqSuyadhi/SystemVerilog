// SystemVerilog testbench code to simulate T FlipFlop
// modeling: Gate-level, Data-flow, and Behavioral Modeling

`timescale 1ns/1ps

module t_ff_tb;

    logic t;
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
    t_ff_gate_sv u_gate (
        .q(q_gate),
        .t(t),
        .clk(clk)
    );

    // Dataflow DUT
    t_ff_dataflow_sv u_dataflow (
        .q(q_dataflow),
        .t(t),
        .clk(clk)
    );

    // Behavioral DUT
    t_ff_behavior_sv u_behavior (
        .q(q_behavior),
        .t(t),
        .clk(clk)
    );

    initial begin

        $display("-----------------------------------------");
        $display(" Time clk t | Gate Dataflow Behavior");
        $display("-----------------------------------------");

        $monitor("%4t   %b   %b |   %b      %b        %b",
                 $time,
                 clk,
                 t,
                 q_gate,
                 q_dataflow,
                 q_behavior);

        t = 0; #20;   // Hold
        t = 1; #20;   // Toggle
        t = 1; #20;   // Toggle
        t = 0; #20;   // Hold
        t = 1; #20;   // Toggle

        $finish;

    end

endmodule

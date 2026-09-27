// SystemVerilog Testbench code to simulate D FlipFlop
// Using $monitor

`timescale 1ns/1ps

module d_ff_tb;

    logic d;
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
    d_ff_gate_sv u_gate (
        .q(q_gate),
        .d(d),
        .clk(clk)
    );

    // Dataflow DUT
    d_ff_dataflow_sv u_dataflow (
        .q(q_dataflow),
        .d(d),
        .clk(clk)
    );

    // Behavioral DUT
    d_ff_behavior_sv u_behavior (
        .q(q_behavior),
        .d(d),
        .clk(clk)
    );

    initial begin

        $monitor(
            "Time=%0t clk=%b d=%b | Gate=%b Dataflow=%b Behavioral=%b",
            $time,
            clk,
            d,
            q_gate,
            q_dataflow,
            q_behavior
        );

        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;
        d = 0; #10;

        $finish;

    end

endmodule
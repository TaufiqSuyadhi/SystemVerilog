// SystemVerilog Testbench code to simulate D FlipFlop
// Using assertion - self-checking

`timescale 1ns/1ps

module d_ff_tb;

    logic d;
    logic clk;

    logic q_gate;
    logic q_dataflow;
    logic q_behavior;

    logic expected_q;

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // DUTs
    d_ff_gate_sv u_gate (
        .q(q_gate),
        .d(d),
        .clk(clk)
    );

    d_ff_dataflow_sv u_dataflow (
        .q(q_dataflow),
        .d(d),
        .clk(clk)
    );

    d_ff_behavior_sv u_behavior (
        .q(q_behavior),
        .d(d),
        .clk(clk)
    );

    // Expected DFF behavior
    always_ff @(posedge clk)
        expected_q <= d;

    // Assertions
    always @(posedge clk) begin

        #1;

        assert(q_gate == expected_q)
            else $fatal("Gate-Level DFF Error");

        assert(q_dataflow == expected_q)
            else $fatal("Dataflow DFF Error");

        assert(q_behavior == expected_q)
            else $fatal("Behavioral DFF Error");

        $display(
            "PASS @%0t : d=%b q=%b",
            $time,
            d,
            expected_q
        );

    end

    initial begin

        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 1; #10;
        d = 0; #10;

        $finish;

    end

endmodule
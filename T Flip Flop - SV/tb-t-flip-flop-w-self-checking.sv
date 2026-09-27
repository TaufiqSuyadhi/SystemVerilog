// SystemVerilog testbench code to simulate T FlipFlop
// modeling: Gate-level, Data-flow, and Behavioral Modeling
// Using: assertion, self-check

`timescale 1ns/1ps

module t_ff_tb;

    logic t;
    logic clk;

    logic q_gate;
    logic q_dataflow;
    logic q_behavior;

    logic expected_q;

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // DUTs
    t_ff_gate_sv      u_gate     (.q(q_gate),     .t(t), .clk(clk));
    t_ff_dataflow_sv  u_dataflow (.q(q_dataflow), .t(t), .clk(clk));
    t_ff_behavior_sv  u_behavior (.q(q_behavior), .t(t), .clk(clk));

    initial
        expected_q = 0;

    // Golden Model
    always @(posedge clk) begin
        if (t)
            expected_q <= ~expected_q;
        else
            expected_q <= expected_q;
    end

    // Assertions
    always @(posedge clk) begin

        #1;

        assert(q_gate == expected_q)
            else $fatal("Gate-Level TFF Error");

        assert(q_dataflow == expected_q)
            else $fatal("Dataflow TFF Error");

        assert(q_behavior == expected_q)
            else $fatal("Behavioral TFF Error");

        $display("PASS @%0t: t=%b q=%b",
                 $time,
                 t,
                 expected_q);

    end

    initial begin

        t = 0; #20;
        t = 1; #20;
        t = 1; #20;
        t = 0; #20;
        t = 1; #20;

        $display("--------------------------------");
        $display("ALL T FLIP-FLOP TESTS PASSED");
        $display("--------------------------------");

        $finish;

    end

endmodule

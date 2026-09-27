// SystemVerilog testbench code to simulate MOD 5 Counter
// Modeling: Gate-level, data flow, behavioral Modeling
// Unified testbench - Using assertion

`timescale 1ns/1ps

module mod5_counter_tb;

    logic clk;
    logic rst;

    logic [2:0] count_gate;
    logic [2:0] count_dataflow;
    logic [2:0] count_behavior;

    logic [2:0] expected_count;

    //------------------------------------------------
    // Clock
    //------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //------------------------------------------------
    // DUTs
    //------------------------------------------------
    mod5_counter_gate_sv u_gate (
        .clk(clk),
        .rst(rst),
        .count(count_gate)
    );

    mod5_counter_dataflow_sv u_dataflow (
        .clk(clk),
        .rst(rst),
        .count(count_dataflow)
    );

    mod5_counter_behavior_sv u_behavior (
        .clk(clk),
        .rst(rst),
        .count(count_behavior)
    );

    //------------------------------------------------
    // Golden Model
    //------------------------------------------------
    initial
        expected_count = 3'b000;

    always @(posedge clk) begin

        if (rst)
            expected_count <= 3'b000;

        else if (expected_count == 3'b100)
            expected_count <= 3'b000;

        else
            expected_count <= expected_count + 3'b001;

    end

    //------------------------------------------------
    // Assertions
    //------------------------------------------------
    always @(posedge clk) begin

        #1;

        assert(count_gate == expected_count)
            else $fatal("Gate Counter Error");

        assert(count_dataflow == expected_count)
            else $fatal("Dataflow Counter Error");

        assert(count_behavior == expected_count)
            else $fatal("Behavior Counter Error");

        $display(
            "PASS @ %0t : Count = %0d",
            $time,
            expected_count
        );

    end

    //------------------------------------------------
    // Stimulus
    //------------------------------------------------
    initial begin

        rst = 1;

        @(posedge clk);
        rst = 0;

        repeat (15)
            @(posedge clk);

        rst = 1;
        @(posedge clk);

        rst = 0;
        repeat (10)
            @(posedge clk);

        $display("--------------------------------");
        $display("ALL MOD-5 COUNTER TESTS PASSED");
        $display("--------------------------------");

        $finish;

    end

endmodule
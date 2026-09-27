// SystemVerilog testbench code to simulate MOD 5 Counter
// Modeling: Gate-level, data flow, behavioral Modeling
// Unified testbench


`timescale 1ns/1ps

module mod5_counter_tb;

    logic clk;
    logic rst;

    logic [2:0] count_gate;
    logic [2:0] count_dataflow;
    logic [2:0] count_behavior;

    //------------------------------------------------
    // Clock Generation
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
    // Stimulus
    //------------------------------------------------
    initial begin

        rst = 1'b1;
        #12;

        rst = 1'b0;

        repeat (12)
            @(posedge clk);

        rst = 1'b1;
        @(posedge clk);

        rst = 1'b0;

        repeat (8)
            @(posedge clk);

        $finish;

    end

    //------------------------------------------------
    // Monitor
    //------------------------------------------------
    initial begin

        $display("--------------------------------------------------");
        $display("Time  rst | Gate  Dataflow  Behavior");
        $display("--------------------------------------------------");

        $monitor("%4t   %b   | %03b     %03b       %03b",
                  $time,
                  rst,
                  count_gate,
                  count_dataflow,
                  count_behavior);

    end

endmodule
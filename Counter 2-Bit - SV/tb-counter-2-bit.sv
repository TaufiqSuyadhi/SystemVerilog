// SystemVerilog testbench code to implement 2-Bit Counter
// Modeling: Gate level, data flow, and behavioral modeling

`timescale 1ns/1ps

module counter_2bit_tb;

    logic clk;
    logic rst;

    logic [1:0] count_gate;
    logic [1:0] count_dataflow;
    logic [1:0] count_behavior;

    logic [1:0] expected_count;

    // DUTs

    counter_2bit_gate u_gate (
        .count(count_gate),
        .clk(clk),
        .rst(rst)
    );

    counter_2bit_dataflow u_dataflow (
        .count(count_dataflow),
        .clk(clk),
        .rst(rst)
    );

    counter_2bit_behavior u_behavior (
        .count(count_behavior),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reference model

    always @(posedge clk) begin

        if (rst)
            expected_count <= 2'b00;
        else
            expected_count <= expected_count + 1'b1;

    end

    // Stimulus

    initial begin

        expected_count = 2'b00;

        rst = 1;

        #12;
        rst = 0;

        repeat (12)
            @(posedge clk);

        #10;

        $display("--------------------------------");
        $display("Counter Test Completed");
        $display("--------------------------------");

        $finish;

    end

    // Self-checking assertions

    always @(posedge clk) begin

        #1;

        assert(count_gate == expected_count)
        else
            $fatal("Gate-Level Counter Mismatch");

        assert(count_dataflow == expected_count)
        else
            $fatal("Dataflow Counter Mismatch");

        assert(count_behavior == expected_count)
        else
            $fatal("Behavioral Counter Mismatch");

        assert(count_gate == count_dataflow)
        else
            $fatal("Gate/Dataflow Mismatch");

        assert(count_gate == count_behavior)
        else
            $fatal("Gate/Behavioral Mismatch");

        $display(
            "Time=%0t | Count=%b",
            $time,
            expected_count
        );

    end

endmodule
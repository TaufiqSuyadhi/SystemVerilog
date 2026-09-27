// SystemVerilog testbench code for digital_stopwatch application
// Using assertion, self-checking

`timescale 1ns/1ps

module digital_stopwatch_sv_tb_assert;

    logic clk;
    logic reset;
    logic start;

    logic [5:0] seconds;
    logic [5:0] minutes;

    logic [5:0] prev_seconds;
    logic [5:0] prev_minutes;

    digital_stopwatch_sv dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .seconds(seconds),
        .minutes(minutes)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Save previous values
    always @(posedge clk) begin
        prev_seconds <= seconds;
        prev_minutes <= minutes;
    end

    // Assertions
    always @(posedge clk) begin

        if (!reset && start) begin

            // Range checks
            assert (seconds <= 6'd59)
            else $error("Seconds exceeded 59!");

            assert (minutes <= 6'd59)
            else $error("Minutes exceeded 59!");

            // 59-second rollover
            if (prev_seconds == 6'd59) begin
                assert (seconds == 6'd0)
                else $error("Seconds rollover failed.");
            end
        end
    end

    initial begin

        reset = 1;
        start = 0;

        #15;
        reset = 0;
        start = 1;

        repeat (130) @(posedge clk);

        start = 0;
        repeat (5) @(posedge clk);

        start = 1;
        repeat (20) @(posedge clk);

        $display("All assertions completed.");
        $finish;

    end

endmodule
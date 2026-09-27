// SystemVerilog testbench code for digital_stopwatch application
// Using monitor and display

`timescale 1ns/1ps

module digital_stopwatch_sv_tb;

    logic clk;
    logic reset;
    logic start;

    logic [5:0] seconds;
    logic [5:0] minutes;

    // DUT
    digital_stopwatch_sv dut (
        .clk     (clk),
        .reset   (reset),
        .start   (start),
        .seconds (seconds),
        .minutes (minutes)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin

        reset = 1;
        start = 0;

        #15;
        reset = 0;

        // Start stopwatch
        start = 1;

        repeat (70) @(posedge clk);

        // Pause stopwatch
        start = 0;

        repeat (5) @(posedge clk);

        // Resume stopwatch
        start = 1;

        repeat (20) @(posedge clk);

        // Reset stopwatch
        reset = 1;
        @(posedge clk);
        reset = 0;

        repeat (10) @(posedge clk);

        $display("Simulation Completed");
        $finish;

    end

    // Monitor
    initial begin
        $display("-------------------------------------------------");
        $display(" Time    Reset  Start   Minutes   Seconds");
        $display("-------------------------------------------------");

        $monitor("%5t      %b      %b       %02d:%02d",
                 $time,
                 reset,
                 start,
                 minutes,
                 seconds);
    end

endmodule
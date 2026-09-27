// SystemVerilog testbench code for Mealy FSM's RTL schematic Design simulation 
// FSM: Mealy Sequence 101

`timescale 1ns/1ps

module sequence_101_jk_sv_tb;

    logic clk;
    logic reset;
    logic h;
    logic y;

    // DUT
    sequence_101_jk_sv dut (
        .y     (y),
        .h     (h),
        .clk   (clk),
        .reset (reset)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin

        reset = 1;
        h     = 0;

        #12;
        reset = 0;

        // Input stream:
        // 1 0 1 -> detected
        // 1 0 1 -> detected
        // 0 1 0 1 -> detected

        @(negedge clk) h = 1;
        @(negedge clk) h = 0;
        @(negedge clk) h = 1;

        @(negedge clk) h = 1;
        @(negedge clk) h = 0;
        @(negedge clk) h = 1;

        @(negedge clk) h = 0;
        @(negedge clk) h = 1;
        @(negedge clk) h = 0;
        @(negedge clk) h = 1;

        repeat(3) @(posedge clk);

        $display("Simulation Completed");
        $finish;

    end

    // Monitor
    initial begin
        $display("-----------------------------------------");
        $display(" Time   Reset   h   y   State(qb qa)");
        $display("-----------------------------------------");

        $monitor("%4t      %b      %b   %b      %b%b",
                 $time,
                 reset,
                 h,
                 y,
                 dut.qb,
                 dut.qa);
    end

endmodule
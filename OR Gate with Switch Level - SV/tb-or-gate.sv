// SystemVerilog Testbench code to simulate OR logic gate using Switch-level modeling

`timescale 1ns/1ps

module cmos_or_sv_tb;

    logic a;
    logic b;
    logic y;

    // DUT Instantiation
    cmos_or_sv dut (
        .y (y),
        .a (a),
        .b (b)
    );

    // Test Stimulus
    initial begin

        $display("--------------------------------");
        $display("  Time   a   b   y");
        $display("--------------------------------");

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("--------------------------------");
        $display("Simulation Completed");
        $display("--------------------------------");

        $finish;
    end

    // Monitor
    initial begin
        $monitor("%4t    %b   %b   %b",
                 $time, a, b, y);
    end

endmodule
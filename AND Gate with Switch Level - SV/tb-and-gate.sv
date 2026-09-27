// SystemVerilog testbench code to simulate AND gate using Switch-level modeling

`timescale 1ns/1ps

module cmos_and_tb;

    logic a;
    logic b;
    wire  y;

    // DUT
    cmos_and_sv dut (
        .y (y),
        .a (a),
        .b (b)
    );

    // Test stimulus
    initial begin

        $display("--------------------------------");
        $display(" Time   a   b   y");
        $display("--------------------------------");

        a = 0; b = 0;
        #10;

        a = 0; b = 1;
        #10;

        a = 1; b = 0;
        #10;

        a = 1; b = 1;
        #10;

        $display("Simulation Completed");
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("%4t    %b   %b   %b",
                 $time, a, b, y);
    end

endmodule
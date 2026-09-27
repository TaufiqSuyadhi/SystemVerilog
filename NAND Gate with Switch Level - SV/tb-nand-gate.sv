// SystemVerilog Testbench code to simulate NAND logic gate using Switch-level modeling

`timescale 1ns/1ps

module cmos_nand_sv_tb;

    logic a;
    logic b;
    logic y;

    // DUT Instantiation
    cmos_nand_sv dut (
        .y (y),
        .a (a),
        .b (b)
    );

    // Stimulus
    initial begin

        $display("--------------------------------");
        $display(" Time   a   b   y");
        $display("--------------------------------");

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("--------------------------------");
        $display(" End of Simulation");
        $display("--------------------------------");

        $finish;
    end

    // Monitor
    initial begin
        $monitor("%4t    %b   %b   %b",
                 $time, a, b, y);
    end

endmodule
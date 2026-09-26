// SystemVerilog Testbench code for 1-bit comparator
// The following testbench can be used for any of the comparator modules above.
// Comparator using gate-level, data flow, and behavioral modeling.

`timescale 1ns/1ps

module comparator_tb;

    logic a;
    logic b;

    logic gt;
    logic lt;
    logic eq;

    // Select one DUT

    comparator_behavior dut (
        .gt(gt),
        .lt(lt),
        .eq(eq),
        .a(a),
        .b(b)
    );

    initial begin

        $monitor(
            "Time=%0t A=%b B=%b | GT=%b LT=%b EQ=%b",
            $time, a, b, gt, lt, eq
        );

        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;

        $finish;

    end

endmodule
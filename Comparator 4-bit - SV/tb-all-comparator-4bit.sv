// SystemVerilog Testbench
// This testbench can verify any of the three comparator modules (gate-level/data-flow/behavioral).

// Note: 
//		gt = greater-than
//		lt = Less-than
//		eq = equal-to

`timescale 1ns/1ps

module comparator_4bit_tb;

    logic [3:0] A;
    logic [3:0] B;

    logic gt;
    logic lt;
    logic eq;

    // DUT
    comparator_4bit_behavior dut (
        .gt(gt),
        .lt(lt),
        .eq(eq),
        .A(A),
        .B(B)
    );

    initial begin

        $monitor(
            "Time=%0t A=%b (%0d) B=%b (%0d) | GT=%b LT=%b EQ=%b",
            $time, A, A, B, B, gt, lt, eq
        );

        A=4'b0000; B=4'b0000; #10;
        A=4'b0001; B=4'b0010; #10;
        A=4'b0101; B=4'b0011; #10;
        A=4'b1010; B=4'b1010; #10;
        A=4'b1111; B=4'b0111; #10;
        A=4'b0011; B=4'b1100; #10;

        $finish;

    end

endmodule

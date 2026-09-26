// SystemVerilog Testbench
// This testbench can verify any of the three comparator modules (gate-level/data-flow/behavioral).
// With "assertion"

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

    int i, j;

    comparator_4bit_behavior dut (
        .gt(gt),
        .lt(lt),
        .eq(eq),
        .A(A),
        .B(B)
    );

    initial begin

        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin

                A = i;
                B = j;

                #10;

                assert (gt == (A > B))
                    else $fatal("GT mismatch A=%0d B=%0d", A, B);

                assert (lt == (A < B))
                    else $fatal("LT mismatch A=%0d B=%0d", A, B);

                assert (eq == (A == B))
                    else $fatal("EQ mismatch A=%0d B=%0d", A, B);

            end
        end

        $display("==================================");
        $display("ALL 256 TEST CASES PASSED");
        $display("==================================");

        $finish;

    end

endmodule
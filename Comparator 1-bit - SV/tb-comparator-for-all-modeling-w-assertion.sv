// SystemVerilog Testbench code for 1-bit comparator
// The following testbench can be used for any of the comparator modules above.
// Comparator using gate-level, data flow, and behavioral modeling.

// Self-Checking Testbench with Assertions


`timescale 1ns/1ps

module comparator_tb;

    logic a,b;
    logic gt,lt,eq;

    integer i;

    comparator_behavior dut (
        .gt(gt),
        .lt(lt),
        .eq(eq),
        .a(a),
        .b(b)
    );

    initial begin

        for(i=0; i<4; i++) begin

            {a,b} = i[1:0];

            #10;

            assert(gt == (a>b))
                else $fatal("GT Error");

            assert(lt == (a<b))
                else $fatal("LT Error");

            assert(eq == (a==b))
                else $fatal("EQ Error");

            $display(
                "PASS: A=%b B=%b --> GT=%b LT=%b EQ=%b",
                a,b,gt,lt,eq
            );

        end

        $display("All Comparator Test Cases Passed");
        $finish;

    end

endmodule
// SystemVerilog testbench code to simulate Arithmetic Logic Unit (ALU)
// Using assert and $display

`timescale 1ns/1ps

module alu_tb;

    logic [3:0] A;
    logic [3:0] B;
    logic [1:0] set;

    logic [7:0] gate_result;
    logic [7:0] dataflow_result;
    logic [7:0] behavior_result;

    logic [7:0] expected_result;

    integer i;
    integer j;
    integer k;

    // Gate-Level DUT
    alu_gate_sv dut_gate (
        .Result(gate_result),
        .A(A),
        .B(B),
        .set(set)
    );

    // Dataflow DUT
    alu_dataflow_sv dut_dataflow (
        .Result(dataflow_result),
        .A(A),
        .B(B),
        .set(set)
    );

    // Behavioral DUT
    alu_behavior_sv dut_behavior (
        .Result(behavior_result),
        .A(A),
        .B(B),
        .set(set)
    );

    initial begin

        $display("========================================");
        $display(" ALU Verification Started ");
        $display("========================================");

        for (k = 0; k < 4; k++) begin

            set = k[1:0];

            for (i = 0; i < 16; i++) begin

                for (j = 0; j < 16; j++) begin

                    A = i[3:0];
                    B = j[3:0];

                    #10;

                    case(set)

                        2'b00: expected_result = A + B;
                        2'b01: expected_result = A - B;
                        2'b10: expected_result = ~A;
                        2'b11: expected_result = A * B;

                    endcase

                    // Check Gate-Level Model
                    assert(gate_result == expected_result)
                    else
                        $fatal(1,
                               "Gate ALU ERROR: A=%0d B=%0d set=%b Exp=%0d Got=%0d",
                               A,B,set,
                               expected_result,
                               gate_result);

                    // Check Dataflow Model
                    assert(dataflow_result == expected_result)
                    else
                        $fatal(1,
                               "Dataflow ALU ERROR");

                    // Check Behavioral Model
                    assert(behavior_result == expected_result)
                    else
                        $fatal(1,
                               "Behavior ALU ERROR");

                    // Cross-check all models
                    assert(gate_result == dataflow_result)
                    else
                        $fatal(1,
                               "Gate/Dataflow mismatch");

                    assert(gate_result == behavior_result)
                    else
                        $fatal(1,
                               "Gate/Behavior mismatch");

                end
            end
        end

        $display("========================================");
        $display(" ALL ALU TESTS PASSED ");
        $display(" Tested: 4 Operations");
        $display(" Inputs : 16 x 16 combinations");
        $display(" Total  : 1024 Test Cases");
        $display("========================================");

        $finish;

    end

endmodule
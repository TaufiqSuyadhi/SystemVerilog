// SystemVerilog testbench code to simulate SR FlipFlop 
// Modeling: gate-level, data-flow, and Behavioral modeling
// Using: assertion, self-checking

`timescale 1ns/1ps

module sr_ff_tb;

    logic s, r, clk;

    logic q_gate;
    logic q_dataflow;
    logic q_behavior;

    logic expected_q;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // DUTs
    sr_ff_gate_sv     u_gate     (.q(q_gate),     .s(s), .r(r), .clk(clk));
    sr_ff_dataflow_sv u_dataflow (.q(q_dataflow), .s(s), .r(r), .clk(clk));
    sr_ff_behavior_sv u_behavior (.q(q_behavior), .s(s), .r(r), .clk(clk));

    // Golden model
    always_ff @(posedge clk) begin

        case ({s,r})
            2'b00: expected_q <= expected_q;
            2'b01: expected_q <= 1'b0;
            2'b10: expected_q <= 1'b1;
            2'b11: expected_q <= 1'bx;
        endcase

    end

    // Assertions
    always @(posedge clk) begin

        #1;

        if ({s,r} != 2'b11) begin

            assert(q_gate === expected_q)
                else $fatal("Gate-Level SR FF Error");

            assert(q_dataflow === expected_q)
                else $fatal("Dataflow SR FF Error");

            assert(q_behavior === expected_q)
                else $fatal("Behavioral SR FF Error");

        end

    end

    initial begin

        s=0; r=0; #10;
        s=1; r=0; #10;
        s=0; r=0; #10;
        s=0; r=1; #10;
        s=0; r=0; #10;
        s=1; r=1; #10;

        $display("--------------------------------");
        $display("ALL TESTS PASSED");
        $display("--------------------------------");

        $finish;

    end

endmodule
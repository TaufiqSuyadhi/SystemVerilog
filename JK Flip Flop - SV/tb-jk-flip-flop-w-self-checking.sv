// SystemVerilog testbench code to simulate JK FlipFlop
// Modeling: Gate-level, data-flow, and behavioral modeling
// Using assertion, self-checking

`timescale 1ns/1ps

module jk_ff_tb;

    logic j, k, clk;

    logic q_gate;
    logic q_dataflow;
    logic q_behavior;

    logic expected_q;

    // Clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // DUTs
    jk_ff_gate_sv     u_gate     (.q(q_gate), .j(j), .k(k), .clk(clk));
    jk_ff_dataflow_sv u_dataflow (.q(q_dataflow), .j(j), .k(k), .clk(clk));
    jk_ff_behavior_sv u_behavior (.q(q_behavior), .j(j), .k(k), .clk(clk));

    // Golden Model
    always_ff @(posedge clk) begin
        case ({j,k})
            2'b00: expected_q <= expected_q;
            2'b01: expected_q <= 1'b0;
            2'b10: expected_q <= 1'b1;
            2'b11: expected_q <= ~expected_q;
        endcase
    end

    // Assertions
    always @(posedge clk) begin

        #1;

        assert(q_gate === expected_q)
            else $fatal("Gate-Level JK FF Error");

        assert(q_dataflow === expected_q)
            else $fatal("Dataflow JK FF Error");

        assert(q_behavior === expected_q)
            else $fatal("Behavioral JK FF Error");

        $display("PASS @%0t : J=%b K=%b Q=%b",
                 $time, j, k, expected_q);

    end

    initial begin

        j=0; k=0; #10; // Hold
        j=0; k=1; #10; // Reset
        j=1; k=0; #10; // Set
        j=1; k=1; #10; // Toggle
        j=1; k=1; #10; // Toggle
        j=0; k=0; #10; // Hold

        $display("--------------------------------");
        $display("ALL JK FLIP-FLOP TESTS PASSED");
        $display("--------------------------------");

        $finish;

    end

endmodule
// SystemVerilog testbench code to simulate decoder 2-to-4
// Model: gate level, data flow, and behavioral

`timescale 1ns/1ps

module decoder_tb;

    logic I0;
    logic I1;

    logic y0_gate, y1_gate, y2_gate, y3_gate;
    logic y0_df,   y1_df,   y2_df,   y3_df;
    logic y0_beh,  y1_beh,  y2_beh,  y3_beh;

    // Gate-Level DUT
    decoder_gate_sv u_gate (
        .y0(y0_gate),
        .y1(y1_gate),
        .y2(y2_gate),
        .y3(y3_gate),
        .I0(I0),
        .I1(I1)
    );

    // Dataflow DUT
    decoder_dataflow_sv u_df (
        .y0(y0_df),
        .y1(y1_df),
        .y2(y2_df),
        .y3(y3_df),
        .I0(I0),
        .I1(I1)
    );

    // Behavioral DUT
    decoder_behavior_sv u_beh (
        .y0(y0_beh),
        .y1(y1_beh),
        .y2(y2_beh),
        .y3(y3_beh),
        .I0(I0),
        .I1(I1)
    );

    initial begin

        $display("------------------------------------------------");
        $display("I0 I1 | Gate(y0 y1 y2 y3)");
        $display("------------------------------------------------");

        $monitor("%b  %b  |   %b  %b  %b  %b",
                 I0, I1,
                 y0_gate, y1_gate,
                 y2_gate, y3_gate);

        I0 = 0; I1 = 0; #10;
        I0 = 0; I1 = 1; #10;
        I0 = 1; I1 = 0; #10;
        I0 = 1; I1 = 1; #10;

        $finish;

    end

endmodule
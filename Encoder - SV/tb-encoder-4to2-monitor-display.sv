// SystemVerilog testbench code to simulate Encoder 4-to-2
// Model: gate level, data flow, and behavioral
// Using: $monitor and $display

`timescale 1ns/1ps

module encoder_tb;

    logic I0;
    logic I1;
    logic I2;
    logic I3;

    logic y0_gate;
    logic y1_gate;

    logic y0_df;
    logic y1_df;

    logic y0_beh;
    logic y1_beh;

    // Gate-Level DUT
    encoder_gate_sv u_gate (
        .y0(y0_gate),
        .y1(y1_gate),
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3)
    );

    // Dataflow DUT
    encoder_dataflow_sv u_df (
        .y0(y0_df),
        .y1(y1_df),
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3)
    );

    // Behavioral DUT
    encoder_behavior_sv u_beh (
        .y0(y0_beh),
        .y1(y1_beh),
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3)
    );

    initial begin

        $display("--------------------------------------------------");
        $display("I3 I2 I1 I0 | Gate  Dataflow  Behavioral");
        $display("--------------------------------------------------");

        $monitor("%b  %b  %b  %b |  %b%b      %b%b         %b%b",
                 I3,I2,I1,I0,
                 y1_gate,y0_gate,
                 y1_df,y0_df,
                 y1_beh,y0_beh);

        I0=1; I1=0; I2=0; I3=0; #10;
        I0=0; I1=1; I2=0; I3=0; #10;
        I0=0; I1=0; I2=1; I3=0; #10;
        I0=0; I1=0; I2=0; I3=1; #10;

        $finish;

    end

endmodule
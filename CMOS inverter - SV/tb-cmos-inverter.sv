// SystemVerilog Testbench code to simulate CMOS inverter
// Model: Switch-level, data-flow, and Behaviour Modeling 

`timescale 1ns/1ps

module cmos_inverter_tb;

    logic a;

    logic y_sw;
    logic y_df;
    logic y_beh;

    //=================================================
    // DUT Instantiations
    //=================================================

    cmos_inverter_sv U_SW (
        .y (y_sw),
        .a (a)
    );

    cmos_inverter_df U_DF (
        .y (y_df),
        .a (a)
    );

    cmos_inverter_beh U_BEH (
        .y (y_beh),
        .a (a)
    );

    //=================================================
    // Stimulus
    //=================================================

    initial begin

        a = 0;
        #10;

        a = 1;
        #10;

        a = 0;
        #10;

        a = 1;
        #10;

        $display("Simulation Completed");
        $finish;
    end

    //=================================================
    // Monitor
    //=================================================

    initial begin
        $display("--------------------------------------");
        $display(" Time     a    SW    DF    BEH");
        $display("--------------------------------------");

        $monitor("%4t      %b     %b     %b     %b",
                 $time, a, y_sw, y_df, y_beh);
    end

    //=================================================
    // Self-Checking Assertions
    //=================================================

    always @(*) begin

        assert (y_sw == y_df)
        else
            $error("Mismatch: SW=%b DF=%b", y_sw, y_df);

        assert (y_sw == y_beh)
        else
            $error("Mismatch: SW=%b BEH=%b", y_sw, y_beh);

        assert (y_sw == ~a)
        else
            $error("Incorrect inverter output");
    end

endmodule
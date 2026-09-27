// SystemVerilog Testbench code to simulate Decade Counter (MOD-10)
// Using Self-Checking Assertions

`timescale 1ns/1ps

module decade_counter_tb;

    logic clk;
    logic rst;

    logic [3:0] count_gate;
    logic [3:0] count_df;
    logic [3:0] count_beh;

    //=================================================
    // DUT Instantiation
    //=================================================

    decade_counter_gate U_GATE (
        .clk   (clk),
        .rst   (rst),
        .count (count_gate)
    );

    decade_counter_df U_DF (
        .clk   (clk),
        .rst   (rst),
        .count (count_df)
    );

    decade_counter_beh U_BEH (
        .clk   (clk),
        .rst   (rst),
        .count (count_beh)
    );

    //=================================================
    // Clock Generation
    //=================================================

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //=================================================
    // Stimulus
    //=================================================

    initial begin

        rst = 1;

        #12;
        rst = 0;

        // Run long enough to observe
        // several MOD-10 rollovers
        #120;

        rst = 1;
        #10;
        rst = 0;

        #80;

        $display("Simulation Completed");
        $finish;
    end

    //=================================================
    // Monitor
    //=================================================

    initial begin
        $display("------------------------------------------------");
        $display(" Time   RST   GATE   DATAFLOW   BEHAVIORAL");
        $display("------------------------------------------------");

        $monitor("%4t    %0b      %0d        %0d          %0d",
                 $time,
                 rst,
                 count_gate,
                 count_df,
                 count_beh);
    end

    //=================================================
    // Self-Checking Assertions
    //=================================================

    always @(posedge clk) begin

        // All models must match
        assert (count_gate == count_df)
        else begin
            $error("Mismatch: GATE=%0d DF=%0d",
                    count_gate, count_df);
        end

        assert (count_gate == count_beh)
        else begin
            $error("Mismatch: GATE=%0d BEH=%0d",
                    count_gate, count_beh);
        end

        // Counter range check
        assert (count_gate <= 4'd9)
        else begin
            $error("Counter exceeded 9! Value=%0d",
                    count_gate);
        end
    end

endmodule
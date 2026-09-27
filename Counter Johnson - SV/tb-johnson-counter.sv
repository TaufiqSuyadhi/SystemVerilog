// SystemVerilog testbench code to simulate Johnson Counter
// Model: gate-level, data-flow, and behavioral modeling

`timescale 1ns/1ps

module johnson_counter_tb;

    logic clk;
    logic rst;

    logic [3:0] count_gate;
    logic [3:0] count_df;
    logic [3:0] count_beh;

    //=================================================
    // DUT Instantiations
    //=================================================

    johnson_counter_gate U_GATE (
        .clk   (clk),
        .rst   (rst),
        .count (count_gate)
    );

    johnson_counter_df U_DF (
        .clk   (clk),
        .rst   (rst),
        .count (count_df)
    );

    johnson_counter_beh U_BEH (
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

        // Observe multiple Johnson cycles
        #200;

        rst = 1;
        #10;

        rst = 0;
        #80;

        $display("\nSimulation Completed Successfully");
        $finish;
    end

    //=================================================
    // Monitor
    //=================================================

    initial begin
        $display("--------------------------------------------------------");
        $display(" Time   RST     GATE     DATAFLOW     BEHAVIORAL");
        $display("--------------------------------------------------------");

        $monitor("%4t    %0b      %b        %b          %b",
                 $time,
                 rst,
                 count_gate,
                 count_df,
                 count_beh);
    end

    //=================================================
    // Model Equivalence Assertions
    //=================================================

    always @(posedge clk) begin

        assert (count_gate == count_df)
        else begin
            $error("Mismatch: Gate=%b DataFlow=%b",
                    count_gate, count_df);
        end

        assert (count_gate == count_beh)
        else begin
            $error("Mismatch: Gate=%b Behavioral=%b",
                    count_gate, count_beh);
        end

    end

    //=================================================
    // Johnson Counter Sequence Checker
    //=================================================

    logic [3:0] expected;

    initial expected = 4'b0000;

    always @(posedge clk) begin

        if (rst)
            expected <= 4'b0000;
        else
            expected <= {~expected[0], expected[3:1]};

    end

    always @(posedge clk) begin

        if (!rst) begin
            assert (count_beh == expected)
            else begin
                $error("Johnson sequence error. Expected=%b Actual=%b",
                       expected, count_beh);
            end
        end

    end

endmodule
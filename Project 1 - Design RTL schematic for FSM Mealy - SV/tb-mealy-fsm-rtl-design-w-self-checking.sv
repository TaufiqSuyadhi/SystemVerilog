// SystemVerilog testbench code for Mealy FSM's RTL schematic Design simulation 
// FSM: Mealy Sequence 101
// With self-checking, assertion

`timescale 1ns/1ps

module sequence_101_jk_sv_tb_assert;

    logic clk;
    logic reset;
    logic h;
    logic y;

    sequence_101_jk_sv dut (
        .y(y),
        .h(h),
        .clk(clk),
        .reset(reset)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    logic [2:0] history;

    always_ff @(posedge clk) begin
        if (reset)
            history <= 3'b000;
        else
            history <= {history[1:0], h};
    end

    // Mealy output should assert when "101" is seen
    always @(posedge clk) begin
        if (!reset) begin
            if (history == 3'b101)
                assert (y == 1'b1)
                else $error("Sequence 101 detected but y is LOW.");
        end
    end

    initial begin

        reset = 1;
        h = 0;

        #12 reset = 0;

        @(negedge clk) h = 1;
        @(negedge clk) h = 0;
        @(negedge clk) h = 1;

        @(negedge clk) h = 1;
        @(negedge clk) h = 0;
        @(negedge clk) h = 1;

        @(negedge clk) h = 0;
        @(negedge clk) h = 1;
        @(negedge clk) h = 0;
        @(negedge clk) h = 1;

        repeat(5) @(posedge clk);

        $display("All assertions completed.");
        $finish;

    end

endmodule
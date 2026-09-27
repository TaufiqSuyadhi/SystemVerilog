// SystemVerilog testbench code to simulate 4-bit Shift Register
// Modeling: gate-level, data-flow, and behavioral Modeling

`timescale 1ns/1ps

module shift_register_tb;

    logic [1:0] mode;
    logic [3:0] parallel_in;

    logic clk;
    logic rst;

    logic serial_in_right;
    logic serial_in_left;

    logic [3:0] q_gate;
    logic [3:0] q_dataflow;
    logic [3:0] q_behavior;

    logic [3:0] expected_q;

    // DUTs

    shift_register_gate u_gate (
        .q(q_gate),
        .mode(mode),
        .parallel_in(parallel_in),
        .clk(clk),
        .rst(rst),
        .serial_in_right(serial_in_right),
        .serial_in_left(serial_in_left)
    );

    shift_register_dataflow u_dataflow (
        .q(q_dataflow),
        .mode(mode),
        .parallel_in(parallel_in),
        .clk(clk),
        .rst(rst),
        .serial_in_right(serial_in_right),
        .serial_in_left(serial_in_left)
    );

    shift_register_behavior u_behavior (
        .q(q_behavior),
        .mode(mode),
        .parallel_in(parallel_in),
        .clk(clk),
        .rst(rst),
        .serial_in_right(serial_in_right),
        .serial_in_left(serial_in_left)
    );

    // Clock Generation

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reference Model

    always @(posedge clk) begin

        if (rst)
            expected_q <= 4'b0000;
        else begin

            case(mode)

                2'b00:
                    expected_q <= expected_q;

                2'b01:
                    expected_q <= {serial_in_right, expected_q[3:1]};

                2'b10:
                    expected_q <= {expected_q[2:0], serial_in_left};

                2'b11:
                    expected_q <= parallel_in;

            endcase
        end
    end

    // Stimulus

    initial begin

        expected_q = 4'b0000;

        rst = 1;
        mode = 2'b00;
        parallel_in = 4'b0000;
        serial_in_right = 0;
        serial_in_left  = 0;

        #12;
        rst = 0;

        // Parallel Load
        mode = 2'b11;
        parallel_in = 4'b1010;
        @(posedge clk);

        // Right Shift
        mode = 2'b01;
        serial_in_right = 1;
        repeat(3) @(posedge clk);

        // Left Shift
        mode = 2'b10;
        serial_in_left = 0;
        repeat(3) @(posedge clk);

        // Hold
        mode = 2'b00;
        repeat(2) @(posedge clk);

        #10;

        $display("Test Completed");

        $finish;

    end

    // Assertions

    always @(posedge clk) begin

        #1;

        assert(q_gate == expected_q)
        else
            $fatal("Gate-Level Mismatch");

        assert(q_dataflow == expected_q)
        else
            $fatal("Dataflow Mismatch");

        assert(q_behavior == expected_q)
        else
            $fatal("Behavioral Mismatch");

        assert(q_gate == q_dataflow)
        else
            $fatal("Gate/Dataflow Mismatch");

        assert(q_gate == q_behavior)
        else
            $fatal("Gate/Behavioral Mismatch");

        $display(
            "T=%0t mode=%b q=%b",
            $time,
            mode,
            expected_q
        );

    end

endmodule
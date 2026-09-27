// SystemVerilog Testbench code to simulate NOR logic gate using Switch-level modeling

`timescale 1ns/1ps

module cmos_nor_tb;

    logic a;
    logic b;
    wire  y;

    // DUT Instantiation
    cmos_nor_sv DUT (
        .y(y),
        .a(a),
        .b(b)
    );

    // Test Stimulus
    initial begin

        $display("--------------------------------");
        $display(" Time   a   b   y");
        $display("--------------------------------");

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("--------------------------------");
        $display(" Simulation Completed");
        $display("--------------------------------");

        $finish;
    end

    // Monitor
    initial begin
        $monitor("%4t    %b   %b   %b",
                 $time, a, b, y);
    end

    // Self-Checking Assertions
    always @(*) begin
        assert (y === ~(a | b))
        else
            $error("NOR Gate Mismatch: a=%b b=%b y=%b Expected=%b",
                   a, b, y, ~(a | b));
    end

endmodule
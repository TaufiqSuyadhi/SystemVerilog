// SystemVerilog Testbench code to simulate XOR logic gate using Switch-level modeling
// With Self-checking (assertion)

`timescale 1ns/1ps

module cmos_xor_tb;

    logic a;
    logic b;
    wire  y;

    cmos_xor_sv dut (
        .y (y),
        .a (a),
        .b (b)
    );

    initial begin

        a = 0; b = 0; #10;
        assert (y === (a ^ b))
            else $error("FAIL: a=%b b=%b y=%b", a, b, y);

        a = 0; b = 1; #10;
        assert (y === (a ^ b))
            else $error("FAIL: a=%b b=%b y=%b", a, b, y);

        a = 1; b = 0; #10;
        assert (y === (a ^ b))
            else $error("FAIL: a=%b b=%b y=%b", a, b, y);

        a = 1; b = 1; #10;
        assert (y === (a ^ b))
            else $error("FAIL: a=%b b=%b y=%b", a, b, y);

        $display("All XOR test cases passed.");
        $finish;
    end

    initial begin
        $monitor("Time=%0t a=%b b=%b y=%b",
                 $time, a, b, y);
    end

endmodule
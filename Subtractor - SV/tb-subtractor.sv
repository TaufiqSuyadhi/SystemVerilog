// SystemVerilog code testbench to simulate subtractor using gate-level modeling
// Half Subtractor + Full Subtractor

`timescale 1ns/1ps

module subtractor_tb;

    logic a, b, bin;

    logic difference_hs;
    logic borrow_hs;

    logic difference_fs;
    logic borrow_fs;

    // Half Subtractor DUT
    hs_sv a1 (
        .difference_hs(difference_hs),
        .borrow_hs(borrow_hs),
        .a(a),
        .b(b)
    );

    // Full Subtractor DUT
    fs_sv a2 (
        .difference_fs(difference_fs),
        .borrow_fs(borrow_fs),
        .a(a),
        .b(b),
        .bin(bin)
    );

    initial begin

        a = 0; b = 0; bin = 0; #10;
        a = 0; b = 0; bin = 1; #10;
        a = 0; b = 1; bin = 0; #10;
        a = 0; b = 1; bin = 1; #10;
        a = 1; b = 0; bin = 0; #10;
        a = 1; b = 0; bin = 1; #10;
        a = 1; b = 1; bin = 0; #10;
        a = 1; b = 1; bin = 1; #10;

        $finish;

    end

endmodule
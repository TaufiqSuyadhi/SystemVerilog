// SystemVerilog code testbench to simulate subtractor using gate-level modeling
// Half Subtractor + Full Subtractor, with "monitor"

`timescale 1ns/1ps

module subtractor_tb;

    logic a, b, bin;

    logic difference_hs;
    logic borrow_hs;

    logic difference_fs;
    logic borrow_fs;

    // DUTs
    hs_sv a1 (
        .difference_hs(difference_hs),
        .borrow_hs(borrow_hs),
        .a(a),
        .b(b)
    );

    fs_sv a2 (
        .difference_fs(difference_fs),
        .borrow_fs(borrow_fs),
        .a(a),
        .b(b),
        .bin(bin)
    );

    initial begin

        $display("Time   a b bin | HS(diff borrow) | FS(diff borrow)");

        $monitor("%4t   %b %b  %b  |     %b      %b     |     %b      %b",
                  $time,
                  a, b, bin,
                  difference_hs, borrow_hs,
                  difference_fs, borrow_fs);

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
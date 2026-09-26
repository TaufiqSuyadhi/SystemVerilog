// SystemVerilog Testbench code to simulate adder using gate-level modeling
// Adder = Full + Half 
// SystemVerilog Testbench code with "monitor"

`timescale 1ns/1ps

module adder_tb;

    logic a;
    logic b;
    logic cin;

    logic sum_ha;
    logic carry_ha;

    logic sum_fa;
    logic carry_fa;

    // DUTs
    fa_sv a1 (
        .sum_fa(sum_fa),
        .carry_fa(carry_fa),
        .a(a),
        .b(b),
        .cin(cin)
    );

    ha_sv a2 (
        .sum_ha(sum_ha),
        .carry_ha(carry_ha),
        .a(a),
        .b(b)
    );

    initial begin

        $display("Time  a b cin | HA(sum carry) | FA(sum carry)");
        $monitor("%4t   %b %b  %b  |    %b    %b    |    %b    %b",
                  $time,
                  a, b, cin,
                  sum_ha, carry_ha,
                  sum_fa, carry_fa);

        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        $finish;

    end

endmodule
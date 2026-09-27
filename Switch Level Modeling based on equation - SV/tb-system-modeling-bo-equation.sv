// SystemVerilog testbench code for Switch-level modeling based on EQUATION

// EQUATION: 
// Y = (AB)E + CDbar + (Gbar + H)
// Y = (AB)E + CD̅ + (G̅ + H)
//=================================================

`timescale 1ns/1ps

module cmos_exp_sv_tb;

    logic a, b, c, d, e, g, h;
    logic y;

    // DUT
    cmos_exp_sv dut (
        .y(y),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .g(g),
        .h(h)
    );

    initial begin

        $display("=================================================");
        $display("Time  a b c d e g h | y");
        $display("=================================================");

        a=0; b=0; c=0; d=0; e=0; g=0; h=0; #10;
        a=1; b=1; c=0; d=1; e=1; g=1; h=0; #10;
        a=0; b=0; c=1; d=0; e=0; g=1; h=0; #10;
        a=0; b=0; c=0; d=1; e=0; g=0; h=0; #10;
        a=0; b=0; c=0; d=1; e=0; g=1; h=1; #10;
        a=1; b=1; c=1; d=1; e=1; g=1; h=1; #10;
        a=1; b=0; c=1; d=0; e=1; g=0; h=1; #10;
        a=1; b=1; c=1; d=0; e=1; g=1; h=0; #10;

        $display("=================================================");
        $display("Simulation Completed");
        $display("=================================================");

        $finish;
    end

    initial begin
        $monitor("%4t   %b %b %b %b %b %b %b | %b",
                 $time, a, b, c, d, e, g, h, y);
    end

endmodule
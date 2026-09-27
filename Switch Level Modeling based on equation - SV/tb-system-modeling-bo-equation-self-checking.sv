// SystemVerilog testbench code for Switch-level modeling based on EQUATION

// EQUATION: 
// Y = (AB)E + CDbar + (Gbar + H)
// Y = (AB)E + CD̅ + (G̅ + H)
//
// Using self-checking - assertion
// =================================================

`timescale 1ns/1ps

module cmos_exp_sv_tb;

    logic a, b, c, d, e, g, h;
    logic y;
    logic expected_y;

    integer i;

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

    always_comb begin
        expected_y =
            ((a & b) & e) |
            (c & ~d)      |
            (~g | h);
    end

    initial begin

        for (i = 0; i < 128; i++) begin

            {a,b,c,d,e,g,h} = i[6:0];

            #1;

            assert (y === expected_y)
            else begin
                $error("Mismatch!");
                $error("a=%b b=%b c=%b d=%b e=%b g=%b h=%b",
                        a,b,c,d,e,g,h);
                $error("Expected=%b Actual=%b",
                        expected_y, y);
            end;

            #9;
        end

        $display("All 128 test cases PASSED.");
        $finish;

    end

endmodule
// Unified SystemVerilog testbench code to simulate all of basic logic gate design
// Modeling: Gate-Level Modeling or primitive.

`timescale 1ns/1ps

module logic_gates_tb;

    logic a;
    logic b;

    logic and_y;
    logic or_y;
    logic not_y;
    logic nand_y;
    logic nor_y;
    logic xor_y;
    logic xnor_y;

    //=================================================
    // DUT Instantiations
    //=================================================

    and_gate U_AND (
        .y(and_y),
        .a(a),
        .b(b)
    );

    or_gate U_OR (
        .y(or_y),
        .a(a),
        .b(b)
    );

    not_gate U_NOT (
        .y(not_y),
        .a(a)
    );

    nand_gate U_NAND (
        .y(nand_y),
        .a(a),
        .b(b)
    );

    nor_gate U_NOR (
        .y(nor_y),
        .a(a),
        .b(b)
    );

    xor_gate U_XOR (
        .y(xor_y),
        .a(a),
        .b(b)
    );

    xnor_gate U_XNOR (
        .y(xnor_y),
        .a(a),
        .b(b)
    );

    //=================================================
    // Stimulus
    //=================================================

    initial begin

        $display("----------------------------------------------------------------");
        $display(" a b | AND OR NOT NAND NOR XOR XNOR");
        $display("----------------------------------------------------------------");

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $display("\nAll test vectors applied.");
        $finish;

    end

    //=================================================
    // Monitor
    //=================================================

    initial begin
        $monitor(" %b %b |  %b   %b   %b    %b    %b   %b    %b",
                 a, b,
                 and_y,
                 or_y,
                 not_y,
                 nand_y,
                 nor_y,
                 xor_y,
                 xnor_y);
    end

    //=================================================
    // Self-Checking Assertions
    //=================================================

    always @(*) begin

        assert(and_y  == (a & b))
        else $error("AND Gate Failed");

        assert(or_y   == (a | b))
        else $error("OR Gate Failed");

        assert(not_y  == (~a))
        else $error("NOT Gate Failed");

        assert(nand_y == ~(a & b))
        else $error("NAND Gate Failed");

        assert(nor_y  == ~(a | b))
        else $error("NOR Gate Failed");

        assert(xor_y  == (a ^ b))
        else $error("XOR Gate Failed");

        assert(xnor_y == ~(a ^ b))
        else $error("XNOR Gate Failed");

    end

endmodule
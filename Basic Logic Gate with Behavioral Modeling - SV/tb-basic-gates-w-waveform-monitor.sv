// SystemVerilog testbench code to simulate basic logic gates using Behavioral modeling
// SystemVerilog testbench code with waveform monitor

module gate_behavior_tb;

    logic a, b;

    logic and_out;
    logic or_out;
    logic nand_out;
    logic nor_out;
    logic not_out;
    logic xor_out;
    logic xnor_out;

    // Instantiate DUT
    gate_behavior_sv dut (
        .and_out(and_out),
        .or_out(or_out),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .not_out(not_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out),
        .a(a),
        .b(b)
    );

    initial begin

        $monitor(
            "Time=%0t a=%b b=%b | AND=%b OR=%b NAND=%b NOR=%b XOR=%b XNOR=%b NOT=%b",
            $time, a, b,
            and_out,
            or_out,
            nand_out,
            nor_out,
            xor_out,
            xnor_out,
            not_out
        );

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;

    end

endmodule
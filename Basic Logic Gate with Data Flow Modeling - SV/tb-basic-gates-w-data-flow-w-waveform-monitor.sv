// SystemVerilog testbench code to simulate basic logic gates using dataflow modeling
// SystemVerilog Testbench with Waveform Monitoring

module logic_gate_dataflow_tb;

    logic a, b;
    logic and_out, or_out, nand_out, nor_out;
    logic xor_out, xnor_out, not_out;

    // DUT
    logic_gate_dataflow_sv dut (
        .and_out(and_out),
        .or_out(or_out),
        .nand_out(nand_out),
        .nor_out(nor_out),
        .xor_out(xor_out),
        .xnor_out(xnor_out),
        .not_out(not_out),
        .a(a),
        .b(b)
    );

    initial begin
        $monitor("Time=%0t a=%b b=%b | AND=%b OR=%b XOR=%b XNOR=%b NAND=%b NOR=%b NOT=%b",
                 $time, a, b,
                 and_out, or_out, xor_out,
                 xnor_out, nand_out, nor_out, not_out);

        a = 1'b0; b = 1'b1; #10;
        a = 1'b1; b = 1'b1; #10;

        $finish;
    end

endmodule
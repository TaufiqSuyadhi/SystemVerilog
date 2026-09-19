// SystemVerilog Testbench code to implement All logic gates simulation 
// Improved Version with Waveform Monitoring

module logic_gate_tb;

    logic a, b;

    logic and_out;
    logic or_out;
    logic not_out;
    logic nand_out;
    logic nor_out;
    logic xor_out;

    and_gate  a1 (.a(a), .b(b), .and_out(and_out));
    or_gate   b1 (.a(a), .b(b), .or_out(or_out));
    not_gate  c1 (.a(a), .not_out(not_out));
    nand_gate d1 (.a(a), .b(b), .nand_out(nand_out));
    nor_gate  e1 (.a(a), .b(b), .nor_out(nor_out));
    xor_gate  f1 (.a(a), .b(b), .xor_out(xor_out));

    initial begin

        $display("Time\t a b | AND OR NOT NAND NOR XOR");
        $monitor("%0t\t %0b %0b |  %0b   %0b   %0b    %0b    %0b   %0b",
                 $time, a, b,
                 and_out, or_out, not_out,
                 nand_out, nor_out, xor_out);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end

endmodule
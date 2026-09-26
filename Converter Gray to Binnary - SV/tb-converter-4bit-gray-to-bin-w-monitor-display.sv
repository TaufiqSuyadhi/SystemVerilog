// SystemVerilog testbench code for 4-bit Gray to Binary Converter

`timescale 1ns/1ps

module g_to_b_sv_tb;

    // Testbench signals
    logic [3:0] G;
    logic [3:0] B;

    // DUT Instantiation
    g_to_b_sv dut (
        .B(B),
        .G(G)
    );

    // Apply test vectors
    initial begin

        $display("Time\tGray(G)\tBinary(B)");
        $monitor("%0t\t%b\t%b", $time, G, B);

        G = 4'b0000; #10;   // Binary = 0000
        G = 4'b0001; #10;   // Binary = 0001
        G = 4'b0011; #10;   // Binary = 0010
        G = 4'b0010; #10;   // Binary = 0011
        G = 4'b0110; #10;   // Binary = 0100
        G = 4'b0111; #10;   // Binary = 0101
        G = 4'b0101; #10;   // Binary = 0110
        G = 4'b0100; #10;   // Binary = 0111

        G = 4'b1100; #10;   // Binary = 1000
        G = 4'b1101; #10;   // Binary = 1001
        G = 4'b1111; #10;   // Binary = 1010
        G = 4'b1110; #10;   // Binary = 1011
        G = 4'b1010; #10;   // Binary = 1100
        G = 4'b1011; #10;   // Binary = 1101
        G = 4'b1001; #10;   // Binary = 1110
        G = 4'b1000; #10;   // Binary = 1111

        $finish;

    end

endmodule
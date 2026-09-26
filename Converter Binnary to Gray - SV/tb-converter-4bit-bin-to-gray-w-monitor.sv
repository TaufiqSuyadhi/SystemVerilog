// SystemVerilog testbench code to simulate 4-Bit Binary to Gray Converter
// SystemVerilog Testbench (With Monitor) 

module b_to_g_tb;

    logic [3:0] B;
    logic [3:0] G;

    b_to_g dut (
        .G(G),
        .B(B)
    );

    initial begin

        $monitor("Time=%0t  Binary=%b  Gray=%b",
                 $time, B, G);

        B = 4'b0000; #10;
        B = 4'b0001; #10;
        B = 4'b0010; #10;
        B = 4'b0011; #10;
        B = 4'b0100; #10;
        B = 4'b0101; #10;
        B = 4'b0110; #10;
        B = 4'b0111; #10;
        B = 4'b1000; #10;
        B = 4'b1001; #10;
        B = 4'b1010; #10;
        B = 4'b1011; #10;
        B = 4'b1100; #10;
        B = 4'b1101; #10;
        B = 4'b1110; #10;
        B = 4'b1111; #10;

        $finish;
    end

endmodule
// SystemVerilog code to implement 2-Bit Counter
// Modeling: Gate level modeling

module counter_2bit_gate (
    output logic [1:0] count,
    input  logic clk,
    input  logic rst
);

    logic d0, d1;

    // Toggle bit0 every clock
    not (d0, count[0]);

    // Toggle bit1 when count[0] = 1
    xor (d1, count[1], count[0]);

    dff ff0 (
        .q(count[0]),
        .d(d0),
        .clk(clk),
        .rst(rst)
    );

    dff ff1 (
        .q(count[1]),
        .d(d1),
        .clk(clk),
        .rst(rst)
    );

endmodule
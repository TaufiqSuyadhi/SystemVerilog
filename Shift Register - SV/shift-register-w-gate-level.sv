// SystemVerilog code to implement 4-bit Shift Register
// Modeling: gate-level Modeling

// A shift register (gate-level modeling) can be built from 4x D flip-flops and multiplexers

module shift_register_gate (
    output logic [3:0] q,
    input  logic [1:0] mode,
    input  logic [3:0] parallel_in,
    input  logic clk,
    input  logic rst,
    input  logic serial_in_right,
    input  logic serial_in_left
);

    logic [3:0] d;

    // Multiplexer logic

    assign d[3] =
        (mode == 2'b00) ? q[3] :
        (mode == 2'b01) ? serial_in_right :
        (mode == 2'b10) ? q[2] :
                          parallel_in[3];

    assign d[2] =
        (mode == 2'b00) ? q[2] :
        (mode == 2'b01) ? q[3] :
        (mode == 2'b10) ? q[1] :
                          parallel_in[2];

    assign d[1] =
        (mode == 2'b00) ? q[1] :
        (mode == 2'b01) ? q[2] :
        (mode == 2'b10) ? q[0] :
                          parallel_in[1];

    assign d[0] =
        (mode == 2'b00) ? q[0] :
        (mode == 2'b01) ? q[1] :
        (mode == 2'b10) ? serial_in_left :
                          parallel_in[0];

    dff ff3 (.q(q[3]), .d(d[3]), .clk(clk), .rst(rst));
    dff ff2 (.q(q[2]), .d(d[2]), .clk(clk), .rst(rst));
    dff ff1 (.q(q[1]), .d(d[1]), .clk(clk), .rst(rst));
    dff ff0 (.q(q[0]), .d(d[0]), .clk(clk), .rst(rst));

endmodule
// SystemVerilog code to implement 4-bit Shift Register
// Modeling: data-flow Modeling

module shift_register_dataflow (
    output logic [3:0] q,
    input  logic [1:0] mode,
    input  logic [3:0] parallel_in,
    input  logic clk,
    input  logic rst,
    input  logic serial_in_right,
    input  logic serial_in_left
);

    logic [3:0] next_q;

    assign next_q =
           (mode == 2'b00) ? q :
           (mode == 2'b01) ? {serial_in_right, q[3:1]} :
           (mode == 2'b10) ? {q[2:0], serial_in_left} :
                             parallel_in;

    always_ff @(posedge clk) begin

        if (rst)
            q <= 4'b0000;
        else
            q <= next_q;

    end

endmodule
`
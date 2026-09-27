// SystemVerilog code to implement 4-bit Shift Register
// Modeling: Behavioral Modeling

module shift_register_behavior (
    output logic [3:0] q,
    input  logic [1:0] mode,
    input  logic [3:0] parallel_in,
    input  logic clk,
    input  logic rst,
    input  logic serial_in_right,
    input  logic serial_in_left
);

    always_ff @(posedge clk) begin

        if (rst)
            q <= 4'b0000;
        else begin

            case (mode)

                2'b00: q <= q;

                2'b01:
                    q <= {serial_in_right, q[3:1]};

                2'b10:
                    q <= {q[2:0], serial_in_left};

                2'b11:
                    q <= parallel_in;

                default:
                    q <= q;

            endcase
        end
    end

endmodule
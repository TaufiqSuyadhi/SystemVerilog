//D flip-flop for shift register gate-level building

module dff (
    output logic q,
    input  logic d,
    input  logic clk,
    input  logic rst
);

    always_ff @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule

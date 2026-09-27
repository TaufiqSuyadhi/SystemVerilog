// SystemVerilog code to implement Decade Counter (MOD-10)
// Model: Gate-Level Modeling


module decade_counter_gate (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);

    logic [3:0] next_count;
    logic tc;

    // Terminal count detection (1001 = 9)
    and (tc, count[3], ~count[2], ~count[1], count[0]);

    // Next-state combinational logic
    assign next_count = tc ? 4'b0000 : (count + 4'b0001);

    // Sequential storage
    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= next_count;
    end

endmodule

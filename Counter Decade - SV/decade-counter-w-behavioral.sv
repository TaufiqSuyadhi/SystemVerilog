// SystemVerilog code to implement Decade Counter (MOD-10)
// Model: Behaviour Modeling

module decade_counter_beh (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);

    initial begin
        count <= 4'b0000;
    end

    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else if (count == 4'd9)
            count <= 4'd0;
        else
            count <= count + 1'b1;
    end

endmodule

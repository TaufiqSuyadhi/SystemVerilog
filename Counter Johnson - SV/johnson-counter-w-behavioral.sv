// SystemVerilog code to implement Johnson Counter
// Model: Behavioral Modeling

module johnson_counter_beh (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);

    initial begin
        count = 4'b0000;
    end

    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= {~count[0], count[3:1]};
    end

endmodule

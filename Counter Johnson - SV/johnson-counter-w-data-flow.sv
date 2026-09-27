// SystemVerilog code to implement Johnson Counter
// Model: Data-Flow Modeling

module johnson_counter_df (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);

    wire feedback;

    assign feedback = ~count[0];

    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= {feedback, count[3:1]};
    end

endmodule
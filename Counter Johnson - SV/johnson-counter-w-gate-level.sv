// SystemVerilog code to implement Johnson Counter
// Model: Gate-Level Modeling


module johnson_counter_gate (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);

    logic feedback;

    // Inverted feedback from count[0]
    not (feedback, count[0]);

    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= {feedback, count[3:1]};
    end

endmodule
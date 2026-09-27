// SystemVerilog code to implement 2-Bit Counter
// Modeling: Dataflow modeling

module counter_2bit_dataflow (
    output logic [1:0] count,
    input  logic clk,
    input  logic rst
);

    logic [1:0] next_count;

    assign next_count = count + 2'b01;

    always_ff @(posedge clk) begin

        if (rst)
            count <= 2'b00;
        else
            count <= next_count;

    end

endmodule

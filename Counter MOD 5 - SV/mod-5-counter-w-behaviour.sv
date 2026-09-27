// SystemVerilog code to implement MOD 5 Counter
// Modeling: Behavioral Modeling

module mod5_counter_behavior_sv (
    input  logic clk,
    input  logic rst,
    output logic [2:0] count
);

    initial
        count = 3'b000;

    always_ff @(posedge clk) begin

        if (rst)
            count <= 3'b000;

        else if (count == 3'b100)
            count <= 3'b000;

        else
            count <= count + 3'b001;

    end

endmodule

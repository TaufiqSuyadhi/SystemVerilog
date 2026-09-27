// SystemVerilog code to implement MOD 5 Counter
// Modeling: Gate-level Modeling

module mod5_counter_gate_sv (
    input  logic clk,
    input  logic rst,
    output logic [2:0] count
);

    logic [2:0] next_count;

    always_comb begin

        if (rst)
            next_count = 3'b000;

        else if (count == 3'b100)
            next_count = 3'b000;

        else
            next_count = count + 3'b001;

    end

    always_ff @(posedge clk)
        count <= next_count;

endmodule
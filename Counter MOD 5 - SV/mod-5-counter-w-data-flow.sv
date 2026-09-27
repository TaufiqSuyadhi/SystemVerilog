// SystemVerilog code to implement MOD 5 Counter
// Modeling: Dataflow Modeling

module mod5_counter_dataflow_sv (
    input  logic clk,
    input  logic rst,
    output logic [2:0] count
);

    always_ff @(posedge clk) begin

        count <= rst              ? 3'b000 :
                 (count == 3'b100)? 3'b000 :
                                    count + 3'b001;

    end

endmodule

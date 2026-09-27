// SystemVerilog code to implement Decade Counter (MOD-10)
// Model: Data flow Modeling

module decade_counter_df (
    input  logic       clk,
    input  logic       rst,
    output logic [3:0] count
);

    wire terminal_count;

    assign terminal_count =
            count[3] &
           ~count[2] &
           ~count[1] &
            count[0];

    always_ff @(posedge clk) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= terminal_count ? 4'b0000 :
                                      count + 4'b0001;
    end

endmodule
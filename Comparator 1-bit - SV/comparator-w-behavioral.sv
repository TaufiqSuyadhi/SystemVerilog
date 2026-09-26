// SystemVerilog Comparator Using Behavioral Modeling

// 1-Bit Comparator
// Behavioral Modeling

module comparator_behavior (
    output logic gt,
    output logic lt,
    output logic eq,
    input  logic a,
    input  logic b
);

    always_comb begin

        if (a > b) begin
            gt = 1'b1;
            lt = 1'b0;
            eq = 1'b0;
        end
        else if (a < b) begin
            gt = 1'b0;
            lt = 1'b1;
            eq = 1'b0;
        end
        else begin
            gt = 1'b0;
            lt = 1'b0;
            eq = 1'b1;
        end

    end

endmodule
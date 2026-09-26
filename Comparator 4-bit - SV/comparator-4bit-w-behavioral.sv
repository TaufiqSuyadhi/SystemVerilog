// SystemVerilog 4-bit Comparator Using Behavioral Modeling

// Note: 
//		gt = greater-than
//		lt = Less-than
//		eq = equal-to

module comparator_4bit_behavior (
    output logic gt,
    output logic lt,
    output logic eq,
    input  logic [3:0] A,
    input  logic [3:0] B
);

    always_comb begin

        if (A > B) begin
            gt = 1'b1;
            lt = 1'b0;
            eq = 1'b0;
        end
        else if (A < B) begin
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

// SystemVerilog code to implement full-subtractor using Behavioral Modeling
// Behavioral Modeling using "always_comb"

module fs_sv (
    output logic difference_fs,
    output logic borrow_fs,
    input  logic a,
    input  logic b,
    input  logic bin
);

    always_comb begin
        difference_fs = a ^ b ^ bin;

        borrow_fs = (~a & b) |
                    (~(a ^ b) & bin);
    end

endmodule

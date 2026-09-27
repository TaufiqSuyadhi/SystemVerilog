// SystemVerilog code to implement Encoder 4-to-2
// Model: Behavioral

module encoder_behavior_sv (
    output logic y0,
    output logic y1,
    input  logic I0,
    input  logic I1,
    input  logic I2,
    input  logic I3
);

    always_comb begin

        y0 = 1'b0;
        y1 = 1'b0;

        if (I0) begin
            y1 = 0;
            y0 = 0;
        end
        else if (I1) begin
            y1 = 0;
            y0 = 1;
        end
        else if (I2) begin
            y1 = 1;
            y0 = 0;
        end
        else if (I3) begin
            y1 = 1;
            y0 = 1;
        end

    end

endmodule

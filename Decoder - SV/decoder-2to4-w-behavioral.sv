// SystemVerilog code to implement decoder 2-to-4
// Model: Behavioral

module decoder_behavior_sv (
    output logic y0,
    output logic y1,
    output logic y2,
    output logic y3,
    input  logic I0,
    input  logic I1
);

    always_comb begin

        y0 = 1'b0;
        y1 = 1'b0;
        y2 = 1'b0;
        y3 = 1'b0;

        case ({I0,I1})

            2'b00: y0 = 1'b1;
            2'b01: y1 = 1'b1;
            2'b10: y2 = 1'b1;
            2'b11: y3 = 1'b1;

        endcase

    end

endmodule

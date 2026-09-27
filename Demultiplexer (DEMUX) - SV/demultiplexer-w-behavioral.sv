// SystemVerilog code to implement Demultiplexer (DEMUX) using Behavioral modeling
// 1-to-4 DeMUX

module demux_behavior_sv (
    output logic y1,
    output logic y2,
    output logic y3,
    output logic y4,
    input  logic a,
    input  logic s1,
    input  logic s0
);

    always_comb begin

        // Default values
        y1 = 1'b0;
        y2 = 1'b0;
        y3 = 1'b0;
        y4 = 1'b0;

        case ({s1,s0})

            2'b00: y1 = a;
            2'b01: y2 = a;
            2'b10: y3 = a;
            2'b11: y4 = a;

        endcase

    end

endmodule

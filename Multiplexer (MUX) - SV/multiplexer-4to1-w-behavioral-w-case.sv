// SystemVerilog code to implement Multiplexer 4 to 1 using Behavioral Modeling modeling
// Using CASE control program 

module mux_behavior_sv (
    output logic y,
    input  logic s1,
    input  logic s0,
    input  logic a,
    input  logic b,
    input  logic c,
    input  logic d
);

    always_comb begin

        case ({s1,s0})

            2'b00: y = a;
            2'b01: y = b;
            2'b10: y = c;
            2'b11: y = d;

            default: y = 1'b0;

        endcase

    end

endmodule

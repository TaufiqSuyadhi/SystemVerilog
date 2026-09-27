// SystemVerilog code to implement Multiplexer 4 to 1 using Behavioral Modeling modeling
// Using IF...ELSE control program 

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

        if ({s1,s0} == 2'b00)
            y = a;
        else if ({s1,s0} == 2'b01)
            y = b;
        else if ({s1,s0} == 2'b10)
            y = c;
        else
            y = d;

    end

endmodule
// SystemVerilog testbench code to simulate Encoder 4-to-2
// Model: gate level, data flow, and behavioral
// Using: assertion for Self-Checking

logic [1:0] expected;

always_comb begin

    case ({I3,I2,I1,I0})

        4'b0001: expected = 2'b00;
        4'b0010: expected = 2'b01;
        4'b0100: expected = 2'b10;
        4'b1000: expected = 2'b11;

        default: expected = 2'b00;

    endcase

end

always @(*) begin

    assert ({y1_gate,y0_gate} == expected)
        else $fatal("Gate-Level Encoder Error");

    assert ({y1_df,y0_df} == expected)
        else $fatal("Dataflow Encoder Error");

    assert ({y1_beh,y0_beh} == expected)
        else $fatal("Behavioral Encoder Error");

end
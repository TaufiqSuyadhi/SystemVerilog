// SystemVerilog testbench code to simulate Demultiplexer (DEMUX) 
// Using Gate-level, Dataflow, and Behavioral modeling
// 1-to-4 DeMUX
// Equip with Assertion for Self-Checking

logic exp_y1, exp_y2, exp_y3, exp_y4;

always_comb begin

    exp_y1 = (~s1 & ~s0 & a);
    exp_y2 = (~s1 &  s0 & a);
    exp_y3 = ( s1 & ~s0 & a);
    exp_y4 = ( s1 &  s0 & a);

end

always @(*) begin

    assert (y1_gate == exp_y1)
        else $fatal("Gate y1 mismatch");

    assert (y2_gate == exp_y2)
        else $fatal("Gate y2 mismatch");

    assert (y3_gate == exp_y3)
        else $fatal("Gate y3 mismatch");

    assert (y4_gate == exp_y4)
        else $fatal("Gate y4 mismatch");

    assert (y1_df == exp_y1)
        else $fatal("Dataflow y1 mismatch");

    assert (y2_df == exp_y2)
        else $fatal("Dataflow y2 mismatch");

    assert (y3_df == exp_y3)
        else $fatal("Dataflow y3 mismatch");

    assert (y4_df == exp_y4)
        else $fatal("Dataflow y4 mismatch");

    assert (y1_beh == exp_y1)
        else $fatal("Behavioral y1 mismatch");

    assert (y2_beh == exp_y2)
        else $fatal("Behavioral y2 mismatch");

    assert (y3_beh == exp_y3)
        else $fatal("Behavioral y3 mismatch");

    assert (y4_beh == exp_y4)
        else $fatal("Behavioral y4 mismatch");

end
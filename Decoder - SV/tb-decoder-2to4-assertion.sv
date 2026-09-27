// SystemVerilog testbench code to simulate decoder 2-to-4
// Model: gate level, data flow, and behavioral
// Equip with assertion

logic exp_y0, exp_y1, exp_y2, exp_y3;

always_comb begin

    exp_y0 = (~I0) & (~I1);
    exp_y1 = (~I0) & I1;
    exp_y2 = I0 & (~I1);
    exp_y3 = I0 & I1;

end

always @(*) begin

    // Gate-level checks
    assert (y0_gate == exp_y0)
        else $fatal("Gate y0 mismatch");

    assert (y1_gate == exp_y1)
        else $fatal("Gate y1 mismatch");

    assert (y2_gate == exp_y2)
        else $fatal("Gate y2 mismatch");

    assert (y3_gate == exp_y3)
        else $fatal("Gate y3 mismatch");

    // Dataflow checks
    assert (y0_df == exp_y0)
        else $fatal("Dataflow y0 mismatch");

    assert (y1_df == exp_y1)
        else $fatal("Dataflow y1 mismatch");

    assert (y2_df == exp_y2)
        else $fatal("Dataflow y2 mismatch");

    assert (y3_df == exp_y3)
        else $fatal("Dataflow y3 mismatch");

    // Behavioral checks
    assert (y0_beh == exp_y0)
        else $fatal("Behavioral y0 mismatch");

    assert (y1_beh == exp_y1)
        else $fatal("Behavioral y1 mismatch");

    assert (y2_beh == exp_y2)
        else $fatal("Behavioral y2 mismatch");

    assert (y3_beh == exp_y3)
        else $fatal("Behavioral y3 mismatch");

end
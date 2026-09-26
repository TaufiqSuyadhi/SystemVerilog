// SystemVerilog testbench code to simulate adder (HA, FA) and subtractor (HS, FS) using dataflow modeling
// HA, FA, HS, and FS using dataflow modeling

module ha_fa_hs_fs_dataflow_tb;

    logic sum_ha;
    logic carry_ha;
    logic sum_fa;
    logic carry_fa;
    logic diff_hs;
    logic borrow_hs;
    logic diff_fs;
    logic borrow_fs;

    logic a;
    logic b;
    logic bin;
    logic cin;

    // DUT Instantiation
    ha_fa_hs_fs_dataflow_sv p1 (
        .sum_ha(sum_ha),
        .carry_ha(carry_ha),
        .sum_fa(sum_fa),
        .carry_fa(carry_fa),
        .diff_hs(diff_hs),
        .borrow_hs(borrow_hs),
        .diff_fs(diff_fs),
        .borrow_fs(borrow_fs),
        .a(a),
        .b(b),
        .bin(bin),
        .cin(cin)
    );

    initial begin

        a = 0; b = 0; bin = 0; cin = 0; #10;
        a = 0; b = 0; bin = 1; cin = 1; #10;
        a = 0; b = 1; bin = 0; cin = 0; #10;
        a = 0; b = 1; bin = 1; cin = 1; #10;
        a = 1; b = 0; bin = 0; cin = 0; #10;
        a = 1; b = 0; bin = 1; cin = 1; #10;
        a = 1; b = 1; bin = 0; cin = 0; #10;
        a = 1; b = 1; bin = 1; cin = 1; #10;

        $finish;

    end

endmodule
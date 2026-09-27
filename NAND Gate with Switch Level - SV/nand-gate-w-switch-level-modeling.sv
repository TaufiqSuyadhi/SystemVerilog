// SystemVerilog code to implement NAND logic gate using Switch-level modeling

module cmos_nand_sv (
    output logic y,
    input  logic a,
    input  logic b
);

    supply1 vdd;
    supply0 gnd;

    wire e1;

    // Pull-up network (PMOS in parallel)
    pmos p1 (y,  vdd, a);
    pmos p2 (y,  vdd, b);

    // Pull-down network (NMOS in series)
    nmos n1 (y,  e1,  b);
    nmos n2 (e1, gnd, a);

endmodule

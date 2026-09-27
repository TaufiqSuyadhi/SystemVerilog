// SystemVerilog code to implement NOR logic gate using Switch-level modeling

module cmos_nor_sv (
    output wire y,
    input  wire a,
    input  wire b
);

    supply1 vdd;
    supply0 gnd;

    wire e1;

    // Pull-up network (PMOS in series)
    pmos p1 (y,  e1,  a);
    pmos p2 (e1, vdd, b);

    // Pull-down network (NMOS in parallel)
    nmos n1 (y, gnd, a);
    nmos n2 (y, gnd, b);

endmodule

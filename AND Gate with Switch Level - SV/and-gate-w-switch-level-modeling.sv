// SystemVerilog code to implement AND gate using Switch-level modeling

module cmos_and_sv (
    output wire y,
    input  wire a,
    input  wire b
);

    wire e1;
    wire e2;

    supply1 vdd;
    supply0 gnd;

    // NAND network
    pmos p1 (e1, vdd, a);
    pmos p2 (e1, vdd, b);

    nmos n2 (e1, e2, a);
    nmos n3 (e2, gnd, b);

    // Inverter stage
    pmos p3 (y, vdd, e1);
    nmos n4 (y, gnd, e1);

endmodule

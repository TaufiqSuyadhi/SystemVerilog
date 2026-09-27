// SystemVerilog code to implement OR logic gate using Switch-level modeling

module cmos_or_sv (
    output logic y,
    input  logic a,
    input  logic b
);

    wire e1;
    wire e2;

    supply1 vdd;
    supply0 gnd;

    // NOR gate implementation
    pmos p1_1 (e1, e2, a);
    pmos p2_1 (e2, vdd, b);

    nmos n1 (e1, gnd, a);
    nmos n2 (e1, gnd, b);

    // Inverter
    pmos p3 (y, vdd, e1);
    nmos n4 (y, gnd, e1);

endmodule

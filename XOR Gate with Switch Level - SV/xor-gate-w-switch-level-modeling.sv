// SystemVerilog code to implement XOR logic gate using Switch-level modeling

module cmos_xor_sv (
    output wire y,
    input  wire a,
    input  wire b
);

    wire e1, e2, e3;
    wire Abar, Bbar;

    supply1 vdd;
    supply0 gnd;

    assign Abar = ~a;
    assign Bbar = ~b;

    // PMOS Network
    pmos p1 (e1, vdd, a);
    pmos p2 (e1, vdd, b);
    pmos p3 (y,  e1,  Abar);
    pmos p4 (y,  e1,  Bbar);

    // NMOS Network
    nmos n1 (e2, gnd,  b);
    nmos n2 (y,  e2,   a);

    nmos n3 (e3, gnd,  Bbar);
    nmos n4 (y,  e3,   Abar);

endmodule
// SystemVerilog code for Switch-level modeling based on EQUATION

// EQUATION: 
// Y = (AB)E + CDbar + (Gbar + H)
// Y = (AB)E + CD̅ + (G̅ + H)
//=================================================

module cmos_exp_sv (
    output logic y,
    input  logic a,
    input  logic b,
    input  logic c,
    input  logic d,
    input  logic e,
    input  logic g,
    input  logic h
);

    wire e1, e2, e3, e4, e5, e6, e7;
    wire Dbar, Gbar;

    supply1 vdd;
    supply0 gnd;

    assign Dbar = ~d;
    assign Gbar = ~g;

    // Pull-Up Network (PUN)

    pmos p1 (e1, vdd, a);
    pmos p2 (e1, vdd, b);
    pmos p3 (e1, vdd, e);

    pmos p4 (e2, e1, Dbar);
    pmos p5 (e2, e1, c);

    pmos p6 (e3, e2, h);
    pmos p7 (e4, e3, Gbar);

    // Output inverter
    pmos p8 (y, vdd, e4);

    // Pull-Down Network (PDN)

    nmos n1 (e6, gnd, e);
    nmos n2 (e5, e6, b);
    nmos n3 (e4, e5, a);

    nmos n4 (e7, gnd, Dbar);
    nmos n5 (e4, e7, c);

    nmos n6 (e4, gnd, Gbar);
    nmos n7 (e4, gnd, h);

    // Output inverter
    nmos n8 (y, gnd, e4);

endmodule

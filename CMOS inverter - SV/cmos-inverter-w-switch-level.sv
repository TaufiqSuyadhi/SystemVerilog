// SystemVerilog code to implement CMOS inverter
// Model: Switch-Level Modeling (Primitive: pmos and nmos)


module cmos_inverter_sv (
    output logic y,
    input  logic a
);

    supply1 vdd;
    supply0 gnd;

    pmos p1 (y, vdd, a);
    nmos n1 (y, gnd, a);

endmodule
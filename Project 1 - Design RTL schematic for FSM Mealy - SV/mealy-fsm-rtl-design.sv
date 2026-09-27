// SystemVerilog code for Mealy FSM's RTL schematic Design 
// Finite State Machine/FSM: Mealy Sequence 101

module sequence_101_jk_sv (
    output logic y,
    input  logic h,
    input  logic clk,
    input  logic reset
);

    logic qb, qa;
    logic jb, kb, ja, ka;

    // JK excitation equations
    assign jb = ~h & qa;
    assign kb = 1'b1;

    assign ja = h;
    assign ka = ~h;

    // Mealy output equation
    assign y = qb & h;

    // State registers
    always_ff @(posedge clk) begin
        if (reset) begin
            qb <= 1'b0;
            qa <= 1'b0;
        end
        else begin
            qb <= (jb & ~qb) | (~kb & qb);
            qa <= (ja & ~qa) | (~ka & qa);
        end
    end

endmodule

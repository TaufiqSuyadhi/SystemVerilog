// SystemVerilog testbench code to simulate Multiplexer 4 to 1
// Unified testbench for gate-level/dataflow/behavioral modeling.
// With assertion

logic expected_y;

always_comb begin
    case ({s1,s0})
        2'b00: expected_y = a;
        2'b01: expected_y = b;
        2'b10: expected_y = c;
        2'b11: expected_y = d;
    endcase
end

assert(y_gate == expected_y)
    else $fatal("Gate-Level MUX Error");

assert(y_dataflow == expected_y)
    else $fatal("Dataflow MUX Error");

assert(y_behavior == expected_y)
    else $fatal("Behavioral MUX Error");
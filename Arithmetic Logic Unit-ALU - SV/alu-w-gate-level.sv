// SystemVerilog code to implement Arithmetic Logic Unit (ALU)
// Modeling: Gate-level

module alu_gate_sv (
    output logic [7:0] Result,
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [1:0] set
);

    logic [7:0] add_result;
    logic [7:0] sub_result;
    logic [7:0] not_result;
    logic [7:0] mul_result;

    // Arithmetic operations
    assign add_result = A + B;
    assign sub_result = A - B;
    assign mul_result = A * B;

    // NOT operation using primitives
    not (not_result[0], A[0]);
    not (not_result[1], A[1]);
    not (not_result[2], A[2]);
    not (not_result[3], A[3]);

    assign not_result[7:4] = 4'b1111;

    // Output selection
    assign Result =
           (~set[1] & ~set[0]) ? add_result :
           (~set[1] &  set[0]) ? sub_result :
           ( set[1] & ~set[0]) ? not_result :
                                 mul_result;

endmodule
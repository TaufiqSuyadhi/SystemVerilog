// SystemVerilog code to implement Arithmetic Logic Unit (ALU)
// Modeling: Dataflow

module alu_dataflow_sv (
    output logic [7:0] Result,
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [1:0] set
);

    assign Result =
           (set == 2'b00) ? (A + B) :
           (set == 2'b01) ? (A - B) :
           (set == 2'b10) ? (~A)    :
                            (A * B);

endmodule
``
// SystemVerilog code to implement Arithmetic Logic Unit (ALU)
// Modeling: Behavioral

module alu_behavior_sv (
    output logic [7:0] Result,
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [1:0] set
);

    always_comb begin

        case (set)

            2'b00: Result = A + B;
            2'b01: Result = A - B;
            2'b10: Result = ~A;
            2'b11: Result = A * B;

            default:
                Result = 8'h00;

        endcase

    end

endmodule

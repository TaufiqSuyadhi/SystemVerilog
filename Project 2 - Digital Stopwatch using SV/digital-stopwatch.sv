// SystemVerilog code for digital_stopwatch application

module digital_stopwatch_sv (
    input  logic       clk,      // 1 Hz clock
    input  logic       reset,
    input  logic       start,
    output logic [5:0] seconds,
    output logic [5:0] minutes
);

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            seconds <= 6'd0;
            minutes <= 6'd0;
        end
        else if (start) begin
            if (seconds == 6'd59) begin
                seconds <= 6'd0;

                if (minutes == 6'd59)
                    minutes <= 6'd0;
                else
                    minutes <= minutes + 6'd1;
            end
            else begin
                seconds <= seconds + 6'd1;
            end
        end
    end

endmodule

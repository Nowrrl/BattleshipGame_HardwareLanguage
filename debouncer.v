module debouncer (
    input clk,            // Input clock (should use divided clock)
    input btn_in,         // Raw button input
    output reg btn_out    // Cleaned output signal
);
    reg [2:0] shift_reg;  // Shift register for debouncing

    always @(posedge clk) begin
        shift_reg <= {shift_reg[1:0], btn_in};
        if (shift_reg == 3'b111)
            btn_out <= 1'b1; // Rising edge detected
        else
            btn_out <= 1'b0;
    end
endmodule

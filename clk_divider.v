module clk_divider (
    input clk_in,         // Input clock (100 MHz)
    output reg clk_out    // Output clock (50 Hz)
);
    reg [31:0] counter;

    always @(posedge clk_in) begin
        counter <= counter + 1;
        if (counter >= 1000000) begin // Adjust to match 50 Hz frequency
            counter <= 0;
            clk_out <= ~clk_out;
        end
    end
endmodule

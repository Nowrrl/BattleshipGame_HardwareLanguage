`timescale 1ns / 1ps

module clk_divider_tb;
    reg clk_in;         // Test input clock
    wire clk_out;       // Test output clock

    // Instantiate the clk_divider module
    clk_divider uut (
        .clk_in(clk_in),
        .clk_out(clk_out)
    );

    // Generate a 100 MHz clock
    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in; // 100 MHz = 10 ns period
    end

    // Run simulation for some time
    initial begin
        $dumpfile("clk_divider_tb.vcd");
        $dumpvars(0, clk_divider_tb);
        #1000000 $finish; // Simulate for 1 ms
    end
endmodule

`timescale 1ns / 1ps

module debouncer_tb;
    reg clk, btn_in;    // Test inputs
    wire btn_out;       // Test output

    // Instantiate the debouncer module
    debouncer uut (
        .clk(clk),
        .btn_in(btn_in),
        .btn_out(btn_out)
    );

    // Generate a slow clock (50 Hz)
    initial begin
        clk = 0;
        forever #10000 clk = ~clk; // 50 Hz = 20 ms period
    end

    // Simulate button press with bouncing
    initial begin
        btn_in = 0;
        #200000 btn_in = 1; // Press button
        #30000 btn_in = 0; // Bounce off
        #30000 btn_in = 1; // Bounce back
        #200000 btn_in = 0; // Release button
    end

    // Run simulation
    initial begin
        $dumpfile("debouncer_tb.vcd");
        $dumpvars(0, debouncer_tb);
        #1000000 $finish; // Simulate for 1 second
    end
endmodule

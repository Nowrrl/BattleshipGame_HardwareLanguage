`timescale 1ns / 1ps

module ssd_tb;
    reg [3:0] digit;       // Test input (digit)
    wire [7:0] pgfedcba;   // Test output (SSD control signals)

    // Instantiate the SSD module
    ssd uut (
        .digit(digit),
        .pgfedcba(pgfedcba)
    );

    // Apply test cases
    initial begin
        $monitor("Time: %0d, Digit: %b, SSD Output: %b", $time, digit, pgfedcba);
        $dumpfile("ssd_tb.vcd");
        $dumpvars(0, ssd_tb);

        digit = 4'd0; #10;
        digit = 4'd1; #10;
        digit = 4'd2; #10;
        digit = 4'd3; #10;
        digit = 4'd4; #10;
        digit = 4'd5; #10;
        digit = 4'd6; #10;
        digit = 4'd7; #10;
        digit = 4'd8; #10;
        digit = 4'd9; #10;
        $finish;
    end
endmodule

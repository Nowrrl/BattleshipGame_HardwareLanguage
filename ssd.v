module ssd (
    input [3:0] digit,     // 4-bit input digit
    output reg [7:0] pgfedcba // SSD control signals
);
    always @(*) begin
        case (digit)
            4'd0: pgfedcba = 8'b00111111; // 0
            4'd1: pgfedcba = 8'b00000110; // 1
            4'd2: pgfedcba = 8'b01011011; // 2
            4'd3: pgfedcba = 8'b01001111; // 3
            4'd4: pgfedcba = 8'b01100110; // 4
            4'd5: pgfedcba = 8'b01101101; // 5
            4'd6: pgfedcba = 8'b01111101; // 6
            4'd7: pgfedcba = 8'b00000111; // 7
            4'd8: pgfedcba = 8'b01111111; // 8
            4'd9: pgfedcba = 8'b01101111; // 9
            default: pgfedcba = 8'b00000000; // Blank
        endcase
    end
endmodule

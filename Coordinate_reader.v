module coordinate_reader (
    input [3:0] switches,
    input clk,
    output reg [3:0] x_coord, y_coord
);
    always @(posedge clk) begin
        x_coord <= switches[3:2];
        y_coord <= switches[1:0];
    end
endmodule

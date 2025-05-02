module battleship_game (
    input clk, rst, start,
    input [3:0] switches, // X and Y coordinates
    input BTN3, BTN0, BTN1, BTN2, // Player A, Player B, Start, Reset
    output [7:0] leds,         // LEDs for indicators
    output [7:0] ssd0, ssd1, ssd2, ssd3 // SSD control signals
);
    wire clk_div; // Divided clock signal
    wire [1:0] player; // Current player indicator
    wire [3:0] x_coord, y_coord; // Coordinates
    wire hit, win; // Hit or win signal

    // Clock divider instance
    clk_divider clk_div_inst (.clk_in(clk), .clk_out(clk_div));

    // Game logic instance
    game_logic game_inst (
        .clk(clk_div),
        .rst(rst),
        .start(start),
        .player(player),
        .x_coord(x_coord),
        .y_coord(y_coord),
        .hit(hit),
        .win(win),
        .leds(leds),
        .ssd0(ssd0), .ssd1(ssd1), .ssd2(ssd2), .ssd3(ssd3)
    );

    // Coordinate handler
    coordinate_reader coord_inst (
        .switches(switches),
        .clk(clk_div),
        .x_coord(x_coord),
        .y_coord(y_coord)
    );
endmodule

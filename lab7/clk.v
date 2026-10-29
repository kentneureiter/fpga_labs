`timescale 1ns / 1ps

module clk(
    input clock_in,                   // 100 MHz board clock (W5)
    output reg clk_slow = 1'b0,       // 1 Hz   -> counter
    output reg clk_fast = 1'b0        // 1 kHz  -> anode shift register
    );

    reg [25:0] count_slow = 26'd0;    // needs to reach 49,999,999
    reg [15:0] count_fast = 16'd0;    // needs to reach 49,999

    // slow clock: toggle every 50,000,000 cycles = 0.5 s -> 1 Hz
    always @(posedge clock_in) begin
        if (count_slow == 26'd49_999_999) begin
            clk_slow   <= ~clk_slow;
            count_slow <= 26'd0;
        end else
            count_slow <= count_slow + 1;
    end

    // fast clock: toggle every 50,000 cycles = 0.5 ms -> 1 kHz
    always @(posedge clock_in) begin
        if (count_fast == 16'd49_999) begin
            clk_fast   <= ~clk_fast;
            count_fast <= 16'd0;
        end else
            count_fast <= count_fast + 1;
    end

endmodule

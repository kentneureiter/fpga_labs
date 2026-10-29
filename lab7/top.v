`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );

    wire clk_1hz, clk_1khz;
    wire [11:0] count;
    wire [15:0] bcd;
    wire [3:0]  digit;

    clk div  (.clock_in(clk), .clk_slow(clk_1hz), .clk_fast(clk_1khz));

    counter   cnt  (.clk(clk_1hz), .rst(rst), .count(count));

    bin2bcd   b2b  (.clk(clk), .rst(rst), .en(1'b1),
                    .bin_in(count), .rdy(), .bcd_out(bcd));

    anode_gen ag   (.clk(clk), .rst(rst), .bcd_in(bcd),
                    .anode(an), .bcd_val(digit));

    BCD       dec  (.bcd(digit), .seg(seg));

    assign dp = 1'b1;   // active-low, so 1 = off

endmodule

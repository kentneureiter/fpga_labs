`timescale 1ns / 1ps

module top_tb;

    // Inputs to top module
    reg clk;
    reg rst;

    // Outputs from top module
    wire [6:0] seg;
    wire [3:0] an;
    wire dp;

    // Instantiate Unit Under Test (UUT)
    top uut (
        .clk(clk),
        .rst(rst),
        .seg(seg),
        .an(an),
        .dp(dp)
    );

    // 100 MHz clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;

        // Release reset after 100 ns
        #100;
        rst = 0;

        // Run simulation for a bit
        #10000;

        // Test reset pulse
        rst = 1;
        #50;
        rst = 0;

        #5000;
        $finish;
    end

endmodule

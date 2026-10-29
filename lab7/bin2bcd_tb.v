`timescale 1ns / 1ps

module anode_gen_tb;
    reg clk, rst;
    reg [15:0] bcd_in;
    wire [3:0] anode;
    wire [3:0] bcd_val;

    anode_gen uut(.clk(clk), .rst(rst), .bcd_in(bcd_in),
                  .anode(anode), .bcd_val(bcd_val));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;       // 100 MHz
    end

    initial begin
        rst = 1;
        bcd_in = 16'h1234;           // digits 1,2,3,4
        #20 rst = 0;

        #400 bcd_in = 16'h4095;      // change the number mid-run
        #400 $finish;
    end
endmodule


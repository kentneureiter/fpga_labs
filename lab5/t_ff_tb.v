`timescale 1ns / 1ps
module tff_tb;
 reg clk, rstn, t;
 wire q;
 
 t_ff dut(.clk(clk), .rstn(rstn), .t(t), .q(q));
 
 
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end
 
 initial begin
 t = 0; rstn = 0; 
 #12 rstn = 1; 
 #20 t = 1; 
 #40 t = 0; 
 #30 t = 1;
 #20 rstn = 0; 
 #20 $finish;
 end
endmodule

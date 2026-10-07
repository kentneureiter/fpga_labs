`timescale 1ns / 1ps
module counter_tb;
 reg clk, rstn;
 wire q0, q1, q2;
 
 counter dut(.clk(clk), .rstn(rstn), .q0(q0), .q1(q1), .q2(q2));
 
 initial begin
 clk = 0;
 forever #5 clk = ~clk; 
 end
 
 initial begin
 rstn = 0; 
 #20 rstn = 1; 
 #100 $finish; 
 end
endmodule

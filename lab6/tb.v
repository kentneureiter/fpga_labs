`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:36:54 PM
// Design Name: 
// Module Name: moore_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module moore_tb; 
 // Inputs 
 reg P1; 
 reg clk; 
 reg reset; 
 // Outputs 
 wire z; 
 // Instantiate the Unit Under Test (UUT) 
    //moore uut ( .P1(P1), .clk (clk), .reset(reset), .z(z) );
    mealy uut ( .P1(P1), .clk (clk), .reset(reset), .z(z) );

initial 
begin 
 clk = 1'b0; 
 reset = 1'b1; 
 #15 reset = 1'b0; 
 end 
always #5 clk = ~ clk; 
initial begin 
 P1 =0;
 #10 P1 =1;
 #10 P1=1;
 #10 P1=0;
 #10 P1=1;
 #10 P1=0;
 #10 P1=1;
 #10 P1=0;
 #10 P1=0;
 #10 P1 =1;
 #10 P1 =1;
 #10 P1 =0;
 #10 P1 =1;
  #10 P1 =1;
 
 #10 $finish; 
 end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2026 03:22:16 PM
// Design Name: 
// Module Name: seq_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
//    input            clk,
 //   input            rst,
   // input            start,
 //   input      [3:0] a,
 //   input      [3:0] b,
 //   output reg [7:0] product,
 //   output reg       done
//);

 //   reg [7:0] a_reg;   // multiplicand, shifts left
 //   reg [3:0] b_reg;   // multiplier, shifts right
 //   reg [1:0] count;   // counts 0..3 (4 iterations)
 //   reg       busy;
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq_tb;

reg clk;
reg rst;
reg start;
reg [3:0] a, b;
wire [7:0] product;
wire done;

seq_multiplier uut (.clk(clk), .rst(rst), .start(start), .a(a), .b(b), .product(product), .done(done));

initial clk = 0;
always #5 clk = ~clk;

initial begin

rst = 1; start = 0; a = 4'b0000; b = 4'b0000;
#20 rst = 0;

#10 a = 4'b0101; b = 4'b0011; start = 1;
#10 start = 0;
#80 a = 4'b0111; b = 4'b1011; start = 1;
#10 start = 0;
#80 a = 4'b0001; b = 4'b0011; start = 1;
#10 start = 0;
#80 a = 4'b0110; b = 4'b0100; start = 1;
#10 start = 0;
#80 a = 4'b1000; b = 4'b1001; start = 1;
#10 start = 0;
#80 a = 4'b0100; b = 4'b0011; start = 1;
#10 start = 0;





#80 $stop;

end
endmodule




 


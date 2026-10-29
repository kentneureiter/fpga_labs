`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 03:05:50 PM
// Design Name: 
// Module Name: counter
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


module counter(
 input wire clk, // Clock input
 	input wire rst, // Asynchronous reset
 	output reg [11:0] count // 4-bit counter output
);

    always @(posedge clk) begin
        if (rst)
 	  count <= 12'd0; // Reset the output to 0
    else if (count == 12'd4095) 
	   count <= 12'd0;
    else
    count <= count+1; // Update the counter output
    end
endmodule

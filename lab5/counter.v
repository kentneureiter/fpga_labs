`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 02:53:35 PM
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
    input clk,
    input rstn,
    output q0,
    output q1,
    output q2
    );
    wire tt1, tt2;

    
    t_ff num_0(.clk(clk), . rstn(rstn), . t(1'b1), .q(q0));
    assign tt1 = q0;
    t_ff num_1(.clk(clk), . rstn(rstn), . t(tt1), .q(q1));
    assign tt2 = q1 & q2;
    t_ff num_2(.clk(clk), . rstn(rstn), . t(tt2), .q(q2));
    
endmodule

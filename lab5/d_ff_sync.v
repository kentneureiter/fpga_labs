`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 02:53:35 PM
// Design Name: 
// Module Name: dff_async
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


module dff_async(
    input d,
    input rstn,
    input clk,
    output reg q
    );
    
    always @ ( posedge clk or negedge rstn)
    if (!rstn) q <= 1'b0;
    else       q <= d;
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 02:53:35 PM
// Design Name: 
// Module Name: clock_dvd
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


module clock_dvd(
    input clock_in,
    output reg clock_out
    );
    
    reg[1:0] counter=2'd0; 
    always @(posedge clock_in) begin 
        counter <= counter + 1; 
        if (counter == 2'b01) begin 
            clock_out <= ~clock_out;
            counter <=0;
            end
        end

endmodule

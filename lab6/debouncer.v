`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:20:25 PM
// Design Name: 
// Module Name: debouncing
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


module debouncing (input RAW, input CLK, output reg CLEAN);

//internal counter and TC signal
reg[4:0] counter;
wire TC;

//reset and increment counter
always @ (posedge CLK) begin
if(~RAW)
counter <= 3'b00000;
else
counter <= counter + 3'b00001;
end

assign TC = (counter==3'b11111);

//change output signal
//when counter reaches max
always @ (posedge CLK) begin
if(~RAW)
CLEAN <= 1'b0;
else if (TC)
CLEAN <= 1'b1;
end
endmodule

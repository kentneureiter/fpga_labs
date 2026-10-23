`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2026 02:18:56 PM
// Design Name: 
// Module Name: moore
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


module mealy(
input P1,clk,reset, output reg z
);
parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3;
reg [1:0] PS,NS ;
 always@(posedge clk or posedge reset)
 begin
 if(reset)
 PS <= S0;
 else
 PS <= NS ;
 end
 always@(PS or P1)
 begin

 case(PS)

S0 : begin
 if (P1)
 NS = S1;
 else
 NS = S0;
 end
 S1 : begin
 if (!P1)
 NS = S0;
 else
 NS = S2;
 end
 S2 : begin
 if (!P1)
 NS = S3;
 else
 NS = S2;
 end
 S3 : begin
 if (!P1)
 NS = S0;
 else
 NS = S1;
 end

 
 default: NS = S0;
 
 endcase
 end
 
   always @ (PS or P1)
    begin
    case (PS)
        S0 : z = 0 ;
        S1 : z = 0 ;
        S2 : z = 0 ;
        S3 : begin 
             if(P1)
             z=1;
             else
             z = 0;
             end

        default : z = 0;

 endcase
end
endmodule

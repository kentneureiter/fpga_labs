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


`timescale 1ns / 1ps
module moore(
input P1,clk,reset, output reg z
);
parameter S0 = 0 , S1 = 1 , S2 = 2 , S3 = 3 , S4 = 4;
reg [2:0] PS,NS ;
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
 NS = S4;
 else
 NS = S1;
 end
 S4 : begin
 if (!P1)
 NS = S0;
 else
 NS = S1;
 end
 
 default: NS = S0;
 
 endcase
 end
 
   always @ (PS)
    begin
    case (PS)
        S0 : z = 0 ;
        S1 : z = 0 ;
        S2 : z = 0 ;
        S3 : z = 0 ;
        S4 : z = 1 ;
        default : z = 0;

 endcase
end
endmodule
/*

module moore(
    input clk,
    input reset,
    input x,
    output reg z
    );
    
    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4;
    reg[2:0] PS, NS;
    
    always @(posedge clk or posedge reset) begin
        if(reset) PS <= S0;
        else      PS <= NS;
        
    end
    
    always @(*) begin 
      NS = S0;
      case(PS)
      
        S0: NS = x ? S1 : S0;
        S1: NS = x ? S2 : S0;
        S2: NS = x ? S2 : S3;    
        S3: NS = x ? S1 : S4;
        S4: NS = x ? S1 : S0;
        default: NS = S0;
        
        endcase
      end
      
        always@(*) begin
        case(PS)
            S4:      z=1;
            default: z = 0;
            endcase
      end
      
endmodule
*/

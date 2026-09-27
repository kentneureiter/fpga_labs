
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 01:55:03 PM
// Design Name: 
// Module Name: lab2file
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


module lab2file(
    input [2:0] s,
    input [7:0] I,
    output Y
 
    );
    
    wire w0, w1, w2, w3, w4, w5, w6, w7, n0, n2, n1;
    
    not (n2, s[2]);
    not (n1, s[1]);
    not (n0, s[0]);
    
    and (w0, n2, n1, n0, I[0]);
    and (w1, n2, n1, s[0], I[1]);
    and(w2, n2, s[1], n0, I[2]);
    and(w3, n2, s[1], s[0], I[3]);
    and(w4, s[2], n1, n0, I[4]);
    and(w5, s[2], n1, s[0], I[5]);
    and(w6, s[2], s[1], n0, I[6]);
    and(w7, s[2], s[1], s[0], I[7]);
    or(Y, w0, w1, w1 , w2, w3, w4, w5, w6, w7);
        
endmodule

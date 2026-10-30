`timescale 1ns / 1ps


module comb_tb;

reg [3:0] a, b;
wire [7:0] o;

comb_multiplier uut( .a(a), .b(b), .o(o));

initial 
begin
#10 a = 4'b0000; b = 4'b0000;
#10 a = 4'b0010; b = 4'b0001;
#10 a = 4'b0100; b = 4'b0010;
#10 a = 4'b0011; b = 4'b0011;
#10 a = 4'b1000; b = 4'b0010;
#10 a = 4'b1001; b = 4'b0010;
#10 $stop;

end
endmodule

`timescale 1ns / 1ps
module Clock_divider_tb;
    reg clock_in;
    wire clock_out;
 
    clock_dvd uut(.clock_in(clock_in), .clock_out(clock_out));
 
    initial begin
        clock_in = 0;
        forever #5 clock_in = ~clock_in;   
    end
 
    initial #200 $finish;
endmodule

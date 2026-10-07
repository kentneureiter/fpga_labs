`timescale 1ns / 1ps
module dff_tb;
    reg clk, d, rstn;
    wire q_sync, q_async;

    // both flip-flops get the SAME inputs so you can compare them
    dff_sync  u_sync (.d(d), .rstn(rstn), .clk(clk), .q(q_sync));
    dff_async u_async(.d(d), .rstn(rstn), .clk(clk), .q(q_async));


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 0; rstn = 0;       
        #12 rstn = 1;          
        #10 d = 1;            
        #20 d = 0;            
        #20 d = 1;            

       
        #10 rstn = 0;          
        #2  rstn = 1;         
        
        #10 rstn = 0;          
        #10 rstn = 1;          
        #20 $finish;
    end
endmodule

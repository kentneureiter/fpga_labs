`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2026 03:05:55 PM
// Design Name: 
// Module Name: ram_tb
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


module ram_tb;
    // inputs to the RAM are reg, the output is wire
  reg        clk;
  reg        we;
  reg  [2:0] addr;
  reg  [7:0] data_in;
  wire [7:0] data_out;
  RAM dut (.clk(clk), .we(we),.addr(addr), .data_in(data_in), .data_out(data_out)
  );

    initial clk = 0;
  always #5 clk = ~clk;
    integer i;
    initial begin
        // write a distinct value to all 8 locations
        we = 1;
        for (i = 0; i < 8; i = i + 1) begin
            addr = i; data_in = 8'hA0 + i; #10;
        end
    
        // read all 8 locations back
        we = 0;
        for (i = 0; i < 8; i = i + 1) begin
            addr = i; #10;
        end
    
        $writememb("ram_dump.txt", dut.memory);
        $finish;
    end
/*
  initial clk = 0;
  always #5 clk = ~clk;
  initial begin

    we = 1;
    addr = 3'd2; data_in = 8'h01; #10;
    addr = 3'd5; data_in = 8'h03; #10;
    addr = 3'd7; data_in = 8'h0A; #10;
    we = 0;
    addr = 3'd2; #10;
    addr = 3'd5; #10;
    addr = 3'd7; #10;

    $writememb("ram_dump.txt", dut.memory);

    we = 0; addr = 0; data_in = 0;

    addr = 3'd2; #10;
    addr = 3'd5; #10;
    addr = 3'd7; #10;
    //addr = 3'd3; #10;
    $finish;
  end
  */
endmodule

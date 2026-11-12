`timescale 1ns / 1ps

module rom_tb;
    // inputs to the ROM are reg, the output is wire
    reg        clk;
    reg        re;
    reg  [2:0] addr;
    wire [3:0] data_out;

    ROM dut (.clk(clk), .re(re), .addr(addr), .data_out(data_out));

    initial clk = 0;
    always #5 clk = ~clk;

    integer i;
    initial begin
        re = 1;
        for (i = 0; i < 8; i = i + 1) begin
            addr = i; #10;
        end

        re = 0;
        addr = 3'd2; #10;
        addr = 3'd5; #10;

        re = 1;
        addr = 3'd5; #10;

        $finish;
    end

endmodule

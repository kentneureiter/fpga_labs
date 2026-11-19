module ROM(
    input clk,
    input re,                 
    input [2:0] addr,         
    output reg [3:0] data_out 
    );

    reg [3:0] memory [0:7];

   
    initial begin
        $readmemb("ram_data.mem", memory);
    end

    always @(posedge clk) begin
        if(re)
            data_out <= memory[addr];
    end

endmodule

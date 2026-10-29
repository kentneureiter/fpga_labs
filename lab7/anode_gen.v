module anode_gen(
    input             clk,
    input             rst,
    input      [15:0] bcd_in,
    output reg [3:0]  anode,
    output reg [3:0]  bcd_val
);

    reg [17:0] count;

    // Refresh counter + anode shift register
    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
            anode <= 4'b1110;
        end
        else begin
            count <= count + 1;
            if (count == 18'h3FFFF)
                anode <= {anode[0], anode[3:1]};
        end
    end

    // 4:1 mux: pick the digit for the active anode
    always @(*) begin
        case (anode)
            4'b1110: bcd_val = bcd_in[3:0];    // ones
            4'b1101: bcd_val = bcd_in[7:4];    // tens
            4'b1011: bcd_val = bcd_in[11:8];   // hundreds
            4'b0111: bcd_val = bcd_in[15:12];  // thousands
            default: bcd_val = 4'b0000;
        endcase
    end

endmodule

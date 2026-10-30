module seq_multiplier(
    input            clk,
    input            rst,
    input            start,
    input      [3:0] a,
    input      [3:0] b,
    output reg [7:0] product,
    output reg       done
);

    reg [7:0] a_reg;   // multiplicand, shifts left
    reg [3:0] b_reg;   // multiplier, shifts right
    reg [1:0] count;   // counts 0..3 (4 iterations)
    reg       busy;

    always @(posedge clk) begin
        if (rst) begin
            product <= 8'd0;
            a_reg   <= 8'd0;
            b_reg   <= 4'd0;
            count   <= 2'd0;
            busy    <= 1'b0;
            done    <= 1'b0;
        end
        else if (start && !busy) begin        // load and begin
            a_reg   <= {4'b0000, a};
            b_reg   <= b;
            product <= 8'd0;
            count   <= 2'd0;
            busy    <= 1'b1;
            done    <= 1'b0;
        end
        else if (busy) begin                  // one shift-add step per clock
            if (b_reg[0])
                product <= product + a_reg;
            a_reg <= a_reg << 1;
            b_reg <= b_reg >> 1;
            count <= count + 2'd1;
            if (count == 2'd3) begin          // that was the 4th step
                busy <= 1'b0;
                done <= 1'b1;
            end
        end
    end

endmodule

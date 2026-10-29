module bin2bcd(
    input             clk,
    input             rst,
    input             en,
    input      [11:0] bin_in,
    output reg        rdy,
    output reg [15:0] bcd_out
);

    parameter IDLE  = 2'b00,
              ADD   = 2'b01,
              SHIFT = 2'b10,
              DONE  = 2'b11;

	reg[3:0] shift_idx;
	reg[1:0] state;
	reg[27:0] shift_reg;

	//state diffraction

	always @(posedge clk)
		begin

		if(rst) begin
			state <= IDLE;
			shift_reg <= 28'b0;
			shift_idx <= 0;
			rdy <= 0;
			bcd_out <= 0;
		end
		else begin //not reset portion
			case(state)
			IDLE : begin
				
rdy <= 0;
if (en) begin 
shift_reg <= {16'b0, bin_in}; 
shift_idx <= 0; 
state <= ADD; 
end	
end
ADD: begin
	if (shift_reg[15:12] > 4) shift_reg[15:12] <= shift_reg[15:12] + 3; 
if (shift_reg[19:16] > 4) shift_reg[19:16] <= shift_reg[19:16] + 3; 
if (shift_reg[23:20] > 4) shift_reg[23:20] <= shift_reg[23:20] + 3; 
if (shift_reg[27:24] > 4) shift_reg[27:24] <= shift_reg[27:24] + 3; state <= SHIFT;
end
SHIFT : begin
				shift_reg <= shift_reg << 1; 
shift_idx <= shift_idx + 1; 
state <= (shift_idx == 11) ? DONE : ADD; //old value 11 = 12thshift	
end
DONE : begin
				bcd_out <= shift_reg[27:12]; 
rdy <= 1; state <= IDLE;	
end
endcase
	end
end

endmodule






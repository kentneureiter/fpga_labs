module comb_multiplier(
    input [3:0] a,
    input [3:0] b,
    output [7:0] o   
   );

wire [3:0] pp0;
wire [4:0] pp1;
wire [5:0] pp2;
wire [6:0] pp3;



assign pp0 = b[0] ? a: 0;
assign pp1 = b[1] ? a<<1: 0;
assign pp2 = b[2] ? a<<2: 0;
assign pp3 = b[3] ? a<<3: 0;

assign o = pp0 + pp1 + pp2 + pp3;


endmodule










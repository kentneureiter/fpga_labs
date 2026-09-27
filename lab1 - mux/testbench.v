
`timescale 1ns/1ps

module lab2file2_tb;
wire Y; //output 
reg [7:0] I;
reg [2:0] s; //input
 
// Instantiate original module (named DUT {device under test}) 
lab2file uut (s,I,Y);
//.s(s),.I(I),.Y(Y)

initial begin 
    
    #10 I=8'b00000001; s=3'b000;
    #10 I=8'b00000010; s=3'b001;
    #10 I=8'b00000100; s=3'b010;
    #10 I=8'b00001000; s=3'b011;
    #10 I=8'b00010000; s=3'b100;
    #10 I=8'b00100000; s=3'b101;
    #10 I=8'b01000000; s=3'b110;
    #10 I=8'b10000000; s=3'b111;
    
    
    
    
   // #10 I[0]=1'b1;I[1]=1'b0;I[2]=1'b0;I[3]=1'b0;I[4]=l'b0;I[5]=1'b0;I[6]=1'b0;I[7]=1'b0;s[2]=1'b0;s[1]=1'b0;s[0]=1'b0;
    
    
    
    
    //#10 I0=1'b0;I1=1'b1;I2=1'b0;I3=1'b0;s2=1'b0;s1=1'b0;s0=1'b1;


	#10 $stop;

end 
endmodule



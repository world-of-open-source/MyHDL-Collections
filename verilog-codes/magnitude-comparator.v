module compare(A,B,y);
input [3:0] A,B;
output [2:0] y;
reg y;
always @(A or B)
if(A==B) y=3’b001; else if(A<B) y=3’b010; else y=3’b100; endmodule

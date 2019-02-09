module universalshiftreg_8(
        input clr,
input clk, input s1,
input s0, input dsr, input dsl, input pn, input [7:0] P,
output reg p1=1’b0, output reg p2=1’b0, output reg p3=1’b0, output reg p4=1’b0, output reg p5=1’b0, output reg p6=1’b0, output reg p7=1’b0, output reg p8=1’b0,
output reg [7:0] q=8’b00000000
);
always@(posedge clk)begin if(clr==0)begin
p1<=0; p2<=0; p3<=0; p4<=0; p5<=0; p6<=0; p7<=0; p8<=0;

q<=8'b00000000;
end
else begin case({s1,s0})
2'b00: begin q<=P;
end

2'b01:begin if(dsr==1)begin q[7:0]<={dsr,P[7:1]}; end
else if(dsr==0)begin q[7:0]<={dsr,P[7:1]}; end
end

2'b10:begin if(dsl==1)begin q[7:0]<={P[6:0],dsl}; end
else if(dsl==0)begin q[7:0]<={P[6:0],dsl}; end
end

2'b11:begin if(pn==1)begin p1<=P[0]; p2<=P[1]; p3<=P[2]; p4<=P[3]; p5<=P[4]; p6<=P[5]; p7<=P[6]; p8<=P[7];

end end endcase end
end endmodule

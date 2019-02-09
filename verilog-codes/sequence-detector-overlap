//DESIGN OF SEQUENCE DETECTOR WITH AND WITHOUT OVERLAPPING USING MEALY STATE MACHINE(with overlap)


module melay_overlap(
input x,
input clk,rst, output reg y
);
reg [2:0] current_state,next_state;
parameter A=3'b000; parameter B=3'b001; parameter C=3'b010; parameter D=3'b011; parameter E=3'b100; always@(posedge clk)begin if(rst)begin
current_state=A;

end
else begin current_state=next_state; end
end
always@(current_state or x)begin case(current_state)
A: begin//----------------------A
if(x==1)begin y=0; next_state=B; end


else if(x==0)begin y=0;
next_state=A;
end end
B:begin//------------------------B
if(x==1)begin y=0; next_state=C; end
else if(x==0)begin y=0;
next_state=A;
end end
C:begin//-------------------------C
if(x==1)begin y=0; next_state=D; end
else if (x==0) begin y=0;
next_state=A;
end end
D:begin//------------------------D
if(x==0)begin y=0; next_state=E; end
else if(x==1) begin y=0;
next_state=D;
end end
3'b100:begin//-------------------------E
if(x==1)begin y=1;
#10; next_state=D; end
else if(x==0) begin y=0;
next_state=A;
end end endcase

endmodule

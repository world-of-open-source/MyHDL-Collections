module bcd_subtractor_9com( input[3:0]a, input[3:0]b,
output wire [3:0] diff, output wire sign);



wire[3:0] b_1,b_2; wire[3:0]s_1,s_2,s_3,a_1,a_2; wire c_out1,c_out2,w1,w2;

assign b_1[0]=b[0]^1'b1; assign b_1[1]=b[1]^1'b1; assign b_1[2]=b[2]^1'b1; assign b_1[3]=b[3]^1'b1;

bcd_add u1(.A(4'b1010),.B(b_1),.c_in(1'b0),.sum(s_1),.carry()); bcd_add u2(.A(a),.B(s_1),.c_in(1'b0),.sum(s_2),.carry(c_out1)); and_g a1(.A(s_2[3]),.B(s_2[2]),.C(w1));
and_g a2(.A(s_2[3]),.B(s_2[1]),.C(w2));
or_g o1(.A(w1),.B(w2),.C(c_out1),.O(c_out2));
assign a_1={1'b0,c_out2,c_out2,1'b0};
bcd_add u3(.A(a_1),.B(s_2),.c_in(1'b0),.sum(s_3),.carry());
assign sign=~c_out2;
assign a_2={sign,1'b0,sign,1'b0};
assign b_2[0]=s_3[0]^sign; assign b_2[1]=s_3[1]^sign; assign b_2[2]=s_3[2]^sign; assign b_2[3]=s_3[3]^sign;
bcd_add u4(.A(a_2),.B(b_2),.c_in(c_out2),.sum(diff),.carry());
endmodule

module bcd_adder(sum,output_carry,addend,augend,carry_in);
output  [3:0] sum; output output_carry; input [3:0] addend; input [3:0] augend; input carry_in;
wire [3:0] z_addend;
wire carry_out;
wire c_out;
wire [3:0] z_sum;
adder_4bit m0(carry_out,z_sum,addend,augend,carry_in);
and (w1,z_sum[3],z_sum[2]);
and (w2,z_sum[3],z_sum[1]);
assign z_addend={1’b0,output_carry,output_carry,1’b0); or(output_carry,carry_out,w1,w2); adder_4bit(c_out,sum,z_addend,z_sum,1’b0); or(c_out,carry_out,c_out);
endmodule



module adder_4bit(carry,sum,a,b,cin);
output carry; input [3:0] sum; input [3:0] a,b; input c_in;
assign {carry,sum}=a+b+cin;
endmodule

//array multiplication-unsigned number multiplier(4 bit)

module arraymultiplierunsigned(
input [3:0] a, input [3:0] b,
output wire [7:0] product
);

wire p0,p1,p2,p3,p4,p5,p6,p7;
wire r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15;
wire c1,c2,c3,c4;
wire q1,q2,q3,q4,q5,q6;
wire s1,s2;
wire c11,c22,c33,c44,c55;
and1 a1(.x(a[0]),.y(b[0]), .w(p0)); and1 a2(.x(a[1]),.y(b[0]), .w(r1)); and1 a3(.x(a[0]),.y(b[1]), .w(r2)); and1 a4(.x(a[0]),.y(b[2]), .w(r3)); and1 a5(.x(a[1]),.y(b[1]), .w(r4)); and1 a6(.x(a[2]),.y(b[0]), .w(r5)); and1 a7(.x(a[0]),.y(b[3]), .w(r6)); and1 a8(.x(a[1]),.y(b[2]), .w(r7)); and1 a9(.x(a[2]),.y(b[1]), .w(r8)); and1 a10(.x(a[3]),.y(b[0]), .w(r9)); and1 a11(.x(a[1]),.y(b[3]), .w(r10)); and1 a12(.x(a[2]),.y(b[2]), .w(r11)); and1 a13(.x(a[3]),.y(b[1]), .w(r12)); and1 a14(.x(a[2]),.y(b[3]), .w(r13)); and1 a15(.x(a[3]),.y(b[2]), .w(r14)); and1 a16(.x(a[3]),.y(b[3]), .w(r15)); ha h1(.e(r1),.f(r2),.g(p1),.h(c1));
ha h2(.e(r3),.f(r4),.g(s1),.h(c2));
ha h3(.e(r6),.f(r7),.g(s2),.h(c3));
ha h4(.e(q3),.f(c22),.g(p4),.h(c4));
fa i1(.j(r5),.k(s1),.l(c1),.m(p2),.n(c11));
fa i2(.j(r8),.k(s2),.l(c2),.m(q1),.n(c33));
fa i3(.j(r9),.k(q1),.l(c11),.m(p3),.n(c22));
fa i4(.j(r11),.k(r10),.l(c3),.m(q2),.n(q4));
fa i5(.j(r12),.k(q2),.l(c33),.m(q3),.n(c44)); fa i6(.j(r14),.k(r13),.l(q4),.m(q5),.n(q6)); fa i7(.j(q5),.k(c44),.l(c4),.m(p5),.n(c55)); fa i8(.j(r15),.k(q6),.l(c55),.m(p6),.n(p7));

assign product[0]=p0; assign product[1]=p1; assign product[2]=p2; assign product[3]=p3; assign product[4]=p4; assign product[5]=p5; assign product[6]=p6; assign product[7]=p7; endmodule



module and1(input x, input y,
output wire w);

assign w=x*y;
endmodule

module ha(input e, input f,
output wire g, output wire h);

assign g=e^f; assign h=e*f; endmodule

module fa (input j, input k,
input l,
output wire m, output wire n);

assign m=j^k^l;
assign n=(j*k)+(k*l)+(j*l);
endmodule

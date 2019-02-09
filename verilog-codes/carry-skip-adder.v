module CSA_task(Sum,Cout,A,B,Cin);
output reg [7:0] Sum;
output reg Cout; input [7:0] A,B;
input Cin;
reg w1;
always @ (A or B or in)
begin
CSA_4bit (Sum[3:0],w1,A[3:0],B[3:0],Cin); CSA_4bit (Sum[7:4],Cout,A[7:4],B[7:4],w1); end
task  CSA_4bit; output [3:0] sum; output cout;
input [3:0] a,b;
input cin;
reg [3:0] c,g,p;
reg sel; begin c[0]=cin;
sum[0]=a[0]^b[0]^c[0]; g[0]=a[0]&b[0]; p[0]=a[0]|b[0]; c[1]=g[0] | (p[0]&c[0]); sum[1]=a[1]^b[1]^c[1]; g[1]=a[1]&b[1]; p[1]=a[1]|b[1];
c[2]=g[1] | (p[1]&(g[0] | (p[0]&c[0]))); sum[2]=a[2]^b[2]^c[2]; g[2]=a[2]&b[2];
p[2]=a[2]|b[2];
c[3]=g[2] | (p[2]&(g[1] | (p[1]&(g[0] | (p[0]&c[0])))));
sum[3]=a[3]^b[3]^c[3]; g[3]=a[3]&b[3]; p[3]=a[3]|b[3];
cout=g[3] | (p[3]&(g[2] | (p[2]&(g[1] | (p[1]&(g[0] | (p[0]&c[0])))))));

sel=(p[0]&p[1]&p[2]&p[3]);
if(sel) cout<=cout; else cout<=cin; end
endtask endmodule

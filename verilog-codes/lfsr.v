LFSR(Linear feedback Shift register)

module lfsr_1(output reg[3:0]  out=4'b0000, input clk,
input rst,
input [3:0] A
);

wire feedback;

assign feedback = (A[3] ^ A[2]);
always @(posedge clk, posedge rst)
begin
if (rst)
out <= A;
else

out <= {A[3:1],feedback};
end endmodule

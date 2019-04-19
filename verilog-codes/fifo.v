//FIFO(first in first out)

module fifodesign(clk,rst,wr,rd,din,dout,empty,full);
input clk,rst; 
input wr,rd; 
input [3:0] din;
  
output reg [3:0] dout;
output empty,full; 
  
reg [3:0] mem [0:7];
wire [3:0] wrptr,rdptr;
reg [3:0] bwrptr,brdptr; 
  
always@(posedge clk) begin
if(wr)
mem[wrptr] <= din;
end
  
always@(posedge clk)
begin if(rd)
dout <= mem[rdptr];
end
  
assign empty = wrptr == rdptr;
assign full = ((wrptr[3] != rdptr[3]) && (wrptr[2] != rdptr[2]) &&(wrptr[1:0] ==
rdptr[1:0]));
  
always@(posedge clk) begin
if(rst)
begin
bwrptr <=0; brdptr <=0; end
else if(wr && ~full)
begin
bwrptr <= bwrptr + 1;
end else
bwrptr <= bwrptr;
end

always@(posedge clk)
begin if(rst) begin
brdptr <=0;
end
else if(rd && ~empty)
begin
brdptr <= brdptr + 1;
end else
brdptr <= brdptr;
end

assign wrptr = {bwrptr[3],bwrptr[3] ^ bwrptr[2],bwrptr[2] ^ bwrptr[1],bwrptr[1] ^
bwrptr[0]};
assign rdptr = {brdptr[3],brdptr[3] ^ brdptr[2],brdptr[2] ^ brdptr[1],brdptr[1] ^ brdptr[0]};
endmodule

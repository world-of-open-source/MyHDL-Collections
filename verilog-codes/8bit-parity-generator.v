module paritygen_8( input [7:0] d, output y,
output [8:0] dout
);
wire y0,y1,y2,y3; assign y0=d[0]^d[1]; assign y1=d[2]^d[3]; assign y2=d[4]^d[5]; assign y3=d[6]^d[7]; assign y=y0^y1^y2^y3; assign dout={d,y};



endmodule

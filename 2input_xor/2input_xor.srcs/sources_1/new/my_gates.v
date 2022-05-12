`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/12 15:30:47
// Design Name: 
// Module Name: my_gates
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module my_gates(c1,c2,c3,a,b);
output c1,c2,c3;
input a,b;

//my_or
wire a1,b1;
nand(a1,a,a);
nand(b1,b,b);
nand my_or(c1,a1,b1);

//my_and
wire e;
nand(e,a,b);
nand my_and(c2,e,e);
//my_not
nand my_not(c3,a,a);

endmodule

module my_xor(z,x,y);
output z;
input x,y;

wire x_n,y_n,x_ny,y_nx;

//~x
my_gates notx(.c3(x_n),.a(x));
//~y
my_gates noty(.c3(y_n),.a(y));
//~xy
my_gates notxy(.c2(x_ny),.a(x_n),.b(y));
//~yx
my_gates xnoty(.c2(xy_n),.a(x),.b(y_n));
//z
my_gates result(.c1(z),.a(x_ny),.b(xy_n));

endmodule

//stimulus

module stimulus;
reg x,y;
wire z;
//xorgate라는 xor게이트 파생
my_xor xorgate(z,x,y);
initial
begin
    $monitor($time, "x=%b, y=%b, z=%b\n",x,y,z);
 end
initial
begin
    x=1'b0; y=1'b0;
    #10 x=1'b0; y=1'b1;
    #10 x=1'b1; y=1'b0;
    #10 x=1'b1; y=1'b1;
end
endmodule
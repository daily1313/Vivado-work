`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/03 14:12:49
// Design Name: 
// Module Name: fulladd
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


module fulladd(sum,c_out,a,b,c_in);
output sum,c_out;
input a,b,c_in;

wire s1,c1,c2;

xor(s1,a,b);
and(c1,a,b);

xor(sum, s1,c_in);
and(c2,s1,c_in);

xor(c_out,c2,c1);
endmodule

module fulladd8(sum,c_out,a,b,c_in);

output[7:0] sum;
output c_out;
input[7:0] a,b;
input c_in;

wire c1,c2,c3,c4,c5,c6;

fulladd fa0(sum[0],c1,a[0],b[0],c_in);
fulladd fa1(sum[1],c2,a[1],b[1],c1);
fulladd fa2(sum[2],c3,a[2],b[2],c2);
fulladd fa3(sum[3],c4,a[3],b[3],c3);
fulladd fa4(sum[4],c5,a[4],b[4],c4);
fulladd fa5(sum[5],c6,a[5],b[5],c5);
fulladd fa6(sum[6],c7,a[6],b[6],c6);
fulladd fa7(sum[7],c_out,a[7],b[7],c7);
endmodule

module stimulus;

reg[7:0] A,B;
reg C_IN;

wire [7:0] SUM;
wire C_OUT;

fulladd8 fa1_8(SUM,C_OUT,A,B,C_IN);

initial
begin
    $monitor($time,"A = %b, B= %d, C_IN = %b,---C_OUT = %b, SUM = %b\n",A,B,C_IN,C_OUT,SUM);
end

initial
begin
    A=8'd0; B=8'd0; 
    C_IN=1'b0;
    #5 A = 8'd3; B = 8'd4;
    #5 A = 8'd2; B = 8'd5;
    #5 A = 8'd9; B = 8'd9;
    #5 A = 8'd125; B = 8'd200;
    #5 A = 8'd255; B = 8'd255; C_IN = 1'b1;
    #20 $stop;
end
endmodule
    


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/08 16:29:54
// Design Name: 
// Module Name: SR_latch
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


module SR_latch(Q,Qbar,Sbar,Rbar); 
output Q,Qbar;
input Sbar, Rbar;

nand n1(Q, Sbar, Qbar);
nand n2(Qbar,Rbar,Q);



endmodule

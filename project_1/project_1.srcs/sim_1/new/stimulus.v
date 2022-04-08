`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/08 16:43:06
// Design Name: 
// Module Name: stimulus
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


module stimulus();
wire q,qbar;
reg set, reset;

SR_latch m1(q,qbar,set,reset);

initial
begin
    $monitor($time, " set = %b, reset = %b, q = %b\n",set,reset,q);
    set = 0; reset = 0;
    
    #5 reset = 1; #5 reset = 1; 
    #0 reset = 0;
    #5 set = 1;
end
endmodule

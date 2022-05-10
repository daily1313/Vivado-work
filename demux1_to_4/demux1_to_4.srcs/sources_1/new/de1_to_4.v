`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/05/10 15:16:58
// Design Name: 
// Module Name: de1_to_4
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


module de1_to_4(o0,o1,o2,o3,s1,s0,in);

output o0,o1,o2,o3;
input s1,s0,in;

wire s1n,s0n;

not(s1n,s1);
not(s0n,s0);

and(o0,in,s1n,s0n);
and(o1,in,s1n,s0);
and(o2,in,s1,s0n);
and(o3,in,s1,s0);

endmodule

module stimulus;

reg S1,S0,IN;

wire O0,O1,O2,O3;

de1_to_4 demymux(O0,O1,O2,O3,S0,S1,IN);

initial
begin
    IN = 1;
    #1  $display("O0 = %b, O1 = %b, O2 = %b, O3 = %b\n",O0,O1,O2,O3);
    
    S1=0; S0=0;
    #1 $display("S0 = %b, S1= %b, O0 = %b, O1 = %b, O2 = %b, 03 = %b\n",S0,S1,O0,O1,O2,O3);
    
    S1=0; S0=1;
    #1 $display("S0 = %b, S1= %b, O0 = %b, O1 = %b, O2 = %b, 03 = %b\n",S0,S1,O0,O1,O2,O3);
        
    S1=1; S0=0;
    #1 $display("S0 = %b, S1= %b, O0 = %b, O1 = %b, O2 = %b, 03 = %b\n",S0,S1,O0,O1,O2,O3);
    
    S1=1; S0=1;
    #1 $display("S0 = %b, S1= %b, O0 = %b, O1 = %b, O2 = %b, 03 = %b\n",S0,S1,O0,O1,O2,O3);

end
endmodule

`timescale 1ns / 1ps
module tb;
   reg clk;
   reg [0:31] A;
   reg [0:31] X;
   wire [0:31] Aout;
   integer nr=10,nq=10,np=10;
 
 doitgen uut(.A(A),.X(X),.Aout(Aout),clk,nr,nq,np);  
 
  
    initial begin
        clk=0;
          // Apply Inputs
          A = 0;  X = 0;  #100;
          A = {8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
          B = {8'd9,8'd10,8'd11,8'd12};
      end
     
     
endmodule

`timescale 1ns / 1ps
module doitgen(
    input [0:31] A,
    input [0:31] X,
    output[0:31] Aout,
    input clk=0,
    input nr,nq,np);
    
   reg[31:0] Aout;
   reg [7:0]A1[0:10][0:10][0:10];
   reg [7:0]X1[0:10][0:10]; 
   reg [7:0]Aout1[0:10][0:10][0:10];
   integer p,q,r,s;  
  
always @(posedge clk)     
begin
  {A1[0][0][0],A1[0][0][1],A1[0][1][0],A1[0][1][1],A1[1][0][0],A1[1][0][1],A1[1][1][0],A1[1][1][1]} = A;
  {X1[0][0],X1[0][1],X1[1][0],X1[1][1]} = X;
        p = 0;
        q = 0;
        r = 0;
        s = 0;
        {Aout1[0][0][0],Aout1[0][0][1],Aout1[0][1][0],Aout1[0][1][1],Aout1[1][0][0],Aout1[1][0][1]
        ,Aout1[1][1][0],Aout1[1][1][1]} = 32'd0; 
        for(r=0;r<nr;r=r+1) begin
                    for(q=0;q<nq;q=q+1)
                     begin
                        for(p=0;p<np;p=p+1)
                         begin
                            for(s=0;s<np;s=s+1)
                             begin
                                Aout1[r][q][p] = Aout1[r][q][p] + (A1[r][q][s] * X1[s][p]);
                             end
                         end
                            
                            for (p=0;p<np;p=p+1)
                             begin
                                 A1[r][q][p] = Aout1[r][q][p];
                             end
                        end
                      end                        //final output assignment - 3D array to 1D array conversion.            
                            Aout= {A1[0][0][0],A1[0][0][1],A1[0][1][0],A1[0][1][1]
                            ,A1[1][0][0],A1[1][0][1],A1[1][1][0],A1[1][1][1]};         
            end        
endmodule

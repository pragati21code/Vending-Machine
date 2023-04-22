
module vending(d,n,q, reset, clk, y);
output reg y;
input d,n,q;    //n=5,d=10,q=25;
input clk;
input reset;
reg [2:0] cst, nst;
parameter S0 = 3'b000,
          S1 = 3'b001,
          S2 = 3'b010,
          S3 = 3'b100,
              S4 = 3'b101,
              S5 = 3'b110,
              S6 = 3'b111;
always @(cst or d or n or q)
 begin
 case (cst)
   S0: if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst = S1;
             y=1'b0;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S2;
            y=1'b0;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S5;
            y=1'b0;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
   S1: if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst = S2;
             y=1'b0;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S3;
            y=1'b0;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S6;
            y=1'b0;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
   S2:if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst = S3;
             y=1'b0;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S4;
            y=1'b0;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S0;
            y=1'b1;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
   S3: if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst = S4;
             y=1'b0;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S5;
            y=1'b0;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S0;
            y=1'b1;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
S4: if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst = S5;
             y=1'b0;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S6;
            y=1'b0;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S0;
            y=1'b1;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
S5: if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst = S6;
             y=1'b0;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S0;
            y=1'b1;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S0;
            y=1'b1;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
S6: if (n== 1'b1 && d==1'b0 && q==1'b0)
            begin
         nst =S0;
             y=1'b1;
            end
      else if(n== 1'b0 && d==1'b1 && q==1'b0)
            begin
            nst=S0;
            y=1'b1;
            end
            else if(n== 1'b0 && d==1'b0 && q==1'b1)
            begin
            nst=S0;
            y=1'b1;
            end
             else
            begin
            nst = cst;
            y=1'b0;
            end
                       
   default: nst = S0;
  endcase
end
always@(posedge clk) //or posedge reset)
begin
 if (reset)
   cst <= S0;
 else
   cst <= nst;
end
endmodule

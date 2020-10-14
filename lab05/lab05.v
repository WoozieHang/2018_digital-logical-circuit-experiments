module lab05(clk,clk_1s,count_clk,start,clr,a,b,light,out_numa,out_numb);
input clk;
output reg clk_1s;
output reg [24:0]count_clk;
input start;
input clr;
output reg [3:0]a;//BCD 
output reg [3:0]b;
output reg light;
output reg[6:0]out_numa;
output reg[6:0]out_numb;

initial
begin
clk_1s=0;
count_clk=0;
a=0;
b=0;
end

always @(posedge clk)
if(count_clk==25000000)
begin
count_clk <=0;
clk_1s <= ~clk_1s;
end
else
count_clk <= count_clk+1;

always@(posedge clk_1s)
if(clr==1)
begin
a<=0;
b<=0;
light<=0;
end

else if(start==0)
begin
end

else if(b==9&&a==9)
begin
b<=0;
a<=0;
light<=1;
end

else if(b==9)
begin
b<=0;
a<=a+1;
end

else if(b==0&&a==0)
begin
b<=b+1;
light=0;
end

else
b<=b+1;

always@(a)
if(a==0)
out_numa=7'b1000000;
else if(a==1)
out_numa=7'b1111001;
else if(a==2)
out_numa=7'b0100100;
else if(a==3)
out_numa=7'b0110000;
else if(a==4)
out_numa=7'b0011001;
else if(a==5)
out_numa=7'b0010010;
else if(a==6)
out_numa=7'b0000010;
else if(a==7)
out_numa=7'b1111000;
else if(a==8)
out_numa=7'b0000000;
else if(a==9)
out_numa=7'b0010000;

always@(b)
if(b==0)
out_numb=7'b1000000;
else if(b==1)
out_numb=7'b1111001;
else if(b==2)
out_numb=7'b0100100;
else if(b==3)
out_numb=7'b0110000;
else if(b==4)
out_numb=7'b0011001;
else if(b==5)
out_numb=7'b0010010;
else if(b==6)
out_numb=7'b0000010;
else if(b==7)
out_numb=7'b1111000;
else if(b==8)
out_numb=7'b0000000;
else if(b==9)
out_numb=7'b0010000;
endmodule


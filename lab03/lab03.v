module lab03(a,b,choice,result,CF,OF,ZF);
input [3:0]a;
input [3:0]b;
input [2:0]choice;
output reg[3:0]result;
output  reg CF;
output reg OF;
output reg ZF;

always@(a or b or choice)
case(choice)

3'b111:
begin 
{CF,result}=a+b;OF=(a[3]==b[3])&&(result[3]!=a[3]);if(result==0)ZF=0;else ZF=1;
end

3'b110:
 begin 
 {CF,result}=a+~b+1;OF=(a[3]!=b[3])&&(a[3]!=result[3]);if(result==0)ZF=0;else ZF=1;
 end
 
3'b101:	
begin 
result=~a;OF=0;CF=0;if(result==0)ZF=0;else ZF=1;
end

3'b100:	
begin 
result=a&b;OF=0;CF=0;if(result==0)ZF=0;else ZF=1;
end

3'b011:  
begin 
result=a|b;OF=0;CF=0;if(result==0)ZF=0;else ZF=1;
end

3'b010: 
begin 
result=a^b;OF=0;CF=0;if(result==0)ZF=0;else ZF=1;
end

3'b001:
begin 
if((a[3]==0&&b[3]==1)||(a+~b+1<8&&a!=b))result=1;else result=0;OF=0;CF=0;if(result==0)ZF=0;else ZF=1;
end 

3'b000:
begin 
if(a==b) result=2'b0001;else result=2'b0000;OF=0;CF=0;if(result==0)ZF=0;else ZF=1;
end

endcase

endmodule
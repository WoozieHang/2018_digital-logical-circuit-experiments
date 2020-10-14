module exp04(output reg a,output reg c,input d,input clk,input reset);
always@(posedge clk or posedge reset)
begin
if(reset)
a<=0;
else
a<=d;
end

always@(posedge clk )
begin
if(reset)
c<=0;
else
c<=d;
end

endmodule

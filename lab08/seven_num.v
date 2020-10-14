module seven_num(clk,dout,num,en);
input clk;
input [3:0]dout;
input en;
output reg [6:0]num;

always @(posedge clk)
begin
if(en)
begin
case (dout)
4'b0000: num<=7'b1000000;
4'b0001: num<=7'b1111001;
4'b0010: num<=7'b0100100;
4'b0011: num<=7'b0110000;
4'b0100: num<=7'b0011001;
4'b0101: num<=7'b0010010;
4'b0110: num<=7'b0000010;
4'b0111: num<=7'b1111000;
4'b1000: num<=7'b0000000;
4'b1001: num<=7'b0010000;
4'b1010: num<=7'b0001000;
4'b1011: num<=7'b0000011;
4'b1100: num<=7'b1000110;
4'b1101: num<=7'b0100001;
4'b1110: num<=7'b0000110;
4'b1111: num<=7'b0001110;
endcase
end

else
begin
num<=7'b1111111;
end
end
endmodule

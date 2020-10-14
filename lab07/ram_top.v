module ram_top(clk, we, inaddr, dout1,dout2,din,num1,num2,num3,num4);
input clk;
input we;
input [3:0] inaddr;
input [7:0] din;
output [7:0]dout1;
output [7:0]dout2;
output reg[6:0]num1;
output reg[6:0]num2;
output reg[6:0]num3;
output reg[6:0]num4;

ram2_port my_ram2(
.clock(clk),
.data(din),
.rdaddress(inaddr),
.wraddress(inaddr),
.wren(we),
.q(dout2)
);


ram1 my_ram1(
.clk(clk),
.din(din),
.inaddr(inaddr),
.we(we),
.dout(dout1)
);

always @(posedge clk)
begin
case (dout1%16)
4'b0000: num1<=7'b1000000;
4'b0001: num1<=7'b1111001;
4'b0010: num1<=7'b0100100;
4'b0011: num1<=7'b0110000;
4'b0100: num1<=7'b0011001;
4'b0101: num1<=7'b0010010;
4'b0110: num1<=7'b0000010;
4'b0111: num1<=7'b1111000;
4'b1000: num1<=7'b0000000;
4'b1001: num1<=7'b0010000;
4'b1010: num1<=7'b0001000;
4'b1011: num1<=7'b0000011;
4'b1100: num1<=7'b1000110;
4'b1101: num1<=7'b0100001;
4'b1110: num1<=7'b0000110;
4'b1111: num1<=7'b0001110;
endcase

case(dout1/16)
4'b0000: num2<=7'b1000000;
4'b0001: num2<=7'b1111001;
4'b0010: num2<=7'b0100100;
4'b0011: num2<=7'b0110000;
4'b0100: num2<=7'b0011001;
4'b0101: num2<=7'b0010010;
4'b0110: num2<=7'b0000010;
4'b0111: num2<=7'b1111000;
4'b1000: num2<=7'b0000000;
4'b1001: num2<=7'b0010000;
4'b1010: num2<=7'b0001000;
4'b1011: num2<=7'b0000011;
4'b1100: num2<=7'b1000110;
4'b1101: num2<=7'b0100001;
4'b1110: num2<=7'b0000110;
4'b1111: num2<=7'b0001110;
endcase

case (dout2%16)
4'b0000: num3<=7'b1000000;
4'b0001: num3<=7'b1111001;
4'b0010: num3<=7'b0100100;
4'b0011: num3<=7'b0110000;
4'b0100: num3<=7'b0011001;
4'b0101: num3<=7'b0010010;
4'b0110: num3<=7'b0000010;
4'b0111: num3<=7'b1111000;
4'b1000: num3<=7'b0000000;
4'b1001: num3<=7'b0010000;
4'b1010: num3<=7'b0001000;
4'b1011: num3<=7'b0000011;
4'b1100: num3<=7'b1000110;
4'b1101: num3<=7'b0100001;
4'b1110: num3<=7'b0000110;
4'b1111: num3<=7'b0001110;
endcase

case(dout2/16)
4'b0000: num4<=7'b1000000;
4'b0001: num4<=7'b1111001;
4'b0010: num4<=7'b0100100;
4'b0011: num4<=7'b0110000;
4'b0100: num4<=7'b0011001;
4'b0101: num4<=7'b0010010;
4'b0110: num4<=7'b0000010;
4'b0111: num4<=7'b1111000;
4'b1000: num4<=7'b0000000;
4'b1001: num4<=7'b0010000;
4'b1010: num4<=7'b0001000;
4'b1011: num4<=7'b0000011;
4'b1100: num4<=7'b1000110;
4'b1101: num4<=7'b0100001;
4'b1110: num4<=7'b0000110;
4'b1111: num4<=7'b0001110;
endcase
end
endmodule


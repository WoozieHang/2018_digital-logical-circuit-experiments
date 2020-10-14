module lab06(control,out_light,set,clk,put_in,numa,numb);
input [3:0]control;
output reg [7:0]out_light;
input [7:0]set;
input clk;
input put_in;
output reg[6:0]numa;
output reg[6:0]numb;
always@(posedge clk)
begin
if(control==0)
out_light<=0;
else if(control==1)
out_light<=set;
else if(control==2)
begin
out_light<={1'b0,out_light[7:1]};
end
else if(control==3)
begin
out_light<={out_light[6:0],1'b0};
end
else if(control==4)
begin
out_light<={out_light[7],out_light[7:1]};
end
else if(control==5)
begin
out_light<={put_in,out_light[7:1]};
end
else if(control==6)
begin
out_light<={out_light[0],out_light[7:1]};
end
else if(control==7)
begin
out_light<={out_light[6:0],out_light[7]};
end
else if(out_light!=0)
begin
out_light<={out_light[6:0],out_light[4]^out_light[3]^out_light[2]^out_light[0]};
end
else out_light[0]<=1;
//0
case (out_light%16)
4'b0000: numb<=7'b1000000;
4'b0001: numb<=7'b1111001;
4'b0010: numb<=7'b0100100;
4'b0011: numb<=7'b0110000;
4'b0100: numb<=7'b0011001;
4'b0101: numb<=7'b0010010;
4'b0110: numb<=7'b0000010;
4'b0111: numb<=7'b1111000;
4'b1000: numb<=7'b0000000;
4'b1001: numb<=7'b0010000;
4'b1010: numb<=7'b0001000;
4'b1011: numb<=7'b0000011;
4'b1100: numb<=7'b1000110;
4'b1101: numb<=7'b0100001;
4'b1110: numb<=7'b0000110;
4'b1111: numb<=7'b0001110;
endcase
case(out_light/16)
4'b0000: numa<=7'b1000000;
4'b0001: numa<=7'b1111001;
4'b0010: numa<=7'b0100100;
4'b0011: numa<=7'b0110000;
4'b0100: numa<=7'b0011001;
4'b0101: numa<=7'b0010010;
4'b0110: numa<=7'b0000010;
4'b0111: numa<=7'b1111000;
4'b1000: numa<=7'b0000000;
4'b1001: numa<=7'b0010000;
4'b1010: numa<=7'b0001000;
4'b1011: numa<=7'b0000011;
4'b1100: numa<=7'b1000110;
4'b1101: numa<=7'b0100001;
4'b1110: numa<=7'b0000110;
4'b1111: numa<=7'b0001110;
endcase
end
endmodule


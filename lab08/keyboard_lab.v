module keyboard_lab(countnum1,countnum2,assicnum1,assicnum2,buttonnum1,buttonnum2,clk,ps2_clk,ps2_data);
input clk,ps2_clk,ps2_data;
reg nextdata_n;
reg[7:0]count;
reg [1:0]state;
reg en;
wire [7:0]assic;
wire [7:0]buttonword;
reg [7:0]code;
output [6:0]countnum1;
output [6:0]countnum2;
output [6:0]assicnum1;
output [6:0]assicnum2;
output [6:0]buttonnum1;
output [6:0]buttonnum2;
wire ready;
wire overflow;
reg clrn;
parameter S0 = 0, S1 = 1, S2 = 2;

initial
begin
nextdata_n=0;
clrn=0;
count=0;
state=S0;
end

seven_num seven_num11(
.clk(clk),
.dout(code[3:0]),
.num(buttonnum1),
.en(en)
);
seven_num seven_num12(
.clk(clk),
.dout(code[7:4]),
.num(buttonnum2),
.en(en)
);


seven_num seven_num21(
.clk(clk),
.dout(assic[3:0]),
.num(assicnum1),
.en(en)
);

seven_num seven_num22(
.clk(clk),
.dout(assic[7:4]),
.num(assicnum2),
.en(en)
);

seven_num seven_num31(
.clk(clk),
.dout(count[3:0]),
.num(countnum1),
.en(1'b1)
);
seven_num seven_num32(
.clk(clk),
.dout(count[7:4]),
.num(countnum2),
.en(1'b1)
);

button_to_assic b_to_a(
.clk(clk),
.buttonword(code),
.assic(assic)
);


ps2_keyboard ps2keyboard(
.clk(clk),
.clrn(clrn),
.ps2_clk(ps2_clk),
.ps2_data(ps2_data),
.data(buttonword),
.ready(ready),
.nextdata_n(nextdata_n),
.overflow(overflow)
);


always@(posedge clk)
begin

	if(overflow==1)
		clrn<=0;
	else clrn<=1;

	if(ready==1) begin
		case(state)
			S0:
				if(buttonword!=8'hF0&&buttonword!=8'h00) begin 
					code<=buttonword; 
					state<=S1;
					count<=count+1;
					en<=1;
				end
			S1:
				if(buttonword==8'hF0)begin 
					state<=S2;
					en<=0;
				end
			S2: 
				state<=S0;
		endcase
		nextdata_n<=1;
	end

	else
		nextdata_n<=0;

end

endmodule



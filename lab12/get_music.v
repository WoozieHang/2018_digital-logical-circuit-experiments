module get_music(
clk,
dataout,
reset,
pause,
speed_level,
mode,
pass,
which_song,
index,
jmpr,
jmpl,
datain,
record,
whether_record,
whether_pause
);
input [6:0]datain;

input [1:0]speed_level;
input [1:0]mode;
input clk;
output reg [7:0] dataout;

input reset;
reg last_reset;
reg whether_reset;
reg finish_reset;

input pause;
reg last_pause;
output reg whether_pause;

input pass;
reg last_pass;
reg whether_pass;
reg finish_pass;

input jmpr;
reg last_jmpr;
reg whether_jmpr;
reg finish_jmpr;

input jmpl;
reg last_jmpl;
reg whether_jmpl;
reg finish_jmpl;

input record;
reg last_record;
output reg whether_record;
reg [10:0]last_redex;
reg [10:0]redex;
reg [10:0]recordlong;
reg clk_record;
reg[25:0]count_record;
reg [3:0]record_state;


reg [25:0] count_clk;
reg clk_song;
output reg [10:0]index;
output reg [1:0]which_song;
(* ram_init_file = "littleStars.mif" *) reg [7:0] music0[400:0];
(* ram_init_file = "river.mif" *) reg [7:0] music1 [512:0];
(* ram_init_file = "Edelweiss.mif" *) reg [7:0] music2 [256:0];
 reg [7:0] music3 [471:0];
 

always @(posedge clk)
begin
//前跳状态机
	last_jmpl<=jmpl;
	if(last_jmpl==0&&jmpl==1)
	whether_jmpl<=1;
	else if(finish_jmpl==1)
	whether_jmpl<=0;
//后跳功能状态机
	last_jmpr<=jmpr;
	if(last_jmpr==0&&jmpr==1)
	whether_jmpr<=1;
	else if(finish_jmpr==1)
	whether_jmpr<=0;

//切歌功能状态机
	last_pass<=pass;
	if(last_pass==0&&pass==1)
	whether_pass<=1;
	else if(finish_pass==1)
	whether_pass<=0;
//重播功能状态机
	last_reset<=reset;
	if(last_reset==0&&reset==1)
	whether_reset<=1;
	else if(finish_reset==1)
	whether_reset<=0;
//暂停功能
last_pause<=pause;
if(last_pause==0&&pause==1)
whether_pause<=~whether_pause;

//录音功能
last_redex<=redex;
last_record<=record;
if(last_record==0&&record==1)
begin
	whether_record<=~whether_record;
	if(whether_record==0)
	begin
			record_state=1;//开启录音机
			recordlong<=0;
	end
	else 
	begin
		recordlong<=redex;
		record_state<=2;//关闭录音机
	end
end
if(last_redex!=0&&redex==0)
	record_state<=0;//redex归零，恢复正常模式

	
	
//正常模式的发声
	if(whether_pause==0&&whether_record==0)
	begin
	case(which_song)
	2'b00:dataout <= music0[index[10:0]];
	2'b01:dataout<=music1[index[10:0]];
	2'b10:dataout<=music2[index[10:0]];
	2'b11:dataout<=music3[index[10:0]];
	endcase
	end
//录音模式的声音
	else if(whether_record==1)
	begin
		case(datain)
		7'b0000001:dataout<=8'h17;
		7'b0000010:dataout<=8'h16;
		7'b0000100:dataout<=8'h15;
		7'b0001000:dataout<=8'h14;
		7'b0010000:dataout<=8'h13;
		7'b0100000:dataout<=8'h12;
		7'b1000000:dataout<=8'h11;
		default:dataout<=8'h00;
		endcase
	end
	
	else dataout<=0;
	
	//分频clk_song
	if(speed_level==2'b11&&count_clk==781250&&which_song!=2'b11)
		begin
			count_clk <=0;
			clk_song <= ~clk_song;
		end
	else if(speed_level==2'b10&&count_clk==1562500&&which_song!=2'b11)
	begin
			count_clk <=0;
			clk_song <= ~clk_song;
	end
	else if(speed_level==2'b01&&count_clk==3125000&&which_song!=2'b11)
		begin
			count_clk <=0;
			clk_song <= ~clk_song;
		end
	else if(speed_level==2'b00&&count_clk==6250000&&which_song!=2'b11)
	begin
			count_clk <=0;
			clk_song <= ~clk_song;
	end
	
	else if(speed_level==2'b11&&count_clk==195312&&which_song==2'b11)
		begin
			count_clk <=0;
			clk_song <= ~clk_song;
		end
	else if(speed_level==2'b10&&count_clk==390625&&which_song==2'b11)
	begin
			count_clk <=0;
			clk_song <= ~clk_song;
	end
	
	else if(speed_level==2'b01&&count_clk==781250&&which_song==2'b11)
		begin
			count_clk <=0;
			clk_song <= ~clk_song;
		end
	else if(speed_level==2'b00&&count_clk==1562500&&which_song==2'b11)
	begin
			count_clk <=0;
			clk_song <= ~clk_song;
	end
	else
		count_clk <= count_clk+1;
		
	//分频clk_record
	if(count_record==781250)
	begin
			count_record <=0;
			clk_record <= ~clk_record;
	end
	
	else
		count_record <= count_record+1;
 end
 
 //第三件事情是每隔一个节拍移动当前的index，并检查有没有到末尾，到了末尾就按模式切歌
 
 always@(posedge clk_song)
 begin
 //重播
	if(whether_reset==1)
	begin
	index<=0;
	finish_reset<=1;
	end
//播放结束时
	else if((which_song==2'b00&&index>=11'h187)||(which_song==2'b01&&index>=11'h1d0)||(which_song==2'b10&&index>=11'hc0)||(which_song==2'b11&&index>=recordlong))
	begin
		index<=0;
		case(mode)
		2'b00:which_song<=which_song;//单曲循环
		2'b01:which_song<=(which_song+1)%4;//循环播放
		2'b10:begin which_song[1]<=~which_song[1];which_song[0]<=which_song[1]^which_song[0];end//随机播放
		2'b11:which_song<=2'b11;
		default:which_song<=which_song;
		endcase
	end
//切歌
	else if(whether_pass==1)
	begin
		index<=0;
		case(mode)
		2'b00:which_song<=which_song;//单曲循环
		2'b01:which_song<=(which_song+1)%4;//循环播放
		2'b10:begin which_song[1]<=~which_song[1];which_song[0]<=which_song[1]^which_song[0];end//随机播放
		2'b11:which_song<=2'b11;
		default:which_song<=which_song;
		endcase
		finish_pass<=1;
	end
//后跳
	else if(whether_jmpr==1)begin index<=index+40;finish_jmpr<=1;end
//前跳
	else if(whether_jmpl==1)
	begin 
	if(index<40)index<=0;
	else index<=index-40;
	finish_jmpl<=1;
	end
//播放过程中
	else if(whether_pause==0)index<=index+1;//
	
	if(whether_pass==0)finish_pass<=0;
	if(whether_reset==0)finish_reset<=0;
	if(whether_jmpr==0)finish_jmpr<=0;
	if(whether_jmpl==0)finish_jmpl<=0;
 end
 
 
 
 
 always@(posedge clk_record)
 begin
	if(whether_record==1)
	begin
		case(datain)
			7'b0000001:
			begin 
			music3[redex[10:0]]<=8'h17;
			end
			7'b0000010:
			begin
			music3[redex[10:0]]<=8'h16;
			end
			7'b0000100:
			begin
			music3[redex[10:0]]<=8'h15;
			end
			7'b0001000:
			begin
			music3[redex[10:0]]<=8'h14;
			end
			7'b0010000:
			begin
			music3[redex[10:0]]<=8'h13;
			end
			7'b0100000:
			begin
			music3[redex[10:0]]<=8'h12;
			end
			7'b1000000:
			begin
			music3[redex[10:0]]<=8'h11;
			end
			default:	
			begin 
			music3[redex[10:0]]<=8'h00;
			end
		endcase
		if(record_state==1)
			redex<=redex+1;
	end
	
	if(record_state==2)
			redex<=0;
end
endmodule

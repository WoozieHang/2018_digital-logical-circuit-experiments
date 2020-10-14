module screen_ram(
rdclk,
wrclk,
row_addr, 
col_addr,
index_addr,
din,
dout,
mode,
name,
speed,
index,		///////////////////////////////////没弄完！！！！！！！////////////
freq
);
input rdclk;
input wrclk;
input [15:0]freq;
input [1:0]name;
input [1:0]mode;
input [10:0]index;		/////////////////也没弄完！！/////////

input [1:0]speed;
//we need a array of 30*70 which is easy to compute 
input [7:0] row_addr;
input [7:0] col_addr;
input [7:0] din;
input [11:0]index_addr;
output reg[7:0] dout;
reg [7:0] ram [2099:0];


wire [5:0] second=index/4;
wire [3:0] second1=second%10;
wire [3:0] second2=second/10;

integer i;
//波浪 1122&1192开始

initial
begin
	ram[1935]=8'h44;  	//D
	ram[1936]=8'h65;		//e
	ram[1937]=8'h73;		//s
	ram[1938]=8'h69;		//i
	ram[1939]=8'h67;		//g
	ram[1940]=8'h6e;		//n
	ram[1941]=8'h20;		
	ram[1942]=8'h62;		//b
	ram[1943]=8'h79;		//y
	ram[1944]=8'h20;	
	ram[1945]=8'h58;		//X
	ram[1946]=8'h75;		//u
	ram[1947]=8'h48;		//H
	ram[1948]=8'h61;		//a
	ram[1949]=8'h6f;		//o
	ram[1950]=8'h20;		
	ram[1951]=8'h26;		//&
	ram[1952]=8'h20;
	ram[1953]=8'h57;		//W
	ram[1954]=8'h75;		//u
	ram[1955]=8'h5a;		//Z
	ram[1956]=8'h69;		//i
	ram[1957]=8'h68;		//H
	ram[1958]=8'h61;		//a
	ram[1959]=8'h6e;		//n
	ram[1960]=8'h67;		//g
	
	ram[1402]=8'h53;		//S	
	ram[1403]=8'h70;		//p
	ram[1404]=8'h65;		//e
	ram[1405]=8'h65;		//e
	ram[1406]=8'h64;		//d
	ram[1407]=8'h3a;		//:
	
	ram[1262]=8'h30;		//0	
	ram[1263]=8'h3a;		//:
end


always@(posedge wrclk)
begin

/*
	for(i=0;i<=len;i=i+1)
	begin
	ram[1122+i]=8'hdb;
	ram[1192+i]=8'hdb;
	end
*/
	case(name)
	
	//Little Stars
	2'b00:
	begin
	ram[1052]=8'h4c;
	ram[1053]=8'h69;
	ram[1054]=8'h74;
	ram[1055]=8'h74;
	ram[1056]=8'h6c;
	ram[1057]=8'h65;
	ram[1058]=8'h20;
	ram[1059]=8'h53;
	ram[1060]=8'h74;
	ram[1061]=8'h61;
	ram[1062]=8'h72;
	ram[1063]=8'h73;
	end
	//River
	2'b01:
	begin 
	ram[1052]=8'h52;
	ram[1053]=8'h69;
	ram[1054]=8'h76;
	ram[1055]=8'h65;
	ram[1056]=8'h72;
	ram[1057]=8'h20;
	ram[1058]=8'h20;
	ram[1059]=8'h20;
	ram[1060]=8'h20;
	ram[1061]=8'h20;
	ram[1062]=8'h20;
	ram[1063]=8'h20;
	end
	//Edlweiss
	2'b10:
	begin
	ram[1052]=8'h45;
	ram[1053]=8'h64;
	ram[1054]=8'h6c;
	ram[1055]=8'h77;
	ram[1056]=8'h65;
	ram[1057]=8'h69;
	ram[1058]=8'h73;
	ram[1059]=8'h73;
	ram[1060]=8'h20;
	ram[1061]=8'h20;
	ram[1062]=8'h20;
	ram[1063]=8'h20;
	end
	//Untitled
	2'b11:
	begin
	ram[1052]=8'h55;
	ram[1053]=8'h6e;
	ram[1054]=8'h74;
	ram[1055]=8'h69;
	ram[1056]=8'h74;
	ram[1057]=8'h6c;
	ram[1058]=8'h65;
	ram[1059]=8'h64;
	ram[1060]=8'h20;
	ram[1061]=8'h20;
	ram[1062]=8'h20;
	ram[1063]=8'h20;
	end
	endcase
	
	
	//1332开始
	case(mode)
	//Repeat
	2'b00:
	begin
	ram[1332]=8'h52;
	ram[1333]=8'h65;
	ram[1334]=8'h70;
	ram[1335]=8'h65;
	ram[1336]=8'h61;
	ram[1337]=8'h74;
	end
	//Play
	2'b01:
	begin
	ram[1332]=8'h50;
	ram[1333]=8'h6c;
	ram[1334]=8'h61;
	ram[1335]=8'h79;
	ram[1336]=8'h20;
	ram[1337]=8'h20;
	end
	//Random
	2'b10:
	begin
	ram[1332]=8'h52;
	ram[1333]=8'h61;
	ram[1334]=8'h6e;
	ram[1335]=8'h64;
	ram[1336]=8'h6f;
	ram[1337]=8'h6d;
	end
	//Record
	2'b11:
	begin
	ram[1332]=8'h52;
	ram[1333]=8'h65;
	ram[1334]=8'h63;
	ram[1335]=8'h6f;
	ram[1336]=8'h72;
	ram[1337]=8'h64;
	end
	endcase
	
	
	//时间1262(4)开始
	case(second2)
	4'h0:ram[1264]=8'h30;
	4'h1:ram[1264]=8'h31;
	4'h2:ram[1264]=8'h32;
	4'h3:ram[1264]=8'h33;
	4'h4:ram[1264]=8'h34;
	4'h5:ram[1264]=8'h35;
	4'h6:ram[1264]=8'h36;
	4'h7:ram[1264]=8'h37;
	4'h8:ram[1264]=8'h38;
	4'h9:ram[1264]=8'h39;
	endcase
	case(second1)
	4'h0:ram[1265]=8'h30;
	4'h1:ram[1265]=8'h31;
	4'h2:ram[1265]=8'h32;
	4'h3:ram[1265]=8'h33;
	4'h4:ram[1265]=8'h34;
	4'h5:ram[1265]=8'h35;
	4'h6:ram[1265]=8'h36;
	4'h7:ram[1265]=8'h37;
	4'h8:ram[1265]=8'h38;
	4'h9:ram[1265]=8'h39;
	endcase
	
	//速度1402(8)开始
	case(speed)
	2'b00:
	begin
	ram[1408]=8'h31;
	ram[1409]=8'h2f;
	ram[1410]=8'h32;
	end
	2'b01:
	begin
	ram[1408]=8'h31;
	ram[1409]=8'h20;
	ram[1410]=8'h20;
	end
	
	2'b10:
	begin
	ram[1408]=8'h32;
	ram[1409]=8'h20;
	ram[1410]=8'h20;
	end
	
	2'b11:
	begin
	ram[1408]=8'h34;
	ram[1409]=8'h20;
	ram[1410]=8'h30;
	end
	
	endcase
	
	
	ram[1932]=8'h44;  	//D
	ram[1933]=8'h65;		//e
	ram[1934]=8'h73;		//s
	ram[1935]=8'h69;		//i
	ram[1936]=8'h67;		//g
	ram[1937]=8'h6e;		//n
	ram[1938]=8'h65;		//e
	ram[1939]=8'h64;
	ram[1940]=8'h20;		
	ram[1941]=8'h62;		//b
	ram[1942]=8'h79;		//y
	ram[1943]=8'h20;	
	ram[1944]=8'h58;		//X
	ram[1945]=8'h75;		//u
	ram[1946]=8'h48;		//H
	ram[1947]=8'h61;		//a
	ram[1948]=8'h6f;		//o
	ram[1949]=8'h20;		
	ram[1950]=8'h26;		//&
	ram[1951]=8'h20;
	ram[1952]=8'h57;		//W
	ram[1953]=8'h75;		//u
	ram[1954]=8'h5a;		//Z
	ram[1955]=8'h69;		//i
	ram[1956]=8'h68;		//H
	ram[1957]=8'h61;		//a
	ram[1958]=8'h6e;		//n
	ram[1959]=8'h67;		//g
	
	ram[1402]=8'h53;		//S	
	ram[1403]=8'h70;		//p
	ram[1404]=8'h65;		//e
	ram[1405]=8'h65;		//e
	ram[1406]=8'h64;		//d
	ram[1407]=8'h3a;		//:
	
	ram[1262]=8'h30;		//0	
	ram[1263]=8'h3a;		//:
end


always @(posedge rdclk)
begin
dout<= ram[row_addr*70+col_addr];
end
endmodule

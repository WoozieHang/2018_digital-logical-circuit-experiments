module button(
clk,
sw,
f,
);
input clk;
input[7:0]sw;
output reg[15:0]f;
reg [3:0]soundnum;

always@(posedge clk)
begin
f=0;
soundnum=0;
if(sw[7]==1)
begin
f=f+16'd714;soundnum=soundnum+1;
end

if(sw[6]==1)
begin
f=f+16'd802;soundnum=soundnum+1;
end

if(sw[5]==1)
begin
f=f+16'd900;soundnum=soundnum+1;
end

if(sw[4]==1)
begin
f=f+16'd953;soundnum=soundnum+1;
end

if(sw[3]==1)
begin
f=f+16'd1070;soundnum=soundnum+1;
end

if(sw[2]==1)
begin
f=f+16'd1201;soundnum=soundnum+1;
end

if(sw[1]==1)
begin
f=f+16'd1348;soundnum=soundnum+1;
end

if(sw[0]==1)
begin
f=f+16'd1428;soundnum=soundnum+1;
end

if(soundnum!=1)
begin
f=f/soundnum;
end

end

endmodule


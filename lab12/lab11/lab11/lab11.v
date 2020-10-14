module lab11(
//clock
input clk,
//music

input [15:0]freq,
input [10:0]index,
input [1:0]name,
input [1:0]mode,
input [1:0]speed,
input color,
//test
//input [5:0]test,
//screen
output hsync,
output vsync,
output sync_n,
output blank_n,
output [7:0] vga_r,
output [7:0] vga_g,
output [7:0] vga_b,
output vga_clk
);

//test
/*
wire [15:0]freq=test[0]?270:1000;
wire [10:0]index=test[1]?59:33;
wire [1:0]name=test[2]?2'b00:2'b01;
wire [1:0]mode=test[3]?2'b00:2'b01;
wire [1:0]speed=test[4]?2'b00:2'b01;
wire color=test[5]?1'b0:1'b1;
*/
screen myscreen(
.clk(clk), //时钟
.hsync(hsync),
.vsync(vsync),
.sync_n(sync_n),
.blank_n(blank_n),
.vga_r(vga_r),
.vga_g(vga_g),
.vga_b(vga_b),
.vga_clk(vga_clk),
.freq(freq),
.index(index),
.name(name),
.mode(mode),
.speed(speed),
.color(color)
);

endmodule

module screen(
input clk, //时钟
output hsync,
output vsync,
output sync_n,
output blank_n,
output [7:0] vga_r,
output [7:0] vga_g,
output [7:0] vga_b,
output vga_clk,
input [15:0]freq,
input [10:0]index,
input [1:0]name,
input [1:0]mode,
input [1:0]speed,
input color
);

wire [9:0] len=freq/4;
wire [9:0]h_addr;
wire [9:0]v_addr;
wire [18:0]addr;
reg [11:0]data;
wire [7:0]now_assic;
wire [7:0]row_addr=v_addr/16;
wire [7:0]col_addr=h_addr/9;
wire [3:0]row_char=v_addr%16;
wire [3:0]col_char=h_addr%9-1;


wire [23:0]background=color?24'hffffff:24'h0f0101;
wire [23:0]wavebg=color?24'hfff0ff:24'h0fffff;
wire [23:0]fontcolor=color?24'h00f000:24'hffffff;


wire [23:0]vga_data=(row_addr>15&&row_addr<18)?((h_addr>18&&h_addr<len)?fontcolor:wavebg):(bit[col_char]? fontcolor:background);

wire [11:0]bit;
assign sync_n=0;

reg [7:0] index_x;
reg [7:0] index_y;
wire[11:0] index_address;


initial
begin
	index_x=0;
	index_y=0;
end
assign index_address = index_x+index_y*70;


clkgen #(25000000) my_vgaclk(clk,1'b0,1'b1,vga_clk);

vga_ctrl VGA_CTRL(
.pclk(vga_clk),
.reset(1'b0),
.vga_data(vga_data),
.h_addr(h_addr),
.v_addr(v_addr),
.hsync(hsync),
.vsync(vsync),
.valid(blank_n),
.vga_r(vga_r),
.vga_g(vga_g),
.vga_b(vga_b)
);

screen_ram my_sr(
.rdclk(vga_clk),
.wrclk(clk),
.row_addr(row_addr),
.col_addr(col_addr),
.index_addr(index_address),
.din(assic),
.dout(now_assic),
.mode(mode),
.name(name),
.speed(speed),
.index(index),
.freq(freq)
);

vga_font_rom my_vfr(
.address(now_assic),
.clock(clk),
.bit(bit),
.row_char(row_char),
);




endmodule

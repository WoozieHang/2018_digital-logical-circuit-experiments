module lab11(
//clock
output if_cin,
input clk, 
//keyboard
input ps2_clk,
input ps2_data,
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


wire [7:0]assic;
//wire if_cin;

//get the ready assic code of keyboard input
keyboard mykb(
.clk(clk),
.ps2_clk(ps2_clk),
.ps2_data(ps2_data),
.assic(assic),
.en(if_cin)
);



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
.assic(assic),
.if_cin(if_cin),
);


endmodule




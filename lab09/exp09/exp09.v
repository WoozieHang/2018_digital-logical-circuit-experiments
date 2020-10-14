module exp09(
input clk, //时钟
output hsync,
output vsync,
output sync_n,
output blank_n,
output [7:0] vga_r,
output [7:0] vga_g,
output [7:0] vga_b,
output vga_clk
);
wire [9:0]h_addr;
wire [9:0]v_addr;
reg [11:0]data;
wire [23:0]vga_data;

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

assign sync_n=0;
assign vga_data = data[3:0]<<4|data[7:4]<<12|data[11:8]<<20;
always@(posedge clk)
if(h_addr==300)
data=12'h333;
else if(h_addr==500)
data=12'h888;
else if(h_addr==100)
data=12'h444;
else data=12'h999;
endmodule

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
input [7:0]assic,
input if_cin
);

wire [9:0]h_addr;
wire [9:0]v_addr;
wire [18:0]addr;
reg [11:0]data;
wire [7:0]now_assic;
wire [7:0]row_addr=v_addr/16;
wire [7:0]col_addr=h_addr/9;
wire [3:0]row_char=v_addr%16;
wire [3:0]col_char=h_addr%9-1;
wire [23:0]vga_data=bit[col_char]? 24'hffffff:24'h000000;
wire [11:0]bit;
assign sync_n=0;


reg [7:0] index_x;
reg [7:0] index_y;
wire[11:0] index_address;
reg [30:0]count;
reg count_clk;
reg state;
reg l;
initial
begin
	index_x=0;
	index_y=0;
end
assign index_address = index_x+index_y*70;

always@(posedge vga_clk)
begin
	if(assic==10)
	l<=1;
	
	count<=count+1;
	if(if_cin==1)
		state<=1'b1;
	if(count==15000000)
	begin
	count<=0;
	count_clk<=~count_clk;
	end
	
	if(state==1&&count==0)
	begin
		if(index_x<70)
			index_x<=index_x+1;
		else if(index_y<30||l==1)
			begin
				index_y<=index_y+1;
				index_x<=0;
				l<=0;
			end
		else 
			begin 
				index_x<=0;
				index_y<=0;
			end
		state<=1'b0;
	end
end



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
.row_addr(row_addr),
.col_addr(col_addr),
.dout(now_assic),
.wrclk(clk),
.we(~state),
.din(assic),
.index_addr(index_address)
);

vga_font_rom my_vfr(
.address(now_assic),
.clock(clk),
.bit(bit),
.row_char(row_char),
);




endmodule

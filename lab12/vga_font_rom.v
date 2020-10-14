module vga_font_rom(address,clock,bit,row_char);
//256*16*12，a unit is 12, 4096 's units
input clock;
input [7:0] address;
output reg [11:0]bit;
input [3:0]row_char;

reg [11:0] rom [4095:0];

initial
begin
$readmemh("D:/digital_logic/vga_font.txt", rom, 0, 4095);
end

always@(posedge clock)
begin
bit<=rom[{address,row_char}] ;
end


endmodule

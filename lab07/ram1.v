module ram1(clk, we, inaddr, din, dout);
input clk;
input we;
input [3:0] inaddr;
input [7:0] din;
output[7:0] dout;
reg [7:0] ram [15:0];
reg [7:0]dout;

initial
begin
$readmemh("D:/digital_logic/mem1.txt", ram, 0, 15);
end

always @(posedge clk)
begin
if (we)

ram[inaddr] <= din;
else
dout<= ram[inaddr];
end
endmodule

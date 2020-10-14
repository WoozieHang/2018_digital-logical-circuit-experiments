module button_to_assic(clk,buttonword,assic);
input clk;
input [7:0]buttonword;
output reg [7:0]assic;

always@(posedge clk)
begin
case(buttonword)
8'h0D: assic<=8'h20;
8'h0E: assic<=8'h60;
8'h15: assic<=8'h71;
8'h16: assic<=8'h31;
8'h1A: assic<=8'h7A;
8'h1B: assic<=8'h73;
8'h1C: assic<=8'h61;
8'h1D: assic<=8'h77;
8'h1E: assic<=8'h32;
8'h21: assic<=8'h63;
8'h22: assic<=8'h78;
8'h23: assic<=8'h64;
8'h24: assic<=8'h65;
8'h25: assic<=8'h34;
8'h26: assic<=8'h33;
8'h29: assic<=8'h20;
8'h2A: assic<=8'h76;
8'h2B: assic<=8'h66;
8'h2C: assic<=8'h74;
8'h2D: assic<=8'h72;
8'h2E: assic<=8'h35;
8'h31: assic<=8'h6E;
8'h32: assic<=8'h62;
8'h33: assic<=8'h68;
8'h34: assic<=8'h67;
8'h35: assic<=8'h79;
8'h36: assic<=8'h36;
8'h3A: assic<=8'h6D;
8'h3B: assic<=8'h6A;
8'h3C: assic<=8'h75;
8'h3D: assic<=8'h37;
8'h3E: assic<=8'h38;
8'h41: assic<=8'h2C;
8'h42: assic<=8'h6B;
8'h43: assic<=8'h69;
8'h44: assic<=8'h6F;
8'h45: assic<=8'h30;
8'h46: assic<=8'h39;
8'h49: assic<=8'h2E;
8'h4A: assic<=8'h2F;
8'h4B: assic<=8'h6C;
8'h4C: assic<=8'h3A;
8'h4D: assic<=8'h71;
8'h4E: assic<=8'h2D;
8'h52: assic<=8'h27;
8'h54: assic<=8'h5B;
8'h55: assic<=8'h3D;
8'h5B: assic<=8'h5D;
8'h5D: assic<=8'h5C;
8'h66: assic<=8'h08;
8'h69: assic<=8'h31;
8'h6B: assic<=8'h34;
8'h6C: assic<=8'h37;
8'h70: assic<=8'h30;
8'h71: assic<=8'h2E;
8'h72: assic<=8'h32;
8'h73: assic<=8'h35;
8'h74: assic<=8'h36;
8'h75: assic<=8'h38;
8'h79: assic<=8'h2B;
8'h7A: assic<=8'h33;
8'h7B: assic<=8'h2C;
8'h7C: assic<=8'h2A;
8'h7D: assic<=8'h39;
default: assic<=16'h00;
endcase
end
endmodule

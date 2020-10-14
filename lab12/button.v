module button(
clk,
tune,
f
);
input clk;
input[7:0]tune;
output reg[15:0]f;

always@(posedge clk)
begin
case(tune)
8'h01:f<=16'd179;
8'h02:f<=16'd200;
8'h03:f<=16'd225;
8'h04:f<=16'd238;
8'h05:f<=16'd268;
8'h06:f<=16'd300;
8'h07:f<=16'd337;
8'h11:f<=16'd357;
8'h12:f<=16'd401;
8'h13:f<=16'd450;
8'h14:f<=16'd477;
8'h15:f<=16'd535;
8'h16:f<=16'd601;
8'h17:f<=16'd674;
8'h21:f<=16'd714;
8'h22:f<=16'd802;
8'h23:f<=16'd900;
8'h24:f<=16'd953;
8'h25:f<=16'd1070;
8'h26:f<=16'd1201;
8'h27:f<=16'd1348;
8'h31:f<=16'd1428;
8'h32:f<=16'd1604;
8'h33:f<=16'd1800;
8'h34:f<=16'd1907;
8'h35:f<=16'd2141;
8'h36:f<=16'd2403;
8'h37:f<=16'd2697;
default:f<=0;
endcase
end

endmodule


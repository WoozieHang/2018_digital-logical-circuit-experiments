module keyboardFunc(
input [7:0]ascii,
input clock,
output reg[12:0] func,
input if_cin
);
/*
F12 录音		8'h77:func=13'b1000000000000;
F11 下一首		8'h73:func=13'b0100000000000;
F10 进10s		8'h64:func=13'b0010000000000;
F9 退10s		8'h61:func=13'b0001000000000;
F8 暂停		8'h20:func=13'b0000100000000;
F7 重播		8'h72:func=13'b0000010000000;
F6 do			8'h31:func=13'b0000001000000;
F5 re			8'h32:func=13'b0000000100000;
F4 mi			8'h33:func=13'b0000000010000;
F3 fa			8'h34:func=13'b0000000001000;
F2 so			8'h35:func=13'b0000000000100;
F1 la			8'h36:func=13'b0000000000010;
F0 xi			8'h37:func=13'b0000000000001;
*/

initial
begin
func=13'b0000000000000;
end

always @(posedge clock)
begin
	case(ascii)
		8'h77:func<=13'b1000000000000;
		8'h73:func<=13'b0100000000000;
		8'h64:func<=13'b0010000000000;
		8'h61:func<=13'b0001000000000;
		8'h20:func<=13'b0000100000000;
		8'h72:func<=13'b0000010000000;
		8'h31:func<=13'b0000001000000;
		8'h32:func<=13'b0000000100000;
		8'h33:func<=13'b0000000010000;
		8'h34:func<=13'b0000000001000;
		8'h35:func<=13'b0000000000100;
		8'h36:func<=13'b0000000000010;
		8'h37:func<=13'b0000000000001;
	default:func<=13'b0000000000000;
	endcase
end

endmodule

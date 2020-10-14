module lab02(x,en,y,indicatingBit,NumLight);
input [7:0] x;
input en;
output reg [2:0]y;
output reg indicatingBit;
output reg [6:0]NumLight;
integer i;
always @(x or en)
	begin
		if(en)
		begin
			y=0;
			indicatingBit=0;
			for(i=0;i<8;i=i+1)
				if(x[i]==1)
					begin
						y=i;
						indicatingBit=1;
					end
		case(y)
					3'd0: NumLight=7'b1000000;
					3'd1: NumLight=7'b1111001;
					3'd2: NumLight=7'b0100100;
					3'd3: NumLight=7'b0110000;
					3'd4: NumLight=7'b0011001;
					3'd5: NumLight=7'b0010010;
					3'd6: NumLight=7'b0000010;
					3'd7: NumLight=7'b1111000;
					endcase
		end
		else
			begin 
			y=0;
			indicatingBit=0;
			NumLight=127;
			end
	  end
	endmodule
	
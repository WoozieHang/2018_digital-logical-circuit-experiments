module screen_ram(
rdclk,
wrclk,
we, 
row_addr, 
col_addr,
index_addr,
din,
dout
);
input rdclk;
input wrclk;
input we;
//we need a array of 30*70 which is easy to compute 
input [7:0] row_addr;
input [7:0] col_addr;
input [7:0] din;
input [11:0]index_addr;
output reg[7:0] dout;
reg [7:0] ram [2099:0];

initial
begin
	ram[0]=8'h36;
end
always@(posedge wrclk)
begin
	if(we)
		begin
		ram[index_addr]<=din;
		end
end


always @(posedge rdclk)
dout<= ram[row_addr*70+col_addr];

endmodule

//always @(negedge wrclk)
//begin
	//if (we)
	//	begin
			//ram[(col_cursor<<5)|row_cursor] <= din;
			//finish_cin<=1;
		//end

//	else
		//finish_cin<=0;
	//if(finish_cin)

//		if(col_cursor<70)
//		col_cursor<=col_cursor+1;
//		else 
//		begin
//			col_cursor<=0;
//			if(row_cursor<30)
//				row_cursor<=row_cursor+1;
//			else row_cursor<=0;
//		end


//end


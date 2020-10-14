module final_lab(

	//////////// CLOCK //////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,

	//////////// LED //////////
	output		     [9:0]		LEDR,

	//////////// Seg7 //////////
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,

	//////////// Audio //////////
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,

	//////////// PS2 //////////
	input 		          		PS2_CLK,
	input 		          		PS2_CLK2,
	input 		          		PS2_DAT,
	input 		          		PS2_DAT2,

	//////////// I2C for Audio and Video-In //////////
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT,
	//SCREEN
	output hsync,
	output vsync,
	output sync_n,
	output blank_n,
	output [7:0] vga_r,
	output [7:0] vga_g,
	output [7:0] vga_b,
	output vga_clk
);



//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [7:0]assic;
wire if_cin;

wire clk_i2c;
wire reset;
wire [15:0] audiodata;


wire [15:0]f;
wire [7:0] tune;
wire [9:0]ledr;
wire [12:0]func;

wire [10:0]index;
wire [1:0]which_song;
//=======================================================
//  Structural coding
//=======================================================

assign reset = ~KEY[0];

xclk u1(CLOCK_50, reset,AUD_XCK, ledr[9]);


//I2C part
clkgen #(10000) my_i2c_clk(CLOCK_50,reset,1'b1,clk_i2c);  //10k I2C clock  

button BT(CLOCK_50,tune[7:0],f[15:0]);//sw[7:0] is duo ruai mi fa suo la xi dou!

I2C_Audio_Config myconfig(clk_i2c, KEY[0],FPGA_I2C_SCLK,FPGA_I2C_SDAT,ledr[2:0]);

I2S_Audio myaudio(AUD_XCK, KEY[0], AUD_BCLK, AUD_DACDAT, AUD_DACLRCK, audiodata);

Sin_Generator sin_wave(AUD_DACLRCK, KEY[0], f[15:0]	, audiodata);//

get_music get_m(CLOCK_50,tune[7:0],func[7],func[8],SW[3:2],SW[1:0],func[11],which_song[1:0],index[10:0],func[10],func[9],func[6:0],func[12],LEDR[0],LEDR[1]);

//key1是暂停继续，换成空格键

keyboard mykb(
.clk(CLOCK_50),
.ps2_clk(PS2_CLK),
.ps2_data(PS2_DAT),
.assic(assic[7:0]),
.en(if_cin)
);

keyboardFunc kf(assic[7:0],CLOCK_50,func[12:0],if_cin);

cover cvr(
//clock
CLOCK_50,
//music

f[15:0],
index[10:0],
which_song[1:0],
SW[1:0],
SW[3:2],
SW[9],
//test
//input [5:0]test,
//screen
hsync,
vsync,
sync_n,
blank_n,
vga_r[7:0],
vga_g[7:0],
vga_b[7:0],
vga_clk
);

endmodule

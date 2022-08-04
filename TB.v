`timescale 1ns / 1ns

module Top_tb();

reg clk, data_in, data_out;
reg [7:0] startmem [63:0];

reg [7:0] result [63:0];
wire [7:0] wres; //[63:0];

wire [7:0] Wadr, Radr;


always begin
#10 clk = ~clk;
#1024 data_in = ~data_in;
#1024 data_out = ~data_out;
end

initial begin

data_in = 1;
data_out = 0;

startmem[0] = 8'd0; startmem[1] = 8'd20; startmem[2] = 8'd40; startmem[3] = 8'd55; 
startmem[4] = 8'd83; startmem[5] = 8'd255; startmem[6] = 8'd186; startmem[7] = 8'd40; 

startmem[8] = 8'd0; startmem[9] = 8'd33; startmem[10] = 8'd52; startmem[11] = 8'd68; 
startmem[12] = 8'd130; startmem[13] = 8'd240; startmem[14] = 8'd190; startmem[15] = 8'd93; 

startmem[16] = 8'd20; startmem[17] = 8'd29; startmem[18] = 8'd63; startmem[19] = 8'd130; 
startmem[20] = 8'd213; startmem[21] = 8'd255; startmem[22] = 8'd170; startmem[23] = 8'd85; 

startmem[24] = 8'd40; startmem[25] = 8'd80; startmem[26] = 8'd100; startmem[27] = 8'd200; 
startmem[28] = 8'd255; startmem[29] = 8'd200; startmem[30] = 8'd150; startmem[31] = 8'd40; 

startmem[32] = 8'd43; startmem[33] = 8'd93; startmem[34] = 8'd150; startmem[35] = 8'd215; 
startmem[36] = 8'd255; startmem[37] = 8'd196; startmem[38] = 8'd120; startmem[39] = 8'd60; 

startmem[40] = 8'd55; startmem[41] = 8'd120; startmem[42] = 8'd200; startmem[43] = 8'd255; 
startmem[44] = 8'd200; startmem[45] = 8'd153; startmem[46] = 8'd92; startmem[47] = 8'd50; 

startmem[48] = 8'd80; startmem[49] = 8'd201; startmem[50] = 8'd255; startmem[51] = 8'd255; 
startmem[52] = 8'd206; startmem[53] = 8'd152; startmem[54] = 8'd73; startmem[55] = 8'd31; 

startmem[56] = 8'd90; startmem[57] = 8'd192; startmem[58] = 8'd255; startmem[59] = 8'd220; 
startmem[60] = 8'd150; startmem[61] = 8'd100; startmem[62] = 8'd62; startmem[63] = 8'd0; 
end

counter RCount(
	.clk(clk),
	.reset(!data_in),
	.counter(Radr)
);

counter WCount(
	.clk(clk),
	.reset(!data_out),
	.counter(Wadr)
);

Top tb(
	.clk(clk),
	.data_in(data_in),
	.data_out(data_out),
	.element(startmem[Raddr]),
	.outmatrix(wres[Waddr])
);

always @(posedge clk) begin
	if(data_out)
		result[Wadr] <= wres;
end

/*always @(posedge clk) begin
	result[0] = wres[0]; result[16] = wres[16]; result[32] = wres[32]; result[48] = wres[48];
	result[1] = wres[1]; result[17] = wres[17]; result[33] = wres[33]; result[49] = wres[49];
	result[2] = wres[2]; result[18] = wres[18]; result[34] = wres[34]; result[50] = wres[50];
	result[3] = wres[3]; result[19] = wres[19]; result[35] = wres[35]; result[51] = wres[51];
	result[4] = wres[4]; result[31] = wres[31]; result[36] = wres[36]; result[52] = wres[52];
	result[5] = wres[5]; result[20] = wres[20]; result[37] = wres[37]; result[53] = wres[53];
	result[6] = wres[6]; result[21] = wres[21]; result[38] = wres[38]; result[54] = wres[54];
	result[7] = wres[7]; result[22] = wres[22]; result[39] = wres[39]; result[55] = wres[55];
	result[8] = wres[8]; result[23] = wres[23]; result[40] = wres[40]; result[56] = wres[56];
	result[9] = wres[9]; result[24] = wres[24]; result[41] = wres[41]; result[57] = wres[57];
	result[10] = wres[10]; result[25] = wres[25]; result[42] = wres[42]; result[58] = wres[58];
	result[11] = wres[11]; result[26] = wres[26]; result[43] = wres[43]; result[59] = wres[59];
	result[12] = wres[12]; result[27] = wres[27]; result[44] = wres[44]; result[60] = wres[60];
	result[13] = wres[13]; result[28] = wres[28]; result[45] = wres[45]; result[61] = wres[61];
	result[14] = wres[14]; result[29] = wres[29]; result[46] = wres[46]; result[62] = wres[62];
	result[15] = wres[15]; result[30] = wres[30]; result[47] = wres[47]; result[63] = wres[63];
end*/

endmodule

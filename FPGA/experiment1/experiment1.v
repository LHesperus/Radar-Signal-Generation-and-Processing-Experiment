`timescale 1 ps / 1 ps
module experiment1(
input clk,
input [11:0]ad_in,
output da_clk,
output ad_clk,
output sleep_dac,
output pwdn_dac,
output  [13:0]da_out
);

//reg [7:0]  address=0;
reg	[10:0]  address=0;
wire [11:0] da_out_temp;
wire clk_200;

pll pll200M(
.inclk0(clk),
.c0(clk_200)
);


reg clk100=0;
always@(posedge clk_200)
begin
  clk100<=~clk100;
end
assign da_clk=clk100;
assign ad_clk=clk100;

sin_2048 sin_2048_1(
.address (address),
.clock   (clk_200),
.q       (da_out_temp)
);


assign da_out={2'b0,da_out_temp};
always@(posedge clk_200)
begin
	address<=address+11'd102;
end


reg [11:0]ad_in_temp;
always@(posedge clk_200)
begin
	ad_in_temp<=ad_in;
end

assign sleep_dac=0;
assign pwdn_dac=0;
endmodule
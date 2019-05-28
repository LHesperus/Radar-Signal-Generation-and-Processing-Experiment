`timescale 1 ps / 1 ps
module Receiver #(parameter width=12)(
input clk,
input [width-1:0]ad_out,
input [1:0]ad_13_14,
output da_clk,
output [width+1:0]dac_in,
output [1:0]dac_14_15,
output sleep_dac,
output ad_clk,
output pwdn_adc
);

assign dac_14_15=0;
parameter Prf_N=16;




/* gen 80MHz clk*/
wire clk_80;
Clock_management Clock_management_1(
.inclk0(clk    ),
.c0	 (clk_80 )
);

/*Prf_N group*/
//always@

/*gen ECHO ,Prf_N, fc=30MHz B=10MHz T=6.4e-6 IF LFM*/
/*Doppler f= 4.5333e4 Hz*/
/*Gauss Channel SNR =10dB*/
wire [width-1:0]echo_signal;
reg  [11:0]address=0;
always@(posedge clk_80) begin address<=address+1'b1; end
IF_LFM ECHO(
.address(address),
.clock(clk_80),
.q(echo_signal)
);

assign da_clk=clk_80;
assign dac_in={2'b0,echo_signal};
assign sleep_dac=0;

/*receiv IF LFM fs=40M*/
reg clk_40=0;
always@(posedge clk_80) begin clk_40<=clk_40; end

assign ad_clk=clk_40;
assign pwdn_adc=0;


/*DDC*/
wire [width-1:0]ddc_I;
wire [width-1:0]ddc_Q;
DDC DDC_1(
.clk(clk_40),
.IF_Signal(ad_out),
.BaseBand_I(ddc_I),
.BaseBand_Q(ddc_Q)
);

/*PC*/
wire [2*width:0]pc_I;
wire [2*width:0]pc_Q;
wire [6*width:0]pc_abs2;
PC PC_1(
.clk(clk),
.signal_I(ddc_I),
.signal_Q(ddc_Q),
.pc_I(pc_I),
.pc_Q(pc_Q),
.pc_abs2(pc_abs2)
);

/*MTI*/
//wire [4*width:0]MTI_I;
//wire [4*width:0]MTI_Q;
//wire [10*width:0]MTI_abs2;
//MTI MTI_1(
//.clk(clk),
//.signal_I(pc_I),
//.signal_Q(pc_Q),
//.MTI_I(MTI_I),
//.MTI_Q(MTI_Q),
//.MTI_abs2(MTI_abs2)
//);


endmodule
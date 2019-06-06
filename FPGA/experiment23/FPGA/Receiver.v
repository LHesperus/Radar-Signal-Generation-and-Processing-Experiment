`timescale 1 ps / 1 ps
module Receiver #(parameter width=12)(
input clk,
input [width-1:0]ad_out,
output da_clk,
output [width+1:0]dac_in,
output sleep_dac,
output ad_clk,
output pwdn_adc,
output  [width-1:0]ddc_I,
output  [width-1:0]ddc_Q,
output  [3*width-1:0]pc_I,
output  [3*width-1:0]pc_Q,
output  [6*width:0]pc_abs2
);


parameter Prf_N=10;

/*rst*/
reg rst;
reg [10:0]count_r=0;
always@(posedge clk)
begin
if(count_r<11'd128)
	count_r<=count_r+1'b1;
end

always@(posedge clk)
begin
	if(count_r<10'd100)
	rst<=0;
	else 
	rst<=1'b1;
end


/* gen 100MHz clk*/
wire clk_100;
Clock_management Clock_management_1(
.inclk0(clk    ),
.c0	 (clk_100 )
);


/*Prf_N group*/
/*gen ECHO ,Prf_N, fc=10MHz B=5MHz T=10e-6 IF LFM*/
wire [width-1:0]echo_signal;
SEND_IF_LFM DA(
.clk   (clk_100),
.rst   (rst   ),
.out(echo_signal)
);

assign da_clk=clk_100;
assign dac_in={2'b0,echo_signal};
assign sleep_dac=0;

/*receiv IF LFM fs=100M*/
assign ad_clk=clk_100;
assign pwdn_adc=0;


/*DDC*/
//wire [width-1:0]ddc_I;
//wire [width-1:0]ddc_Q;

DDC DDC_1(
.clk(clk_100),
.rst(rst),
.IF_Signal(echo_signal),
.BaseBand_I(ddc_I),
.BaseBand_Q(ddc_Q)
);


/*PC*/
//wire [width-1:0]pc_I;
//wire [width-1:0]pc_Q;
//wire [6*width:0]pc_abs2;
PC PC_1(
.clk(clk),
.rst(rst),
.signal_I(ddc_I),
.signal_Q(ddc_Q),
.pc_I(pc_I),
.pc_Q(pc_Q),
.pc_abs2(pc_abs2)
);

///*MTI*/
//wire [width-1:0]MTI_I;
//wire [width-1:0]MTI_Q;
//wire [4*width:0]pulse_acc;
//
//MTI MTI_1(
//.clk        (clk    ),
//.signal_I   (pc_I),
//.signal_Q   (pc_Q),
//.rec_flag   (),
//.MTI_I_out  (MTI_I),
//.MTI_Q_out  (MTI_Q),
//.pulse_acc  (pulse_acc),
//.start_flag ()
//);

endmodule
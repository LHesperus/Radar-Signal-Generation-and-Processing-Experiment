`timescale 1 ns / 1 ps
module receiver_tb();
reg rst;
reg  clk_80;
reg  clk_40;
reg  clk_10;
reg  [11:0]address=0;
wire [12-1:0]echo_signal;

parameter width=12;

IF_LFM ECHO_inst(
.address(address),
.clock(clk_80),
.q(echo_signal)
);

wire  [11:0]ddc_I;
wire  [11:0]ddc_Q;
DDC DDC_1_inst(
.clk(clk_40),
.rst(rst),
.IF_Signal(echo_signal),
.BaseBand_I(ddc_I),
.BaseBand_Q(ddc_Q)
);

/*PC*/
wire [width-1:0]pc_I;
wire [width-1:0]pc_Q;
wire [6*width:0]pc_abs2;
PC PC_1(
.clk(clk_10),
.rst(rst),
.signal_I(ddc_Q),
.signal_Q(ddc_I),
.pc_I(pc_I),
.pc_Q(pc_Q),
.pc_abs2(pc_abs2)
);


/*pulse accumulation*/
reg rec_flag;
MTI MTI_inst(
.clk        (clk_10 ),
.signal_I   (pc_I  ),
.signal_Q   (pc_Q  ),
.rec_flag   (rec_flag),
.MTI_I_out  (       ),
.MTI_Q_out  (       ),
.pulse_acc  (       ),
.start_flag (       )
);


initial
begin
#0 rst=0;
#0 clk_80=1;
#0 clk_40=1;
#0 clk_10=1;
#0 address=0;
#0 rec_flag=0;
#100 rst=1;
#8400 rec_flag=1; //延迟与pc_I的第一个值时间点有关
#(51.2*1000*16) rec_flag=0;
end




always #6.25 clk_80=~clk_80;
always #12.5 clk_40=~clk_40;
always #50   clk_10=~clk_10;
always #12.5 address=address+1;
endmodule
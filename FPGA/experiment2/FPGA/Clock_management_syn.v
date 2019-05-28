// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// VENDOR "Altera"
// PROGRAM "Quartus II 64-Bit"
// VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"

// DATE "05/23/2019 01:38:29"

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module Clock_management (
	inclk0,
	c0)/* synthesis synthesis_greybox=0 */;
input 	inclk0;
output 	c0;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \altpll_component|_clk0 ;


Clock_management_altpll_1 altpll_component(
	._clk0(\altpll_component|_clk0 ),
	.inclk({gnd,inclk0}));

assign c0 = \altpll_component|_clk0 ;

endmodule

module Clock_management_altpll_1 (
	_clk0,
	inclk)/* synthesis synthesis_greybox=0 */;
output 	_clk0;
input 	[1:0] inclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \pll~CLK1 ;
wire \pll~CLK2 ;
wire \pll~CLK3 ;
wire \pll~CLK4 ;
wire \pll~CLK5 ;

wire [5:0] pll_CLK_bus;

assign _clk0 = pll_CLK_bus[0];
assign \pll~CLK1  = pll_CLK_bus[1];
assign \pll~CLK2  = pll_CLK_bus[2];
assign \pll~CLK3  = pll_CLK_bus[3];
assign \pll~CLK4  = pll_CLK_bus[4];
assign \pll~CLK5  = pll_CLK_bus[5];

stratixii_pll pll(
	.fbin(vcc),
	.ena(vcc),
	.clkswitch(gnd),
	.areset(gnd),
	.pfdena(vcc),
	.scanclk(gnd),
	.scanread(gnd),
	.scanwrite(gnd),
	.scandata(gnd),
	.inclk({gnd,inclk[0]}),
	.testin(4'b0000),
	.activeclock(),
	.clkloss(),
	.locked(),
	.scandataout(),
	.scandone(),
	.enable0(),
	.enable1(),
	.testupout(),
	.testdownout(),
	.clk(pll_CLK_bus),
	.clkbad(),
	.sclkout());
defparam pll.bandwidth = 872222;
defparam pll.bandwidth_type = "auto";
defparam pll.c0_high = 1;
defparam pll.c0_mode = "bypass";
defparam pll.c0_ph = 0;
defparam pll.c1_mode = "bypass";
defparam pll.c1_ph = 0;
defparam pll.c1_use_casc_in = "off";
defparam pll.c2_mode = "bypass";
defparam pll.c2_ph = 0;
defparam pll.c2_use_casc_in = "off";
defparam pll.c3_mode = "bypass";
defparam pll.c3_ph = 0;
defparam pll.c3_use_casc_in = "off";
defparam pll.c4_mode = "bypass";
defparam pll.c4_ph = 0;
defparam pll.c4_use_casc_in = "off";
defparam pll.c5_mode = "bypass";
defparam pll.c5_ph = 0;
defparam pll.c5_use_casc_in = "off";
defparam pll.charge_pump_current = 72;
defparam pll.clk0_counter = "c0";
defparam pll.clk0_divide_by = 1;
defparam pll.clk0_duty_cycle = 50;
defparam pll.clk0_multiply_by = 30;
defparam pll.clk0_phase_shift = "0";
defparam pll.clk1_duty_cycle = 50;
defparam pll.clk1_phase_shift = "0";
defparam pll.clk2_duty_cycle = 50;
defparam pll.clk2_phase_shift = "0";
defparam pll.clk3_duty_cycle = 50;
defparam pll.clk3_phase_shift = "0";
defparam pll.clk4_duty_cycle = 50;
defparam pll.clk4_phase_shift = "0";
defparam pll.clk5_duty_cycle = 50;
defparam pll.clk5_phase_shift = "0";
defparam pll.compensate_clock = "clk0";
defparam pll.down_spread = "0.00 %";
defparam pll.enable_switch_over_counter = "off";
defparam pll.gate_lock_counter = 0;
defparam pll.gate_lock_signal = "no";
defparam pll.inclk0_input_frequency = 100000;
defparam pll.inclk1_input_frequency = 100000;
defparam pll.invalid_lock_multiplier = 5;
defparam pll.loop_filter_c = 13;
defparam pll.loop_filter_r = " 1.000000";
defparam pll.m = 30;
defparam pll.m2 = 1;
defparam pll.m_initial = 1;
defparam pll.m_ph = 0;
defparam pll.n = 1;
defparam pll.n2 = 1;
defparam pll.operation_mode = "normal";
defparam pll.pll_type = "auto";
defparam pll.qualify_conf_done = "off";
defparam pll.self_reset_on_gated_loss_lock = "off";
defparam pll.sim_gate_lock_device_behavior = "off";
defparam pll.simulation_type = "timing";
defparam pll.spread_frequency = 0;
defparam pll.switch_over_counter = 1;
defparam pll.switch_over_on_gated_lock = "off";
defparam pll.switch_over_on_lossclk = "off";
defparam pll.switch_over_type = "manual";
defparam pll.valid_lock_multiplier = 1;

endmodule

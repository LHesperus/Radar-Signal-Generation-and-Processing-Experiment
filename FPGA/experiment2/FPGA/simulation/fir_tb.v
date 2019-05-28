module fir_tb();
reg clk_80;
reg  [11:0]address=0;
wire [12-1:0]echo_signal;

	reg		reset_n;
	reg	[11:0]	ast_sink_data;
	reg		ast_sink_valid;
	reg		ast_source_ready;
	reg	[1:0]	ast_sink_error;
	wire	[17:0]	ast_source_data;
	wire		ast_sink_ready;
	wire		ast_source_valid;
	wire	[1:0]	ast_source_error;


IF_LFM ECHO(
.address(address),
.clock(clk_80),
.q(echo_signal)
);


fir64 fir64_inst(
	.clk               (    clk_80             ),
	.reset_n           (   reset_n              ),
	.ast_sink_data     (echo_signal[7:0]                ),
	.ast_sink_valid    (   ast_sink_valid        ),
	.ast_source_ready  (1'b1             ),
	.ast_sink_error    (2'd0             ),
	.ast_source_data   (ast_source_data  ),
	.ast_sink_ready    (ast_sink_ready   ),
	.ast_source_valid  (ast_source_valid ),
	.ast_source_error  (ast_source_error )
	);


initial
begin
#0 clk_80=0;
#0 ast_sink_valid=0;
#0 address=0;
#0 reset_n=1;
#1000 reset_n=0;
#1000 reset_n=1;
#1000
ast_sink_valid=1;

end


always #6.25 clk_80=~clk_80;
always #12.5 address=address+1;
endmodule
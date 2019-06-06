`timescale 1 ns / 1 ps
module all_tb();
parameter width=12;
reg clk                  ;
reg [width-1:0]ad_out    ;
wire da_clk              ;
wire [width+1:0]dac_in   ;
wire sleep_dac           ;
wire ad_clk              ;
wire pwdn_adc            ;
wire  [width-1:0]ddc_I   ;
wire  [width-1:0]ddc_Q   ;
wire  [width-1:0]pc_I    ;
wire  [width-1:0]pc_Q    ;
wire  [6*width:0]pc_abs2 ;


Receiver Receiver_tb(
.clk               (clk               ),
.ad_out            (ad_out            ),
.da_clk            (da_clk            ),
.dac_in 			(dac_in ),
.sleep_dac         (sleep_dac         ),
.ad_clk            (ad_clk            ),
.pwdn_adc          (pwdn_adc          ),
.ddc_I             (ddc_I             ),
.ddc_Q             (ddc_Q             ),
.pc_I              (pc_I              ),
.pc_Q              (pc_Q              ),
.pc_abs2           (pc_abs2           )
);


initial

begin
#0 clk=0;
end




always #50   clk=~clk;

endmodule
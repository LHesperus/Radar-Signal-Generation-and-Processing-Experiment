`timescale 1 ns / 1 ps
module experiment_tb();

reg clk;
//reg ad_in;
wire da_clk         ;
wire ad_clk         ;
wire sleep_dac=0    ;
wire pwdn_dac=0     ;
wire [13:0]da_out;


experiment1 experiment1_inst(
. clk    (clk   ),
.ad_in  (da_out[11:0]),
.da_clk   (da_clk  ),
.ad_clk   (ad_clk  ),
.sleep_dac(sleep_da),
.pwdn_dac (pwdn_dac),
. da_out (da_out)
);

initial
begin
#0 clk=0;
end


always #50 clk=~clk; //10M
endmodule
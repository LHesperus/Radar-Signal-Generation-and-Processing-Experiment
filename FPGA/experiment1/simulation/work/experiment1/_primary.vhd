library verilog;
use verilog.vl_types.all;
entity experiment1 is
    port(
        clk             : in     vl_logic;
        ad_in           : in     vl_logic_vector(11 downto 0);
        da_clk          : out    vl_logic;
        ad_clk          : out    vl_logic;
        sleep_dac       : out    vl_logic;
        pwdn_dac        : out    vl_logic;
        da_out          : out    vl_logic_vector(13 downto 0)
    );
end experiment1;

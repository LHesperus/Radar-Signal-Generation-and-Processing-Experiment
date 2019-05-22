library verilog;
use verilog.vl_types.all;
entity sin_2048 is
    port(
        address         : in     vl_logic_vector(10 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(11 downto 0)
    );
end sin_2048;

library verilog;
use verilog.vl_types.all;
entity PC is
    generic(
        width           : integer := 12
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        signal_I        : in     vl_logic_vector;
        signal_Q        : in     vl_logic_vector;
        pc_I            : out    vl_logic_vector;
        pc_Q            : out    vl_logic_vector;
        pc_abs2         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end PC;

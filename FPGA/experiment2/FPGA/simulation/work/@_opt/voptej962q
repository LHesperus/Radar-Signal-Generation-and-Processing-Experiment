library verilog;
use verilog.vl_types.all;
entity DDC is
    generic(
        width           : integer := 12
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IF_Signal       : in     vl_logic_vector;
        BaseBand_I      : out    vl_logic_vector;
        BaseBand_Q      : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end DDC;

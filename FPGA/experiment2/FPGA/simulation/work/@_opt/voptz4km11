library verilog;
use verilog.vl_types.all;
entity MTI is
    generic(
        width           : integer := 12
    );
    port(
        clk             : in     vl_logic;
        signal_I        : in     vl_logic_vector;
        signal_Q        : in     vl_logic_vector;
        rec_flag        : in     vl_logic;
        MTI_I_out       : out    vl_logic_vector;
        MTI_Q_out       : out    vl_logic_vector;
        pulse_acc       : out    vl_logic_vector;
        start_flag      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end MTI;

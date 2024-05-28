library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for SISO_REGISTER
entity SISO_REGISTER is
    Port (
        input_signal : in std_logic;
        clock_signal : in std_logic;
        output_signal : out std_logic
    );
end SISO_REGISTER;

-- Architecture for SISO_REGISTER
architecture Structural of SISO_REGISTER is
    -- Component declaration for D_FLIP_FLOP
    component D_FLIP_FLOP is
        Port (
            Din : in std_logic;
            Qout : inout std_logic;
            CLKin : in std_logic
        );
    end component D_FLIP_FLOP;

    -- Declare your signals here
    signal inter_signal1, inter_signal2, inter_signal3, output_signal_internal : std_logic;
    signal not_output_signal1, not_output_signal2, not_output_signal3, not_output_signal4 : std_logic;
begin
    DFF1 : D_FLIP_FLOP
        port map (
            Din => input_signal,
            CLKin => clock_signal,
            Qout => inter_signal1
        );

    DFF2 : D_FLIP_FLOP
        port map (
            Din => inter_signal1,
            CLKin => clock_signal,
            Qout => inter_signal2
        );

    DFF3 : D_FLIP_FLOP
        port map (
            Din => inter_signal2,
            CLKin => clock_signal,
            Qout => inter_signal3
        );
	
    DFF4 : D_FLIP_FLOP
        port map (
            Din => inter_signal3,
            CLKin => clock_signal,
            Qout => output_signal_internal
        );
		  
		 output_signal<= output_signal_internal;
end Structural;


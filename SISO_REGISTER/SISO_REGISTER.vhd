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
architecture Behavioral of SISO_REGISTER is
    -- Component declaration for D_FLIP_FLOP
    component D_FLIP_FLOP is
        Port (
            I : in std_logic;
            CLK : in std_logic;
            Q : inout std_logic;
            Q_BAR : inout std_logic
        );
    end component D_FLIP_FLOP;

    -- Declare your signals here
    signal inter_signal1, inter_signal2, output_signal_internal : std_logic;
    signal not_output_signal1, not_output_signal2, not_output_signal3 : std_logic;
begin
    DFF1 : D_FLIP_FLOP
        port map (
            I => input_signal,
            CLK => clock_signal,
            Q => inter_signal1,
            Q_BAR => not_output_signal1
        );

    DFF2 : D_FLIP_FLOP
        port map (
            I => inter_signal1,
            CLK => clock_signal,
            Q => inter_signal2,
            Q_BAR => not_output_signal2
        );

    DFF3 : D_FLIP_FLOP
        port map (
            I => inter_signal2,
            CLK => clock_signal,
            Q => output_signal_internal,
            Q_BAR => not_output_signal3
        );
		  
		 output_signal<= output_signal_internal;
end Behavioral;


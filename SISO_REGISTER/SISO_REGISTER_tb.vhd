library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    -- Declare your signals here
    signal input_signal, clock_signal : std_logic := '0';
    signal output_signal : std_logic;

    -- Instantiate the Unit Under Test (UUT)
    component SISO_REGISTER is
        Port (
            input_signal : in std_logic;
            clock_signal : in std_logic;
            output_signal : out std_logic
        );
    end component SISO_REGISTER;

begin
    -- Instantiate UUT
    UUT: SISO_REGISTER
        port map (
            input_signal => input_signal,
            clock_signal => clock_signal,
            output_signal => output_signal
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- hold reset state for 100 ns.
        wait for 100 ns;  

        input_signal <= '1';  -- Set input
        wait for 10 ns;  -- Wait time
        clock_signal <= '1';  -- Clock pulse
        wait for 10 ns;
        clock_signal <= '0';
        wait for 10 ns;

        input_signal <= '0';  -- Set input
        wait for 10 ns;  -- Wait time
        clock_signal <= '1';  -- Clock pulse
        wait for 10 ns;
        clock_signal <= '0';
        wait for 10 ns;

        input_signal <= '1';  -- Set input
        wait for 10 ns;  -- Wait time
        clock_signal <= '1';  -- Clock pulse
        wait for 10 ns;
        clock_signal <= '0';

        wait;
    end process;
end Behavioral;

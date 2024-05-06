library IEEE;
use IEEE.std_logic_1164.all;

entity SR_LATCH_TB is
end SR_LATCH_TB;

architecture Behavioral of SR_LATCH_TB is
    signal S, R, Q, Q_Bar : std_logic := '0';

begin
    DUT: entity work.SR_LATCH
        port map (
            S => S,
            R => R,
            Q => Q,
            Q_Bar => Q_Bar
        );

    -- Testbench process
    process
    begin
        -- Test case 1: Reset the latch
        S <= '0'; R <= '1';
        wait for 10 ns;

        -- Test case 2: Set the latch
        S <= '1'; R <= '0';
        wait for 10 ns;

        -- Test case 3: Keep the latch state
        S <= '0'; R <= '0';
        wait for 10 ns;

        -- Test case 4: Undefined state
        S <= '1'; R <= '1';
        wait for 10 ns;

        -- End of test
        wait;
    end process;
end Behavioral;
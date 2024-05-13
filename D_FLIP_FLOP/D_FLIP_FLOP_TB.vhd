LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY D_FLIP_FLOP_TB IS
END D_FLIP_FLOP_TB;
 
ARCHITECTURE behavior OF D_FLIP_FLOP_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_FLIP_FLOP
    PORT(
         Din : IN  std_logic;
         CLKin : IN  std_logic;
         Qout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic := '0';
   signal CLKin : std_logic := '0';

	--BiDirs
   signal Qout : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_FLIP_FLOP PORT MAP (
          Din => Din,
          CLKin => CLKin,
			 Qout => Qout
        );

   -- Stimulus process
   stim_proc: process
   begin		
        wait for 100 ns; -- wait until global set/reset completes
        -- Test case 1: Reset the latch
        Din <= '0'; CLKin <= '0';
        wait for 10 ns;

        -- Test case 2: Should stay at 0
        Din <= '1'; CLKin <= '0';
        wait for 10 ns;

        -- Test case 3: Sould go from 0 to 1
        Din <= '1'; CLKin <= '1';
        wait for 10 ns;

			-- Test case 4: It should stay at 1
        Din <= '0'; CLKin <= '1';
        wait for 10 ns;
		  
		  	-- Test case 4: Should stay at 1
        Din <= '0'; CLKin <= '0';
		  wait for 10 ns;

		  -- Test case 4: Should switch to 0
        Din <= '0'; CLKin <= '1';
		
		  wait for 10 ns;
        -- End of test
        wait;
   end process;

END;

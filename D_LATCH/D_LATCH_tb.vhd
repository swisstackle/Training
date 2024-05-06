--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:14:32 05/06/2024
-- Design Name:   
-- Module Name:   /home/alain/Jacobs/Training/D-Flip-Flop/D_FLIP_FLOP_tb.vhd
-- Project Name:  D-Flip-Flop
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: D_FLIP_FLOP
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY D_LATCH_tb IS
END D_LATCH_tb;
 
ARCHITECTURE behavior OF D_LATCH_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_LATCH
    PORT(
         I : IN  std_logic;
         CLK : IN  std_logic;
         Q : INOUT  std_logic;
         Q_BAR : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I : std_logic := '0';
   signal CLK : std_logic := '0';

	--BiDirs
   signal Q : std_logic;
   signal Q_BAR : std_logic;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_LATCH PORT MAP (
          I => I,
          CLK => CLK,
          Q => Q,
          Q_BAR => Q_BAR
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
        wait for 100 ns; -- wait until global set/reset completes
        -- Test case 1: Reset the latch
        I <= '0'; CLK <= '0';
        wait for 10 ns;

        -- Test case 2: Set the latch
        I <= '1'; CLK <= '0';
        wait for 10 ns;

        -- Test case 3: Keep the latch state
        I <= '1'; CLK <= '1';
        wait for 10 ns;

			-- Test case 4: Keep the latch state
        I <= '0'; CLK <= '0';
        wait for 10 ns;
		  
		  	-- Test case 4: Keep the latch state
        I <= '0'; CLK <= '1';
        wait for 10 ns;
		  
		  -- Test case 4: Keep the latch state
        I <= '0'; CLK <= '0';
        wait for 10 ns;
		  
		
		  wait for 10 ns;
        -- End of test
        wait;
   end process;

END;

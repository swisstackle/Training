-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT G_SR_LATCH
          PORT(
                  S : IN std_logic;
                  R: IN std_logic;       
                  CLK : IN std_logic;
						Q : INOUT std_logic;
						Q_BAR :INOUT std_logic
                  );
          END COMPONENT;

          SIGNAL S :  std_logic := '0';
          SIGNAL R :  std_logic := '0';
			 SIGNAL CLK : std_logic := '0';
          SIGNAL Q :  std_logic := '0';
			 SIGNAL Q_BAR : std_logic := '0'; 			 

  BEGIN

  -- Component Instantiation
          uut: G_SR_LATCH PORT MAP(
                  S => S,
                  R => R,
						CLK => CLK,
						Q => Q,
						Q_BAR => Q_BAR
          ); 


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
			
        wait for 100 ns; -- wait until global set/reset completes
        -- Test case 1: Reset the latch
        S <= '0'; R <= '1'; CLK <= '0';
        wait for 10 ns;

        -- Test case 2: Set the latch
        S <= '1'; R <= '0'; CLK <= '0';
        wait for 10 ns;

        -- Test case 3: Keep the latch state
        S <= '0'; R <= '0'; CLK <= '0';
        wait for 10 ns;

			-- Test case 4: Keep the latch state
        S <= '0'; R <= '1'; CLK <= '1';
        wait for 10 ns;
		  
		  	-- Test case 4: Keep the latch state
        S <= '1'; R <= '0'; CLK <= '1';
        wait for 10 ns;
		  
		  -- Test case 4: Keep the latch state
        S <= '0'; R <= '0'; CLK <= '1';
        wait for 10 ns;
		  
		  -- Resetting
		  S <= '0'; R <= '1'; CLK <= '1';
		
		  wait for 10 ns;
        -- End of test
        wait;

     END PROCESS tb;
  --  End Test Bench 

  END;

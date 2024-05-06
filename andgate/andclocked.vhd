----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:09:26 04/16/2024 
-- Design Name: 
-- Module Name:    andclocked - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;


--entity AND_GATE is
--    Port (
--        A : in std_logic;
--        B : in std_logic;
--        Y : out std_logic
--    );
--end AND_GATE;

--architecture Behavioral of AND_GATE is
--begin
--    Y <= A and B; -- AND operation
--end Behavioral;

-- Entity declaration for D flip-flop
entity D_FLIP_FLOP is
    Port (
        D : in std_logic;
        CLK : in std_logic;
        Q : out std_logic;
        Q_bar : out std_logic
    );
end D_FLIP_FLOP;
			

-- Architecture body for D flip-flop
architecture Behavioral of D_FLIP_FLOP is
begin
    -- Invert CLK
    CLK_bar <= not CLK;

    -- Set and Reset signals
    S <= (D and CLK) or (Q_bar and CLK_bar);
    R <= ((not D) and CLK) or (Q and CLK_bar);

    -- SR latch
   Q <= not (S and Q_bar);
   Q_bar <= not (R and Q);
end Behavioral;

-- Entity declaration for clocked AND gate
--entity ClockedAndGate is
--    Port (
--        A : in std_logic;
--        B : in std_logic;
--        CLK : in std_logic;
--        Y : out std_logic
--    );
--end ClockedAndGate;

-- Architecture body for clocked AND gate
--architecture Structural of ClockedAndGate is
    -- Internal signal declaration
 --   signal and_output : std_logic;

    -- Component declaration for AND gate
 --   component AND_GATE is
--        Port (
--            A : in std_logic;
--            B : in std_logic;
--            Y : out std_logic
--        );
 --   end component;

    -- Component declaration for D flip-flop
 --   component D_FLIP_FLOP is
--        Port (
--            D : in std_logic;
 --           CLK : in std_logic;
--            Q : out std_logic;
 --           Q_bar : out std_logic
 --       );
 --   end component;

--begin

    -- AND gate instantiation
 --   U1: AND_GATE port map (
 --       A => A,
 --       B => B,
 --       Y => and_output
 --   );

    -- D flip-flop instantiation
 --   U2: D_FLIP_FLOP port map (
 --       D => and_output,
 --       CLK => CLK,
 --       Q => Y,
 --       Q_bar => open  -- We don't need Q_bar in this design, so we leave it unconnected
 --   );

--end Structural;

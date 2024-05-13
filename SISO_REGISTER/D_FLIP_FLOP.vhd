library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for a D-Flip-Flop
entity D_FLIP_FLOP is
    Port (
		  I : in std_logic;
        CLK : in std_logic;
        Q : inout std_logic;
		  Q_BAR : inout std_logic
    );
end D_FLIP_FLOP;
			

-- Architecture body for a gated sr latch
architecture Behavioral of D_FLIP_FLOP is
	   signal and_gate1_output : std_logic;
		signal and_gate2_output : std_logic;
		signal S : std_logic;
		signal R : std_logic;
begin
S <= I;
R <= NOT I;
and_gate1_output <= CLK and S;
and_gate2_output <= CLK and R;

Q <= and_gate2_output nor Q_BAR;
Q_BAR <= and_gate1_output nor Q;

end Behavioral;



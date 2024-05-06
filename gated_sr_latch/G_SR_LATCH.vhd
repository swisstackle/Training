library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity declaration for a gated sr latch
entity G_SR_LATCH is
    Port (
        R : in std_logic;
        CLK : in std_logic;
        S : in std_logic;
        Q : inout std_logic;
		  Q_BAR : inout std_logic
    );
end G_SR_LATCH;
			

-- Architecture body for a gated sr latch
architecture Behavioral of G_SR_LATCH is
	   signal and_gate1_output : std_logic;
		signal and_gate2_output : std_logic;
begin
and_gate1_output <= CLK and S;
and_gate2_output <= CLK and R;

Q <= and_gate2_output nor Q_BAR;
Q_BAr <= and_gate1_output nor Q;

end Behavioral;
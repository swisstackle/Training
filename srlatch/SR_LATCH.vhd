----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:08 04/23/2024 
-- Design Name: 
-- Module Name:    SR_LATCH - Behavioral 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SR_LATCH is 
		Port (
			S : in std_logic;
			R : in std_logic;
			Q : inout std_logic;
			Q_Bar : inout std_logic
			);
end SR_LATCH;

architecture Behavioral of SR_LATCH is 
	begin
		Q_Bar <= (Q nor S);
		Q <= (Q_Bar nor R);
	end Behavioral;


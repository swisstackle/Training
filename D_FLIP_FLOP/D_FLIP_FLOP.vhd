----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:44 05/06/2024 
-- Design Name: 
-- Module Name:    D_FLIP_FLOP - Behavioral 
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

entity D_FLIP_FLOP is
	Port(
		Din: in std_logic;
		Qout : out std_logic;
		CLKin: in std_logic
	);
end D_FLIP_FLOP;

architecture Behavioral of D_FLIP_FLOP is

    component D_LATCH is
    Port (
		  I : in std_logic;
        CLK : in std_logic;
        Q : inout std_logic;
		  Q_BAR : inout std_logic
    );
    end component D_LATCH;

    -- Declare your signals here
    signal inter_signal1, output_signal_internal : std_logic;
    signal not_output_signal1, not_output_signal2 : std_logic;
begin
    DL1 : D_LATCH
        port map (
            I => Din,
            CLK => not(CLKin),
            Q => inter_signal1,
            Q_BAR => not_output_signal1
        );

    DL2 : D_LATCH
        port map (
            I => inter_signal1,
            CLK => CLKin,
            Q => output_signal_internal,
            Q_BAR => not_output_signal2
        );
		  
		 Qout <= output_signal_internal;
end Behavioral;


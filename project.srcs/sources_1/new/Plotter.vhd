--------------------------------------------
-- Module Name: plotter
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity B Is
port(
		v 		: in STD_LOGIC_VECTOR (3 downto 0);
		z 		: out STD_LOGIC;
		an 		: out STD_LOGIC_VECTOR (7 downto 0);
		seg0	: out STD_LOGIC_VECTOR (6 downto 0)
	);
end B;

Architecture Behavioral of B Is
	Component bcdto7segment
	port (
		x 	: in STD_LOGIC_VECTOR(3 downto 0);
		an 	: out STD_LOGIC_VECTOR(7 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
		);	
	End Component;

	Component lab2_2_1_partA
	port (
		v 		: in STD_LOGIC_VECTOR(3 downto 0);
		z 		: out STD_LOGIC;
		m_out 	: out STD_LOGIC_VECTOR(3 downto 0)
		);	
	End Component;
	
	Signal m_int : STD_LOGIC_VECTOR (3 downto 0);
		
begin	
	U1:  lab2_2_1_partA PORT MAP (
			v => v,
			z => z,
			m_out => m_int
		 );		
		 
	U2:  bcdto7segment PORT MAP (
			x => m_int,
			an => an,
			seg => seg0
		 );	
		 
end Behavioral;
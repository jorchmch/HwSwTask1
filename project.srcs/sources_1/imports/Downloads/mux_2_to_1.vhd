--------------------------------------------
-- Module Name: mux_2_to_1
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity mux_2_to_1 Is
port (
		x : in STD_LOGIC;
		y : in STD_LOGIC;
		s : in STD_LOGIC;
		m : out STD_LOGIC
	);
end mux_2_to_1;

Architecture behavior of mux_2_to_1 Is

	Signal m_int : STD_LOGIC;

begin
     
	m <= m_int;
	
	with s select
        m_int <= x when '0',
                 y when others;
	


end behavior;
--------------------------------------------
-- Module Name: display
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity bcdto7segment Is
port(
		x 	: in STD_LOGIC_VECTOR(3 downto 0);
		an 	: out STD_LOGIC_VECTOR(7 downto 0);
		seg : out STD_LOGIC_VECTOR(6 downto 0)
	);
end bcdto7segment;

Architecture Behavioral of bcdto7segment Is	
	
begin
    an(7) <= '1';
    an(6) <= '1';
    an(5) <= '1';
    an(4) <= '1';
    an(3) <= '1';
    an(2) <= '1';
    an(1) <= '1';
    an(0) <= '0';
    		 
	seg(0) <= (x(2) and not(x(1)) and not(x(0))) or (not(x(3)) and not(x(2)) and not(x(1)) and x(0));
	seg(1) <= (x(2) and not(x(1)) and x(0)) or (x(2) and x(1) and not(x(0)));
	seg(2) <= (not(x(2)) and x(1) and not(x(0)));
	seg(3) <= (x(2) and not(x(1)) and not(x(0))) or (x(2) and x(1) and x(0)) or (not(x(3)) and not(x(2)) and not(x(1)) and x(0));
	seg(4) <= x(0) or (x(2) and not(x(1)));
	seg(5) <= (not(x(3)) and not(x(2)) and x(0)) or (x(1) and x(0)) or (not(x(3)) and not(x(2)) and x(1));
	seg(6) <= (not(x(3)) and not(x(2)) and not(x(1))) or (x(2) and x(1) and x(0));
	
end Behavioral;
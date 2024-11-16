--------------------------------------------
-- Module Name: fulladder
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity fulladder Is
port(
		a  	 : in STD_LOGIC;
		b  	 : in STD_LOGIC;
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC;
		cout : out STD_LOGIC
	);
end fulladder;

Architecture Behavioral of fulladder Is

begin

        s <= a xor b xor cin;
        cout <= (a and b) or (a and cin) or (b and cin);
	
end Behavioral;
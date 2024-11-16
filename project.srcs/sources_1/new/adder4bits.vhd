--------------------------------------------
-- Module Name: adder
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--library UNISIM;
--use UNISIM.VComponents.all;

Entity adder Is
port(
		a  	 : in STD_LOGIC_VECTOR (3 downto 0);
		b  	 : in STD_LOGIC_VECTOR (3 downto 0);
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC_VECTOR (3 downto 0);
		cout : out STD_LOGIC
	);
end adder;

Architecture Behavioral of adder Is
	Component fulladder
	port (
		a  	 : in STD_LOGIC;
		b  	 : in STD_LOGIC;
		cin  : in STD_LOGIC;
		s 	 : out STD_LOGIC;
		cout : out STD_LOGIC
	);	
	End Component;

signal cout_i : STD_LOGIC_VECTOR (3 downto 0);

begin
	F0:  fulladder PORT MAP (
			a => a(0),
			b => b(0),
			cin => cin,
			s => s(0),
			cout => cout_i(0)
		 );		

	F1:  fulladder PORT MAP (
			a => a(1),
			b => b(1),
			cin => cout_i(0),
			s => s(1),
			cout => cout_i(1)
		 );
	             
	F2:  fulladder PORT MAP (
			a => a(2),
			b => b(2),
			cin => cout_i(1),
			s => s(2),
			cout => cout_i(2)
		 );
 
	F3:  fulladder PORT MAP (
			a => a(3),
			b => b(3),
			cin => cout_i(2),
			s => s(3),
			cout => cout_i(3)
		 );	
	 
		cout <= cout_i(3);
	


end Behavioral;
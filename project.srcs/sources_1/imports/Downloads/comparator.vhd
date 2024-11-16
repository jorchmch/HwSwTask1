--------------------------------------------
-- Module Name: comparator_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity comparator Is
port (
		v : in STD_LOGIC_VECTOR(3 downto 0);
		z : out STD_LOGIC
	);
end comparator;

Architecture behavior of comparator Is

Signal v_int : STD_LOGIC_VECTOR(3 downto 0);
Signal z_int : STD_LOGIC;

begin

v_int <= v;
z <= z_int;

z_int <= '1' when (v_int > x"9") else '0';


end behavior;
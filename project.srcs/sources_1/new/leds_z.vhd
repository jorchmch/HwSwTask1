library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity leds_z is
    Port ( 
        zneg : in STD_LOGIC;
        z : in STD_LOGIC;
        zneg_out : out STD_LOGIC;
        z_out : out STD_LOGIC
    );
end leds_z;

architecture Behavioral of leds_z is
begin
    -- Para zneg_out:
    -- Sale 1 solo cuando zneg=1 y z=0
    zneg_out <= zneg and (not z);
    
    -- Para z_out:
    -- Sale 1 solo cuando zneg=0 y z=1
    z_out <= (not zneg) and z;
    
end Behavioral;
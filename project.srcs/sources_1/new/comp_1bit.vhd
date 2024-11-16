-- Primer archivo: comp_1bit.vhd (Comparador de 1 bit)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_1bit is
    Port ( 
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        I : out STD_LOGIC;  -- Flag de Igualdad
        T : out STD_LOGIC;  -- Flag de A menor que B
        H : out STD_LOGIC   -- Flag de A mayor que B
    );
end comp_1bit;

architecture Behavioral of comp_1bit is
begin
    -- Lógica booleana para comparación de 1 bit
    I <= not(a xor b);           -- Igualdad: A = B
    T <= (not a) and b;           -- A < B
    H <= a and (not b);           -- A > B
end Behavioral;
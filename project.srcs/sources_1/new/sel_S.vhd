library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sel_S is
    Port ( 
        S : in STD_LOGIC_VECTOR(3 downto 0);
        S_inv : in STD_LOGIC_VECTOR(3 downto 0);
        sel : in STD_LOGIC;
        S_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end sel_S;

architecture Behavioral of sel_S is
begin
    -- Multiplexor usando lógica booleana para cada bit
    S_out(0) <= (S(0) and not sel) or (S_inv(0) and sel);
    S_out(1) <= (S(1) and not sel) or (S_inv(1) and sel);
    S_out(2) <= (S(2) and not sel) or (S_inv(2) and sel);
    S_out(3) <= (S(3) and not sel) or (S_inv(3) and sel);
end Behavioral;

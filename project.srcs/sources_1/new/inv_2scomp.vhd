library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv_2scomp is
    Port ( 
        S : in STD_LOGIC_VECTOR(3 downto 0);
        S_inv : out STD_LOGIC_VECTOR(3 downto 0)
    );
end inv_2scomp;

architecture Behavioral of inv_2scomp is
    signal complemento : STD_LOGIC_VECTOR(3 downto 0);
    signal carry : STD_LOGIC_VECTOR(4 downto 0);
begin
    -- Primer paso: Invertir todos los bits
    complemento <= not S;
    
    -- Segundo paso: Sumar 1 usando lógica booleana
    carry(0) <= '1';  -- Bit inicial para sumar 1
    
    -- Generación de carrys
    carry(1) <= complemento(0) and carry(0);
    carry(2) <= complemento(1) and carry(1);
    carry(3) <= complemento(2) and carry(2);
    carry(4) <= complemento(3) and carry(3);
    
    -- Cálculo final de cada bit
    S_inv(0) <= complemento(0) xor carry(0);
    S_inv(1) <= complemento(1) xor carry(1);
    S_inv(2) <= complemento(2) xor carry(2);
    S_inv(3) <= complemento(3) xor carry(3);
end Behavioral;

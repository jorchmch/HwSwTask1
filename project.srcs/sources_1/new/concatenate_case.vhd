library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity concatenate_case is
    Port ( 
        S    : in  STD_LOGIC_VECTOR(3 downto 0);  -- Entrada de 4 bits
        Cout : in  STD_LOGIC;                     -- Entrada de 1 bit
        S_out: out STD_LOGIC_VECTOR(3 downto 0)   -- Salida de 4 bits
    );
end concatenate_case;

architecture Behavioral of concatenate_case is
begin
    process(S, Cout)
    begin
        -- Evaluamos directamente los valores de entrada
        if (Cout = '1' and S = "0000") then       -- Caso 16
            S_out <= "0110";  -- 6 en binario
        elsif (Cout = '1' and S = "0001") then    -- Caso 17
            S_out <= "0111";  -- 7 en binario
        elsif (Cout = '1' and S = "0010") then    -- Caso 18
            S_out <= "1000";  -- 8 en binario
        elsif (Cout = '1' and S = "0011") then    -- Caso 19
            S_out <= "1001";  -- 8 en binario
        else
            S_out <= (others => '0');
        end if;
    end process;
end Behavioral;
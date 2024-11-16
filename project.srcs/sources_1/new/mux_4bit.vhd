library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Part 2: Multiplexer component
entity mux_4bit is
    Port (
        S1  : in  STD_LOGIC_VECTOR(3 downto 0);  -- First 4-bit input
        S2  : in  STD_LOGIC_VECTOR(3 downto 0);  -- Second 4-bit input
        SEL : in  STD_LOGIC;                     -- Selection bit
        S_out : out STD_LOGIC_VECTOR(3 downto 0) -- Output
    );
end mux_4bit;

architecture Behavioral of mux_4bit is
begin
    S_out <= S1 when SEL = '0' else S2;
end Behavioral;

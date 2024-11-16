library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arrag_4bit is
    Port ( 
        A  : in  STD_LOGIC_VECTOR(3 downto 0); -- Input A (4 bits)
        B  : in  STD_LOGIC_VECTOR(3 downto 0); -- Input B (4 bits)
        LT : in  STD_LOGIC;                    -- LOWER-Than Flag (1 bit)
        A_out : out STD_LOGIC_VECTOR(3 downto 0); -- Output A'
        B_out : out STD_LOGIC_VECTOR(3 downto 0)  -- Output B'
    );
end arrag_4bit;

architecture Behavioral of arrag_4bit is
begin
    -- Boolean logic for outputs based on LT input
    A_out(0) <= (A(0) and not LT) or (B(0) and LT);
    A_out(1) <= (A(1) and not LT) or (B(1) and LT);
    A_out(2) <= (A(2) and not LT) or (B(2) and LT);
    A_out(3) <= (A(3) and not LT) or (B(3) and LT);

    B_out(0) <= (B(0) and not LT) or (A(0) and LT);
    B_out(1) <= (B(1) and not LT) or (A(1) and LT);
    B_out(2) <= (B(2) and not LT) or (A(2) and LT);
    B_out(3) <= (B(3) and not LT) or (A(3) and LT);
end Behavioral;

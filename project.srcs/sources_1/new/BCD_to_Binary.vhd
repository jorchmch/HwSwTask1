library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bcd_conv is
    Port ( 
        din : in STD_LOGIC_VECTOR(3 downto 0);
        dout : out STD_LOGIC_VECTOR(3 downto 0);
        v : out STD_LOGIC
    );
end bcd_conv;

architecture Behavioral of bcd_conv is
    component comp_4bit is
        Port ( 
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            EQ : out STD_LOGIC;
            LT : out STD_LOGIC;
            GT : out STD_LOGIC
        );
    end component;
    
    signal le9: STD_LOGIC;
    signal c9: STD_LOGIC_VECTOR(3 downto 0) := "1001";
    signal eq, lt, gt: STD_LOGIC;
    signal res: STD_LOGIC_VECTOR(3 downto 0);
    
begin
    comp: comp_4bit 
    port map(
        A => din,
        B => c9,
        EQ => eq,
        LT => lt,
        GT => gt
    );
    
    le9 <= lt or eq;
    
    res(0) <= din(0) and le9;
    res(1) <= din(1) and le9;
    res(2) <= din(2) and le9;
    res(3) <= din(3) and le9;
    
    dout <= res;
    v <= gt; -- Ahora v será '1' solo cuando el número sea mayor a 9
    
end Behavioral;
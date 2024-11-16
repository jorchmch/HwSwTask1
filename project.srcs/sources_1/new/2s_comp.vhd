library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twos_comp is
    Port ( 
        num : in STD_LOGIC_VECTOR(3 downto 0);
        num_2s : out STD_LOGIC_VECTOR(3 downto 0)
    );
end twos_comp;

architecture Behavioral of twos_comp is
    -- Component declaration for the full adder
    component adder
        Port ( 
            a : in STD_LOGIC_VECTOR(3 downto 0);
            b : in STD_LOGIC_VECTOR(3 downto 0);
            cin : in STD_LOGIC;
            s : out STD_LOGIC_VECTOR(3 downto 0);
            cout : out STD_LOGIC
        );
    end component;
    
    -- Intermediate signals
    signal num_negated : STD_LOGIC_VECTOR(3 downto 0);
    signal constant_one : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    signal adder_cout : STD_LOGIC;
    
begin
    -- First step: Negate all bits
    num_negated <= not num;
    
    -- Second step: Add 1 using the full adder
    full_adder: adder port map(
        a => num_negated,
        b => constant_one,
        cin => '0',
        s => num_2s,
        cout => adder_cout
    );
    
end Behavioral;
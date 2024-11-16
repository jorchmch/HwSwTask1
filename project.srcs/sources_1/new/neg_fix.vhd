library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity neg_fix is
    Port ( 
        S : in STD_LOGIC_VECTOR(3 downto 0);
        N : in STD_LOGIC;
        m : out STD_LOGIC_VECTOR(3 downto 0)
    );
end neg_fix;

architecture Behavioral of neg_fix is
    -- Component declaration for twos_comp
    component twos_comp
        Port ( 
            num : in STD_LOGIC_VECTOR(3 downto 0);
            num_2s : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    -- Intermediate signals
    signal s_prime : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    -- Instance of twos_comp component
    twos_conv: twos_comp port map(
        num => S,
        num_2s => s_prime
    );
    
    -- Multiplexor using boolean logic for each bit
    -- If N = 1, output s_prime
    -- If N = 0, output S
    m(0) <= (s_prime(0) and N) or (S(0) and not N);
    m(1) <= (s_prime(1) and N) or (S(1) and not N);
    m(2) <= (s_prime(2) and N) or (S(2) and not N);
    m(3) <= (s_prime(3) and N) or (S(3) and not N);
    
end Behavioral;
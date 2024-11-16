library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fix5bit is
    Port (
        S      : in  STD_LOGIC_VECTOR(3 downto 0);  -- Input 4 bits
        Cout   : in  STD_LOGIC;                     -- Input 1 bit
        S_out  : out STD_LOGIC_VECTOR(3 downto 0);  -- Output 4 bits
        LedDec : out STD_LOGIC                      -- Output 1 bit
    );
end fix5bit;

architecture Behavioral of fix5bit is
    -- Signal declarations
    signal concatenate_out : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_out : STD_LOGIC_VECTOR(3 downto 0);
    
    -- Component declarations
    component concatenate_case is
        Port (
            S     : in  STD_LOGIC_VECTOR(3 downto 0);
            Cout  : in  STD_LOGIC;
            S_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    component mux_4bit is
        Port (
            S1    : in  STD_LOGIC_VECTOR(3 downto 0);
            S2    : in  STD_LOGIC_VECTOR(3 downto 0);
            SEL   : in  STD_LOGIC;
            S_out : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
begin
    -- Instantiate concatenate_case component
    U1_CONCAT: concatenate_case
        port map (
            S     => S,
            Cout  => Cout,
            S_out => concatenate_out
        );
    
    -- Instantiate multiplexer component
    U2_MUX: mux_4bit
        port map (
            S1    => S,              -- Original input S
            S2    => concatenate_out, -- Output from concatenate_case
            SEL   => Cout,           -- Selection controlled by Cout
            S_out => mux_out         -- Final output
        );
    
    -- Connect outputs
    S_out <= mux_out;
    LedDec <= Cout;
    
end Behavioral;
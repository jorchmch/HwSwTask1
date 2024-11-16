library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fix_component is
port(
    result    : in  STD_LOGIC_VECTOR(3 downto 0);
    carry : in  STD_LOGIC;
    neg_flag    : in  STD_LOGIC;
    value    : out STD_LOGIC_VECTOR(3 downto 0);
    z    : out STD_LOGIC
);


end fix_component;

architecture Behavioral of fix_component is
    -- Component declarations
    component fix5bit is
    Port (
        S      : in  STD_LOGIC_VECTOR(3 downto 0);
        Cout   : in  STD_LOGIC;
        S_out  : out STD_LOGIC_VECTOR(3 downto 0);
        LedDec : out STD_LOGIC
    );
    end component;
    
    component neg_fix is
    port(
        S   : in  STD_LOGIC_VECTOR(3 downto 0);
        N   : in  STD_LOGIC;
        m   : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    -- Intermediate signal
    signal s_out_signal : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instantiate fix5bit component
    FIX5: fix5bit port map(
        S      => result,
        Cout   => carry,
        S_out  => s_out_signal,
        LedDec => z
    );

    -- Instantiate neg_fix component
    NEG: neg_fix port map(
        S => s_out_signal,
        N => neg_flag,
        m => value
    );

end Behavioral;
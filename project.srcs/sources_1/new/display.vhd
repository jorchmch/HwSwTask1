library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display is
port(
    value    : in  STD_LOGIC_VECTOR(3 downto 0);
    z_ten : in  STD_LOGIC;
    anode    : out STD_LOGIC_VECTOR(7 downto 0);
    segment  : out STD_LOGIC_VECTOR(6 downto 0);
    z     : out STD_LOGIC
);
end display;

architecture Behavioral of display is
    -- Component declarations
    component predisplay is
    port(
        v     : in STD_LOGIC_VECTOR(3 downto 0);
        z     : out STD_LOGIC;
        m_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    component bcdto7segment is
    port(
        x   : in STD_LOGIC_VECTOR(3 downto 0);
        an  : out STD_LOGIC_VECTOR(7 downto 0);
        seg : out STD_LOGIC_VECTOR(6 downto 0)
    );
    end component;

    -- Intermediate signals
    signal m_out_signal : STD_LOGIC_VECTOR(3 downto 0);
    signal z_pred      : STD_LOGIC;  -- New signal for z output from predisplay
begin
    -- Instantiation of predisplay component
    PRED: predisplay port map(
        v     => value,
        z     => z_pred,     -- Connect to intermediate signal
        m_out => m_out_signal
    );

    -- Instantiation of bcdto7segment component
    BCD7: bcdto7segment port map(
        x   => m_out_signal,
        an  => anode,
        seg => segment
    );

    -- OR gate implementation
    z <= z_pred OR z_ten;

end Behavioral;
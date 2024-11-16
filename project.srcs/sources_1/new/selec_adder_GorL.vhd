library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_subs is
    Port ( 
        op_a : in STD_LOGIC_VECTOR(3 downto 0);
        op_b : in STD_LOGIC_VECTOR(3 downto 0);
        carry_in   : in  STD_LOGIC;
        mode : in STD_LOGIC;
        result : out STD_LOGIC_VECTOR(3 downto 0);
        neg_flag : out STD_LOGIC;
        carry : out STD_LOGIC
    );
end adder_subs;


architecture Behavioral of adder_subs is
    -- Component declarations
    component selection
        Port ( 
            B : in STD_LOGIC_VECTOR(3 downto 0);
            SEL : in STD_LOGIC;
            Bout : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    
    component Neg_det
        Port ( 
            A : in STD_LOGIC_VECTOR(3 downto 0);
            B : in STD_LOGIC_VECTOR(3 downto 0);
            SEL : in STD_LOGIC;
            N : out STD_LOGIC
        );
    end component;
    
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
    signal Bout_signal : STD_LOGIC_VECTOR(3 downto 0);
    signal adder_cout : STD_LOGIC;
    
begin
    -- Instantiate selection component
    sel_comp: selection port map(
        B => op_b,
        SEL => mode,
        Bout => Bout_signal
    );
    
    -- Instantiate Neg_det component
    neg_comp: Neg_det port map(
        A => op_a,
        B => op_b,
        SEL => mode,
        N => neg_flag
    );
    
    -- Instantiate adder component
    add_comp: adder port map(
        a => op_a,
        b => Bout_signal,
        cin => carry_in,
        s => result,
        cout => carry
    );
    
end Behavioral;